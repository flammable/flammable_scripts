#!/bin/bash

vmrun="/Applications/VMware Fusion.app/Contents/Library/vmrun"
tail="/usr/bin/tail"
vmrun_output="/tmp/com.mikesolin.vmrun_output.txt"
running_vms="/tmp/com.mikesolin.running_vms.txt"

# get a list of running VMs
"${vmrun}" list > ${vmrun_output}

# trim the first line - we don't care how many are running
${tail} -n +2 ${vmrun_output} > ${running_vms}

# pause/unpause - does not save the contents of RAM to disk
while read i; do
  "${vmrun}" -T fusion pause "$i"
done < ${running_vms}

# suspend/resume - saves the contents of RAM to disk
# while read i; do
#   "${vmrun}" -T fusion suspend "$i" soft
# done < ${running_vms}

exit
