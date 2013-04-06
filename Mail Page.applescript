on run
	my sharepage("")
end run


on sharepage(recipient)
	tell application "Google Chrome"
		set theURL to URL of active tab of first window
		set theTitle to title of active tab of first window
		set the clipboard to theTitle & return & theURL as string
	end tell
	
	
	tell application "Sparrow"
		activate
		set theMessage to make new outgoing message with properties {subject:theTitle, content:theURL}
		tell theMessage
			--make new to recipient at end of to recipients with properties {address:recipient}
			--		make new to recipient at end of cc recipients with properties {name:"Sonia Jones", address:"sonia@gmail.com"}
			compose
		end tell
		activate
	end tell
end sharepage