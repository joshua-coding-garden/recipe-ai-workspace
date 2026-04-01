"""
food_synonym_store.py - 食材同義詞 JSON CRUD 辭典

Thread-safe、雙向索引、原子寫入。
支援 Create / Read / Update / Delete 以及雙向查詢。
"""
import json
import os
import threading
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from loguru import logger

from app.config import settings


class FoodSynonymStore:
    """Thread-safe JSON-based CRUD 食材同義詞辭典。"""

    def __init__(self, path: str):
        self._path = self._resolve_path(path)
        self._lock = threading.RLock()
        self._data: dict[str, dict[str, Any]] = {}
        self._reverse: dict[str, str] = {}
        self._load()

    # ── 內部工具 ─────────────────────────────────────────────────

    @staticmethod
    def _resolve_path(path: str) -> Path:
        p = Path(path)
        if not p.is_absolute():
            p = Path(__file__).resolve().parents[2] / path
        return p

    def _load(self) -> None:
        try:
            if not self._path.exists():
                self._path.parent.mkdir(parents=True, exist_ok=True)
                self._path.write_text("{}", encoding="utf-8")
                logger.info("food_synonym_dict created empty: {}", self._path)

            raw = json.loads(self._path.read_text(encoding="utf-8"))
            if not isinstance(raw, dict):
                logger.warning("food_synonym_dict is not a JSON object, starting empty")
                raw = {}

            self._data = raw
            self._rebuild_reverse_index()
            logger.info("food_synonym_dict loaded: {} entries", len(self._data))
        except json.JSONDecodeError:
            bak = self._path.with_suffix(".json.bak")
            self._path.rename(bak)
            logger.error("food_synonym_dict corrupt, backed up to {}, starting empty", bak)
            self._data = {}
            self._reverse = {}
            self._path.write_text("{}", encoding="utf-8")
        except Exception as e:
            logger.error("food_synonym_dict load failed: {}", e)
            self._data = {}
            self._reverse = {}

    def _save(self) -> None:
        try:
            tmp = self._path.with_suffix(".json.tmp")
            tmp.write_text(
                json.dumps(self._data, ensure_ascii=False, indent=2),
                encoding="utf-8",
            )
            os.replace(str(tmp), str(self._path))
        except Exception as e:
            logger.error("food_synonym_dict save failed: {}", e)

    def _rebuild_reverse_index(self) -> None:
        self._reverse = {}
        for canonical, entry in self._data.items():
            for syn in entry.get("synonyms", []):
                norm = syn.strip().lower()
                if norm:
                    self._reverse[norm] = canonical

    @staticmethod
    def _now_iso() -> str:
        return datetime.now(timezone.utc).isoformat()

    # ── CRUD ─────────────────────────────────────────────────────

    def create(
        self,
        canonical: str,
        language: str,
        synonyms: list[str] | None = None,
        sources: list[str] | None = None,
    ) -> dict[str, Any]:
        """新增一筆辭典條目。canonical 已存在則 raise ValueError。"""
        canonical = canonical.strip()
        if not canonical:
            raise ValueError("canonical cannot be empty")

        with self._lock:
            if canonical in self._data:
                raise ValueError(f"entry already exists: {canonical}")

            now = self._now_iso()
            syns = list(dict.fromkeys(s.strip() for s in (synonyms or []) if s.strip()))
            entry: dict[str, Any] = {
                "canonical": canonical,
                "language": language,
                "synonyms": syns,
                "sources": list(dict.fromkeys(sources or ["manual"])),
                "created_at": now,
                "updated_at": now,
            }
            self._data[canonical] = entry

            for syn in syns:
                self._reverse[syn.strip().lower()] = canonical

            self._save()
            logger.info("food_synonym_dict created: {}", canonical)
            return dict(entry)

    def read(self, canonical: str) -> dict[str, Any] | None:
        """依 canonical 名稱查詢。"""
        with self._lock:
            entry = self._data.get(canonical.strip())
            return dict(entry) if entry else None

    def update(
        self,
        canonical: str,
        *,
        synonyms: list[str] | None = None,
        add_synonyms: list[str] | None = None,
        remove_synonyms: list[str] | None = None,
        sources: list[str] | None = None,
    ) -> dict[str, Any] | None:
        """
        更新既有條目。
        - synonyms: 完全取代
        - add_synonyms: 增量新增
        - remove_synonyms: 移除指定同義詞
        - sources: 完全取代來源
        """
        canonical = canonical.strip()
        with self._lock:
            entry = self._data.get(canonical)
            if entry is None:
                return None

            if synonyms is not None:
                entry["synonyms"] = list(
                    dict.fromkeys(s.strip() for s in synonyms if s.strip())
                )
            else:
                current = list(entry.get("synonyms", []))
                if add_synonyms:
                    existing = set(current)
                    for s in add_synonyms:
                        s = s.strip()
                        if s and s not in existing:
                            current.append(s)
                            existing.add(s)
                if remove_synonyms:
                    remove_set = {s.strip() for s in remove_synonyms}
                    current = [s for s in current if s not in remove_set]
                entry["synonyms"] = current

            if sources is not None:
                entry["sources"] = list(dict.fromkeys(sources))

            entry["updated_at"] = self._now_iso()
            self._data[canonical] = entry
            self._rebuild_reverse_index()
            self._save()
            logger.info("food_synonym_dict updated: {}", canonical)
            return dict(entry)

    def delete(self, canonical: str) -> bool:
        """刪除條目。"""
        canonical = canonical.strip()
        with self._lock:
            if canonical not in self._data:
                return False

            del self._data[canonical]
            self._rebuild_reverse_index()
            self._save()
            logger.info("food_synonym_dict deleted: {}", canonical)
            return True

    # ── 查詢 ─────────────────────────────────────────────────────

    def lookup_synonym(self, term: str) -> dict[str, Any] | None:
        """雙向查詢：先查 canonical，再查反向索引。"""
        term = term.strip()
        with self._lock:
            entry = self._data.get(term)
            if entry:
                return dict(entry)

            canonical = self._reverse.get(term.lower())
            if canonical:
                entry = self._data.get(canonical)
                return dict(entry) if entry else None

            return None

    def list_all(
        self,
        language: str | None = None,
        limit: int = 100,
        offset: int = 0,
    ) -> list[dict[str, Any]]:
        """列出所有條目，可依語言篩選，支援分頁。"""
        with self._lock:
            entries = list(self._data.values())
            if language:
                entries = [e for e in entries if e.get("language") == language]
            return [dict(e) for e in entries[offset : offset + limit]]

    def search(self, query: str, limit: int = 20) -> list[dict[str, Any]]:
        """子字串搜尋（canonical 和 synonyms）。"""
        q = query.strip().lower()
        if not q:
            return []

        with self._lock:
            results: list[dict[str, Any]] = []
            for entry in self._data.values():
                if q in entry["canonical"].lower():
                    results.append(dict(entry))
                    continue
                if any(q in syn.lower() for syn in entry.get("synonyms", [])):
                    results.append(dict(entry))
                if len(results) >= limit:
                    break
            return results

    def merge_expanded(self, result: Any) -> dict[str, Any]:
        """
        合併 ExpandedResult 到辭典。
        已存在 → union synonyms/sources；不存在 → create。
        """
        canonical = result.canonical.strip()
        all_syns: list[str] = []
        seen: set[str] = set()
        for s in result.zh_synonyms + result.en_synonyms:
            s = s.strip()
            if s and s != canonical and s not in seen:
                seen.add(s)
                all_syns.append(s)

        sources = sorted(result.sources) if result.sources else ["auto"]

        with self._lock:
            existing = self._data.get(canonical)
            if existing:
                return self.update(
                    canonical,
                    add_synonyms=all_syns,
                    sources=list(
                        dict.fromkeys(existing.get("sources", []) + sources)
                    ),
                )
            else:
                return self.create(
                    canonical=canonical,
                    language=result.language,
                    synonyms=all_syns,
                    sources=sources,
                )

    def stats(self) -> dict[str, Any]:
        """統計資訊。"""
        with self._lock:
            total = len(self._data)
            zh_count = sum(
                1 for e in self._data.values() if e.get("language") == "zh"
            )
            en_count = sum(
                1 for e in self._data.values() if e.get("language") == "en"
            )
            total_synonyms = sum(
                len(e.get("synonyms", [])) for e in self._data.values()
            )
            return {
                "total_entries": total,
                "zh_entries": zh_count,
                "en_entries": en_count,
                "total_synonyms": total_synonyms,
            }


food_synonym_store = FoodSynonymStore(settings.food_synonym_dict_path)
