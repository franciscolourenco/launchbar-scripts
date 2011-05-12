--================================== Modify Here =========================================--

property dropboxID : 4700116 --> Replace this number with your dropbox ID

--================================== Modify Here =========================================--

--Usages:
--1. To share a file/folder, select it and send it to this action
--2. To share a screenshot select this action and press return
--3. To share a screenshot with a name, selecte this action, press space, enter a name and press return

on run
	try
		
		if application "Dropbox" is not running then launch application "Dropbox"
		set ifolder to {path to home folder as string, "Dropbox:Public:"} as string
		tell application "LaunchBar" to hide
		
		set {year:y, month:m, day:d, hours:h, minutes:m, seconds:s} to (current date)
		set theDate to (h & "h" & m & "m" & s & "s")
		
		set theformat to "png"
		set thename to "screenshot" & theDate & "." & theformat
		set the_file to ""
		set thecmd to my dupcheck(thename, ifolder, theformat, dropboxID, the_file)
		
		
	on error e
		tell me to activate
		display dialog e
	end try
end run

on open (the_file)
	try
		
		if application "Dropbox" is not running then launch application "Dropbox"
		set ifolder to {path to home folder as string, "Dropbox:Public:"} as string
		
		tell application "LaunchBar" to hide
		try
			set text item delimiters to ":"
			set thename to last text item of (the_file as text)
			set theformat to "file"
			
			if thename = "" then
				set thename to text item ((count of text items of (the_file as text)) - 1) of (the_file as text)
				set theformat to "folder"
				
			end if
			set suggest to "&suggest=" & thename
			set text item delimiters to ""
		on error
			set text item delimiters to ""
		end try
		
		
		set thecmd to my dupcheck(thename, ifolder, theformat, dropboxID, the_file)
		
		
	on error e
		tell me to activate
		display dialog e
	end try
	
	
end open

on handle_string(thetext)
	try
		
		
		if application "Dropbox" is not running then launch application "Dropbox"
		set ifolder to {path to home folder as string, "Dropbox:Public:"} as string
		
		tell application "LaunchBar" to hide
		
		set AppleScript's text item delimiters to ","
		set thename to first text item of thetext
		set theformat to false
		try
			set theformat to text 2 thru -1 of second text item of thetext
		end try
		if theformat is false then set theformat to "png"
		set AppleScript's text item delimiters to ""
		set thename to thename & "." & theformat as text
		set suggest to "&suggest=" & thename
		set the_file to ""
		set thecmd to my dupcheck(thename, ifolder, theformat, dropboxID, the_file)
		
	on error e
		tell me to activate
		display dialog e
	end try
end handle_string


-------------------------------------------------------------------
--Handlers
-------------------------------------------------------------------


on dupcheck(thename, ifolder, theformat, dropboxID, the_file)
	set thedupcheck to ifolder & thename
	if theformat = "folder" then
		set thedupcheck to thedupcheck & ".zip"
	end if
	tell me to activate
	
	tell application "Finder" to if not (exists (POSIX path of thedupcheck) as POSIX file) then
		--Changed Lines******************************************************	
		set thedecision to my processitem(thename, ifolder, theformat, dropboxID, the_file)
	else
		tell me to activate
		set thedisplay to display dialog "An item with the name \"" & thename & "\" already exists in the destination" buttons {"Cancel ", "Rename", "Replace"} default button "Replace"
		
		if button returned of thedisplay is "Replace" then
			my processreplace(thename, ifolder, theformat, dropboxID, the_file)
		else if button returned of thedisplay is "Rename" then
			my processrename(thename, ifolder, theformat, dropboxID, the_file)
		else
			return "Canceled"
			
		end if
	end if
end dupcheck

on processitem(thename, ifolder, theformat, dropboxID, the_file)
	growlRegister()
	if theformat = "file" then
		tell application "Finder" to copy file the_file to folder ifolder
		growlNotify("Uploading file ", thename)
		
	else if theformat = "folder" then
		do shell script "zip -r " & (POSIX path of ifolder) & thename & " " & (POSIX path of the_file) & ""
		set thename to thename & ".zip"
		growlNotify("Uploading file ", thename)
		
	else if theformat = "filerename" then
		set thecmd to "cp " & (POSIX path of the_file) & " " & (POSIX path of ifolder) & thename
		do shell script thecmd
		growlNotify("Uploading file ", thename)
	else
		set ifile to ifolder & thename
		set qifile to quoted form of (POSIX path of ifile)
		set thecmd to "screencapture -i -t " & theformat & " " & qifile
		do shell script thecmd
		growlNotify("Uploading screenshot ", thename)
		
	end if
	my processurl(thename, dropboxID)
	
	
end processitem

on processreplace(thename, ifolder, theformat, dropboxID, the_file)
	
	set ifile to ifolder & thename
	if theformat = "folder" then
		set ifile to ifile & ".zip"
	end if
	set qifile to quoted form of (POSIX path of ifile)
	do shell script "rm -r " & qifile
	set qifolder to quoted form of (POSIX path of ifolder)
	my processitem(thename, ifolder, theformat, dropboxID, the_file)
end processreplace

on processrename(thename, ifolder, theformat, dropboxID, the_file)
	repeat
		set AppleScript's text item delimiters to "."
		set theonlyname to text items 1 thru -2 of thename
		set thenameextension to last text item of thename
		set AppleScript's text item delimiters to ""
		tell me to activate
		set thename to text returned of (display dialog "Enter the new name: (This dialog box will reappear if an item with the new name you specified also exists in the destination folder)" default answer theonlyname)
		if theformat is not equal to "folder" then
			set thename to thename & "." & thenameextension
		end if
		set thenewcheck to ifolder & thename
		
		if theformat = "file" then set theformat to "filerename"
		
		tell application "Finder" to if not (exists (POSIX path of thenewcheck) as POSIX file) then
			my processitem(thename, ifolder, theformat, dropboxID, the_file)
			exit repeat
		end if
	end repeat
end processrename
on processurl(thename, dropboxID)
	try
		set AppleScript's text item delimiters to " "
		set thename to text items of thename
		set AppleScript's text item delimiters to ""
		set suggest to "&suggest=" & thename as string
		set wordcount to do shell script "echo " & quoted form of suggest & " | wc -c"
		set wordcount to do shell script "echo " & quoted form of wordcount & " | sed 's/^[    ]*//'"
		if wordcount > 25 then
			set suggest to ""
		end if
		set AppleScript's text item delimiters to "%20"
		set thename to thename as string
		set AppleScript's text item delimiters to ""
	end try
	set theurl to "http://dl.getdropbox.com/u/" & dropboxID & "/" & thename
	set curlCMD to "curl --stderr /dev/null \"http://tinyarro.ws/api-create.php?host=xn--cwg.ws" & suggest & "&utfpure=1&url=" & theurl & "\""
	set theurl to (do shell script curlCMD)
	set the clipboard to theurl
	tell application "LaunchBar"
		set selection as text to theurl
		activate
	end tell
end processurl



-- additional scripting for Growlnotification 
using terms from application "GrowlHelperApp"
	on growlRegister()
		tell application "GrowlHelperApp"
			register as application "Share with Dropbox" all notifications {"Alert"} default notifications {"Alert"} icon of application "Dropbox.app"
		end tell
	end growlRegister
	on growlNotify(grrTitle, grrDescription)
		tell application "GrowlHelperApp"
			notify with name "Alert" title grrTitle description grrDescription application name "Share with Dropbox"
		end tell
	end growlNotify
end using terms from
