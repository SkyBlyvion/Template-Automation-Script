@echo off
setlocal

REM Define the path to the template project
set TEMPLATE_PATH=C:\Users\REVIMPORT-NicolasLOP\Documents\AL\ALProject1

REM Define the destination folder where new projects will be created
set DESTINATION_FOLDER=C:\Users\REVIMPORT-NicolasLOP\Documents\AL-ScriptCreated

REM Prompt for the new project name
set /p PROJECT_NAME=Enter the new project name: 

REM Create the new project path
set NEW_PROJECT_PATH=%DESTINATION_FOLDER%\%PROJECT_NAME%

REM Output paths for debugging
echo Template Path: %TEMPLATE_PATH%
echo Destination Folder: %DESTINATION_FOLDER%
echo New Project Path: %NEW_PROJECT_PATH%

REM Copy the template folder to the new project path
xcopy /E /I "%TEMPLATE_PATH%" "%NEW_PROJECT_PATH%" >nul

REM Check if the project was copied successfully
if %errorlevel% neq 0 (
    echo Failed to copy the project. Please check the template path and destination folder.
    pause
    endlocal
    exit /b 1
)

REM Debugging: Output the new project path to ensure it's correct
echo Project copied successfully to %NEW_PROJECT_PATH%.

REM Open the new project in Visual Studio Code in a new process
start "" code "%NEW_PROJECT_PATH%"

endlocal
exit
