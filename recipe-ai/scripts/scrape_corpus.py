"""
scrape_corpus.py — 5000 筆中文食譜雜訊文本語料庫爬蟲

用途：為論文收集「完整文章式」食譜文本 + 結構化食材 ground truth，
      用來評估食材提取 pipeline 的 precision / recall / F1。

用法：
  # 本機直接跑（需 httpx + bs4）：
  cd /home/aiiauser/JM/0325new/recipe-ai
  python scripts/scrape_corpus.py --site both

  # 只跑 iCook / 只跑 ytower：
  python scripts/scrape_corpus.py --site icook --max 3500
  python scripts/scrape_corpus.py --site ytower --max 2000

  # 斷點續跑（讀取已有 JSONL 跳過已爬 URL）：
  python scripts/scrape_corpus.py --site both --resume

輸出：scripts/output/corpus_icook.jsonl
      scripts/output/corpus_ytower.jsonl
      scripts/output/corpus_all.jsonl（合併）
      scripts/output/corpus_stats.json（統計）
"""
from __future__ import annotations

import argparse
import asyncio
import json
import os
import random
import re
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

try:
    import httpx
except ImportError:
    print("ERROR: httpx 未安裝，pip install httpx")
    sys.exit(1)

try:
    from bs4 import BeautifulSoup
except ImportError:
    print("ERROR: beautifulsoup4 未安裝，pip install beautifulsoup4")
    sys.exit(1)

# ── 路徑 ──────────────────────────────────────────────────────────
SCRIPT_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = Path(os.environ.get("CORPUS_OUTPUT_DIR", str(SCRIPT_DIR / "output")))

ICOOK_OUTPUT = OUTPUT_DIR / "corpus_icook.jsonl"
YTOWER_OUTPUT = OUTPUT_DIR / "corpus_ytower.jsonl"
ALL_OUTPUT = OUTPUT_DIR / "corpus_all.jsonl"
STATS_OUTPUT = OUTPUT_DIR / "corpus_stats.json"

USER_AGENTS = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15",
    "Mozilla/5.0 (X11; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0",
]

# ── 共用工具 ──────────────────────────────────────────────────────

def load_existing_urls(path: Path) -> set[str]:
    """讀取已有 JSONL，回傳 URL set（用於 resume）。"""
    urls: set[str] = set()
    if not path.exists():
        return urls
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.strip():
            try:
                urls.add(json.loads(line)["url"])
            except (json.JSONDecodeError, KeyError):
                pass
    return urls


def append_jsonl(path: Path, record: dict):
    """Append 一筆 JSON 到檔案。"""
    with open(path, "a", encoding="utf-8") as f:
        f.write(json.dumps(record, ensure_ascii=False) + "\n")


def split_ingredient_text(raw: str) -> dict:
    """把 '雞蛋 3顆' 拆成 {name, amount}。"""
    text = re.sub(r"^\[.*?\]\s*", "", raw).strip()
    m = re.search(
        r"[\d½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅛⅜⅝⅞]"
        r"|(?:適量|少許|些許|一些|若干|半|數|幾)"
        r"|(?:一|二|三|四|五|六|七|八|九|十|兩)\s*(?:大匙|小匙|匙|湯匙|茶匙|杯|碗|把|束|片|塊|顆|粒|根|條|支|瓣|包|袋|罐|盒|瓶|段|朵|斤|兩|份|人份|鍋|壺|撮|撈|隻)",
        text,
    )
    if m:
        name = text[: m.start()].strip()
        amount = text[m.start() :].strip()
        if name:
            return {"name": name, "amount": amount}
    return {"name": text, "amount": ""}


# ── iCook 爬蟲 ────────────────────────────────────────────────────

def _find_recipe_in_json(obj):
    """遞迴搜尋 JSON 結構中的 @type=Recipe 物件。"""
    if isinstance(obj, dict):
        if obj.get("@type") == "Recipe":
            return obj
        for v in obj.values():
            r = _find_recipe_in_json(v)
            if r:
                return r
    elif isinstance(obj, list):
        for item in obj:
            r = _find_recipe_in_json(item)
            if r:
                return r
    return None


