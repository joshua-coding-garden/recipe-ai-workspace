"""Extract figures and tables from 65 PDFs — text-driven + three-path extraction.

Usage:
    cd /home/aiiauser/JM/0325new/graph
    .venv/bin/python src/_extract_figures.py
"""
import _paths
import json
import re
import io
from pathlib import Path
from collections import defaultdict

import pypdf
from PIL import Image

try:
    import pypdfium2 as pdfium
    HAS_PDFIUM = True
except ImportError:
    HAS_PDFIUM = False
    print("WARNING: pypdfium2 not available, skipping page renders")

try:
    import pdfplumber
    HAS_PDFPLUMBER = True
except ImportError:
    HAS_PDFPLUMBER = False
    print("WARNING: pdfplumber not available, skipping table extraction")

DATA_DIR = _paths.DATA_DIR
PDF_DIR = _paths.CORPUS_PDF_DIR
FIGURES_DIR = DATA_DIR / "figures"
CHUNKS_FILE = DATA_DIR / "chunks.jsonl"

CAPTION_DEF_RE = re.compile(
    r"(Fig(?:ure|\.)?|Table|Scheme|Chart)\s*\.?\s*(\d+[A-Za-z]?)\s*[.:\-–—]\s*(.+)",
    re.IGNORECASE,
)

CAPTION_REF_RE = re.compile(
    r"(?:Fig(?:ure|\.)?|Table|Scheme|Chart)\s*\.?\s*(\d+[A-Za-z]?)",
    re.IGNORECASE,
)

MIN_IMG_W = 150
MIN_IMG_H = 100
MIN_IMG_AREA = 40_000


def load_paper_metadata():
    with open(DATA_DIR / "paper_metadata.json") as f:
        return json.load(f)


def build_filename_to_docid(pm):
    return {meta["filename"]: doc_id for doc_id, meta in pm.items()}


def find_captions_in_text(text):
    """Find all Figure/Table caption definitions in text, return list of dicts."""
    captions = []
    lines = text.split("\n")
    for i, line in enumerate(lines):
        m = CAPTION_DEF_RE.match(line.strip())
        if not m:
            continue
        fig_type = m.group(1)
        if fig_type.lower().startswith("fig"):
            fig_type = "Figure"
        elif fig_type.lower().startswith("tab"):
            fig_type = "Table"
        else:
            fig_type = fig_type.capitalize()

        number = m.group(2)
        caption_lines = [line.strip()]
        for j in range(i + 1, min(i + 5, len(lines))):
            next_line = lines[j].strip()
            if not next_line or CAPTION_DEF_RE.match(next_line):
                break
            caption_lines.append(next_line)

        captions.append({
            "type": fig_type,
            "number": number,
            "caption": " ".join(caption_lines),
            "line_idx": i,
        })
    return captions


def find_refs_in_text(text):
    """Find all Figure/Table references in text, return list of (type, number)."""
    refs = []
    for m in CAPTION_REF_RE.finditer(text):
        prefix = m.group(0).split()[0].lower()
        if prefix.startswith("fig"):
            refs.append(("Figure", m.group(1)))
        elif prefix.startswith("tab"):
            refs.append(("Table", m.group(1)))
        else:
            refs.append((prefix.capitalize(), m.group(1)))
    return refs


def find_caption_page(reader, fig_type, number):
    """Find which page a caption definition appears on."""
    pattern = re.compile(
        rf"{re.escape(fig_type[:3])}(?:ure|le|\.?)?\s*\.?\s*{re.escape(number)}\s*[.:\-–—]",
        re.IGNORECASE,
    )
    for i, page in enumerate(reader.pages):
        text = page.extract_text() or ""
        if pattern.search(text):
            return i + 1
    return None


