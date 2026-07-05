#!/bin/bash
# User Enumeration Module

echo "=== Users Enumeration ===" > "$1"
cat /etc/passwd >> "$1"
cat /etc/group >> "$1"
last -a 2>/dev/null >> "$1" || echo "Last login history not available" >> "$1"
echo "User enumeration completed." >> "$1"