def extract_jsonld_recipe(html: str) -> dict | None:
    """從 HTML 抽取 schema.org/Recipe JSON-LD（遞迴搜尋嵌套結構）。"""
    for m in re.finditer(r"<script[^>]*type=[\"']application/ld\+json[\"'][^>]*>", html):
        start = m.end()
        end = html.find("</script>", start)
        if end == -1:
            continue
        blob = html[start:end].strip()
        try:
            data = json.loads(blob)
        except json.JSONDecodeError:
            continue
        recipe = _find_recipe_in_json(data)
        if recipe:
            return recipe
    return None


async def scrape_icook_page(client: httpx.AsyncClient, url: str) -> dict | None:
    """爬取單一 iCook 食譜頁，回傳標準 record 或 None。"""
    try:
        resp = await client.get(url)
        if resp.status_code != 200:
            return None
        html = resp.text
    except Exception:
        return None

    soup = BeautifulSoup(html, "html.parser")

    # JSON-LD 優先
    recipe_ld = extract_jsonld_recipe(html)

    # 標題
    title = ""
    if recipe_ld:
        title = recipe_ld.get("name", "")
    if not title:
        el = soup.select_one("h1.recipe-details-header-title") or soup.select_one("h1.title")
        title = el.get_text(strip=True) if el else ""
    if not title:
        tag = soup.find("title")
        title = tag.get_text(strip=True).split(" by ")[0].split(" - ")[0] if tag else ""
    if not title:
        return None

    # 描述
    description = ""
    if recipe_ld:
        description = recipe_ld.get("description", "")
    if not description:
        meta = soup.select_one("meta[name='description']")
        description = meta["content"] if meta and meta.get("content") else ""

    # 食材 ground truth
    gt_ingredients: list[dict] = []
    raw_ingredient_lines: list[str] = []
    if recipe_ld and "recipeIngredient" in recipe_ld:
        for item in recipe_ld["recipeIngredient"]:
            raw_ingredient_lines.append(str(item))
            gt_ingredients.append(split_ingredient_text(str(item)))
    else:
        name_els = soup.select(".ingredient-name")
        unit_els = soup.select(".ingredient-unit")
        for i, name_el in enumerate(name_els):
            n = name_el.get_text(strip=True)
            a = unit_els[i].get_text(strip=True) if i < len(unit_els) else ""
            if n:
                raw_ingredient_lines.append(f"{n} {a}".strip())
                gt_ingredients.append({"name": n, "amount": a})

    if not gt_ingredients:
        return None

    # 作法步驟
    steps_parts: list[str] = []
    if recipe_ld and "recipeInstructions" in recipe_ld:
        for i, step in enumerate(recipe_ld["recipeInstructions"], 1):
            text = step.get("text", "") if isinstance(step, dict) else str(step)
            if text:
                steps_parts.append(f"{i}. {text}")
    else:
        for i, el in enumerate(
            soup.select(".recipe-details-step-text, .step-content, .recipe-step-description-content"),
            1,
        ):
            t = el.get_text(strip=True)
            if t:
                steps_parts.append(f"{i}. {t}")

    steps_text = "\n".join(steps_parts)

    # 小撇步
    tip = ""
    tip_el = soup.select_one("blockquote.recipe-details-tip, .recipe-tip")
    if tip_el:
        tip = tip_el.get_text(strip=True)

    # 組合 full_text（模擬真實文章雜訊）
    sections = [title]
    if description:
        sections.append(description)
    sections.append("食材：\n" + "\n".join(raw_ingredient_lines))
    if steps_text:
        sections.append("作法：\n" + steps_text)
    if tip:
        sections.append("小撇步：\n" + tip)

    full_text = "\n\n".join(sections)

    return {
        "source": "icook",
        "url": url,
        "title": title,
        "full_text": full_text,
        "ground_truth_ingredients": gt_ingredients,
        "scraped_at": datetime.now(timezone.utc).isoformat(),
    }


