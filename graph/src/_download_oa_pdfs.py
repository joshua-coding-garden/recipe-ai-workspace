"""依 DOI publisher pattern 批次下載 33 篇 OA PDF 到 graph/論文50/

用法：
    cd /home/aiiauser/JM/0325new/graph
    .venv/bin/python src/_download_oa_pdfs.py

策略：
    - 10.1186/* (BioMed Central + JISSN/JTM 舊版) → BMC track/pdf 直連
    - 10.1007/* (Springer Sports Med, JISSN+) → Springer content/pdf
    - 10.3390/* (MDPI Nutrients/IJERPH) → MDPI {ISSN}/{vol}/{issue}/{paper}/pdf
    - 10.1080/15502783* (Tandfonline JISSN 新版) → Tandfonline doi/pdf
    - 10.1177/* (Sage Orthop J Sports Med) → Sage doi/pdf
    - 10.1136/* (BMJ BJSM) → bjsm.bmj.com/content
    - 10.4085/* (NATA J Athl Train) → 用 PMC EuropePMC mirror（NATA 自家無 OA PDF link）
    - 10.1016/* (Elsevier Adv Nutr) → ScienceDirect /pdfft

每篇命名：{PMID}_{第一作者}_{年份}.pdf
"""
from __future__ import annotations
import json
import re
import time
import urllib.request
import urllib.error
from pathlib import Path

OUT_DIR = Path("/home/aiiauser/JM/0325new/graph/論文50")
OUT_DIR.mkdir(exist_ok=True)

# 33 OA 的 (PMID, DOI, 第一作者姓, 年份, 簡短主題)
PAPERS = [
    # baseline 13 OA
    ("28642676", "10.1186/s12970-017-0177-8", "Jager", 2017, "ISSN_protein"),
    ("28919842", "10.1186/s12970-017-0189-4", "Kerksick", 2017, "ISSN_timing"),
    ("33388079", "10.1186/s12970-020-00383-4", "Guest", 2021, "ISSN_caffeine"),
    ("37800468", "10.1080/15502783.2023.2263409", "Ferrando", 2023, "ISSN_EAA"),
    ("31699159", "10.1186/s12970-019-0312-9", "Tiller", 2019, "ISSN_ultra"),
    ("39203900", "10.3390/nu16162764", "Tan", 2024, "nitrate_cycle"),
    ("38999792", "10.3390/nu16132044", "FernandezLazaro", 2024, "omega3_inflam"),
    ("28985128", "10.4085/1062-6050-52.9.02", "McDermott", 2017, "NATA_fluid"),
    ("37196876", "10.1016/j.advnut.2023.05.011", "Nasimi", 2023, "whey_VitD_sarcopenia"),
    ("38188620", "10.1177/23259671231220371", "Wyatt", 2024, "elite_VitD"),
    ("24299050", "10.1186/1550-2783-10-53", "Schoenfeld", 2013, "protein_timing"),
    ("26069301", "10.1136/bjsports-2015-094915", "Racinais", 2015, "IOC_heat"),
    # 30 PubMed 自查 OA 20 篇
    ("31864419", "10.1186/s12970-019-0329-0", "Jager", 2019, "ISSN_probiotics"),
    ("34959776", "10.3390/nu13124223", "Bourdas", 2021, "carb_solution"),
    ("29473893", "10.3390/nu10020253", "Alghannam", 2018, "glycogen_recovery"),
    ("40944139", "10.3390/nu17172748", "Kazeminasab", 2025, "creatine_strength"),
    ("35187864", "10.1002/jcsm.12922", "Nunes", 2022, "protein_muscle"),
    ("38612975", "10.3390/nu16070941", "Liao", 2024, "protein_compare"),
    ("34445035", "10.3390/nu13082875", "Hunt", 2021, "blackcurrant"),
    ("39623590", "10.1080/15502783.2024.2434217", "DanielVasile", 2024, "curcumin"),
    ("28465675", "10.1186/s12970-017-0168-9", "McLeay", 2017, "thiols_oxidative"),
    ("33203106", "10.3390/ijerph17228452", "Higgins", 2020, "antioxidant"),
    ("33481001", "10.4085/592-20", "Lagowska", 2021, "probiotic_URI"),
    ("28332116", "10.1007/s40279-017-0691-5", "Baker", 2017, "sweat_sodium"),
    ("28332115", "10.1007/s40279-017-0694-2", "Jeukendrup", 2017, "periodized"),
    ("39536912", "10.1016/j.jshs.2024.101009", "Pengelly", 2025, "female_iron"),
    ("30301734", "10.1136/bjsports-2018-099723", "Ackerman", 2019, "estrogen_BMD"),
    ("32245088", "10.3390/nu12030835", "Logue", 2020, "LEA_prevalence"),
    ("40806155", "10.3390/nu17152571", "Govindasamy", 2025, "plant_protein"),
    ("38970118", "10.1186/s12967-024-05434-x", "Tarsitano", 2024, "magnesium"),
    ("30755234", "10.1186/s12970-019-0272-0", "Born", 2019, "chocolate_milk"),
    ("35937777", "10.1080/15502783.2022.2104130", "Hijlkema", 2022, "tendon_nutrition"),
    ("37127187", "10.1016/j.advnut.2023.04.012", "West", 2023, "vegan_athlete"),
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0",
    "Accept": "application/pdf,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "DNT": "1",
    "Upgrade-Insecure-Requests": "1",
}


