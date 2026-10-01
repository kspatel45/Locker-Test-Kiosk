#!/bin/bash
PASS="Great-00-Journey-Wise"
TARGET_URL="https://kspatel45.github.io/Locker-Test-Kiosk//"

# Check if Chrome is installed; if not, download and install it silently
if ! command -v google-chrome &> /dev/null; then
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome.deb
    echo "$PASS" | sudo -S apt-get update
    echo "$PASS" | sudo -S apt-get install -y /tmp/chrome.deb
    rm -f /tmp/chrome.deb
fi

# Launch Chrome with the target web page
google-chrome "$TARGET_URL" &
