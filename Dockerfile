FROM python:3.11-alpine
WORKDIR /app
COPY app.py .

# Force upgrade of core Python packages to patch library vulnerabilities
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

RUN adduser -D appuser && chown -R appuser /app
USER appuser
CMD ["python", "app.py"]
