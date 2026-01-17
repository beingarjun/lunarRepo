# 🌕 LunarRepo - Step-by-Step Push Guide

## STEP 1: Close Everything
Close VS Code and any PowerShell windows that are open.

---

## STEP 2: Open a Fresh PowerShell Terminal
1. Press `Windows Key + R`
2. Type: `powershell`
3. Press `Enter`

You should now see a fresh PowerShell window.

---

## STEP 3: Navigate to Your Repo
Copy and paste this command into PowerShell:

```powershell
cd "C:\Users\malarmannan.a\YC\LunarRepo"
```

Press `Enter`

Expected output:
```
PS C:\Users\malarmannan.a\YC\LunarRepo>
```

---

## STEP 4: Check Git Status
Type and press `Enter`:

```powershell
git status
```

You should see something like:
```
On branch main
nothing to commit, working tree clean
```

If you see this ✅ proceed to STEP 5

---

## STEP 5: Check Current Remote (Optional)
Type and press `Enter`:

```powershell
git remote -v
```

This shows current remotes. Should output something with "origin" and your token.

---

## STEP 6: GitHub Device Login (CRITICAL STEP)

Type and press `Enter`:

```powershell
gh auth login
```

**You will see interactive prompts. Follow these steps:**

1. **First prompt: "What account do you want to log in to?"**
   - Answer: `github.com`
   - Press `Enter` or select with arrow keys

2. **Second prompt: "What is your preferred protocol for Git operations on this host?"**
   - Answer: `HTTPS`
   - Press `Enter`

3. **Third prompt: "Authenticate with your GitHub credentials?"**
   - Answer: `Y` (Yes)
   - Press `Enter`

4. **Browser window opens automatically**
   - Look for a **device code** displayed in your terminal
   - Copy the device code (usually looks like: `XXXX-XXXX`)

5. **In the browser window:**
   - Paste the device code
   - Click "Authorize"
   - Wait for confirmation

6. **Back in PowerShell:**
   - You should see: ✅ **"Authentication successful"**

---

## STEP 7: Verify Authentication
Type and press `Enter`:

```powershell
gh auth status
```

You should see your GitHub username and that you're logged in.

---

## STEP 8: Create Repository on GitHub (OPTIONAL)
If you don't want to use the web UI, run:

```powershell
gh repo create lunarRepo --public --source=. --remote=origin --push
```

**What happens:**
- Creates repo on GitHub (if needed)
- Sets up remote
- Pushes all code
- Done! 🎉

**If repo already exists**, you'll see a confirmation and it will still push.

---

## STEP 9: Alternative - Push Existing Code
If the repo already exists, just push:

```powershell
git push -u origin main
```

You should see:
```
Enumerating objects: 17, done.
Counting objects: 100% (17/17), done.
...
To https://github.com/beingarjun/lunarRepo.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

---

## STEP 10: Verify Success
Go to: **https://github.com/beingarjun/lunarRepo**

You should see all your files! ✅

---

## If Something Goes Wrong

**"Device code not showing?"**
- Make sure `gh auth login` executed fully
- Check for browser pop-up (may be behind other windows)

**"Repository not created?"**
- Go to https://github.com/new manually and create it
- Then run step 9 again

**"Push failed?"**
- Run `gh auth logout` then repeat step 6
- Or use `git push -u origin main` directly

---

**Questions? Each step should output clear messages. Let me know what output you see!**
