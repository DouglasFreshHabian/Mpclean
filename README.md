<p align="center">
  <img src="https://img.shields.io/badge/script-Bash-blue?logo=gnu-bash" alt="Bash">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT License">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome">
</p>

<p align="center">
  <img src="https://github.com/DouglasFreshHabian/Mpclean/blob/main/Assets/Tux-Music-Boombox.png?raw=true" alt="My Image" width="400">
</p>

<h1 align="center">
💿 Mpclean
	</h1>


**Batch-clean your messy music filenames with style.**
`Mpclean.sh` is a flexible, terminal-based utility for cleaning and sanitizing audio file names—removing clutter like emojis, extra characters, and inconsistent formatting. Includes dry-run mode, emoji stripping, extension filtering, and test file generators.

---

### 📁 Contents

* `Mpclean.sh` – The main cleanup script
* `examples.sh` – Generates sample music filenames for testing
* `emojis.sh` – Adds emojis to filenames for testing emoji removal

---

### ⚙️ Features

* ✅ Removes brackets, quotes, pipes, slashes, parentheses
* ✅ Replaces spaces with hyphens & collapses dashes
* ✅ Supports `.mp3`, `.wav`, `.flac` (customizable)
* ✅ Optional emoji stripping
* ✅ Dry-run preview mode

---

### 🚀 Usage

```bash
chmod +x Mpclean.sh
./Mpclean.sh [options]
```

#### 🔧 Options

| Flag                | Description                         |
| ------------------- | ----------------------------------- |
| `-d`, `--dry-run`   | Show changes without renaming files |
| `-e`, `--no-emojis` | Strip emojis from filenames         |
| `-h`, `--help`      | Show help menu                      |

---

### 🧪 Testing

Use the included test scripts:

```bash
# Generate sample files
./examples.sh

# Add emoji chaos
./emojis.sh

# Clean them
./Mpclean.sh --dry-run --no-emojis
```

---

### 🛠 Requirements

* `bash`
* `perl` (for emoji removal)

---

### 🔐 License

MIT — feel free to fork, enhance, or integrate into your own audio toolkits.

---

## 💬 Feedback & Contributions

Got ideas, bug reports, or improvements?
Feel free to open an issue or submit a pull request!

## 💖 Support This Project

If Mpclean™ has helped you or your system, consider supporting the project!  
Your contributions help fuel future updates, testing, and new features.

Every bit of support is appreciated — thank you!


  <h2 align="center"> 
  <a href="https://www.buymeacoffee.com/dfreshZ" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>




<!-- Reach out to me if you are interested in collaboration or want to contract with me for any of the following:
	Building Github Pages
	Creating Youtube Videos
	Editing Youtube Videos
	Youtube Thumbnail Creation
	Anything Pertaining to Linux! -->

<!-- 
 _____              _       _____                        _          
|  ___| __ ___  ___| |__   |  ___|__  _ __ ___ _ __  ___(_) ___ ___ 
| |_ | '__/ _ \/ __| '_ \  | |_ / _ \| '__/ _ \ '_ \/ __| |/ __/ __|
|  _|| | |  __/\__ \ | | | |  _| (_) | | |  __/ | | \__ \ | (__\__ \
|_|  |_|  \___||___/_| |_| |_|  \___/|_|  \___|_| |_|___/_|\___|___/
        dfresh@tutanota.com Fresh Forensics, LLC 2025 -->
