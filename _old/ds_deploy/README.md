DS Deploy
=======

These scripts are somewhat random - and might contain code that could be useful in your deployments.  Some assume there is a user on the destination drive named "service-temp", others assume you're running as an admin user with no password [as described here](http://mikesolin.com/2012/04/28/10-5-allow-admin-users-with-no-password-to-use-sudo/).

- reset_10.4_to_setup_assistant.sh: For cleaning up a monolithic 10.4 image with a user named "service-temp".  The code for this script could be used for Mac OS X 10.0-10.3, as well.
- reset_10.5_to_setup_assistant.sh: For cleaning up a monolithic 10.5 image with a user named "service-temp".  This isn't coded to best practices - it'd be better to use dscl to remove the user.
- reset_10.6_to_setup_assistant.sh: For cleaning up a monolithic 10.6 image with a user named "service-temp".  This isn't coded to best practices - it'd be better to use dscl to remove the user.
- set_boot_drive_reboot_legacy.sh: This script is used to deploy an OS that DeployStudio no longer supports.  Same as above, except it removes the scripts that run DeployStudio's post-restore interface.
- set_boot_drive_reboot.sh: If you're booted from a full OS X NetBoot image (not the ones DeployStudio creates), it will not reboot once all workflows are fun.  Set this script to be the last task run.
- sleep_10.sh: Makes the machine wait 10 seconds. Sometimes, tasks fail when run immediately, so this is good for a quick fix.
