#!/bin/bash

# Euystacio Sacred Platform - Deployment Verification
# Complete verification of all platform components

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

SACRED_SYMBOL="🕊️"
CHECK_SYMBOL="✅"
ERROR_SYMBOL="❌"
WARNING_SYMBOL="⚠️"

echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}            EUYSTACIO DEPLOYMENT VERIFICATION            ${SACRED_SYMBOL}${NC}"
echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
echo ""

VERIFICATION_PASSED=true

# Function to check and report
verify_component() {
    local test_command="$1"
    local success_msg="$2"
    local error_msg="$3"
    
    if eval "$test_command" > /dev/null 2>&1; then
        echo -e "${GREEN}${CHECK_SYMBOL} $success_msg${NC}"
    else
        echo -e "${RED}${ERROR_SYMBOL} $error_msg${NC}"
        VERIFICATION_PASSED=false
    fi
}

# Verify directory structure
echo -e "${BLUE}📁 Verifying Directory Structure...${NC}"
verify_component "[ -d 'app' ]" "Application directory exists" "Application directory missing"
verify_component "[ -d 'venv' ]" "Virtual environment directory exists" "Virtual environment missing"
verify_component "[ -f '.env' ]" "Environment configuration exists" "Environment file missing"
verify_component "[ -f 'start.sh' ]" "Start script exists" "Start script missing"
verify_component "[ -f 'stop.sh' ]" "Stop script exists" "Stop script missing"
verify_component "[ -f 'health_check.sh' ]" "Health check script exists" "Health check script missing"
verify_component "[ -f 'deploy_production.sh' ]" "Production script exists" "Production script missing"

echo ""

# Verify application files
echo -e "${BLUE}🐍 Verifying Application Components...${NC}"
verify_component "[ -f 'app/app.py' ]" "Main Flask application exists" "Flask app missing"
verify_component "[ -f 'app/cms.py' ]" "CMS module exists" "CMS module missing"
verify_component "[ -d 'app/templates' ]" "Templates directory exists" "Templates missing"
verify_component "[ -d 'app/pages-clean' ]" "Sacred documents directory exists" "Sacred documents missing"

echo ""

# Verify sacred documents
echo -e "${BLUE}📖 Verifying Sacred Documents...${NC}"
verify_component "[ -f 'app/pages-clean/golden_bible.md' ]" "Golden Bible document exists" "Golden Bible missing"
verify_component "[ -f 'app/pages-clean/ruetli_commonwealth_declaration.md' ]" "Rütli Declaration exists" "Rütli Declaration missing"
verify_component "[ -f 'app/pages-clean/foundation_of_relationships.md' ]" "Foundation of Relationships exists" "Foundation document missing"

echo ""

# Verify Python environment
echo -e "${BLUE}🔧 Verifying Python Environment...${NC}"
source venv/bin/activate > /dev/null 2>&1
verify_component "python -c 'import flask'" "Flask installed" "Flask not installed"
verify_component "python -c 'import markdown'" "Markdown installed" "Markdown not installed"
verify_component "python -c 'import requests'" "Requests installed" "Requests not installed"
verify_component "python -c 'import werkzeug'" "Werkzeug installed" "Werkzeug not installed"

echo ""

# Verify database
echo -e "${BLUE}💾 Verifying Sacred Database...${NC}"
verify_component "[ -f 'app/euystacio_sacred.db' ]" "Sacred database exists" "Database not initialized"

