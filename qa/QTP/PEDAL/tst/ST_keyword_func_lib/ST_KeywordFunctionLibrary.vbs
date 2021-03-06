'#####################################################################################
'#		PEDAL - Portable Event-Driven Automation Library
'#		SpeedTest, Inc. copyright 2009
'#		If you have any questions or need support,
'#		contact:
'#				SpeedTest Inc.
'#				7017 Eden Mill Road  Woodbine, MD 21797
'#				410-627-7373, info@speedtestinc.com
'#
'#      This code is the property of SpeedTest Inc. and is conveyed as a  component
'#      of a services contract, without restrictions on its use.
'#      Use by anyone other than client personnel in support of the project for which SpeedTest is contracted
'#      is a copyright infringement.
'#      Client bears sole responsibility for the use and implementation of this code.  It is conveyed by 
'#      SpeedTest without license, warranty or support beyond the services contract period.
'#####################################################################################

'#####################################################################################		
'#		The following is the Project Function Library for the ST automated test framework
'#		It uses an event-driven approach to read data from a data table and 
'#		execute the test based upon that data.  The functions in this library
'#		perform the utility type operations that are specific tothe project or appliaction under test  and 
'# 		are not related to a GUI object.
'#
'#	Data array key:
'#	Data(0) = DataTable("Application", dtGlobalSheet)
'#	Data(1) = DataTable("Page", dtGlobalSheet)
'#	Data(2) = DataTable("Field", dtGlobalSheet)
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

'*******************************************************************************************************************************************

Public Function Keyword_Handler (Data,CurrentRow,ResultsFileObj)
GUIObjRef = "Browser(Data(0)).Page(Data(1))."
If Data(2) <> "" Then
	GUIObjRef = GUIObjRef & "Frame(Data(2))."
End If
'GUIObjRef = GUIObjRef & "Link(Data(5))."
GUIObjRef = GUIObjRef & Data(6) & "(Data(5))."


