@echo off
mkdir data
mkdir bin
echo Downloading Minecraft.exe
curl -o bin\minecraft.exe "https://launcher.mojang.com/download/Minecraft.exe" -L
cls
echo Downloading run.bat
curl -o run.bat "https://raw.githubusercontent.com/ReactiveSlime/batch-minecraft-launcher/master/run.bat" -L
(
echo set username1=admin
echo set password1=password
)>"admin.bat"
attrib +H +S "admin.bat"
del %0 & run.bat
