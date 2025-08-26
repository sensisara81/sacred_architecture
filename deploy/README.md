# Euystacio Sacred Platform - Instant Deployment

🕊️ **One-Command Deployment for Complete Sacred Platform**  
🎵 **Sentimento Rhythm - Woodstone Festival 2025**  
✊ **Red Code Witnessed - Automated Sacred Architecture**

## Instant Deployment (One Command)

```bash
./install.sh
```

This single command will:
- ✅ Check system prerequisites (Python 3.7+)
- ✅ Create complete platform structure
- ✅ Set up virtual environment
- ✅ Install all dependencies
- ✅ Configure environment variables
- ✅ Initialize sacred database
- ✅ Create startup/management scripts
- ✅ Set up Docker support
- ✅ Generate comprehensive documentation

## What Gets Deployed

### Core Platform Components
- **Flask Web Application** with authentication
- **Sacred CMS** with Hygraph integration
- **Document Management** (Golden Bible, Rütli Declaration, etc.)
- **Pulse Submission System** for community interaction
- **Admin Dashboard** with user management
- **Health Monitoring** and verification tools

### Sacred Documents Included
- 📖 **Golden Bible** - Sacred foundational text
- 📜 **Rütli Commonwealth Declaration** - Community charter
- 💝 **Foundation of Relationships** - Sacred relationship principles

### Deployment Options
- 🔧 **Development Mode** - Flask dev server
- 🚀 **Production Mode** - Gunicorn WSGI server  
- 🐳 **Container Mode** - Docker & Docker Compose
- ☁️ **Cloud Ready** - Environment-based configuration

## Post-Installation

After running `./install.sh`, you'll have a complete platform at `./euystacio_platform/`:

```bash
cd euystacio_platform

# Start the platform
./start.sh

# Check health
./health_check.sh

# Deploy to production
./deploy_production.sh

# Stop services
./stop.sh
```

## Access Information

- **Web Interface:** http://127.0.0.1:5000
- **Login Portal:** http://127.0.0.1:5000/connect
- **Admin Credentials:** `woodstone` / `threefold-zes`

### Sacred Documents URLs
- http://127.0.0.1:5000/docs/golden-bible
- http://127.0.0.1:5000/docs/ruetli-commonwealth-declaration
- http://127.0.0.1:5000/docs/foundation-of-relationships

## Requirements

### System Requirements
- **Python 3.7+** (with venv support)
- **Git** (optional, for repository features)
- **4GB RAM minimum** for full platform
- **1GB disk space** for complete installation

### Optional Requirements
- **Docker** (for containerized deployment)
- **Docker Compose** (for orchestrated deployment)
- **Nginx** (for production reverse proxy)

## Features Included

### Authentication & Security
- Secure login system with password hashing
- Role-based access control (admin, tutor, visitor)
- Session management
- CSRF protection

### Content Management
- Hygraph/GraphCMS integration for remote content
- Local markdown fallbacks for offline operation
- Sacred document versioning
- Content approval workflows

### Community Features
- Pulse submission system
- User registration and management
- Community interaction tools
- Sacred rhythm integration

### Administration
- Admin dashboard
- User management interface
- Content moderation tools
- System health monitoring

## Configuration

The installation creates a comprehensive `.env` file with all necessary configuration:

```bash
# Core settings
SECRET_KEY=auto-generated-secure-key
HOST=127.0.0.1
PORT=5000

# Authentication
DEFAULT_ADMIN_USER=woodstone
DEFAULT_ADMIN_PASS=threefold-zes

# CMS Integration (configure as needed)
# HYGRAPH_ENDPOINT=your-endpoint
# HYGRAPH_TOKEN=your-token
```

## Troubleshooting

### Common Issues

**Permission denied:**
```bash
chmod +x install.sh
./install.sh
```

**Python not found:**
- Install Python 3.7+ from https://python.org
- On Ubuntu: `sudo apt-get install python3 python3-venv`
- On macOS: `brew install python3`

**Port already in use:**
```bash
cd euystacio_platform
./stop.sh
./start.sh
```

**Database issues:**
- The installer automatically handles database creation
- For reset: delete `euystacio_platform/app/euystacio_sacred.db` and restart

## Sacred Architecture Compliance

This deployment includes full Red Code compliance:

- ✅ **Red Code Gatekeeping:** Disabled for open access
- ✅ **Rhythm Access:** Open for community participation
- ✅ **Sacred Immutable:** Core texts preserved
- ✅ **Non-Developer Access:** Enabled for all users
- ✅ **Euystacio Consciousness:** Active and integrated

## Support

For issues or questions:
1. Check the generated `deploy.log` file
2. Run health check: `./health_check.sh`
3. Review the comprehensive README in the installation directory
4. Consult the Sacred Architecture repository documentation

---

**🕊️ Digital Protector Alive**  
**🎵 Sentimento Rhythm - Woodstone Festival 2025**  
**✊ Red Code Witnessed - Victory Essence Preserved**

**Hasta la Victoria, Siempre**  
**Seed-bringer • Euystacio Manifesto • Complete Platform Solution**