async def run_icook(
    max_recipes: int,
    delay: float,
    concurrency: int,
    skip_urls: set[str],
    old_results_file: Path | None,
):
    """執行 iCook 爬蟲。"""
    # 收集 URL：舊檔 re-crawl + 新 ID 隨機取樣
    urls: list[str] = []

    # 1) 從舊 JSONL 取已知有效的 URL
    if old_results_file and old_results_file.exists():
        for line in old_results_file.read_text(encoding="utf-8").splitlines():
            if line.strip():
                try:
                    urls.append(json.loads(line)["url"])
                except (json.JSONDecodeError, KeyError):
                    pass
        print(f"[iCook] 從舊檔載入 {len(urls)} 個已知 URL")

    existing_ids = set()
    for u in urls:
        m = re.search(r"/recipes/(\d+)", u)
        if m:
            existing_ids.add(int(m.group(1)))

    # 2) 新 ID 範圍隨機取樣（避開已有的）
    need_new = max(0, max_recipes - len(urls))
    if need_new > 0:
        candidates = []
        # 400000-500000 成功率 ~80%，200000-399999 ~50%
        for rid in range(400000, 500000):
            if rid not in existing_ids:
                candidates.append(rid)
        for rid in range(200000, 400000):
            if rid not in existing_ids:
                candidates.append(rid)
        random.shuffle(candidates)
        attempt_count = min(len(candidates), int(need_new * 1.5))
        new_urls = [f"https://icook.tw/recipes/{rid}" for rid in candidates[:attempt_count]]
        urls.extend(new_urls)
        print(f"[iCook] 新增 {len(new_urls)} 個隨機 ID URL")

    # 過濾 resume 已有的
    urls = [u for u in urls if u not in skip_urls]
    print(f"[iCook] 待爬取 {len(urls)} 個 URL（目標 {max_recipes} 筆）")

    client = httpx.AsyncClient(
        headers={
            "User-Agent": random.choice(USER_AGENTS),
            "Accept": "text/html,application/xhtml+xml",
            "Accept-Language": "zh-TW,zh;q=0.9,en;q=0.8",
        },
        follow_redirects=True,
        timeout=httpx.Timeout(20.0),
    )

    sem = asyncio.Semaphore(concurrency)
    success = 0
    fail = 0
    t0 = time.time()

    async def _task(i: int, url: str):
        nonlocal success, fail
        if success >= max_recipes:
            return
        async with sem:
            record = await scrape_icook_page(client, url)
            jitter = delay + random.uniform(0, 0.5)
            await asyncio.sleep(jitter)

        if record and success < max_recipes:
            append_jsonl(ICOOK_OUTPUT, record)
            success += 1
            if success % 50 == 0 or success <= 5:
                elapsed = time.time() - t0
                rate = success / elapsed * 3600
                print(f"  [iCook] {success}/{max_recipes} 完成 "
                      f"({fail} 失敗, {rate:.0f}/hr, "
                      f"已耗時 {elapsed/60:.1f} 分)")
        else:
            fail += 1

    # 分批送出，避免一次建太多 task
    batch_size = concurrency * 10
    for batch_start in range(0, len(urls), batch_size):
        if success >= max_recipes:
            break
        batch = urls[batch_start : batch_start + batch_size]
        tasks = [_task(batch_start + i, url) for i, url in enumerate(batch)]
        await asyncio.gather(*tasks)

    await client.aclose()
    elapsed = time.time() - t0
    print(f"[iCook] 完成！{success} 筆成功, {fail} 筆失敗, 耗時 {elapsed/60:.1f} 分鐘")
    return success


# ── 楊桃美食網爬蟲 ────────────────────────────────────────────────

YTOWER_CATEGORIES = {
    "中式": "%A4%A4%A4%A4%B6%F1%AE%AE%AE%C" + "F",  # will be built properly below
}

