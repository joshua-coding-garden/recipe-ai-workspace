"""
ingredient_scraper.py - httpx + BeautifulSoup4 食材名稱爬蟲

從食譜網站爬取食材名稱，支援多站台設定。
使用 httpx.AsyncClient 非同步請求，不依賴 Selenium。
"""
from __future__ import annotations

import asyncio
import random
import re

from loguru import logger

from app.config import settings
from app.services.scraper_configs import SiteConfig, SITE_CONFIGS

try:
    import httpx
except ImportError:
    httpx = None  # type: ignore

try:
    from bs4 import BeautifulSoup
except ImportError:
    BeautifulSoup = None  # type: ignore


# ── 食材清理用 regex ─────────────────────────────────────────────

_ZH_AMOUNT_RE = re.compile(
    r"[\d\.\s½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅛⅜⅝⅞]+"
    r"\s*"
    r"(大匙|小匙|匙|湯匙|茶匙|杯|碗|把|束|片|塊|顆|粒|根|條|支|瓣|包|袋|罐|盒|瓶|段|朵"
    r"|克|公克|公斤|斤|兩|毫升|公升|cc|ml|g|kg|l|oz|lb"
    r"|適量|少許|些許|一些|若干|隨意|酌量|數|幾)?"
)

# 「半條」「半顆」等中文半量詞
_ZH_HALF_AMOUNT_RE = re.compile(
    r"半\s*(大匙|小匙|匙|湯匙|茶匙|杯|碗|把|束|片|塊|顆|粒|根|條|支|瓣|包|袋|罐|盒|瓶|段|朵)"
)

_ZH_EXTRA_RE = re.compile(r"[（(].*?[）)]")

_EN_AMOUNT_RE = re.compile(
    r"^[\d\s/\.\-½⅓⅔¼¾]+\s*"
    r"(cups?|tablespoons?|tbsps?|teaspoons?|tsps?|ounces?|oz"
    r"|pounds?|lbs?|grams?|g|kg|ml|liters?|l|pinch(?:es)?"
    r"|dash(?:es)?|cloves?|slices?|pieces?|stalks?|sprigs?"
    r"|cans?|packages?|bunche?s?|heads?|medium|large|small)\s+",
    re.IGNORECASE,
)

_EN_TRAILING_RE = re.compile(
    r"\s*[,，]\s*(.*)",
)

# ── 預設 User-Agent 列表 ────────────────────────────────────────

_USER_AGENTS = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15",
    "Mozilla/5.0 (X11; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0",
]

_MAX_RETRIES = 3
_RETRY_BACKOFF = 3.0


