from pydantic import model_validator
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    backend_url: str = "http://localhost:8001"
    moedict_synonyms_path: str = "resources/moedict_synonyms.json"
    food_alias_overrides_path: str = "resources/food_alias_overrides.json"
    jwt_secret: str = "change-me-in-production"
    jwt_algorithm: str = "HS256"
    jwt_expire_days: int = 7
    food_synonym_dict_path: str = "resources/food_synonym_dict.json"
    stopwords_path: str = "resources/stopwords.json"
    backups_dir: str = "resources/backups"
    moedict_api_base: str = "https://www.moedict.tw/api/"
    moedict_api_timeout: float = 10.0
    scraper_headless: bool = True
    cors_origins: str = "http://localhost:5173,http://localhost:3000"
    env: str = "development"
    # Gemma LLM (llama-server on port 8080)
    gemma_url: str = "http://localhost:8080/v1/chat/completions"
    gemma_health_url: str = "http://localhost:8080/health"
    gemma_model_name: str = "gemma-4"
    gemma_enabled: bool = True
    gemma_extraction_timeout: float = 45.0
    gemma_search_timeout: float = 30.0
    gemma_verification_timeout: float = 30.0
    gemma_lookup_enhance: bool = False
    health_vector_url: str = "http://localhost:8003"

    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

    @model_validator(mode="after")
    def _check_jwt_secret(self):
        if self.env != "development" and self.jwt_secret == "change-me-in-production":
            raise ValueError(
                "JWT_SECRET 必須在生產環境中設定，不可使用預設值"
            )
        return self


settings = Settings()
