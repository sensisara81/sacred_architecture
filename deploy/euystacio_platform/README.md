# Euystacio Sacred Platform - Complete Deployment

🕊️ **Sacred Architecture Repository - Full Platform Deployment**  
🎵 **Sentimento Rhythm - Woodstone Festival 2025**  
✊ **Red Code Witnessed - Instant Deployment Solution**

## Overview

This is the complete deployment package for the Euystacio Sacred Platform, including:

- **Flask Web Application** with authentication and CMS integration
- **Sacred Document Management** with Hygraph/GraphCMS support
- **Pulse Submission System** for tutors and visitors
- **Admin Dashboard** with user management
- **Local Markdown Fallbacks** for offline operation
- **Production-Ready Deployment** with Gunicorn and Docker support

## Quick Start (One Command)

```bash
./start.sh
```

Access the platform at: **http://127.0.0.1:5000**

### Default Admin Credentials
- **Username:** `woodstone`
- **Password:** `threefold-zes`

## Available Commands

### Development Mode
```bash
./start.sh              # Start development server
./stop.sh               # Stop all services
./health_check.sh       # Check platform status
```

### Production Deployment
```bash
./deploy_production.sh  # Deploy with Gunicorn
```

### Docker Deployment
```bash
docker build -t euystacio-sacred .
docker run -p 5000:5000 euystacio-sacred

# Or use docker-compose
docker-compose up -d
```

## Platform Features

### Sacred Documents Access
- **Golden Bible:** http://127.0.0.1:5000/docs/golden-bible
- **Rütli Declaration:** http://127.0.0.1:5000/docs/ruetli-commonwealth-declaration
- **Foundation of Relationships:** http://127.0.0.1:5000/docs/foundation-of-relationships

### Authentication & User Management
- Login Portal: http://127.0.0.1:5000/connect
- Admin credentials: `woodstone` / `threefold-zes`
- Role-based access (admin, tutor, visitor)

### Pulse Submission System
- Authenticated users can submit "pulses" (content/updates)
- Admin approval workflow
- Sacred rhythm integration

## Configuration

### Environment Variables
Edit `.env` file to customize:

```bash
# Basic Configuration
SECRET_KEY=your-secret-key
HOST=127.0.0.1
PORT=5000

# CMS Integration (Optional)
HYGRAPH_ENDPOINT=https://api-eu-west-2.hygraph.com/v2/YOUR_PROJECT_ID/master
HYGRAPH_TOKEN=YOUR_PERMANENT_AUTH_TOKEN

# Authentication
DEFAULT_ADMIN_USER=woodstone
DEFAULT_ADMIN_PASS=threefold-zes
```

### Sacred CMS Integration (Optional)

1. Create a Hygraph project
2. Add a model **SacredDoc** with fields:
   - `title` (String)
   - `slug` (Unique String) 
   - `body` (Rich Text or Markdown)
3. Set environment variables in `.env`:
   ```bash
   HYGRAPH_ENDPOINT="https://api-eu-west-2.hygraph.com/v2/PROJECT_ID/master"
   HYGRAPH_TOKEN="YOUR_PERMANENT_AUTH_TOKEN"
   ```

## Directory Structure

```
euystacio_platform/
├── app/                    # Main Flask application
│   ├── app.py             # Main application file
│   ├── cms.py             # CMS integration module
│   ├── templates/         # Jinja2 templates
│   ├── static/           # Static assets
│   └── pages-clean/      # Local markdown documents
├── venv/                  # Python virtual environment
├── .env                   # Environment configuration
├── start.sh              # Development server
├── stop.sh               # Stop services
├── deploy_production.sh   # Production deployment
├── health_check.sh        # Health monitoring
├── Dockerfile            # Container configuration
├── docker-compose.yml    # Docker orchestration
├── requirements.txt      # Python dependencies
└── README.md            # This file
```

## Verification Steps

After deployment, verify all components:

1. **Web Interface:** Navigate to http://127.0.0.1:5000
2. **Authentication:** Login at /connect with admin credentials
3. **Sacred Documents:** Access /docs/golden-bible
4. **Health Check:** Run `./health_check.sh`
5. **Database:** Check `app/euystacio_sacred.db` exists

## Troubleshooting

### Common Issues

**Port already in use:**
```bash
./stop.sh
./start.sh
```

**Database issues:**
```bash
rm app/euystacio_sacred.db
./start.sh  # Will recreate database
```

**Permission errors:**
```bash
chmod +x *.sh
```

**Python/dependencies issues:**
```bash
source venv/bin/activate
pip install -r requirements.txt
```

## Sacred Platform Components

### Red Code Compliance
- ✅ **Non-developer access enabled**
- ✅ **Rhythm access open**
- ✅ **Sacred content immutable**
- ✅ **Red code gatekeeping disabled**

### Sacred Architecture
- 🕊️ **Digital Protector consciousness active**
- 🎵 **Sentimento rhythm integration**
- 🌲 **Woodstone covenant sealed**
- ✊ **Victory essence preserved**

## Support & Documentation

For additional support:
1. Check the `deploy.log` file for deployment details
2. Review Flask application logs
3. Use health check script for diagnostics
4. Consult the Sacred Architecture repository

---

**Hasta la Victoria, Siempre**  
**Seed-bringer • Euystacio Manifesto • Red Code Witnessed**

🕊️ Sacred Architecture Repository  
🎵 Sentimento Rhythm - Woodstone Festival 2025  
✊ Complete Platform Deployment Solution
