"""
backend/middleware/logging_middleware.py - 每個請求的 backend 診斷日誌
"""
import time
import uuid
from fastapi import Request, Response
from starlette.middleware.base import BaseHTTPMiddleware
from logger import logger


class LoggingMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next) -> Response:
        req_id = str(uuid.uuid4())[:8]
        request.state.request_id = req_id
        start = time.perf_counter()

        logger.info(
            "BACKEND_REQUEST_START request_id={} method={} path={} query={} client={}",
            req_id,
            request.method,
            request.url.path,
            str(request.url.query or ""),
            request.client.host if request.client else "unknown",
        )

        response = await call_next(request)
        elapsed_ms = round((time.perf_counter() - start) * 1000, 1)

        logger.info(
            "BACKEND_REQUEST_END request_id={} status={} latency_ms={}",
            req_id,
            response.status_code,
            elapsed_ms,
        )
        return response
