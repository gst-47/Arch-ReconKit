#!/bin/bash

{
    echo "{"
    echo "  \"tool\": \"Arch-ReconKit\","
    echo "  \"module\": \"system_info\","
    echo "  \"timestamp\": \"$(date)\","
    echo "  \"data\": {"
    echo "    \"uname\": \"$(uname -a)\","
    echo "    \"os_release\": \"$(cat /etc/os-release | tr '\n' ' ')\","
    echo "    \"uptime\": \"$(uptime)\""
    echo "  }"
    echo "}"
} > "$1.json"

echo "System info collected." > "$1.txt"