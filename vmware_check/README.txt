This script is designed to be a Carbon Copy Cloner preflight script. I have a scheduled task that backs up ~/Documents/Virtual Machines/ each night, but if I have VMware open and a task running overnight, the backup eventually fills up the destination drive. This preflight script is designed to stop the backup if VMware Fusion is running.

Requires OS X 10.8.x, or pgrep to be installed manually.  The legacy script should work on earlier systems, but is less elegant.

Thanks:

- Anonymous penguin for basically rewriting it with me, twice.
- Jed Smith @ Stack Overflow for the legacy script: http://stackoverflow.com/questions/1821886/check-if-mac-process-is-running-using-bash-by-process-name