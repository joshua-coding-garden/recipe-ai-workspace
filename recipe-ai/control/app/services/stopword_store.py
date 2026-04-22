"""
stopword_store.py - jieba 斷詞停用詞 JSON CRUD

Thread-safe、原子寫入、載入失敗自動備份為 .bak。
提供給 reverse_search_service 做熱更新停用詞集合。
"""
from __future__ import annotations

import json
import os
import re
import shutil
import threading
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from loguru import logger

from app.config import settings

# 合法詞彙:1~20 字,只允許中文、英文、數字與連字號 (避免塞入正則、空白、標點)
_WORD_PATTERN = re.compile(r"^[一-鿿A-Za-z0-9\-]{1,20}$")
_CACHE_TTL_SEC = 60.0


class StopwordStore:
    """Thread-safe JSON-based stopword CRUD."""

    def __init__(self, path: str, backup_dir: str = "resources/backups"):
        self._path = self._resolve_path(path)
        self._backup_dir = self._resolve_path(backup_dir)
        self._lock = threading.RLock()
        self._data: dict[str, Any] = {"version": 1, "updated_at": "", "entries": []}
        self._cache_set: set[str] | None = None
        self._cache_ts: float = 0.0
        self._load()

    # ── 內部工具 ──────────────────────────────────────────────────

    @staticmethod
    def _resolve_path(path: str) -> Path:
        p = Path(path)
        if not p.is_absolute():
            p = Path(__file__).resolve().parents[2] / path
        return p

    @staticmethod
    def _now_iso() -> str:
        return datetime.now(timezone.utc).isoformat()

    def _load(self) -> None:
        try:
            if not self._path.exists():
                self._path.parent.mkdir(parents=True, exist_ok=True)
                self._data = {"version": 1, "updated_at": self._now_iso(), "entries": []}
                self._save()
                logger.info("stopwords.json created empty: {}", self._path)
                return

            raw = json.loads(self._path.read_text(encoding="utf-8"))
            if not isinstance(raw, dict) or not isinstance(raw.get("entries"), list):
                logger.warning("stopwords.json malformed, starting empty")
                self._data = {"version": 1, "updated_at": self._now_iso(), "entries": []}
                return

            self._data = raw
            logger.info("stopwords loaded: {} entries", len(self._data["entries"]))
        except json.JSONDecodeError:
            bak = self._path.with_suffix(".json.bak")
            self._path.rename(bak)
            logger.error("stopwords.json corrupt, backed up to {}, starting empty", bak)
            self._data = {"version": 1, "updated_at": self._now_iso(), "entries": []}
            self._save()
        except Exception as e:
            logger.error("stopwords.json load failed: {}", e)
            self._data = {"version": 1, "updated_at": self._now_iso(), "entries": []}

    def _save(self) -> None:
        try:
            self._data["updated_at"] = self._now_iso()
            tmp = self._path.with_suffix(".json.tmp")
            tmp.write_text(
                json.dumps(self._data, ensure_ascii=False, indent=2),
                encoding="utf-8",
            )
            os.replace(str(tmp), str(self._path))
            self._invalidate_cache()
        except Exception as e:
            logger.error("stopwords.json save failed: {}", e)

    def _invalidate_cache(self) -> None:
        self._cache_set = None
        self._cache_ts = 0.0

    def _snapshot_before_write(self) -> None:
        """寫入前備份一份時間戳快照 (保留最近 10 份)。"""
        try:
            if not self._path.exists():
                return
            self._backup_dir.mkdir(parents=True, exist_ok=True)
            ts = datetime.now().strftime("%Y%m%dT%H%M%S")
            target = self._backup_dir / f"stopwords_{ts}.json"
            shutil.copy2(self._path, target)
            # 保留最近 10 份
            existing = sorted(self._backup_dir.glob("stopwords_*.json"))
            for old in existing[:-10]:
                try:
                    old.unlink()
                except OSError:
                    pass
        except Exception as e:
            logger.warning("stopwords snapshot failed: {}", e)

    def _validate_word(self, word: str) -> str:
        word = (word or "").strip()
        if not word:
            raise ValueError("word cannot be empty")
        if not _WORD_PATTERN.match(word):
            raise ValueError(f"invalid word: {word!r}")
        return word

    def _find_index(self, word: str) -> int:
        for i, e in enumerate(self._data["entries"]):
            if e.get("word") == word:
                return i
        return -1

    # ── CRUD ──────────────────────────────────────────────────────

    def list_all(self) -> list[dict[str, Any]]:
        """回傳全部停用詞條目 (深拷貝)。"""
        with self._lock:
            return [dict(e) for e in self._data["entries"]]

    def add(
        self,
        word: str,
        category: str = "custom",
        actor: dict[str, Any] | None = None,
        source_context: str | None = None,
    ) -> dict[str, Any]:
        """新增一筆。已存在則 raise ValueError。"""
        word = self._validate_word(word)
        category = (category or "custom").strip() or "custom"
        with self._lock:
            if self._find_index(word) >= 0:
                raise ValueError(f"stopword already exists: {word}")
            self._snapshot_before_write()
            entry = {
                "word": word,
                "category": category,
                "created_at": self._now_iso(),
                "created_by": (actor or {}).get("sub") or "system",
                "created_by_email": (actor or {}).get("email"),
                "source_context": source_context,
            }
            self._data["entries"].append(entry)
            self._save()
            return dict(entry)

    def add_bulk(
        self,
        words: list[str],
        category: str = "custom",
        actor: dict[str, Any] | None = None,
        source_context: str | None = None,
    ) -> dict[str, Any]:
        """批次新增。已存在者跳過。回傳 {added, skipped}。"""
        added: list[dict[str, Any]] = []
        skipped: list[str] = []
        with self._lock:
            self._snapshot_before_write()
            for raw in words:
                try:
                    w = self._validate_word(raw)
                except ValueError:
                    skipped.append(str(raw))
                    continue
                if self._find_index(w) >= 0:
                    skipped.append(w)
                    continue
                entry = {
                    "word": w,
                    "category": (category or "custom").strip() or "custom",
                    "created_at": self._now_iso(),
                    "created_by": (actor or {}).get("sub") or "system",
                    "created_by_email": (actor or {}).get("email"),
                    "source_context": source_context,
                }
                self._data["entries"].append(entry)
                added.append(dict(entry))
            if added:
                self._save()
        return {"added": added, "skipped": skipped}

    def update(
        self,
        word: str,
        new_word: str | None = None,
        category: str | None = None,
        actor: dict[str, Any] | None = None,
    ) -> tuple[dict[str, Any] | None, dict[str, Any] | None]:
        """
        更新詞彙本身或分類。回傳 (before, after)。不存在 → (None, None)。
        """
        word = word.strip()
        with self._lock:
            idx = self._find_index(word)
            if idx < 0:
                return None, None
            before = dict(self._data["entries"][idx])
            if new_word is not None:
                new_w = self._validate_word(new_word)
                if new_w != word and self._find_index(new_w) >= 0:
                    raise ValueError(f"stopword already exists: {new_w}")
                self._data["entries"][idx]["word"] = new_w
            if category is not None:
                cat = category.strip() or "custom"
                self._data["entries"][idx]["category"] = cat
            self._data["entries"][idx]["updated_at"] = self._now_iso()
            self._data["entries"][idx]["updated_by"] = (actor or {}).get("sub")
            self._snapshot_before_write()
            self._save()
            return before, dict(self._data["entries"][idx])

    def delete(self, word: str, actor: dict[str, Any] | None = None) -> dict[str, Any] | None:
        """刪除。回傳被刪的條目 (before),不存在 → None。"""
        word = word.strip()
        with self._lock:
            idx = self._find_index(word)
            if idx < 0:
                return None
            self._snapshot_before_write()
            before = dict(self._data["entries"][idx])
            del self._data["entries"][idx]
            self._save()
            return before

    # ── 讀取最佳化 (供斷詞呼叫) ──────────────────────────────────

    def get_set(self) -> set[str]:
        """回傳停用詞 set。內部 60 秒 TTL cache。寫入後即時失效。"""
        import time
        now = time.monotonic()
        with self._lock:
            if self._cache_set is not None and (now - self._cache_ts) < _CACHE_TTL_SEC:
                return self._cache_set
            self._cache_set = {e["word"] for e in self._data["entries"] if e.get("word")}
            self._cache_ts = now
            return self._cache_set

    def stats(self) -> dict[str, Any]:
        with self._lock:
            entries = self._data["entries"]
            categories: dict[str, int] = {}
            for e in entries:
                c = e.get("category", "custom")
                categories[c] = categories.get(c, 0) + 1
            return {
                "total": len(entries),
                "by_category": categories,
                "updated_at": self._data.get("updated_at"),
            }


_DEFAULT_PATH = getattr(settings, "stopwords_path", "resources/stopwords.json")
stopword_store = StopwordStore(_DEFAULT_PATH)
