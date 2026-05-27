"""gemma_client.py — Gemma LLM (llama-server) 通訊層

單一進入點，所有 Gemma 整合模組都 import 這裡。
- 健康檢查（30s 快取）
- 非串流 completion（同步等待完整回應）
- JSON 解析（多層 fallback）
- Gemma 不可用時 raise GemmaUnavailableError，呼叫端自行降級
"""
import json
import re
import time
from loguru import logger
import httpx
from app.config import settings


class GemmaUnavailableError(Exception):
    pass


class GemmaParseError(Exception):
    pass


_health_cache: dict = {"ok": False, "ts": 0.0}
_HEALTH_TTL = 30.0


async def is_available() -> bool:
    if not settings.gemma_enabled:
        return False
    now = time.monotonic()
    if now - _health_cache["ts"] < _HEALTH_TTL:
        return _health_cache["ok"]
    try:
        async with httpx.AsyncClient() as c:
            r = await c.get(settings.gemma_health_url, timeout=3.0)
            ok = r.status_code == 200
    except Exception:
        ok = False
    _health_cache["ok"] = ok
    _health_cache["ts"] = now
    if not ok:
        logger.debug("gemma health check failed")
    return ok


async def complete(
    system_prompt: str,
    user_content: str,
    *,
    temperature: float = 0.3,
    max_tokens: int = 16384,
    timeout: float | None = None,
    response_format: dict | None = None,
    disable_thinking: bool = False,
) -> str:
    if not await is_available():
        raise GemmaUnavailableError("Gemma server 未回應")

    payload = {
        "model": settings.gemma_model_name,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_content},
        ],
        "temperature": temperature,
        "max_tokens": max_tokens,
        "stream": False,
    }
    if response_format:
        payload["response_format"] = response_format
    if disable_thinking:
        payload["chat_template_kwargs"] = {"enable_thinking": False}
    t = timeout or settings.gemma_extraction_timeout
    try:
        async with httpx.AsyncClient() as c:
            r = await c.post(settings.gemma_url, json=payload, timeout=t)
            r.raise_for_status()
    except httpx.TimeoutException:
        logger.warning("gemma call timed out after {}s", t)
        raise GemmaUnavailableError(f"Gemma timeout ({t}s)")
    except Exception as e:
        logger.warning("gemma call failed: {}", e)
        raise GemmaUnavailableError(str(e))

    data = r.json()
    try:
        msg = data["choices"][0]["message"]
        content = msg.get("content") or ""
        reasoning = msg.get("reasoning_content") or ""
    except (KeyError, IndexError):
        raise GemmaParseError(f"unexpected response structure: {data}")

    def _has_json(s: str) -> bool:
        return bool(s and ('{' in s or '[' in s or '```' in s))

    if not _has_json(content) and _has_json(reasoning):
        logger.info("gemma: content has no JSON, using reasoning_content ({} chars)", len(reasoning))
        content = reasoning
    elif not content.strip() and reasoning.strip():
        logger.info("gemma: content empty, using reasoning_content ({} chars), tail: ...{}", len(reasoning), reasoning[-300:])
        content = reasoning

    if not content.strip():
        raise GemmaParseError("gemma returned empty content")
    return content


def _extract_json(raw: str) -> dict | list:
    """多層 fallback 從 Gemma 回應解析 JSON"""
    # Level 1: 直接 parse
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        pass

    # Level 2: markdown code fence 內
    m = re.search(r"```(?:json)?\s*\n?(.*?)\n?```", raw, re.DOTALL)
    if m:
        try:
            return json.loads(m.group(1))
        except json.JSONDecodeError:
            pass

    # Level 2.5: strip ```json 前綴（處理無 closing ``` 的情況）
    stripped = raw
    fence_m = re.match(r"```(?:json)?\s*\n?", stripped)
    if fence_m:
        stripped = stripped[fence_m.end():]
        stripped = re.sub(r"\n?```\s*$", "", stripped)
        try:
            return json.loads(stripped)
        except json.JSONDecodeError:
            pass

    # Level 3: 找第一個 { 或 [
    for start_ch, end_ch in [("{", "}"), ("[", "]")]:
        start = stripped.find(start_ch)
        if start < 0:
            continue
        depth = 0
        for i in range(start, len(stripped)):
            if stripped[i] == start_ch:
                depth += 1
            elif stripped[i] == end_ch:
                depth -= 1
                if depth == 0:
                    try:
                        return json.loads(stripped[start : i + 1])
                    except json.JSONDecodeError:
                        break

    # Level 4: 截斷修復 — 嘗試補上缺失的 ]} 讓 JSON 可解析
    for start_ch, end_ch in [("{", "}"), ("[", "]")]:
        start = stripped.find(start_ch)
        if start < 0:
            continue
        fragment = stripped[start:]
        result = _find_last_complete_item(fragment)
        if result is not None:
            return result

    raise GemmaParseError(f"cannot parse JSON from response: {raw[:200]}")


def _find_last_complete_item(fragment: str) -> str | None:
    """嘗試修復截斷的 JSON：找到最後一個完整的陣列元素，截斷後補 ]}"""
    # 從尾端往前找最後一個 }，嘗試在那裡截斷陣列
    last_brace = fragment.rfind("}")
    while last_brace > 0:
        candidate = fragment[: last_brace + 1]
        # 計算大括號深度
        depth_curly = 0
        depth_square = 0
        for ch in candidate:
            if ch == "{": depth_curly += 1
            elif ch == "}": depth_curly -= 1
            elif ch == "[": depth_square += 1
            elif ch == "]": depth_square -= 1
        # 補上缺的 ] 和 }
        suffix = "]" * depth_square + "}" * depth_curly
        try:
            return json.loads(candidate + suffix)
        except json.JSONDecodeError:
            pass
        last_brace = fragment.rfind("}", 0, last_brace)
    return None


async def complete_json(
    system_prompt: str,
    user_content: str,
    *,
    temperature: float = 0.2,
    max_tokens: int = 16384,
    timeout: float | None = None,
    json_schema: dict | None = None,
    disable_thinking: bool = False,
) -> dict | list:
    rf = None
    if json_schema:
        rf = {"type": "json_schema", "json_schema": {"name": "response", "strict": True, "schema": json_schema}}
    raw = await complete(
        system_prompt,
        user_content,
        temperature=temperature,
        max_tokens=max_tokens,
        timeout=timeout,
        response_format=rf,
        disable_thinking=disable_thinking,
    )
    return _extract_json(raw)
