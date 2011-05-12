-- LaunchBar2Pastie
-- Suggestions and comments: http://twitter.com/cometbus

-- Script that will take the current clipboard, send it to pastie.org, and return the url
-- Notifications via growl, and an option to preview the paste before it is sent

-- `curl` command discovered at http://codesofa.com/blog/archive/2009/01/08/use-pastieorg-with-launchbar.html
-- but it was broken, and would not accept much input, so I started over.  In the intest of full-disclosure, I wanted to 
-- give credit as it was a source of start.  In the end, I did not use any of the code from that page.

-- [01/22/2010 08:51:29 PM]	
--	Added support for growl
--	Changed hard coded name of "pastie" to growl_app_name, look for growl_app_name in growlRegister() function 
--	Defined growl_app_name as a global, which will allow it to scope into the two sub functions for growl.
--		This is an old function I wrote for a LunachBar to a tr.im url script I made a while back
--	Now returning false if there is trouble registering with growl, posting to pastie.org etc
--	Show a small growl window with the url to pastie.org in it, not sure what happens if growl is not installed, someone tell me please?
--	Added in try/catch/on error blocks, with return [true|false], I do not want accidental pastie.org's that the user does not know about

-- [01/23/2010 06:01:38 AM]	
--	Added in display dialog that shows the first 10 lines of what you are posting, messsy shell code to limit the amount of text in display dialog
--	set a carriage return variable cause the code was looking gross ( eff you applescript )
--	There is a big mess of passing the clipboard to `tr` to convert to unix line endings, which seem to matter
--		and is also needed to fold it's width and then get the 10 lines.  This is because 
--		display dialog is not that flexible, and can push the buttons off screen
--	Logging pastie.org urls to a .log file, format is url<tab>date at ~/Library/Logs/LaunchBar2Pastie.log
-- 	Cleaned up all display dialogs, added titles and buttons and default buttons
-- 	Fixed a bug where the clipboard was getting sent to pastie as just the preview clipboard, see original_clipboard

-- [02/24/2010 01:39:13 AM]
-- When saving the data to tmp, save it in a directory of their username, so this does not collide with multi-user systems
-- Appear to work, I think I am going to call it a night.
-- Fixed a bug where if line endings were mac, pastie.org would show the data wrong.
-- 	[1] this is now done in two locations in the code, either make a fucntion, or do it once and carry it in a varable.

-- TODO [01/22/2010 09:54:14 PM]	
--	LaunchBar can instand send a file anywhere, which means it could read that file, and pastie.org it or also just hit 
--		space and paste in some code as well.  Not sure the limit of the small LaunchBar input field
--		http://www.obdev.at/resources/launchbar/help/RunningAppleScripts.html
-- Clean up /tmp when done.  This is debatable if needed, since /tmp is cleaned on reboot anyway
-- Fix the line endings code to be cleaner, see [1]

-- Define the name that will be listed in growl
set growl_app_name to "Pasted"
global growl_app_name -- This is shared in functions

-- This is what you call redic and ritarded
set carriage_rtn to "
"

-- All the logic for regisering with growl is in the function, run it, and it will know to avoid repeatedly re-registering
try
	-- I am not sure there is anything in growlRegister() to kick the `try` into an error, but it can't hurt to fall back onto AppleScript error internals
	growlRegister() -- Register with growl, or exit past if the .growlTicket is discovered
on error
	display dialog "There was an error talking to growl, grrrowl. (No data posted to pastie.org)" with title "Growl Error" with icon 0 buttons {"rawr!!!"} default button 1
	return false -- halts from sending to pastie.org
end try

-- Show the user the first n lines of the pasteboard, allow them to back out if they have something
-- secret on the clipboard they do not want to go to pastie.org
try
	set original_clipboard to the clipboard
	set x to the clipboard
	set x to do shell script "pbpaste | tr '\\r' '\\n' | fold -s -w 50 | head -n 10 | pbcopy" -- yes, this is needed, fixed line endings, and stuffs it all back onto the clipboard
	set x to do shell script "pbpaste | head -n 10"
	set intro_dialog_copy to "Here are the first 10 lines of the text your are abou to send to pastie.org."
	set full_message to intro_dialog_copy & carriage_rtn & carriage_rtn & x
	set the clipboard to original_clipboard
	
	--display dialog of full_message with title "Text about to be sent to pasite.org" buttons {"Cancel", "Send to pastie.org"} default button 2
	--on error
	--	display dialog "You cancelled the pastie.org operation. (No data posted to pastie.org)" with title "pastie.org cancelled" with icon 2 buttons {"OK"} default button 1
	--return false -- halts from sending to pastie.org
