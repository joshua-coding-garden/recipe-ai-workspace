"""
audit_log_service.py - 系統審計日誌

獨立於 app log,專門記錄「誰在何時對什麼資源做了什麼變更」。
JSON 結構化寫入 control/logs/audit_YYYY-MM-DD.log,保留 90 天。
"""
from __future__ import annotations

import sys
from pathlib import Path
from typing import Any

from fastapi import Request
from loguru import logger as _root_logger

_LOG_DIR = Path(__file__).resolve().parents[2] / "logs"
_LOG_DIR.mkdir(exist_ok=True)

_AUDIT_TAG = "AUDIT"
_audit_configured = False


def _ensure_sink() -> None:
    global _audit_configured
    if _audit_configured:
        return
    _root_logger.add(
        _LOG_DIR / "audit_{time:YYYY-MM-DD}.log",
        rotation="00:00",
        retention="90 days",
        serialize=True,
        level="INFO",
        encoding="utf-8",
        filter=lambda record: record["extra"].get("audit") is True,
    )
    _audit_configured = True


def _extract_actor(actor: dict[str, Any] | None) -> dict[str, Any]:
    if not actor:
        return {"id": None, "email": None}
    return {
        "id": actor.get("sub"),
        "email": actor.get("email"),
    }


def log(
    action: str,
    *,
    actor: dict[str, Any] | None = None,
    target: str | None = None,
    before: Any = None,
    after: Any = None,
    request: Request | None = None,
    extra: dict[str, Any] | None = None,
) -> None:
    """
    寫入一筆審計事件。

    action: 事件代碼,建議 `domain.verb` 格式 (e.g. "stopword.create")
    actor:  JWT payload dict (含 sub / email)
    target: 被操作資源的識別字 (e.g. 詞彙本身)
    before: 變更前狀態 (可為 None)
    after:  變更後狀態 (可為 None)
    request: FastAPI Request,用來抽出 IP 與 request_id
    extra:  額外自訂欄位
    """
    _ensure_sink()

    client_ip: str | None = None
    request_id: str | None = None
    if request is not None:
        try:
            client_ip = request.client.host if request.client else None
            request_id = getattr(request.state, "request_id", None)
        except Exception:
            pass

    payload: dict[str, Any] = {
        "audit": True,
        "action": action,
        "actor": _extract_actor(actor),
        "target": target,
        "before": before,
        "after": after,
        "ip": client_ip,
        "request_id": request_id,
    }
    if extra:
        payload["extra"] = extra

    _root_logger.bind(**payload).info(f"{_AUDIT_TAG} {action}")


__all__ = ["log"]
