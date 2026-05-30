"""
analyze_and_patch_dict.py — 分析 iCook 爬取結果，自動修補辭典缺漏

用法：
  docker exec recipe-control python /app/scripts/analyze_and_patch_dict.py
"""
from __future__ import annotations

import asyncio
import json
import os
import re
import sys
import time
from collections import Counter
from pathlib import Path

# ── 路徑設定：讓 import app.services.* 能找到 control/ ──
_SCRIPT_DIR = Path(__file__).resolve().parent
_PROJECT_ROOT = _SCRIPT_DIR.parent
_CONTROL_DIR = _PROJECT_ROOT / "control"
if str(_CONTROL_DIR) not in sys.path:
    sys.path.insert(0, str(_CONTROL_DIR))

from app.services.synonym_expander import SynonymExpander          # noqa: E402
from app.services.food_synonym_store import food_synonym_store      # noqa: E402

# ── 路徑設定 ──
OUTPUT_DIR = Path(os.environ.get("SOP_OUTPUT_DIR", str(_SCRIPT_DIR / "output")))
INPUT_FILE = OUTPUT_DIR / "icook_test_results.json"
REPORT_FILE = OUTPUT_DIR / "dict_patch_report.json"

# ── 分類正則 ──
_RE_UNIT_AMOUNT = re.compile(
    r"(\d+[\.\d]*\s*"
    r"(?:g|kg|ml|mL|L|cc|公克|克|公斤|大匙|小匙|茶匙|湯匙"
    r"|杯|碗|片|塊|條|根|顆|粒|瓣|把|束|包|盒|罐|瓶"
    r"|適量|少許|半|一|二|三|四|五|六|七|八|九|十"
    r"|1|2|3|4|5|6|7|8|9|0))"
)
_RE_SLASH = re.compile(r"[/／]")
_RE_COMMA_DESC = re.compile(r"[,，、]")
_RE_PURE_NAME = re.compile(r"^[\u4e00-\u9fffA-Za-z\s]+$")


def _classify_missed_reason(raw_line: str) -> str:
    """分類「遺漏食材行」的原因。"""
    # 有數字但無法被提取 → missing_unit（提取器不認識的單位）
    if re.search(r"\d", raw_line) and not _RE_UNIT_AMOUNT.search(raw_line):
        return "missing_unit"
    # 含有斜線 → slash_compound（多食材選項）
    if _RE_SLASH.search(raw_line):
        return "slash_compound"
    # 含有逗號/頓號描述
    if _RE_COMMA_DESC.search(raw_line):
        return "comma_description"
    # 純名稱無用量
    if _RE_PURE_NAME.match(raw_line.strip()):
        return "pure_name_no_amount"
    return "other"


def _extract_food_name(raw_line: str) -> str:
    """從原始行中提取食材名稱（去除用量部分）。"""
    line = raw_line.strip()
    # 去除尾端的量詞/數量描述
    # 例如 "米粉 2綑" → "米粉"
    # 例如 "雞蛋 3顆" → "雞蛋"
    parts = re.split(
        r"\s+(?:\d|半|一|二|三|四|五|六|七|八|九|十|適量|少許)",
        line,
        maxsplit=1,
    )
    name = parts[0].strip()

    # 去除品牌名（常見模式：品牌 + 產品）
    # 例如 "李錦記舊庄特級蠔油" → 保留原樣（品牌食材名稱本身就是有效名稱）

    # 去除括號內容
    name = re.sub(r"[（(][^）)]*[）)]", "", name).strip()

    return name


def _load_results() -> list[dict]:
    """讀取 iCook 測試結果（JSON Lines 格式）。"""
    if not INPUT_FILE.exists():
        print(f"ERROR: 找不到結果檔案 {INPUT_FILE}")
        sys.exit(1)

    results = []
    for line in INPUT_FILE.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if line:
            try:
                results.append(json.loads(line))
            except json.JSONDecodeError:
                continue
    return results


