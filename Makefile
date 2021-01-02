build:
    gcloud artifacts repositories create kiryu_finance --repository-format=docker \
        --location=us-central1 --description="Docker repository"