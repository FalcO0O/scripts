# ai-setup

Setup scripts and rules for AI assistants.

---

## Rules Summary 
### `GEMINI.md`

- **Minimal Code:** Only essential code to achieve the goal, no unnecessary bloat or overengineering.
- **Project-Aligned Comments:** Matches project language and style, placed only in non-obvious sections. No comments for self-explanatory code and no historical changelogs in comments.
- **No Fluff & Verified Facts Only:** Concise output without redundant descriptions or unverified assumptions.
- **Active Inquiries:** Ask questions when requirements or context are unclear instead of guessing.
- **Git & Jira Restrictions:** No creating Jira items, no opening pull requests, and `git push` only with explicit permission.

---

## Usage

Run the script and choose whether to install globally or locally.

### 1. Run directly in terminal (without cloning)

#### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/FalcO0O/scripts/master/ai-setup/setup.ps1 | iex
```

#### Linux / macOS (Bash)

```bash
curl -fsSL https://raw.githubusercontent.com/FalcO0O/scripts/master/ai-setup/setup.sh | bash
```

### 2. Run from cloned repository

```bash
cd ai-setup
.\setup.ps1     # Windows (PowerShell)
bash setup.sh   # Linux / macOS
```
