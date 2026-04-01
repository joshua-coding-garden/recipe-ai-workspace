"""
synonym_service.py - 中英文同義詞展開

英文：NLTK WordNet
中文：MoeDict 詞典映射（靜態檔）
"""
import nltk
import re
from loguru import logger
from app.services.moedict_service import moedict_service

# 確保 WordNet 語料庫已下載
try:
    from nltk.corpus import wordnet as _wordnet
    _wordnet.synsets("test")
except LookupError:
    logger.info("下載 NLTK WordNet 語料庫...")
    nltk.download("wordnet", quiet=True)
    nltk.download("omw-1.4", quiet=True)
    from nltk.corpus import wordnet as _wordnet

wordnet = _wordnet


def _is_chinese_token(token: str) -> bool:
    return bool(token) and all("\u4e00" <= ch <= "\u9fff" for ch in token)


def _normalize_zh_term(term: str) -> str:
    return re.sub(r"\s+", "", term.strip())


def get_english_synonyms(en_keyword: str) -> list[str]:
    """
    NLTK WordNet 英文同義詞（5-10 個）
    策略：多 synsets 的 lemmas + 第一層 hyponyms
    """
    if not en_keyword.strip():
        return []

    kw = en_keyword.lower().replace(" ", "_")
    synsets = wordnet.synsets(kw, pos=wordnet.NOUN)
    results: list[str] = []

    for ss in synsets[:3]:  # 最多前 3 個 synset
        if ss is None:
            continue

        # 1. 同 synset 內的所有 lemmas
        lemmas = ss.lemmas() if hasattr(ss, "lemmas") else []
        for lemma in lemmas:
            word = lemma.name().replace("_", " ").lower()
            if word != en_keyword.lower():
                results.append(word)

        # 2. 第一層 hyponyms（更具體的下位詞）
        hypos = ss.hyponyms() if hasattr(ss, "hyponyms") else []
        for hypo in hypos[:4]:
            if hypo is None:
                continue
            for lemma in (hypo.lemmas() if hasattr(hypo, "lemmas") else [])[:2]:
                word = lemma.name().replace("_", " ").lower()
                results.append(word)

    # 去重、長度過濾（2-30 字元），取前 10
    seen: set[str] = set()
    filtered: list[str] = []
    for w in results:
        if w not in seen and 2 <= len(w) <= 30 and w.replace(" ", "").isalpha():
            seen.add(w)
            filtered.append(w)

    logger.debug("WordNet '{}' → {} 個同義詞：{}", en_keyword, len(filtered[:10]), filtered[:10])
    return filtered[:10]


def get_chinese_synonyms(zh_keyword: str) -> list[str]:
    """MoeDict 中文同義詞（最多 6 個）。"""
    base = _normalize_zh_term(zh_keyword)
    if not _is_chinese_token(base):
        return []

    try:
        result = moedict_service.get_synonyms(base, limit=6)
        logger.debug("MoeDict '{}' → {} 個同義詞：{}", zh_keyword, len(result), result)
        return result
    except Exception as e:
        logger.warning("MoeDict 中文同義詞查詢失敗 ('{}'): {}", zh_keyword, e)
        return []
