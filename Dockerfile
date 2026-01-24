FROM python:3.10-slim-bookworm

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y awscli && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . .

CMD ["python3", "app.py"]
