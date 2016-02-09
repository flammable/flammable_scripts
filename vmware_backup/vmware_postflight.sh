#!/bin/bash

vmrun="/Applications/VMware Fusion.app/Contents/Library/vmrun"
running_vms="/tmp/com.mikesolin.running_vms.txt"

while read i; do
  "${vmrun}" -T fusion unpause "$i"
done < ${running_vms}

# while read i; do
#   "${vmrun}" -T fusion start "$i" gui
# done < ${running_vms}

exit
