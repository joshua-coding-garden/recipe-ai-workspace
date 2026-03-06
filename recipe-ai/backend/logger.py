"""
backend/logger.py - backend 服務全域日誌設定
"""
from pathlib import Path
import sys
from loguru import logger

LOG_DIR = Path(__file__).parent / "logs"
LOG_DIR.mkdir(exist_ok=True)


def setup_logger() -> None:
    logger.remove()

    logger.add(
        sys.stdout,
        level="INFO",
        colorize=True,
        format="<green>{time:YYYY-MM-DD HH:mm:ss.SSS}</green> | <level>{level:<8}</level> | <cyan>{message}</cyan>",
    )

    # 每小時輪替，僅保留近 3 小時；watch=True 可在手動刪檔後自動重建。
    logger.add(
        LOG_DIR / "backend.log",
        level="DEBUG",
        rotation="1 hour",
        retention="3 hours",
        encoding="utf-8",
        watch=True,
        enqueue=False,
        backtrace=False,
        diagnose=False,
        format="{time:YYYY-MM-DD HH:mm:ss.SSS} | {level:<8} | {message}",
    )

    logger.info("BACKEND_LOGGER_READY log_dir={}", LOG_DIR)


__all__ = ["logger", "setup_logger"]
