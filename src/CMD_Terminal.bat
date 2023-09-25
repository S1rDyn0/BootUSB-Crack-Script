@echo off
:main
set /p "user_input=Command (type 'exit' to quit): "

if /i "%user_input%"=="exit" (
    goto :eof
) else (
    %user_input% 
    echo:
    goto main
)