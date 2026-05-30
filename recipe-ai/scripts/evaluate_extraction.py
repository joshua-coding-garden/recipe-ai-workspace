"""
evaluate_extraction.py — 食材提取準確度評估

比對 Claude GT vs Regex Only vs Regex+AI，計算 P/R/F1（name 和 amount 分開）。

用法：
  python scripts/evaluate_extraction.py

輸入：
  scripts/output/claude_ground_truth.jsonl  — Claude 標註的正確答案
  scripts/output/extraction_results.jsonl   — 系統提取結果

輸出：
  scripts/output/evaluation_results.jsonl   — 每筆明細
  scripts/output/evaluation_summary.json    — 總體指標
  scripts/output/evaluation_table.csv       — 論文用表格
"""
from __future__ import annotations

import csv
import json
import re
from collections import Counter
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = SCRIPT_DIR / "output"

GT_FILE = OUTPUT_DIR / "claude_ground_truth.jsonl"
EXTRACTION_FILE = OUTPUT_DIR / "extraction_results.jsonl"
AI_FILE = OUTPUT_DIR / "extraction_results_ai.jsonl"
CORPUS_FILE = OUTPUT_DIR / "corpus_clean.jsonl"

RESULTS_FILE = OUTPUT_DIR / "evaluation_results.jsonl"
SUMMARY_FILE = OUTPUT_DIR / "evaluation_summary.json"
TABLE_FILE = OUTPUT_DIR / "evaluation_table.csv"

# ── 正規化匹配 ──────────────────────────────────────────────────

_CUTTING_SUFFIXES = re.compile(r"(切)?(絲|片|塊|丁|末|段|粒|條|碎|花|圈|角|瓣|半)$")


def normalize_name(name: str) -> str:
    n = name.strip()
    n = _CUTTING_SUFFIXES.sub("", n)
    n = n.strip()
    return n


def names_match(a: str, b: str) -> bool:
    na = normalize_name(a)
    nb = normalize_name(b)
    if not na or not nb:
        return False
    if na == nb:
        return True
    if na in nb or nb in na:
        return True
    return False


# ── 單筆評估 ────────────────────────────────────────────────────

def evaluate_one(
    gt_items: list[dict],
    sys_items: list[dict],
    website_gt_items: list[dict] | None = None,
) -> dict:
    """
    比對一筆食譜的 GT vs 系統提取。

    Returns:
        {
            "name_tp": int, "name_fp": int, "name_fn": int,
            "name_precision": float, "name_recall": float, "name_f1": float,
            "amount_correct": int, "amount_total": int, "amount_accuracy": float,
            "additional_discoveries": list[str],  # 系統發現但網站 GT 沒有的
            "matched_pairs": list[dict],  # TP 配對明細
            "fp_items": list[str],  # 系統多抓的
            "fn_items": list[str],  # GT 有但系統沒抓的
        }
    """
    gt_names = [g["name"] for g in gt_items]
    sys_names = [s["name"] for s in sys_items]

    # Greedy matching: 對每個 sys_item 找最佳 GT match
    gt_matched = [False] * len(gt_items)
    sys_matched = [False] * len(sys_items)
    matched_pairs = []

    for si, sname in enumerate(sys_names):
        for gi, gname in enumerate(gt_names):
            if not gt_matched[gi] and names_match(sname, gname):
                gt_matched[gi] = True
                sys_matched[si] = True
                # Amount comparison
                gt_amount = gt_items[gi].get("amount", "")
                sys_amount = sys_items[si].get("amount", "")
                matched_pairs.append({
                    "gt_name": gname,
                    "sys_name": sname,
                    "gt_amount": gt_amount,
                    "sys_amount": sys_amount,
                    "amount_match": gt_amount.strip() == sys_amount.strip(),
                })
                break

    tp = len(matched_pairs)
    fp = sum(1 for m in sys_matched if not m)
    fn = sum(1 for m in gt_matched if not m)

    precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0.0
    f1 = 2 * precision * recall / (precision + recall) if (precision + recall) > 0 else 0.0

    amount_correct = sum(1 for p in matched_pairs if p["amount_match"])
    amount_total = tp
    amount_accuracy = amount_correct / amount_total if amount_total > 0 else 0.0

    fp_items = [sys_names[i] for i, m in enumerate(sys_matched) if not m]
    fn_items = [gt_names[i] for i, m in enumerate(gt_matched) if not m]

    # Additional discoveries: FP items that are actually valid
    # (found by system but not in website GT)
    additional_discoveries = []
    if website_gt_items is not None:
        website_names = [w["name"] for w in website_gt_items]
        for sname in fp_items:
            # Check if this FP is actually in claude GT but not website GT
            in_claude_gt = any(names_match(sname, gn) for gn in gt_names)
            in_website_gt = any(names_match(sname, wn) for wn in website_names)
            if not in_website_gt:
                additional_discoveries.append(sname)

    return {
        "name_tp": tp,
        "name_fp": fp,
        "name_fn": fn,
        "name_precision": round(precision, 4),
        "name_recall": round(recall, 4),
        "name_f1": round(f1, 4),
        "amount_correct": amount_correct,
        "amount_total": amount_total,
        "amount_accuracy": round(amount_accuracy, 4),
        "additional_discoveries": additional_discoveries,
        "matched_pairs": matched_pairs,
        "fp_items": fp_items,
        "fn_items": fn_items,
    }


