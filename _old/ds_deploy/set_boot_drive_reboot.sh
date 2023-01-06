#!/bin/sh

echo "" | sudo -S bless --mount /Volumes/Macintosh\ HD/ --setBoot
echo "" | sudo reboot
# osascript -e 'tell application "System Events" to restart'
exit 0
