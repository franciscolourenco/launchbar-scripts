-- This script toggles between my logitech bluetooth audio receiver and
-- the standard output. It requires a command line utility which can
-- be found at http://github.com/deweller/switchaudio-osx .

set currentDevice to do shell script "$HOME/Dropbox/bin/SwitchAudioSource -c"

if currentDevice is equal to "Built-in Output" then
	set outputDevice to "(D0)Logitech Adapter Stereo"
else
	set outputDevice to "Built-in Output"
end if

do shell script "$HOME/Dropbox/bin/SwitchAudioSource -s '" & outputDevice & "'"
