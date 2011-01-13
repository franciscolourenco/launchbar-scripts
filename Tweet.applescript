
--  This script was put together with the help of the following sources:
--  http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/ by Coda Hale
--  http://i.grahamenglish.net/540/iquicktwitter-my-quicksilver-twitter-ichat-growl-hack/ by Graham English
--  http://www.leancrew.com/all-this/2009/02/url-shortening-scripts-fixed-i-think/ by @drdrang (fix for &ampersand issues)
--  put together and adapted by @ptujec to work with LaunchBar
--  http://github.com/kuroir/Launchbar-Twitter-Tools for supertweet fix

-----------------------------------------------------------------------


-- take string from LaunchBar
on handle_string(tweet)
   
   -- do wordcount
   if length of tweet > 140 then
      my growlRegister()
      growlNotify("Tweet too long", ("(" & length of tweet as text) & ") characters")
      return nothing
   end if
   
   --do tweetescape
   set tweet_new to tweetescape(tweet)
   
   -- take logininformation from keychain
   -- You need a http://www.supertweet.net/ account, which will work as a proxy to oAuth. 
   -- This will allow us to use this tool in a safer manner.
   
   -- >>>>>>>>>>>>>>>>>>>>>>>EDIT HERE !!!<<<<<<<<<<<<<<<<<<<<<<<<<
   set login to "YOURNAME"
   set secret_key to "YOURKEY"
   set twitter_login to login & ":" & secret_key
   -- >>>>>>>>>>>>>>>>>>>>>>>EDIT HERE !!!<<<<<<<<<<<<<<<<<<<<<<<<<
   
   
   -- update twitter
   set twitter_status to quoted form of ("status=" & tweet_new)
   set results to do shell script "curl -u" & twitter_login & " -d" & twitter_status & " http://api.supertweet.net/1/statuses/update.xml"
   
   -- display dialog results
   my growlRegister()
   -- you can change "Tweet" into a diffent text e.g. "Zwitscher"
   growlNotify("Tweet", tweet)
   
end handle_string

-- fix for &ampersand issues (by @drdrang)
on tweetescape(tweet)
   set cmd to "\nfrom urllib import quote\nprint quote(\"\"\"" & tweet & "\"\"\", \"/:\")\n"
   return (do shell script "python -c " & (quoted form of cmd))
end tweetescape

-- additional scripting for Growlnotificati
using terms from application "GrowlHelperApp"
   on growlRegister()
      tell application "GrowlHelperApp"
         register as application "Tweet" all notifications {"Alert"} default notifications {"Alert"} icon of application "Launchbar.app"
      end tell
   end growlRegister
   on growlNotify(grrTitle, grrDescription)
      tell application "GrowlHelperApp"
         notify with name "Alert" title grrTitle description grrDescription application name "Tweet"
      end tell
   end growlNotify
end using terms from