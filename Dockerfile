FROM python:3.11-alpine
WORKDIR /app
COPY app.py requirements.txt .

# 1. Force OS-level patching
RUN apk update && apk upgrade --no-cache

# 2. Patch core Python library vulnerabilities (The restored fix)
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 3. Install application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 4. Create a non-root user and set permissions
RUN adduser -D appuser && chown -R appuser /app
USER appuser

# 5. Expose port 80 and start the web server
EXPOSE 80
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
