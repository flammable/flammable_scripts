DS Reposado
=======

These scripts are meant to be used with DeployStudio and Reposado. I don't know if it's the case anymore, but at the time DeployStudio only supported one catalog URL - so instead, I scripted setting the Software Update Server to my Reposado server, running DeployStudio's Software Update task, then setting the Software Update server back to Apple's. I found deleting the preference file to be more reliable than trying to do a "defaults delete" on the existing file.

Although I'm sure there's a way around this, these scripts are hardcoded to require the destination drive to be named exactly "Macintosh HD". These scripts were used to deploy various OS versions that supported the DeployStudio post-restore interface. At the time, 10.4 didn't, and required a separate workflow, but I'm including my 10.4 Reposado script for posterity (perhaps, if you're using it with the 10.4-compatible release of DeployStudio).

The scripts are also hardcoded to be run from a full NetBooted OS, logged as an admin user, with no password ([see here for how to configure the admin user's CLI privileges](http://mikesolin.com/2012/04/28/10-5-allow-admin-users-with-no-password-to-use-sudo/)). Users ran DeployStudio Runtime from a diagnostic NetBoot image, so it's possible some of these scripts might not run from the NetBoot images DeployStudio creates.

I don't expect anyone to replicate the setup I configured, but hopefully this helps to understand the scripts and adapt to your environment.

Suggested workflow order and settings:

1. Partition task - name must be "Macintosh HD". Target disk: first disk available. Do not set either checkbox.
2. Restore task - apply disk image. Rename volume to "Macintosh HD", set checkboxes: Dont check restoration (faster), Erase target for block copy restoration (faster).
3. Install task (optional). We used this to add the iLife installer. Set checkbox: Automate.
4. Software update task. Do not set a base URL. Set checkboxes: Run Apple Software Update client at first boot, Automate.
5. Generic task: sus_set_apple.sh. Set checkboxes: Postponed execution (command will be launched at first boot), Automate.
6. Generic task: sus_set_reposado_10.X.sh. Set checkbox: Automate.
7. Generic task: set_boot_drive_reboot.sh (get this from the ds_deploy folder). Set checkbox: Automate.

All of this was used with DeployStudio Server 1.0rc130. Language, logic, and compatibility might have changed since then. Hope this helps!