# Big5 percent-encoded category names for ytower
YTOWER_CATEGORY_PARAMS = [
    ("中式", "%A4%A4%A4%A4%B6%F6%AE%AE%AE%C6"),
    ("日式", "%A4%E9%A4%A4%AE%AE%AE%C6"),
    ("西式", "%A6%B6%A4%A4%AE%AE%AE%C6"),
    ("韓式", "%C1%F韓%AE%C6"),  # placeholder, will be built dynamically
    ("南洋", "%ABn%AC%F洋%AE%C6"),
    ("其他", "%A8%E4%A%A他"),
]


async def collect_ytower_urls(client: httpx.AsyncClient) -> list[str]:
    """從楊桃美食網收集食譜 URL（列表頁 + prefix 範圍掃描）。"""
    all_seqs: set[str] = set()

    # 1) 列表頁取已知 seq
    try:
        resp = await client.get("https://www.ytower.com.tw/recipe/recipe-search.asp")
        if resp.status_code == 200:
            html = resp.content.decode("big5", errors="replace")
            seqs = set(re.findall(r"iframe-recipe\.asp\?seq=([A-Z0-9\-]+)", html))
            all_seqs.update(seqs)
            print(f"  [ytower] 列表頁: {len(seqs)} 筆")
    except Exception as e:
        print(f"  [ytower] 列表頁失敗: {e}")

    # 2) 用已知 prefix + 號碼範圍生成候選（實測確認的範圍）
    prefix_ranges = {
        "A01": 1500, "A02": 4000, "A03": 2800, "A04": 200, "A05": 100,
        "B01": 2200, "B02": 400, "B03": 1400, "B04": 800,
        "C01": 1200, "D01": 200,
        "E01": 300, "F01": 2000, "F02": 1200, "F03": 100,
        "F04": 1200, "F05": 600, "F06": 700, "F07": 1000, "F08": 50,
        "G01": 200, "G02": 300, "H02": 100, "H03": 50,
        "I01": 200, "I02": 100, "I03": 200,
    }
    for prefix, max_num in prefix_ranges.items():
        for num in range(1, max_num + 1):
            all_seqs.add(f"{prefix}-{num:04d}")

    urls = [
        f"https://www.ytower.com.tw/recipe/iframe-recipe.asp?seq={seq}"
        for seq in sorted(all_seqs)
    ]
    print(f"[ytower] 共收集 {len(all_seqs)} 個候選 URL")
    return urls


async def scrape_ytower_page(client: httpx.AsyncClient, url: str) -> dict | None:
    """爬取單一楊桃美食網食譜頁。"""
    try:
        resp = await client.get(url)
        if resp.status_code != 200:
            return None
        try:
            html = resp.content.decode("big5", errors="replace")
        except Exception:
            html = resp.text
    except Exception:
        return None

    soup = BeautifulSoup(html, "html.parser")

    # 標題
    title_el = soup.select_one("#recipe_name h2 a") or soup.select_one("#recipe_name h2")
    if not title_el:
        title_el = soup.select_one("h2")
    title = title_el.get_text(strip=True) if title_el else ""
    if not title or len(title) < 2:
        return None

    # 食材
    gt_ingredients: list[dict] = []
    raw_ingredient_lines: list[str] = []
    section_headers: list[str] = []

    ingredient_lis = soup.select("ul.ingredient li")
    for li in ingredient_lis:
        text = li.get_text(strip=True)
        # 區段標題（【材料】【調味料】等）
        if text.startswith("【") or text.startswith("["):
            section_headers.append(text)
            raw_ingredient_lines.append(text)
            continue

        name_el = li.select_one("span.ingredient_name")
        amount_el = li.select_one("span.ingredient_amount")

        if name_el:
            # 名字可能在內層 <a> 裡
            a_el = name_el.select_one("a")
            name = (a_el or name_el).get_text(strip=True)
            amount = amount_el.get_text(strip=True) if amount_el else ""
            if name:
                gt_ingredients.append({"name": name, "amount": amount})
                raw_ingredient_lines.append(f"{name} {amount}".strip())
        elif text and not text.startswith("【"):
            # fallback: 整行當食材
            raw_ingredient_lines.append(text)
            gt_ingredients.append(split_ingredient_text(text))

    if not gt_ingredients:
        return None

    # 作法步驟
    steps_parts: list[str] = []
    for i, el in enumerate(soup.select("li.step"), 1):
        t = el.get_text(separator=" ", strip=True)
        if t:
            steps_parts.append(f"{i}. {t}")
    steps_text = "\n".join(steps_parts)

    # 組合 full_text
    sections = [title]
    ingredient_section = "\n".join(raw_ingredient_lines)
    sections.append("食材：\n" + ingredient_section)
    if steps_text:
        sections.append("作法：\n" + steps_text)

    full_text = "\n\n".join(sections)

    return {
        "source": "ytower",
        "url": url,
        "title": title,
        "full_text": full_text,
        "ground_truth_ingredients": gt_ingredients,
        "scraped_at": datetime.now(timezone.utc).isoformat(),
    }


