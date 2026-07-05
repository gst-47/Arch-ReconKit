#!/bin/bash
# Network Information Module

echo "=== Network Information ===" > "$1"
ip addr show >> "$1"
ip route >> "$1"
ss -tuln >> "$1"
echo "Network info collected." >> "$1"