async def main():
    print("=" * 60)
    print("  analyze_and_patch_dict.py")
    print("  分析 iCook 爬取結果，修補辭典缺漏")
    print("=" * 60)

    # Step 1: 讀取結果
    results = _load_results()
    print(f"\n  讀取 {len(results)} 筆食譜結果\n")

    # Step 2: 找出遺漏的食材行
    missed_lines: list[dict] = []
    reason_counter: Counter = Counter()
    missed_names: dict[str, dict] = {}  # name → {reason, count, examples}

    for recipe in results:
        raw_lines = recipe.get("raw_ingredients_lines", [])
        extracted = recipe.get("extracted", [])

        # 建立已提取名稱的集合
        extracted_names = set()
        for item in extracted:
            name = item.get("name", "").strip()
            if name:
                extracted_names.add(name)

        # 比對每個原始行
        for raw_line in raw_lines:
            raw_line = raw_line.strip()
            if not raw_line:
                continue

            # 檢查此行是否有對應的提取結果
            matched = False
            food_name = _extract_food_name(raw_line)

            for ext_name in extracted_names:
                # 子字串匹配（提取結果可能包含或被包含於原始名稱）
                if (food_name in ext_name or ext_name in food_name
                        or food_name == ext_name):
                    matched = True
                    break

            if not matched and food_name:
                reason = _classify_missed_reason(raw_line)
                reason_counter[reason] += 1

                missed_lines.append({
                    "raw_line": raw_line,
                    "food_name": food_name,
                    "reason": reason,
                    "recipe_title": recipe.get("title", ""),
                    "recipe_url": recipe.get("url", ""),
                })

                # 彙整唯一名稱
                if food_name not in missed_names:
                    missed_names[food_name] = {
                        "reason": reason,
                        "count": 0,
                        "examples": [],
                    }
                missed_names[food_name]["count"] += 1
                if len(missed_names[food_name]["examples"]) < 3:
                    missed_names[food_name]["examples"].append(raw_line)

    print(f"  遺漏食材行總數：{len(missed_lines)}")
    print(f"  唯一食材名稱數：{len(missed_names)}")
    print()
    print("  分類統計：")
    for reason, count in reason_counter.most_common():
        print(f"    {reason}: {count}")
    print()

    # Step 3: 修補辭典
    expander = SynonymExpander()
    patched_count = 0
    already_exists_count = 0
    patch_errors = 0
    unresolvable: list[dict] = []
    t_start = time.monotonic()

    unique_names = sorted(missed_names.keys())
    total = len(unique_names)

    for i, name in enumerate(unique_names):
        info = missed_names[name]

        # 跳過太短或明顯非食材的名稱
        if len(name) < 2:
            unresolvable.append({"name": name, "reason": "too_short", **info})
            continue

        # 跳過包含非食材關鍵字的行
        skip_keywords = {"主鍋", "刀頭", "烤箱", "鍋子", "工具", "容器", "模具"}
        if any(kw in name for kw in skip_keywords):
            unresolvable.append({"name": name, "reason": "not_food", **info})
            continue

        # 檢查是否已在辭典中
        existing = food_synonym_store.lookup_synonym(name)
        if existing:
            already_exists_count += 1
            continue

        # 擴展同義詞並加入辭典
        try:
            result = await expander.expand(name)
            food_synonym_store.merge_expanded(result)
            patched_count += 1
        except Exception as e:
            patch_errors += 1
            unresolvable.append({
                "name": name,
                "reason": f"expand_error: {e}",
                **info,
            })

        # 進度
        if (i + 1) % 20 == 0 or (i + 1) == total:
            print(f"  [{i+1}/{total}] 修補={patched_count} "
                  f"已存在={already_exists_count} 錯誤={patch_errors}")

        await asyncio.sleep(0.3)

    elapsed = time.monotonic() - t_start

    # Step 4: 生成報告
    report = {
        "input_file": str(INPUT_FILE),
        "total_recipes": len(results),
        "total_missed_lines": len(missed_lines),
        "unique_missed_names": len(missed_names),
        "missed_by_category": dict(reason_counter.most_common()),
        "patched_new_synonyms": patched_count,
        "already_in_dict": already_exists_count,
        "patch_errors": patch_errors,
        "unresolvable": unresolvable,
        "elapsed_seconds": round(elapsed, 1),
        "dict_stats": food_synonym_store.stats(),
    }

    REPORT_FILE.parent.mkdir(parents=True, exist_ok=True)
    REPORT_FILE.write_text(
        json.dumps(report, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    # Step 5: 最終統計
    stats = food_synonym_store.stats()
    print("\n" + "=" * 60)
    print("  辭典修補完成")
    print("=" * 60)
    print(f"  食譜數：{len(results)}")
    print(f"  遺漏食材行：{len(missed_lines)}")
    print(f"  唯一食材名稱：{len(missed_names)}")
    print()
    print("  遺漏分類：")
    for reason, count in reason_counter.most_common():
        print(f"    {reason}: {count}")
    print()
    print(f"  新增辭典條目：{patched_count}")
    print(f"  已存在辭典：{already_exists_count}")
    print(f"  修補錯誤：{patch_errors}")
    print(f"  無法處理（需人工）：{len(unresolvable)}")
    print(f"  耗時：{elapsed:.1f}s")
    print()
    print(f"  辭典統計：")
    print(f"    總條目數：{stats['total_entries']}")
    print(f"    中文條目：{stats['zh_entries']}")
    print(f"    英文條目：{stats['en_entries']}")
    print(f"    同義詞總數：{stats['total_synonyms']}")
    print()
    print(f"  報告檔案：{REPORT_FILE}")

    if unresolvable:
        print(f"\n  需人工檢視的項目（共 {len(unresolvable)} 筆）：")
        for item in unresolvable[:20]:
            print(f"    - {item['name']} ({item['reason']})")
        if len(unresolvable) > 20:
            print(f"    ...（還有 {len(unresolvable) - 20} 筆，詳見報告）")
    print("=" * 60)


if __name__ == "__main__":
    asyncio.run(main())