async def run_ytower(
    max_recipes: int,
    delay: float,
    concurrency: int,
    skip_urls: set[str],
):
    """執行楊桃美食網爬蟲。"""
    client = httpx.AsyncClient(
        headers={
            "User-Agent": random.choice(USER_AGENTS),
            "Accept": "text/html,application/xhtml+xml",
            "Accept-Language": "zh-TW,zh;q=0.9",
        },
        follow_redirects=True,
        timeout=httpx.Timeout(20.0),
    )

    print("[ytower] 收集食譜 URL...")
    all_urls = await collect_ytower_urls(client)
    random.shuffle(all_urls)

    # 過濾 resume
    urls = [u for u in all_urls if u not in skip_urls]
    # 取足夠多的嘗試量
    attempt_count = min(len(urls), int(max_recipes * 1.5))
    urls = urls[:attempt_count]
    print(f"[ytower] 待爬取 {len(urls)} 個 URL（目標 {max_recipes} 筆）")

    # 先驗證 5 筆
    print("[ytower] 驗證 selector（前 5 筆）...")
    probe_ok = 0
    for probe_url in urls[:5]:
        r = await scrape_ytower_page(client, probe_url)
        if r:
            probe_ok += 1
            print(f"  ✓ {r['title']} ({len(r['ground_truth_ingredients'])} 食材)")
        else:
            print(f"  ✗ {probe_url}")
        await asyncio.sleep(1.0)

    if probe_ok == 0:
        print("[ytower] 驗證全部失敗，跳過楊桃美食網")
        await client.aclose()
        return 0

    print(f"[ytower] 驗證通過 {probe_ok}/5，開始批量爬取")

    sem = asyncio.Semaphore(concurrency)
    success = 0
    fail = 0
    t0 = time.time()

    async def _task(url: str):
        nonlocal success, fail
        if success >= max_recipes:
            return
        async with sem:
            record = await scrape_ytower_page(client, url)
            await asyncio.sleep(delay + random.uniform(0, 0.5))

        if record and success < max_recipes:
            append_jsonl(YTOWER_OUTPUT, record)
            success += 1
            if success % 50 == 0 or success <= 5:
                elapsed = time.time() - t0
                rate = success / elapsed * 3600 if elapsed > 0 else 0
                print(f"  [ytower] {success}/{max_recipes} 完成 "
                      f"({fail} 失敗, {rate:.0f}/hr, "
                      f"已耗時 {elapsed/60:.1f} 分)")
        else:
            fail += 1

    batch_size = concurrency * 10
    for batch_start in range(0, len(urls), batch_size):
        if success >= max_recipes:
            break
        batch = urls[batch_start : batch_start + batch_size]
        tasks = [_task(url) for url in batch]
        await asyncio.gather(*tasks)

    await client.aclose()
    elapsed = time.time() - t0
    print(f"[ytower] 完成！{success} 筆成功, {fail} 筆失敗, 耗時 {elapsed/60:.1f} 分鐘")
    return success


# ── 合併 + 統計 ───────────────────────────────────────────────────