end try

-- ***** Start the work of sending the current clipboard to pastie.org ***** --
-- Make a directory in /tmp of the user's short username so this script can be used by multi-user systems
try
	set short_username to (short user name of (system info)) -- Get the current users short username
	do shell script ("/bin/mkdir -p /tmp/" & short_username)
	
	-- Put the entire pasteboard into /tmp/short_username/pastie.txt
	-- Fix the line endings, or they can be mac, which pastie.org chokes on
	do shell script ("/usr/bin/pbpaste | tr '\\r' '\\n' > /tmp/" & short_username & "/pastie.txt")
on error errText number errNum
	display dialog "Error saving to tmp (" & errText & ")" with title "pastie.org Error" with icon 0 buttons {"Shucks"} default button 1
	return false -- halts from sending to pastie.org
end try

-- Set to variable the big mess of curl code that will post to pastie.org, reading in from a file, as 
-- ust shoving in a clipboard can have characters like double and single quote, or greater then and less than
-- that will toss it's lunch.
-- `curl` command returns the pastie.org variable "url_effective", which is the url of our pasted data
try
	set pastie_shell_script to "curl http://pastie.caboo.se/pastes/create -H 'Expect:' -F 'paste[parser]=plaintext' -F 'paste[body]=</tmp/" & short_username & "/pastie.txt' -F 'paste[authorization]=burger' -s -L -o /dev/null -w '%{url_effective}'"
		set responseURL to (do shell script pastie_shell_script)
	--	set the clipboard to responseURL -- Put the pastie.org url into the clipboard, nukes existing clipboard
	--	growlNotify(responseURL) -- Show the user that the url is in the clipboard
	--	tell application "LaunchBar"
	--		set selection to responseURL
	--	end tell
	--	-- Log the url to a file
	--	set shell_date to do shell script "date"
	--	set log_cmd to "echo " & responseURL & "	" & shell_date & " >> ~/Library/Logs/" & growl_app_name & ".log"
	--	do shell script log_cmd
on error
	display dialog "Posting to pastie.org failed." with title "pastie.org Error" with icon 0 buttons {"Shucks"} default button 1
	return false -- halts from sending to pastie.org
end try

-- functions and support for growl communication

-- Register this script with growl so notifications can be configured
-- Also defines a helper function to easily allow definging the actual growl text copy
-- Sets the icon in growl to that of Launchbar
using terms from application "GrowlHelperApp"
	on growlRegister()
		-- test to see if growl has already been registered
		set growl_registered to "no"
		set app_support_path to path to application support from user domain
		set growl_ticket_path to POSIX path of app_support_path & "Growl/Tickets/" & growl_app_name & ".growlTicket"
		
		tell application "Finder"
			if exists growl_ticket_path as POSIX file then
				set growl_registered to "yes"
			end if
		end tell
		
		-- debugging, toggle on and off as needed
		--display dialog "growl registration status: " & growl_registered
		
		-- Only if this script is not registered, do we need to run the below registration, which is slow, but only on first run
		if growl_registered = "no" then
			tell application "GrowlHelperApp"
				register as application growl_app_name all notifications {"Alert"} default notifications {"Alert"} icon of application "Launchbar.app"
			end tell
		end if
	end growlRegister
	
	-- Quick notifier for Growl, takes a string, and shoots it to growls nifty little window
	on growlNotify(astring)
		set growl_description to astring
		
		tell application "GrowlHelperApp"
			notify with name "Alert" title growl_app_name description growl_description application name growl_app_name icon of file "~/Library/Application Support/LaunchBar/Actions/Pastie.scpt"
		end tell
	end growlNotify
end using terms from

-- All done, have fun, going to the store, making chili, which you really should ask for the recipe, it is *that* good
