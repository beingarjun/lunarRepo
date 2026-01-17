# 🚀 LunarRepo Push Scripts

Automated scripts to create the repository on GitHub and push all code.

## Available Scripts

### 1. **PowerShell Script** (Recommended for Windows)
```bash
push-to-github.ps1
```

**Run from PowerShell:**
```powershell
cd C:\Users\malarmannan.a\YC\LunarRepo
.\push-to-github.ps1
```

Or with no execution policy warnings:
```powershell
powershell -ExecutionPolicy Bypass -File push-to-github.ps1
```

### 2. **Batch Script** (Windows Command Prompt)
```bash
push-to-github.bat
```

**Run from Command Prompt:**
```cmd
C:\Users\malarmannan.a\YC\LunarRepo\push-to-github.bat
```

Or double-click the file in File Explorer.

### 3. **Bash Script** (Linux/Mac/Unix)
```bash
push-to-github.sh
```

**Run from Terminal:**
```bash
chmod +x push-to-github.sh
./push-to-github.sh
```

## What These Scripts Do

1. ✅ Create the `lunarRepo` repository on GitHub (if it doesn't exist)
2. ✅ Configure the git remote with authentication token
3. ✅ Push all commits to GitHub
4. ✅ Display success message with repository URL

## Prerequisites

- Git installed and configured
- GitHub authentication token (already embedded in scripts)
- Internet connection

## Output

Upon successful completion, you'll see:

```
✅ LunarRepo Successfully Pushed!
Repository: https://github.com/beingarjun/lunarRepo
```

## Troubleshooting

### "PowerShell is disabled" error
```powershell
powershell -ExecutionPolicy Bypass -File push-to-github.ps1
```

### "Repository already exists" 
This is normal if you've run the script before. It will just push any new commits.

### "Token expired" 
Generate a new Personal Access Token at https://github.com/settings/tokens and update the `$Token` variable in the script.

---

**Choose your script based on your operating system and preference!** ✨
