@echo off
setlocal
cd /d "%~dp0"

if not exist ".venv\Scripts\python.exe" (
  echo Missing .venv. Run: python -m venv .venv ^& .\.venv\Scripts\python -m pip install -r requirements.txt
  exit /b 1
)

call ".venv\Scripts\activate.bat"
python main.py --webui-only
pause
