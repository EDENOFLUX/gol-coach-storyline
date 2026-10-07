@echo off
setlocal
set SRC=D:\EDENOFLUX\_Skills\.opensource\gol-coach-storyline
set SCRIPT=D:\EDENOFLUX\_工具\skill_opensource.py
set PY=C:\Users\lucie\.workbuddy\binaries\python\versions\3.13.12\python.exe

cd /d "%SRC%"

echo === [1/2] gh 登录检查 ===
gh auth status >nul 2>&1
if errorlevel 1 (
  echo [!] gh 未登录或 token 已失效。
  echo     请先在本机做以下任一项，再双击本脚本：
  echo       A) 开 Clash 代理后运行： gh auth login
  echo       B) 或： gh auth refresh -h github.com
  echo     也可手动设环境变量 GITHUB_TOKEN 后重跑本脚本。
  pause
  exit /b 1
)

echo === [2/2] 推送 gol-coach-storyline 到 github.com/EDENOFLUX ===
"%PY%" "%SCRIPT%" gol-coach-storyline --src "%SRC%" --apply

echo.
echo 完成。若成功，仓库在： https://github.com/EDENOFLUX/gol-coach-storyline
echo 推完后可删 D:\EDENOFLUX\_Skills\.opensource\ 临时目录（GitHub 上已有仓库）。
pause
