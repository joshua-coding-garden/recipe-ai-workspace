"""從 PubMed efetch 抓取完整論文元數據 + corpus text 段落提取。

資料來源：
  1. paper_metadata.json（既有基本欄位）
  2. PubMed efetch XML（摘要、作者機構、MeSH、出版類型）
  3. PubMed elink（被引用數）
  4. corpus_text/*.txt（Methods / Results / Conclusions 段落）

產出: graph/data/paper_enriched.json

用法:
  cd /home/aiiauser/JM/0325new/graph
  .venv/bin/python src/_enrich_paper_details.py
"""
import _paths
import json
import re
import time
import urllib.request
import urllib.parse
from datetime import date
from pathlib import Path
from xml.etree import ElementTree as ET

META_FILE = _paths.DATA_DIR / "paper_metadata.json"
OUTPUT_FILE = _paths.DATA_DIR / "paper_enriched.json"
CORPUS_DIR = _paths.CORPUS_TEXT_DIR

EFETCH_URL = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi"
UA = {"User-Agent": "Mozilla/5.0 (RecipeAI-GraphRAG; ejoshfu@gmail.com)"}


# ── PubMed efetch ──

def fetch_efetch_batch(pmids):
    params = {
        "db": "pubmed",
        "id": ",".join(pmids),
        "retmode": "xml",
        "rettype": "abstract",
    }
    url = f"{EFETCH_URL}?{urllib.parse.urlencode(params)}"
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=60) as resp:
        return ET.fromstring(resp.read())


def parse_article(article_el):
    result = {
        "abstract": "",
        "structured_abstract": None,
        "authors_full": [],
        "publication_types": [],
        "mesh_terms": [],
    }

    medline = article_el.find(".//MedlineCitation")
    if medline is None:
        return result

    art = medline.find("Article")
    if art is None:
        return result

    abs_el = art.find("Abstract")
    if abs_el is not None:
        parts = abs_el.findall("AbstractText")
        if len(parts) == 1 and parts[0].get("NlmCategory") is None and parts[0].get("Label") is None:
            result["abstract"] = (parts[0].text or "") + "".join(
                (ET.tostring(ch, encoding="unicode", method="text") for ch in parts[0])
            )
        else:
            structured = {}
            full_parts = []
            for p in parts:
                cat = (p.get("NlmCategory") or p.get("Label") or "").upper()
                text = (p.text or "") + "".join(
                    (ET.tostring(ch, encoding="unicode", method="text") for ch in p)
                )
                text = text.strip()
                if not text:
                    continue
                full_parts.append(text)
                cat_key = _map_nlm_category(cat)
                if cat_key:
                    structured[cat_key] = text
            result["abstract"] = " ".join(full_parts)
            if structured:
                result["structured_abstract"] = structured

    author_list = art.find("AuthorList")
    if author_list is not None:
        for au in author_list.findall("Author"):
            ln = au.findtext("LastName", "")
            fn = au.findtext("ForeName", "")
            name = f"{fn} {ln}".strip() if fn else ln
            affs = []
            for aff_info in au.findall("AffiliationInfo"):
                aff_text = aff_info.findtext("Affiliation", "").strip()
                if aff_text:
                    affs.append(aff_text)
            result["authors_full"].append({
                "name": name,
                "affiliation": "; ".join(affs) if affs else "",
            })

    pub_type_list = art.find("PublicationTypeList")
    if pub_type_list is not None:
        for pt in pub_type_list.findall("PublicationType"):
            if pt.text:
                result["publication_types"].append(pt.text)

    mesh_list = medline.find("MeshHeadingList")
    if mesh_list is not None:
        for mh in mesh_list.findall("MeshHeading"):
            desc = mh.find("DescriptorName")
            if desc is not None and desc.text:
                result["mesh_terms"].append(desc.text)

    return result


def _map_nlm_category(cat):
    cat = cat.strip()
    mapping = {
        "OBJECTIVE": "objective",
        "OBJECTIVES": "objective",
        "AIM": "objective",
        "AIMS": "objective",
        "PURPOSE": "objective",
        "BACKGROUND": "background",
        "INTRODUCTION": "background",
        "CONTEXT": "background",
        "METHODS": "methods",
        "METHOD": "methods",
        "DESIGN": "methods",
        "MATERIALS AND METHODS": "methods",
        "PARTICIPANTS": "methods",
        "RESULTS": "results",
        "FINDINGS": "results",
        "CONCLUSIONS": "conclusions",
        "CONCLUSION": "conclusions",
        "SIGNIFICANCE": "conclusions",
        "IMPLICATIONS": "conclusions",
    }
    return mapping.get(cat, "")


