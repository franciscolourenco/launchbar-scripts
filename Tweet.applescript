
--  This script was put together with the help of the following sources:
--  http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/ by Coda Hale
--  http://i.grahamenglish.net/540/iquicktwitter-my-quicksilver-twitter-ichat-growl-hack/ by Graham English
--  http://www.leancrew.com/all-this/2009/02/url-shortening-scripts-fixed-i-think/ by @drdrang (fix for &ampersand issues)
--  put together and adapted by @ptujec to work with LaunchBar
--  http://github.com/kuroir/Launchbar-Twitter-Tools for supertweet fix

-----------------------------------------------------------------------

-- take string from LaunchBar
on handle_string(tweet)
	try
		
		--replace long url with short ones
		set tweet to replace_http(tweet)
		
		-- do wordcount
		if length of tweet > 140 then
			my growlRegister()
			growlNotify("Tweet too long", ("(" & length of tweet as text) & ") characters")
			return nothing
		end if
		
		--do tweetescape
		set tweet_new to tweetescape(tweet)
		
		-- You need a http://www.supertweet.net/ account, which will work as a proxy to oAuth. 
		-- take logininformation from keychain 
		tell application "Keychain Scripting"
			set twitter_key to first Internet key of current keychain whose name is "www.supertweet.net"
			set twitter_login to quoted form of (account of twitter_key & ":" & password of twitter_key)
		end tell
		
		
		-- update twitter
		set twitter_status to quoted form of ("status=" & tweet_new)
		set results to do shell script "curl -u" & twitter_login & " -d" & twitter_status & " http://api.supertweet.net/1/statuses/update.xml"
		
		-- display dialog results
		my growlRegister()
		-- you can change "Tweet" into a diffent text e.g. "Zwitscher"
		growlNotify("Tweet", tweet)
	on error e
		tell me to activate
		display dialog e
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

--replace long url with short url
on replace_http(theText)
	try
		set tokens to split(theText, " ")
		set output to {}
		
		repeat with theToken in tokens
			if (theToken starts with "http://" or theToken starts with "https://") and length of theToken > 19 then
				set the end of output to shorten_url(theToken)
			else if (theToken starts with "www.") and length of theToken > 12 then
				set the end of output to shorten_url(theToken)
			else
				
				set the end of output to theToken
			end if
		end repeat
		
		return join(output, " ")
	on error e
		tell me to activate
		display dialog e
	end try
end replace_http

--short an URL
on shorten_url(theURL)
	try
		set theURL to tweetescape(theURL)
		set curlCMD to "curl -s -d \"&url=" & theURL & "\" http://goo.gl/api/url | egrep -o \"http://goo.gl/[^\\\"]*\""
		set results to do shell script curlCMD
		return results
	on error e
		tell me to activate
		display dialog e
	end try
end shorten_url

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

-- additional scripting for Growlnotificati
using terms from application "GrowlHelperApp"
	on growlRegister()
		set appIcon to "Launchbar.app"
		tell application "Finder"
			if exists POSIX file "/Applications/Twitter.app" then
				set appIcon to "Twitter.app"
			end if
		end tell
		tell application "GrowlHelperApp"
			register as application "Tweet" all notifications {"Alert"} default notifications {"Alert"} icon of application appIcon
		end tell
	end growlRegister
	on growlNotify(grrTitle, grrDescription)
		tell application "GrowlHelperApp"
			notify with name "Alert" title grrTitle description grrDescription application name "Tweet"
		end tell
	end growlNotify
end using terms from
te