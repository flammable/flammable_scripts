VMware Backup
=======

These scripts are designed to be used with Carbon Copy Cloner. I have a scheduled task that backs up ~/Documents/Virtual Machines/ each night, but if I have VMware open and a task running overnight, the backup eventually fills up the destination drive. Here's my solution.

- vmware_preflight.sh and vmware_postflight.sh: Tested with OS X 10.10.x. Pauses currently-running VMs, performs the backup, then unpauses the VMs. Also supports suspend/resume, rather than pause/unpause.
- vmware_check.sh: Requires OS X 10.8.x or higher. Checks if VMware Fusion is running, and aborts the backup if that is the case.
- vmware_check_legacy.sh: Designed for OS X 10.7.x or lower. Does the same as vmware_check.sh, but does not rely on `pgrep` (which shipped with OS X 10.8).

I'd recommend using the first two scripts, but I'm including the older ones for reference.

More information is available on my blog [here](http://mikesolin.com/2013/05/16/backing-up-vmware-fusion-images/) and [here](http://mikesolin.com/2016/02/09/new-vmware-fusion-backup-scripts/).

Thanks:

- Anonymous penguin for basically rewriting it with me, twice.
- Jed Smith @ Stack Overflow [for the legacy script](http://stackoverflow.com/questions/1821886/check-if-mac-process-is-running-using-bash-by-process-name).