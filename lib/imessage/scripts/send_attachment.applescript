on run argv
	set toAddress to first item of argv
	set theFilePath to second item of argv
	set theFile to POSIX file theFilePath
	
	tell application "System Events"
		if exists file theFilePath then
			tell application "Messages"
				send theFile to buddy toAddress of (service 1 whose service type is iMessage)
			end tell
		else
			error "File not exist."
		end if
	end tell
end run
