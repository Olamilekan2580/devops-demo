FROM python:3.11-alpine
WORKDIR /app
COPY app.py .

# Production Standard: Force update of all Alpine OS packages to patch underlying CVEs (like zlib)
RUN apk update && apk upgrade --no-cache

# Force upgrade of core Python packages
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

RUN adduser -D appuser && chown -R appuser /app
USER appuser
CMD ["python", "app.py"]
