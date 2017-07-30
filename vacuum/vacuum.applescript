if application "Firefox" is running then
	tell application "Firefox" to quit
end if

if application "Mail" is running then
	tell application "Mail" to quit
end if

delay 5

do shell script "cd ~/Library/Application\\ Support/Firefox/Profiles/; for f in */*.sqlite; do sqlite3 $f 'VACUUM;'; done"

do shell script "sqlite3 ~/Library/Mail/V4/MailData/Envelope\\ Index vacuum"