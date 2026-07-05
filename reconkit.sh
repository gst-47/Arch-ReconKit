#!/bin/bash
# =============================================
# Arch-ReconKit v1.0
# System & User Reconnaissance Tool for Arch Linux
# =============================================

clear
echo "========================================"
echo "     Arch-ReconKit v1.0"
echo "     System & User Reconnaissance Tool"
echo "========================================"

# Create output directory with timestamp
OUTPUT_DIR="output/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

echo "[+] Gathering information..."

# 1. System Information
{
    echo "=== System Information ==="
    uname -a                    # Kernel and system details
    cat /etc/os-release         # OS version and details
    hostnamectl                 # Hostname and hardware info
    uptime                      # How long the system has been running
    df -h                       # Disk usage
    free -h                     # Memory usage
} > "$OUTPUT_DIR/system_info.txt"

# 2. Users Enumeration
{
    echo "=== Users Enumeration ==="
    cat /etc/passwd             # All users on the system
    cat /etc/group              # All groups
    last -a 2>/dev/null || echo "last command not available"
    echo "Note: lastlog may require 'pacman -S util-linux' if needed"
} > "$OUTPUT_DIR/users_enum.txt"

# 3. Network Information
{
    echo "=== Network Information ==="
    ip addr show                # Network interfaces and IP addresses
    ip route                    # Routing table
    ss -tuln                    # Listening ports (sockets)
} > "$OUTPUT_DIR/network_info.txt"

echo "[+] Done!"
echo "📁 Report saved in: $OUTPUT_DIR"
echo "⚠️  Use this tool only for legal and authorized purposes."