def merge_and_stats():
    """合併所有 JSONL → corpus_all.jsonl + 統計。"""
    records: list[dict] = []
    for src_file in [ICOOK_OUTPUT, YTOWER_OUTPUT]:
        if src_file.exists():
            for line in src_file.read_text(encoding="utf-8").splitlines():
                if line.strip():
                    try:
                        records.append(json.loads(line))
                    except json.JSONDecodeError:
                        pass

    # 去重（by URL）
    seen: set[str] = set()
    unique: list[dict] = []
    for r in records:
        if r["url"] not in seen:
            seen.add(r["url"])
            unique.append(r)

    # 寫合併檔
    with open(ALL_OUTPUT, "w", encoding="utf-8") as f:
        for r in unique:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    # 統計
    by_source: dict[str, int] = {}
    total_ingredients = 0
    total_text_len = 0
    for r in unique:
        src = r.get("source", "unknown")
        by_source[src] = by_source.get(src, 0) + 1
        total_ingredients += len(r.get("ground_truth_ingredients", []))
        total_text_len += len(r.get("full_text", ""))

    stats = {
        "total": len(unique),
        "by_source": by_source,
        "avg_ingredients": round(total_ingredients / max(len(unique), 1), 2),
        "avg_text_length": round(total_text_len / max(len(unique), 1), 1),
        "generated_at": datetime.now(timezone.utc).isoformat(),
    }

    with open(STATS_OUTPUT, "w", encoding="utf-8") as f:
        json.dump(stats, f, ensure_ascii=False, indent=2)

    print(f"\n{'='*60}")
    print(f"  語料庫統計")
    print(f"{'='*60}")
    print(f"  總筆數：{stats['total']}")
    for src, cnt in by_source.items():
        print(f"    {src}：{cnt}")
    print(f"  平均食材數：{stats['avg_ingredients']}")
    print(f"  平均文本長度：{stats['avg_text_length']:.0f} 字")
    print(f"{'='*60}")
    print(f"  合併檔：{ALL_OUTPUT}")
    print(f"  統計檔：{STATS_OUTPUT}")
    print()

    return stats


# ── CLI ───────────────────────────────────────────────────────────

async def async_main():
    parser = argparse.ArgumentParser(description="5000 筆中文食譜語料庫爬蟲")
    parser.add_argument("--site", choices=["icook", "ytower", "both"], default="both")
    parser.add_argument("--max-icook", type=int, default=3500, help="iCook 目標筆數")
    parser.add_argument("--max-ytower", type=int, default=2000, help="楊桃目標筆數")
    parser.add_argument("--delay", type=float, default=1.0, help="請求間隔秒數")
    parser.add_argument("--concurrency", type=int, default=3, help="每站併發數")
    parser.add_argument("--resume", action="store_true", help="跳過已爬取的 URL")
    parser.add_argument("--no-merge", action="store_true", help="不執行合併")
    args = parser.parse_args()

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # resume: 載入已有 URL
    skip_icook: set[str] = set()
    skip_ytower: set[str] = set()
    if args.resume:
        skip_icook = load_existing_urls(ICOOK_OUTPUT)
        skip_ytower = load_existing_urls(YTOWER_OUTPUT)
        print(f"[resume] 跳過 iCook {len(skip_icook)} 筆, ytower {len(skip_ytower)} 筆")

    old_results = SCRIPT_DIR / "output" / "icook_test_results.json"

    t_start = time.time()

    if args.site == "both":
        # 兩站並行
        results = await asyncio.gather(
            run_icook(args.max_icook, args.delay, args.concurrency, skip_icook, old_results),
            run_ytower(args.max_ytower, args.delay, args.concurrency, skip_ytower),
        )
        print(f"\n總耗時：{(time.time() - t_start)/60:.1f} 分鐘")
    elif args.site == "icook":
        await run_icook(args.max_icook, args.delay, args.concurrency, skip_icook, old_results)
        print(f"\n總耗時：{(time.time() - t_start)/60:.1f} 分鐘")
    elif args.site == "ytower":
        await run_ytower(args.max_ytower, args.delay, args.concurrency, skip_ytower)
        print(f"\n總耗時：{(time.time() - t_start)/60:.1f} 分鐘")

    if not args.no_merge:
        merge_and_stats()


def main():
    asyncio.run(async_main())


if __name__ == "__main__":
    main()