Select Case LCase(Data(5))

   Case "openurl"
		status = OpenUrl(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case "webtable_clickonlinkincell"
		status = WebTable_ClickOnLinkInCell (Data,CurrentRow,ResultsFileObj)
   Case "webtable_clickonimageincell"
		status = WebTable_ClickOnImageInCell (Data,CurrentRow,ResultsFileObj)
   Case "webtable_clickonbuttonincell"
		status = WebTable_ClickOnButtonInCell (Data,CurrentRow,ResultsFileObj)
   Case "webtable_enterdataincell"
		status = WebTable_EnterDataInCell (Data,CurrentRow,ResultsFileObj)
   Case "webtable_clickcheckboxincell"
		status = WebTable_ClickCheckboxInCell (Data,CurrentRow,ResultsFileObj)
   Case "webedit_gettext"
		status = WebEdit_GetText (Data,CurrentRow,ResultsFileObj)
   Case "webedit_verifytext"
		status = WebEdit_VerifyText (Data,CurrentRow,ResultsFileObj)
   Case "webedit_settext"
		status = WebEdit_SetText (Data,CurrentRow,ResultsFileObj)
   Case "webelement_click"
		status = WebElement_Click (Data,CurrentRow,ResultsFileObj)
   Case "webfile_click"
		status = WebFile_Click (Data,CurrentRow,ResultsFileObj)
   Case "weblist_getselection"
		status = WebList_GetSelection (Data,CurrentRow,ResultsFileObj)
   Case "weblist_setselection"
		status = WebList_SetSelection (Data,CurrentRow,ResultsFileObj)
   Case "webtable_gettableproperty"	
		status = WebTable_GetTableProperty (Data,CurrentRow,ResultsFileObj)
   Case "webelement_getroproperty"
		status = WebElement_GetROProperty (Data,CurrentRow,ResultsFileObj)
   Case "webimage_getroproperty"
		status = WebImage_GetROProperty(Data,CurrentRow,ResultsFileObj)
   Case "wait"
		status = wait_(Data,CurrentRow,ResultsFileObj)
   Case Else
		Reporter.ReportEvent micFail, Data(5), "The keyword function was not found!"
End Select
   Keyword_Handler = status	
End Function

'************************************************************************************************************************
' Project functionality application - In Trial Reg, POand PA apps, search results are displayed in a table with a select button on each row
' Data entry - Object type must say ProjFunc_OrgSearchResultsTable for an Org search or ProjFunc_PersonSearchResultsTablemfor a Person search,
'						 ObjectName must be the table name which contains the serach results, Value is the value being serched for or verified.
' Entry - this function will search column 2 of the table for the value entered and if found will click the Select button in column 7 of that row.
' Verify - By entering a value and row and column in ObjPar1 and ObjPar2, data in any cell can be validated.
'				Data rows in the table start at row 2,  Row 1 is the column headers  
'				Row number is always relative to the page of the results you are on,  For example, To verify the first item on page two of a multipage results set,
'				use the Next link to page to the second page and enter row number as 2 (first data row onthe seconde page).
'Constraints - The Search Results table must be displayed on a popup frame.

Public Function OpenUrl(Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
	IE.Navigate Data(4)

End Function

'************************************************************************************************************************
'Function Name - WebTable_ClickOnLinkInCell
'
'Function Description - This function clicks on a link in a webtable cell.
'
'Input Param 
'     WebTableName - Specify the class name of the webtable object.
'     SearchTerm
'     SearchColumn
'     LinkName
'     LinkColumn
'     The Data(4) "value" column must contain WebTableName###SearchTerm###LinkName.
'     The Data(7) "ObjPar1" and Data(8) "ObjPar2" column must contain SearchColumnNumber and LinkColumnNumber respectively.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'     FindTableRowByCellContent
'
Function WebTable_ClickOnLinkInCell(Data,CurrentRow,ResultsFileObj)
	wait(5)
	clickStatus = "Fail"
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	funcArg = parseData4(Data(4))
	webTableName = funcArg(0)
	SearchTerm = funcArg(1)
	LinkName = funcArg(2)
	Action = Data(3) 'not used currently. By default click method is called
	SearchColumnNumber = Data(7)
	LinkColumnNumber = Data(8)

	GUIObjRef = GUIObjRef & "WebTable(webTableName)."
	rowNum = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
	SetVariable "rowNum", rowNum
	If rowNum <> 0 Then
		e_Method = "ChildItemCount(rowNum,CInt(LinkColumnNumber),""" & "Link" & """)"
		e_Command = "numOfLink=" & GUIObjRef & e_Method
		Execute (e_Command)
		For i=0 to numOfLink-1
			e_method = "ChildItem(rowNum,CInt(LinkColumnNumber),""" & "Link" & """,i)"
			e_Command = "Set nameOfLink=" & GUIObjRef & e_Method
			Execute(e_command)	
			'If (LinkName = nameOfLink.GetROProperty("text")) Then
			If 0 <> InStr(1,trim(lcase(LinkName)),trim(lcase(nameOfLink.GetROProperty("text")))) Then
				nameOfLink.Click
				clickStatus = "Pass"
				Exit For
			End If
		Next
	Else
		WebTable_ClickOnLinkInCell = "Fail"
	End If
	If clickStatus = "Fail" Then
		WebTable_ClickOnLinkInCell = "Fail"
	Else
		WebTable_ClickOnLinkInCell = "Pass"
	End If	
End Function
'************************************************************************************************************************
'Function Name - WebTable_ClickOnImageInCell
'
'Function Description - This function clicks on an image in a webtable cell.
'
'Input Param 
'     WebTableName
'     SearchTerm
'     SearchColumn
'     ImageName
'     ImageColumn
'     The Data(4) "value" column must contain WebTableName###SearchTerm###ImageName.
'     The Data(7) "ObjPar1" and Data(8) "ObjPar2" column must contain SearchColumnNumber and ImageColumnNumber respectively.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'     FindTableRowByCellContent
'
Function WebTable_ClickOnImageInCell(Data,CurrentRow,ResultsFileObj)
	wait(5)
	On Error Resume Next
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	funcArg = parseData4(Data(4))
	webTableName = funcArg(0)
	SearchTerm = funcArg(1)
	ImageName = funcArg(2)
	Action = Data(3) 'not used currently. By default click method is called
	SearchColumnNumber = Data(7)
	ImageColumnNumber = Data(8)
	GUIObjRef = GUIObjRef & "WebTable(webTableName)."
	rowNum = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
	SetVariable "rowNum", rowNum
	If rowNum <> 0 Then
		e_Method = "ChildItemCount(rowNum,CInt(ImageColumnNumber),""" & "Image" & """)"
		e_Command = "numOfImage=" & GUIObjRef & e_Method
		Execute (e_Command)
		For i=0 to numOfImage-1
			e_method = "ChildItem(rowNum,CInt(ImageColumnNumber),""" & "Image" & """,i)"
			e_Command = "Set nameOfImage =" & GUIObjRef & e_Method
			Execute(e_command)	
			If (ImageName = nameOfImage.GetROProperty("alt")) Then
				nameOfImage.Click
				clickStatus = "Pass"
				Exit For
			End If
		Next
	Else
		WebTable_ClickOnImageInCell = "Fail"
	End If

	If clickStatus = "Fail" Then
		WebTable_ClickOnImageInCell = "Fail"
	Else
		WebTable_ClickOnImageInCell = "Pass"
	End If
End Function
'************************************************************************************************************************
'Function Name - WebTable_ClickOnButtonInCell
'
'Function Description - This function clicks on an WebButton in a webtable cell.
'
'Input Param 
'     WebTableName
'     SearchTerm
'     SearchColumn
'     WebButtonName
'     WebButtonColumn
'     The Data(4) "value" column must contain WebTableName###SearchTerm###WebButtonName.
'     The Data(7) "ObjPar1" and Data(8) "ObjPar2" column must contain SearchColumnNumber and WebButtonColumnNumber respectively.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'     FindTableRowByCellContent
'
Function WebTable_ClickOnButtonInCell(Data,CurrentRow,ResultsFileObj)
	wait(5)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	funcArg = parseData4(Data(4))
	webTableName = funcArg(0)
	SearchTerm = funcArg(1)
	WebButtonName = funcArg(2)
	Action = Data(3) 'not used currently. By default click method is called
	SearchColumnNumber = Data(7)
	WebButtonColumnNumber = Data(8)
	GUIObjRef = GUIObjRef & "WebTable(webTableName)."
	rowNum = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
	SetVariable "rowNum", rowNum
	If rowNum <> 0 Then
		e_Method = "ChildItemCount(rowNum,CInt(WebButtonColumnNumber),""" & "WebButton" & """)"
		e_Command = "numOfButton=" & GUIObjRef & e_Method
		Execute (e_Command)
		For i=0 to numOfButton-1
			e_method = "ChildItem(rowNum,CInt(WebButtonColumnNumber),""" & "WebButton" & """,i)"
			e_Command = "Set nameOfButton=" & GUIObjRef & e_Method
			Execute(e_command)	
			If (WebButtonName = nameOfButton.GetROProperty("name")) Then
				nameOfButton.Click
				clickStatus = "Pass"
				Exit For
			End If
		Next
	Else
		WebTable_ClickOnButtonInCell = "Fail"
	End If
	If clickStatus = "Fail" Then
		WebTable_ClickOnButtonInCell = "Fail"
	Else
		WebTable_ClickOnButtonInCell = "Pass"
	End If
End Function
'************************************************************************************************************************
'Function Name - WebTable_ClickCheckboxInCell
'
'Function Description - This function clicks on an WebButton in a webtable cell.
'
'Input Param 
'     WebTableName
'     SearchTerm
'     SearchColumn
'     CheckboxName
'     CheckboxColumn
'     The Data(4) "value" column must contain WebTableName###SearchTerm###CheckboxName.
'     The Data(7) "ObjPar1" and Data(8) "ObjPar2" column must contain SearchColumnNumber and CheckboxColumnNumber respectively.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'     FindTableRowByCellContent
'
Function WebTable_ClickCheckboxInCell(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	funcArg = parseData4(Data(4))
	webTableName = funcArg(0)
	SearchTerm = funcArg(1)
	CheckBoxName = funcArg(2)
	Action = Data(3) 'not used currently. By default set method is called
	SearchColumnNumber = Data(7)
	CheckBoxColumnNumber = Data(8)
	GUIObjRef = GUIObjRef & "WebTable(webTableName)."
	rowNum = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
	SetVariable "rowNum", rowNum
	If rowNum <> 0 Then
		e_Method = "ChildItemCount(rowNum,CInt(CheckBoxColumnNumber),""" & "WebCheckBox" & """)"
		e_Command = "numOfCheckBox=" & GUIObjRef & e_Method
		Execute (e_Command)
		For i=0 to numOfCheckBox-1
			e_method = "ChildItem(rowNum,CInt(CheckBoxColumnNumber),""" & "WebCheckBox" & """,i)"
			e_Command = "Set nameOfCheckBox=" & GUIObjRef & e_Method
			Execute(e_command)	
			If (CheckBoxName = nameOfCheckBox.GetROProperty("name")) Then
				nameOfCheckBox.Set "ON"
				checkStatus = "Pass"
				Exit For
			End If
		Next
	Else
		WebTable_ClickCheckboxInCell = "Fail"
	End If
	If checkStatus = "Fail" Then
		WebTable_ClickCheckboxInCell = "Fail"
	Else
		WebTable_ClickCheckboxInCell = "Pass"
	End If
End Function
'************************************************************************************************************************
'Function Name - WebTable_EnterDataInCell
'
'Function Description - This function enters data in a webEdit object in a webtable cell.
'
'Input Param 
'     WebTableName - Specify the class name of the webtable object.
'     SearchTerm
'     SearchColumn
'     WebEdit name
'     WebEditColumn
'     dataToEnter	
'     The Data(4) "value" column must contain WebTableName###SearchTerm###WebEditName###dataToEnter.
'     The Data(7) "ObjPar1" and Data(8) "ObjPar2" column must contain SearchColumnNumber and WebEditColumnNumber respectively.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'     FindTableRowByCellContent
'
Function WebTable_EnterDataInCell(Data,CurrentRow,ResultsFileObj)
	wait(5)
	setStatus = "Fail"
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	funcArg = parseData4(Data(4))
	webTableName = "class:=" & funcArg(0)
	SearchTerm = funcArg(1)
	we_Name = funcArg(2)
	we_dataToEnter = funcArg(3)
	Action = Data(3) 'not used currently. By default SET method is called
	SearchColumnNumber = Data(7)
	we_ColumnNumber = Data(8)

	GUIObjRef = GUIObjRef & "WebTable(webTableName)."
	rowNum = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
	SetVariable "rowNum", rowNum
	If rowNum <> 0 Then
		e_Method = "ChildItemCount(rowNum,CInt(we_ColumnNumber),""" & "WebEdit" & """)"
		e_Command = "numOfwe=" & GUIObjRef & e_Method
		Execute (e_Command)
		For i=0 to numOfwe-1
			e_method = "ChildItem(rowNum,CInt(we_ColumnNumber),""" & "WebEdit" & """,i)"
			e_Command = "Set nameOfwe=" & GUIObjRef & e_Method
			Execute(e_command)	
			If (we_Name = nameOfwe.GetROProperty("name")) Then
				nameOfwe.set we_dataToEnter
				setStatus = "Pass"
				Exit For
			End If
		Next
	Else
		WebTable_EnterDataInCell = "Fail"
	End If
	If setStatus = "Fail" Then
		WebTable_EnterDataInCell = "Fail"
	Else
		WebTable_EnterDataInCell = "Pass"
	End If	
End Function
'************************************************************************************************************************
'Function Name - WebEdit_GetText
'
'Function Description - This function retrieves the text from a WebEdit field and stores it in an internal variable
'
'Input Param 
'     WebEditFieldName - Name of the WebEdit field
'     VariableName - Variable name in which to store the retrieved value.
'     The Data(4) "value" column must contain WebEditFieldName###VariableName.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebEdit_GetText(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If

	funcArg = parseData4(Data(4))
	WebEditFieldName = funcArg(0)
	varName = funcArg(1)

	GUIObjRef = GUIObjRef & "WebEdit(WebEditFieldName)."
	e_method = "GetROProperty(" & chr(34) & "value" & chr(34) & ")"	
	e_command = "rValue=RTrim(" & GUIObjRef & e_method & ")"

	Execute (e_command)
	SetVariable varName,rValue
	WebEdit_GetText = "Done"
End Function
'************************************************************************************************************************
'Function Name - WebEdit_SetText
'
'Function Description - This function sets the text stored in a variable into a WebEdit field. This should be used in conjunction 
'			with the WebEdit_GetText function. 
'
'Input Param 
'     WebEditFieldName - Name of the WebEdit field
'     VariableName - Variable name in which to store the retrieved value.
'     The Data(4) "value" column must contain WebEditFieldName###VariableName.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebEdit_SetText(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If

	funcArg = parseData4(Data(4))
	WebEditFieldName = funcArg(0)
	varName = funcArg(1)


	Data(6) = "WebEdit"
	Data(5) = funcArg(0)
	Data(4) = GetVariable(funcArg(1)) 
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	wait (5)
	WebEdit_SetText = "Done"
End Function
'************************************************************************************************************************
'Function Name - WebElement_Click
'
'Function Description - This function clicks on a WebElement 
'
'Input Param 
'     WebElementName - Name of the WebElement
'     The Data(4) "value" column must contain WebElementName
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebElement_Click(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	
	GUIObjRef = GUIObjRef & "WebElement(Data(4))."
	e_method = "Click"
	e_command = GUIObjRef & e_method
	Execute(e_command)
	WebElement_Click = "Done"
	wait(5)
End Function
'************************************************************************************************************************
'Function Name - WebList_GetSelection
'
'Function Description - This function retrieves the selection from a WebList and stores it in an internal variable
'
'Input Param 
'     WebListName - Name of the WebList
'     VariableName - Variable name in which to store the retrieved value.
'     The Data(4) "value" column must contain WebListName###VariableName.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebList_GetSelection(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If

	funcArg = parseData4(Data(4))
	GUIObjRef = GUIObjRef & "WebList(funcArg(0))."

	e_method = "GetROProperty(" & chr(34) & "selection" & chr(34) & ")"	
	e_command = "rValue = " & GUIObjRef & e_method

	Execute (e_command)

	SetVariable funcArg(1), rValue
	WebList_GetSelection = "Done"
End Function
'************************************************************************************************************************
'Function Name - WebList_SetSelection
'
'Function Description - This function selects an item stored in a variable into a WebList object. This should be used in conjunction 
'			with the WebList_GetSelection function. 
'
'Input Param 
'     WebListName - Name of the WebList
'     VariableName - Variable name in which to store the retrieved value.
'     The Data(4) "value" column must contain WebListName###VariableName.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebList_SetSelection(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If

	funcArg = parseData4(Data(4))
	Data(6) = "WebList"
	Data(5) = funcArg(0)
	Data(4) = GetVariable(funcArg(1)) 
	Data(3) = "select"

	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	wait(5)
	WebList_SetSelection = "Done"
End Function
'************************************************************************************************************************
'Function Name - WebEdit_VerifyText
'
'Function Description - This function verifies the value in a WebEdit field against the value stored in an internal variable
'
'Input Param 
'     WebEditFieldName - Name of the WebEdit field
'     VariableName - Variable name in which to store the retrieved value.
'     The Data(4) "value" column must contain WebEditFieldName###VariableName.
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebEdit_VerifyText(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If

	funcArg = parseData4(Data(4))
	WebEditFieldName = funcArg(0)
	varName = funcArg(1)

	GUIObjRef = GUIObjRef & "WebEdit(WebEditFieldName)."
	e_method = "GetROProperty(" & chr(34) & "value" & chr(34) & ")"	
	e_command = "rValue=RTrim(" & GUIObjRef & e_method & ")"

	Execute (e_command)

	If rValue = GetVariable (varName) Then
		WebEdit_VerifyText = "Pass"
	Else
		WebEdit_VerifyText = "Fail"
	End If
End Function
'************************************************************************************************************************
Function wait_ (Data,CurrentRow,ResultsFileObj)
	wait(CInt(Data(4)))
End Function
'************************************************************************************************************************
Function WebTable_GetTableProperty(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	WebTableName = parseData4(Data(4))(0)
	varName = parseData4(Data(4))(1)
	propertyName = Data(3)

	GUIObjRef = GUIObjRef & "WebTable(WebTableName)."
	Select Case lcase(propertyName)
		Case "getcelldata"
			e_method = "GetCellData (CInt(Data(7)), CInt(Data(8)))"	
		Case "rowcount"
			e_method = "RowCount"
	End Select
	
	e_command = "rValue=RTrim(" & GUIObjRef & e_method & ")"
	Execute (e_command)

	SetVariable varName, rValue
	WebTable_GetCellData = "Pass"
End Function
'************************************************************************************************************************
Function WebElement_GetROProperty (Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	WebElementName = parseData4(Data(4))(0)
	varName = parseData4(Data(4))(1)
	propertyName = Data(3)

	GUIObjRef = GUIObjRef & "WebElement(WebElementName)."

	Select Case lcase(propertyName)
		Case "innertext"
			e_method = "GetROProperty(" & chr(34) & "innertext" & chr(34) & ")"
		Case else
			Reporter.ReportEvent micFail, "WebElement_GetROProperty", "The property is not supported"
	End Select
	e_command = "rValue=RTrim(" & GUIObjRef & e_method & ")"
	Execute (e_command)	
	SetVariable varName, rValue
	WebElement_GetROProperty = "Pass"
End Function
'************************************************************************************************************************
Function WebImage_GetROProperty (Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	ImageName = parseData4(Data(4))(0)
	varName = parseData4(Data(4))(1)
	propertyName = Data(3)

	GUIObjRef = GUIObjRef & "Image(ImageName)."

	Select Case lcase(propertyName)
		Case "alt"
			e_method = "GetROProperty(" & chr(34) & "alt" & chr(34) & ")"
		Case else
			Reporter.ReportEvent micFail, "WebImage_GetROProperty", "The property is not supported"
	End Select
	e_command = "rValue=RTrim(" & GUIObjRef & e_method & ")"
	Execute (e_command)	
	SetVariable varName, rValue
	WebElement_GetROProperty = "Pass"
End Function
'************************************************************************************************************************
'Function Name - WebFile_Click
'
'Function Description - This function clicks on a WebFile object (Browser button) and open the dialog. 
'
'Input Param 
'     WebFileName - Name of the WebFile
'     The Data(4) "value" column must contain WebFileName
'
'Return Value
'     none
'
'Change History
'
'Functions affected
'
Function WebFile_Click(Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	
	GUIObjRef = GUIObjRef & "WebFile(Data(4))."
	e_method = "Click"
	e_command = GUIObjRef & e_method
	Execute(e_command)
	WebFile_Click = "Done"
End Function
'************************************************************************************************************************