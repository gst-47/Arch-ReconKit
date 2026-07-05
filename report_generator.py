#!/usr/bin/env python3
import json
from datetime import datetime
import os

def generate_json_report(output_dir):
    report = {
        "tool": "Arch-ReconKit",
        "version": "1.3",
        "timestamp": datetime.now().isoformat(),
        "modules": ["system_info", "users", "network", "processes", "rootkit"]
    }
    
    json_path = os.path.join(output_dir, "full_report.json")
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(report, f, indent=2)
    
    print(f"JSON report generated: {json_path}")
    return json_path

if __name__ == "__main__":
    # Test
    generate_json_report("output/test")