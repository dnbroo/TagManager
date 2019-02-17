             ________________________________________________
            /                                                \
           |    _________________________________________     |
           |   |                                         |    |
           |   |  C:\> TagManager.ahk_                   |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |                                         |    |
           |   |_________________________________________|    |
           |                                                  |
            \_________________________________________________/
                   \___________________________________/
                ___________________________________________
             _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
          _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
       _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
    _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
 _-'.-.-.-.-.-. .---.-. .-------------------------. .-.---. .---.-.-.-.`-_
:-------------------------------------------------------------------------:
`---._.-------------------------------------------------------------._.---'

================================== Tag Manager ===========================

This program is meant to AID in managing tags. 
This will not resolve everything. 
However we will be able to skip the tediousness of these forms.

Download AutoHotKey here: https://www.autohotkey.com/download/

Use AutoHotKeyA32. To compile into an EXE use the ahk2exe compiler.

---------------------------------- How to use -----------------------------

Have this program selected and running on top of your current tag. (the window must be maximized for this to work.)
	
	- For GSOB or GSCC: 
	
		- Creating a tag:
				If you are creating a tag, you will first open the tag and input the serial number and hit next. 
			Then open this program and have the program running on top of the open tag window. (Browser must be 
			full screen for this to work) From there you will then go to "Select an action?" and choose create 
			to open a tag, close a tag, or both. 
			Once you have selected these then click GSOB or GSCC to start the script.
			This will automatically create an in store tag with: 
			
				"Device works as expected. -%your initials here%" 
				
			The condition will be "New".
			The items will be "All".
			If you select GSCC then you will also have to go to the "What is certified" drop down list and select
			an item to be certified. 


		-Closing a tag: 
				For closing a tag you have to open the work order that the tag is under. You will have to make
			sure that all workflow check boxes are unchecked. Then from here you can go to "Select an action?" 
			and go to "Close". Then choose GSOB or GSCC. 
			The tag will be closed under GSIS and the correct res code will be used.
			The comment box will be: 
			
				"Device works as expected. %res code here%. -%your initials here%".
				
			If you select GSCC then you will also have to go to the "What is certified" drop down list and select
			an item to be certified.


		-Both
				This will create and close a tag with the information provided in the "Creating a tag" section 
			and will then close a tag under the "Closing a tag" section. 
	
	
	- For GSDR
			You must first open the tag that you are working on.
		Un-check all workflow boxes (unless you have already filled them out.)
		Then go to the GSDR button and fill in your res codes. 
		Depending on the res code you use, it will automatically fill out a general desc in the comment box. 
		
			Look in the "Current support list for Res Codes" down below for more info. 
			
			If you would like to print the agent notes, leave the "Print agent notes?" check box ticked. 
		If you do not want to print the agent notes, un-tick the "Print agent notes?" check box. 
		Once you print start, the program will begin to close the tag using the res codes you have entered.
		A pop up box will appear before closing the tag to allow you to review the program and make changes.


	- Current support list for Res Codes: 
		- GSDI = Diagnostics passed.
		- GSCS = Device has been setup with a local account. All updates have been downloaded.
		- GSDB = Data has been backed up.
		- GSOS = Device has been scanned, cleaned, and all updates have been downloaded.
		- GSSW = Software has been installed.
		- GSPW = Password has been reset. 
		- GSSH = Shield has been installed onto the clients device.
 



------------------------------------ SUPPORT --------------------------------

This program only works on a 1920x1080 monitor.
The browser window must be maximized in order for this program to run correctly. 
Users must enter inititals before the program can start. 
There is extra space in the program so if you can come up with anything to be added, let me know.
Contact me for any questions or concerns.



------------------------------------ Disclaimer --------------------------
I am not responsible for what happens while this program is in use.
If at anytime something goes wrong and is irreversible, the person who operated the software
is at fault. 
