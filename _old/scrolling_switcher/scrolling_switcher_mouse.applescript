set question to display dialog "Change scrolling direction?" buttons {"Yes", "No"} default button 2
set answer to button returned of question

if answer is equal to "Yes" then
	try
		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.mouse"
		end tell

		tell application "System Events"
			tell process "System Preferences"
				click checkbox 1 of window "Mouse"
			end tell
		end tell

		tell application "System Preferences"
			quit
		end tell
	end try
	display dialog "Done!" buttons {"OK"} default button 1
end if

if answer is equal to "No" then
	display dialog "Alrighty." buttons {"OK"} default button 1
end if
