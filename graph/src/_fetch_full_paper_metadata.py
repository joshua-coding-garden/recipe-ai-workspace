"""從 chunks.jsonl 提取所有 PMID → PubMed E-utilities esummary 批次抓取完整元數據。

產出: graph/data/paper_metadata.json
"""
import _paths
import json
import time
import urllib.request
import urllib.parse

CHUNKS_FILE = _paths.DATA_DIR / "chunks.jsonl"
OUTPUT_FILE = _paths.DATA_DIR / "paper_metadata.json"

JOURNAL_IF = {
    "Journal of the International Society of Sports Nutrition": {"if": 4.5, "q": "Q1"},
    "J Int Soc Sports Nutr": {"if": 4.5, "q": "Q1"},
    "Sports Medicine (Auckland, N.Z.)": {"if": 9.3, "q": "Q1"},
    "Sports medicine (Auckland, N.Z.)": {"if": 9.3, "q": "Q1"},
    "British Journal of Sports Medicine": {"if": 18.4, "q": "Q1"},
    "Nutrients": {"if": 5.9, "q": "Q1"},
    "International Journal of Sport Nutrition and Exercise Metabolism": {"if": 3.8, "q": "Q2"},
    "Medicine and Science in Sports and Exercise": {"if": 4.1, "q": "Q1"},
    "Journal of Sports Sciences": {"if": 3.2, "q": "Q2"},
    "European Journal of Applied Physiology": {"if": 3.3, "q": "Q2"},
    "The American Journal of Clinical Nutrition": {"if": 7.0, "q": "Q1"},
    "American Journal of Clinical Nutrition": {"if": 7.0, "q": "Q1"},
    "Antioxidants (Basel, Switzerland)": {"if": 6.0, "q": "Q1"},
    "Antioxidants": {"if": 6.0, "q": "Q1"},
    "Journal of Athletic Training": {"if": 3.0, "q": "Q2"},
    "Applied Physiology, Nutrition, and Metabolism": {"if": 3.2, "q": "Q2"},
    "Journal of Science and Medicine in Sport": {"if": 4.8, "q": "Q1"},
    "Frontiers in Nutrition": {"if": 4.3, "q": "Q1"},
    "Frontiers in Physiology": {"if": 4.0, "q": "Q1"},
    "Frontiers in Endocrinology": {"if": 4.0, "q": "Q1"},
    "Journal of Strength and Conditioning Research": {"if": 2.8, "q": "Q2"},
    "Clinical Nutrition": {"if": 6.6, "q": "Q1"},
    "Food & Function": {"if": 5.1, "q": "Q1"},
    "Food & function": {"if": 5.1, "q": "Q1"},
    "Journal of Cachexia, Sarcopenia and Muscle": {"if": 8.9, "q": "Q1"},
    "The Journal of Nutrition": {"if": 4.2, "q": "Q1"},
    "Journal of the American College of Nutrition": {"if": 2.4, "q": "Q3"},
    "Current Sports Medicine Reports": {"if": 2.8, "q": "Q2"},
    "Scandinavian Journal of Medicine & Science in Sports": {"if": 4.1, "q": "Q1"},
    "European Journal of Sport Science": {"if": 3.5, "q": "Q2"},
    "International journal of environmental research and public health": {"if": 4.6, "q": "Q1"},
    "International Journal of Environmental Research and Public Health": {"if": 4.6, "q": "Q1"},
    "Food and chemical toxicology": {"if": 4.3, "q": "Q1"},
    "Advances in nutrition": {"if": 8.7, "q": "Q1"},
    "Advances in Nutrition": {"if": 8.7, "q": "Q1"},
    "Orthopaedic journal of sports medicine": {"if": 3.2, "q": "Q2"},
    "Orthopaedic Journal of Sports Medicine": {"if": 3.2, "q": "Q2"},
    "Journal of translational medicine": {"if": 7.4, "q": "Q1"},
    "Journal of Translational Medicine": {"if": 7.4, "q": "Q1"},
    "Journal of sport and health science": {"if": 9.7, "q": "Q1"},
    "Journal of Sport and Health Science": {"if": 9.7, "q": "Q1"},
}


