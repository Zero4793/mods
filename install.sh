#!/bin/bash

# Resolve the real location of this script (handles symlinks)
SCRIPT_PATH="$(cd "$(dirname "$(readlink -f "$0" 2>/dev/null || echo "$0")")" && pwd)"
cd "$SCRIPT_PATH"

echo "============================================================"
echo "          Minecraft Mod Pack - Install Script"
echo "============================================================"
echo ""
echo "This will set up the mod pack in the current folder:"
echo "$SCRIPT_PATH"
echo ""

# ---- Git check loop ----
if ! git --version > /dev/null 2>&1; then
    echo "[!] Git was not found on your system."
    echo ""
    echo "    Please install Git:"
    echo "      Mac:   https://git-scm.com/downloads or run: xcode-select --install"
    echo "      Linux: sudo apt install git  (or your distro's equivalent)"
    echo ""
    echo "    Once installed, close this window and run the script again."
    echo ""
    read -r
    exit 1
fi

echo "[OK] Git found. Continuing..."
echo ""

# ---- Git setup ----
echo "Setting up mod pack repository..."
echo ""

git init
if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] git init failed. See error above."
    echo "Press Enter to close."
    read -r
    exit 1
fi

git remote add origin https://github.com/Zero4793/mods
if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] Failed to add remote. See error above."
    echo "Press Enter to close."
    read -r
    exit 1
fi

git pull origin master
if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] Failed to pull mods. See error above."
    echo "Press Enter to close."
    read -r
    exit 1
fi

# ---- Success ----
echo ""
echo "============================================================"
echo " Success! Mods installed. This window will close in 5 seconds."
echo "============================================================"
sleep 5
exit 0
