"""
synonym_pipeline.py - 食材同義詞管道協調器

協調 爬蟲 → 食材提取 → 同義詞擴展 → 辭典存儲 的完整流程。
"""
from __future__ import annotations

import asyncio

from loguru import logger

from app.services.synonym_expander import SynonymExpander
from app.services.food_synonym_store import food_synonym_store


class SynonymPipeline:
    """管道協調器：scrape → expand → store。"""

    def __init__(self):
        self._expander = SynonymExpander()
        self._running = False
        self._background_task: asyncio.Task | None = None

    @property
    def is_running(self) -> bool:
        return self._running

    async def run_full(
        self,
        site_keys: list[str] | None = None,
        max_recipes_per_site: int = 50,
    ) -> dict:
        """
        完整管道：爬蟲 → 提取 → 擴展 → 存儲。
        回傳執行統計。
        """
        if self._running:
            raise RuntimeError("Pipeline is already running")

        self._running = True
        try:
            return await self._execute(site_keys, max_recipes_per_site)
        finally:
            self._running = False

    def run_background(
        self,
        site_keys: list[str] | None = None,
        max_recipes_per_site: int = 50,
    ) -> None:
        """非阻塞背景執行管道（用 asyncio.create_task）。"""
        if self._running:
            raise RuntimeError("Pipeline is already running")

        async def _wrapper():
            try:
                await self.run_full(site_keys, max_recipes_per_site)
            except Exception as e:
                logger.error("pipeline_background_failed: {}", e)

        self._background_task = asyncio.create_task(_wrapper())
        logger.info("pipeline_background_started")

    async def _execute(
        self,
        site_keys: list[str] | None,
        max_recipes_per_site: int,
    ) -> dict:
        stats = {
            "scraped": 0,
            "expanded": 0,
            "stored": 0,
            "errors": 0,
            "sites": {},
        }

        # Step 1: 爬蟲（async，直接 await）
        all_ingredients = await self._scrape_async(site_keys, max_recipes_per_site)

        # 扁平化、去重
        seen: set[str] = set()
        unique: list[tuple[str, str]] = []  # (ingredient, source)
        for site_key, ingredients in all_ingredients.items():
            stats["sites"][site_key] = len(ingredients)
            for ing in ingredients:
                norm = ing.strip().lower()
                if norm and norm not in seen:
                    seen.add(norm)
                    unique.append((ing.strip(), f"scraper:{site_key}"))

        stats["scraped"] = len(unique)
        logger.info("pipeline_scraped total_unique={}", len(unique))

        # Step 2-3: 擴展 + 存儲
        for i, (ingredient, source) in enumerate(unique):
            try:
                result = await self._expander.expand(ingredient)
                result.sources.add(source)
                food_synonym_store.merge_expanded(result)
                stats["expanded"] += 1
                stats["stored"] += 1

                if (i + 1) % 20 == 0:
                    logger.info(
                        "pipeline_progress {}/{} expanded",
                        i + 1, len(unique),
                    )
            except Exception as e:
                logger.warning(
                    "pipeline_expand_failed ingredient={} error={}",
                    ingredient, e,
                )
                stats["errors"] += 1

        logger.info("pipeline_complete stats={}", stats)
        return stats

    async def _scrape_async(
        self,
        site_keys: list[str] | None,
        max_recipes_per_site: int,
    ) -> dict[str, list[str]]:
        """非同步爬蟲步驟。"""
        from app.services.ingredient_scraper import IngredientScraper
        from app.services.scraper_configs import SITE_CONFIGS

        scraper = IngredientScraper()
        try:
            if site_keys:
                results = {}
                for key in site_keys:
                    if key in SITE_CONFIGS:
                        results[key] = await scraper.scrape_site(key, max_recipes_per_site)
                    else:
                        logger.warning("pipeline_unknown_site: {}", key)
                return results
            else:
                return await scraper.scrape_all_configured(max_recipes_per_site)
        finally:
            await scraper.close()

    async def expand_single(self, ingredient: str, source: str = "manual") -> dict:
        """擴展單一食材並存入辭典（供 API 使用）。"""
        result = await self._expander.expand(ingredient)
        result.sources.add(source)
        entry = food_synonym_store.merge_expanded(result)
        return entry


synonym_pipeline = SynonymPipeline()
