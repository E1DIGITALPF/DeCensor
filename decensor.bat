@echo off
echo Verificando si PowerShell está en el PATH...

echo %PATH% | findstr /C:"C:\Windows\System32\WindowsPowerShell\v1.0" >nul
if errorlevel 1 (
    echo PowerShell no está en el PATH. Añadiendo PowerShell al PATH...
    setx PATH "%PATH%;C:\Windows\System32\WindowsPowerShell\v1.0"
    echo PowerShell ha sido añadido al PATH.
    echo Esperando 10 segundos para que el PATH se actualice...
    timeout /t 10 /nobreak >nul
) else (
    echo PowerShell ya está en el PATH.
)

set PowerShellScriptPath="mod-DNS.ps1"

echo Ejecutando el script PowerShell...
powershell -NoProfile -ExecutionPolicy Bypass -File %PowerShellScriptPath%

pause
