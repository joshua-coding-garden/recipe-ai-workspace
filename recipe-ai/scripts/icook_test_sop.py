"""
icook_test_sop.py — iCook 食譜爬取 + 食材提取 測試 SOP

用法：
  # 在 control 容器內執行：
  docker exec recipe-control python /app/scripts/icook_test_sop.py --urls https://icook.tw/recipes/489617
  docker exec recipe-control python /app/scripts/icook_test_sop.py --urls-file /app/scripts/urls.txt
  docker exec recipe-control python /app/scripts/icook_test_sop.py --category all --max-recipes 30

  # 或本機（需 PYTHONPATH 指向 control/）：
  cd /home/aiiauser/JM/0325new/recipe-ai
  PYTHONPATH=control python scripts/icook_test_sop.py --urls https://icook.tw/recipes/489617

輸出：scripts/output/icook_test_results.json
"""
from __future__ import annotations

import argparse
import asyncio
import json
import os
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

# ── 路徑設定：讓 import app.services.* 能找到 control/ ──
_SCRIPT_DIR = Path(__file__).resolve().parent
_PROJECT_ROOT = _SCRIPT_DIR.parent
_CONTROL_DIR = _PROJECT_ROOT / "control"
if str(_CONTROL_DIR) not in sys.path:
    sys.path.insert(0, str(_CONTROL_DIR))

from app.services.ingredient_scraper import IngredientScraper  # noqa: E402
from app.services.scraper_configs import SITE_CONFIGS           # noqa: E402
from app.services.ai_service import (                           # noqa: E402
    extract_keywords,
    extract_keywords_with_amounts,
)

try:
    from bs4 import BeautifulSoup
except ImportError:
    print("ERROR: beautifulsoup4 未安裝，請 pip install beautifulsoup4")
    sys.exit(1)

# ── 輸出目錄 ────────────────────────────────────────────────────
OUTPUT_DIR = Path(os.environ.get("SOP_OUTPUT_DIR", str(_SCRIPT_DIR / "output")))
OUTPUT_FILE = OUTPUT_DIR / "icook_test_results.json"

ICOOK_CONFIG = SITE_CONFIGS["icook"]


# ── Step 1: 取得目標 URL 清單 ──────────────────────────────────
async def collect_urls(args) -> list[str]:
    """根據 CLI 參數取得要爬的 URL 清單。"""
    if args.urls:
        return args.urls

    if args.urls_file:
        p = Path(args.urls_file)
        if not p.exists():
            print(f"ERROR: 找不到 {p}")
            sys.exit(1)
        return [
            line.strip()
            for line in p.read_text().splitlines()
            if line.strip() and line.strip().startswith("http")
        ]

    # 模式 D：用 ID 範圍生成 URL（隨機取樣）
    if args.id_range:
        import random as _rand
        parts = args.id_range.split("-")
        start_id, end_id = int(parts[0]), int(parts[1])
        all_ids = list(range(start_id, end_id + 1))
        _rand.shuffle(all_ids)
        selected = all_ids[: args.max_recipes]
        urls = [f"https://icook.tw/recipes/{rid}" for rid in selected]
        print(f"從 ID 範圍 {start_id}-{end_id} 隨機取樣 {len(urls)} 個 URL")
        return urls

    # 模式 C：用爬蟲蒐集列表頁 URL
    scraper = IngredientScraper()
    try:
        urls = await scraper._collect_recipe_urls(ICOOK_CONFIG, args.max_recipes)
        print(f"從 iCook 列表頁蒐集到 {len(urls)} 個食譜 URL")
        return urls
    finally:
        await scraper.close()


# ── 快速 fetch（404/403 不 retry）────────────────────────────
async def _quick_fetch(scraper: IngredientScraper, url: str) -> str | None:
    """單次 GET，4xx 直接回傳 None 不 retry。"""
    client = await scraper._get_client()
    try:
        resp = await client.get(url)
        if resp.status_code == 200:
            return resp.text
        return None
    except Exception:
        return None


# ── Step 2: 爬取單一食譜頁面 ──────────────────────────────────
async def scrape_recipe_page(scraper: IngredientScraper, url: str) -> dict | None:
    """
    爬取單一 iCook 食譜頁面，回傳結構化資料。
    使用快速 fetch（不 retry 404），解析標題和原始食材文字。
    """
    html = await _quick_fetch(scraper, url)
    if not html:
        return None

    soup = BeautifulSoup(html, "html.parser")

    # 標題
    title_el = soup.select_one("h1.recipe-details-header-title") or soup.select_one("h1.title")
    title = title_el.get_text(strip=True) if title_el else ""
    if not title:
        title_tag = soup.find("title")
        title = title_tag.get_text(strip=True).split(" by ")[0].split(" - ")[0] if title_tag else url

    # 食材名稱 + 用量（原始文字）
    raw_lines = []
    name_els = soup.select(".ingredient-name")
    unit_els = soup.select(".ingredient-unit")

    for i, name_el in enumerate(name_els):
        name_text = name_el.get_text(strip=True)
        unit_text = unit_els[i].get_text(strip=True) if i < len(unit_els) else ""
        if name_text:
            line = f"{name_text} {unit_text}".strip()
            raw_lines.append(line)

    # 如果 CSS selector 沒抓到，嘗試從嵌入 JSON 取得
    if not raw_lines:
        import re
        m = re.search(r'"ingredients"\s*:\s*(\[[^\]]*\])', html)
        if m:
            try:
                embedded = json.loads(m.group(1))
                raw_lines = [str(x) for x in embedded if x]
            except json.JSONDecodeError:
                pass

    raw_text = "\n".join(raw_lines)

    # 步驟（可選）
    steps_el = soup.select(".recipe-details-step-text, .step-content")
    steps_text = "\n".join(el.get_text(strip=True) for el in steps_el) if steps_el else ""

    # 份量
    servings_el = soup.select_one(".servings-num, .serving-info")
    servings = servings_el.get_text(strip=True) if servings_el else ""

    return {
        "url": url,
        "title": title,
        "raw_ingredients_text": raw_text,
        "raw_ingredients_lines": raw_lines,
        "steps_text": steps_text[:500] if steps_text else "",
        "servings": servings,
    }


