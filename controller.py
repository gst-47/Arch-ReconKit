#!/usr/bin/env python3
import socket
import license

def main():
    print("=== Arch RemoteRecon Controller ===")
    
    key = input("Enter License Key: ").strip()
    valid, msg = license.verify_license_key(key)
    if not valid:
        print("❌", msg)
        return
    
    print("✅ License accepted.")
    
    target = input("Target IP: ").strip()
    port = 4444
    
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            print(f"Connecting to {target}:{port}...")
            s.connect((target, port))
            s.sendall(b"Hello from Controller")
            data = s.recv(1024)
            print("Received from Agent:", data.decode())
    except ConnectionRefusedError:
        print("Connection refused. Is the Agent running?")
    except Exception as e:
        print("Error:", e)

if __name__ == "__main__":
    main()