def decode_xobject_image(xobj):
    """Decode a PDF XObject image into a PIL Image."""
    width = int(xobj["/Width"])
    height = int(xobj["/Height"])
    if width < MIN_IMG_W or height < MIN_IMG_H:
        return None
    if width * height < MIN_IMG_AREA:
        return None

    try:
        data = xobj.get_data()
    except Exception:
        return None

    filter_type = xobj.get("/Filter")
    if isinstance(filter_type, pypdf.generic.ArrayObject):
        filter_type = str(filter_type[-1]) if filter_type else None
    else:
        filter_type = str(filter_type) if filter_type else None

    color_space = xobj.get("/ColorSpace")
    if hasattr(color_space, "get_object"):
        color_space = color_space.get_object()
    if isinstance(color_space, pypdf.generic.ArrayObject):
        color_space = str(color_space[0])
    else:
        color_space = str(color_space) if color_space else None

    try:
        if filter_type == "/DCTDecode":
            return Image.open(io.BytesIO(data))
        elif filter_type == "/JPXDecode":
            return Image.open(io.BytesIO(data))
        elif filter_type in ("/FlateDecode", None):
            if color_space in ("/DeviceRGB", "/ICCBased"):
                expected = width * height * 3
                if len(data) >= expected:
                    return Image.frombytes("RGB", (width, height), data[:expected])
            elif color_space == "/DeviceCMYK":
                expected = width * height * 4
                if len(data) >= expected:
                    img = Image.frombytes("CMYK", (width, height), data[:expected])
                    return img.convert("RGB")
            elif color_space == "/DeviceGray":
                expected = width * height
                if len(data) >= expected:
                    return Image.frombytes("L", (width, height), data[:expected])
            else:
                if len(data) >= width * height * 3:
                    return Image.frombytes("RGB", (width, height), data[:width * height * 3])
                elif len(data) >= width * height:
                    return Image.frombytes("L", (width, height), data[:width * height])
    except Exception:
        pass
    return None


def extract_xobject_images(reader, page_num):
    """Extract all significant images from a PDF page's XObjects."""
    page = reader.pages[page_num - 1]
    images = []
    try:
        resources = page.get("/Resources")
        if not resources:
            return images
        xobjects = resources.get("/XObject")
        if not xobjects:
            return images
        xobjects = xobjects.get_object() if hasattr(xobjects, "get_object") else xobjects
    except Exception:
        return images

    for name in xobjects:
        try:
            xobj = xobjects[name]
            if hasattr(xobj, "get_object"):
                xobj = xobj.get_object()
            subtype = str(xobj.get("/Subtype", ""))
            if subtype == "/Image":
                img = decode_xobject_image(xobj)
                if img:
                    images.append({"name": name, "image": img})
            elif subtype == "/Form":
                nested_res = xobj.get("/Resources")
                if nested_res:
                    nested_xobj = nested_res.get("/XObject")
                    if nested_xobj:
                        nested_xobj = nested_xobj.get_object() if hasattr(nested_xobj, "get_object") else nested_xobj
                        for nname in nested_xobj:
                            try:
                                nobj = nested_xobj[nname]
                                if hasattr(nobj, "get_object"):
                                    nobj = nobj.get_object()
                                if str(nobj.get("/Subtype", "")) == "/Image":
                                    img = decode_xobject_image(nobj)
                                    if img:
                                        images.append({"name": f"{name}_{nname}", "image": img})
                            except Exception:
                                continue
        except Exception:
            continue
    return images


def render_page_image(pdf_path, page_num, scale=2):
    """Render a full page as PNG using pypdfium2."""
    if not HAS_PDFIUM:
        return None
    try:
        pdf = pdfium.PdfDocument(str(pdf_path))
        pg = pdf[page_num - 1]
        bitmap = pg.render(scale=scale)
        img = bitmap.to_pil()
        pdf.close()
        return img
    except Exception as e:
        print(f"  WARNING: pypdfium2 render failed p{page_num}: {e}")
        return None


def extract_table_data(pdf_path, page_num):
    """Extract structured table data using pdfplumber."""
    if not HAS_PDFPLUMBER:
        return None
    try:
        pdf = pdfplumber.open(str(pdf_path))
        pg = pdf.pages[page_num - 1]
        tables = pg.find_tables()
        if not tables:
            pdf.close()
            return None
        results = []
        for t in tables:
            data = t.extract()
            if data and len(data) > 1:
                results.append(data)
        pdf.close()
        return results if results else None
    except Exception:
        return None


