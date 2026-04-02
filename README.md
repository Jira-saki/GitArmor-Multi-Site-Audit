# 🛡️ GitArmor: Multi-Site Integrity & Drift Auditor

GitArmor is a lightweight, zero-dependency Bash utility for File Integrity Monitoring (FIM) in environments where traditional security agents (e.g., Falco, Wiz, Wazuh) are not possible. It is built for shared hosting and legacy infrastructure.

By using Git’s internal hashing and workspace status, GitArmor quickly detects unauthorized file changes (configuration drift) across multiple projects.

---

## ⚡ Problem

Managing 19+ WordPress and static sites on shared hosting introduces several challenges:

- No root access: IDS/IPS agents cannot be installed.
- High noise: malware scanners produce false positives in legacy code.
- Manual toil: checking git status in dozens of directories is slow and error-prone.

---

## 🚀 Solution

GitArmor treats your source code as the single source of truth and performs drift detection by comparing each site's working tree to its Git baseline.

## 📋 Project Scope & Coverage

| Site Group | Count | Platform | Focus |
| :--- | :--- | :--- | :--- |
| **WordPress Fleet** | 9 Sites | PHP / MySQL | Security Hardening |
| **Static Portfolio** | 5 Sites | HTML / CSS | High Availability |
| **Legacy Systems** | 5 Sites | Mixed | Integrity Monitoring |
| **Total Managed** | **19 Sites** | **AWS/Shared** | **Zero-Trust Baseline** |

### Key features

- Multi-tenant support: iterates through an array of project directories.
- Drift detection: identifies `M` (modified), `D` (deleted), and `??` (untracked) files.
- Noise reduction: distinguishes legitimate updates from suspicious modifications.
- Zero dependencies: only Bash and Git are required.

---

## 🛠️ Installation

```bash
git clone <https://github.com/Jira-saki/GitArmor-Multi-Site-Audit.git>
cd GitArmor-Multi-Site-Audit
```

---

## ⚙️ Configuration

Open `gcheck.sh` and edit the `SITES` array:

```bash
SITES=(
  "site-a.com"
  "site-b.net"
  "site-c.jp"
)
```

---

## ▶️ Usage

Run the audit:

```bash
./gcheck.sh
```

(Optional) Add an alias in your shell config (`~/.bashrc`, `~/.zshrc`):

```bash
alias gcheck='~/scripts/git-armor/gcheck.sh'
```

---

## 🔍 Example output

```text
--- site-a.com ---
  ✅ Clean (no drift)

--- site-b.net ---
 M wp-config.php        <-- Critical Change Detected!
 ?? shell.php           <-- Potential Malware!

--- site-c.jp ---
  ✅ Clean (no drift)

✨ Auditing Complete!
```

---

## 💡 Engineering reflection

This project grew from a real-world need to maintain integrity for 19 production sites on shared hosting. It demonstrates how a senior engineer can secure constrained environments using existing tooling and Git as a trust anchor.

---

## 📜 License

MIT License. Use, adapt, and improve for your workflows.
