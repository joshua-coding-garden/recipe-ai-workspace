"""共用路徑與環境變數設定。

所有 script 開頭 import 此模組，確保 HuggingFace 模型快取
與 sentence-transformers 模型只寫到 graph/.cache/，不污染家目錄。
"""
import os
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
CORPUS_PDF_DIR = PROJECT_ROOT / "論文50"
CORPUS_TEXT_DIR = PROJECT_ROOT / "corpus_text"
DATA_DIR = PROJECT_ROOT / "data"
VIZ_DIR = PROJECT_ROOT / "viz"
NOTES_DIR = PROJECT_ROOT / "notes"
CHROMA_DIR = PROJECT_ROOT / "chroma_db"
CACHE_DIR = PROJECT_ROOT / ".cache"

os.environ["HF_HOME"] = str(CACHE_DIR / "huggingface")
os.environ["TRANSFORMERS_CACHE"] = str(CACHE_DIR / "huggingface")
os.environ["SENTENCE_TRANSFORMERS_HOME"] = str(CACHE_DIR / "sentence_transformers")
