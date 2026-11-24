@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo   正在启动本地预览服务...
echo   浏览器会自动打开 http://localhost:8080
echo   关掉这个黑窗口 = 停止服务
echo.
where python >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:8080
  python -m http.server 8080
  goto :eof
)
where py >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:8080
  py -3 -m http.server 8080
  goto :eof
)
echo   [!] 没找到 Python。
echo       装一个 Python 3 就行：https://www.python.org/downloads/
echo       安装时记得勾选 Add Python to PATH。
pause
