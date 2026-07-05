#!/bin/bash
# System Information Module

echo "=== System Information ===" > "$1"
uname -a >> "$1"
cat /etc/os-release >> "$1"
hostnamectl >> "$1"
uptime >> "$1"
df -h >> "$1"
free -h >> "$1"
echo "System info collected." >> "$1"