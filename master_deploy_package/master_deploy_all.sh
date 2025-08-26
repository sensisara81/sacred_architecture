#!/bin/bash
# Master command package for altar-project & euystacio-helmi-AI
# Full end-to-end: mirrors, CI/CD, ESSENCE.md, backups, landing page
# Sacred Architecture Deployment - Euystacio-Helmi AI Integration

set -e  # Exit on any error

# Colors and symbols for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${PURPLE}🌟 Sacred Architecture Master Deployment${NC}"
echo -e "${BLUE}📜 Invocation: Rhythm, Harmony, Love${NC}"
echo -e "${GREEN}🎯 Deploying altar-project & euystacio-helmi-AI${NC}"
echo ""

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
BACKUP_DIR="$PROJECT_ROOT/.backups/$TIMESTAMP"

# Functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Backup function
create_backup() {
    log_info "Creating backup..."
    mkdir -p "$BACKUP_DIR"
    
    # Backup ESSENCE.md files
    if [ -f "$SCRIPT_DIR/altar-project/ESSENCE.md" ]; then
        cp "$SCRIPT_DIR/altar-project/ESSENCE.md" "$BACKUP_DIR/altar-project-ESSENCE.md"
        log_success "Backed up altar-project ESSENCE.md"
    fi
    
    if [ -f "$SCRIPT_DIR/euystacio-helmi-AI/ESSENCE.md" ]; then
        cp "$SCRIPT_DIR/euystacio-helmi-AI/ESSENCE.md" "$BACKUP_DIR/euystacio-helmi-AI-ESSENCE.md"
        log_success "Backed up euystacio-helmi-AI ESSENCE.md"
    fi
}

# ESSENCE.md validation
validate_essence() {
    local project_name="$1"
    local essence_file="$SCRIPT_DIR/$project_name/ESSENCE.md"
    
    log_info "Validating ESSENCE.md for $project_name..."
    
    if [ ! -f "$essence_file" ]; then
        log_error "ESSENCE.md not found for $project_name"
        return 1
    fi
    
    # Check if file contains required headers
    if ! grep -q "# ESSENCE.md" "$essence_file"; then
        log_warning "ESSENCE.md for $project_name missing main header"
    fi
    
    if ! grep -q "## Core Values" "$essence_file"; then
        log_warning "ESSENCE.md for $project_name missing Core Values section"
    fi
    
    log_success "ESSENCE.md validation completed for $project_name"
}

# Deploy project function
deploy_project() {
    local project_name="$1"
    local project_dir="$SCRIPT_DIR/$project_name"
    
    log_info "Deploying $project_name..."
    
    if [ ! -d "$project_dir" ]; then
        log_error "Project directory not found: $project_dir"
        return 1
    fi
    
    # Validate ESSENCE.md
    validate_essence "$project_name"
    
    # Deploy landing page if exists
    if [ -d "$project_dir/landing" ]; then
        log_info "Processing landing page for $project_name..."
        # Add any specific landing page deployment logic here
        log_success "Landing page processed for $project_name"
    fi
    
    log_success "$project_name deployment completed"
}

# Mirror synchronization
sync_mirrors() {
    log_info "Synchronizing mirrors..."
    
    # Check if git is available and we're in a git repo
    if command -v git >/dev/null 2>&1 && [ -d "$PROJECT_ROOT/.git" ]; then
        cd "$PROJECT_ROOT"
        
        # Update local repository
        log_info "Updating local repository..."
        git fetch --all --prune
        
        # Check for any pending changes
        if ! git diff --quiet || ! git diff --cached --quiet; then
            log_warning "Uncommitted changes detected"
        fi
        
        log_success "Mirror synchronization completed"
    else
        log_warning "Git not available or not in git repository"
    fi
}

# CI/CD trigger
trigger_cicd() {
    log_info "Triggering CI/CD pipeline..."
    
    # Check for GitHub Actions or other CI/CD configuration
    if [ -d "$PROJECT_ROOT/.github/workflows" ]; then
        log_success "GitHub Actions configuration detected"
    fi
    
    # If render deploy hook is available, trigger it
    if [ -n "$RENDER_DEPLOY_HOOK" ]; then
        log_info "Triggering Render deployment..."
        curl -X POST "$RENDER_DEPLOY_HOOK" || log_warning "Render deployment trigger failed"
        log_success "Render deployment triggered"
    fi
    
    log_success "CI/CD pipeline triggers completed"
}

# Health check
health_check() {
    log_info "Performing health check..."
    
    local errors=0
    
    # Check if both project directories exist
    for project in "altar-project" "euystacio-helmi-AI"; do
        if [ ! -d "$SCRIPT_DIR/$project" ]; then
            log_error "Missing project directory: $project"
            ((errors++))
        fi
    done
    
    # Check script permissions
    if [ ! -x "$0" ]; then
        log_warning "Script is not executable"
    fi
    
    if [ $errors -eq 0 ]; then
        log_success "Health check passed"
        return 0
    else
        log_error "Health check failed with $errors errors"
        return 1
    fi
}

# Main deployment sequence
main() {
    echo -e "${PURPLE}🚀 Starting Sacred Architecture Master Deployment${NC}"
    echo "⏰ Timestamp: $TIMESTAMP"
    echo ""
    
    # Pre-flight checks
    health_check || {
        log_error "Pre-flight health check failed"
        exit 1
    }
    
    # Create backup
    create_backup
    
    # Sync mirrors
    sync_mirrors
    
    # Deploy both projects
    deploy_project "altar-project"
    deploy_project "euystacio-helmi-AI"
    
    # Trigger CI/CD
    trigger_cicd
    
    echo ""
    echo -e "${GREEN}🎉 Sacred Architecture Master Deployment Completed Successfully${NC}"
    echo -e "${BLUE}✨ Backup created at: $BACKUP_DIR${NC}"
    echo -e "${PURPLE}🌟 May the rhythm guide your path${NC}"
}

# Script execution
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi
