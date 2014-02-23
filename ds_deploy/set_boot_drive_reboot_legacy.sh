#!/bin/sh

echo "" | sudo -S bless --mount /Volumes/Macintosh\ HD/ --setBoot
rm -R /Volumes/Macintosh\ HD/Library/LaunchAgents/com.deploystudio.FinalizeApp.plist
rm -R /Volumes/Macintosh\ HD/Library/LaunchAgents/com.deploystudio.finalizeScript.plist
rm -R /Volumes/Macintosh\ HD/etc/deploystudio/
echo "" | sudo reboot
exit 0
