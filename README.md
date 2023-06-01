# Sample Web Project

Crea un sample che, quando viene richiamato dalla command prompt (cmd), crea automaticamente una serie di file necessari per un progetto web.

## File generati

Di seguito sono elencati i file generati automaticamente:

- `js/script.js`
- `css/style.css`
- `php/index.php`
- `index.html`

## Informazioni aggiuntive

Il progetto include anche:

- CDN di jQuery 3.7.0 inclusa nel file `index.html`

## Installer

Per installare il sample, segui i seguenti passaggi:

1. Crea una cartella chiamata "Scripts" nel disco C:.
2. Crea un file chiamato "SampleWebProject.bat" con il seguente codice:

```bat
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
```

3. Consenti l'esecuzione di tutti i file batch. Apri la PowerShell e esegui il seguente comando:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

4. Crea un nuovo profilo per la PowerShell con il seguente comando:
```powershell
if (!(Test-Path -Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }
```

5. Apri il profilo con il seguente comando nella Powershell:
```powershell
notepad $PROFILE
```

6. Inserisci il seguente codice all'interno del file di testo:
```php
function SampleWebProject {
    param (
        [string]$Title
    )

    $scriptPath = Join-Path 'C:\Scripts' 'SampleWebProject.bat'
    Start-Process -FilePath $scriptPath -WorkingDirectory (Get-Location) -ArgumentList $Title
}
```
7. Salva e chiudi

8. Apri il Prompt dei comandi (cmd) o PowerShell e digita "SampleWebProject" seguito dal titolo del tuo progetto come parametro. Ad esempio:
```powershell
SampleWebProject MyWebProject
```
8. Verrà creata una cartella con il nome del tuo progetto, contenente i file necessari.

9. Ora puoi iniziare a sviluppare il tuo progetto web all'interno della cartella creata.

