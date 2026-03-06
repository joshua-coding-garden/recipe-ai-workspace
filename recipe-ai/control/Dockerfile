FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 下載 NLTK WordNet 資料
RUN python -c "import nltk; nltk.download('wordnet'); nltk.download('omw-1.4')"

# 建立隔離 venv 給 argos_worker（避免 spacy + pydantic v2 衝突）
RUN python -m venv /opt/argos_venv \
    && /opt/argos_venv/bin/pip install --no-cache-dir "pydantic<2" argostranslate \
    && /opt/argos_venv/bin/python -c "\
import argostranslate.package; \
argostranslate.package.update_package_index(); \
pkgs = argostranslate.package.get_available_packages(); \
[argostranslate.package.install_from_path(p.download()) \
 for p in pkgs if (p.from_code=='zh' and p.to_code=='en') or \
                  (p.from_code=='en' and p.to_code=='zh')]" || true

COPY . .

RUN mkdir -p logs resources/backups \
    && adduser --disabled-password appuser \
    && chown -R appuser logs resources /home/appuser
USER appuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
