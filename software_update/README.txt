This script was written when I was a bench technician with a local Software Update Server.  I wanted to run updates on customer computers, but from our local update server, as it was quicker.  This script, saved as an application on a network share, worked perfectly.

Note that it requires administrative permissions to proceed - this is intentional.  It fixes permissions on /Library/Preferences, and earlier OS versions (pre-10.8) required admin permissions to install most updates.

An earlier version of this script was published at Mac OS X Hints:

http://hints.macworld.com/article.php?story=20091002190708159

On the Hints forums, tw and Hal Itosis helped to create the logic in this script.  Since the original version, I have added support for OS X versions up to (and including) 10.9, the script outputs the current Software Update Server in the dialog box, and it fixes permissions on /Library/Preferences in the event that the current user can't write to that folder.

Included are two versions of the script: one for use with OS X Server, and another for use with Reposado.