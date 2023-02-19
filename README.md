# MorrowindSoundReplace  
This script will literally replace every sound(excluding songs) in morrowind with whatever you choose.  
For an example of what can be done with this divine codebase, check this out:  
[![Everything Is AWESOME](https://img.youtube.com/vi/Ffmwx7Ut7Yg/0.jpg)](https://www.youtube.com/watch?v=Ffmwx7Ut7Yg "# i replaced every sound in morrowind with the tiktok snore(AAUUGHH)")  
## How to run it  
Running this script is pretty easy, you can simply download and extract the [latest release](https://github.com/s1ddly/MorrowindSoundReplace/releases/latest) and run the runme.bat file.  
This will start executing the powershell code with a flag to ignore system default powershell execution policy.  
When you run the code, it will ask you for some inputs:  
| Input | Description | 
| :--- | :---- |  
| Morrowind Location| The location of the Morrowind installation directory, this is the folder that contains the Morrowind.exe file |
| Input Mp3 | The mp3 version of the sound you want to insert |
| Input Wav | The wav version of the sound you want to insert |
| Backup Confirmation | Whether or not you want to back up the default sounds that shipped with the game. Restoration instructions are available in the backup directory |
## FAQ
**Why do I need to provide a wav and mp3 version of the same file?**  
Morrowind uses both wav and mp3 sound files for its noises, I have opted to ask for 2 files instead of just converting 1 user provided file to reduce complexity. Putting the onus on the user to provide 2 different files allows the code to be simple and usable in as many different versions of windows without having to ship this executable with a bunch of binaries. To convert files to mp3 or wav, you can use this online [converter](https://cloudconvert.com/).  
**Why would anyone ever want to do this?**  
Ok that question shouldn't be posed to me, it should be going to the people who actually end up using this. But if you are asking me, I was simply inspired by this iconic [video](https://www.youtube.com/watch?v=NF-XMtNEudQ). I ended up doing the stuff manually for this [video](https://www.youtube.com/watch?v=Ffmwx7Ut7Yg) I made, but decided to make the script as a creative outlet, hopefully someone actually ends up using it and having a laugh. Maybe a good candidate for one of those "everytime x happens is the bee movie script" memes.
**Can I use this to make content?**
Sure, feel free to do whatever you want this code, and use it to turn your morrowind into whatever you want it to be. My only ask is that if you make a video or meme, please credit this github :) 