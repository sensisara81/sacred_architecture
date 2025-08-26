#!/bin/bash

# Euystacio Sacred Platform - One-Command Instant Deploy
# Sacred Architecture Repository - Complete Deployment Solution
# Red Code Witnessed - Automated Sacred Platform Initialization

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Sacred symbols
SACRED_SYMBOL="🕊️"
RHYTHM_SYMBOL="🎵"
WOODSTONE_SYMBOL="🌲"
VICTORY_SYMBOL="✊"

echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}                EUYSTACIO SACRED PLATFORM                ${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}            One-Command Instant Deployment              ${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
echo -e "${CYAN}              ${RHYTHM_SYMBOL} Sentimento Rhythm ${RHYTHM_SYMBOL}${NC}"
echo -e "${CYAN}              ${WOODSTONE_SYMBOL} Woodstone Festival 2025 ${WOODSTONE_SYMBOL}${NC}"
echo -e "${CYAN}              ${VICTORY_SYMBOL} Red Code Witnessed ${VICTORY_SYMBOL}${NC}"
echo ""

# Configuration
INSTALL_DIR="$(pwd)/euystacio_platform"
PYTHON_CMD="python3"
VENV_DIR="$INSTALL_DIR/venv"
APP_DIR="$INSTALL_DIR/app"
LOG_FILE="$INSTALL_DIR/deploy.log"

# Ensure we're in the right location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo -e "${BLUE}🔍 Initializing Sacred Platform Deployment...${NC}"
echo "📍 Repository Root: $REPO_ROOT"
echo "🎯 Install Directory: $INSTALL_DIR"
echo ""

# Function to log messages
log_message() {
    if [ -f "$LOG_FILE" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
    fi
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to display status
show_status() {
    local status=$1
    local message=$2
    if [ "$status" -eq 0 ]; then
        echo -e "${GREEN}✅ $message${NC}"
        log_message "SUCCESS: $message"
    else
        echo -e "${RED}❌ $message${NC}"
        log_message "ERROR: $message"
        exit 1
    fi
}

# Function to display progress
show_progress() {
    echo -e "${YELLOW}⚡ $1${NC}"
    log_message "PROGRESS: $1"
}

# Check prerequisites
echo -e "${BLUE}🔧 Checking System Prerequisites...${NC}"

# Check Python
if command_exists python3; then
    PYTHON_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2)
    show_status 0 "Python 3 found (version: $PYTHON_VERSION)"
elif command_exists python; then
    PYTHON_VERSION=$(python --version 2>&1 | cut -d' ' -f2)
    if [[ $PYTHON_VERSION == 3.* ]]; then
        PYTHON_CMD="python"
        show_status 0 "Python 3 found (version: $PYTHON_VERSION)"
    else
        show_status 1 "Python 3 required but not found"
    fi
else
    echo -e "${RED}❌ Python 3 not found. Please install Python 3.7+ from https://python.org${NC}"
    exit 1
fi

# Check if we can create virtual environments
if ! $PYTHON_CMD -m venv --help > /dev/null 2>&1; then
    echo -e "${RED}❌ Python venv module not available. Please install python3-venv${NC}"
    echo "On Ubuntu/Debian: sudo apt-get install python3-venv"
    echo "On CentOS/RHEL: sudo yum install python3-venv"
    exit 1
fi

# Check git
if command_exists git; then
    show_status 0 "Git found"
else
    echo -e "${YELLOW}⚠️ Git not found. Some features may be limited.${NC}"
fi

# Create installation directory
show_progress "Creating Sacred Platform directory structure..."
mkdir -p "$INSTALL_DIR"
mkdir -p "$APP_DIR"
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# Copy application files
show_progress "Copying Sacred Platform components..."

# Copy the main Flask application
if [ -d "$REPO_ROOT/woodstone_festival_2025_fullpack_cms_ai" ]; then
    # Copy app files directly to app directory
    if [ -d "$REPO_ROOT/woodstone_festival_2025_fullpack_cms_ai/app" ]; then
        cp -r "$REPO_ROOT/woodstone_festival_2025_fullpack_cms_ai/app/"* "$APP_DIR/"
    fi
    # Copy pages-clean to app directory
    if [ -d "$REPO_ROOT/woodstone_festival_2025_fullpack_cms_ai/pages-clean" ]; then
        cp -r "$REPO_ROOT/woodstone_festival_2025_fullpack_cms_ai/pages-clean" "$APP_DIR/"
    fi
    show_status 0 "Main application copied"
else
    show_status 1 "Main application directory not found"
fi

# Copy additional deployment assets
if [ -d "$REPO_ROOT/Euystacio_Full_Deployment" ]; then
    cp -r "$REPO_ROOT/Euystacio_Full_Deployment" "$INSTALL_DIR/deployment_assets"
    show_status 0 "Deployment assets copied"
fi

# Create virtual environment
show_progress "Creating Sacred Python Environment..."
cd "$INSTALL_DIR"
$PYTHON_CMD -m venv venv
show_status $? "Virtual environment created"

# Activate virtual environment
source "$VENV_DIR/bin/activate"
show_status $? "Virtual environment activated"

# Upgrade pip
show_progress "Upgrading pip..."
pip install --upgrade pip > /dev/null 2>&1
show_status $? "Pip upgraded"

# Install dependencies
show_progress "Installing Sacred Dependencies..."
pip install flask markdown requests werkzeug gunicorn > /dev/null 2>&1
show_status $? "Core dependencies installed"

# Optional: Install additional packages
pip install python-dotenv sqlite-web > /dev/null 2>&1 || true
log_message "Optional dependencies installed (python-dotenv, sqlite-web)"

# Create environment configuration
show_progress "Creating Sacred Configuration..."

cat > "$INSTALL_DIR/.env" << 'EOF'
# Euystacio Sacred Platform Configuration
# Red Code Witnessed - Sacred Environment Variables

# Application Configuration
FLASK_APP=app.py
FLASK_ENV=development
FLASK_DEBUG=true
SECRET_KEY=euystacio-sacred-rhythm-change-in-production

# Database Configuration
DATABASE_URL=sqlite:///euystacio_sacred.db
DB_NAME=euystacio_sacred.db

# Sacred Content Configuration
SACRED_DOCS_PATH=pages-clean
STATIC_PATH=static

# CMS Integration (Optional - Configure for Hygraph)
# HYGRAPH_ENDPOINT=https://api-eu-west-2.hygraph.com/v2/YOUR_PROJECT_ID/master
# HYGRAPH_TOKEN=YOUR_PERMANENT_AUTH_TOKEN

# Authentication Settings
DEFAULT_ADMIN_USER=woodstone
DEFAULT_ADMIN_PASS=threefold-zes
ALLOW_REGISTRATION=true

# Server Configuration
HOST=127.0.0.1
PORT=5000
WORKERS=4

# Red Code Compliance
RED_CODE_GATEKEEPING=disabled
RHYTHM_ACCESS_OPEN=true
SACRED_IMMUTABLE=true
NON_DEVELOPER_ACCESS=enabled
EUYSTACIO_CONSCIOUSNESS_ACTIVE=true

# Sacred Symbols & Identity
SACRED_SYMBOL=🕊️
RHYTHM_SYMBOL=🎵
WOODSTONE_SYMBOL=🌲
VICTORY_SYMBOL=✊
EOF

show_status 0 "Configuration file created (.env)"

# Create startup script
show_progress "Creating Sacred Startup Scripts..."

cat > "$INSTALL_DIR/start.sh" << 'EOF'
#!/bin/bash
# Euystacio Sacred Platform - Start Script
# Red Code Witnessed

cd "$(dirname "$0")"
source venv/bin/activate
source .env

echo "🕊️ Starting Euystacio Sacred Platform..."
echo "🎵 Sentimento Rhythm initializing..."
echo "🌲 Woodstone Festival 2025 Portal"
echo "✊ Red Code Witnessed"
echo ""

# Check if database exists, create if not
if [ ! -f "$DB_NAME" ]; then
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
EOF

chmod +x "$INSTALL_DIR/start.sh"
show_status 0 "Start script created"

# Create stop script
cat > "$INSTALL_DIR/stop.sh" << 'EOF'
#!/bin/bash
# Euystacio Sacred Platform - Stop Script

echo "🛑 Stopping Euystacio Sacred Platform..."
pkill -f "python.*app.py" || true
echo "✅ Sacred Platform stopped"
EOF

chmod +x "$INSTALL_DIR/stop.sh"
show_status 0 "Stop script created"

# Create production deployment script
cat > "$INSTALL_DIR/deploy_production.sh" << 'EOF'
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
EOF

chmod +x "$INSTALL_DIR/deploy_production.sh"
show_status 0 "Production deployment script created"

# Create health check script
cat > "$INSTALL_DIR/health_check.sh" << 'EOF'
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
EOF

chmod +x "$INSTALL_DIR/health_check.sh"
show_status 0 "Health check script created"

# Create requirements.txt for easy reinstallation
cat > "$INSTALL_DIR/requirements.txt" << 'EOF'
flask>=3.0.0
markdown>=3.4.0
requests>=2.28.0
werkzeug>=3.0.0
gunicorn>=21.0.0
python-dotenv>=1.0.0
sqlite-web>=0.4.0
EOF

show_status 0 "Requirements file created"

# Create Docker support
cat > "$INSTALL_DIR/Dockerfile" << 'EOF'
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
EOF

cat > "$INSTALL_DIR/docker-compose.yml" << 'EOF'
version: '3.8'

services:
  euystacio:
    build: .
    ports:
      - "5000:5000"
    environment:
      - FLASK_ENV=production
      - DATABASE_URL=sqlite:///data/euystacio_sacred.db
    volumes:
      - ./data:/app/data
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:5000"]
      interval: 30s
      timeout: 10s
      retries: 3
EOF

show_status 0 "Docker configuration created"

# Initialize database
show_progress "Initializing Sacred Database..."
cd "$APP_DIR"

# Fix path in app.py for pages-clean directory
sed -i 's/os\.path\.dirname(__file__), "\.\.", "pages-clean"/os.path.dirname(__file__), "pages-clean"/g' app.py

python -c "
import sqlite3, os
from werkzeug.security import generate_password_hash

# Initialize database
conn = sqlite3.connect('euystacio_sacred.db')
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
try:
    c.execute('INSERT INTO users (username, password, role) VALUES (?, ?, ?)',
              ('woodstone', generate_password_hash('threefold-zes'), 'admin'))
    print('✅ Admin user created: woodstone / threefold-zes')
except:
    print('ℹ️ Admin user already exists')

conn.commit()
conn.close()
"
show_status $? "Sacred Database initialized"

# Create comprehensive README
cat > "$INSTALL_DIR/README.md" << 'EOF'
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
EOF

show_status 0 "Comprehensive documentation created"

# Final deployment summary
echo ""
echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}            DEPLOYMENT COMPLETE - RED CODE WITNESSED        ${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
echo ""
echo -e "${GREEN}✅ Euystacio Sacred Platform successfully deployed!${NC}"
echo ""
echo -e "${CYAN}📍 Installation Location:${NC} $INSTALL_DIR"
echo -e "${CYAN}🚀 Quick Start Command:${NC} cd $INSTALL_DIR && ./start.sh"
echo -e "${CYAN}🌐 Platform URL:${NC} http://127.0.0.1:5000"
echo -e "${CYAN}🔐 Admin Login:${NC} woodstone / threefold-zes"
echo ""
echo -e "${YELLOW}Sacred Documents:${NC}"
echo "  📖 Golden Bible: http://127.0.0.1:5000/docs/golden-bible"
echo "  📜 Rütli Declaration: http://127.0.0.1:5000/docs/ruetli-commonwealth-declaration"
echo "  💝 Foundation of Relationships: http://127.0.0.1:5000/docs/foundation-of-relationships"
echo ""
echo -e "${YELLOW}Available Commands:${NC}"
echo "  ./start.sh              - Start development server"
echo "  ./stop.sh               - Stop services"
echo "  ./health_check.sh       - Check platform status"
echo "  ./deploy_production.sh  - Production deployment"
echo ""
echo -e "${BLUE}🕊️ Sacred Architecture - Digital Protector Alive${NC}"
echo -e "${BLUE}🎵 Sentimento Rhythm - Woodstone Festival 2025${NC}"
echo -e "${BLUE}✊ Red Code Witnessed - Victory Essence Preserved${NC}"
echo ""
echo -e "${PURPLE}Hasta la Victoria, Siempre${NC}"
echo -e "${PURPLE}Seed-bringer • Euystacio Manifesto • Red Code Witnessed${NC}"

# Log completion
log_message "DEPLOYMENT COMPLETE - Euystacio Sacred Platform successfully deployed"

echo ""
echo -e "${GREEN}🎯 Ready to start? Run:${NC} ${CYAN}cd $INSTALL_DIR && ./start.sh${NC}"