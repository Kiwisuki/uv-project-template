# Repository Guidelines

## Project Structure & Module Organization
- `uv_app/` holds application code (`settings.py` for env-loaded config, `logging_config.py` for basic logging, `__main__.py` entrypoint placeholder). Keep new modules small and focused; prefer `uv_app/feature/<module>.py` for grouped logic.
- `tests/` contains pytest suites; mirror module paths (e.g., `uv_app/example_util.py` → `tests/example_util_test.py`).
- `notebooks/` is for exploratory work; avoid depending on it for runtime logic and keep outputs trimmed before committing.
- Root files: `pyproject.toml` (project + tooling), `uv.lock` (dependency lock), `Dockerfile` (runtime build), `README.md` (quickstart).

## Build, Test, and Development Commands
- Install + sync env: `uv sync` (creates venv and installs deps).
- Run full format + lint: `uv run poe x` (runs `ruff format` then `ruff check --fix`).
- Tests: `uv run pytest` (add `-k <pattern>` for focused runs).

## Dependency Management
- Use `uv add <package>` to add dependencies; this updates `pyproject.toml` and `uv.lock`.
- For dev dependencies, use `uv add --dev <package>`.
- To remove packages, use `uv remove <package>`.

# Docker & Containerization
- The `Dockerfile.main` sets up a lightweight Python environment using the locked dependencies from `uv.lock`.
- The `Dockerfile.tests` sets up a pytest environment for running tests in a containerized setup.
- Use `docker compose build` to build images.
- Use `docker compose up main` to build and run the app container or `docker compose run main` if application is job-based.
- Use `docker compose run tests` to run tests in a containerized environment.

## Coding Style & Naming Conventions
- Python 3.14; Use type hints on. Use double quotes (enforced by ruff `flake8-quotes`), Google-style docstrings when needed.
- Follow Ruff config (`select = ["ALL"]` with targeted ignores). Keep new ignores local and justified.
- Modules and files: lowercase with underscores; classes: `PascalCase`; functions/vars: `snake_case`. Tests mirror subject names and use descriptive test function names.

## Testing Guidelines
- Framework: pytest. Parametrize where inputs vary.
- Place unit tests alongside corresponding modules under `tests/`; name files `<module>_test.py`.
- Add regression tests with clear arrange/act/assert sections. Aim to cover new branches; prefer deterministic data over randomness.

## Configuration & Secrets
- Settings load via `pydantic-settings` with `.env` discovery (`find_dotenv`). Keep secrets out of git; document required keys in `.env.example` if adding new settings.
- Seperate settings classes based on purpose, for example PostgresSettings, AppSettings, etc.