"""advisor_context.py — Context Window 壓縮管理"""


def build_context(history: list[dict], budget_chars: int = 14000) -> list[dict]:
    """
    三層 history 壓縮：
    1. 最近 2 輪（4 條 user+assistant）完整保留
    2. 更早的每輪壓成一句摘要
    3. 超出 budget 直接丟棄
    """
    filtered = [m for m in history if m.get("role") in ("user", "assistant")]
    if len(filtered) <= 4:
        return filtered

    recent = filtered[-4:]
    older = filtered[:-4]

    summaries = []
    for msg in older:
        role = msg.get("role", "")
        content = msg.get("content", "")
        tools = msg.get("tools_used", [])
        if role == "user":
            summaries.append(f"使用者：{content[:100]}")
        elif role == "assistant":
            tool_info = ""
            if tools:
                tool_names = [t.get("name", "") for t in tools if t.get("name")]
                if tool_names:
                    tool_info = f"（使用了 {', '.join(tool_names)}）"
            summaries.append(f"AI{tool_info}：{content[:100]}")

    if not summaries:
        return recent

    summary_text = "[先前對話摘要]\n" + "\n".join(summaries[-8:]) + "\n[摘要結束]"
    summary_block = {"role": "user", "content": summary_text}

    result = [summary_block] + recent

    total = sum(len(m.get("content", "")) for m in result)
    while total > budget_chars and len(result) > 2:
        result.pop(0)
        total = sum(len(m.get("content", "")) for m in result)

    return result


def trim_tool_result(result: dict, tool_name: str) -> str:
    """精簡工具結果，避免吃光 context"""
    import json
    trimmed = dict(result)

    if tool_name == "query_dri":
        trimmed.pop("all_targets", None)
        trimmed.pop("upper_limits", None)
        trimmed.pop("intake", None)
    elif tool_name == "analyze_recipe":
        nr = trimmed.get("nutrition_lookup", {})
        if isinstance(nr, dict) and "results" in nr:
            for r in nr["results"]:
                matches = r.get("matches", [])
                r["matches"] = matches[:1]
    elif tool_name == "search_food":
        results = trimmed.get("results", [])
        for r in results:
            if isinstance(r, dict):
                r.pop("score_parts", None)

    s = json.dumps(trimmed, ensure_ascii=False)
    if len(s) > 2000:
        s = s[:2000] + "...(truncated)"
    return s
