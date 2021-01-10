; =======================================================================================
; Name ..........: TagManager V.8
; Description ...: This script will automatically close tags. The user will choose which type of tag is being closed and enter the apropriate res code. 
; AHK Version ...: AHK_A 1.1.30.1 (Unicode 32-bit) - Dec 26, 2018
; Platform ......: Windows 2000+
; Language ......: English (en-US)
; =======================================================================================

; Global ================================================================================
#SingleInstance, Force ; Allow only one running instance of script
#Persistent ; Keep script permanently running until terminated
#NoEnv ; Avoid checking empty variables to see if they are environment variables
;#Warn ; Enable warnings to assist with detecting common errors
;#NoTrayIcon ; Disable the tray icon of the script
SendMode, Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir, %A_ScriptDir% ; Change the working directory of the script
SetBatchLines, -1 ; Run script at maximum speed
OnExit, ExitSub ; Run a subroutine or function automatically when the script exits
; =======================================================================================

; Script ================================================================================
	;MsgBox, ,Disclaimer, This program is designed to AID in closing tags and is still a work in progress.`r`rThe creator is in no way responsible for the actions of this program.`r`rBy using this program you are accepting that you are responsible for what happens while this program is in use. 
	
	Return ; End automatic execution

; =======================================================================================


; MAIN GUI FUNCTIONS ====================================================================

ButtonGSOB: ;OPEN BOX ACTIONS

	if(init = ""){
		MsgBox, ,Initials, You have not typed any initials yet.
		Return
	}
	
	if(Action = "Select Action"){
		MsgBox, 4096,Warning,  You must select an action!
		Return
	}
		
	;if there are intitials and we have an action then we will go to action selector which will create/close/or both a tag
	Tar := "GSOB" 
	GoSub, Action_Selector
	Return
	
ButtonGSCC: ;CERTIFIED OPEN BOX ACTIONS
	if(Item = "Select Item" ){
		MsgBox, 4096,Warning,  You must select an item from the certified drop down menu.
		Return
	}
	
	if(Action = "Select Action"){
		MsgBox, ,Disclaimer, You must select an action!
		Return
	}
	
	if(Item = "Computer"){
		Tar := "GSCC"
		GoSub, Action_Selector
		Return
	}
	
	else if(Item = "TV"){
		Tar := "GSCT"
		GoSub, Action_Selector 
		Return
	}
	
	else if(Item = "Phone or Tablet"){
		Tar := "GSCP"
		GoSub, Action_Selector 
		Return
	}
	else
		return

ButtonGSDR: ;GSDR MENU FOR CLOSING SIMPLE TAGS

	;starts our fields out blank
	R1 := ""
	R2 := ""
	R3 := ""
	R4 := ""
	  
	;Creates 2nd gui for res code fields
	Gui, 2:+AlwaysOnTop -SysMenu
	Gui, 2:Add, Text, % " x" 10 " y" 10, Please choose your res codes:
	Gui, 2:Add, Edit, limit4 Uppercase x10 y40 w205 r1 vR1 gSubmit_All, %R1%
	Gui, 2:Add, Edit, limit4 Uppercase x10 y70 w205 r1 vR2 gSubmit_All,  %R2%
	Gui, 2:Add, Edit, limit4 Uppercase x10 y100 w205 r1 vR3 gSubmit_All,  %R3%
	Gui, 2:Add, Edit, limit4 Uppercase x10 y130 w205 r1 vR4 gSubmit_All, %R4%
	Gui, 2:Add, Button, % x10 y230 w200 h30 gReset, Reset
	Gui, 2:Add, Checkbox, Checked1 x100 y162 vNotes gSubmit_All, Print agent notes?
	Gui, 2:Add, Button, % " x" 116 " y" 260 " w" 100 " h" 30, Start
	Gui, 2:Add, Button, % " x" 10 " y" 260 " w" 100 " h" 30, Back
	Gui, 2:Show, % " w" 225 " h" 300, GSDR
	Return

