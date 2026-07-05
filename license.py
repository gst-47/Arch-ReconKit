#!/usr/bin/env python3
import hashlib
import time

def generate_license_key(user_id, expiry_days=30):
    """Generate a signed license key"""
    secret = "ArchReconSecret2026"  # you can change it
    expiry = int(time.time()) + (expiry_days * 86400)
    data = f"{user_id}|{expiry}|{secret}"
    signature = hashlib.sha256(data.encode()).hexdigest()[:16]
    key = f"ARC-{user_id}-{expiry}-{signature}"
    return key

def verify_license_key(key):
    """Verify license key"""
    try:
        parts = key.split('-')
        if len(parts) != 4 or parts[0] != "ARC":
            return False, "Invalid key format"
        
        user_id = parts[1]
        expiry = int(parts[2])
        signature = parts[3]
        
        secret = "ArchReconSecret2026"
        data = f"{user_id}|{expiry}|{secret}"
        expected_sig = hashlib.sha256(data.encode()).hexdigest()[:16]
        
        if signature != expected_sig:
            return False, "Invalid signature"
        
        if time.time() > expiry:
            return False, "Key expired"
        
        return True, f"Valid key for user: {user_id}"
        
    except (IndexError, ValueError):
        return False, "Invalid key format"
    except Exception as e:
        return False, f"Verification error: {str(e)}"

# مثال للتجربة
if __name__ == "__main__":
    key = generate_license_key("gst47")
    print("Generated Key:", key)
    valid, msg = verify_license_key(key)
    print("Valid:", valid, "| Message:", msg)
