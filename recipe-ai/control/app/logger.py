"""
logger.py - loguru 全域設定
所有服務透過 from app.logger import logger 取得同一個實例
"""
import sys
from pathlib import Path
from loguru import logger

LOG_DIR = Path(__file__).parent.parent / "logs"
LOG_DIR.mkdir(exist_ok=True)


def setup_logger() -> None:
    logger.remove()

    # Console：彩色輸出，INFO+
    logger.add(
        sys.stdout,
        colorize=True,
        format="<green>{time:HH:mm:ss}</green> | <level>{level:<8}</level> | <cyan>{name}</cyan> - {message}",
        level="INFO",
    )

    # 檔案：JSON 結構化，DEBUG+，每日輪替，保留 30 天
    logger.add(
        LOG_DIR / "app_{time:YYYY-MM-DD}.log",
        rotation="00:00",
        retention="30 days",
        serialize=True,       # JSON 格式
        level="DEBUG",
        encoding="utf-8",
    )

    logger.info("Logger 初始化完成，日誌目錄：{}", LOG_DIR)


__all__ = ["logger", "setup_logger"]
