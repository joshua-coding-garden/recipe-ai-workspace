"""
synonym_expander.py - 食材同義詞擴展引擎

整合 WordNet（英文）、MoeDict live API（中文）、Argos 翻譯橋接。
產出 ExpandedResult 供 pipeline 或 API 使用。
"""
from __future__ import annotations

import re
from dataclasses import dataclass, field

import httpx
from loguru import logger

from app.config import settings
from app.services.synonym_service import get_english_synonyms
from app.services.moedict_service import moedict_service
from app.services.translate_service import translate_to_english, translate_to_chinese
from app.services.language_detector import detect_keyword

try:
    from nltk.corpus import wordnet
except ImportError:
    wordnet = None


# ── 食材相關 WordNet 頂層 synset 名稱 ────────────────────────────

_FOOD_HYPERNYM_NAMES = frozenset({
    "food.n.01", "food.n.02", "plant.n.02", "plant.n.01",
    "animal.n.01", "fruit.n.01", "vegetable.n.01",
    "meat.n.01", "fish.n.01", "grain.n.01", "nut.n.01",
    "herb.n.01", "spice.n.01", "dairy_product.n.01",
    "produce.n.01", "seafood.n.01",
})

_MAX_HYPERNYM_DEPTH = 8


def _is_chinese(text: str) -> bool:
    return bool(re.search(r"[\u4e00-\u9fff]", text))


def _deduplicate(items: list[str]) -> list[str]:
    seen: set[str] = set()
    out: list[str] = []
    for item in items:
        s = item.strip()
        if s and s not in seen:
            seen.add(s)
            out.append(s)
    return out


@dataclass
class ExpandedResult:
    canonical: str
    language: str
    zh_synonyms: list[str] = field(default_factory=list)
    en_synonyms: list[str] = field(default_factory=list)
    sources: set[str] = field(default_factory=set)


