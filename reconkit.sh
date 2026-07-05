#!/bin/bash
# =============================================
# Arch-ReconKit v1.3
# Modular System Reconnaissance Tool with Logging
# =============================================

# Setup Logging
LOG_DIR="logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/recon_$(date +%Y%m%d_%H%M%S).log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "=== Arch-ReconKit v1.3 started ==="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${GREEN}========================================"
echo -e "     Arch-ReconKit v1.3"
echo -e "     Modular Reconnaissance Tool"
echo -e "========================================${NC}"

log "Output directory created"

OUTPUT_DIR="output/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

log "Starting reconnaissance modules"

# Stealth Mode
if [[ "$1" == "--stealth" ]]; then
    log "STEALTH MODE activated"
    echo -e "${YELLOW}[STEALTH MODE] Reducing footprint...${NC}"
    sleep 1
fi

# Run modules
echo -e "${GREEN}[1/5]${NC} System Information..."
log "Running System Information module"
./modules/system_info.sh "$OUTPUT_DIR/system_info.txt"

echo -e "${GREEN}[2/5]${NC} User Enumeration..."
log "Running User Enumeration module"
./modules/user_enum.sh "$OUTPUT_DIR/users_enum.txt"

echo -e "${GREEN}[3/5]${NC} Network Information..."
log "Running Network Information module"
./modules/network_info.sh "$OUTPUT_DIR/network_info.txt"

echo -e "${GREEN}[4/5]${NC} Processes..."
log "Running Processes module"
./modules/processes.sh "$OUTPUT_DIR/processes.txt"

echo -e "${GREEN}[5/5]${NC} Rootkit Check..."
log "Running Rootkit Check module"
./modules/rootkit_check.sh "$OUTPUT_DIR/rootkit_check.txt"

log "All modules completed successfully"
echo -e "${GREEN}[+] All modules completed successfully!${NC}"
echo -e "📁 Reports saved in: ${YELLOW}$OUTPUT_DIR${NC}"
echo -e "📜 Log file: ${YELLOW}$LOG_FILE${NC}"
echo -e "${RED}⚠️  Use only for legal and authorized purposes.${NC}"

# Generate JSON Report
log "Generating JSON report"
python3 report_generator.py "$OUTPUT_DIR"


log "Session ended"