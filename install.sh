#!/bin/bash
# ==============================================================================
# Locker Kiosk Automated Setup & Chrome Launcher
# ==============================================================================

# 1. Prompt for password if PASS environment variable is not defined
if [ -z "$PASS" ]; then
    read -sp "Enter sudo password: " PASS
    echo ""
fi

echo "[1/8] Stopping stratum-daemon service..."
echo "$PASS" | sudo -S systemctl stop stratum-daemon.service 2>/dev/null || true

echo "[2/8] Setting display orientation..."
echo "$PASS" | sudo -n stratum-set-display-orientation 3 2>/dev/null || true

echo "[3/8] Stopping PM2 processes..."
echo "$PASS" | pm2 stop all 2>/dev/null || pm2 stop all || true

echo "[4/8] Downloading Google Chrome DEB package..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome.deb

echo "[5/8] Updating package lists..."
echo "$PASS" | sudo -S apt-get update -y

echo "[6/8] Installing Google Chrome..."
echo "$PASS" | sudo -S apt-get install -y /tmp/chrome.deb

echo "[7/8] Cleaning up temporary installer file..."
rm -f /tmp/chrome.deb



echo "=============================================================================="
echo " Setup complete! Generating terminal QR code for launching Chrome..."
echo "=============================================================================="

# Render ASCII QR code directly in the terminal window
qrencode -t ansiutf8 'google-chrome-stable --force-device-scale-factor=0.8 --start-fullscreen "https://kspatel45.github.io/Locker-Test-Kiosk/"'

echo "=============================================================================="
echo " Launching Google Chrome full screen..."
echo "=============================================================================="

# Launch Chrome in background
google-chrome-stable --force-device-scale-factor=0.8 --start-fullscreen "https://kspatel45.github.io/Locker-Test-Kiosk/" &