ButtonClockIn:
	
	;starts variables blank
	user := ""
	pass := ""


	;Creates 3nd gui for clocking in
	Gui, 3:+AlwaysOnTop -SysMenu
	Gui, 3:Add, Text, % " x" 10 " y" 10, Enter your credentials here:
	Gui, 3:Add, Edit, limit8 x10 y40 w205 r1 vuser gSubmit_All, %user%
	Gui, 3:Add, Edit, limit20 Password x10 y70 w205 r1 vpass gSubmit_All,  %pass%
	Gui, 3:Add, Button, % " x" 116 " y" 260 " w" 100 " h" 30, &Start
	Gui, 3:Add, Button, % " x" 10 " y" 260 " w" 100 " h" 30, Back
	Gui, 3:Show, % " w" 225 " h" 300, Clock In
	Return

3ButtonReset:
	user :=""
	pass :=""

	GuiControl,,user,
	GuiControl,,pass,

	Return

3ButtonStart:
	Gui, 3:Hide
	Send, {LWin down}
	Send, r
	Send, {LWin up}
	Sleep, 100
	Send, iexplore.exe -private
	Send, {enter}
	Sleep, 5000
	MouseClick, Left, 275, 37, , 75 ;clicks search bar
	MouseClick, Left, 275, 37, , 75 ;clicks search bar
	Sleep, 100
	Send, mytlc.bestbuy.com
	Send, {Enter}
	Sleep, 6000
	MouseClick, Left, 941, 285, , 75 ;clicks on login box
	Send, %user%
	Send, `t
	Send, %pass%
	Send, {Enter}
	Sleep, 4000
	MouseClick, Left, 188, 218, , 75 ;clicks clock in
	Gui, 3:Destroy
	Return

3ButtonBack:
	Gui, 3:Destroy
	Return

ButtonClockOut:
	
	;starts variables blank
	user := ""
	pass := ""


	;Creates 4nd gui for clocking in
	Gui, 4:+AlwaysOnTop -SysMenu
	Gui, 4:Add, Text, % " x" 10 " y" 10, Enter your credentials here:
	Gui, 4:Add, Edit, limit8 x10 y40 w205 r1 vuser gSubmit_All, %user%
	Gui, 4:Add, Edit, limit20 Password x10 y70 w205 r1 vpass gSubmit_All,  %pass%
	Gui, 4:Add, Button, % " x" 116 " y" 260 " w" 100 " h" 30, &Start
	Gui, 4:Add, Button, % " x" 10 " y" 260 " w" 100 " h" 30, Back
	Gui, 4:Show, % " w" 225 " h" 300, Clock Out
	Return

4ButtonReset:
	user :=""
	pass :=""

	GuiControl,,user,
	GuiControl,,pass,

	Return

4ButtonStart:
	Gui, 3:Hide
	Send, {LWin down}
	Send, r
	Send, {LWin up}
	Sleep, 100
	Send, iexplore.exe -private
	Send, {enter}
	Sleep, 5000
	MouseClick, Left, 275, 37, , 75 ;clicks search bar
	MouseClick, Left, 275, 37, , 75 ;clicks search bar
	Sleep, 100
	Send, mytlc.bestbuy.com
	Send, {Enter}
	Sleep, 6000
	MouseClick, Left, 941, 285, , 75 ;clicks on login box
	Send, %user%
	Send, `t
	Send, %pass%
	Send, {Enter}
	Sleep, 4000
	MouseClick, Left, 519, 215, , 75 ;clicks clock out
	Gui, 3:Destroy
	Return

4ButtonBack:
	Gui, 4:Destroy
	Return

ButtonGetMousePos: ;GETS MOUSE POSITION (disabled on main gui)

	CoordMode, Mouse, Screen ;Sets Mouse to absolute screen coordinates
	Sleep, 3000
	MouseGetPos, xpos, ypos ;gets mouse coords
	MsgBox, The cursor is at X%xpos% Y%ypos%. ;outputs mouse coords
	Return

ButtonChangeInitials:

	InputBox, init, Initials, Please enter your initials., , 240, 130 ;gets the agents intials
	
	while(init = ""){
		InputBox, init, Initials, Please enter your initials., , 240, 130 ;gets the agents intials if they leave it blank
	}
	
	global init
	Return

ButtonReadMe:
	Run C:\Windows\Notepad.exe "README.txt"
	Return
	
ButtonTest:	
	MsgBox, %init%
	Return

ButtonExit:
	ExitApp
	Return

