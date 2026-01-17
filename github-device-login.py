#!/usr/bin/env python3
"""
GitHub Device Login Flow - Step by Step
Guides user through device authentication
"""

import subprocess
import webbrowser
import time

def print_step(step_num, title, description=""):
    print(f"\n{'='*60}")
    print(f"STEP {step_num}: {title}")
    print(f"{'='*60}")
    if description:
        print(description)
    print()

def main():
    print("\n")
    print("🌕 " + "="*56)
    print("  GitHub Device Login - Step by Step Guide")
    print("="*60)
    
    # STEP 1: Check authentication status
    print_step(1, "Check Current Authentication Status", 
               "Let's see if you're already logged in...")
    
    result = subprocess.run(["gh", "auth", "status"], capture_output=True, text=True)
    print("Output:")
    print(result.stdout if result.stdout else result.stderr)
    
    if result.returncode == 0 and "Logged in" in result.stdout:
        print("\n✅ You're already logged in!")
        return
    
    # STEP 2: Start device login
    print_step(2, "Starting Device Login",
               "This will open a browser for you to authorize.")
    
    print("Running: gh auth login")
    print()
    
    # Run gh auth login
    process = subprocess.Popen(
        ["gh", "auth", "login"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1
    )
    
    device_code = None
    device_url = None
    
    # Read output line by line
    print("GitHub CLI Output:")
    print("-" * 60)
    
    for line in process.stdout:
        print(line, end='', flush=True)
        
        # Look for device code
        if "copy your one-time code" in line.lower():
            # Next line usually has the code
            continue
        
        # Extract device code (usually in format XXXX-XXXX)
        if "code" in line.lower() and "-" in line:
            import re
            codes = re.findall(r'\b[A-Z0-9]{4}-[A-Z0-9]{4}\b', line)
            if codes:
                device_code = codes[0]
        
        # Extract URL
        if "github.com/login/device" in line:
            device_url = "https://github.com/login/device"
    
    print("-" * 60)
    
    process.wait()
    
    # STEP 3: Manual guidance
    print_step(3, "What You Need To Do",
               "⚠️  If browser didn't open automatically:")
    
    print("1️⃣  Go to: https://github.com/login/device")
    print()
    print("2️⃣  Look in this terminal for your DEVICE CODE (format: XXXX-XXXX)")
    print()
    print("3️⃣  Copy the device code and paste it on GitHub website")
    print()
    print("4️⃣  Click 'Authorize'")
    print()
    print("5️⃣  Come back here and wait for 'Authentication successful'")
    print()
    
    # STEP 4: Verify
    print_step(4, "Verify Authentication",
               "Checking if login was successful...")
    
    time.sleep(2)
    
    result = subprocess.run(["gh", "auth", "status"], capture_output=True, text=True)
    print("Output:")
    print(result.stdout if result.stdout else result.stderr)
    
    if result.returncode == 0:
        print("\n✅ SUCCESS! You are now authenticated to GitHub!")
        print("\nYou can now run:")
        print("  git push -u origin main")
        print("\nOr use the automatic script:")
        print("  .\push-to-github.ps1")
    else:
        print("\n⚠️  Authentication may still be pending...")
        print("Please complete the steps above and try again.")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nCancelled by user.")
    except Exception as e:
        print(f"\n❌ Error: {e}")
        print("\nPlease run manually:")
        print("  gh auth login")
