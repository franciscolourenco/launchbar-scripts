--  This script was put together with the help of the following sources: 
--  http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/ by Coda Hale 
--  http://i.grahamenglish.net/540/iquicktwitter-my-quicksilver-twitter-ichat-growl-hack/ by Graham English 
--  http://www.leancrew.com/all-this/2009/02/url-shortening-scripts-fixed-i-think/ by @drdrang (fix for &ampersand issues) 
--  put together and adapted by @ptujec to work with LaunchBar 
--  minor changes to convert urls to tiny versions by @ctwise (http://tedwise.com)
----------------------------------------------------------------------- 


-- take string from LaunchBar 
on handle_string(tweet)
	-- shorten urls
	
	-- do wordcount 
	set wordcount to do shell script "echo " & quoted form of tweet & " | wc -c"
	set wordcount to do shell script "echo " & quoted form of wordcount & " | sed 's/^[    ]*//'"
	
	if wordcount as integer > 140 then
		
		set tweet to replace_http(tweet)
		set wordcount to do shell script "echo " & quoted form of tweet & " | wc -c"
		set wordcount to do shell script "echo " & quoted form of wordcount & " | sed 's/^[    ]*//'"
		
		if wordcount as integer > 140 then
			-- notify when tweet contains more than 140 characters 
			my growlRegister()
			growlNotify("Tweet too long", "(" & wordcount & ") characters")
			return nothing
		end if
	end if
	
	--do tweetescape 
	set tweet_new to tweetescape(tweet)
	
	-- take logininformation from keychain 
	tell application "Keychain Scripting"
		set twitter_key to first Internet key of current keychain whose name is "twitter.com"
		set twitter_login to quoted form of (account of twitter_key & ":" & password of twitter_key)
	end tell
	
	my growlRegister()
	-- update twitter 
	try
		set twitter_status to quoted form of ("source=launchbarat&status=" & tweet_new)
		set results to do shell script "curl --user " & twitter_login & " --data-binary " & twitter_status & " http://twitter.com/statuses/update.json"
		
		-- display dialog results 
		-- you can change "Tweet" into a diffent text e.g. "Zwitscher" 
		growlNotify("Tweet sent", tweet)
	on error
		-- Display error message
		growlNotify("Error Tweeting.", "You have fucked up, try again.")
	end try
end handle_string

-- fix for &ampersand issues (by @drdrang) 
on tweetescape(tweet)
	set cmd to "
from urllib import quote
print quote(\"\"\"" & tweet & "\"\"\", \"/:\")
"
	return (do shell script "python -c " & (quoted form of cmd))
end tweetescape

-- additional scripting for Growlnotification 
using terms from application "GrowlHelperApp"
	on growlRegister()
		tell application "GrowlHelperApp"
			register as application "Tweet" all notifications {"Alert"} default notifications {"Alert"} icon of application "Launchbar.app"
		end tell
	end growlRegister
	on growlNotify(grrTitle, grrDescription)
		tell application "GrowlHelperApp"
			notify with name "Alert" title grrTitle description grrDescription application name "Tweet" icon of file "~/Library/Application Support/LaunchBar/Actions/Tweet.scpt"
		end tell
	end growlNotify
end using terms from

-- This uses the built in splitting in AppleScript.
-- Most of the code just restores the delimiters.
on split(theText, splitText)
	set tid to AppleScript's text item delimiters
	set AppleScript's text item delimiters to splitText
	set theTextItems to text items of theText
	set AppleScript's text item delimiters to tid
	return theTextItems
end split

-- I tried the opposite of the split implementation but for some 
-- reason it doesn't work reliably
on join(theList, joinText)
	set result to ""
	repeat with theToken in theList
		if length of result = 0 then
			set result to theToken
		else
			set result to result & joinText & theToken
		end if
	end repeat
	return result
end join

-- Send the url to tiny url for shortening
on shorten_url(theURL)
	set theURL to tweetescape(theURL)
	
	set curlCMD to ¬
		"curl --stderr /dev/null \"http://u.nu/unu-api-simple?url=" & theURL & "\""
	
	set results to do shell script curlCMD
	return results
end shorten_url

-- Find everything that looks like a URL and shorten it
-- The number 25 is the length of a tiny url, no point in
-- shortening a url if it's already below that.
on replace_http(theText)
	set tokens to split(theText, " ")
	set output to {}
	repeat with theToken in tokens
		if (theToken starts with "http://") and length of theToken > 17 then
			set the end of output to shorten_url(theToken)
		else if (theToken starts with "www.") and length of theToken > 17 then
			set the end of output to shorten_url(theToken)
		else
			set the end of output to theToken
		end if
	end repeat
	return join(output, " ")
end replace_http