GuiEscape:
GuiClose:
Escape::ExitApp ;this is our emergey stop if something goes wrong
ExitSub:
	ExitApp ; Terminate the script unconditionally
	Return
; ========================================================================================


; GUI 2 BUTTONS ==========================================================================

2ButtonStart: ;STARTS OUR GSDR SECTION WITH SMART NOTES
	Gui, 2:Show, Hide
	CoordMode, Mouse, Screen ;Place Mouse at absolute screen coordinates
	MouseClick, Left, 1850, 975, , 25 ;quick repair
	Sleep, 7000
	MouseClick, Left, 1856, 253, , 25 ;makes sure we are in the so notes and status
	Sleep, 2000
	MouseClick, Left, 290, 314, , 75 ;drops down menu
	Sleep, 500
	MouseClick, Left, 290, 378, , 75 ;flips to complete
	MouseClick, Left, 290, 437, , 75 ;navigates to text box below
	Send, GSIS
	Send, `t
	Send, %R1% ;inputs first res code
	Send, `t
	
	;this loop will fill out our res codes and exit if less than 4 res codes
	Loop 1 {
		if(R2 != ""){
			Send, %R2%
			Send, `t
			if(R3 != ""){
				Send, %R3%
				Send, `t
				if(R4 != ""){
					Send, %R4%
					break
				}
				break
			}
			break
		}
	}
	Send, `t
	
	;This will start our "Smart notes" section. Here will be a list of common phrases that will be typed out based on what codes we use
	if( R1 = "GSDI" or R2 = "GSDI" or R3 = "GSDI" or R4 = "GSDI"){
		Send, Diagnostics passed.{Space}
		}
	if( R1 = "GSCS" or R2 = "GSCS" or R3 = "GSCS" or R4 = "GSCS"){
		Send, Device has been setup with a local account. All updates have been downloaded.{Space}
		}
	if( R1 = "GSDB" or R2 = "GSDB" or R3 = "GSDB" or R4 = "GSDB"){
		Send, Data has been backed up.{Space}
		}
	if( R1 = "GSOS" or R2 = "GSOS" or R3 = "GSOS" or R4 = "GSOS"){
		Send, Device has been scanned, cleaned, and all updates have been downloaded.{Space}
		}
	if( R1 = "GSSW" or R2 = "GSSW" or R3 = "GSSW" or R4 = "GSSW"){
		Send, Software has been installed.{Space}
		}
	if(R1 = "GSPW" or R2 = "GSPW" or R3 = "GSPW" or R4 = "GSPW"){
		Send, Password has been reset. {Space}
		}
	if(R1 = "GSSH" or R2 = "GSSH" or R3 = "GSSH" or R4 = "GSSH"){ 
		Send, Shield has been installed onto the clients device.{Space}
		}
		
	Send, -%init%
	MsgBox, , Attention, Did everything type out correctly? ;This lets us check if things were typed out correctly
		
	MouseClick, Left, 1850, 975, , 75 ;clicks save
	Sleep, 6000
	MouseClick, Left, 1850, 975, , 75 ;Confirms save
	
	;this prints the agent notes if the checkbox is ticked
	if(Notes = 1){
		Sleep, 6000
		MouseClick, Left, 1875, 226, , 75 ;navigates to check box below 
		Sleep, 20
		
		MouseClick, Left, 1873, 198, , 75 ;clicks print workflow icon
		Sleep, 4000
		MouseClick, Left, 1383, 1003, , 75 ;clicks print button
		Sleep, 2000
		SendInput {Enter}
		Sleep, 200
		MouseClick, Left, 1307, 1003, , 75 ;clicks ok button
		}

	
	Gui, 2:Destroy
	Return
	
2ButtonReset: ;CLEARS 2ND GUI FIELDS
	
	;This will reset the variables
	R1 := ""
	R2 := ""
	R3 := ""
	R4 := ""
	
	;This clears the edit fields
	GuiControl,,R1,
	GuiControl,,R2,
	GuiControl,,R3,
	GuiControl,,R4,
	Return

2ButtonBack: ;BRINGS US BACK TO MAIN GUI
	Gui, 2:Destroy
	Return


Submit_All: ;this submits the values into variables as soon as a change is made
	Gui, Submit, NoHide
	Return
		
Action_Selector: ;This will call the appropriate subs whether the user wants to create a tag, close a tag, or both
	if(Action = "Create"){
		GoSub, Create_Function
		Return
		}
		
	else if(Action = "Close"){
		Gosub, Close_Function
		Return
		}
	
	else if(Action = "Both"){
		GoSub, Create_Function
		
		Sleep, 10000
		MouseClick, Left, 1047, 157, , 25 ;This will copy the WO
		Sleep, 20
		MouseClick, Left, 1047, 157, , 25 ;This will copy the WO
		Sleep, 20
		MouseClick, Left, 1047, 157, , 25 ;This will copy the WO
		MouseClick, Left, 152, 90, , 75 ;clicks on the search box
		SendInput ^v ;pastes the copied SO
		SendInput {Enter}
		Sleep, 10000
	
		Gosub, Close_Function
		Return
		}
	else
		Return
	
Create_Function: ;THIS FUNCTION WILL CREATE A NEW TAG
	MouseClick, Left, 1522, 814, , 25 ;Select
	Sleep, 6000
	MouseClick, Left, 359, 381, , 25 ;this will click in the text box to get us ready to type
	Send, . Device works as expected. -%init% ;this is our text in the text box
	Sleep, 50
	MouseClick, Left, 491, 259, , 25 ;this will set the tag instore
	MouseClick, Left, 1549, 257, , 25 ;This will select the ddl
	Sleep, 500
	MouseClick, Left, 1205, 351, , 25 ;This will select New product
	Sleep, 500
	MouseClick, Left, 1551, 541, , 25 ;This will select the ddl
	Sleep, 500
	MouseClick, Left, 1188, 592, , 25 ;This will select all
	;MsgBox, Please check these fields.
	Sleep, 200
	MouseClick, Left, 1529, 816, , 25 ;This will hit submits
	;MouseClick, Left, 1864, 993, , 25 ;This will hit submits

	Return
	
Close_Function: ;THIS FUNCTION WILL CLOSE OUR TAG 
	Sleep, 500
	MouseClick, Left, 1502, 794, , 25 ;quick repair
	Sleep, 7000
	MouseClick, Left, 1472, 271, , 25 ;makes sure we are in the so notes and statuss
	Sleep, 2000
	MouseClick, Left, 391, 326, , 75 ;drop down menu
	Sleep, 500
	MouseClick, Left, 251, 383, , 75 ;to complete
	MouseClick, Left, 157, 412, , 75 ;to text box below
	Send, GSIS
	Send, `t	
	Send, %Tar% ; -------------------------------------------------------!RES CODE!
	Send, `t
	Send, `t
	Send, Device works as expected. %Tar%. -%init% ; ------------------!REPAIR NOTES!
	MsgBox, , Attention, Did everything complete correctly? ;lets us check to see if everything typed out correctly
	MouseClick, Left, 1520, 796, , 75 ;clicks save
	Sleep, 6000
	MouseClick, Left, 1520, 796, , 75 ;Confirms save
	Sleep, 6000
	MouseClick, Left, 1403, 149, , 75 ;copies the SO 
	Sleep, 100
	MouseClick, Left, 1403, 149, , 75 ;copies again
	Sleep, 100
	MouseClick, Left, 1403, 149, , 75 ;copies again
	MouseClick, Left, 132, 93, , 75 ;clicks on the search box
	SendInput ^v ;pastes the copied SO
	SendInput {Enter}	
	Sleep, 5000
	MouseClick, Left, 37, 105, , 75 ;Clicks Home Logo
	;MouseClick, Left, 762, 981, , 75 ;Hits print
	;Sleep, 4000
	;SendInput {Enter} ;confirms print
	Return

