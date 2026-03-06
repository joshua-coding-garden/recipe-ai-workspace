"""logging_middleware.py - 自動 log 每個 request/response"""
import time
import uuid
from fastapi import Request, Response
from starlette.middleware.base import BaseHTTPMiddleware
from loguru import logger


class LoggingMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next) -> Response:
        req_id = str(uuid.uuid4())[:8]
        request.state.request_id = req_id
        start = time.perf_counter()

        logger.info(
            "http_request_start request_id={} method={} path={} client={}",
            req_id, request.method, request.url.path,
            request.client.host if request.client else "unknown",
        )

        response = await call_next(request)
        elapsed_ms = round((time.perf_counter() - start) * 1000, 1)

        logger.info(
            "http_request_end request_id={} status={} latency_ms={}",
            req_id, response.status_code, elapsed_ms,
        )
        return response
