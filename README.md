# VPN Interface Detector

A simple Bash script that identifies exactly which network interface your VPN is using by comparing system states before and after connection.

## 🚀 Quick Install

You can install this tool with a single command. This will download the script and allow you to run it globally by typing `vpn-detect`.

```bash
bash <(curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/install.sh)
```

**Usage:** Once installed, simply open your terminal and type:

```bash
vpn-detect
```

## 🛠 Manual Installation

If you prefer to install it manually without the script above:

1. Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

2. Make the script executable:

```bash
chmod +x vpn-detect.sh
```

3. Run it locally:

```bash
./vpn-detect.sh
```

4. (Optional) Move to bin for global usage:

```bash
sudo mv vpn-detect.sh /usr/local/bin/vpn-detect
```

## 📋 Requirements

* **OS:** Linux or macOS
* **Dependencies:** `net-tools`
  * This script relies on `ifconfig`.
  * Ubuntu/Debian: `sudo apt install net-tools`
  * macOS: Pre-installed by default.

## 📝 How it works

1. The script scans your current network interfaces.
2. It pauses and prompts you to connect to your VPN.
3. Once connected, it rescans the interfaces.
4. It compares the two lists to identify the new interface created by the VPN tunnel.