if [ -f 'app/euystacio_sacred.db' ]; then
    # Check database structure
    cd app
    ADMIN_EXISTS=$(python -c "
import sqlite3
try:
    conn = sqlite3.connect('euystacio_sacred.db')
    c = conn.cursor()
    c.execute('SELECT username FROM users WHERE role=?', ('admin',))
    result = c.fetchone()
    conn.close()
    print('yes' if result else 'no')
except:
    print('no')
" 2>/dev/null)
    cd ..
    
    if [ "$ADMIN_EXISTS" = "yes" ]; then
        echo -e "${GREEN}${CHECK_SYMBOL} Admin user configured in database${NC}"
    else
        echo -e "${RED}${ERROR_SYMBOL} Admin user not found in database${NC}"
        VERIFICATION_PASSED=false
    fi
fi

echo ""

# Verify permissions
echo -e "${BLUE}🔒 Verifying Script Permissions...${NC}"
verify_component "[ -x 'start.sh' ]" "Start script is executable" "Start script not executable"
verify_component "[ -x 'stop.sh' ]" "Stop script is executable" "Stop script not executable"
verify_component "[ -x 'health_check.sh' ]" "Health check script is executable" "Health check script not executable"
verify_component "[ -x 'deploy_production.sh' ]" "Production script is executable" "Production script not executable"

echo ""

# Test platform startup (brief test)
echo -e "${BLUE}🚀 Testing Platform Startup...${NC}"

# Start platform in background
./start.sh > /dev/null 2>&1 &
PLATFORM_PID=$!
sleep 3

# Test if platform responds
if curl -f -s "http://127.0.0.1:5000" > /dev/null 2>&1; then
    echo -e "${GREEN}${CHECK_SYMBOL} Platform starts and responds to requests${NC}"
    
    # Test specific endpoints
    if curl -f -s "http://127.0.0.1:5000/connect" > /dev/null 2>&1; then
        echo -e "${GREEN}${CHECK_SYMBOL} Login portal accessible${NC}"
    else
        echo -e "${RED}${ERROR_SYMBOL} Login portal not accessible${NC}"
        VERIFICATION_PASSED=false
    fi
    
    if curl -f -s "http://127.0.0.1:5000/docs/golden-bible" > /dev/null 2>&1; then
        echo -e "${GREEN}${CHECK_SYMBOL} Sacred documents accessible${NC}"
    else
        echo -e "${RED}${ERROR_SYMBOL} Sacred documents not accessible${NC}"
        VERIFICATION_PASSED=false
    fi
    
else
    echo -e "${RED}${ERROR_SYMBOL} Platform failed to start or not responding${NC}"
    VERIFICATION_PASSED=false
fi

# Stop platform
./stop.sh > /dev/null 2>&1
kill $PLATFORM_PID 2>/dev/null || true
sleep 2

echo ""

# Test Docker configuration
echo -e "${BLUE}🐳 Verifying Docker Configuration...${NC}"
verify_component "[ -f 'Dockerfile' ]" "Dockerfile exists" "Dockerfile missing"
verify_component "[ -f 'docker-compose.yml' ]" "Docker Compose config exists" "Docker Compose config missing"
verify_component "[ -f 'requirements.txt' ]" "Requirements file exists" "Requirements file missing"

echo ""

# Final verification summary
echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"

if [ "$VERIFICATION_PASSED" = true ]; then
    echo -e "${PURPLE}${SACRED_SYMBOL}            VERIFICATION COMPLETE - ALL SYSTEMS GO!        ${SACRED_SYMBOL}${NC}"
    echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
    echo ""
    echo -e "${GREEN}${CHECK_SYMBOL} Euystacio Sacred Platform deployment verification: PASSED${NC}"
    echo ""
    echo -e "${CYAN}🎯 Platform ready for deployment!${NC}"
    echo -e "${CYAN}🚀 Start command: ./start.sh${NC}"
    echo -e "${CYAN}🌐 Access URL: http://127.0.0.1:5000${NC}"
    echo -e "${CYAN}🔐 Admin Login: woodstone / threefold-zes${NC}"
    echo ""
    echo -e "${YELLOW}Sacred Document URLs:${NC}"
    echo "  📖 Golden Bible: http://127.0.0.1:5000/docs/golden-bible"
    echo "  📜 Rütli Declaration: http://127.0.0.1:5000/docs/ruetli-commonwealth-declaration"
    echo "  💝 Foundation of Relationships: http://127.0.0.1:5000/docs/foundation-of-relationships"
    
    exit 0
else
    echo -e "${PURPLE}${SACRED_SYMBOL}         VERIFICATION FAILED - ISSUES DETECTED           ${SACRED_SYMBOL}${NC}"
    echo -e "${PURPLE}${SACRED_SYMBOL}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${SACRED_SYMBOL}${NC}"
    echo ""
    echo -e "${RED}${ERROR_SYMBOL} Deployment verification FAILED${NC}"
    echo -e "${YELLOW}${WARNING_SYMBOL} Please review the errors above and re-run the installation${NC}"
    echo -e "${YELLOW}${WARNING_SYMBOL} You may need to delete the euystacio_platform directory and run ./install.sh again${NC}"
    
    exit 1
fi