# ── Step 3: 食材提取 ──────────────────────────────────────────
async def extract_from_recipe(raw_text: str) -> tuple[list[dict], float]:
    """
    用現有 ai_service 提取食材關鍵字 + 用量。
    回傳 (提取結果, 耗時 ms)。
    """
    t0 = time.perf_counter()
    extracted = await extract_keywords_with_amounts(raw_text)
    elapsed_ms = (time.perf_counter() - t0) * 1000
    return extracted, elapsed_ms


# ── Step 4: 寫入記錄 ──────────────────────────────────────────
def save_result(result: dict):
    """Append 一筆結果到 JSON 檔案（以 JSON Lines 格式）。"""
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    with open(OUTPUT_FILE, "a", encoding="utf-8") as f:
        f.write(json.dumps(result, ensure_ascii=False) + "\n")


def load_all_results() -> list[dict]:
    """讀取所有結果。"""
    if not OUTPUT_FILE.exists():
        return []
    results = []
    for line in OUTPUT_FILE.read_text(encoding="utf-8").splitlines():
        if line.strip():
            results.append(json.loads(line))
    return results


# ── Step 5: 摘要統計 ──────────────────────────────────────────
def print_summary(results: list[dict], skipped: int = 0):
    """印出測試摘要。"""
    total = len(results)
    success = sum(1 for r in results if r.get("ingredient_count", 0) > 0)
    failed = total - success
    avg_count = sum(r.get("ingredient_count", 0) for r in results) / max(total, 1)
    avg_time = sum(r.get("extraction_time_ms", 0) for r in results) / max(total, 1)

    print("\n" + "=" * 60)
    print("  iCook 食譜爬取 + 提取 測試摘要")
    print("=" * 60)
    print(f"  嘗試 URL：{total + skipped}")
    print(f"  跳過（404/403）：{skipped}")
    print(f"  成功爬取：{total}")
    print(f"  成功提取：{success}")
    print(f"  提取為空：{failed}")
    print(f"  平均食材數：{avg_count:.1f}")
    print(f"  平均提取耗時：{avg_time:.1f} ms")
    print()

    if failed > 0:
        print("  提取為空的 URL：")
        for r in results:
            if r.get("ingredient_count", 0) == 0:
                print(f"    - {r.get('url')}")
    print("=" * 60)
    print(f"  結果檔案：{OUTPUT_FILE}")
    print()


# ── 主流程 ────────────────────────────────────────────────────
async def main():
    parser = argparse.ArgumentParser(description="iCook 食譜爬取 + 食材提取 測試 SOP")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--urls", nargs="+", help="直接指定食譜 URL（一或多個）")
    group.add_argument("--urls-file", help="從檔案讀取 URL（每行一個）")
    group.add_argument("--category", default=None, help="iCook 分類（用 'all' 爬全部）")
    group.add_argument("--id-range", help="食譜 ID 範圍，格式: start-end（例: 480000-490000）")
    parser.add_argument("--max-recipes", type=int, default=30, help="批量模式最大爬取數（預設 30）")
    parser.add_argument("--clean", action="store_true", help="執行前清空舊結果")
    args = parser.parse_args()

    # 清空舊結果
    if args.clean and OUTPUT_FILE.exists():
        OUTPUT_FILE.unlink()
        print("已清空舊結果")

    # Step 1: 取得 URL
    urls = await collect_urls(args)
    if not urls:
        print("ERROR: 沒有取得任何 URL")
        sys.exit(1)
    print(f"\n準備爬取 {len(urls)} 個食譜\n")

    # Step 2-4: 逐頁爬取 + 提取 + 記錄
    scraper = IngredientScraper()
    session_results = []
    skipped = 0

    try:
        for i, url in enumerate(urls):
            print(f"[{i+1}/{len(urls)}] {url} ... ", end="", flush=True)

            page_data = await scrape_recipe_page(scraper, url)
            if not page_data:
                print("SKIP")
                skipped += 1
                continue

            # Step 3: 提取
            raw_text = page_data["raw_ingredients_text"]
            extracted, elapsed_ms = await extract_from_recipe(raw_text)

            result = {
                "url": url,
                "title": page_data["title"],
                "raw_ingredients_text": raw_text,
                "raw_ingredients_lines": page_data["raw_ingredients_lines"],
                "extracted": extracted,
                "ingredient_count": len(extracted),
                "extraction_time_ms": round(elapsed_ms, 2),
                "servings": page_data.get("servings", ""),
                "scraped_at": datetime.now(timezone.utc).isoformat(),
            }

            save_result(result)
            session_results.append(result)
            print(f"OK ({page_data['title']}) → {len(extracted)} 食材, {elapsed_ms:.0f}ms")

            # 延遲（避免被封）
            if i < len(urls) - 1:
                import random
                delay = ICOOK_CONFIG.request_delay_sec + random.uniform(0, 0.5)
                await asyncio.sleep(delay)

    finally:
        await scraper.close()

    # Step 5: 摘要
    print_summary(session_results, skipped)


if __name__ == "__main__":
    asyncio.run(main())
