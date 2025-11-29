from dotenv import find_dotenv
from pydantic_settings import BaseSettings, SettingsConfigDict

DEFAULT_CONFIG_SETTINGS = SettingsConfigDict(
    env_file=find_dotenv(),
    env_file_encoding="utf-8",
    env_ignore_empty=True,
    extra="ignore",
    validate_default=True,
)


class AppSettings(BaseSettings):
    model_config = DEFAULT_CONFIG_SETTINGS
    EXAMPLE_ENV_VARIABLE: str


app_settings = AppSettings()
