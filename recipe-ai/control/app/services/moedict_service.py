import json
from pathlib import Path

from loguru import logger

from app.config import settings


class MoeDictService:
    def __init__(self, path: str):
        self._map: dict[str, list[str]] = {}
        self._load(path)

    def _load(self, path: str) -> None:
        try:
            p = Path(path)
            if not p.is_absolute():
                p = Path(__file__).resolve().parents[2] / path
            if not p.exists():
                logger.warning("moedict synonyms file not found: {}", p)
                return

            data = json.loads(p.read_text(encoding="utf-8"))
            if not isinstance(data, dict):
                logger.warning("moedict synonyms file is not a json object: {}", p)
                return

            normalized: dict[str, list[str]] = {}
            for key, values in data.items():
                if not isinstance(key, str) or not isinstance(values, list):
                    continue
                cleaned = [str(v).strip() for v in values if str(v).strip()]
                if cleaned:
                    normalized[key.strip()] = cleaned

            self._map = normalized
            logger.info("moedict synonyms loaded: {} entries", len(self._map))
        except Exception as e:
            logger.warning("failed to load moedict synonyms: {}", e)

    def get_synonyms(self, term: str, limit: int = 6) -> list[str]:
        base = term.strip()
        if not base:
            return []

        vals = self._map.get(base, [])
        out: list[str] = []
        seen: set[str] = set()
        for item in vals:
            token = item.strip()
            if not token or token == base or token in seen:
                continue
            seen.add(token)
            out.append(token)
            if len(out) >= limit:
                break
        return out


moedict_service = MoeDictService(settings.moedict_synonyms_path)
