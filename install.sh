#!/bin/bash

# Configuration
SCRIPT_URL="https://github.com/DD00031/vpn-detect/raw/refs/heads/main/vpn-detect.sh"
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="vpn-detect"

echo "Installing VPN Interface Detector..."

# Check if running as root or if sudo is available
if [ "$EUID" -ne 0 ]; then
    echo "This script requires administrator privileges to install to $INSTALL_DIR"
    echo "Please enter your password if prompted."
    SUDO="sudo"
else
    SUDO=""
fi

# Download the script
echo "Downloading script..."
$SUDO curl -sSL "$SCRIPT_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"

# Check if download succeeded
if [ $? -ne 0 ]; then
    echo "Error: Failed to download the script. Please check your internet connection and the URL."
    exit 1
fi

# Make executable
echo "Setting permissions..."
$SUDO chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo ""
echo "Installation complete!"
echo "You can now run the tool anywhere by typing: $SCRIPT_NAME"