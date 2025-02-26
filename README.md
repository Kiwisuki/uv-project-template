## uv-project-template


## Installation

To create and install virtual environment:

```bash
uv sync
```
During development, you can lint and format code using:

```bash
uv run poe x
```

To export requirements.txt:
```bash
uv export --no-hashes --no-dev --format requirements-txt > requirements.txt
```