class IngredientScraper:
    """httpx + BeautifulSoup4 食材爬蟲，支援多站台。"""

    def __init__(self):
        self._client: httpx.AsyncClient | None = None

    async def _get_client(self) -> httpx.AsyncClient:
        """Lazy-init httpx AsyncClient。"""
        if self._client is not None:
            return self._client

        self._client = httpx.AsyncClient(
            headers={
                "User-Agent": random.choice(_USER_AGENTS),
                "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
                "Accept-Language": "zh-TW,zh;q=0.9,en;q=0.8",
            },
            follow_redirects=True,
            timeout=httpx.Timeout(30.0),
        )
        logger.info("httpx async client initialized")
        return self._client

    # ── 主要介面 ─────────────────────────────────────────────────

    async def scrape_site(self, site_key: str, max_recipes: int = 50) -> list[str]:
        """爬取指定站台，回傳去重食材名稱清單。"""
        config = SITE_CONFIGS.get(site_key)
        if not config:
            logger.warning("unknown site_key: {}", site_key)
            return []

        logger.info("scraper_start site={} max_recipes={}", site_key, max_recipes)

        recipe_urls = await self._collect_recipe_urls(config, max_recipes)
        logger.info("scraper_urls_collected site={} count={}", site_key, len(recipe_urls))

        all_ingredients: list[str] = []
        seen: set[str] = set()

        for i, url in enumerate(recipe_urls):
            try:
                ingredients = await self._extract_ingredients_from_page(url, config)
                for ing in ingredients:
                    norm = ing.strip().lower()
                    if norm and norm not in seen:
                        seen.add(norm)
                        all_ingredients.append(ing.strip())
                logger.debug(
                    "scraper_page {}/{} url={} ingredients={}",
                    i + 1, len(recipe_urls), url, len(ingredients),
                )
            except Exception as e:
                logger.warning("scraper_page_failed url={} error={}", url, e)

            await asyncio.sleep(config.request_delay_sec + random.uniform(0, 0.5))

        logger.info(
            "scraper_complete site={} total_ingredients={}",
            site_key, len(all_ingredients),
        )
        return all_ingredients

    async def scrape_all_configured(self, max_recipes_per_site: int = 50) -> dict[str, list[str]]:
        """爬取所有已設定的站台。"""
        results: dict[str, list[str]] = {}
        for key in SITE_CONFIGS:
            results[key] = await self.scrape_site(key, max_recipes_per_site)
        return results

    async def close(self) -> None:
        """關閉 httpx client。"""
        if self._client:
            try:
                await self._client.aclose()
            except Exception:
                pass
            self._client = None
            logger.info("httpx async client closed")

    # ── HTTP 請求（含 retry） ────────────────────────────────────

    async def _fetch(self, url: str) -> str | None:
        """帶重試的 HTTP GET，回傳 HTML 文字或 None。"""
        client = await self._get_client()

        for attempt in range(1, _MAX_RETRIES + 1):
            try:
                resp = await client.get(url)
                if resp.status_code == 200:
                    return resp.text
                logger.debug(
                    "fetch status={} url={} attempt={}",
                    resp.status_code, url, attempt,
                )
            except httpx.TimeoutException:
                logger.debug("fetch timeout url={} attempt={}", url, attempt)
            except httpx.HTTPError as e:
                logger.debug("fetch error url={} attempt={} err={}", url, attempt, e)

            if attempt < _MAX_RETRIES:
                backoff = _RETRY_BACKOFF * attempt + random.uniform(0, 1)
                await asyncio.sleep(backoff)

        logger.warning("fetch_failed_all_retries url={}", url)
        return None

    # ── 內部方法 ─────────────────────────────────────────────────

    async def _collect_recipe_urls(self, config: SiteConfig, max_recipes: int) -> list[str]:
        """從列表頁蒐集食譜 URL。"""
        urls: list[str] = []
        seen: set[str] = set()

        categories = ["all"] if "{category}" in config.recipe_list_url else [""]

        for category in categories:
            for page in range(1, config.max_pages + 1):
                if len(urls) >= max_recipes:
                    break

                list_url = config.recipe_list_url.format(
                    category=category, page=page,
                )

                html = await self._fetch(list_url)
                if not html:
                    break

                soup = BeautifulSoup(html, "html.parser")
                links = soup.select(config.recipe_link_selector)
                if not links:
                    logger.debug("no recipe links on page {}", list_url)
                    break

                for link in links:
                    href = link.get("href")
                    if not href:
                        continue
                    # 處理相對 URL
                    if href.startswith("/"):
                        href = config.base_url.rstrip("/") + href
                    if href not in seen:
                        seen.add(href)
                        urls.append(href)
                        if len(urls) >= max_recipes:
                            break

                await asyncio.sleep(config.request_delay_sec + random.uniform(0, 0.5))

        return urls[:max_recipes]

    async def _extract_ingredients_from_page(self, url: str, config: SiteConfig) -> list[str]:
        """從單一食譜頁面提取食材名稱。"""
        html = await self._fetch(url)
        if not html:
            return []

        soup = BeautifulSoup(html, "html.parser")
        ingredients: list[str] = []

        # 先嘗試用 ingredient item selector
        elements = soup.select(config.ingredient_item_selector)

        # 如果沒找到，嘗試用 container 內所有文字
        if not elements and config.ingredient_container_selector:
            containers = soup.select(config.ingredient_container_selector)
            for container in containers:
                elements.extend(container.select("li, span, p"))

        for elem in elements:
            raw = elem.get_text(strip=True)
            if not raw:
                continue

            cleaned = self._clean_ingredient_name(raw, config.language)
            if cleaned and len(cleaned) >= 1:
                ingredients.append(cleaned)

        return ingredients

    def _clean_ingredient_name(self, raw: str, language: str) -> str | None:
        """
        清理食材文字，去除數量、單位、備註。
        回傳純食材名稱，或 None。
        """
        text = raw.strip()
        if not text:
            return None

        if language == "zh":
            return self._clean_zh(text)
        return self._clean_en(text)

    def _clean_zh(self, text: str) -> str | None:
        """清理中文食材文字。"""
        # 移除括號內容
        text = _ZH_EXTRA_RE.sub("", text)
        # 移除「半條」「半顆」等
        text = _ZH_HALF_AMOUNT_RE.sub("", text)
        # 移除數量與單位
        text = _ZH_AMOUNT_RE.sub("", text)
        # 移除殘留數字和空白
        text = re.sub(r"[\d\s]+", "", text)
        # 移除常見非食材修飾
        text = re.sub(r"^(調味料|醃料|裝飾|其他)[：:]?\s*", "", text)

        text = text.strip()
        if not text or len(text) < 1:
            return None

        # 過濾純標點
        if all(c in "，。、；：！？…—─（）()「」『』【】" for c in text):
            return None

        return text

    def _clean_en(self, text: str) -> str | None:
        """清理英文食材文字。"""
        # 移除前導數量和單位
        text = _EN_AMOUNT_RE.sub("", text)
        # 移除逗號後的備註（如 "chicken breast, cubed"）
        text = _EN_TRAILING_RE.sub("", text)
        # 移除括號
        text = re.sub(r"\(.*?\)", "", text)
        # 移除殘留數字
        text = re.sub(r"^\d+[\s.]*", "", text)

        text = text.strip().strip(",;:.")
        if not text or len(text) < 2:
            return None

        return text.lower()
