@echo off
setlocal

:: Resolve the directory this script is actually located in
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

echo ============================================================
echo           Minecraft Mod Pack - Install Script
echo ============================================================
echo.
echo This will set up the mod pack in the current folder:
echo %SCRIPT_DIR%
echo.

:: ---- Git check loop ----
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Git was not found on your system.
    echo.
    echo     Please install Git from: https://git-scm.com/downloads
    echo     Once installed, close this window and run the script again.
    echo.
    pause >nul
    exit /b 1
)

echo [OK] Git found. Continuing...
echo.

:: ---- Git setup ----
echo Setting up mod pack repository...
echo.

git init
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] git init failed. See error above.
    echo Press any key to close.
    pause >nul
    exit /b 1
)

git remote add origin https://github.com/Zero4793/mods
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to add remote. See error above.
    echo Press any key to close.
    pause >nul
    exit /b 1
)

git pull origin master
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to pull mods. See error above.
    echo Press any key to close.
    pause >nul
    exit /b 1
)

:: ---- Success ----
echo.
echo ============================================================
echo  Success! Mods installed. This window will close in 5 seconds.
echo ============================================================
timeout /t 5 >nul
exit /b 0
