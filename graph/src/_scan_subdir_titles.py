"""掃描 13 個目標子資料夾每個 PDF 的第一頁與摘要區塊，輸出表格供 Claude 判讀。

用途：識別「20 篇主題論文」中需要從子資料夾撈出的 13 篇。子資料夾混雜了訃聞、勘誤、
不相關文章，必須讀第一頁標題 + 摘要才能判斷哪一篇是該主題的真正主論文。

執行：.venv/bin/python src/_scan_subdir_titles.py
輸出：data/_subdir_paper_scan.md
"""
from __future__ import annotations

import _paths  # noqa: F401

import re
import sys
import traceback
from pathlib import Path

from pypdf import PdfReader

from _paths import CORPUS_PDF_DIR, DATA_DIR

TARGET_SUBDIRS = [
    "Omega-3 脂肪酸與心臟病預防 (GISSI-Prevenzione 試驗)",
    "乳製品攝取與心血管健康的關聯 (PURE 研究)",
    "兒童早期發展與營養攝取的終身影響",
    "建構母嬰營養影響力的動力",
    "改善母嬰營養的實證干預措施 (系列論文二)",
    "母嬰微量營養素補充的成本效益",
    "母嬰營養不良的全球危機 (系列論文一)",
    "碳水化合物攝取量與死亡率的U型曲線",
    "碳水化合物與脂肪攝取比例的世紀大調查 (PURE 研究)",
    "維生素 D 狀態與疾病的因果關係反思",
    "鈉排泄量與心血管疾病的關聯性研究",
    "雙重營養負擔的病理途徑與後果",
    "雙重營養負擔的轉變",
]

# 用於剔除標題候選的樣板字串
TEMPLATE_LINE_RE = re.compile(
    r"^(www\.thelancet\.com|Vol\s+\d+|Articles|Comment|Series|Editorial|Correspondence|"
    r"Department\s+of\s+Error|Obituary|Correction|Published\s+Online|"
    r"https?://|doi:|See\s+|Lancet\s+\d+|©|This\s+version|For more|"
    r"\d+$|^The\s+Lancet\s+(Commissions?|Diabetes)?$|"
    r"^[\d\s,;:.\-–]+$)",
    re.IGNORECASE,
)


def first_page_text(pdf_path: Path) -> str:
    try:
        reader = PdfReader(str(pdf_path))
        if not reader.pages:
            return ""
        return reader.pages[0].extract_text() or ""
    except Exception as e:
        return f"[ERROR {type(e).__name__}: {e}]"


def guess_title(first_page: str) -> str:
    """挑前 30 行裡，第一個長度 30–250、不像樣板的行，做為標題候選。
    若該行很短可能是被 PDF 拆斷，黏接下一個非樣板行。"""
    lines = [ln.strip() for ln in first_page.splitlines() if ln.strip()]
    candidates: list[str] = []
    for i, line in enumerate(lines[:35]):
        if TEMPLATE_LINE_RE.match(line):
            continue
        if len(line) < 15:
            continue
        candidates.append(line)
        # 嘗試黏接下一行（標題常被 PDF 斷成兩行）
        if i + 1 < len(lines) and not TEMPLATE_LINE_RE.match(lines[i + 1]):
            joined = (line + " " + lines[i + 1]).strip()
            if len(joined) <= 300:
                candidates.append(joined)
        if len(candidates) >= 4:
            break
    return " | ".join(candidates[:3]) if candidates else "(no title candidate)"


def extract_abstract(first_page: str) -> str:
    """找 Summary / Background / Abstract 段落，回傳前 400 字。否則回傳第一頁中段 400 字。"""
    text = first_page
    for keyword in ("Summary", "Background", "Abstract", "Objectives", "Introduction"):
        m = re.search(rf"\b{keyword}\b\s*[\.:\n]", text)
        if m:
            return text[m.start() : m.start() + 500]
    # fallback：取第一頁中段
    n = len(text)
    return text[n // 4 : n // 4 + 400] if n > 400 else text


def main() -> None:
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    out_path = DATA_DIR / "_subdir_paper_scan.md"

    lines: list[str] = ["# 子資料夾論文標題/摘要掃描", ""]
    lines.append("> 此檔由 `_scan_subdir_titles.py` 產生，供 Claude 判讀後挑出符合主題的主論文。")
    lines.append("")

    for subdir_name in TARGET_SUBDIRS:
        subdir = CORPUS_PDF_DIR / subdir_name
        lines.append(f"## {subdir_name}")
        lines.append("")
        if not subdir.is_dir():
            lines.append(f"⚠️ 找不到資料夾：{subdir}")
            lines.append("")
            continue
        pdfs = sorted(subdir.glob("*.pdf"))
        if not pdfs:
            lines.append("⚠️ 此資料夾沒有 PDF")
            lines.append("")
            continue
        for i, pdf in enumerate(pdfs, 1):
            try:
                fp = first_page_text(pdf)
                title = guess_title(fp)
                abstract = extract_abstract(fp)
                # 清理摘要：壓縮空白
                abstract = re.sub(r"\s+", " ", abstract).strip()[:400]
                lines.append(f"### [{i}] `{pdf.name}` ({pdf.stat().st_size:,} bytes)")
                lines.append("")
                lines.append(f"**Title 候選：** {title}")
                lines.append("")
                lines.append(f"**摘要片段：** {abstract}")
                lines.append("")
            except Exception:
                lines.append(f"### [{i}] `{pdf.name}` — 解析錯誤")
                lines.append(f"```\n{traceback.format_exc()}\n```")
                lines.append("")
        lines.append("---")
        lines.append("")

    out_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"已寫入 {out_path}")
    print(f"行數：{len(lines)}")


if __name__ == "__main__":
    main()
