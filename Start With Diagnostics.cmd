@echo off
setlocal
cd /d "%~dp0"
title QT9 Web Service Compatibility Tool - Diagnostics

if not exist "%~dp0runtime\python.exe" (
    echo The portable Python runtime is missing.
    echo Extract the complete ZIP before starting the tool.
    pause
    exit /b 2
)

"%~dp0runtime\python.exe" -I -B -u -m qms_compare ui ^
    --profile "profiles\default\profile.json" ^
    --settings "config\runner_settings.json" ^
    --classification-rules "config\resolutions.json" ^
    --output "reports"
set "tool_exit_code=%ERRORLEVEL%"

if not "%tool_exit_code%"=="0" (
    echo.
    echo The compatibility tool closed with error code %tool_exit_code%.
    echo Review the message above before closing this window.
    pause
)

exit /b %tool_exit_code%
