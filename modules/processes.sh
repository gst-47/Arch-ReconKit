#!/bin/bash
# Processes Module

echo "=== Running Processes (Top 30) ===" > "$1"
ps aux --sort=-%cpu | head -n 30 >> "$1"
echo "Processes info collected." >> "$1"