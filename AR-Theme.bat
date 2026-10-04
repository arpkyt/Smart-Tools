@echo off
setlocal EnableExtensions EnableDelayedExpansion
color 0A
title Windows Theme Manager [ar.pkyt Edition]

:: ============================================================
:: Windows Theme Manager (Simple & Reliable Edition)
:: Created by arpkyt | Discord: @arpkyt
:: ============================================================

set "KEY=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"

:MENU
cls
echo.
echo   ==========================================================
echo      [+] WINDOWS THEME MANAGER - SIMPLE MODE [+]
echo               [ Special Build by arpkyt ]
echo   ==========================================================
echo.
echo    [1] Toggle Dark / Light Mode
echo    [2] Support / Contact
echo    [3] Exit
echo.
echo   ----------------------------------------------------------
set /p "CHOICE=   Select an option [1-3]: "

if "%CHOICE%"=="1" goto TOGGLE
if "%CHOICE%"=="2" goto SUPPORT
if "%CHOICE%"=="3" exit /b
goto MENU

:TOGGLE
cls
echo.
echo   [*] Checking current system theme...
timeout /t 1 >nul
for /f "tokens=3" %%A in ('reg query "%KEY%" /v AppsUseLightTheme 2^>nul') do set "MODE=%%A"

if /I "!MODE!"=="0x0" (
    reg add "%KEY%" /v AppsUseLightTheme /t REG_DWORD /d 1 /f >nul
    reg add "%KEY%" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f >nul
    echo.
    echo   [SUCCESS] Light Mode deployed!
) else (
    reg add "%KEY%" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
    reg add "%KEY%" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
    echo.
    echo   [SUCCESS] Dark Mode deployed!
)

:: Refresh Explorer instantly so the change applies right away
taskkill /f /im explorer.exe >nul 2>&1
start "" explorer.exe

echo.
pause
goto MENU

:SUPPORT
cls
echo.
echo   ==========================================================
echo                       SUPPORT / CONTACT
echo   ==========================================================
echo.
echo    Need help or custom builds? Reach out directly:
echo.
echo    [+] Creator : arpkyt
echo    [+] Discord : @arpkyt
echo.
echo   ----------------------------------------------------------
echo.
pause
goto MENU