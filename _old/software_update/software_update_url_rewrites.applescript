do shell script "sudo chmod 775 /Library/Preferences/" with administrator privileges
try
	set SUServer to (do shell script "defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL")
on error number 1
	set SUServer to "Apple"
end try
set question to display dialog "Set the Software Update Server?" & return & return & "Current Server: " & SUServer buttons {"Server", "Apple"} default button 2
set answer to button returned of question

if answer is equal to "Apple" then
	try
		do shell script "defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL" with administrator privileges
	end try
	display dialog "Done!  The Software Update Server is set to Apple." buttons {"OK"} default button 1
end if

if answer is equal to "Server" then
	set catalogURLValue to "http://server.local:8088/index_BRANCHNAME.sucatalog"
	do shell script "defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL " & catalogURLValue with administrator privileges
	display dialog "Done!  The Software Update Server is set to Server." buttons {"OK"} default button 1
end if
