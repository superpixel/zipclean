on run
	set choosen_itmes to choose file with multiple selections allowed
	process_items(choosen_itmes)
end run

on open choosen_itmes
	process_items(choosen_itmes)
end open

on process_items(choosen_itmes)
	
	repeat with this_item in choosen_itmes
		
		-- check file extension
		tell application id "com.apple.Finder" to set item_extension to name extension of this_item
		tell application id "com.apple.Finder" to set item_name to name of this_item
		
		if item_extension is not equal to "zip" then
			display alert "The file" & space & "\"" & item_name & "\"" & space & "is not a ZIP archive and was not processed." buttons {"OK"} default button "OK" as informational
			return
		else
			-- zip -d filename.zip __MACOSX/\
			try
				do shell script "/usr/bin/zip -d " & quoted form of (POSIX path of this_item) & " __MACOSX/\\*"
			on error err_msg number err_num
				if err_num is not equal to 12 then -- error 12 is: nothing to do, no '__MACOSX' found in zip
					beep
					display dialog err_msg buttons {"OK"} default button "OK"
				end if
			end try
			-- zip -d filename.zip \*/.DS_Store
			try
				do shell script "/usr/bin/zip -d " & quoted form of (POSIX path of this_item) & " \\*/.DS_Store"
			on error err_msg number err_num
				if err_num is not equal to 12 then -- error 12 is: nothing to do, no '.DS_Store' found in zip
					beep
					display dialog err_msg buttons {"OK"} default button "OK"
				end if
			end try
		end if
		
	end repeat
	
end process_items
