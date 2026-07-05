#!/usr/bin/env python3
import socket
import sys
import license

def main():
    print("=== Arch RemoteRecon Agent ===")
    
    key = input("Enter License Key: ").strip()
    valid, msg = license.verify_license_key(key)
    if not valid:
        print("❌", msg)
        sys.exit(1)
    
    print("✅ License accepted.")
    
    HOST = '0.0.0.0'
    PORT = 4444
    
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen(1)
        print(f"Agent listening on {HOST}:{PORT}...")
        conn, addr = s.accept()
        with conn:
            print(f"Connected by {addr}")
            conn.sendall(b"Agent connected successfully!")
            data = conn.recv(1024)
            print("Received:", data.decode())

if __name__ == "__main__":
    main()