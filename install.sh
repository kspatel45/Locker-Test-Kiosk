#!/bin/bash
# ==============================================================================
# Locker Kiosk Setup & Launcher Script (index.sh)
# ==============================================================================

PASS="Great-00-Journey-Wise"

echo "[1/7] Stopping stratum-daemon service..."
echo "$PASS" | sudo -S systemctl stop stratum-daemon.service 2>/dev/null || true

echo "[2/7] Setting display orientation..."
echo "$PASS" | sudo -n stratum-set-display-orientation 3 2>/dev/null || true

echo "[3/7] Stopping PM2 processes..."
echo "$PASS" | pm2 stop all 2>/dev/null || pm2 stop all || true

echo "[4/7] Downloading Google Chrome DEB package..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome.deb

echo "[5/7] Updating package lists..."
echo "$PASS" | sudo -S apt-get update -y

echo "[6/7] Installing Google Chrome..."
echo "$PASS" | sudo -S apt-get install -y /tmp/chrome.deb

echo "[7/7] Cleaning up temporary installer file..."
rm -f /tmp/chrome.deb

echo "=============================================================================="
echo " Setup complete! Launching Google Chrome in full-screen mode..."
echo "=============================================================================="

google-chrome-stable --force-device-scale-factor=0.8 --start-fullscreen "https://kspatel45.github.io/Locker-Test-Kiosk/" &
