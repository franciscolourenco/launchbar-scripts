--Check if GUI Scripting is Enabled
tell application "System Events"
	if not UI elements enabled then
		set UI elements enabled to true
	end if
end tell

--Enable/Disable "Use all F1, F2, etc. keys as standard function keys" option in Keyboard & Mouse Preference pane and close System Preferences
tell application "System Events"
	tell application "System Preferences"
		reveal anchor "keyboardTab" of pane "com.apple.preference.keyboard"
	end tell
	click checkbox 1 of tab group 1 of window 1 of application process "System Preferences"
end tell
if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if