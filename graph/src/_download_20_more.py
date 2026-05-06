"""下載新增 20 篇 OA 補強到 graph/論文50/

執行：cd graph && .venv/bin/python src/_download_20_more.py
"""
from __future__ import annotations
import json, time, urllib.request, urllib.error
from pathlib import Path

OUT_DIR = Path("/home/aiiauser/JM/0325new/graph/論文50")
OUT_DIR.mkdir(exist_ok=True)

PAPERS = [
    ("41701327", "10.1080/15502783.2026.2629828", "Gonzalez", 2026, "ISSN_antioxidant"),
    ("39810703", "10.1080/15502783.2024.2441775", "Jager", 2025, "ISSN_omega3"),
    ("39699070", "10.1080/15502783.2024.2434734", "Rathmacher", 2025, "ISSN_HMB"),
    ("40781883", "10.1111/sms.70112", "Bangsbo", 2025, "elite_consensus"),
    ("40117058", "10.1007/s40279-025-02203-8", "Witard", 2025, "endurance_protein"),
    ("39792347", "10.1007/s40279-024-02152-8", "PerezCastillo", 2025, "lifelong_inflammation"),
    ("40221559", "10.1007/s40279-025-02213-6", "Naderi", 2025, "post_exercise_recovery"),
    ("39287777", "10.1007/s40279-024-02108-y", "Jeukendrup", 2024, "REDs_critique"),
    ("38995599", "10.1007/s40279-024-02065-6", "Ihalainen", 2024, "LEA_endocrine"),
    ("41992072", "10.1002/ejsc.70125", "Reina", 2026, "short_LEA_protein"),
    ("40539747", "10.1111/sms.70089", "Jeppesen", 2025, "LEA_molecular"),
    ("38556251", "10.1016/j.advnut.2024.100215", "Cohen", 2024, "adolescent_iron"),
    ("40371844", "10.1080/15502783.2025.2502094", "SmithRyan", 2025, "creatine_women"),
    ("41992745", "10.1080/15502783.2026.2658774", "Shimizu", 2026, "EPA_MCT"),
    ("42015544", "10.1080/15502783.2026.2642149", "Rezaei", 2026, "pomegranate"),
    ("41685663", "10.1080/15502783.2026.2630487", "Rowland", 2026, "ergogenic_review"),
    ("40963202", "10.1080/15502783.2025.2561661", "Stankiewicz", 2025, "VitD_ultramarathon"),
    ("38742477", "10.1002/jcsm.13468", "Baumert", 2024, "hypertrophy_glucose"),
    ("40641114", "10.1002/jcsm.70000", "Jang", 2025, "adipose_sarcopenia"),
    ("39853659", "10.1007/s40279-025-02174-w", "SmithMJ", 2025, "ACL_quadriceps"),
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0",
    "Accept": "application/pdf,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "DNT": "1",
    "Upgrade-Insecure-Requests": "1",
}


def doi_to_pdf_url(doi: str):
    if doi.startswith("10.1080/"):
        return f"https://www.tandfonline.com/doi/pdf/{doi}?download=true"
    if doi.startswith("10.1007/"):
        return f"https://link.springer.com/content/pdf/{doi}.pdf"
    if doi.startswith("10.1002/"):
        return f"https://onlinelibrary.wiley.com/doi/pdf/{doi}"
    if doi.startswith("10.1111/"):
        return f"https://onlinelibrary.wiley.com/doi/pdf/{doi}"
    if doi.startswith("10.1016/"):
        return None
    return None


def fetch_pdf(url: str, dest: Path, timeout: int = 60):
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            data = r.read()
        if data[:4] == b"%PDF":
            dest.write_bytes(data)
            return True, f"{len(data):,} bytes"
        return False, f"got non-PDF ({len(data)} bytes)"
    except urllib.error.HTTPError as e:
        return False, f"HTTP {e.code}"
    except Exception as e:
        return False, f"{type(e).__name__}: {e}"


def fallback_via_europepmc(pmid: str, dest: Path):
    try:
        url = f"https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id={pmid}&retmode=json"
        req = urllib.request.Request(url, headers=HEADERS)
        with urllib.request.urlopen(req, timeout=20) as r:
            d = json.load(r)
        ids = d.get('result', {}).get(pmid, {}).get('articleids', [])
        pmcid = ''
        for a in ids:
            if a.get('idtype') == 'pmc':
                pmcid = a.get('value', '').replace('PMC', '')
                break
        if not pmcid:
            return False, "no PMC ID"
        eurl = f"https://europepmc.org/articles/PMC{pmcid}?pdf=render"
        return fetch_pdf(eurl, dest)
    except Exception as e:
        return False, f"PMC lookup error: {e}"


def main():
    print(f"目標：下載 {len(PAPERS)} 篇 OA PDF 到 {OUT_DIR}")
    print("-" * 100)
    success, fail = 0, []
    for i, (pmid, doi, author, year, topic) in enumerate(PAPERS, 1):
        fname = f"{pmid}_{author}_{year}_{topic}.pdf"
        dest = OUT_DIR / fname
        if dest.exists() and dest.stat().st_size > 1000:
            print(f"{i:<3} {pmid:<10} skip (existing)")
            success += 1
            continue
        url = doi_to_pdf_url(doi)
        if url:
            ok, msg = fetch_pdf(url, dest)
            if not ok:
                ok, msg2 = fallback_via_europepmc(pmid, dest)
                msg = f"primary={msg}; pmc={msg2}" if not ok else f"pmc-fallback OK ({msg2})"
        else:
            ok, msg = fallback_via_europepmc(pmid, dest)
            msg = f"pmc-only: {msg}"
        if ok:
            success += 1
            print(f"{i:<3} {pmid:<10} OK   {msg}")
        else:
            fail.append((pmid, author, year, doi, msg))
            print(f"{i:<3} {pmid:<10} FAIL {msg}")
        time.sleep(1.5)
    print(f"\n總計 {success}/{len(PAPERS)} 成功")
    if fail:
        print("\n失敗清單：")
        for f in fail:
            print(f"  PMID {f[0]} ({f[1]} {f[2]}) DOI={f[3]}: {f[4]}")


if __name__ == "__main__":
    main()
