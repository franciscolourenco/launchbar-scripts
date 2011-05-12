growlRegister()
growlNotify("Diskutil", "Mounting external drive...")
set result to do shell script "diskutil mountDisk disk2"

growlNotify("Diskutil", result)

-- additional scripting for Growlnotification 
using terms from application "GrowlHelperApp"
	on growlRegister()
		tell application "GrowlHelperApp"
			register as application "Diskutil" all notifications {"Alert"} default notifications {"Alert"} icon of application "Disk Utility.app"
		end tell
	end growlRegister
	on growlNotify(grrTitle, grrDescription)
		tell application "GrowlHelperApp"
			notify with name "Alert" title grrTitle description grrDescription application name "Diskutil"
		end tell
	end growlNotify
end using terms from



