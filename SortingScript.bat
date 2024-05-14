@echo off
setlocal enabledelayedexpansion

REM Get the directory where the script is located
set "script_dir=%~dp0"

REM Loop through each file in the script's directory
for %%F in ("%script_dir%*") do (
    REM Check if the item is a file (not a directory) and not the script itself
    if not "%%~aF"=="d" if not "%%~fF"=="%~f0" (
        REM Get the base name of the file
        set "base_name=%%~nF"
        
        REM Extract the common name (before the first hyphen)
        for /f "tokens=1 delims=-" %%A in ("!base_name!") do set "common_name=%%A"
        
        REM Create a folder if it doesn't exist
        mkdir "%script_dir%!common_name!" 2>nul
        
        REM Move the file to the appropriate folder
        move "%%F" "%script_dir%!common_name!"
    )
)

echo Files organized successfully.
pause
