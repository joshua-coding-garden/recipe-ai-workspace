"""gemma_extraction_service.py — 整合點 1：Gemma 食材提取校正

Track A（regex）提取後，把結果交給 Gemma 做校正：
- 補漏（食譜中有但 regex 沒抓到的食材）
- 去雜（regex 誤抓的非食材，如「大火」「備用」）
- 修名（normalize 不完整導致的名稱問題）

回傳 corrections diff 格式，前端可審計顯示。
"""
import json
from loguru import logger
from app.services import gemma_client
from app.services.gemma_client import GemmaUnavailableError, GemmaParseError
from app.config import settings

_SYSTEM_PROMPT = """\
You are a food ingredient extraction validator for Traditional Chinese recipes.
You receive a recipe text and a list of ingredients extracted by a rule-based parser.
The parser often makes mistakes. Your job is to clean up the list.

REMOVE these (they are NOT food ingredients):
- Hashtags/tags: anything starting with # (e.g. #麻油雞, #家常菜, #一鍋到底)
- Cooking equipment: 內鍋, 外鍋, 電鍋, 平底鍋, 烤箱, 碗, 盤, 鍋, 模
- Cooking actions/states: 跳起, 備用, 切絲, 切丁, 大火, 小火, 中火, 翻炒, 熱油熱鍋, 起油鍋, 篩入, 放入, 拿出, 製作, 如圖
- Descriptive phrases: anything containing 都可/比例/適量/少許 as the main word
- Recipe titles or dish names (e.g. "椒鹽蜂蜜肉排 by Amy's Kitchen", "草莓奶昔 by GREENIS 格麗思")
- Emoji or garbage text: anything with emoji symbols or clearly not a food name
- Vague section headers alone: 材料, 調味料, 醃料, 醬料, 備料, 所有Topping, 材 料, 調 味 料
- Cooking step fragments: phrases describing actions like 蓋上, 覆蓋, 放涼, 排氣, 發酵, 預熱, 兩面, 出爐

RENAME these (fix the name):
- Remove section/group prefixes: 抹茶瑪德蓮 中筋麵粉→中筋麵粉, 材料 白菜→白菜, 調味料 胡椒粉→胡椒粉, 腰內肉排醃料 米酒→米酒
- Remove cutting methods from names: 洋蔥切絲→洋蔥, 番茄切塊→番茄
- Remove brand names: 李錦記舊庄特級蠔油→蠔油, 宏基蜂蜜 龍眼蜜→蜂蜜
- Remove unnecessary descriptions: 無骨雞腿肉有無皮都可→雞腿肉, 香菇乾或新鮮都可→香菇
- Remove store names: 吳郭魚全聯→吳郭魚
- Simplify compound descriptions to the core food name

ADD only if a clear food ingredient in the recipe text is completely missing from the list.

DEDUP: If the same food appears twice (e.g. 洋蔥切絲 and 洋蔥), remove the redundant one.

Respond ONLY with JSON:
{"corrections": [{"action": "remove", "name": "要移除的名稱", "reason": "原因"},{"action": "rename", "original": "原名", "corrected": "修正名", "reason": "原因"},{"action": "add", "name": "食材名", "amount": "用量或空字串", "reason": "原因"}]}

If the list is already perfect, respond: {"corrections": []}"""


async def refine_extraction(
    recipe_text: str,
    regex_results: list[dict],
) -> dict:
    """
    Gemma 校正 Track A regex 的提取結果。

    Returns:
        {
            "refined": [{"name": ..., "amount": ..., "source": "regex"|"gemma_added"|"gemma_corrected"}, ...],
            "corrections": [{"action": ..., ...}, ...],
            "gemma_available": True/False,
        }
    """
    tagged = [{"name": r["name"], "amount": r.get("amount", ""), "source": "regex"} for r in regex_results]

    if not settings.gemma_enabled:
        return {"refined": tagged, "corrections": [], "gemma_available": False}

    try:
        result = await _call_gemma(recipe_text, regex_results)
    except (GemmaUnavailableError, GemmaParseError) as e:
        logger.info("gemma extraction fallback: {}", e)
        return {"refined": tagged, "corrections": [], "gemma_available": False}

    corrections = result.get("corrections", [])
    if not isinstance(corrections, list):
        return {"refined": tagged, "corrections": [], "gemma_available": True}

    # Gemma 校正不設上限，信任 LLM 判斷

    refined = _apply_corrections(tagged, corrections)

    # 過 stopword 過濾（必要！踩過坑 #3）
    try:
        from app.services.stopword_store import stopword_store
        stop_set = stopword_store.get_set()
        before = len(refined)
        refined = [r for r in refined if r["name"] not in stop_set]
        if len(refined) < before:
            logger.debug("stopword filter removed {} items after gemma refinement", before - len(refined))
    except Exception:
        pass

    return {"refined": refined, "corrections": corrections, "gemma_available": True}


async def _call_gemma(recipe_text: str, regex_results: list[dict]) -> dict:
    ingredients_str = json.dumps(
        [{"name": r["name"], "amount": r.get("amount", "")} for r in regex_results],
        ensure_ascii=False,
    )
    user_content = (
        f"Recipe text:\n---\n{recipe_text[:1500]}\n---\n\n"
        f"Extracted ingredients:\n{ingredients_str}"
    )
    logger.debug("gemma extraction input: {} items, text_len={}", len(regex_results), len(recipe_text))
    result = await gemma_client.complete_json(
        _SYSTEM_PROMPT,
        user_content,
        temperature=0.2,
        max_tokens=2048,
        timeout=settings.gemma_extraction_timeout,
    )
    logger.debug("gemma extraction raw result: {}", result)
    if isinstance(result, list):
        result = {"corrections": result}
    return result


def _get_name(c: dict) -> str:
    """Extract name from correction, handling both flat and nested formats."""
    if c.get("name"):
        return c["name"]
    item = c.get("item", {})
    if isinstance(item, dict) and item.get("name"):
        return item["name"]
    return ""


def _apply_corrections(
    items: list[dict],
    corrections: list[dict],
) -> list[dict]:
    """依序套用 remove → rename → add。"""
    result = list(items)

    # remove
    remove_names = set()
    for c in corrections:
        if c.get("action") == "remove":
            remove_names.add(_get_name(c))
    remove_names.discard("")
    if remove_names:
        result = [r for r in result if r["name"] not in remove_names]

    # rename
    for c in corrections:
        if c.get("action") == "rename":
            original = c.get("original", "") or _get_name(c)
            corrected = c.get("corrected", "") or c.get("new_name", "")
            if not original or not corrected or original == corrected:
                continue
            for r in result:
                if r["name"] == original:
                    r["name"] = corrected
                    r["source"] = "gemma_corrected"
                    break

    # add
    existing_names = {r["name"] for r in result}
    for c in corrections:
        if c.get("action") == "add":
            name = _get_name(c)
            amount = c.get("amount", "")
            if not amount:
                item = c.get("item", {})
                if isinstance(item, dict):
                    amount = item.get("amount", "")
            if name and name not in existing_names:
                result.append({
                    "name": name,
                    "amount": amount,
                    "source": "gemma_added",
                })
                existing_names.add(name)

    return result