# ── 主流程 ──────────────────────────────────────────────────────

def main():
    # 載入資料
    gt_by_url: dict[str, list[dict]] = {}
    with open(GT_FILE, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                gt_by_url[r["url"]] = r["claude_ground_truth"]

    extraction_by_url: dict[str, dict] = {}
    with open(EXTRACTION_FILE, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                extraction_by_url[r["url"]] = r

    if AI_FILE.exists():
        ai_merged = 0
        with open(AI_FILE, "r", encoding="utf-8") as f:
            for line in f:
                if line.strip():
                    r = json.loads(line)
                    url = r["url"]
                    if url in extraction_by_url:
                        extraction_by_url[url]["regex_plus_ai"] = r.get("regex_plus_ai", [])
                        extraction_by_url[url]["corrections"] = r.get("corrections", [])
                        extraction_by_url[url]["gemma_available"] = r.get("gemma_available", False)
                        ai_merged += 1
                    else:
                        extraction_by_url[url] = r
                        ai_merged += 1
        print(f"AI results merged: {ai_merged} from {AI_FILE.name}")

    corpus_by_url: dict[str, dict] = {}
    with open(CORPUS_FILE, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                corpus_by_url[r["url"]] = r

    # 找共同 URL
    common_urls = set(gt_by_url.keys()) & set(extraction_by_url.keys())
    print(f"GT: {len(gt_by_url)}, Extraction: {len(extraction_by_url)}, Common: {len(common_urls)}")

    # 逐筆評估
    results = []
    # Aggregate counters
    agg = {
        "regex": {"tp": 0, "fp": 0, "fn": 0, "amt_correct": 0, "amt_total": 0,
                  "precisions": [], "recalls": [], "f1s": [], "amt_accs": []},
        "ai": {"tp": 0, "fp": 0, "fn": 0, "amt_correct": 0, "amt_total": 0,
               "precisions": [], "recalls": [], "f1s": [], "amt_accs": []},
    }
    all_additional_discoveries = Counter()

    for url in sorted(common_urls):
        gt_items = gt_by_url[url]
        ext = extraction_by_url[url]
        corpus = corpus_by_url.get(url, {})
        website_gt = corpus.get("ground_truth_ingredients", [])

        regex_items = ext.get("regex_only", [])
        ai_items = ext.get("regex_plus_ai", [])

        eval_regex = evaluate_one(gt_items, regex_items, website_gt)
        eval_ai = evaluate_one(gt_items, ai_items, website_gt)

        record = {
            "url": url,
            "title": ext.get("title", ""),
            "gt_count": len(gt_items),
            "regex_only": eval_regex,
            "regex_plus_ai": eval_ai,
            "gemma_available": ext.get("gemma_available", False),
        }
        results.append(record)

        # Accumulate
        for key, ev in [("regex", eval_regex), ("ai", eval_ai)]:
            a = agg[key]
            a["tp"] += ev["name_tp"]
            a["fp"] += ev["name_fp"]
            a["fn"] += ev["name_fn"]
            a["amt_correct"] += ev["amount_correct"]
            a["amt_total"] += ev["amount_total"]
            a["precisions"].append(ev["name_precision"])
            a["recalls"].append(ev["name_recall"])
            a["f1s"].append(ev["name_f1"])
            a["amt_accs"].append(ev["amount_accuracy"])

        for disc in eval_ai.get("additional_discoveries", []):
            all_additional_discoveries[disc] += 1

    # 寫 evaluation_results.jsonl
    with open(RESULTS_FILE, "w", encoding="utf-8") as f:
        for r in results:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")
    print(f"Results: {RESULTS_FILE} ({len(results)} records)")

    # 計算 summary
    n = len(results)

    def calc_summary(a: dict) -> dict:
        micro_p = a["tp"] / (a["tp"] + a["fp"]) if (a["tp"] + a["fp"]) > 0 else 0
        micro_r = a["tp"] / (a["tp"] + a["fn"]) if (a["tp"] + a["fn"]) > 0 else 0
        micro_f1 = 2 * micro_p * micro_r / (micro_p + micro_r) if (micro_p + micro_r) > 0 else 0
        macro_p = sum(a["precisions"]) / n if n > 0 else 0
        macro_r = sum(a["recalls"]) / n if n > 0 else 0
        macro_f1 = sum(a["f1s"]) / n if n > 0 else 0
        amt_acc = a["amt_correct"] / a["amt_total"] if a["amt_total"] > 0 else 0
        return {
            "micro_precision": round(micro_p, 4),
            "micro_recall": round(micro_r, 4),
            "micro_f1": round(micro_f1, 4),
            "macro_precision": round(macro_p, 4),
            "macro_recall": round(macro_r, 4),
            "macro_f1": round(macro_f1, 4),
            "amount_accuracy": round(amt_acc, 4),
            "total_tp": a["tp"],
            "total_fp": a["fp"],
            "total_fn": a["fn"],
        }

    summary = {
        "total_recipes": n,
        "regex_only": calc_summary(agg["regex"]),
        "regex_plus_ai": calc_summary(agg["ai"]),
        "additional_discoveries": {
            "total_count": sum(all_additional_discoveries.values()),
            "unique_count": len(all_additional_discoveries),
            "top_20": all_additional_discoveries.most_common(20),
        },
    }

    with open(SUMMARY_FILE, "w", encoding="utf-8") as f:
        json.dump(summary, f, ensure_ascii=False, indent=2)
    print(f"Summary: {SUMMARY_FILE}")

    # 寫 CSV 表格
    with open(TABLE_FILE, "w", encoding="utf-8", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Metric", "Regex Only", "Regex + AI"])
        for metric in ["micro_precision", "micro_recall", "micro_f1",
                        "macro_precision", "macro_recall", "macro_f1",
                        "amount_accuracy"]:
            w.writerow([
                metric,
                summary["regex_only"][metric],
                summary["regex_plus_ai"][metric],
            ])
        w.writerow([
            "additional_discoveries",
            "-",
            summary["additional_discoveries"]["total_count"],
        ])
    print(f"Table: {TABLE_FILE}")

    # 印出摘要
    print(f"\n{'='*60}")
    print(f"  食材提取準確度評估（{n} 筆食譜）")
    print(f"{'='*60}")
    for label, key in [("Regex Only", "regex_only"), ("Regex + AI", "regex_plus_ai")]:
        s = summary[key]
        print(f"\n  {label}:")
        print(f"    Micro  P={s['micro_precision']:.4f}  R={s['micro_recall']:.4f}  F1={s['micro_f1']:.4f}")
        print(f"    Macro  P={s['macro_precision']:.4f}  R={s['macro_recall']:.4f}  F1={s['macro_f1']:.4f}")
        print(f"    Amount Accuracy={s['amount_accuracy']:.4f}")
    disc = summary["additional_discoveries"]
    print(f"\n  額外有效食材發現：{disc['total_count']} 筆（{disc['unique_count']} 種）")
    if disc["top_20"]:
        print(f"    前 10：{', '.join(f'{name}({cnt})' for name, cnt in disc['top_20'][:10])}")
    print(f"{'='*60}\n")


if __name__ == "__main__":
    main()