class SynonymExpander:
    """食材同義詞擴展引擎。"""

    async def expand(self, ingredient: str) -> ExpandedResult:
        """偵測語言後分派中文或英文擴展流程。"""
        lang = detect_keyword(ingredient)
        if lang == "zh":
            return await self._expand_chinese(ingredient)
        return await self._expand_english(ingredient)

    # ── 中文流程 ─────────────────────────────────────────────────

    async def _expand_chinese(self, zh_term: str) -> ExpandedResult:
        sources: set[str] = set()

        # 1. MoeDict live API
        moedict_syns = await self._query_moedict_api(zh_term)
        if moedict_syns:
            sources.add("moedict_api")

        # 1b. MoeDict 靜態 fallback
        static_syns = moedict_service.get_synonyms(zh_term, limit=6)
        if static_syns:
            sources.add("moedict_static")

        # 2. 翻譯 zh → en
        en_translation = translate_to_english(zh_term)
        has_en = en_translation and en_translation != zh_term and not _is_chinese(en_translation)

        # 3. WordNet 擴展英文
        en_synonyms: list[str] = []
        if has_en:
            raw_en = get_english_synonyms(en_translation)
            en_synonyms = [s for s in raw_en if self._validate_food_relevance(en_translation, s)]
            if en_synonyms:
                sources.add("wordnet")

        # 4. 反向翻譯橋接（過濾明顯無關的翻譯結果）
        bridged_zh: list[str] = []
        for en_syn in en_synonyms[:5]:
            zh_back = translate_to_chinese(en_syn)
            if (
                zh_back
                and zh_back != en_syn
                and _is_chinese(zh_back)
                and len(zh_back) >= 2
                and not self._is_bridge_noise(zh_back)
            ):
                bridged_zh.append(zh_back)
                sources.add("argos_bridge")

        all_zh = _deduplicate([zh_term] + moedict_syns + static_syns + bridged_zh)
        all_en = _deduplicate(([en_translation] if has_en else []) + en_synonyms)

        return ExpandedResult(
            canonical=zh_term,
            language="zh",
            zh_synonyms=all_zh,
            en_synonyms=all_en,
            sources=sources,
        )

    # ── 英文流程 ─────────────────────────────────────────────────

    async def _expand_english(self, en_term: str) -> ExpandedResult:
        sources: set[str] = set()

        # 1. WordNet
        raw_en = get_english_synonyms(en_term)
        en_synonyms = [s for s in raw_en if self._validate_food_relevance(en_term, s)]
        if en_synonyms:
            sources.add("wordnet")

        # 2. 翻譯 en → zh
        zh_translation = translate_to_chinese(en_term)
        has_zh = zh_translation and zh_translation != en_term and _is_chinese(zh_translation)

        # 3. MoeDict 擴展中文
        zh_synonyms: list[str] = []
        if has_zh:
            moedict_syns = await self._query_moedict_api(zh_translation)
            static_syns = moedict_service.get_synonyms(zh_translation, limit=6)
            zh_synonyms = _deduplicate(moedict_syns + static_syns)
            if zh_synonyms:
                sources.add("moedict_api")

        # 4. 反向翻譯橋接
        bridged_en: list[str] = []
        for zh_syn in zh_synonyms[:5]:
            en_back = translate_to_english(zh_syn)
            if en_back and en_back != zh_syn and not _is_chinese(en_back) and len(en_back) >= 2:
                bridged_en.append(en_back)
                sources.add("argos_bridge")

        all_en = _deduplicate([en_term] + en_synonyms + bridged_en)
        all_zh = _deduplicate(([zh_translation] if has_zh else []) + zh_synonyms)

        return ExpandedResult(
            canonical=en_term,
            language="en",
            zh_synonyms=all_zh,
            en_synonyms=all_en,
            sources=sources,
        )

    # ── MoeDict Live API ─────────────────────────────────────────

    async def _query_moedict_api(self, term: str) -> list[str]:
        """
        查詢 MoeDict API，解析定義文字提取同義詞。
        回傳格式：h[].d[].f 中以反引號包圍的詞，以及「即X」「又稱X」等模式。
        """
        if not term or not _is_chinese(term):
            return []

        url = f"{settings.moedict_api_base}{term}"
        try:
            async with httpx.AsyncClient(timeout=settings.moedict_api_timeout) as client:
                resp = await client.get(url)
                if resp.status_code != 200:
                    logger.debug("moedict_api status={} for '{}'", resp.status_code, term)
                    return []

                data = resp.json()
        except Exception as e:
            logger.debug("moedict_api request failed for '{}': {}", term, e)
            return []

        return self._parse_moedict_response(data, term)

    def _parse_moedict_response(self, data: dict, term: str) -> list[str]:
        """從 MoeDict API JSON 回應中提取同義詞。"""
        synonyms: list[str] = []
        seen: set[str] = {term}

        heteronyms = data.get("h", [])
        for h in heteronyms:
            definitions = h.get("d", [])
            for d in definitions:
                f_text = d.get("f", "")
                if not f_text:
                    continue

                # 提取反引號內的詞彙：`同義詞`
                backtick_matches = re.findall(r"`([^`]+)`", f_text)
                for match in backtick_matches:
                    w = match.strip()
                    if w and w not in seen and _is_chinese(w) and len(w) <= 10:
                        seen.add(w)
                        synonyms.append(w)

                # 提取「即X」「又稱X」「亦稱X」「俗稱X」「也叫X」模式
                alias_patterns = re.findall(
                    r"(?:即|又稱|亦稱|俗稱|也叫|通稱|別稱|也稱|或稱)[「『]?([^\s，。、」』]{1,8})[」』]?",
                    f_text,
                )
                for match in alias_patterns:
                    w = match.strip("「」『』")
                    if w and w not in seen and _is_chinese(w) and len(w) <= 10:
                        seen.add(w)
                        synonyms.append(w)

        logger.debug("moedict_api '{}' → {} synonyms: {}", term, len(synonyms), synonyms)
        return synonyms

    # ── 食材相關性驗證 ────────────────────────────────────────────

    def _validate_food_relevance(self, base_term: str, synonym: str) -> bool:
        """
        檢查 WordNet 同義詞是否與食材相關。
        透過 hypernym chain 判斷是否屬於食物/植物/動物類別。
        """
        if not wordnet:
            return True

        if synonym.lower() == base_term.lower():
            return False

        # 若 synonym 包含 base_term（如 chicken breast 包含 chicken），視為子類直接保留
        if base_term.lower() in synonym.lower() or synonym.lower() in base_term.lower():
            return True

        synsets = wordnet.synsets(synonym.replace(" ", "_"), pos=wordnet.NOUN)
        if not synsets:
            return True  # 查不到完整 synset → 保留（多為組合詞如 chicken breast）

        # 只要任一 synset 有食材相關 hypernym 就保留
        has_any_food = False
        has_any_nonfood = False
        for ss in synsets[:3]:
            if self._has_food_hypernym(ss):
                has_any_food = True
            else:
                has_any_nonfood = True

        # 有食材義 → 保留；全無食材義且有非食材義 → 拒絕
        if has_any_food:
            return True
        if has_any_nonfood:
            return False

        return True  # 無法判斷 → 保留

    def _has_food_hypernym(self, synset, depth: int = 0) -> bool:
        """遞迴檢查 hypernym chain 是否包含食材相關 synset。"""
        if depth >= _MAX_HYPERNYM_DEPTH:
            return False

        name = synset.name()
        if name in _FOOD_HYPERNYM_NAMES:
            return True

        for hypernym in synset.hypernyms():
            if self._has_food_hypernym(hypernym, depth + 1):
                return True

        return False

    @staticmethod
    def _is_bridge_noise(text: str) -> bool:
        """過濾翻譯橋接中的明顯噪音結果。"""
        # 單字結果通常是翻譯錯誤（如 murphy → 陰莖、spud → 塊）
        if len(text) == 1:
            return True
        # 常見翻譯噪音
        noise_words = {"陰莖", "塊", "組", "件", "個", "隻", "只", "它", "他", "她"}
        return text in noise_words
