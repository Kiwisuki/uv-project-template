FROM python:3.14-slim AS builder

WORKDIR /app
ENV UV_COMPILE_BYTECODE=1

COPY pyproject.toml uv.lock ./
RUN pip install --no-cache-dir uv \
 && uv sync --frozen --no-install-project --no-dev

COPY uv_app/ ./uv_app/

FROM python:3.14-slim

WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/uv_app ./uv_app

RUN adduser --disabled-password --gecos '' appuser && chown -R appuser /app
USER appuser

EXPOSE 8080
ENTRYPOINT ["/app/.venv/bin/python", "-m", "uv_app"]
CMD ["main"]
