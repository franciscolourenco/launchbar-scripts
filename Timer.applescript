-------------------------
-- Display Alert 1.2 for LaunchBar 5
-- this script displays a large typed message after a given delay time
--
-- originally written by ludwigschubert http://forums.obdev.at/viewtopic.php?f=24&t=615
-- modified by Zettt (http://www.zettt.de) at 2009-05-04
-- thanks to ptujec for providing additional information about changed AppleScript terms
--
-- Usage: Call LaunchBar, Hit Space, Input your message and provied your delay time at the end in "3s", "1m" or "2d" (without quotes) 
-- Example: "This is an example message 2s" (without quotes)
--
-- 05/11/09 really minor change by ptujec - just added sound
-------------------------


on handle_string(message)
	
	tell application "LaunchBar"
		
		-- set time ... it's the last word of your string e.g. 'test 3' 
		set delay_time to last word of message
		set future_message to message as text
		
		-- strip away last word of message
		
		set delay_time_length to length of delay_time
		set message_length to length of future_message
		
		if delay_time_length = message_length then
			set future_message to "Ping"
		else
			set future_message to (characters 1 thru (message_length - delay_time_length) of future_message) as string
		end if
		
		-- display it in large type
		display in large type future_message after delay delay_time with sound "Glass"
		
		
		-- display growl message
		delay delay_time
		my growlRegister()
		my growlNotify("Timer", message)
		
	end tell
	
end handle_string



-- additional scripting for Growlnotification
using terms from application "Growl"
	on growlRegister()
		tell application "Growl"
			register as application "LaunchBarTimer" all notifications {"Message from the past"} default notifications {"Message from the past"} icon of application "LaunchBar.app"
		end tell
	end growlRegister
	on growlNotify(grrTitle, grrDescription)
		tell application "Growl"
			notify with name "Message from the past" title grrTitle description grrDescription application name "LaunchBarTimer" icon of file "~/Library/Application Support/LaunchBar/Actions/Timer.scpt"
		end tell
	end growlNotify
end using terms from

