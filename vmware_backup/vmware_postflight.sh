#!/bin/bash

vmrun="/Applications/VMware Fusion.app/Contents/Library/vmrun"
running_vms="/tmp/com.mikesolin.running_vms.txt"

# pause/unpause - does not save the contents of RAM to disk
while read i; do
  "${vmrun}" -T fusion unpause "$i"
done < ${running_vms}

# suspend/resume - saves the contents of RAM to disk
# while read i; do
#   "${vmrun}" -T fusion start "$i" gui
# done < ${running_vms}

exit