def extract_pmids_from_chunks():
    docs = {}
    with open(CHUNKS_FILE) as f:
        for line in f:
            c = json.loads(line)
            did = c["doc_id"]
            if did not in docs:
                fname = c["doc_filename"]
                pmid = fname.split("_")[0]
                docs[did] = {"pmid": pmid, "filename": fname}
    return docs


def fetch_esummary_batch(pmids):
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi"
    params = {
        "db": "pubmed",
        "id": ",".join(pmids),
        "retmode": "json",
    }
    full_url = f"{url}?{urllib.parse.urlencode(params)}"
    req = urllib.request.Request(full_url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        return json.loads(resp.read().decode("utf-8"))


def lookup_if(journal_name):
    for key, val in JOURNAL_IF.items():
        if key.lower() in journal_name.lower() or journal_name.lower() in key.lower():
            return val
    return {"if": None, "q": None}


def infer_study_type(title):
    tl = title.lower()
    if "position stand" in tl or "consensus" in tl:
        return "Position Stand"
    if "meta-analysis" in tl or "meta analysis" in tl or "systematic review" in tl:
        return "Meta-analysis"
    if "randomized" in tl or "randomised" in tl or "rct" in tl:
        return "RCT"
    if "review" in tl:
        return "Review"
    return "Original Research"


def main():
    docs = extract_pmids_from_chunks()
    all_pmids = [docs[d]["pmid"] for d in sorted(docs)]
    print(f"共 {len(all_pmids)} 篇，開始從 PubMed 抓取元數據...")

    batch_size = 20
    esummary_data = {}
    for i in range(0, len(all_pmids), batch_size):
        batch = all_pmids[i:i + batch_size]
        print(f"  批次 {i // batch_size + 1}: PMIDs {batch[0]}..{batch[-1]}")
        result = fetch_esummary_batch(batch)
        if "result" in result:
            for pmid in batch:
                if pmid in result["result"]:
                    esummary_data[pmid] = result["result"][pmid]
        if i + batch_size < len(all_pmids):
            time.sleep(0.5)

    metadata = {}
    for doc_id in sorted(docs, key=lambda x: int(x.split("_")[1])):
        info = docs[doc_id]
        pmid = info["pmid"]
        fname = info["filename"]
        parts = fname.split("_")
        fallback_author = parts[1] if len(parts) > 1 else ""
        fallback_year = int(parts[2]) if len(parts) > 2 else 0
        fallback_topic = "_".join(parts[3:]) if len(parts) > 3 else ""

        es = esummary_data.get(pmid, {})
        title = es.get("title", "")
        authors_raw = es.get("authors", [])
        authors = [a.get("name", "") for a in authors_raw] if authors_raw else [fallback_author]
        journal = es.get("fulljournalname", es.get("source", ""))
        pubdate = es.get("pubdate", "")
        year = fallback_year
        if pubdate:
            try:
                year = int(pubdate.split(" ")[0].split("/")[0])
            except (ValueError, IndexError):
                pass

        doi = ""
        article_ids = es.get("articleids", [])
        for aid in article_ids:
            if aid.get("idtype") == "doi":
                doi = aid.get("value", "")
                break

        if_data = lookup_if(journal)
        study_type = infer_study_type(title)

        metadata[doc_id] = {
            "pmid": pmid,
            "title": title.rstrip("."),
            "authors": authors,
            "journal": journal,
            "year": year,
            "doi": doi,
            "topic": fallback_topic,
            "filename": fname,
            "impact_factor": if_data["if"],
            "sjr_quartile": if_data["q"],
            "study_type": study_type,
        }

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(metadata, f, ensure_ascii=False, indent=2)

    print(f"\n完成！已寫入 {OUTPUT_FILE}")
    print(f"共 {len(metadata)} 篇論文")

    no_if = [d for d, m in metadata.items() if m["impact_factor"] is None]
    if no_if:
        print(f"\n⚠ {len(no_if)} 篇缺少 IF 資料：")
        for d in no_if:
            m = metadata[d]
            print(f"  {d}: {m['journal']} — {m['title'][:60]}")


if __name__ == "__main__":
    main()
