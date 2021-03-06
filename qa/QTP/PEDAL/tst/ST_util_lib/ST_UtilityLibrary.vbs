'#####################################################################################
'#		PEDAL - Portable Event-Driven Automation Library
'#		SpeedTest, Inc. copyright 2009
'#		If you have any questions or need support,
'#		contact:
'#				SpeedTest Inc.
'#				7017 Eden Mill Road  Woodbine, MD 21797
'#				410-627-7373, info@speedtestinc.com
'#
'#      This code is the property of SpeedTest Inc. and is conveyed to our client, as a no-charge component
'#      of a services contract, without restrictions on its use.
'#      Use by anyone other than client personnel in support of the project for which SpeedTest is contracted
'#      is a copyright infringement.
'#      Client bears sole responsibility for the use and implementation of this code.  It is conveyed by 
'#      SpeedTest without license, warranty or support beyond the services contract period.
'#####################################################################################

'#####################################################################################		
'#		The following is the Utilitty Function Library for the ST automated test framework
'#		It uses an event-driven approach to read data from a data table and 
'#		execute the test based upon that data.  The functions in this library
'#		perform the utility type operations that are not related to a GUI object and are
'# 		not project specific .
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
'***********************************************************************************************************************************
'Public Function ST_CustomReporting (Data,status,CurrentRow,ResultsFileObj)
'
'
'Select Case LCase(status)
'   Case "pass"'
'		 	pass_msg="Spreadsheet: " & TestName & VbCrLf & "Row: " & CurrentRow+1 & VbCrLf & "Expected value: " & VbCrLf & Data(4)& VbCrLf & "Matched actual value: " & VbCrLf & Actual
'			Reporter.ReportEvent micPass, Data(0) & "->" & Data(1) & "->" & Data(6), pass_msg
'
'  Case "fail"
'			fail_msg="Spreadsheet Row "&CurrentRow+1 & VbCrLf & "Expected value: " & VbCrLf & Data(4) & VbCrLf & "Did not match actual value: "& VbCrLf & Actual
'			Reporter.ReportEvent micFail, Data(0) & "->" & Data(1) & "->" & Data(6), fail_msg
'			
'			ResultsFileObj.WriteLine (CurrentRow+1&Chr(9)&"Expected: "&Data(4))
'			ResultsFileObj.WriteLine (Chr(9)&"Actual  : "&Actual)
'
'			ErrorFlag=True
'
'  Case Else
'		Reporter.ReportEvent micFail, ReportStepName, "Custom Reporting error- Invalid pass/fail status!"
'
' End Select
'
'End Function


'************************************************************************************************************************

'Public Function CreateResultsFile(ResDir,TestName)
'   Dim ResultsFSO, ResultsFile, ResultsFileObj
'   Const ForReading = 1, ForWriting = 2, ForAppending = 8
'  Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0
'   
'	Set ResultsFSO = CreateObject("Scripting.FileSystemObject")
'
'	If (ResultsFSO.FileExists(ResDir&"\"&TestName&".txt")) Then
'		Set ResultsFile = ResultsFSO.GetFile(ResDir&"\"&TestName&".txt")
'		Set ResultsFileObj = ResultsFile.OpenAsTextStream(ForAppending, TristateUseDefault)
'	Else
'		ResultsFSO.CreateTextFile ResDir&"\"&TestName&".txt", False
'		Set ResultsFile = ResultsFSO.GetFile(ResDir&"\"&TestName&".txt")
'		Set ResultsFileObj = ResultsFile.OpenAsTextStream(ForAppending, TristateUseDefault)
'	End If
' 
'   ResultsFileObj.WriteLine("Test: "&Testname)
'   ResultsFileObj.WriteLine("Run on: "& Now)
'   ResultsFileObj.WriteBlankLines(1) 
'   ResultsFileObj.WriteLine ("Step"&Chr(9)&"Error") 
'   ResultsFileObj.WriteLine ("----"&Chr(9)&"-----------------------------------------------------------------------") 
'   Set CreateResultsFile = ResultsFileObj
'End Function

'************************************************************************************************************************

'Public Function CloseResultsFile(ResultsFileObj,ErrorFlag)
'	If ErrorFlag <> True Then
'	   ResultsFileObj.WriteLine(Chr(9)&"Test passed - No errors.")
'	End If
'	ResultsFileObj.WriteBlankLines(3) 
'	ResultsFileObj.Close
'End Function
'
'Public Function CaptureBitmap(Data,CurrentRow,ResDir)
'msgbox ResDir
'bitmapname = Split(TestName,".",-1,1) & "Row- " & CurrentRow+1 & ".png"
'msgbox bitmapname	
'Browser(Data(0)).Page(Data(1)).CaptureBitmap(bitmapname)
'End Function

'************************************************************************************************************************
function parseData4(DataVal)
	parseData4 = Split(DataVal,"###",-1,1)
End function

'************************************************************************************************************************
'Function Name - FindTableRowByCellContent
'
'Function Description - This function returns the row number of a webtable given cellcontent and the column to search
'
'Input Param 
'     GuiObjRef
'     SearchTerm
'     SearchColumn
'
'Return Value
'     Row number if valid row was found. else returns a zero.
'
'Change History
'
'Functions affected
'     WebTable_ClickOnImageInCell
'     WebTable_ClickOnLinkInCell
'     WebTable_ClickOnButtonInCell
'     WebTable_EnterDataInCell
'
Function FindTableRowByCellContent(GUIObjRef,SearchTerm,SearchColumn,WebTableName)
	isFound = False
	e_Method = "RowCount"
	e_Command = "rCount=" & GUIObjRef & e_Method 
	Execute (e_Command)

	For iRow=1 to rCount
		e_method = "GetCellData(iRow,SearchColumn)"	
		e_Command = "cellData=RTrim(" & GUIObjRef & e_Method & ")"
		Execute (e_Command)
		'If trim(lcase(cellData)) = trim(lcase(SearchTerm)) Then
		If 0 <> InStr(1,trim(lcase(cellData)),trim(lcase(SearchTerm))) Then
			isFound = True
			FindTableRowByCellContent = iRow
		End If
	Next
	If isFound = False Then
		FindTableRowByCellContent = 0
	End If
End Function
'************************************************************************************************************************
Set storeData = CreateObject("Scripting.Dictionary")
'Function Name - SetVariable
'
'Function Description - This function stores run-time data in memory.
'
'Input Param 
'     VariableName
'     Value
'
'Return Value
'     none
'
'Change History
'
'
Function SetVariable (iKey,iVal)
	storeData.Item(iKey) = iVal
End Function
'************************************************************************************************************************
'Function Name - GetVariable
'
'Function Description - This function retrieves run-time data stored in memory using the servariable function.
'
'Input Param 
'     VariableName
'
'Return Value
'     VariableValue
'
'Change History
'
'
Function GetVariable (iKey)
	GetVariable = storeData.Item(iKey)
End Function
'************************************************************************************************************************
Sub generateTestStep (Status, StepName,StepDesc)
	If Status = "Pass" Then
		Reporter.ReportEvent micPass, StepName, StepDesc
	ElseIf Status = "Fail" then
		Reporter.ReportEvent micFail, StepName, StepDesc
	ElseIf Status = "Warning" Then
		Reporter.ReportEvent micWarning, StepName, StepDesc
	Else
		Reporter.ReportEvent micDone, StepName, StepDesc
	End If
End Sub
'************************************************************************************************************************