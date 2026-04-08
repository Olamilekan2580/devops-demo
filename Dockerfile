FROM python:3.10-slim
WORKDIR /app
COPY app.py .
RUN useradd -m appuser && chown -R appuser /app
USER appuser
CMD ["python", "app.py"]
