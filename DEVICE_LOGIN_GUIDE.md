# 🔐 GitHub Device Login - The Simplest Way

## Option 1: Run Python Script (Easiest)
```powershell
python github-device-login.py
```

It will:
1. Check if you're logged in
2. Start device login flow
3. Show you the device code
4. Tell you exactly what to do

---

## Option 2: Manual (Copy-Paste)
```powershell
gh auth login
```

When prompted:
- Choose: `github.com`
- Choose: `HTTPS`
- Choose: `Y` (login via web browser)

**Then:**
1. A device code appears (like: `ABCD-1234`)
2. Browser opens to https://github.com/login/device
3. Paste the device code
4. Click "Authorize"
5. Come back to PowerShell
6. Wait for "Authentication successful" ✅

---

## Step 3: Push Your Code
Once authenticated, run:
```powershell
git push -u origin main
```

Done! 🎉

---

## Quick Checklist
- [ ] Close VS Code
- [ ] Open fresh PowerShell
- [ ] Navigate: `cd "C:\Users\malarmannan.a\YC\LunarRepo"`
- [ ] Run: `python github-device-login.py`
- [ ] Look for device code in terminal
- [ ] Go to https://github.com/login/device
- [ ] Paste code and authorize
- [ ] Run: `git push -u origin main`
- [ ] Check: https://github.com/beingarjun/lunarRepo ✅