; =======================================================================================


; Main Function =========================================================================

GUIMain()
{
	Static GUICreate := GUIMain()
	
	Global
	
	Item := "Select Item"
	Action := "Select Action"
	init := ""
	
	GUIWidth := 225, GUIHeight := 400
	
	Menu, Tray, Icon, Shell32.dll, 174 ; Change the tray icon
	Menu, Tray, Tip, GSTagManager ; Change the tooltip of the tray icon
	Menu, Tray, NoStandard ; Remove all standard tray menu items
	Menu, Tray, Add, Exit, ExitSub

	Gui, +LastFound -Resize
	Gui, Margin, 10, 10
	
	while(init = ""){
		InputBox, init, Initials, Please enter your initials., , 240, 130 ;gets the intials of the user
	}
	
	;THIS IS OUR MAIN GUI AND ACTION SELECTOR
	CoordMode, Mouse, Screen ;Place Mouse at absolute screen coordinates
	Gui, Add, Button, % " x" 10 " y" 10 " w" 200 " h" 30, GSO&B
	Gui, Add, Button, % " x" 10 " y" 50 " w" 200 " h" 30, GSC&C
	Gui, Add, DropDownList, x100 y90 w109 vItem gSubmit_All,Select Item||Computer|TV|Phone or Tablet
	Gui, Add, Text, x10 y95, What is certified?
	Gui, Add, DropDownList, x100 y120 w109 vAction gSubmit_All,Select Action||Create|Close|Both
	Gui, Add, Text, x10 y125, Select an action?
	Gui, Add, Button, % " x" 10 " y" 150 " w" 200 " h" 30, GS&DR
	Gui, Add, Button, % " x" 10 " y" 190 " w" 200 " h" 30 , Clock &In
	Gui, Add, Button, % " x" 10 " y" 230 " w" 200 " h" 30 , Clock &Out
	Gui, Add, Button, % " x" 10 " y" 320 " w" 200 " h" 30, ReadMe ;ORIGINAL POSITIONING Gui, Add, Button, % " x" 10 " y" 240 " w" 200 " h" 30, ReadMe
	;Gui, Add, Button, % " x" 10 " y" 280 " w" 200 " h" 30, Test  
	Gui, Add, Button, % " x" 10 " y" 280 " w" 200 " h" 30, &Get Mouse Pos
	Gui, Add, Button, % " x" 10 " y" 360 " w" 100 " h" 30, &Change Initials
	Gui, Add, Button, % " x" 110 " y" 360 " w" 100 " h" 30 , Exit

	Gui, Show, % " w" GUIWidth " h" GUIHeight, TagManager
	Return
}
; =======================================================================================

