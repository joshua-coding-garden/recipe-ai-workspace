"""
symptom_service.py - 中文症狀 → 英文效果 → 化合物 → 食物推薦

5 階段搜尋管道：
  1. LLM 結構化解析：使用者自由輸入 → 拆解為獨立症狀關鍵字
  2. 雙路搜尋（per keyword）：
     a. symptom_mapping.json 對照表 → 英文效果名
     b. health-vector microservice 向量語義搜尋
  3. 合併候選 → LLM 判斷相關性 → 篩選 top 10
  4. 用篩選後的 effect IDs 查 backend compound→food pipeline
  5. 彙總回傳
"""
import json
from pathlib import Path
from typing import Any

import httpx
from loguru import logger

from app.config import settings

_TIMEOUT = httpx.Timeout(30.0)
_LLM_TIMEOUT = httpx.Timeout(30.0)

# ── 載入症狀對照表 ──────────────────────────────────────────────────────
_MAPPING_PATH = Path(__file__).resolve().parents[2] / "resources" / "symptom_mapping.json"
_symptom_map: dict[str, dict] | None = None


def _load_mapping() -> dict[str, dict]:
    global _symptom_map
    if _symptom_map is not None:
        return _symptom_map
    try:
        with open(_MAPPING_PATH, "r", encoding="utf-8") as f:
            _symptom_map = json.load(f)
        logger.info("symptom_mapping_loaded entries={}", len(_symptom_map))
    except Exception as e:
        logger.error("symptom_mapping_load_failed: {}", e)
        _symptom_map = {}
    return _symptom_map


def _find_effects_for_symptom(keyword: str) -> tuple[list[str], str]:
    mapping = _load_mapping()
    if keyword in mapping:
        entry = mapping[keyword]
        return entry.get("effects", []), keyword
    for symptom, entry in mapping.items():
        synonyms = entry.get("synonyms", [])
        if keyword in synonyms:
            return entry.get("effects", []), symptom
    for symptom, entry in mapping.items():
        if keyword in symptom or symptom in keyword:
            return entry.get("effects", []), symptom
        for syn in entry.get("synonyms", []):
            if keyword in syn or syn in keyword:
                return entry.get("effects", []), symptom
    return [], ""


# ── LLM 呼叫 ──────────────────────────────────────────────────────────

async def _call_gemma(messages: list[dict], temperature: float = 0.1,
                      max_tokens: int = 16384,
                      response_format: dict | None = None) -> str | None:
    """呼叫 Gemma LLM，失敗時回傳 None（graceful degradation）"""
    try:
        payload = {
            "model": settings.gemma_model_name,
            "messages": messages,
            "temperature": temperature,
            "max_tokens": max_tokens,
        }
        if response_format:
            payload["response_format"] = response_format
        async with httpx.AsyncClient(timeout=_LLM_TIMEOUT) as client:
            resp = await client.post(settings.gemma_url, json=payload)
            resp.raise_for_status()
        data = resp.json()
        content = data.get("choices", [{}])[0].get("message", {}).get("content", "")
        # Strip thinking blocks if present
        if "<|channel>" in content:
            parts = content.split("<|channel>")
            for p in reversed(parts):
                stripped = p.strip()
                if stripped and not stripped.startswith("thought"):
                    content = stripped
                    break
        return content.strip()
    except Exception as e:
        logger.debug("gemma_call_skipped error={}", e)
        return None


def _parse_json(text: str) -> Any:
    text = text.strip()
    if text.startswith("```"):
        lines = text.split("\n")
        end = len(lines) - 1 if lines[-1].strip().startswith("```") else len(lines)
        text = "\n".join(lines[1:end]).strip()
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        pass
    for sc, ec in [("{", "}"), ("[", "]")]:
        s = text.find(sc)
        e = text.rfind(ec)
        if s != -1 and e > s:
            try:
                return json.loads(text[s:e + 1])
            except json.JSONDecodeError:
                continue
    return None


