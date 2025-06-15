FROM python:3.13-slim AS builder

WORKDIR /app

ENV UV_PROJECT_ENVIRONMENT="/usr/local/" \
    UV_COMPILE_BYTECODE=1

COPY pyproject.toml uv.lock /app/
COPY uv_app/ ./uv_app/

RUN pip install --no-cache-dir uv
RUN uv sync --frozen --no-install-project --no-dev

FROM python:3.13-slim

WORKDIR /app
COPY --from=builder /app /app
COPY --from=builder /usr/local/ /usr/local/
EXPOSE 8080

CMD ["python", "-m", "uv_app"]