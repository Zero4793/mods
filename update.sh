#!/bin/bash

# Resolve the real location of this script (handles symlinks/shortcuts)
SCRIPT_PATH="$(cd "$(dirname "$(readlink -f "$0" 2>/dev/null || echo "$0")")" && pwd)"
cd "$SCRIPT_PATH"

echo "============================================================"
echo "          Minecraft Mod Pack - Update Script"
echo "============================================================"
echo ""

# ---- Reset any local changes to tracked files ----
git reset --hard
if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] Failed to reset local changes. See error above."
    echo "Press Enter to close."
    read -r
    exit 1
fi

# ---- Pull latest mods ----
git pull origin master
if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] Failed to pull updates. See error above."
    echo "Press Enter to close."
    read -r
    exit 1
fi

# ---- Success ----
echo ""
echo "============================================================"
echo " Mods updated successfully! This window will close in 5 seconds."
echo "============================================================"
sleep 5
exit 0
