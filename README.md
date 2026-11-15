# scripts — Raspberry Pi & UAV Setup Scripts

A collection of configuration, installation, and utility scripts for Linux systems (primarily **Raspberry Pi OS** / Debian).

---

## Module Overview

| Module | Purpose | Key Tech | Documentation |
|---|---|---|---|
| **[ai-setup](ai-setup/)** | Prevents unwanted default AI agent behaviors by enforcing baseline rules. | Markdown, System Instructions | [ai-setup/README.md](ai-setup/README.md) |
| **[ssh-setup](ssh-setup/)** | Configures SSH key authentication and host aliases (`~/.ssh/config`) from your PC to a Raspberry Pi. Works on Windows and Linux. | OpenSSH, Ed25519, `ssh-copy-id`, `~/.ssh/config` | [ssh-setup/README.md](ssh-setup/README.md) |
| **[wifi-fix](wifi-fix/)** | Fixes Raspberry Pi headless access issues. Provides direct Ethernet cable fallback (`10.42.0.1`) and prevents Wi-Fi sleep/dropouts. | NetworkManager, systemd timers, RFKill, iw | [wifi-fix/README.md](wifi-fix/README.md) |
| **[wfb-ng](wfb-ng/)** | Installer and tooling for a long-range bidirectional digital radio link (air ↔ ground station). Carries MAVLink, SSH tunnel, and RTSP/WebRTC video. | WFB-ng, RTL8812EU (raw 802.11 monitor injection), WebRTC, MAVLink | [wfb-ng/README.md](wfb-ng/README.md) |

---

## Quickstart

### 1. Run directly in terminal (without cloning)

- **AI Assistant Rules & Setup:**
  - **Windows (PowerShell):**
    ```powershell
    irm https://raw.githubusercontent.com/FalcO0O/scripts/master/ai-setup/setup.ps1 | iex
    ```
  - **Linux / macOS (Bash):**
    ```bash
    curl -fsSL https://raw.githubusercontent.com/FalcO0O/scripts/master/ai-setup/setup.sh | bash
    ```

- **SSH Key & Client Alias Setup (Run on your computer):**
  - **Windows (PowerShell):**
    ```powershell
    irm https://raw.githubusercontent.com/FalcO0O/scripts/master/ssh-setup/setup.ps1 | iex
    ```
  - **Linux / macOS (Bash):**
    ```bash
    curl -fsSL https://raw.githubusercontent.com/FalcO0O/scripts/master/ssh-setup/setup.sh | bash
    ```

- **Network Configuration (Run on the Raspberry Pi):**
  - Direct Ethernet fallback link (`10.42.0.1`):
    ```bash
    curl -fsSL https://raw.githubusercontent.com/FalcO0O/scripts/master/wifi-fix/eth.sh | sudo bash
    ```
  - Wi-Fi watchdog & stability:
    ```bash
    curl -fsSL https://raw.githubusercontent.com/FalcO0O/scripts/master/wifi-fix/wifi.sh | sudo bash
    ```

---

### 2. Run from cloned repository

```bash
git clone https://github.com/FalcO0O/scripts.git
cd scripts
```

Choose your module:

- **AI Assistant Rules & Setup:**
  ```bash
  cd ai-setup
  .\setup.ps1         # Windows (PowerShell)
  bash setup.sh       # Linux / macOS
  ```
  *(Details & options: [ai-setup/README.md](ai-setup/README.md))*

- **SSH Key & Client Alias Setup:**
  ```bash
  cd ssh-setup
  .\setup.ps1         # Windows (PowerShell)
  bash setup.sh       # Linux / macOS
  ```
  *(Details & options: [ssh-setup/README.md](ssh-setup/README.md))*

- **Network Configuration (Direct cable access or reliable Wi-Fi):**
  ```bash
  cd wifi-fix
  chmod +x eth.sh wifi.sh
  sudo ./eth.sh       # direct Ethernet link (10.42.0.1 / mDNS fallback)
  sudo ./wifi.sh      # Wi-Fi hardening with automatic watchdog
  ```
  *(Details: [wifi-fix/README.md](wifi-fix/README.md))*

- **WFB-ng Radio Link Setup (Drone / Ground Station):**
  > **Important safety note:** Both antennas **must** be connected to the module before powering up (transmitting without antennas destroys the RF power amplifier). If testing on a workbench via Raspberry Pi USB power, cap the power limit to prevent brownouts.

  ```bash
  cd wfb-ng

  # 1. On the drone (generates the encryption keypair):
  sudo ./install.sh --role air

  # 2. Ship the ground station key to the GS host over your local network:
  sudo ./scripts/wfb-keys-provision --role air <ground_station_ip_or_hostname>

  # 3. On the ground station (finds /etc/gs.key already present):
  sudo ./install.sh --role gs
  ```
  *(Details & `link.conf` tuning: [wfb-ng/README.md](wfb-ng/README.md) and [wfb-ng/docs/install.md](wfb-ng/docs/install.md))*
