FROM python:3.11-slim

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir uvicorn fastapi

# Expose ports
EXPOSE 8000

# Default command - start the API server
CMD ["uvicorn", "server.api:app", "--host", "0.0.0.0", "--port", "8000"]
