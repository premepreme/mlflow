FROM python:3.11-slim

RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir mlflow psycopg2-binary gunicorn

ENV PORT=8080
ENV MLFLOW_ENABLE_SERVE_NO_PERMISSION=True

CMD mlflow server \
    --host 0.0.0.0 \
    --port ${PORT} \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --default-artifact-root ${ARTIFACT_ROOT} \
    --gunicorn-opts="--timeout 120 --log-level debug"