def doi_to_pdf_url(doi: str, journal_hint: str | None = None) -> str | None:
    """根據 DOI prefix 路由到對應 publisher PDF URL"""
    if doi.startswith("10.1186/"):
        # BMC 系：JISSN, J Transl Med, Nutrients (舊?), Crit Care 等
        # JISSN 舊版子網域 jissn.biomedcentral.com
        # J Transl Med: translational-medicine.biomedcentral.com
        # 通用：用 link.springer.com (Springer Nature 已併入) 通常工作
        return f"https://link.springer.com/content/pdf/{doi}.pdf"
    if doi.startswith("10.1007/"):
        return f"https://link.springer.com/content/pdf/{doi}.pdf"
    if doi.startswith("10.3390/"):
        # MDPI: 拆 ISSN/vol/issue/paper
        # 10.3390/nu16162764 → 2072-6643/16/16/2764
        # 10.3390/ijerph17228452 → 1660-4601/17/22/8452
        m = re.match(r"10\.3390/([a-z]+)(\d+)$", doi)
        if not m:
            return None
        prefix, num = m.group(1), m.group(2)
        # MDPI ISSN map
        issn_map = {
            "nu": "2072-6643",       # Nutrients
            "ijerph": "1660-4601",   # IJERPH
        }
        issn = issn_map.get(prefix)
        if not issn:
            return None
        # num 通常 = 卷(2-4位) + 期(2位) + 流水號(4位)；MDPI Nutrients 從 2009 起
        # 16162764 = vol16/issue16/paper2764 → 但 paper number 後 4 位
        # 為穩定，先嘗試 vol = 2 digits, issue = 2 digits, paper = 後 4 位
        if prefix == "nu":
            # 去前 4 位（vol 1-2 位 + issue 2 位）+ 後 4 位 paper
            # nu16162764: vol=16 issue=16 paper=2764
            # nu13124223: vol=13 issue=12 paper=4223 (vol 2 digits 1-2)
            # nu17172748: vol=17 issue=17 paper=2748
            # nu10020253: vol=10 issue=02 paper=0253
            # nu17152571: vol=17 issue=15 paper=2571
            # nu16070941: vol=16 issue=07 paper=0941
            # nu13082875: vol=13 issue=08 paper=2875
            # nu12072057: vol=12 issue=07 paper=2057
            # nu12030835: vol=12 issue=03 paper=0835
            # 統一: vol 2 digits + issue 2 digits + paper 4 digits = 8 digits
            if len(num) == 8:
                vol = num[:2].lstrip("0") or "0"
                issue = num[2:4].lstrip("0") or "0"
                paper = num[4:].lstrip("0") or "0"
                return f"https://www.mdpi.com/{issn}/{vol}/{issue}/{paper}/pdf"
        elif prefix == "ijerph":
            # ijerph17228452 → vol=17 issue=22 paper=8452
            if len(num) == 8:
                vol = num[:2].lstrip("0") or "0"
                issue = num[2:4].lstrip("0") or "0"
                paper = num[4:].lstrip("0") or "0"
                return f"https://www.mdpi.com/{issn}/{vol}/{issue}/{paper}/pdf"
        return None
    if doi.startswith("10.1080/"):
        # Tandfonline (JISSN 新版+)
        return f"https://www.tandfonline.com/doi/pdf/{doi}?download=true"
    if doi.startswith("10.1177/"):
        # Sage (Orthop J Sports Med)
        return f"https://journals.sagepub.com/doi/pdf/{doi}"
    if doi.startswith("10.1136/"):
        # BMJ BJSM - 通常需要 volume/issue/page，從 DOI 不易拼出
        # 改用 doi.org redirect → 抓 URL 再加 .full.pdf
        return None  # 後置處理
    if doi.startswith("10.4085/"):
        # NATA J Athl Train - 走 EuropePMC backend
        return None  # 後置 (用 PMC ID)
    if doi.startswith("10.1002/"):
        # Wiley J Cachexia
        return f"https://onlinelibrary.wiley.com/doi/pdf/{doi}"
    if doi.startswith("10.1016/"):
        # Elsevier - 需要 PII，不易從 DOI 直接拼
        return None  # 後置 (透過 PMC)
    return None


