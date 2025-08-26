#!/bin/bash
# Euystacio Sacred Platform - Health Check

HOST=${HOST:-127.0.0.1}
PORT=${PORT:-5000}

echo "🔍 Checking Euystacio Sacred Platform Health..."

# Check if service is running
if curl -f -s "http://$HOST:$PORT" > /dev/null; then
    echo "✅ Sacred Platform is running"
    echo "📡 Web Interface: http://$HOST:$PORT"
    echo "🔐 Login Portal: http://$HOST:$PORT/connect"
    echo "📚 Sacred Docs: http://$HOST:$PORT/docs/golden-bible"
else
    echo "❌ Sacred Platform is not responding"
    echo "🔧 Try running: ./start.sh"
    exit 1
fi

# Check database
if [ -f "app/euystacio_sacred.db" ]; then
    echo "✅ Sacred Database accessible"
else
    echo "⚠️ Sacred Database not found"
fi
