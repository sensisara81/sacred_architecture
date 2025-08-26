# Euystacio Sacred Platform - Docker Container
# Red Code Witnessed - Containerized Deployment

FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY app/ ./app/
COPY .env .

# Create database directory
RUN mkdir -p /app/data

# Expose port
EXPOSE 5000

# Environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production
ENV DATABASE_URL=sqlite:///data/euystacio_sacred.db

# Initialize database and start application
CMD ["sh", "-c", "cd app && python -c 'import sqlite3; from werkzeug.security import generate_password_hash; conn = sqlite3.connect(\"../data/euystacio_sacred.db\"); c = conn.cursor(); c.execute(\"CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT, role TEXT)\"); c.execute(\"CREATE TABLE IF NOT EXISTS pulses (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, author TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)\"); c.execute(\"INSERT OR IGNORE INTO users (username, password, role) VALUES (?, ?, ?)\", (\"woodstone\", generate_password_hash(\"threefold-zes\"), \"admin\")); conn.commit(); conn.close()' && gunicorn -w 4 -b 0.0.0.0:5000 app:app"]
