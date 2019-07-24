
# **ReactiveSlimes Minecraft Batch Launcher**

## Small time batch script developer and I just make scripts in my free time but this one is different. It's my first one I have put up online.

**Back story on how I began this project:**
I'm in collage year 11 and me and some other students in our robotic class wanted to play Minecraft but there were some problems
1: No one knew how to get to the default Minecraft folder 
2: The collage had a proxy so the clients couldn't connect to the authentication servers for login

**Problem 1 solution**
I over come these problems with a small batch script because I found out that the Java executable  (use Java launcher because collage blocked .exe) supported some arguments the most impotent being  **--workDir**  which changed the Minecraft folder to a different location so I didn't have to get to every ones default Minecraft folder.

**Problem 2 solution**
To solve the login problem when I got home I copied a clean Minecraft folder with my login but changed the 
display name so we were all logged in and could play on a local server

*Doing this also resulted in me being banned from school computers for 2 weeks*

# Why did I continue this project?

A friend of mine has a shared family computer and sometimes the younger siblings would delete his saves. My friend asked me if I could make a user account were each user would have there own Minecraft folder. All that was done after about an hour but I keep finding ways of making it better and you can see them in [Features](#features)


# Features
**Admin**
To get to the admin panel run the batch file and on the first menu type "admin" without the "" and the default password is "password" also without the ""
Admin has five option to choose from

 - List Users
 - Delete Users
 - Log out
 - Change User Password (WIP)
 - Change Admin Password

**Normal User**
A normal user will have seven option to choose from when logged in

 - Play Minecraft
 - Delete Account
 - Change Password
 - Open Minecraft Folder
 - Open Saves Folder 
 - Open Texture Packs Folder
 - Log out

If the user has Minecraft open the other options will be disabled until Minecraft is closed. I will try to change that in a later update

# Planned Features

 1. setup.bat option to use legacy launcher or new launcher by default
 2. change option in admin panel
 3. make option account based?
 4. Make Admin Change User Password
 5. Make Imput case Sensitive

## Making Changes And Updating

To begin download the setup.bat file and it will make two folders and download Minecraft and after that run the run file (run.bat)
The batch file has an updater that will update the file on every run so if you make changes to the file on line five put REM at the start to so it gets ignored and your edit doesn't disappear