async def _llm_parse_symptoms(user_input: str) -> list[str]:
    """
    Stage 4：用 LLM 將使用者自由輸入拆解為獨立症狀關鍵字。
    若 LLM 不可用，直接回傳原始輸入。
    """
    result = await _call_gemma(
        messages=[
            {"role": "system", "content": (
                "你是一個醫學症狀解析器。使用者會用中文描述他們的身體不適。"
                "請將輸入拆解為獨立的症狀關鍵字（2-4 個字的醫學/日常用語）。\n"
                "回傳 JSON 陣列，例如：[\"頭痛\", \"失眠\", \"關節痛\"]\n"
                "規則：\n"
                "- 每個關鍵字 2-6 個中文字\n"
                "- 用標準醫學或日常症狀名稱\n"
                "- 去掉修飾語（如「嚴重的」「偶爾」）\n"
                "- 只輸出 JSON 陣列，不要其他文字"
            )},
            {"role": "user", "content": user_input},
        ],
        temperature=0.1,
        response_format={"type": "json_object"},
    )
    if not result:
        return [user_input]

    parsed = _parse_json(result)
    if isinstance(parsed, list) and all(isinstance(x, str) for x in parsed):
        return parsed if parsed else [user_input]
    if isinstance(parsed, dict):
        for v in parsed.values():
            if isinstance(v, list) and all(isinstance(x, str) for x in v):
                return v if v else [user_input]
    return [user_input]


async def _llm_judge_effects(
    user_input: str,
    candidates: list[dict],
    top_k: int = 10,
) -> list[dict]:
    """
    Stage 5 判斷：將候選 health effects 交給 LLM 篩選相關性。
    若 LLM 不可用，直接按 score 排序取 top_k。
    """
    if not candidates:
        return []
    if len(candidates) <= top_k:
        return candidates

    candidate_text = "\n".join(
        f"{i+1}. id={c['id']} | {c['name']} ({c.get('name_zh','')}) | "
        f"score={c.get('score',0):.2f} | {(c.get('description') or '')[:80]}"
        for i, c in enumerate(candidates[:30])
    )

    result = await _call_gemma(
        messages=[
            {"role": "system", "content": (
                "你是一個藥理學專家。使用者描述了症狀，系統搜尋到了候選的藥理效果。\n"
                "請判斷哪些效果與使用者的症狀最相關，回傳最相關的 ID 列表。\n"
                f"回傳 JSON 陣列（最多 {top_k} 個 ID），例如：[123, 456, 789]\n"
                "只輸出 JSON 陣列，不要其他文字。"
            )},
            {"role": "user", "content": (
                f"使用者症狀：{user_input}\n\n"
                f"候選效果：\n{candidate_text}"
            )},
        ],
        temperature=0.1,
        response_format={"type": "json_object"},
    )

    if not result:
        return sorted(candidates, key=lambda c: c.get("score", 0), reverse=True)[:top_k]

    parsed = _parse_json(result)
    selected_ids = set()
    if isinstance(parsed, list):
        selected_ids = {int(x) for x in parsed if str(x).isdigit()}
    elif isinstance(parsed, dict):
        for v in parsed.values():
            if isinstance(v, list):
                selected_ids = {int(x) for x in v if str(x).isdigit()}
                break

    if not selected_ids:
        return sorted(candidates, key=lambda c: c.get("score", 0), reverse=True)[:top_k]

    filtered = [c for c in candidates if c["id"] in selected_ids]
    if not filtered:
        return sorted(candidates, key=lambda c: c.get("score", 0), reverse=True)[:top_k]

    return filtered


# ── 向量搜尋 ──────────────────────────────────────────────────────────

async def _vector_search(keyword: str, top_k: int = 20) -> list[dict]:
    try:
        async with httpx.AsyncClient(timeout=httpx.Timeout(10.0)) as client:
            resp = await client.post(
                f"{settings.health_vector_url}/search",
                json={"query": keyword, "top_k": top_k},
            )
            resp.raise_for_status()
            data = resp.json()
            return data.get("results", [])
    except Exception as e:
        logger.warning("vector_search_failed keyword={} error={}", keyword, e)
        return []


# ── 主流程 ──────────────────────────────────────────────────────────

