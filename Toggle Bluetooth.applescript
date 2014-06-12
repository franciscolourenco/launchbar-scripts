tell application "System Preferences"
    -- activate
    set the current pane to pane id "com.apple.preferences.Bluetooth"
    tell application "System Events" to tell process "System Preferences"
        click button 6 of window "Bluetooth"
    end tell
    quit
end tell