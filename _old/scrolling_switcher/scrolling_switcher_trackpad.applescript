set question to display dialog "Change scrolling direction?" buttons {"Yes", "No"} default button 2
set answer to button returned of question

if answer is equal to "Yes" then
	try
		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.trackpad"
		end tell

		tell application "System Events"
			tell process "System Preferences"
				click radio button "Scroll & Zoom" of tab group 1 of window "Trackpad"
				click checkbox 1 of tab group 1 of window "Trackpad"
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
