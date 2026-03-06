from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    db_host: str = "localhost"
    db_port: int = 5432
    db_name: str = "recipe_ai"
    db_user: str = "postgres"
    db_password: str = ""

    class Config:
        env_file = ".env"
        env_prefix = "BACKEND_"


settings = Settings()
