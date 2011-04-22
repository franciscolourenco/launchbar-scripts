--found @ https://gist.github.com/249607

set theIP to do shell script "curl -sf http://checkip.dyndns.org/|cut -d ':' -f 2|cut -d '<' -f1|sed -e 's/ //g'"
tell application "LaunchBar"
	display in large type theIP with title "External IP Address:"
end tell
return theIP