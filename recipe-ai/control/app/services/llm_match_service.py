"""llm_match_service.py — LLM 食材匹配選擇

每種食材取 20 筆候選，用 Gemma 挑出最佳的 1 筆。
支援批次（一次 prompt 處理所有食材）和逐筆兩種模式。
"""
from loguru import logger
from app.services import gemma_client
from app.services.gemma_client import GemmaUnavailableError, GemmaParseError


_SYSTEM_PROMPT = """\
你是食材匹配專家。使用者從食譜中提取出若干食材關鍵字，系統已從資料庫搜尋出候選食物。
你的任務：為每種食材從候選清單中選出「最匹配」的一筆。

選擇原則（按優先級）：
1. 名稱完全一致或幾乎一致者優先（例如「白米」→「白米」而非「糙米」）
2. 同類原型食材優先，不選加工品（例如「雞腿肉」→「去骨雞腿」而非「雞肉水餃」「雞肉酥」）
3. taiwan_foods 來源優先（營養素資料較完整）
4. 如果沒有完美匹配，選擇最接近的候選（例如「糙米飯」候選裡沒有完全一樣的，但有「糙米」就選它）
5. 只有在候選清單完全空白時才設 selected_index 為 -1

回傳嚴格 JSON 陣列，每個元素：
{"ingredient": "食材名", "selected_index": 0, "reasoning": "一句話理由"}
selected_index 是候選清單的 0-based 索引；-1 僅限候選清單為空時使用。

重要：直接輸出 JSON，不要解釋你的思考過程。"""


_MAX_CANDIDATES_IN_PROMPT = 3


def _build_user_prompt(items: list[dict], recipe_context: str = "") -> str:
    parts = []
    if recipe_context:
        parts.append(f"食譜片段（供參考）：\n{recipe_context[:500]}\n")
    parts.append("---\n")
    for idx, item in enumerate(items):
        ing = item["ingredient"]
        amount = item.get("amount", "")
        candidates = item.get("candidates", [])[:_MAX_CANDIDATES_IN_PROMPT]
        parts.append(f"食材 {idx+1}：「{ing}」（用量：{amount or '未指定'}）")
        parts.append("候選：")
        for ci, c in enumerate(candidates):
            name = c.get("name") or c.get("food_name", "?")
            source = c.get("source", "?")
            score = c.get("score")
            score_str = f" score:{score:.2f}" if score else ""
            parts.append(f"  {ci}. {name} ({source}){score_str}")
        parts.append("")
    return "\n".join(parts)


def _fallback_pick(candidates: list[dict], ingredient: str = "") -> int:
    if not candidates:
        return -1
    if ingredient:
        for i, c in enumerate(candidates):
            name = c.get("name") or c.get("food_name", "")
            if name == ingredient:
                return i
        for i, c in enumerate(candidates):
            name = c.get("name") or c.get("food_name", "")
            if ingredient in name or name in ingredient:
                if c.get("source") == "taiwan_foods":
                    return i
    for i, c in enumerate(candidates):
        if c.get("source") == "taiwan_foods":
            return i
    return 0


async def select_matches(
    items: list[dict],
    recipe_context: str = "",
) -> list[dict]:
    """為每種食材從候選中選出最佳匹配。

    Parameters
    ----------
    items : list[dict]
        每個元素: {"ingredient": str, "amount": str, "candidates": list[dict]}
        candidates 每筆至少有 id, name, source。
    recipe_context : str
        原始食譜文字片段，幫助 LLM 理解語境。

    Returns
    -------
    list[dict]
        每個元素: {"ingredient": str, "selected_index": int, "selected": dict|None, "reasoning": str}
    """
    if not items:
        return []

    has_candidates = [it for it in items if it.get("candidates")]
    if not has_candidates:
        return [
            {"ingredient": it["ingredient"], "selected_index": -1, "selected": None, "reasoning": "無候選"}
            for it in items
        ]

    user_prompt = _build_user_prompt(items, recipe_context)

    try:
        raw = await gemma_client.complete_json(
            _SYSTEM_PROMPT,
            user_prompt,
            temperature=0.1,
            max_tokens=1024,
            timeout=30.0,
            disable_thinking=True,
        )
        if isinstance(raw, dict):
            for key in ("selections", "results", "matches", "data"):
                if key in raw and isinstance(raw[key], list):
                    raw = raw[key]
                    break
            else:
                if len(raw) == 1:
                    val = next(iter(raw.values()))
                    if isinstance(val, list):
                        raw = val
        if not isinstance(raw, list):
            raise GemmaParseError(f"expected list, got {type(raw)}")

        llm_map = {}
        for entry in raw:
            ing_name = entry.get("ingredient", "")
            llm_map[ing_name] = entry

        results = []
        for item in items:
            ing = item["ingredient"]
            candidates = item.get("candidates", [])
            entry = llm_map.get(ing)
            if entry and isinstance(entry.get("selected_index"), int):
                sel_idx = entry["selected_index"]
                reasoning = entry.get("reasoning", "")
                if 0 <= sel_idx < len(candidates):
                    results.append({
                        "ingredient": ing,
                        "selected_index": sel_idx,
                        "selected": candidates[sel_idx],
                        "reasoning": reasoning,
                    })
                    continue
                elif sel_idx == -1:
                    if candidates:
                        fb = _fallback_pick(candidates, ing)
                        results.append({
                            "ingredient": ing,
                            "selected_index": fb,
                            "selected": candidates[fb],
                            "reasoning": f"最適配候選（{reasoning or 'LLM 認為無完美匹配'}）",
                        })
                        logger.info("llm_match force-pick for '{}': idx={} (LLM said -1 but {} candidates exist)",
                                    ing, fb, len(candidates))
                    else:
                        results.append({
                            "ingredient": ing,
                            "selected_index": -1,
                            "selected": None,
                            "reasoning": reasoning or "無候選食物",
                        })
                    continue

            fb = _fallback_pick(candidates, ing)
            results.append({
                "ingredient": ing,
                "selected_index": fb,
                "selected": candidates[fb] if fb >= 0 else None,
                "reasoning": "LLM 回應缺漏，使用預設排序",
            })
        return results

    except (GemmaUnavailableError, GemmaParseError) as e:
        logger.warning("llm_match fallback: {}", e)
        results = []
        for item in items:
            ing = item["ingredient"]
            candidates = item.get("candidates", [])
            fb = _fallback_pick(candidates, ing)
            results.append({
                "ingredient": item["ingredient"],
                "selected_index": fb,
                "selected": candidates[fb] if fb >= 0 else None,
                "reasoning": f"LLM 不可用（{type(e).__name__}），使用預設排序",
            })
        return results
