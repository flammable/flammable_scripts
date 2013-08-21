if application "iPhoto" is running then
	tell application "iPhoto" to quit
end if

if application "Firefox" is running then
	tell application "Firefox" to quit
end if

if application "Mail" is running then
	tell application "Mail" to quit
end if

delay 5

do shell script "cd ~/Pictures/iPhoto\\ Library/; for dbase in *.db; do sqlite3 $dbase \"vacuum;\"; done"

do shell script "cd ~/Library/Application\\ Support/Firefox/Profiles/; for f in */*.sqlite; do sqlite3 $f 'VACUUM;'; done"

do shell script "sqlite3 ~/Library/Mail/Envelope\\ Index vacuum"

do shell script "sqlite3 ~/Library/Mail/V2/MailData/Envelope\\ Index vacuum"