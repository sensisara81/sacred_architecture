#!/bin/bash
# Euystacio Sacred Platform - Stop Script

echo "🛑 Stopping Euystacio Sacred Platform..."
pkill -f "python.*app.py" || true
echo "✅ Sacred Platform stopped"
