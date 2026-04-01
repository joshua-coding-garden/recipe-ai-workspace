import json
from pathlib import Path

from loguru import logger

from app.config import settings


class AliasService:
    def __init__(self, path: str):
        self._aliases: dict[str, list[str]] = {}
        self._load(path)

    def _load(self, path: str) -> None:
        try:
            p = Path(path)
            if not p.is_absolute():
                p = Path(__file__).resolve().parents[2] / path
            if not p.exists():
                logger.warning("alias override file not found: {}", p)
                return

            data = json.loads(p.read_text(encoding="utf-8"))
            if not isinstance(data, dict):
                logger.warning("alias override file is not a json object: {}", p)
                return

            normalized: dict[str, list[str]] = {}
            for k, vals in data.items():
                if not isinstance(k, str) or not isinstance(vals, list):
                    continue
                key = k.strip().lower()
                cleaned = [str(v).strip() for v in vals if str(v).strip()]
                if cleaned:
                    normalized[key] = cleaned

            self._aliases = normalized
            logger.info("alias overrides loaded: {} entries", len(self._aliases))
        except Exception as e:
            logger.warning("failed to load alias overrides: {}", e)

    def get_aliases(self, key: str, limit: int = 6) -> list[str]:
        k = key.strip().lower()
        if not k:
            return []
        vals = self._aliases.get(k, [])
        out: list[str] = []
        seen: set[str] = set()
        for v in vals:
            token = v.strip()
            if not token or token in seen:
                continue
            seen.add(token)
            out.append(token)
            if len(out) >= limit:
                break
        return out


alias_service = AliasService(settings.food_alias_overrides_path)
