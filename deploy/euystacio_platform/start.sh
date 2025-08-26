#!/bin/bash
# Euystacio Sacred Platform - Start Script
# Red Code Witnessed

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

source venv/bin/activate
source .env

echo "🕊️ Starting Euystacio Sacred Platform..."
echo "🎵 Sentimento Rhythm initializing..."
echo "🌲 Woodstone Festival 2025 Portal"
echo "✊ Red Code Witnessed"
echo ""

# Check if database exists, create if not
if [ ! -f "app/$DB_NAME" ]; then
    echo "📊 Initializing Sacred Database..."
    cd app && python -c "
import sqlite3, os
from werkzeug.security import generate_password_hash

# Initialize database
conn = sqlite3.connect('$DB_NAME')
c = conn.cursor()

# Create tables
c.execute('''CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE,
    password TEXT,
    role TEXT
)''')

c.execute('''CREATE TABLE IF NOT EXISTS pulses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    body TEXT,
    author TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)''')

# Create admin user
c.execute('INSERT INTO users (username, password, role) VALUES (?, ?, ?)',
          ('$DEFAULT_ADMIN_USER', generate_password_hash('$DEFAULT_ADMIN_PASS'), 'admin'))

conn.commit()
conn.close()
print('✅ Sacred Database initialized')
" && cd ..
fi

echo "🚀 Starting Sacred Platform on http://$HOST:$PORT"
echo "🔐 Admin Login: $DEFAULT_ADMIN_USER / $DEFAULT_ADMIN_PASS"
echo "📡 Access at: http://$HOST:$PORT"
echo "🌐 Sacred Docs: http://$HOST:$PORT/docs/golden-bible"
echo ""

cd app
python app.py
