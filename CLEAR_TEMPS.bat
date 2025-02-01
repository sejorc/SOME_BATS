REM THIS SCRIPT HELPS US DELETE USELESS TEMPORARY FILES SUCH AS TEMPS, THUMBNAILS, OLD UPDATES...
REM author Sergio.

@echo off
REM Checking Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires Administrator privileges.
    pause
    exit /b
)

REM Script to clean temporary files from multiple locations

REM Clean the user's TEMP folder
if exist "%TEMP%" (
    del /q /f "%TEMP%\*.*" 2>nul
    for /d %%x in ("%TEMP%\*") do rd /s /q "%%x" 2>nul
)

REM Clean the Windows TEMP folder
if exist "C:\Windows\Temp" (
    del /q /f "C:\Windows\Temp\*.*" 2>nul
    for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" 2>nul
)

REM Clean Internet Explorer cache (if needed) I commented it out as it may not be necessary, I leave it as an example.
REM if exist "%LocalAppData%\Microsoft\Windows\INetCache" (
REM    del /q /f "%LocalAppData%\Microsoft\Windows\INetCache\*.*" 2>nul
REM    for /d %%x in ("%LocalAppData%\Microsoft\Windows\INetCache\*") do rd /s /q "%%x" 2>nul
REM )

REM Clean the Recent files folder
if exist "%AppData%\Microsoft\Windows\Recent" (
    del /q /f "%AppData%\Microsoft\Windows\Recent\*.*" 2>nul
)

REM Clean Prefetch files (optional)
if exist "C:\Windows\Prefetch" (
    del /q /f "C:\Windows\Prefetch\*.*" 2>nul
)

REM Clean thumbnails
if exist "%LocalAppData%\Microsoft\Windows\Explorer" (
    del /q /f "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*.*" 2>nul
)

REM Clean Windows Update cache (old update downloads)
if exist "C:\Windows\SoftwareDistribution\Download" (
    del /q /f "C:\Windows\SoftwareDistribution\Download\*.*" 2>nul
    for /d %%x in ("C:\Windows\SoftwareDistribution\Download\*") do rd /s /q "%%x" 2>nul
)

REM Clean Windows logs
if exist "C:\Windows\Logs" (
    del /q /f "C:\Windows\Logs\*.*" 2>nul
    for /d %%x in ("C:\Windows\Logs\*") do rd /s /q "%%x" 2>nul
)

REM Clean Windows Defender installation cache
if exist "%ProgramData%\Microsoft\Windows Defender\Scans\History\Store" (
    del /q /f "%ProgramData%\Microsoft\Windows Defender\Scans\History\Store\*.*" 2>nul
    for /d %%x in ("%ProgramData%\Microsoft\Windows Defender\Scans\History\Store\*") do rd /s /q "%%x" 2>nul
)

REM if we comment out this pause by adding REM in front, the console will not remain open
pause
REM End of the script
exit /b
