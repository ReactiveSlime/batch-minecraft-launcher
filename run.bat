@echo off
cls
rem gets latest version
echo Getting Latest Version
curl -o run.bat "https://raw.githubusercontent.com/ReactiveSlime/batch-minecraft-launcher/master/run.bat?_=%random%" -L

rem check if latest version is downloaded
cls

if not exist version.txt (
echo|set /p="0">Version.txt
)
set current_build=6
set /p build=<version.txt
if %build% EQU %current_build% (
goto argument
) else (
echo|set /p="6">Version.txt
goto update
pause
)

rem passes argument 1 and 2 as usernaem and password and logs in if correct

:argument
IF "%1"=="" ( goto main 
) else (
echo Logging In
)

set name=%1
if exist %name%.bat (
call %name%.bat
) else (
echo Invalid Username
pause>nul
goto main
)
rem makes username case sensitive
if not %name% EQU %username% (
echo Invalid Username
pause>nul
goto main
)

set pass=%2
if not %pass% EQU %password% (
echo That Is Not A valid Password.
pause>nul
goto main
)
goto loginsettings

rem main menu
:main
cls
echo What Would You Like To Do?
echo.
echo 1) Login
echo 2) Create Account
echo 3) Request Feature Or Report A Bug
echo.
echo.
set /p login=Option: 
if %login% EQU 1 goto login
if %login% EQU 2 goto createuser
if %login% EQU 3 goto links
if %login% EQU admin goto admincheck
goto main

rem log in
rem checks if account exist
:login
cls
set /p name=Username: 
if exist %name%.bat (
call %name%.bat
) else (
echo Invalid Username
pause>nul
goto main
)
rem makes username case sensitive
if not %name% EQU %username% (
echo Invalid Username
pause>nul
goto main
)
rem password check. also case sensitive
set /p pass=Password: 
if not %pass% EQU %password% (
echo That Is Not A valid Password.
pause>nul
goto main
)
goto loginsettings

rem user settings
:loginsettings
cls
echo What Would You Like To Do %username%?
echo.
echo 1) Play Minecraft
echo 2) Delete Account
echo 3) Change Password
echo 4) Open Minecraft Folder
echo 5) Open Minecraft Saves Folder
echo 6) Open Minecraft Textures Folder
echo 7) Log Out
echo.
echo.
set /p settingchoise=Option: 
if %settingchoise% EQU 1 goto play
if %settingchoise% EQU 2 goto accountdelete
if %settingchoise% EQU 3 goto changepassword
if %settingchoise% EQU 4 Explorer "%cd%\data\%name%"
if %settingchoise% EQU 5 Explorer "%cd%\data\%name%\saves"
if %settingchoise% EQU 6 Explorer "%cd%\data\%name%\texturepacks"
if %settingchoise% EQU 7 goto main
goto loginsettings

rem launches minecraft launcher in users folder (/data/username)
:play
start "" "%cd%\bin\Minecraft.exe" --workDir "%cd%\data\%name%"
goto loginsettings

rem change users password
:changepassword
rem asks user for current password  
set /p pass=Please Enter Your Current Password:
call %name%.bat
if not %password% EQU %pass% (
echo Invalid Password.
pause>nul
goto loginsettings
)
rem ask user for new password
echo What Would Uou Like To Change Your Password To?
set /p password=Password: 
echo.
del /AS "%name%.bat"
(
echo set username=%username%
echo set password=%password%
)>"%username%.bat"
echo Password Changed.
pause>nul
goto main

rem deletes user account
:accountdelete
del /AS "%name%.bat"
del /F/Q/S "%cd%\data\%username%\*.*" > nul
rmdir /Q/S "%cd%\data\%username%" >nul
if not exist "%cd%\data" mkdir "%cd%\data"
echo Account Deleted
pause>nul
goto main

rem creates user
:createuser
cls
echo.
echo What Would You Like Your Username To Be?
echo Username can't contain spaces
set /p username=Username: 
rem checks if account already exist
if exist "%username%.bat" (
echo The Account %username% Already Exist.
pause>nul
goto main
)

