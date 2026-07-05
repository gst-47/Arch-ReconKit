#!/bin/bash
# =============================================
# Arch-ReconKit v1.2
# Modular System Reconnaissance Tool
# =============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${GREEN}========================================"
echo -e "     Arch-ReconKit v1.2"
echo -e "     Modular Reconnaissance Tool"
echo -e "========================================${NC}"

OUTPUT_DIR="output/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

echo -e "${YELLOW}[+] Starting reconnaissance...${NC}"

# Stealth Mode
STEALTH=false
if [[ "$1" == "--stealth" ]]; then
    STEALTH=true
    echo -e "${YELLOW}[STEALTH MODE] Reducing footprint...${NC}"
    sleep 1
fi

# Run modules
echo -e "${GREEN}[1/4]${NC} System Information..."
./modules/system_info.sh "$OUTPUT_DIR/system_info.txt"

echo -e "${GREEN}[2/4]${NC} User Enumeration..."
./modules/user_enum.sh "$OUTPUT_DIR/users_enum.txt"

echo -e "${GREEN}[3/4]${NC} Network Information..."
./modules/network_info.sh "$OUTPUT_DIR/network_info.txt"

echo -e "${GREEN}[4/4]${NC} Processes..."
./modules/processes.sh "$OUTPUT_DIR/processes.txt"

echo -e "${GREEN}[+] All modules completed successfully!${NC}"
echo -e "📁 Reports saved in: ${YELLOW}$OUTPUT_DIR${NC}"
echo -e "${RED}⚠️  Use only for legal and authorized purposes.${NC}"