#!/usr/bin/env python3
"""
LunarRepo - GitHub Device Login & Push Script
Authenticates using GitHub device flow and pushes code
"""

import subprocess
import sys
import json
import time
from pathlib import Path

def run_command(cmd, shell=False):
    """Execute a command and return output"""
    try:
        result = subprocess.run(
            cmd,
            shell=shell,
            capture_output=True,
            text=True,
            timeout=30
        )
        return result.returncode, result.stdout, result.stderr
    except subprocess.TimeoutExpired:
        return 1, "", "Command timed out"
    except Exception as e:
        return 1, "", str(e)

def main():
    print("🌕 LunarRepo - Device Login & Push")
    print("=" * 50)
    print()
    
    repo_path = Path("C:\\Users\\malarmannan.a\\YC\\LunarRepo")
    
    if not repo_path.exists():
        print(f"❌ Repository path not found: {repo_path}")
        sys.exit(1)
    
    # Step 1: Check git status
    print("Step 1: Checking git repository...")
    returncode, stdout, stderr = run_command(f"cd {repo_path} && git status", shell=True)
    
    if returncode != 0:
        print(f"❌ Not a valid git repository")
        sys.exit(1)
    print("✓ Valid git repository found")
    print()
    
    # Step 2: GitHub Device Login
    print("Step 2: Initiating GitHub Device Login...")
    print()
    print("🔐 Starting device login flow...")
    print()
    
    # Use gh CLI for device login
    returncode, stdout, stderr = run_command("gh auth login --web")
    
    if "already authenticated" in stdout.lower() or "already authenticated" in stderr.lower():
        print("✓ Already authenticated to GitHub")
    elif returncode == 0:
        print("✓ Device login successful")
    else:
        print("⚠ Device login may require browser confirmation")
    
    print()
    
    # Step 3: Check authentication status
    print("Step 3: Verifying authentication...")
    returncode, stdout, stderr = run_command("gh auth status")
    
    if returncode == 0:
        print("✓ GitHub authentication verified")
        print(stdout)
    else:
        print("⚠ Could not verify authentication")
    
    print()
    
    # Step 4: Create repository (if needed)
    print("Step 4: Ensuring repository exists on GitHub...")
    returncode, stdout, stderr = run_command(
        "gh repo create lunarRepo --public --source=. --remote=origin --push"
    )
    
    if "already exists" in stderr.lower():
        print("ℹ Repository already exists")
    elif returncode == 0:
        print("✓ Repository created and code pushed")
    else:
        print(f"⚠ Repository creation response: {stderr}")
    
    print()
    
    # Step 5: Push code
    print("Step 5: Pushing code to GitHub...")
    returncode, stdout, stderr = run_command(
        f"cd {repo_path} && git push -u origin main",
        shell=True
    )
    
    if returncode == 0:
        print("✓ Code pushed successfully")
        print(stdout)
    else:
        if "already up to date" in stderr.lower() or "everything up to date" in stderr.lower():
            print("ℹ Code is already up to date on GitHub")
        else:
            print(f"⚠ Push response: {stderr}")
    
    print()
    print("=" * 50)
    print("✅ Complete!")
    print()
    print("Repository: https://github.com/beingarjun/lunarRepo")
    print()

if __name__ == "__main__":
    main()