echo.
echo What Would You Like Your Password To Be?
echo Password can't contain spaces
set /p password=Password: 
rem creats file with user info
(
echo set username=%username%
echo set password=%password%
)>"%username%.bat"
mkdir "%cd%\data\%username%"
attrib +H +S "%username%.bat"
goto main

rem admin password check
:admincheck
call admin.bat
echo Please Enter The Admin Password: 
set /p pass=Password: 
if not %password% EQU %pass% (
echo Invalid Password.
pause>nul
goto main
)
goto admin


rem admin main menu
:admin
cls
echo What Would You Like To Do?
echo.
echo 1) Main Menu
echo 2) Delete User
echo 3) List Users
echo 4) Change User Password (WIP)
echo 5) Change Admin Password
echo.
echo.
set /p admin=Option: 
if %admin% EQU 1 goto main
if %admin% EQU 2 goto delete
if %admin% EQU 3 goto list
if %admin% EQU 4 goto changeuserpassword
if %admin% EQU 5 goto adminpassword
goto admin

rem admin deletes user
:delete
cls
echo If You Delete The Admin Account You Can Make a New Account Called Admin
set /p name=Username: 
if not exist "%name%.bat" (
echo That Is Not a Valid Username.
pause>nul
goto admin
)
del /AS "%name%.bat"
del /F/Q/S "%cd%\data\%username%\*.*" > nul
rmdir /Q/S "%cd%\data\%username%" >nul
rem sometimes if the last user gets deleted the data folder will also be deleted
rem this just makes the data folder if it dosnt exist
if not exist "%cd%\data" mkdir "%cd%\data"
goto admin

rem admin lists all users
:list
cls
echo All Users
for /F "delims= eol=" %%A IN ('dir /AS /B') do echo %%~nA
echo Press Any Key To Continue
pause >nul
goto admin

:changeuserpassword
goto admin

rem change admin password
:adminpassword
rem asks user for current password  
echo Please Enter The Admin Password:
set /p pass=Password: 
if not %password% EQU %pass% (
echo Invalid Password.
pause>nul
goto main
)
rem asks user for new password  
echo Enter New Admin Password
set /p password=Password: 
del /AS admin.bat
echo set password=%password%>admin.bat
attrib +H +S admin.bat
echo Password Changed
pause>nul
goto main

rem copys links to users clipboard
:links
cls
echo 1) Planet Minecrat Page (soon)
echo 2) Report a Bug
echo 3) Request Feature
echo 4) General Feedback
echo.
echo.
set /p linkoption=Option: 
if %linkoption% EQU 1 echo|set/p=http://PlanetMinecraft|clip & goto copied
if %linkoption% EQU 2 echo|set/p=https://docs.google.com/forms/d/e/1FAIpQLSeHiob751XWvtVHlN_vs2p09wzJN5tnog4QRAqIn5X9n-3Azw/viewform|clip & goto copied
if %linkoption% EQU 3 echo|set/p=https://docs.google.com/forms/d/e/1FAIpQLSeztMZDLQMTmcVu7L1sOQybVNHwGn9Zsl1PQJXVtb6E7hQtMQ/viewform|clip & goto copied
if %linkoption% EQU 4 echo|set/p=https://docs.google.com/forms/d/e/1FAIpQLSeINcI_lhwkHTqh-iNBvpmKM8iL5ethKPk4a6RuA8Hsoxpyvg/viewform|clip & goto copied
goto main

:copied
echo Link copied to clipboard
pause>nul
goto main

:update
echo Changelog
echo.
echo.
echo.Update 05/11/2021
echo.
echo Fixed a typo
echo.
echo Update 10/09/2019
echo.
echo Can Now login in command prompt e.g. open cmd cd to this folder and type run username password
echo replacing username and password with yours
echo.
echo Update 21/08/2019
echo.
echo Fixed update again
echo Fixed Typos
echo.
echo Update 20/08/2019
echo.
echo Can now interact with the command line while Minecraft is open
echo fixed problem with file being cached and not downloading the latest update
pause>nul
goto main
