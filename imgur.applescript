on run
	tell application "LaunchBar" to hide
	set theformat to "png"
	--set {year:y, month:m, day:d, hours:h, minutes:m, seconds:s} to (current date)
	--set theDate to (h & "h" & m & "m" & s & "s")
	--set thename to "/screenshot" & theDate & "." & theformat
	set ifile to do shell script "echo $TMPDIR" & "/imgur" & "." & theformat
	--set qifile to quoted form of (POSIX path of ifile)
	set thecmd to "screencapture -i -t " & theformat & " " & ifile
	do shell script thecmd
	set link to my upload(ifile)
	my finalize(link)
	
end run

on open (input)
	tell application "LaunchBar" to hide
	set thelist to {}
	-- convert file paths to posix
	set imageList to {}
	repeat with i from 1 to (count input)
		set end of imageList to POSIX path of (item i of input as alias)
	end repeat
	repeat with i from 1 to (count imageList)
		set link to my upload(item i of imageList)
		set end of thelist to (link & "
") as text
	end repeat
	
	if (count thelist) is 1 then
		my finalize(link)
	else
		my finalize(thelist as text)
	end if
	
end open

on upload(image)
	set apiKey to "26ff5c40cbedf50e7f81124ab473c1cc"
	set curlCommand to "curl -F \"key=" & apiKey & "\" -F \"image=@" & image & "\" http://api.imgur.com/2/upload"
	set answer to do shell script curlCommand
	set atid to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "<imgur_page>"
	set link to text item 2 of answer
	set AppleScript's text item delimiters to "<"
	set link to text item 1 of link
	set AppleScript's text item delimiters to "/"
	set imageid to last text item of link
	set AppleScript's text item delimiters to "."
	set extension to last text item of image
	set link to "http://i.imgur.com/" & imageid & "." & extension
	set AppleScript's text item delimiters to atid
	--set browser to my default_Browser()
	--tell application browser to open location link
	return link
end upload

on finalize(theresult)
	set the clipboard to theresult as text
	tell application "LaunchBar"
		set selection as text to theresult
		activate
	end tell
end finalize

on default_Browser()
	tell (system attribute "sysv") to set MacOS_version to it mod 4096 div 16
	if MacOS_version is 5 then
		set {a1, a2} to {1, 2}
	else
		set {a1, a2} to {2, 1}
	end if
	set pListpath to (path to preferences as Unicode text) & "com.apple.LaunchServices.plist"
	tell application "System Events"
		repeat with i in property list items of property list item 1 of contents of property list file pListpath
			if value of property list item a2 of i is "http" then
				set longName to value of property list item a1 of i
				set AppleScript's text item delimiters to "."
				set shortName to last text item of longName
				set AppleScript's text item delimiters to ""
				return shortName
			end if
		end repeat
		return "Safari"
	end tell
end default_Browser