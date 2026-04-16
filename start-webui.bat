@echo off
setlocal
set "REPO_DIR=D:\Lin\нд╪Ч\GitHub\daily_stock_analysis"

if not exist "%REPO_DIR%\main.py" exit /b 1
if not exist "%REPO_DIR%\.venv\Scripts\pythonw.exe" exit /b 1

cd /d "%REPO_DIR%"
start "daily_stock_analysis_web" /B "%REPO_DIR%\.venv\Scripts\pythonw.exe" "%REPO_DIR%\main.py" --webui-only

powershell -NoProfile -Command "$url='http://127.0.0.1:8000'; for ($i=0; $i -lt 120; $i++) { try { Invoke-WebRequest -UseBasicParsing -Uri $url -TimeoutSec 2 | Out-Null; Start-Process $url; exit 0 } catch { Start-Sleep -Seconds 1 } }; exit 1"
exit /b 0
