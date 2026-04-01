"""
scraper_configs.py - 爬蟲站台 CSS 選擇器設定

CSS 選擇器與爬蟲邏輯分離，站台結構變更時只需修改此檔。
"""
from dataclasses import dataclass


@dataclass
class SiteConfig:
    name: str
    base_url: str
    recipe_list_url: str
    recipe_link_selector: str
    ingredient_container_selector: str
    ingredient_item_selector: str
    language: str
    max_pages: int = 5
    request_delay_sec: float = 2.0


SITE_CONFIGS: dict[str, SiteConfig] = {
    "icook": SiteConfig(
        name="iCook 愛料理",
        base_url="https://icook.tw",
        recipe_list_url="https://icook.tw/categories/{category}?page={page}",
        recipe_link_selector="a.browse-recipe-link",
        ingredient_container_selector=".ingredient-groups",
        ingredient_item_selector=".ingredient-name",
        language="zh",
        max_pages=5,
        request_delay_sec=2.0,
    ),
    "allrecipes": SiteConfig(
        name="AllRecipes",
        base_url="https://www.allrecipes.com",
        recipe_list_url="https://www.allrecipes.com/recipes/?page={page}",
        recipe_link_selector="a.mntl-card-list-items",
        ingredient_container_selector=".mntl-structured-ingredients__list",
        ingredient_item_selector="span[data-ingredient-name='true']",
        language="en",
        max_pages=5,
        request_delay_sec=2.5,
    ),
    # ── 新增站台 ─────────────────────────────────────────────────
    "ytower": SiteConfig(
        name="楊桃美食網",
        base_url="https://www.ytower.com.tw",
        # 楊桃美食網食譜列表：依分類瀏覽，page 用於翻頁
        # NOTE: recipe_list_url 和選擇器需依實際站台 HTML 結構驗證
        recipe_list_url="https://www.ytower.com.tw/recipe/recipe-list.php?page={page}",
        # 食譜列表頁中連向個別食譜的 <a> 連結
        recipe_link_selector="a.recipe-link, .recipe-list a[href*='recipe']",
        # 食材區塊容器
        ingredient_container_selector=".ingredients, .ingredient-list, .recipe-ingredients",
        # 食材個別項目（通常在 <li> 或 <span> 中）
        ingredient_item_selector=".ingredients li, .ingredient-list li, .recipe-ingredients li",
        language="zh",
        max_pages=5,
        request_delay_sec=2.0,
    ),
    "bbcgoodfood": SiteConfig(
        name="BBC Good Food",
        base_url="https://www.bbcgoodfood.com",
        # BBC Good Food 食譜列表頁
        recipe_list_url="https://www.bbcgoodfood.com/search/recipes?page={page}",
        # 搜尋結果中的食譜連結
        # NOTE: 選擇器需依實際站台 HTML 結構驗證
        recipe_link_selector="a.standard-card-new__article-title, a.body-copy-small",
        # 食材區塊容器
        ingredient_container_selector=".recipe__ingredients, .ingredients-list",
        # 食材個別項目
        ingredient_item_selector=".recipe__ingredients li, .ingredients-list li",
        language="en",
        max_pages=5,
        request_delay_sec=2.5,
    ),
}
