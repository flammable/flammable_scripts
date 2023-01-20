Software Update
=======

This script was written when I was a bench technician. I used this script to run updates on customers' computers, using a Software Update server located onsite. I recommend running it as an application from a network share.

Note that it requires administrative permissions to proceed - this is intentional. Not only does it fix permissions on /Library/Preferences, but OS versions older than 10.8 required admin permissions to install most updates. This allowed us to recognize early on if a customer supplied an accurate administrator password.

I'm proud to say that an earlier version of this script [was published at Mac OS X Hints](http://hints.macworld.com/article.php?story=20091002190708159). On the Hints forums, tw and Hal Itosis helped to create the logic in this script, although I've maintained and expanded on the script since then.  For example, I have added support for OS X versions up to (and including) 10.10, the script outputs the currently set Software Update Server in the main dialog box, and it fixes permissions on /Library/Preferences in the event that the current user can't write to that folder.

Included are two versions of the script: one for use with [server-side URL rewrites](https://github.com/wdas/reposado/blob/master/docs/URL_rewrites.txt), and one without. Both are meant to be used with [Reposado](https://github.com/wdas/reposado), but can be modified to work with OS X Server's Software Update service - just remove "_BRANCHNAME" from the URL. In either case, modify the script to point to swscan.apple.com or your own server.
