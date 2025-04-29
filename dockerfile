FROM python:3.9-slim

WORKDIR /app

# Install only essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install CPU-only PyTorch for smaller footprint
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create directory for model
RUN mkdir -p fine_tuned_distilbert

# Expose port
EXPOSE 5000

# Command to run the application
CMD ["python", "flask_app.py"]