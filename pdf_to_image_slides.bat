@echo off
setlocal enabledelayedexpansion

REM Define la carpeta de entrada y salida
set "input_folder=_ux"
set "output_folder=img_slides"

REM Crear la carpeta de salida si no existe
if not exist "%output_folder%" mkdir "%output_folder%"

REM Recorrer todos los archivos PDF en la carpeta de entrada
for %%f in ("%input_folder%\*.pdf") do (
    REM Obtener el nombre del archivo sin la extensión
    set "filename=%%~nf"

    REM Definir la subcarpeta de salida
    set "output_subfolder=%output_folder%\!filename!"

    REM Imprimir el nombre del archivo PDF que se está procesando
    echo Procesando archivo: %%f

    REM Imprimir el path de la subcarpeta que se va a crear
    echo Creando carpeta: !output_subfolder!

    REM Crear la subcarpeta en la carpeta de salida si no existe
    if not exist "!output_subfolder!" mkdir "!output_subfolder!"

    REM Ejecutar el comando magick para convertir el PDF a imágenes 2K
    magick -density 600 "%%f" -resize 2560x1440 -extent 2560x1440 -quality 100 "!output_subfolder!\!filename!_%%03d.png"
)

echo Conversion completa.
pause
