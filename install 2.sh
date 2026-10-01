#!/bin/bash
# ==============================================================================
# Locker Kiosk Setup & Launcher Script (index.sh)
# ==============================================================================

PASS="Great-00-Journey-Wise"

echo "[1/7] Stopping stratum-daemon service..."
echo "$PASS" | sudo -S systemctl stop stratum-daemon.service 2>/dev/null || true

echo "[3/7] Stopping PM2 processes..."
echo "$PASS" | pm2 stop all 2>/dev/null || pm2 stop all || true

echo "=============================================================================="
echo " Launching Google Chrome in full-screen mode..."
echo "=============================================================================="

google-chrome-stable --force-device-scale-factor=1 --enable-pinch --enable-features=PinchToZoom --start-fullscreen "https://kspatel45.github.io/Locker-Test-Kiosk/" &
```[cite: 5]

