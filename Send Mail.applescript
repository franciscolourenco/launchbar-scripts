
-- quickMail by @m.yellow


-- How to use?
-- 1) Select Emailadress
-- 2) Hit TAB
-- 3) Select Script
-- 4) Hit Return
-- 5) Enter Message
-- 6) Hit Return 
-- Thats it.

property newLine : (ASCII character 13) & (ASCII character 10)
property senderAddress : "YOUR_EMAIL_ADDRESS"
property fastAddressSelection : false

on run
	set the_address to my enter_address()
	
	if (the_address ≠ "") then
		set the_message to text returned of (display dialog "Message:" default answer "" with title "Mail to " & the_address)
		my send_mail(the_address, the_message)
	end if
end run

on open (the_file)
	set the_address to my enter_address()
	
	if (the_address ≠ "") then
		set the_message to text returned of (display dialog "Message:" default answer "" with title "Mail to " & the_address)
		set the_file to quoted form of POSIX path of the_file
		
		if (offset of ":" in the_message) > 0 then
			set the_subject to text 1 thru ((offset of ":" in the_message) - 1) of the_message
			set the_message to text ((offset of ":" in the_message) + 1) thru -1 of the_message
		else
			set the_subject to "Quick Mail"
		end if
		
		do shell script "( echo 'Subject:" & the_subject & newLine & newLine & the_message & "' ; uuencode " & the_file & " " & the_file & " ) | sendmail -r '" & senderAddress & "' " & the_address
		
		-- display dialog results
		my growlRegister()
		my growlNotify("Mail sent", the_address)
	end if
end open

on handle_string(the_address)
	tell me to activate
	set the_message to text returned of (display dialog "Message:" default answer "" with title "Mail to " & the_address)
	my send_mail(the_address, the_message)
end handle_string


on send_mail(the_address, the_message)
	if (offset of ":" in the_message) > 0 then
		set the_subject to text 1 thru ((offset of ":" in the_message) - 1) of the_message
		set the_message to text ((offset of ":" in the_message) + 1) thru -1 of the_message
	else
		set the_subject to "Quick Mail"
	end if
	
	do shell script "echo 'Subject:" & the_subject & newLine & the_message & "' | sendmail -r '" & senderAddress & "' " & the_address
	
	-- display dialog results
	my growlRegister()
	my growlNotify("Mail sent", the_address)
	
end send_mail

on enter_address()
	if (fastAddressSelection is true) then
		return text returned of (display dialog "Address:" default answer "" with title "Sent Mail To")
	else
		set liste to {}
		
		tell application "Address Book"
			repeat with this_person in every person
				set e_mail to ""
				set first_name to first name of this_person as string
				set last_name to last name of this_person as string
				
				repeat with the_mail in emails of this_person
					set e_mail to value of the_mail
					exit repeat
				end repeat
				
				if (e_mail ≠ "") then
					if company of this_person is true then
						set full_name to organization of this_person & " (" & e_mail & ")"
					else
						set full_name to last_name & " " & first_name & " (" & e_mail & ")"
					end if
					copy full_name to end of liste
				end if
			end repeat
		end tell
		
		set liste to my sort(liste)
		
		set chosenCode to (choose from list liste ¬
			with prompt "Send Mail To:" cancel button name "Abort" OK button name ¬
			"Send" with empty selection allowed without multiple selections allowed) as string
		
		if chosenCode is "false" then return ""
		tell application "Address Book" to quit
		
		return text ((offset of "(" in chosenCode) + 1) through ((offset of ")" in chosenCode) - 1) of chosenCode
	end if
end enter_address

on sort(the_list)
	set old_delims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to {ASCII character 10} -- always a linefeed
	set list_string to (the_list as string)
	set new_string to do shell script "echo " & quoted form of list_string & " | sort -f"
	set new_list to (paragraphs of new_string)
	set AppleScript's text item delimiters to old_delims
	return new_list
end sort

using terms from application "GrowlHelperApp"
	-- Register Growl
	on growlRegister()
		tell application "GrowlHelperApp"
			register as application "QuickMail" all notifications {"Alert"} default notifications {"Alert"} icon of application "Gmail.app"
		end tell
	end growlRegister
	
	-- Notify using Growl
	-- Example: growlNotify("This is an Alert","This is a test of the Growl Alert System")
	on growlNotify(grrTitle, grrDescription)
		tell application "GrowlHelperApp"
			notify with name "Alert" title grrTitle description grrDescription application name "QuickMail"
		end tell
	end growlNotify
end using terms from