# ── Europe PMC (citation count) ──

EUROPEPMC_URL = "https://www.ebi.ac.uk/europepmc/webservices/rest/search"


def fetch_citation_counts(pmids):
    counts = {}
    for i, pmid in enumerate(pmids):
        params = {
            "query": f"EXT_ID:{pmid} AND SRC:MED",
            "format": "json",
            "resultType": "core",
        }
        url = f"{EUROPEPMC_URL}?{urllib.parse.urlencode(params)}"
        req = urllib.request.Request(url, headers=UA)
        try:
            with urllib.request.urlopen(req, timeout=15) as resp:
                data = json.loads(resp.read())
            results = data.get("resultList", {}).get("result", [])
            if results:
                counts[pmid] = results[0].get("citedByCount", 0)
            else:
                counts[pmid] = None
        except Exception as e:
            print(f"  ⚠ Europe PMC {pmid} failed: {e}")
            counts[pmid] = None
        if (i + 1) % 10 == 0:
            print(f"    {i + 1}/{len(pmids)}...")
        time.sleep(0.35)
    return counts


# ── Corpus text section extraction ──

SECTION_PATTERNS = [
    (r"^(?:abstract|summary)\b", "abstract"),
    (r"^(?:introduction|background)\b", "background"),
    (r"^(?:methods?|materials?\s+and\s+methods?|study\s+design|experimental\s+(?:design|procedures?))\b", "methods"),
    (r"^(?:results?(?:\s+and\s+discussion)?)\b", "results"),
    (r"^(?:discussion)\b", "discussion"),
    (r"^(?:conclusions?|concluding\s+remarks?|summary\s+and\s+conclusions?)\b", "conclusions"),
    (r"^(?:participants?|subjects?|study\s+population|sample)\b", "participants"),
]

SECTION_RE = [(re.compile(p, re.IGNORECASE), label) for p, label in SECTION_PATTERNS]


def extract_sections_from_corpus(filename):
    txt_path = CORPUS_DIR / f"{filename}.txt"
    if not txt_path.exists():
        return {}

    text = txt_path.read_text(encoding="utf-8", errors="replace")
    lines = text.split("\n")

    sections_found = []
    for i, line in enumerate(lines):
        stripped = line.strip()
        if not stripped or len(stripped) > 80:
            continue
        for regex, label in SECTION_RE:
            if regex.match(stripped):
                sections_found.append((i, label))
                break

    result = {}
    for idx, (line_no, label) in enumerate(sections_found):
        end_line = sections_found[idx + 1][0] if idx + 1 < len(sections_found) else min(line_no + 200, len(lines))
        content_lines = lines[line_no + 1:end_line]
        content = "\n".join(content_lines).strip()
        if len(content) > 5000:
            content = content[:5000] + "..."
        if content and label not in result:
            result[label] = content

    return result


def extract_study_population(abstract, sections):
    pop_text = sections.get("participants", "")
    if pop_text:
        return pop_text[:1500]

    search_text = (sections.get("methods", "") or abstract or "")[:3000]
    patterns = [
        r"(\d+)\s+(?:healthy\s+)?(?:male|female|men|women|adults?|participants?|subjects?|athletes?|players?|runners?|cyclists?|swimmers?|volunteers?|individuals?|patients?|older\s+adults?|young\s+(?:men|women|adults?))[^.]*\.",
        r"(?:included|enrolled|recruited|comprised|consisted\s+of)\s+(\d+)[^.]*\.",
        r"(?:sample\s+(?:of|size)|n\s*=)\s*(\d+)[^.]*\.",
    ]
    matches = []
    for pat in patterns:
        for m in re.finditer(pat, search_text, re.IGNORECASE):
            matches.append(m.group(0).strip())
    if matches:
        return " ".join(dict.fromkeys(matches))[:1500]

    return ""


def extract_key_contributions(abstract, structured):
    if structured:
        obj = structured.get("objective") or structured.get("background", "")
        if obj:
            sentences = re.split(r'(?<=[.!?])\s+', obj)
            return " ".join(sentences[:3])

    if abstract:
        sentences = re.split(r'(?<=[.!?])\s+', abstract)
        return " ".join(sentences[:3])

    return ""


# ── Main ──

