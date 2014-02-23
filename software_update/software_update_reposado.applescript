do shell script "sudo chmod 775 /Library/Preferences/" with administrator privileges
try
	set SUServer to (do shell script "defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL")
on error number 1
	set SUServer to "Apple"
end try
set question to display dialog "Set the Software Update Server?" & return & return & "Current Server: " & SUServer buttons {"Reposado", "Apple"} default button 2
set answer to button returned of question

if answer is equal to "Apple" then
	try
		do shell script "defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL" with administrator privileges
	end try
	display dialog "Done!  The Software Update Server is set to Apple." buttons {"OK"} default button 1
end if

if answer is equal to "Reposado" then
	tell application "System Events"
		set OSVersion to do shell script "sw_vers -productVersion"
	end tell
	if OSVersion starts with "10.4" then
		-- set up Tiger thing
		set catalogURLValue to "http://server.local/content/catalogs/index_BRANCHNAME.sucatalog"
	else if OSVersion starts with "10.5" then
		-- set up Leopard thing
		set catalogURLValue to "http://server.local/content/catalogs/others/index-leopard.merged-1_BRANCHNAME.sucatalog"
	else if OSVersion starts with "10.6" then
		-- set up Snow Leopard thing
		set catalogURLValue to "http://server.local/content/catalogs/others/index-leopard-snowleopard.merged-1_BRANCHNAME.sucatalog"
	else if OSVersion starts with "10.7" then
		-- set up Lion thing
		set catalogURLValue to "http://server.local/content/catalogs/others/index-lion-snowleopard-leopard.merged-1_BRANCHNAME.sucatalog"
	else if OSVersion starts with "10.8" then
		-- set up Mountain Lion thing
		set catalogURLValue to "http://server.local/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1_BRANCHNAME.sucatalog"
	else if OSVersion starts with "10.9" then
		-- set up Mavericks thing
		set catalogURLValue to "http://server.local/content/catalogs/others/index-10.9-mountainlion-lion-snowleopard-leopard.merged-1_BRANCHNAME.sucatalog"
	else
		--crap out, because it's Panther or less
		return
	end if
	do shell script "defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL " & catalogURLValue with administrator privileges
	display dialog "Done!  The Software Update Server is set to Reposado." buttons {"OK"} default button 1
end if
