FROM python:3.11-slim

RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir mlflow==2.9.2 psycopg2-binary gunicorn

ENV PORT=8080
ENV MLFLOW_ENABLE_SERVE_NO_PERMISSION=true
ENV MLFLOW_SERVER_SKIP_HOST_CHECK=true
ENV GUNICORN_CMD_ARGS="--forwarded-allow-ips='*'"

CMD mlflow server \
    --host 0.0.0.0 \
    --port ${PORT} \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --default-artifact-root ${ARTIFACT_ROOT}
