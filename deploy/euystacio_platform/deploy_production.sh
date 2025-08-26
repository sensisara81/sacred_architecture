#!/bin/bash
# Euystacio Sacred Platform - Production Deployment
# Red Code Witnessed - Production Ready Deployment

cd "$(dirname "$0")"
source venv/bin/activate
source .env

echo "🕊️ Deploying Euystacio Sacred Platform to Production..."
echo "🔒 Production mode enabled"

# Update environment for production
sed -i 's/FLASK_ENV=development/FLASK_ENV=production/' .env
sed -i 's/FLASK_DEBUG=true/FLASK_DEBUG=false/' .env
sed -i 's/SECRET_KEY=euystacio-sacred-rhythm-change-in-production/SECRET_KEY='$(openssl rand -hex 32)'/' .env

# Start with Gunicorn
echo "🚀 Starting with Gunicorn (Production WSGI Server)..."
cd app
gunicorn -w 4 -b 0.0.0.0:5000 app:app --daemon
echo "✅ Production deployment complete"
echo "📡 Access at: http://your-server-ip:5000"
