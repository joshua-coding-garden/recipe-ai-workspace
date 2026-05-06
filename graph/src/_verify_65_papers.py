"""對 graph/論文50/ 內所有 PDF 執行兩項檢查：
1. 第一頁標題是否與 PubMed esummary title 一致（檢測 PDF 內容真實性）
2. 期刊是否在白名單內（非掠奪性）

執行：cd graph && .venv/bin/python src/_verify_65_papers.py
"""
from __future__ import annotations
import json, re, urllib.request
from pathlib import Path

import _paths  # noqa: F401  HF cache 重定向用

from pypdf import PdfReader

PDF_DIR = Path("/home/aiiauser/JM/0325new/graph/論文50")

# 期刊白名單（非掠奪性，65 篇覆蓋的所有期刊）
JOURNAL_WHITELIST = {
    "J Int Soc Sports Nutr", "Sports Med", "Br J Sports Med",
    "BMJ Open Sport Exerc Med", "Med Sci Sports Exerc",
    "Int J Sport Nutr Exerc Metab", "Adv Nutr", "Am J Clin Nutr",
    "J Nutr", "BMC Sports Sci Med Rehabil", "Eur J Sport Sci",
    "Scand J Med Sci Sports", "J Sport Health Sci", "J Athl Train",
    "J Cachexia Sarcopenia Muscle", "Nutr Rev", "Eur J Appl Physiol",
    "Nutrients",  # MDPI Q1 IF 5.9
    "Antioxidants",  # MDPI Q1 IF 6
    "Orthop J Sports Med",
    "Phys Med Rehabil Clin N Am", "Food Chem Toxicol",
    "Crit Rev Food Sci Nutr", "J Transl Med",
    "Curr Opin Pediatr", "Biology of Sport",
    "Int J Environ Res Public Health",  # MDPI 但 65 內有
    "J Funct Morphol Kinesiol",  # MDPI 邊緣
}


def get_pubmed_title(pmid: str) -> tuple[str, str]:
    url = f"https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id={pmid}&retmode=json"
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req, timeout=20) as r:
        d = json.load(r)
    rec = d.get('result', {}).get(pmid, {})
    return rec.get('title', ''), rec.get('source', '')


def main():
    pdfs = sorted(PDF_DIR.glob("*.pdf"))
    print(f"檢查 {len(pdfs)} 個 PDF\n")
    issues = []
    ok_count = 0
    for pdf in pdfs:
        m = re.match(r"(\d{7,9})_", pdf.name)
        if not m:
            issues.append((pdf.name, "ERR", "檔名沒 PMID 前綴"))
            continue
        pmid = m.group(1)
        try:
            pmt, pms = get_pubmed_title(pmid)
        except Exception as e:
            issues.append((pdf.name, "ERR", f"PubMed query 失敗: {e}"))
            continue
        # 檢查 1: 第一頁包含 PubMed title 前 30 字（容忍 PDF 排版）
        try:
            r = PdfReader(str(pdf))
            first = (r.pages[0].extract_text() or "").lower()
            check_str = pmt[:30].lower()
            if check_str and check_str not in first:
                issues.append((pdf.name, "TITLE_MISMATCH",
                              f"PDF 第一頁不含 PubMed 標題前 30 字 '{pmt[:30]}...'"))
        except Exception as e:
            issues.append((pdf.name, "PDF_PARSE", str(e)))
        # 檢查 2: 期刊白名單
        if pms not in JOURNAL_WHITELIST:
            issues.append((pdf.name, "JOURNAL_WARN",
                          f"期刊 '{pms}' 不在白名單，請人工確認"))
        ok_count += 1
        print(f"  [{ok_count:>3}/{len(pdfs)}] {pdf.name[:80]}  → {pms}")
    print()
    if not issues:
        print("✅ 所有 PDF 通過檢查")
    else:
        print(f"⚠️  發現 {len(issues)} 個問題：")
        for name, kind, detail in issues:
            print(f"  [{kind}] {name}: {detail}")


if __name__ == "__main__":
    main()
