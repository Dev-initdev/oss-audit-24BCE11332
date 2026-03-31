# oss-audit-firefox

**Student:** Devang Atiyolil 

**Roll Number:** 24BCE11332 

**Course:** Open Source Software (NGMC)  
**Chosen Software:** Mozilla Firefox  
**License:** Mozilla Public License 2.0 (MPL 2.0)

---

## What This Repo Contains

```
LINUX/
├── README.md          
├── Screenshots/
│   ├── script1.png
│   ├── script2.png
│   ├── script3.png
│   ├── script4.png
│   └── script5.png
├── Scripts/
│   ├── manifesto_devan.txt
│   ├── script1_system_identity.sh
│   ├── script2_package_inspector.sh
│   ├── script3_disk_permission_auditor.sh
│   ├── script4_log_analyzer.sh
│   └── script5_manifesto_generator.sh
└──  OSS_Audit_Firefox_Devang Atiyolil_24BCE11332.pdf
```

The project report PDF is submitted separately on the VITyarthi portal.

---

## Script Descriptions

### Script 1: System Identity Report
Displays a welcome screen with the Linux distro name, kernel version, current user, home directory, uptime, date/time, and a note about the OSS license covering the OS and Firefox.  
**Concepts:** variables, command substitution `$()`, `/etc/os-release` parsing, `echo` formatting.

### Script 2: FOSS Package Inspector
Checks if Firefox is installed on the system using `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL), shows package details, and uses a `case` statement to print a philosophy note about various open-source packages.  
**Concepts:** `if-then-else`, `case` statement, `command -v` for tool detection, pipes with `grep`.

### Script 3: Disk and Permission Auditor
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports permissions, owner, and disk usage for each. Also checks Firefox's user config directory and explains why its permissions matter.  
**Concepts:** `for` loop over array, `ls -ld` with `awk`, `du -sh` with `cut`, `[ -d ]` directory check.

### Script 4: Log File Analyzer
Reads a log file line by line, counts lines matching a keyword (default: `error`), prints a summary, and shows the last 5 matching lines. Includes a retry mechanism for empty files.  
**Concepts:** `$1`/`$2` arguments, `while IFS= read -r` loop, `if-then` inside loop, counter variables, bash arrays.

### Script 5: Open Source Manifesto Generator
Asks the user three questions interactively and generates a personalised open source philosophy statement saved to `manifesto_<username>.txt`.  
**Concepts:** `read -p` for input, string concatenation, `>` and `>>` file writing, `date` command, `cat` to display output. Includes a comment demonstrating why aliases don't work reliably in scripts.

---

## How to Run Each Script on Linux

### Prerequisites
- A Linux system (Ubuntu, Fedora, Debian, Arch, or any distro)
- Bash shell (pre-installed on all Linux distros)
- Firefox installed (for Scripts 1, 2, and 3 to show Firefox-specific output)

### Step 1: Clone the repo
```bash
git clone https://github.com/<your-username>/oss-audit-firefox.git
cd oss-audit-firefox
```

### Step 2: Make scripts executable
```bash
chmod +x scripts/*.sh
```

### Step 3: Run each script

**Script 1:**
```bash
./scripts/script1_system_identity.sh
```

**Script 2:**
```bash
./scripts/script2_package_inspector.sh
```

**Script 3:**
```bash
./scripts/script3_disk_permission_auditor.sh
```

**Script 4:**
```bash
# Pass any log file and an optional keyword
./scripts/script4_log_analyzer.sh /var/log/syslog error

# Or use /var/log/auth.log on Ubuntu:
./scripts/script4_log_analyzer.sh /var/log/auth.log Failed
```

**Script 5:**
```bash
./scripts/script5_manifesto_generator.sh
# Follow the prompts. Output is saved to manifesto_<yourusername>.txt
```

---

## Dependencies
- `bash` (version 4+)
- `dpkg` or `rpm` (depending on distro, for Script 2)
- `du`, `ls`, `awk`, `cut`, `grep`, `date`, `uname`, `uptime`, `whoami` — all standard on any Linux system
- Firefox installed for full output from Scripts 2 and 3
