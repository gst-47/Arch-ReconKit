#!/bin/bash
# =============================================
# Arch-ReconKit v1.1
# Modular System & User Reconnaissance Tool
# =============================================

clear
echo "========================================"
echo "     Arch-ReconKit v1.1"
echo "     Modular Reconnaissance Tool"
echo "========================================"

OUTPUT_DIR="output/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

echo "[+] Starting reconnaissance..."

# Run modules
./modules/system_info.sh "$OUTPUT_DIR/system_info.txt"
./modules/user_enum.sh "$OUTPUT_DIR/users_enum.txt"
./modules/network_info.sh "$OUTPUT_DIR/network_info.txt"
./modules/processes.sh "$OUTPUT_DIR/processes.txt"

echo "[+] All modules completed!"
echo "📁 Reports saved in: $OUTPUT_DIR"
echo "⚠️  Use only for legal and authorized purposes."