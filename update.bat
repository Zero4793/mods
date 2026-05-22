@echo off
setlocal

:: Resolve the directory this script is actually located in
:: %~dp0 always points to the real file location, even when run from a shortcut
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

echo ============================================================
echo           Minecraft Mod Pack - Update Script
echo ============================================================
echo.

:: ---- Reset any local changes to tracked files ----
git reset --hard
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to reset local changes. See error above.
    echo Press any key to close.
    pause >nul
    exit /b 1
)

:: ---- Pull latest mods ----
git pull origin master
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to pull updates. See error above.
    echo Press any key to close.
    pause >nul
    exit /b 1
)

:: ---- Success ----
echo.
echo ============================================================
echo  Mods updated successfully! This window will close in 5 seconds.
echo ============================================================
timeout /t 5 >nul
exit /b 0
