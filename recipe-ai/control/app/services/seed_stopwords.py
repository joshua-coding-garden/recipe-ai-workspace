"""
seed_stopwords.py - 啟動時 idempotent 的種子資料注入與同義詞備份

1. 若 stopwords.json 的 entries 為空,寫入 75 個原硬編碼停用詞
   (分類標記為 general / cooking,created_by="system_seed")。
2. 為 food_synonym_dict.json 建立一次每日快照到 resources/backups/。
"""
from __future__ import annotations

import shutil
from datetime import datetime
from pathlib import Path

from loguru import logger

from app.config import settings
from app.services.stopword_store import stopword_store


_GENERAL = [
    '的', '了', '在', '是', '我', '有', '和', '就', '不', '人', '都',
    '一', '一個', '上', '也', '很', '到', '說', '要', '去', '你',
    '會', '著', '沒有', '看', '好', '自己', '這', '他', '她', '它',
    '把', '那', '被', '從', '如果', '什麼', '但', '可以', '讓', '再',
    '後', '然後', '接著', '最後', '先', '用', '加入', '放入', '倒入',
    '適量', '少許', '一些', '備用', '準備', '半條', '半顆',
]
_COOKING = [
    '切丁', '切片', '切塊', '切段', '切絲', '切末', '切碎',
    '翻炒', '拌炒', '快炒', '熱鍋', '熱油', '起鍋', '下鍋',
    '上桌', '即可', '均勻', '變色', '調味', '醃製',
    '預備', '食材', '做法', '步驟', '作法', '分鐘', '小時',
    '煮沸', '煮熟', '燒開', '加熱', '冷卻', '靜置', '攪拌',
    '盛盤', '裝盤', '撒上', '淋上', '鋪上', '完成',
]


def _resolve(path: str) -> Path:
    p = Path(path)
    if not p.is_absolute():
        p = Path(__file__).resolve().parents[2] / path
    return p


def _seed_stopwords_once() -> int:
    """若 stopwords 為空則灌種子資料,回傳灌入筆數。"""
    existing = stopword_store.list_all()
    if existing:
        return 0

    system_actor = {"sub": "system_seed", "email": "system@seed"}
    added = 0
    general_res = stopword_store.add_bulk(
        _GENERAL, category="general", actor=system_actor, source_context="bootstrap_seed"
    )
    cooking_res = stopword_store.add_bulk(
        _COOKING, category="cooking", actor=system_actor, source_context="bootstrap_seed"
    )
    added = len(general_res["added"]) + len(cooking_res["added"])
    logger.info("stopwords seeded: {} entries ({} general, {} cooking)",
                added, len(general_res["added"]), len(cooking_res["added"]))
    return added


def _backup_synonym_dict_once() -> Path | None:
    """若今日尚未備份過,將 food_synonym_dict.json 複製一份到 backups。"""
    src = _resolve(settings.food_synonym_dict_path)
    if not src.exists():
        logger.info("food_synonym_dict.json 尚未存在,略過備份")
        return None

    backup_dir = _resolve(settings.backups_dir)
    backup_dir.mkdir(parents=True, exist_ok=True)

    today = datetime.now().strftime("%Y%m%d")
    existing_today = list(backup_dir.glob(f"food_synonym_dict_{today}*.json"))
    if existing_today:
        return existing_today[0]

    ts = datetime.now().strftime("%Y%m%dT%H%M%S")
    target = backup_dir / f"food_synonym_dict_{ts}.json"
    shutil.copy2(src, target)
    logger.info("food_synonym_dict backed up: {}", target)
    return target


def run_startup_seed() -> None:
    """FastAPI lifespan 呼叫的單一入口。兩個動作都 idempotent,失敗不中斷服務。"""
    try:
        seeded = _seed_stopwords_once()
        if seeded == 0:
            logger.info("stopwords 已有資料,跳過種子注入")
    except Exception as e:
        logger.error("stopword seed 失敗: {}", e)

    try:
        _backup_synonym_dict_once()
    except Exception as e:
        logger.error("同義詞備份失敗: {}", e)


__all__ = ["run_startup_seed"]