def main():
    print("=" * 60)
    print("Figure & Table Extraction")
    print("=" * 60)

    pm = load_paper_metadata()
    fn_to_docid = build_filename_to_docid(pm)

    chunks = []
    with open(CHUNKS_FILE) as f:
        for line in f:
            line = line.strip()
            if line:
                chunks.append(json.loads(line))
    print(f"Loaded {len(chunks)} chunks")

    FIGURES_DIR.mkdir(parents=True, exist_ok=True)

    figure_index = {}
    total_figures = 0
    total_tables = 0
    total_xobj = 0
    total_renders = 0

    pdf_files = sorted(PDF_DIR.glob("*.pdf"))
    print(f"Processing {len(pdf_files)} PDFs...\n")

    for pdf_path in pdf_files:
        stem = pdf_path.stem
        doc_id = fn_to_docid.get(stem)
        if not doc_id:
            print(f"  SKIP: {stem} (no doc_id mapping)")
            continue

        reader = pypdf.PdfReader(str(pdf_path))
        full_text = ""
        page_texts = {}
        for i, page in enumerate(reader.pages):
            t = page.extract_text() or ""
            page_texts[i + 1] = t
            full_text += t + "\n"

        captions = find_captions_in_text(full_text)
        if not captions:
            continue

        doc_figures = {}
        doc_dir = FIGURES_DIR / doc_id
        doc_dir.mkdir(parents=True, exist_ok=True)

        for cap in captions:
            fig_key = f"{cap['type']}_{cap['number']}"
            if fig_key in doc_figures:
                continue

            caption_page = find_caption_page(reader, cap["type"], cap["number"])
            if not caption_page:
                continue

            fig_entry = {
                "type": cap["type"],
                "number": cap["number"],
                "caption": cap["caption"],
                "page": caption_page,
                "images": {},
            }

            # Path 1: XObject extraction (for embedded images)
            if cap["type"] == "Figure":
                xobj_images = extract_xobject_images(reader, caption_page)
                if xobj_images:
                    best = max(xobj_images, key=lambda x: x["image"].width * x["image"].height)
                    out_name = f"{fig_key}_xobj.png"
                    out_path = doc_dir / out_name
                    img_save = best["image"]
                    if img_save.mode not in ("RGB", "L", "RGBA"):
                        img_save = img_save.convert("RGB")
                    img_save.save(str(out_path), "PNG")
                    fig_entry["images"]["xobject"] = out_name
                    fig_entry["xobj_size"] = [best["image"].width, best["image"].height]
                    total_xobj += 1

            # Path 2: Table data extraction
            if cap["type"] == "Table":
                table_data = extract_table_data(pdf_path, caption_page)
                if table_data:
                    data_name = f"{fig_key}_data.json"
                    with open(doc_dir / data_name, "w") as f:
                        json.dump(table_data, f, ensure_ascii=False)
                    fig_entry["table_data"] = data_name
                    total_tables += 1

            # Path 3: Full page render (always, as fallback)
            page_render_name = f"{fig_key}_page.png"
            if not (doc_dir / page_render_name).exists():
                page_img = render_page_image(pdf_path, caption_page)
                if page_img:
                    page_img.save(str(doc_dir / page_render_name), "PNG")
                    fig_entry["images"]["page_render"] = page_render_name
                    total_renders += 1
            else:
                fig_entry["images"]["page_render"] = page_render_name

            doc_figures[fig_key] = fig_entry
            total_figures += 1

        if doc_figures:
            figure_index[doc_id] = doc_figures
            fcount = len(doc_figures)
            print(f"  {doc_id} ({stem}): {fcount} figures/tables")

    # Save figure_index.json
    with open(DATA_DIR / "figure_index.json", "w") as f:
        json.dump(figure_index, f, ensure_ascii=False, indent=2)
    print(f"\nSaved figure_index.json")

    # Update chunks.jsonl with figure_refs
    chunk_refs_added = 0
    for chunk in chunks:
        doc_id = chunk["doc_id"]
        doc_figs = figure_index.get(doc_id, {})
        if not doc_figs:
            continue

        text = chunk.get("text", "")
        refs = find_refs_in_text(text)
        matched = []
        seen_keys = set()
        for fig_type, number in refs:
            fig_key = f"{fig_type}_{number}"
            if fig_key in doc_figs and fig_key not in seen_keys:
                seen_keys.add(fig_key)
                fig_info = doc_figs[fig_key]
                matched.append({
                    "fig_key": fig_key,
                    "caption": fig_info["caption"],
                    "page": fig_info["page"],
                })
                if chunk["chunk_id"] not in doc_figs[fig_key].get("referenced_by", []):
                    doc_figs[fig_key].setdefault("referenced_by", []).append(chunk["chunk_id"])

        if matched:
            chunk["figure_refs"] = matched
            chunk_refs_added += 1

    # Rewrite chunks.jsonl
    with open(CHUNKS_FILE, "w") as f:
        for chunk in chunks:
            f.write(json.dumps(chunk, ensure_ascii=False) + "\n")
    print(f"Updated chunks.jsonl: {chunk_refs_added} chunks got figure_refs")

    # Resave figure_index with referenced_by
    with open(DATA_DIR / "figure_index.json", "w") as f:
        json.dump(figure_index, f, ensure_ascii=False, indent=2)

    print(f"\n{'='*60}")
    print(f"Total figures/tables found: {total_figures}")
    print(f"  XObject images extracted: {total_xobj}")
    print(f"  Tables with structured data: {total_tables}")
    print(f"  Page renders: {total_renders}")
    print(f"  Chunks with figure_refs: {chunk_refs_added}")
    print(f"Docs with figures: {len(figure_index)}/{len(pdf_files)}")
    print(f"Output: {FIGURES_DIR}/")


if __name__ == "__main__":
    main()
