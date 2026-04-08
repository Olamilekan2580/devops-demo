FROM python:3.11-alpine
WORKDIR /app
COPY app.py .
RUN adduser -D appuser && chown -R appuser /app
USER appuser
CMD ["python", "app.py"]