^+h::
	hardwarediags(){
	MouseClick, Left, 1144, 347, , 75 ;adds 1 box
	Send, `t
	Send, `t
	Send, %init%
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	MouseMove, 1502, 792
	}

^+o::
	os_service_preparation(){
	MouseClick, Left, 87, 349, , 75 ;adds 1 box
	Send, `t
	Send, %init%
	MouseMove, 1502, 792
	}

^+v::
	vir_spy(){
	MouseClick, Left, 1488, 321, , 75 ;adds 1 box
	MouseClick, Left, 1488, 321, , 75 ;adds 1 box
	MouseClick, Left, 1488, 321, , 75 ;adds 1 box
	Sleep, 500
	MouseClick, Left, 105, 356, , 75 ;adds 1 box
	Send, MRI
	Send, `t
	Send, 0
	Send, `t
	Send, 0
	Send, `t
	Send, %init%
	Send, `t
	Send, `t
	Send, `t
	Send, Tr
	Send, `t
	Send, 0
	Send, `t
	Send, 0
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, we
	Send, `t
	Send, 0
	Send, `t
	Send, 0
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, other
	Send, `t
	MouseClick, Left, 1108, 442, , 75 ;clicks on found box
	Send, 11
	Send, `t
	Send, 11
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, Group Policies
	MouseMove, 1502, 792
	}

^+t::
	tune_up(){
	MouseClick, Left, 89, 349, , 75 ;adds 1 box
	Send, `t
	Send, %init%
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	MouseMove, 1502, 792
	}

^+p::
	post_op(){
	MouseClick, Left, 88, 348, , 75 ;adds 1 box
	Send, `t
	Send, %init%
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	Send, `t
	Send, `t
	Send, `t
	Send, `t
	Send, {Space}
	MouseMove, 1502, 792
	}

; "CTRL + LEFT"  for previous 
^Left::Media_Prev


; "CTRL + RIGHT"  for next 
^Right::Media_Next


; "CTRL + SPACE"  for pause
^Space::Media_Play_Pause
