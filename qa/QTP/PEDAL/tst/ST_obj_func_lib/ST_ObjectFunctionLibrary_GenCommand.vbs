'#####################################################################################
'#		PEDAL - Portable Event-Driven Automation Library
'#		SpeedTest, Inc. copyright 2009
'#		If you have any questions or need support,
'#		contact:
'#				SpeedTest Inc.
'#				7017 Eden Mill Rd  Woodbine, MD 21797
'#				410-627-7373, info@speedtestinc.com
'#
'#      This code is the property of SpeedTest Inc. and is conveyed to our client, as a no-charge component
'#      of a services contract, without restrictions on its use.
'#      Use by anyone other than client personnel in support of the project for which SpeedTest is contracted
'#      is a copyright infringement.
'#      Client bears sole responsibility for the use and implementation of this code.  It is conveyed by 
'#      SpeedTest without license, warranty or supportbeyond the services contract period.
'#####################################################################################

'#####################################################################################		
'#		The following is the Object Function Library for the ST automated test framework
'#		It uses an event-driven approach to read data from a data table and 
'#		execute the test based upon that data.  The functions in this library
'#		perform the interactions with the screen objects.
'#
'#	Data array key:
'#	Data(0) = DataTable("Application", dtGlobalSheet)
'#	Data(1) = DataTable("Page", dtGlobalSheet)
'#	Data(2) = DataTable("Frame", dtGlobalSheet)
'#	Data(3) = DataTable("Action", dtGlobalSheet)
'#	Data(4) = DataTable("Value", dtGlobalSheet)
'#	Data(5) = DataTable("ObjectNameOrKeyword", dtGlobalSheet)
'#	Data(6) = DataTable("ObjectType", dtGlobalSheet)
'#	Data(7) = DataTable("ObjPar1", dtGlobalSheet)
'#	Data(8) = DataTable("ObjPar2", dtGlobalSheet)
'#	Data(9) = DataTable("SynchPar1", dtGlobalSheet)
'#	Data(10) = DataTable("SynchPar2", dtGlobalSheet)
'#	Data(11) = DataTable("comment", dtGlobalSheet)
'#	Data(12) = DataTable("debug", dtGlobalSheet)
'# 
'#####################################################################################
Dim GUIObjRef
Public GUIObjRefParent
Public Actual
'************************************************************************************************************************
Public Function ST_ObjectHandler (Data,CurrentRow,ResultsFileObj)
	On Error Resume Next
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	GUIObjRefParent = GUIObjRef
	'GUIObjRef = GUIObjRef & "Link(Data(5))."

	If lcase(Data(6)) <> "dynamiclink" Then
		If lcase(Data(6)) = "webedit_secure" Then
			'Data(6) = "WebEdit"
			GUIObjRef = GUIObjRefParent
		Else
			GUIObjRef = GUIObjRef & Data(6) & "(Data(5))."
		End If
		
	Else
		'GUIObjRef = GUIObjRef & "Link" & "(Data(5))." 'use this line of SetTOProperty is used fro dynamic link recognition
		GUIObjRef = GUIObjRef & "Link" ' use this line of Descriptive Programming is used fro dynamic link recognition
	End If

	Select Case LCase(Data(6))
		Case "link"
			status = Link (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webedit"
			status = WebEdit (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webedit_secure"
			stutus = WebEdit (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webtable"
			status= WebTable (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webradiogroup"
			status WebRadioGroup (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webcheckbox"
			status = WebCheckBox (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "weblist"
			status = WebList (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webelement"
 			status = WebElement (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "image"
			status = WebImage (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webfile"
			status = WebFile (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webbutton"
			status = WebButton (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "webarea"
			status = WebArea (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "dynamiclink"
			status = DynamicLink (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "winbutton"
			status = WinButton (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "checktextonpagetrim"
			status = CheckTextOnPage (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "checktextonpageexact"
			status = CheckTextOnPage (Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "winedit"
			status = WinEdit(Data,CurrentRow,ResultsFileObj,GUIObjRef)
		Case "keyword"
			status = Keyword_Handler (Data,CurrentRow,ResultsFileObj)
		Case Else
			status = ProjFunc_Handler (Data,CurrentRow,ResultsFileObj)
	End Select

	If Err.Number <> 0 and status = "Fail" Then
		ST_ObjectHandler = "Fail"
	ElseIf Err.Number = 0 and status = "Fail" Then
		'ST_CustomReporting Data,status,CurrentRow,ResultsFileObj
		ST_ObjectHandler = "Fail"
	ElseIf Err.Number <> 0 and status = "Done" Then
		ST_ObjectHandler = "Fail"
	ElseIf Err.Number = 0 and (status = "Pass" or status = "Done") Then
		ST_ObjectHandler = "Pass"
	End If
	Err.Clear

'	If status="Fail" Then
'		ST_ObjectHandler = "Fail"
'	Else
'		ST_ObjectHandler = "Pass"
'	End If
End Function

'************************************************************************************************************************
'
'
Public Function Link (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	EntryMethod = "Click"
	VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "click","enter"
			'Browser(Data(0)).Page(Data(1)).Link(Data(5)).Click
			Execute EntryCommand
			Link = "Done"
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).Link(Data(5)).GetROProperty("text") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				Link = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				Link = "Pass"
			End If
		Case "verify_attrib","verify_property"
			Select Case LCase(Data(7))
				Case "href"
					VerifyMethod = "GetROProperty(" & chr(34) & "href" & chr(34) & ")"
					VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"
				Case Else
					If Data(7) = "" Then
						Reporter.ReportEvent micFail, ReportStepName, "Link - Verify Attribute - Please enter and attribute name in the ObjPar1 column!"
					Else
						Reporter.ReportEvent micFail, ReportStepName, "Link - Verify "&Data(7)&" Attribute - Verification of this attribute is not currently supported!"
					End If
			End Select

			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).Link(Data(5)).GetROProperty("text") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				Link = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				Link = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "Link - Action not valid for this object type!"
	End Select
		
End Function


'************************************************************************************************************************
'
Public Function WebEdit (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	Dim rValue
	If lcase(Data(6)) = "webedit"  Then
		EntryMethod = "Set Data(4)"
	End If
	If lcase(Data(6)) = "webedit_secure"  Then
		Data(6) = "WebEdit" 
		GUIObjRef = GUIObjRef & Data(6) & "(Data(5))."
		EntryMethod = "SetSecure Data(4)"
	End If

	VerifyMethod = "GetROProperty(" & chr(34) & "value" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case Trim(LCase(Data(3)))
		Case "enter"
			Execute EntryCommand
			WebEdit = "Done" 
'			If Data(6) = "WebEdit"  Then
'				Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).Set Data(4)
'			End If
'
'			If Data(6) = "WebEdit_secure"  Then
'				Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).SetSecure Data(4)
'			End If

		Case "verify"
			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).GetROProperty("value") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebEdit = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebEdit = "Pass"
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebEdit - Action not valid for this object type!"
			WebEdit = "Fail"
	End Select
End Function


'************************************************************************************************************************
'
Public Function WebImage (Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
	Dim rValue
	EntryMethod = "Click 2,2"
	VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	'VerifyMethod = "GetROProperty(" & chr(34) & Data(3) & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "click","enter"
			Execute EntryCommand
			WebImage = "Done" 
			'Browser(Data(0)).Page(Data(1)).Image(Data(5)).Click 2,2
		Case "verify"
			Execute VerifyCommand
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebImage = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebImage = "Pass"
			End If			
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebImage - Action not valid for this object type!"
			WebImage = "Fail"
	End Select
End Function

'************************************************************************************************************************
'
Public Function WebTable (Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
	Dim rValue
	EntryMethod = "Click"
	VerifyMethod = "GetCellData (Data(7), Data(8))"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "verify"
			Execute (VerifyCommand) 
			'Actual = RTrim( Browser(Data(0)).Page(Data(1)).WebTable(Data(5)).GetCellData (Data(7), Data(8)) )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebTable = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebTable = "Pass"
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebTable - Action not valid for this object type!"
			WebTable = "Fail" 
	End Select
End Function


'************************************************************************************************************************
'
Public Function WebRadioGroup (Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
	EntryMethod = "Select Data(4)"
	VerifyMethod = "GetROProperty(" & chr(34) & "disabled" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	'VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"
	Select Case LCase(Data(3))
		Case "enter","select","check"
			Execute EntryCommand
			'Browser(Data(0)).Page(Data(1)).WebRadioGroup(Data(5)).Select Data(4)
			WebRadioGroup = "Done" 
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=Browser(Data(0)).Page(Data(1)).WebRadioGroup(Data(5)).GetROProperty("disabled")
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebRadioGroup = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebRadioGroup = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebRadioGroup - Action not valid for this object type!"
			WebRadioGroup = "Fail"
	End Select
End Function



'************************************************************************************************************************
'
Public Function WebCheckBox (Data,CurrentRow,ResultsFileObj,GUIObjRef)
'there is no toggle option on WebCheckBox.Set.
'This function will need to be enhanced to get the current value and set it to the opposite if the spreadsheet says click

' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	Select Case LCase(Data(3))
		Case "enter","check","select","click"
			EntryMethod = "Set "& chr(34) & "ON" & chr(34) &""
		Case "uncheck"
			EntryMethod = "Set "& chr(34) & "OFF" & chr(34) &""
	End Select

	VerifyMethod = "GetROProperty(" & chr(34) & "disabled" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	'VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "enter","check","select","click"
			Execute EntryCommand
			'Browser(Data(0)).Page(Data(1)).WebCheckBox(Data(5)).Set "ON"
			WebCheckBox = "Done" 
		Case "uncheck"
			Execute EntryCommand
			'Browser(Data(0)).Page(Data(1)).WebCheckBox(Data(5)).Set "OFF"
			WebCheckBox = "Done" 
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=Browser(Data(0)).Page(Data(1)).WebCheckBox(Data(5)).GetROProperty("value")
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebCheckBox = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebCheckBox = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebCheckBox - Action not valid for this object type!"
			WebCheckBox = "Fail" 
	End Select
End Function


'************************************************************************************************************************
'
Public Function WebList (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	Dim rValue	
	EntryMethod = "Select Data(4)"
	VerifyMethod = "GetROProperty(" & chr(34) & "disabled" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	'VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "enter","select"
			Execute EntryCommand
			WebList = "Done" 
			'Browser(Data(0)).Page(Data(1)).WebList(Data(5)).Select Data(4)
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=Browser(Data(0)).Page(Data(1)).WebList(Data(5)).GetROProperty("value")
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebList = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebList = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebList - Action not valid for this object type!"
			WebList = "Fail" 
	End Select
End Function


'************************************************************************************************************************
'
Public Function WebElement (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	EntryMethod = "Click"
	VerifyMethod = "GetROProperty(" & chr(34) & "innertext" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "verify"
			Execute (VerifyCommand) 
			'Actual = RTrim( Browser(Data(0)).Page(Data(1)).WebElement(Data(5)).GetROProperty("innertext") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebElement = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebElement = "Pass" 
			End If
		Case "click"
			Execute(EntryCommand)
			WebElement = "Done"
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebElement - Action not valid for this object type!"
			WebElement = "Fail" 
	End Select
End Function

'************************************************************************************************************************
'
Public Function WebFile (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	EntryMethod = "Set Data(4)"
	VerifyMethod = "GetROProperty(" & chr(34) & "value" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case Trim(LCase(Data(3)))
		Case "enter"
			Execute EntryCommand
			WebFile = "Done" 
'			If Data(6) = "WebEdit"  Then
'				Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).Set Data(4)
'			End If
'
'			If Data(6) = "WebEdit_secure"  Then
'				Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).SetSecure Data(4)
'			End If

		Case "verify"
			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).GetROProperty("value") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebFile = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebFile = "Pass" 
			End If
		Case "click"
			e_method = "Click"
			e_command = GUIObjRef & e_method
			Execute(e_command)
			WebFile = "Done"
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebFile - Action not valid for this object type!"
			WebFile = "Fail" 
	End Select
End Function

'************************************************************************************************************************
'
Public Function WebButton (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	EntryMethod = "Click"
	VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "click","enter"
			'Browser(Data(0)).Page(Data(1)).Link(Data(5)).Click
			Execute EntryCommand
			WebButton = "Done" 
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).Link(Data(5)).GetROProperty("text") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WebButton = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WebButton = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebButton - Action not valid for this object type!"
			WebButton = "Fail" 
		End Select
End Function

'************************************************************************************************************************
'
Public Function WebArea (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	EntryMethod = "Click"
	'VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	'VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "click","enter"
			'Browser(Data(0)).Page(Data(1)).Link(Data(5)).Click
			Execute EntryCommand
			WebArea = "Done" 
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WebArea - Action not valid for this object type!"
			WebArea = "Fail" 
	End Select
End Function

'************************************************************************************************************************
'
Public Function DynamicLink (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	'EntryMethod = "Click"
	'VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	'EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	'VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Set oDesc = Description.Create()
	oDesc("micclass").Value = "Link"
	If Data(2) <> "" Then
		Set oChildren = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).ChildObjects(oDesc)
	Else
		Set oChildren = Browser(Data(0)).Page(Data(1)).ChildObjects(oDesc)
	End If

	For i=0 to oChildren.count
		text=oChildren(i).GetROProperty("text")
		If text = Data(4) Then
			Exit For
		End If
	Next

	'GUIObjRef = GUIObjRef& "("& chr(34) & "text:=" &  Data(4) & chr(34) &")" & "."
	GUIObjRef = GUIObjRef& "(oDesc)."
	Select Case LCase(Data(3))
		Case "click","enter"
			'Browser(Data(0)).Page(Data(1)).Link(Data(5)).Click
			'SetTOPropCommand = GUIObjRef&"SetTOProperty " & chr(34) & "text" & chr(34) &", Data(4)"
        		EntryCommand = GUIObjRef & EntryMethod
			'Execute EntryCommand
			oChildren(i).Click
			DynamicLink = "Done" 
		Case "verify_attrib","verify_property"
			Select Case LCase(Data(7))
				Case "href"
					Actual=oChildren(i).GetROProperty("href")
				Case Else
					If Data(7) = "" Then
						Reporter.ReportEvent micFail, ReportStepName, "DynamicLink - Verify Attribute - Please enter an attribute name in the ObjPar1 column!"
						DynamicLink = "Fail" 
					Else
						Reporter.ReportEvent micFail, ReportStepName, "DynamicLink - Verify "&Data(7)&" Attribute - Verification of this attribute is not currently supported!"
						DynamicLink = "Fail" 
					End If
			End Select

			'Execute (VerifyCommand) 
			If (Actual <> Data(8)) Then
				Data(4) = Data(8)
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				DynamicLink = "Fail" 
			Else
				Data(4) = Data(8)
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				DynamicLink = "Pass" 
			End If

		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "DynamicLink - Action not valid for this object type!"
			DynamicLink = "Fail" 
	End Select
End Function


'************************************************************************************************************************
'
Public Function WinButton (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	GUIObjRef = "Browser(Data(0)).Dialog(Data(1)).WinButton(Data(5))."
	EntryMethod = "Click"
	VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "click","enter"
			'Browser("Trial Details").Dialog("Message from webpage").WinButton("OK").Click
			Execute EntryCommand
			WinButton = "Done" 
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).Link(Data(5)).GetROProperty("text") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WinButton = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WinButton = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WinButton - Action not valid for this object type!"
			WinButton = "Fail" 
	End Select
End Function

'************************************************************************************************************************
'
Public Function CheckTextOnPage (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	'EntryMethod = "Click"
	VerifyMethod = "GetROProperty(" & chr(34) & "innertext" & chr(34) & ")"
	'EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=Trim(" & GUIObjRef & VerifyMethod & ")"

	Set objPage = Browser(Data(0)).Page(Data(1)).Object
	set colBody = objPage.getElementsByTagName("body")
	Set bodyNode = colBody.item(0)
	Actual = bodyNode.innertext

	Select Case LCase(Data(3))
		Case "verify"
			' retrieve page text from app
			'Execute (VerifyCommand)
			Select Case Lcase(Data(6))
				Case "checktextonpagetrim"
					'trim all spaces from expected value
					strExpected = Replace (Data(4), " ", "", 1, -1)
					strExpected = Replace (strExpected, vbCrLf, "", 1, -1)
					strExpected = Replace (strExpected, vbLf, "", 1, -1)
					strExpected = Replace (strExpected, vbNewLine, "", 1, -1)
					strExpected = Replace (strExpected, vbTab, "", 1, -1)
					strExpected = Replace (strExpected, chr(160), "", 1, -1) ' delete nonbreaking spaces
					'trim all spaces from actual value
					Actual = Replace (Actual, " ", "", 1, -1)
					Actual = Replace (Actual, vbCrLf, "", 1, -1)
					Actual = Replace (Actual, vbLf, "", 1, -1)
					Actual = Replace (Actual, vbNewLine, "", 1, -1)
					Actual = Replace (Actual, vbTab, "", 1, -1)
					Actual = Replace (Actual, chr(160), "", 1, -1) ' delete nonbreaking spaces
				Case "checktextonpageexact"
					strExpected = Data(4)
			 	Case Else
					Reporter.ReportEvent micFail, ReportStepName, "CheckTextOnPage - Function name not handled by function!"
			End Select
			If (InStr(1,Actual, strExpected) = 0) Then
				Actual="Found in page text: "& VbCrLf & Actual
				Data(4) = strExpected 
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				CheckTextOnPage = "Fail"
			Else
				Actual="Found in page text: "& VbCrLf & Actual
				Data(4) = strExpected
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				CheckTextOnPage = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "CheckTextOnPage - Action not valid for this object type!"
			CheckTextOnPage = "Fail" 
	End Select
End Function

'************************************************************************************************************************
'
Public Function WinEdit (Data,CurrentRow,ResultsFileObj,GUIObjRef)
' The structure of each Object function should be fairly uniform with the following method and command 
' statements being unique to the  object type.
	GUIObjRef = "Browser(Data(0)).Dialog(Data(1)).WinEdit(Data(5))."
	EntryMethod = "Set Data(4)"
	VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
	EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

	Select Case LCase(Data(3))
		Case "set","enter"
			'Browser("AppName").Dialog("Choose File").WinEdit("FileName:").Set
			Execute EntryCommand
			WinEdit = "Done" 
		Case "verify"
			Execute (VerifyCommand) 
			'Actual=RTrim( Browser(Data(0)).Page(Data(1)).Link(Data(5)).GetROProperty("text") )
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				WinEdit = "Fail" 
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				WinEdit = "Pass" 
			End If
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "WinEdit - Action not valid for this object type!"
			WinEdit = "Fail" 
	End Select
End Function

'************************************************************************************************************************