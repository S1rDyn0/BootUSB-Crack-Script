rem This script will be placed in C:/SophosUtility Folder that was created by crack.bat
rem It will silently run the registry files and start Sophos Uninstallation afterwards.

REGEDIT.EXE /S "%~dp0\1EndpointDefense.reg" || echo ERROR - 1st Registry patch could not be applied! & pause & exit /b 1
REGEDIT.EXE /S "%~dp0\2SophosMCSAgent.reg" || echo ERROR - 2nd Registry patch could not be applied! & pause & exit /b 1

echo Sophos patched successfully! Please manually uninstall the program.