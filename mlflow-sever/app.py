import os

BACKEND = os.environ["BACKEND_STORE_URI"]
ARTIFACT_ROOT = os.environ["ARTIFACT_ROOT"]

os.system(
    f"mlflow server "
    f"--host 0.0.0.0 "
    f"--port 8080 "
    f"--backend-store-uri {BACKEND} "
    f"--default-artifact-root {ARTIFACT_ROOT}"
)
