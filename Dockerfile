FROM python:3.11-alpine
WORKDIR /app
COPY app.py requirements.txt .

# 1. Force apk upgrade to patch underlying CVEs (like zlib)
RUN apk update && apk upgrade --no-cache

# 2. Install application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 3. Create a non-root user and set permissions
RUN adduser -D appuser && chown -R appuser /app
USER appuser

# 4. Expose port 80 and start the web server
EXPOSE 80
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