def fetch_pdf(url: str, dest: Path, timeout: int = 60) -> tuple[bool, str]:
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            data = r.read()
        if data[:4] == b"%PDF":
            dest.write_bytes(data)
            return True, f"{len(data):,} bytes"
        # 不是 PDF
        return False, f"got non-PDF ({len(data)} bytes, head={data[:20]!r})"
    except urllib.error.HTTPError as e:
        return False, f"HTTP {e.code}"
    except Exception as e:
        return False, f"{type(e).__name__}: {e}"


def fallback_via_pmc_oa(pmid: str, dest: Path) -> tuple[bool, str]:
    """無法直接從 publisher 拿到的，走 EuropePMC backend"""
    # 先 PubMed esummary 拿 PMC ID
    try:
        url = f"https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id={pmid}&retmode=json"
        with urllib.request.urlopen(url, timeout=20) as r:
            d = json.load(r)
        ids = d.get('result', {}).get(pmid, {}).get('articleids', [])
        pmcid = ''
        for a in ids:
            if a.get('idtype') == 'pmc':
                pmcid = a.get('value', '').replace('PMC', '')
                break
        if not pmcid:
            return False, "no PMC ID"
        # EuropePMC 後端
        eurl = f"https://europepmc.org/articles/PMC{pmcid}?pdf=render"
        return fetch_pdf(eurl, dest)
    except Exception as e:
        return False, f"PMC lookup error: {e}"


def main():
    print(f"目標：下載 {len(PAPERS)} 篇 OA PDF 到 {OUT_DIR}")
    print(f"{'#':<3} {'PMID':<10} {'DOI prefix':<12} {'Status':<8} Detail")
    print("-" * 100)
    success, fail = 0, []
    for i, (pmid, doi, author, year, topic) in enumerate(PAPERS, 1):
        fname = f"{pmid}_{author}_{year}_{topic}.pdf"
        dest = OUT_DIR / fname
        if dest.exists() and dest.stat().st_size > 1000:
            print(f"{i:<3} {pmid:<10} {doi[:12]:<12} skip     existing {dest.stat().st_size:,} bytes")
            success += 1
            continue
        url = doi_to_pdf_url(doi)
        if url:
            ok, msg = fetch_pdf(url, dest)
            if not ok:
                # 第一輪失敗，試 PMC fallback
                ok, msg2 = fallback_via_pmc_oa(pmid, dest)
                msg = f"primary={msg}; pmc={msg2}" if not ok else f"pmc-fallback OK ({msg2})"
        else:
            ok, msg = fallback_via_pmc_oa(pmid, dest)
            msg = f"pmc-only: {msg}"
        if ok:
            success += 1
            print(f"{i:<3} {pmid:<10} {doi[:12]:<12} OK       {msg}")
        else:
            fail.append((pmid, author, year, doi, msg))
            print(f"{i:<3} {pmid:<10} {doi[:12]:<12} FAIL     {msg}")
        time.sleep(1.5)  # rate limit polite

    print(f"\n總計：{success}/{len(PAPERS)} 成功")
    if fail:
        print(f"失敗 {len(fail)} 篇：")
        for f in fail:
            print(f"  PMID {f[0]} ({f[1]} {f[2]}) DOI={f[3]}: {f[4]}")


if __name__ == "__main__":
    main()
