@echo off
echo This script will generate the code from the WSDL file on the desktop.
echo.

:: Ask the user for the WSDL file URL
set /p wsdl_path=Enter the WSDL file URL (for example: https://example.com/wsdl):

:: Get the current user's desktop path
set desktop_path=%USERPROFILE%\Desktop

:: Display a message indicating where the generated code will be saved
echo The generated code will be saved on your desktop: %desktop_path%.
echo.

:: Run the wsimport command with the URL provided by the user
wsimport -keep -s "%desktop_path%" -verbose %wsdl_path%

:: Final message
echo The process is complete. Check your desktop for the generated files.
pause
