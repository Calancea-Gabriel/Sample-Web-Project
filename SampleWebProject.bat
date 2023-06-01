@echo off

rem Ottieni il percorso corrente
set project_dir=%cd%

rem Controlla se è stato fornito un parametro per il titolo del progetto
if "%~1"==" " (
  echo Inserire il titolo del progetto come parametro.
  exit /b
)

rem Imposta il titolo del progetto dal parametro passato
set project_title=%1

rem Crea la cartella con il titolo del progetto
mkdir "%project_dir%\%project_title%"

rem Imposta la cartella del progetto come percorso corrente
cd "%project_dir%\%project_title%"

rem Crea le cartelle necessarie
mkdir "css"
mkdir "js"
mkdir "server"

rem Crea i file iniziali
(
  echo ^<!DOCTYPE html^>
  echo ^<html lang="en"^>
  echo   ^<head^>
  echo     ^<meta charset="UTF-8"^>
  echo     ^<meta http-equiv="X-UA-Compatible" content="IE=edge"^>
  echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
  echo     ^<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"^>^</script^>
  echo     ^<script src="js/script.js"^>^</script^>
  echo     ^<link rel="stylesheet" href="css/style.css"^>
  echo     ^<title^>%project_title%^</title^>
  echo   ^</head^>
  echo   ^<body^>
  echo   ^</body^>
  echo ^</html^>
) > "index.html"

(
  echo *{ 
  echo     margin: 0; 
  echo     padding: 0; 
  echo }
) > "css/style.css"

(
  echo ^<?php
  echo 
  echo ?^>
) > "server/index.php"

(
  echo "use strict";
) > "js/script.js"
