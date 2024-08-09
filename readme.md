# DeCensor

Este conjunto de archivos permite configurar los servidores DNS de Google (8.8.8.8 y 8.8.4.4) en todos los adaptadores de red con acceso a Internet en una máquina con Windows. El proceso se realiza mediante un script en PowerShell ejecutado desde un archivo batch, lo que facilita la ejecución mediante doble clic.

## Archivos Incluidos

`mod-DNS.ps1`: Script en PowerShell que configura los DNS de Google en los adaptadores de red.

`decensor.bat`: Archivo batch que ejecuta el script PowerShell. Este archivo se puede ejecutar con un doble clic.

## Requisitos

- Permisos de Administrador: Para modificar la configuración de red, el archivo batch debe ejecutarse con permisos de administrador.

- Política de Ejecución de PowerShell: La política de ejecución de PowerShell debe permitir la ejecución de scripts. El archivo batch configura temporalmente la política de ejecución para permitir la ejecución del script.

## Instrucciones de Uso

- Preparar los Archivos: Coloca `mod-DNS.ps1` y decensor.bat en la misma carpeta.

- Ejecutar el Script: Haz doble clic en `decensor.bat`. Esto ejecutará el script PowerShell que configura los DNS. Se abrirá una ventana de comandos que mostrará el progreso y el resultado de la configuración. Al finalizar, la ventana se detendrá para que puedas ver cualquier mensaje de resultado.

### Notas

Ejecución en PowerShell: Si encuentras problemas con la ejecución del script debido a la política de ejecución, asegúrate de que la política esté configurada para permitir la ejecución de scripts. El script batch utiliza `-ExecutionPolicy Bypass` para evitar restricciones temporales.

### Verificación

Después de ejecutar el script, puedes verificar la configuración de DNS a través de las propiedades del adaptador de red en el Panel de Control o mediante el comando `ipconfig /all` en la línea de comandos.