def main():
    with open(META_FILE, encoding="utf-8") as f:
        metadata = json.load(f)

    doc_ids = sorted(metadata.keys(), key=lambda x: int(x.split("_")[1]))
    pmid_to_doc = {}
    for did in doc_ids:
        pmid_to_doc[metadata[did]["pmid"]] = did
    all_pmids = [metadata[did]["pmid"] for did in doc_ids]

    print(f"共 {len(all_pmids)} 篇，開始從 PubMed efetch 抓取完整元數據...\n")

    # ── Phase 1: efetch (with retry) ──
    efetch_data = {}
    batch_size = 10
    for i in range(0, len(all_pmids), batch_size):
        batch = all_pmids[i:i + batch_size]
        print(f"  efetch 批次 {i // batch_size + 1}: {batch[0]}..{batch[-1]}")
        for attempt in range(3):
            try:
                root = fetch_efetch_batch(batch)
                for article in root.findall("PubmedArticle"):
                    pmid_el = article.find(".//MedlineCitation/PMID")
                    if pmid_el is not None and pmid_el.text:
                        efetch_data[pmid_el.text] = parse_article(article)
                break
            except Exception as e:
                if attempt < 2:
                    print(f"    ⚠ attempt {attempt + 1} failed: {e}, retrying...")
                    time.sleep(2)
                else:
                    print(f"    ✗ efetch batch failed after 3 attempts: {e}")
        if i + batch_size < len(all_pmids):
            time.sleep(0.5)

    print(f"\n  efetch 成功: {len(efetch_data)}/{len(all_pmids)} 篇")

    # ── Phase 2: elink (citation counts) ──
    print("\n開始抓取引用數 (elink)...")
    citation_counts = fetch_citation_counts(all_pmids)
    fetched_citations = sum(1 for v in citation_counts.values() if v is not None)
    print(f"  elink 成功: {fetched_citations}/{len(all_pmids)} 篇")

    # ── Phase 3: corpus text sections ──
    print("\n開始解析 corpus text 段落...")
    corpus_sections = {}
    for did in doc_ids:
        fname = metadata[did]["filename"]
        corpus_sections[did] = extract_sections_from_corpus(fname)
    has_sections = sum(1 for v in corpus_sections.values() if v)
    print(f"  有段落的: {has_sections}/{len(doc_ids)} 篇")

    # ── Phase 4: assemble ──
    print("\n組裝最終資料...")
    today = date.today().isoformat()
    enriched = {}

    for did in doc_ids:
        m = metadata[did]
        pmid = m["pmid"]
        ef = efetch_data.get(pmid, {})
        sections = corpus_sections.get(did, {})

        abstract = ef.get("abstract", "")
        structured = ef.get("structured_abstract")

        enriched[did] = {
            "doc_id": did,
            "pmid": pmid,
            "title": m["title"],
            "authors_short": m["authors"],
            "journal": m["journal"],
            "year": m["year"],
            "doi": m["doi"],
            "impact_factor": m["impact_factor"],
            "sjr_quartile": m["sjr_quartile"],
            "study_type": m["study_type"],
            "topic": m.get("topic", ""),
            "filename": m["filename"],
            "abstract": abstract,
            "structured_abstract": structured,
            "authors_full": ef.get("authors_full", []),
            "publication_types": ef.get("publication_types", []),
            "mesh_terms": ef.get("mesh_terms", []),
            "citation_count": citation_counts.get(pmid),
            "citation_fetched_date": today,
            "sections": {
                "methods": sections.get("methods", ""),
                "results": sections.get("results", ""),
                "conclusions": sections.get("conclusions", ""),
                "discussion": sections.get("discussion", ""),
            },
            "key_contributions": extract_key_contributions(abstract, structured),
            "study_population": extract_study_population(abstract, sections),
        }

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(enriched, f, ensure_ascii=False, indent=2)

    print(f"\n完成！已寫入 {OUTPUT_FILE}")
    print(f"共 {len(enriched)} 篇論文")

    # ── Stats ──
    has_abstract = sum(1 for v in enriched.values() if v["abstract"])
    has_authors = sum(1 for v in enriched.values() if v["authors_full"])
    has_mesh = sum(1 for v in enriched.values() if v["mesh_terms"])
    has_cite = sum(1 for v in enriched.values() if v["citation_count"] is not None)
    has_pop = sum(1 for v in enriched.values() if v["study_population"])
    has_methods = sum(1 for v in enriched.values() if v["sections"]["methods"])
    has_conclusions = sum(1 for v in enriched.values() if v["sections"]["conclusions"])

    print(f"\n統計:")
    print(f"  摘要:     {has_abstract}/{len(enriched)}")
    print(f"  完整作者: {has_authors}/{len(enriched)}")
    print(f"  MeSH:     {has_mesh}/{len(enriched)}")
    print(f"  引用數:   {has_cite}/{len(enriched)}")
    print(f"  實驗人群: {has_pop}/{len(enriched)}")
    print(f"  方法段落: {has_methods}/{len(enriched)}")
    print(f"  結論段落: {has_conclusions}/{len(enriched)}")


if __name__ == "__main__":
    main()
