#!/bin/bash

# VPN Interface Detector
# This script identifies which network interface your VPN uses

echo "=== VPN Interface Detector ==="
echo ""
echo "Step 1: Scanning network interfaces BEFORE VPN connection..."
echo ""

# Get list of interfaces before VPN connection
before=$(ifconfig | grep -E "^[a-z]" | awk '{print $1}' | sed 's/://')

echo "Scan complete."
echo ""

# Prompt user to connect to VPN
echo "Step 2: Please connect to your VPN now"
read -p "Have you connected to the VPN? (y/n): " answer

if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
    echo "Exiting script. Run again when ready to connect to VPN."
    exit 0
fi

echo ""
echo "Step 3: Scanning network interfaces AFTER VPN connection..."
echo ""

# Get list of interfaces after VPN connection
after=$(ifconfig | grep -E "^[a-z]" | awk '{print $1}' | sed 's/://')

echo "Scan complete."
echo ""

# Find the difference (new interface)
new_interface=$(comm -13 <(echo "$before" | sort) <(echo "$after" | sort))

echo "=== RESULT ==="
if [ -z "$new_interface" ]; then
    echo "No new interface detected."
    echo "Your VPN might be using an existing interface."
else
    echo "New interface detected: $new_interface"
    echo ""
    echo "Your VPN is using interface: $new_interface"
    echo ""
    echo "Interface details:"
    ifconfig "$new_interface"
fi