async def search_by_symptom(keyword: str) -> dict[str, Any]:
    """
    中文症狀搜尋完整管道：
    1. LLM 解析使用者輸入為獨立症狀
    2. 每個症狀走雙路搜尋（mapping + vector）
    3. 合併候選 → LLM 判斷相關性
    4. 查 backend compound→food pipeline
    """
    log = logger.bind(flow="symptom_search", keyword=keyword)

    # ── Stage 4: LLM 結構化解析 ──
    symptom_keywords = await _llm_parse_symptoms(keyword)
    log.info("parsed_symptoms keywords={}", symptom_keywords)

    # ── 雙路搜尋（per keyword）──
    all_effect_names: list[str] = []
    all_matched_symptoms: list[str] = []
    all_vector_candidates: list[dict] = []  # 收集所有候選

    for kw in symptom_keywords:
        # Path A: symptom_mapping.json
        effect_names, matched = _find_effects_for_symptom(kw)
        if effect_names:
            all_effect_names.extend(effect_names)
            if matched:
                all_matched_symptoms.append(matched)

        # Path B: health-vector
        vr = await _vector_search(kw, top_k=15)
        for item in vr:
            if item.get("score", 0) >= 0.30:
                item["search_keyword"] = kw
                all_vector_candidates.append(item)

    # 去重 effect_names
    searched_effect_names = list(dict.fromkeys(all_effect_names))
    matched_symptom = "、".join(all_matched_symptoms) if all_matched_symptoms else ""

    # 去重 vector candidates（by id，保留最高 score）
    best_by_id: dict[int, dict] = {}
    for vc in all_vector_candidates:
        eid = vc["id"]
        if eid not in best_by_id or vc.get("score", 0) > best_by_id[eid].get("score", 0):
            best_by_id[eid] = vc
    unique_vector = sorted(best_by_id.values(), key=lambda x: x.get("score", 0), reverse=True)

    log.info(
        "search_phase_done mapping_effects={} vector_candidates={}",
        len(searched_effect_names), len(unique_vector),
    )

    # ── Stage 5: LLM 判斷相關性 ──
    judged_effects = await _llm_judge_effects(keyword, unique_vector, top_k=10)
    vector_effect_ids = [e["id"] for e in judged_effects]
    vector_effect_items = [
        {
            "id": e["id"],
            "name": e["name"],
            "name_zh": e.get("name_zh", ""),
            "description": e.get("description"),
            "score": e.get("score", 0),
            "source": e.get("source", "vector"),
        }
        for e in judged_effects
    ]

    log.info("after_llm_judge vector_ids={}", vector_effect_ids)

    # ── 查 backend pipeline ──
    all_effects = []
    all_recommendations = []

    # Path A: mapping effects → per-name backend lookup
    if searched_effect_names:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
            for effect_name in searched_effect_names:
                try:
                    resp = await client.post(
                        f"{settings.backend_url}/health/symptom-lookup",
                        json={"keyword": effect_name},
                    )
                    resp.raise_for_status()
                    result = resp.json()
                    all_effects.extend(result.get("effects", []))
                    all_recommendations.extend(result.get("recommendations", []))
                except Exception as e:
                    log.error("effect_search_failed effect={} error={}", effect_name, e)

    # Path B: vector effect IDs → batch compound lookup
    if vector_effect_ids:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
            try:
                resp = await client.post(
                    f"{settings.backend_url}/health/effects-to-foods",
                    json={"effect_ids": vector_effect_ids},
                )
                resp.raise_for_status()
                result = resp.json()
                all_effects.extend(result.get("effects", []))
                all_recommendations.extend(result.get("recommendations", []))
            except httpx.HTTPStatusError as e:
                if e.response.status_code == 404:
                    for vi in vector_effect_items:
                        try:
                            resp = await client.post(
                                f"{settings.backend_url}/health/symptom-lookup",
                                json={"keyword": vi["name"]},
                            )
                            resp.raise_for_status()
                            result = resp.json()
                            all_effects.extend(result.get("effects", []))
                            all_recommendations.extend(result.get("recommendations", []))
                        except Exception as e2:
                            log.error("vector_fallback name={} err={}", vi["name"], e2)
                else:
                    log.error("effects_to_foods_failed error={}", e)
            except Exception as e:
                log.error("effects_to_foods_failed error={}", e)

    # 兩路都沒結果 → 直接中文搜 backend
    if not searched_effect_names and not vector_effect_ids:
        log.info("no_match, direct backend search keyword={}", keyword)
        try:
            async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
                resp = await client.post(
                    f"{settings.backend_url}/health/symptom-lookup",
                    json={"keyword": keyword},
                )
                resp.raise_for_status()
                result = resp.json()
                all_effects = result.get("effects", [])
                all_recommendations = result.get("recommendations", [])
        except Exception as e:
            log.warning("direct_search_failed error={}", e)

    # 去重
    seen_eids = set()
    unique_effects = []
    for eff in all_effects:
        if eff["id"] not in seen_eids:
            seen_eids.add(eff["id"])
            unique_effects.append(eff)

    seen_cids = set()
    unique_recs = []
    for rec in all_recommendations:
        cid = rec["compound"]["id"]
        if cid not in seen_cids:
            seen_cids.add(cid)
            unique_recs.append(rec)

    log.info(
        "done effects={} recs={} vector_hits={} parsed_symptoms={}",
        len(unique_effects), len(unique_recs),
        len(vector_effect_items), symptom_keywords,
    )

    return {
        "keyword": keyword,
        "parsed_symptoms": symptom_keywords,
        "matched_symptom": matched_symptom,
        "effect_names_searched": searched_effect_names,
        "vector_matches": vector_effect_items,
        "effects": unique_effects,
        "recommendations": unique_recs,
    }
