'#####################################################################################
'#		PEDAL - Portable Event-Driven Automation Library
'#		SpeedTest, Inc. copyright 2009
'#		If you have any questions or need support,
'#		contact:
'#				SpeedTest Inc.
'#				7017 Eden Mill Road  Woodbine, MD 21797
'#				410-627-7373, info@speedtestinc.com
'#
'#      This code is the property of SpeedTest Inc. and is conveyed tas a  component
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
'********************************************************************************************************************************************
Public Function ProjFunc_Handler (Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	'GUIObjRef = GUIObjRef & "Link(Data(5))."
	GUIObjRef = GUIObjRef & Data(6) & "(Data(5))."

	Select Case LCase(Data(6))
		Case "projfunc_cai_login"
				wait(5)
			status = caIntegrator_Login(Data,CurrentRow,ResultsFileObj)
       Case "projfunc_cai_loginverify"
			status = caIntegrator_LoginVerify(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_logout"
			status = caIntegrator_Logout(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_logoutverify"
			status = caIntegrator_LogoutVerify(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_selectastudy"
			status = caIntegrator_selectAstudy(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_managestudies"
			status = caIntegrator_ManageStudies(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_viewstudylog"
			status = caIntegrator_viewStudyLog(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_editstudylog"
			status = caIntegrator_EditStudyLog(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_createnewstudyoverview"
			status = caIntegrator_createNewStudyOverview(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_addstudylogo"
			status = caIntegrator_addStudyLogo(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_annotationgroups"
			status = caIntegrator_AnnotationGroups(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_subjectannotationdatasource"
			status = caIntegrator_SubjectAnnotationDataSource(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_genomicdatasources"
			status = caIntegrator_GenomicDataSources (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_definefieldsforsubjectdata"
			status = caIntegrator_defineFieldsForSubjectData(Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_imagingdatasources"
			status = caIntegrator_ImagingDataSources (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_cai_externallinks"
			status = caIntegrator_ExternalLinks (Data,CurrentRow, ResultsFileObj)
		Case "projfunc_cai_deploystudy"
			status = caIntegrator_deployStudy(Data,CurrentRow, ResultsFileObj)
		Case "projfunc_cai_verifystudydeployment"
			status = caIntegrator_verifyStudyDeployment(Data,CurrentRow, ResultsFileObj)
		Case "projfunc_cai_survivalvalues"
			status = caIntegrator_SurvivalValues (Data,CurrentRow,ResultsFileObj)
		Case  "projfunc_cai_deletestudiesbyrange"
			status = cai_DeleteStudiesbyRange(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_selectplatform"
			status=cai_selectplatform(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_load_platforms_affy_gene_exp"
			status = cai_Load_platforms_Affy_Gene_EXP(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_verify_platforms_affy_gene_exp"
			status = cai_verify_platforms_affy_gene_exp(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_load_platforms_affy_copynumber"
			status=cai_Load_platforms_affy_copynumber(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_clk_btn_create_pltform"
			status=cai_Clk_btn_create_pltform(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_verify_platforms_affy_gene_exp"
			status = cai_verify_platforms_affy_gene_exp(Data,CurrentRow, ResultsFileObj)
		Case  "projfunc_cai_load_platforms_agilent_gene_exp"
			status= cai_Load_platforms_agilent_gene_exp(Data,CurrentRow, ResultsFileObj)
		Case "projfunc_cai_definequerycriteria"
			status = cai_DefineQueryCriteria (Data,CurrentRow, ResultsFileObj)
		Case "projfunc_cai_defineresulttype"
			status = cai_DefineResultType (Data,CurrentRow, ResultsFileObj)
		Case "projfunc_cai_actiononqueryresults"
			status = cai_ActionOnQueryResults (Data,CurrentRow, ResultsFileObj)	
		case   "projfunc_cai_set_env"
			status = cai_set_env(Data,CurrentRow, ResultsFileObj)
		case "projfunc_cai_pub_gen_obj_verify"
			status= cai_Pub_Gen_obj_verify(Data,CurrentRow, ResultsFileObj)	
		case "projfunc_cai_invest_gen_obj_verify"
			status= cai_invest_gen_obj_verify(Data,CurrentRow, ResultsFileObj)			
		Case Else
 			Reporter.ReportEvent micFail, Data(5), "The object type was not found!"
	End Select
	ProjFunc_Handler = status
End Function
'**********************************************************************************************************************************************************
'					caINTEGRATOR PROJECT SPECIFIC FUNCTIONS										  '
'						VIVEK RAMANI												  '
'**********************************************************************************************************************************************************
Function caIntegrator_verifyHomePage (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) NONE
	'********************************************************************************************
	If lcase(Environment.Value("type")) = "ie" Then
		If (Browser(Data(0)).Page(Data(1)).Object.title = "Certificate Error: Navigation Blocked") Then
			Browser(Data(0)).Page(Data(1)).Link("certificate_continue").Click
			If (Browser(Data(0)).Page(Data(1)).Object.title = "caIntegrator") Then
				caIntegrator_verifyHomePage= "Pass"
			Else
				caIntegrator_verifyHomePage= "Fail"
			End If
		End If
	ElseIf lcase(Environment.Value("type")) = "ff" Then
	End If
End Function
'************************************************************************************************************************
Public Function caIntegrator_Login(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) USERNAME
	'2) PASSWORD	
	'********************************************************************************************
	Call caIntegrator_verifyHomePage (Data,CurrentRow,ResultsFileObj)
	funcArg = parseData4(Data(4))
	If (0 <> instr(1,funcArg(0),"{")) and (0 <> instr(len(funcArg(0)),funcArg(0),"}")) Then
		str1 = mid(funcArg(0),2,len(funcArg(0))-2)
		username = Environment.Value(str1)
	Else
		username = funcArg(0)
		
	End If

	If (0 <> instr(1,funcArg(1),"{")) and (0 <> instr(len(funcArg(1)),funcArg(1),"}")) Then
		str2 = mid(funcArg(1),2,len(funcArg(1))-2)
		password = Environment.Value(str2)
	Else
		password = funcArg(1)
	End If

	'set username
	Data(6) = "WebEdit"
	Data(5) = "j_username"
	Data(4) = username
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	'set password
	Data(6) = "WebEdit_secure"
	Data(5) = "j_password"
	Data(4) = password
	Data(3) = "enter"
	s = ST_ObjectHandler (Data,CurrentRow,ResultsFileObj)

	Data(6) = "webbutton"
	Data(5) = "Login"
	Data(3) = "click"
	ST_ObjectHandler Data,CurrentRow,ResultsFileObj	

	caIntegrator_Login = "Done"
End Function
'************************************************************************************************************************
Public Function caIntegrator_LoginVerify(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE	
	'********************************************************************************************
	Browser(Data(0)).Page(Data(1)).Sync
	Data(6) = "Link"
	Data(5) = "Logout"
	Data(4) = "Logout"
	Data(3) = "verify"
	var_Exist = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	If (var_Exist = "Pass") Then
		ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micPass,"Verify Login","Login verification successful"
		caIntegrator_LoginVerify = "Pass"
	Else
		caIntegrator_LoginVerify = "Fail"
	End If
End Function
'************************************************************************************************************************
Public Function caIntegrator_Logout(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE	
	'********************************************************************************************
	Data(6) = "Link"
	Data(5) = "Logout"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	caIntegrator_Logout = "Done"

End Function
'************************************************************************************************************************
Public Function caIntegrator_LogoutVerify(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE	
	'********************************************************************************************
	Data(6) = "Link"
	Data(5) = "Login"
	Data(4) = "Login"
	Data(3) = "verify"
	var_Exist = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	If (var_Exist = "Pass") Then
		ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micPass,"Verify Logout","Logout Verification successful"
		caIntegrator_LogoutVerify = "Pass"
	Else
		caIntegrator_LogoutVerify = "Fail"
	End If
End Function
'************************************************************************************************************************
Public Function caIntegrator_selectAstudy(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) STUDY NAME
	'********************************************************************************************
	funcArg = parseData4(Data(4))
	Data(6) = "WebList"
	Data(5) = "currentStudySubscriptionId"
	Data(4) = funcArg(0)
	Data(3) = "select"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "WebElement"
	Data(5) = "outertext:=Welcome to " & funcArg(0)
	Data(4) = "Welcome to " & funcArg(0)
	Data(3) = "verify"
	verify_Exist = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If (verify_Exist = "Pass" )Then
		ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micPass,"Verify Study home page","Verification successful"
		caIntegrator_selectAstudy = "Pass"
	Else
		caIntegrator_selectAstudy = "Fail"
	End If
End Function
'************************************************************************************************************************
Public Function caIntegrator_manageStudies(Data,CurrentRow, ResultsFileObj)
'Navigate to the manage studies page
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) STUDY NAME
	'ACTION : EDIT / DELETE
	'********************************************************************************************
	StudyName = parseData4(Data(4))(0)
	sAction = Data(3) 'Get the action - Edit or Delete

	SetVariable "StudyName", StudyName

	'Click on the Manage Studies link	
	Data(6) = "Link"
	Data(5) = "Manage Studies"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	wait(5) ' wait for the table to get populated

	
	Data(1) = "caIntegrator - Manage Studies"
	Data(4) = "class:=Data###" & StudyName & "###" & sAction
	Data(5) = "WebTable_ClickOnLinkInCell"
	Data(6) = "keyword"
	Data(7) = "1"
	Data(8) = "7"
	clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	If clickStatus = "Pass" or clickStatus = "Done" then
		Reporter.ReportEvent micPass, "caIntegrator_manageStudies", "Selected the study " & StudyName & " from the list for " & sAction	
		caIntegrator_manageStudies = "Pass"
	Else
		Reporter.ReportEvent micFail, "caIntegrator_manageStudies", "Unable to select the study " & StudyName & " from the list for " & sAction	& ". Operation failed."
		caIntegrator_manageStudies = "Fail"
	End If
End Function
'************************************************************************************************************************
Public Function caIntegrator_viewStudyLog(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE
	'********************************************************************************************
	Data(6) = "Link"
	Data(5) = "View Log"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Browser(Data(0)).Sync

	Data(6) = "WebElement"
	Data(5) = "outertext:=View/Edit Study Log"
	Data(4) = "View/Edit Study Log"
	Data(3) = "verify"
	verify_Exist = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If verify_Exist = "Pass" Then
		ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micPass,"View Log page", "View log page is displayed"
		status = "Pass"
	Else
		ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micFail,"View Log page", "Error in displaying View log page"
		status = "Fail"
	End If

	Data(1) = "caIntegrator - View/Edit studyLog"
	Data(6) = "WebButton"
	Data(5) = "Cancel"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Browser(Data(0)).Page("caIntegrator - Edit Study").Sync

	caIntegrator_viewStudyLog = status
End Function
'************************************************************************************************************************
Public Function caIntegrator_EditStudyLog(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) UPDATE CHECKBOX (ON / OFF)
	'ACTION: 1) SAVE
'	'	 2) CANCEL
	'********************************************************************************************
	Randomize
	sAction = Data(3)
	sUpdate = parseData4(Data(4))(0)
	Data(1) = "caIntegrator - Edit Study"
	Data(6) = "Link"
	Data(5) = "Edit Log"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Browser(Data(0)).Sync

	Set oTextArea = Description.Create()
	oTextArea("micclass").Value = "WebEdit"
	oTextArea("name").Value = "displayableLogEntries\[[0-9]*\].description"
	oTextArea("html tag").Value = "textarea"

	Set taChildren = Browser(Data(0)).Page("caIntegrator - View/Edit studyLog").ChildObjects(oTextArea)

	noOfEditFields = taChildren.Count
	myRandomEditField = Int((noOfEditFields * Rnd) + 1)

	taChildren(myRandomEditField-1).Set "QTP Test for editing description field in the Edit Log screen"

	Set oCheckBox = Description.Create()
	oCheckBox("micclass").Value = "WebCheckBox"
	oCheckBox("name").Value = "displayableLogEntries\[[0-9]*\].updateDescription"
	oCheckBox("html tag").Value = "input"

	Set cbChildren = Browser(Data(0)).Page("caIntegrator - View/Edit studyLog").ChildObjects(oCheckBox)
	cbChildren(myRandomEditField-1).Set sUpdate

	Select Case sAction
		Case "Save"
			Data(1) = "caIntegrator - View/Edit studyLog"
			Data(6) = "WebButton"
			Data(5) = "Save"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Browser(Data(0)).Sync
			status = validateEdit (Data,oTextArea,myRandomEditField,sAction,sUpdate,oCheckBox)
		Case "Cancel"
			Data(1) = "caIntegrator - View/Edit studyLog"
			Data(6) = "WebButton"
			Data(5) = "Cancel"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Browser(Data(0)).Sync
			status = validateEdit (Data,oTextArea,myRandomEditField,sAction,sUpdate,oCheckBox)
	End Select
	caIntegrator_EditStudyLog = status
End Function
'************************************************************************************************************************
Function validateEdit(Data,oTextArea,myRandomEditField,sAction,sUpdate,oCheckBox)
	Data(1) = "caIntegrator - Edit Study"
	Data(6) = "Link"
	Data(5) = "Edit Log"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Browser(Data(0)).Sync

	Set taChildren = Browser(Data(0)).Page("caIntegrator - View/Edit studyLog").ChildObjects(oTextArea)
	descFieldValue = taChildren(myRandomEditField-1).GetROProperty("value")
	Set cbChildren = Browser(Data(0)).Page("caIntegrator - View/Edit studyLog").ChildObjects(oCheckBox)

	If (sAction = "Save" and sUpdate = "ON") Then
		If  trim(descFieldValue) = "QTP Test for editing description field in the Edit Log screen" Then
			ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micPass, "Verifying Edit Log", "Updated description is saved successfully. The following were the conditions: Action -  " & sAction & ", Update - " & sUpdate
			'taChildren(myRandomEditField-1).Set ""
			'cbChildren(myRandomEditField-1).Set "ON"
			Data(1) = "caIntegrator - View/Edit studyLog"
			Data(6) = "WebButton"
			Data(5) = "Cancel"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			validateEdit = "Pass"
			Exit Function		
					
		Else
			ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micFail, "Verifying Edit Log", "Updated description is not saved successfully. The following were the conditions: Action -  " & sAction & ", Update - " & sUpdate
			status = "Fail"
		End If
	ElseIf (sAction = "Save" and sUpdate = "OFF") or (sAction = "Cancel") Then
		If  descFieldValue = "QTP Test for editing description field in the Edit Log screen" Then
			ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micFail, "Verifying Edit Log", "The edited description got saved even though the Update checkbox was unchecked. The following were the conditions: Action -  " & sAction & ", Update - " & sUpdate
			status = "Fail"
		Else
			ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micPass, "Verifying Edit Log", "Edited description was not saved successfully. The following were the conditions: Action -  " & sAction & ", Update - " & sUpdate 
			status = "Pass"
		End If		
	End If
	Data(1) = "caIntegrator - View/Edit studyLog"
	Data(6) = "WebButton"
	Data(5) = "Cancel"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	Browser(Data(0)).Sync
	validateEdit = status
End Function

'************************************************************************************************************************
Public Function caIntegrator_createNewStudyOverview(Data, CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) NEW STUDY NAME
	'2) NEW STUDY DESCRIPTION
	'3) PUBLIC ACCESS CHEKBOX (ON/OFF)
	'ACTION: 1) SAVE
	'	 2) CANCEL
	'********************************************************************************************
	funcArg = parseData4(Data(4))
	newStudyName = funcArg(0)
	newStudyDesc = funcArg(1)
	isPublicAccess = funcArg(2)

	sAction = Data(3)

	Data(1) = "caIntegrator - Edit Study"
	Data(6) = "Link"
	Data(5) = "Create New Study"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	
	Data(1) = "caIntegrator - New Study"
	Data(6) = "WebEdit"
	Data(5) = "studyName"
	Data(4) = newStudyName
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)



	Data(1) = "caIntegrator - New Study"
	Data(6) = "WebEdit"
	Data(5) = "studyDesc"
	Data(4) = newStudyDesc
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


	Data(1) = "caIntegrator - New Study"
	Data(6) = "webcheckbox"
	Data(5) = "publicAccessible"
	Data(4) = isPublicAccess
	If lcase(Data(4)) = "on" then
		Data(3) = "check"
	Else
		Data(3) = "uncheck"
	End If
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


	Select Case sAction
		Case "Save"
			Data(1) = "caIntegrator - New Study"
			Data(6) = "WebButton"
			Data(5) = "Save"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Browser(Data(0)).Sync
			status = verify_CreateStudy (Data,newStudyName,newStudyDesc)
		Case "Cancel"
			Data(1) = "caIntegrator - New Study"
			Data(6) = "Link"
			Data(5) = "Cancel"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			var_Exist = Browser(Data(0)).Page("caIntegrator - New Study").Exist
			If var_Exist = "False" Then
				Reporter.ReportEvent micPass,"New Study Overview","Study cancelled successfully. New study not created"
			Else
				status = "Fail"	
			End If
		Case Else
			ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micFail,"Action ","Action '" & sAction & "' not an option"
			status = "Fail"
	End Select
	caIntegrator_createNewStudyOverview = status
End Function
'************************************************************************************************************************
Function verify_CreateStudy(Data,newStudyName,newStudyDesc)
	If newStudyName <> ""  Then
		Data(1) = "caIntegrator - New Study"
		Data(6) = "WebElement"
		Data(5) = "outertext:=Duplicate Study Name: "& newStudyName
		Data(4) = "Duplicate Study Name: "& newStudyName
		Data(3) = "verify"

		verify_Error2 = Browser(Data(0)).Page("caIntegrator - New Study").WebElement("outertext:=Duplicate Study Name: "& newStudyName).Exist
		If verify_Error2 = "False" Then 
			Data(1) = "caIntegrator - Edit Study"
			Data(6) = "WebEdit"
			Data(5) = "studyConfiguration.study.short"
			Data(4) = newStudyName
			Data(3) = "verify"
			compare = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			If (compare = "Pass") Then
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				Reporter.ReportEvent micPass,"Create new Study","Study name verified after creation"
				SetVariable "StudyName", newStudyName
			Else
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				Reporter.ReportEvent micFail,"Create new Study","Study name verification failed. Name appeared as  " & createdStudyName & ". Expected "& newStudyName
			End If
			Data(1) = "caIntegrator - Edit Study"
			Data(6) = "WebEdit"
			Data(5) = "studyConfiguration.study.longT"
			Data(4) = newStudyDesc
			Data(3) = "verify"
			compare = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			If (compare = "Pass") Then
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				Reporter.ReportEvent micPass,"Create new Study","Study description verified after creation"
			Else
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				Reporter.ReportEvent micFail,"Create new Study","Study description verification failed"
			End If
			status = "Pass"
		Else
			ST_CustomReporting Data,"Warning",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micWarning,"Create new Study","Duplicate study name detected"
			status = "Fail"
		End If
	Else
		Data(1) = "caIntegrator - New Study"
		Data(6) = "WebElement"
		Data(5) = "outertext:=Study Name is required."
		Data(4) = "Study Name is required."
		Data(3) = "verify"

		verify_Error1 = Browser(Data(0)).Page("caIntegrator - New Study").WebElement("outertext:=Study Name is required.").Exist
		If verify_Error1 = "True" Then 
			ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micPass,"Create new Study","Study not created due to missing study name. verification successful"
			status = "Pass"
		Else
			ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
			Reporter.ReportEvent micFail,"Create new Study","Expected error message did not appear. verification failed!"
			status = "Fail"
		End If
	End If
	verify_CreateStudy = status
End Function
'************************************************************************************************************************
Public Function caIntegrator_addStudyLogo(Data,CurrentRow,ResultsFileObj)
	'********************************************
	rootDir= Environment("AUTRoot")
	Set filesys = CreateObject("Scripting.FileSystemObject")
	parentFldr = filesys.GetParentFolderName(rootDir)
	parentFldr = filesys.GetParentFolderName(parentFldr)
	'********************************************
	'Upload image for study logo
	'********************************************************************************************
	'THE ARGUMENT FOR THE FUNCTION IS AS FOLLOWS (DATA(4) VALUE FIELD):
	'1) STUDY LOGO FILE NAME	
	'********************************************************************************************
	studyLogoFilename = parseData4(Data(4))(0)

	If (0 = InStr(1,studyLogoFilename,"\\",1)) Then
		StudyLogoFileName = parentFldr & "\" & studyLogoFilename
	End If

	If lcase(Environment.Value("type")) = "ie" Then
		Data(1) = "caIntegrator - Edit Study"
		Data(6) = "webfile"
		Data(5) = "studyLogoFile"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		Data(1) = "Choose file"
		Data(6) = "winedit"
		Data(5) = "File name:"
		Data(4) = StudyLogoFileName
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


		Data(1) = "Choose file"
		Data(6) = "WinButton"
		Data(5) = "Open"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	ElseIf lcase(Environment.Value("type")) = "ff" Then
		Data(1) = "caIntegrator - Edit Study"
		Data(6) = "webfile"
		Data(5) = "studyLogoFile"
		Data(4) = StudyLogoFileName
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	End If


	Data(1) = "caIntegrator - Edit Study"
	Data(6) = "Image"
	Data(5) = "Add Study Logo"
	Data(3) = "click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	Set filesys = Nothing

	Browser(Data(0)).Sync
	If "Study Logo" = Browser(Data(0)).Page(Data(1)).Image("file name:=retrieveStudyLogoPreview.action").GetROProperty("alt") Then
		Reporter.ReportEvent micPass,"Verify Study Logo", "Study Logo found"
		caIntegrator_addStudyLogo = "Pass"
	Else
		Reporter.ReportEvent micFail,"Verify Study Logo", "Study Logo not found"
		caIntegrator_addStudyLogo = "Fail"
	End If
End Function
'************************************************************************************************************************
Public Function caIntegrator_AnnotationGroups(Data,CurrentRow,ResultsFileObj)
	'********************************************
	rootDir= Environment("AUTRoot")
	Set filesys = CreateObject("Scripting.FileSystemObject")
	parentFldr = filesys.GetParentFolderName(rootDir)
	parentFldr = filesys.GetParentFolderName(parentFldr)
	'********************************************
	isFound = False
	ActionTerm = Data(3)
	Select Case lcase(ActionTerm)
		Case "add"
			'********************************************************************************************			
			'THE ARGUMENTS FOR THE THE ADD ACTION ARE AS FOLLOWS (DATA(4) VALUE FIELD):
			'1) GROUP NAME
			'2) GROUP DESCRIPTION
			'3) ANNOTATION GROUP FILE NAME
			'4) NUMBER OF ANNOTATIONS IN THE FILE
			'********************************************************************************************			
			funcArg = parseData4(Data(4))
			sGroupName = funcArg(0)
			sDescription = funcArg(1)
			AnnotationGrpFileName = funcArg(2)
			NoOfAnnotations_e = funcArg(3)

			If (0 = InStr(1,AnnotationGrpFileName,"\\",1)) Then
				sAnnotationGrpFileName = parentFldr & "\" & AnnotationGrpFileName
			Else
				sAnnotationGrpFileName = AnnotationGrpFileName
			End If		
			

			Data(1) = "caIntegrator - Edit Study"
			Data(6) = "Link"
			Data(5) = "Add New_annotationGroups"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
		
			Data(1) = "caIntegrator - Edit Annotation"
			Data(6) = "WebEdit"
			Data(5) = "groupName"
			Data(4) = sGroupName
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(6) = "WebEdit"
			Data(5) = "annotationGroup.description"
			Data(4) = sDescription
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		'	Data(6) = "WebFile"
		'	Data(5) = "annotationGroupFile"
		'	Data(4) = sAnnotationGrpFileName
		'	Data(3) = "enter"
		'	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then
	'Updated the WebFile fileupload functionality so that it works with IE 8 
				Data(1) = "caIntegrator - Edit Annotation"
				Data(6) = "webfile"
				Data(5) = "annotationGroupFile"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "winedit"
				Data(5) = "File name:"
				Data(4) = sAnnotationGrpFileName
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	
				Data(1) = "Choose file"
				Data(6) = "WinButton"
				Data(5) = "Open"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Data(1) = "caIntegrator - Edit Annotation"
				Data(6) = "webfile"
				Data(5) = "annotationGroupFile"
				Data(4) = sAnnotationGrpFileName
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If
	'end of update
			Data(1) = "caIntegrator - Edit Annotation"
			Data(6) = "WebButton"
			Data(5) = "Save"
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Set filesys = Nothing

			Browser(Data(0)).Sync
			Data(1) = "caIntegrator - Edit Study"
			rCount = Browser(Data(0)).Page(Data(1)).WebTable("Group Name").RowCount()
			For i=2 to rCount
				Data(7) = i
				Data(8) = 1
				Data(6) = "WebTable"
				Data(5) = "Group Name"
				Data(4) = sGroupName
				Data(3) = "Verify"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				If s = "Pass" Then
					isFound = True
					Reporter.ReportEvent micPass,"addNewAnnotation", "Group name is verified",ImageBitmap

					Data(8) = 2
					Data(6) = "WebTable"
					Data(5) = "Group Name"
					Data(4) = sDescription
					Data(3) = "Verify"
					If ("Pass" = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)) Then
						Reporter.ReportEvent micPass,"addNewAnnotation", "Group description is verified"
					Else
						Reporter.ReportEvent micFail,"addNewAnnotation", "Group description verification failed"
					End If

					Data(8) = 3
					Data(6) = "WebTable"
					Data(5) = "Group Name"
					Data(4) = NoOfAnnotations_e
					Data(3) = "Verify"
					If ("Pass" = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)) Then
						Reporter.ReportEvent micPass,"addNewAnnotation", "Number of annotations is  verified as expected"
					Else
						Reporter.ReportEvent micFail,"addNewAnnotation", "Number of annotations verification failed"
					End If
					caIntegrator_AnnotationGroups = "Pass"
					Exit For
				End If
			Next
			If isFound = False Then
				Reporter.ReportEvent micFail,"addNewAnnotation", "Group name verification failed"
				caIntegrator_AnnotationGroups = "Fail"
			End If
		Case "delete"
			'********************************************************************************************			
			'THE ARGUMENTS FOR THE DELETE ACTION ARE AS FOLLOWS (DATA(4) VALUE FIELD):
			'1) ANNOTATION GROUP NAME
			'********************************************************************************************			
			annotationGrpName = parseData4(Data(4))(0)

			Data(1) = "caIntegrator - Edit Study"
			sAction = "Delete"
			Data(4) = "Group Name###" & annotationGrpName & "###" & sAction
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "1"
			Data(8) = "4"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			If ClickStatus = "Pass" Then
				If lcase(Environment.Value("type")) = "ie" Then 
					Data(1) = "Windows Internet Explorer"
					Data(6) = "WinButton"	
					Data(5) = "OK"
					Data(3) = "Click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				ElseIf lcase(Environment.Value("type")) = "ff" Then
					Browser(Data(0)).Dialog("The page").Page("The page").WebButton("OK").Click
				End If
				Data(1) = "caIntegrator - Edit Study"
				GUIObjRef = "Browser(Data(0)).Page(Data(1))."
				If Data(2) <> "" Then
					GUIObjRef = GUIObjRef & "Frame(Data(2))."
				End If		
				rNum = FindTableRowByCellContent (GUIObjRef,annotationGrpName, 1,"Group Name")
				If rNum <> 0 then
					Reporter.ReportEvent micFail,"Delete-AnnotationGroup", "Delete action failed"
					caIntegrator_AnnotationGroups = "Fail"
				Else
					Reporter.ReportEvent micPass,"Delete-AnnotationGroup", "Delete action successfull"
					caIntegrator_AnnotationGroups = "Pass"
				End If
			Else
				Reporter.ReportEvent micFail,"Delete-AnnotationGroup","Delete link not found for the group name " & annotationGrpName
				caIntegrator_AnnotationGroups = "Fail"
			End If
		Case Else
			Reporter.ReportEvent micFail, "caIntegrator_AnnotationGRoups", "Action Term " & ActionTerm & " not recognized"
			caIntegrator_AnnotationGroups = "Fail"
	End Select
End Function

'************************************************************************************************************************
Function caIntegrator_SubjectAnnotationDataSource(Data,CurrentRow,ResultsFileObj)
	'********************************************
	rootDir= Environment("AUTRoot")
	Set filesys = CreateObject("Scripting.FileSystemObject")
	parentFldr = filesys.GetParentFolderName(rootDir)
	parentFldr = filesys.GetParentFolderName(parentFldr)
	'********************************************	
	ActionTerm = Data(3)
	isFound = False
	Select Case lcase(ActionTerm)
		Case "add"
			'********************************************************************************************	
			'THE ARGUMENTS FOR DATA(4) VALUE FIELD ARE:
			'1) SUBJECT DATA SOURCE FILENAME
			'2) (CHECK/UNCHECK) to Create a new Annotation Definition if one is not found
			'PLEASE NOTE THAT THE COMPLETE STRING IS REQUIRED. THE FIRST WORD IS EITHER CHECK OR UNCHECK.
			'********************************************************************************************
			funcArg = parseData4(Data(4))
			If (0 = InStr(1,funcArg(0),"\\",1)) Then
				subjectDataSource = parentFldr & "\" & funcArg(0)
				subDesc = Split(subjectDataSource,"\",-1,1)

			Else
				subjectDataSource = funcArg(0)
				subDesc = Split(subjectDataSource,"\",-1,1)
			End If			
			e_subDesc = subDesc(ubound(subDesc))

			Data(1) = "caIntegrator - Edit Study"
			Data(6) = "Link"
			Data(5) = "Add New_subjectAnnotationDataSources"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		'	Data(6) = "WebFile"
		'	Data(5) = "clinicalFile"
		'	Data(4) = subjectDataSource
		'	Data(3) = "enter"
		'	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


			If lcase(Environment.Value("type")) = "ie" Then
	'Updated the WebFile fileupload functionality so that it works with IE 8
				Data(1) = "caIntegrator - Edit Study"
				Data(6) = "webfile"
				Data(5) = "clinicalFile"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "winedit"
				Data(5) = "File name:"
				Data(4) = subjectDataSource
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


				Data(1) = "Choose file"
				Data(6) = "WinButton"
				Data(5) = "Open"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Data(1) = "caIntegrator - Edit Study"
				Data(6) = "webfile"
				Data(5) = "clinicalFile"
				Data(4) = subjectDataSource
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If				
	'end of update
			Data(1) = "caIntegrator - Edit Study"
			Data(6) = "WebCheckBox"
			Data(5) = "createNewAnnotationDefinition"
			if trim(lcase(funcArg(1))) = "check to create a new annotation definition if one is not found" then
				Data(3) = "check"
			else	
				Data(3) = "uncheck"
			end if
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(6) = "Image"
			Data(5) = "Upload Now"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then
				Data(0) = "caIntegrator"
				Data(1) = "caIntegrator - Edit Study"
				Browser(Data(0)).Page(Data(1)).Sync
				WaitForProcessing (Data)

				Data(1) = "caIntegrator - Define Fields for Subject Data"
				Data(6) = "WebButton"
				Data(5) = "Save"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				If Browser(Data(0)).Page("caIntegrator - Define Fields for Subject Data").Exist(20) Then
					Data(1) = "caIntegrator - Define Fields for Subject Data"
					Data(6) = "WebButton"
					Data(5) = "Save"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				End If
			End If
			wait(10)

			Set filesys = Nothing
			Data(1) = "caIntegrator - Edit Study"
			Browser(Data(0)).Page(Data(1)).Sync

			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Type###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=1 to GetVariable("rCount")
				Data(8) = "2"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Type###sDesc"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				If lcase(trim(GetVariable("sDesc"))) = lcase(trim(e_subDesc)) Then
					isFound = True
					Exit For
				End If
			Next
			If isFound = True Then
				Reporter.ReportEvent micPass, "caIntegrator_SubjectAnnotationDataSource", "Subject Annotation Data Source added successfully"
				caIntegrator_SubjectAnnotationDataSource = "Pass"
			Else
				Reporter.ReportEvent micFail, "caIntegrator_SubjectAnnotationDataSource", "Adding a new Subject Annotation Data Source failed"
				caIntegrator_SubjectAnnotationDataSource = "Fail"
			End If

		Case "load"
			'********************************************************************************************			
			'NO DATA(4) VALUE ARGUMENT IS NEEDED. ONLY THE ACTION FIELD IS REQUIRED!!!!!
			'********************************************************************************************
			Data(4) = "Type###Load Subject Annotation Source###Load Subject Annotation Source"
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "5"
			Data(8) = "5"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then
				WaitForProcessing (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			ElseIf lcase(Environment.Value("type")) = "ff" Then 
				WaitForProcessing_ff (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			End If

			Data(8) = "3"
			Data(7) = GetVariable("rowNum")
			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Type###LoadStatus"
			Data(3) = "GetCellData"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If trim(GetVariable("LoadStatus")) = "Loaded" Then
				Reporter.ReportEvent micPass, "caIntegrator_SubjectAnnotationDataSource", "Subject annotation loaded successfully",ImageBitmap
				caIntegrator_SubjectAnnotationDataSource = "Pass"
			ElseIf trim(GetVariable("LoadStatus")) = "Error" Then
				Reporter.ReportEvent micFail, "caIntegrator_SubjectAnnotationDataSource", "Subject annotation failed to load successfully. The load status of " & GetVariable("LoadStatus") & " received!! ",ImageBitmap		
				caIntegrator_SubjectAnnotationDataSource = "Fail"
			End If
		Case "delete"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) DATA SOURCE NAME	
			'********************************************************************************************			
			SubjectDataSource = parseData4(Data(4))(0)
			Data(4) = "Type###" & SubjectDataSource & "###Delete"
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "2"
			Data(8) = "5"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			If lcase(Environment.Value("type")) = "ie" Then 
				Data(1) = "Windows Internet Explorer"
				Data(6) = "WinButton"	
				Data(5) = "OK"
				Data(3) = "Click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Browser(Data(0)).Dialog("The page").Page("The page").WebButton("OK").Click
			End If
			
			Data(1) = "caIntegrator - Edit Study"
			If lcase(Environment.Value("type")) = "ie" Then
				WaitForProcessing (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			ElseIf lcase(Environment.Value("type")) = "ff" Then 
				WaitForProcessing_ff (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			End If

			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Type###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=1 to GetVariable("rCount")
				Data(8) = "2"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Type###sDesc"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				If GetVariable("sDesc") = SubjectDataSource Then
					isFound = True
					Exit For
				End If
			Next
			If isFound = True Then
				Reporter.ReportEvent micFail, "caIntegrator_SubjectAnnotationDataSource", "Subject Annotation Data Source found even after being deleted!"
				caIntegrator_SubjectAnnotationDataSource = "Fail"
			Else
				Reporter.ReportEvent micPass, "caIntegrator_SubjectAnnotationDataSource", "Deleted the Subject Annotation Data Source " & SubjectDataSource & " successfully!"
				caIntegrator_SubjectAnnotationDataSource = "Pass"
			End If			
		Case Else
			Reporter.ReportEvent micFail, "caIntegrator_SubjectnnotationDataSource", "The Action " & ActionTerm & " is not supported"
			caIntegrator_SubjectAnnotationDataSource = "Fail"
	End Select
End Function
'************************************************************************************************************************
Function caIntegrator_defineFieldsForSubjectData(Data,CurrentRow,ResultsFileObj)
	Data(6) = "WebButton"
	If Data(3) = "Save" Then	
		Data(5) = "Save"
	Else
		Data(5) = "Cancel"
	End If
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
End Function
'************************************************************************************************************************
Function caIntegrator_GenomicDataSources (Data,CurrentRow,ResultsFileObj)
	'********************************************
	rootDir= Environment("AUTRoot")
	Set filesys = CreateObject("Scripting.FileSystemObject")
	parentFldr = filesys.GetParentFolderName(rootDir)
	parentFldr = filesys.GetParentFolderName(parentFldr)
	'********************************************	

	ActionTerm = Data(3)
	isFound = False
	Data(1) = "caIntegrator - Edit Study"
	Select Case lcase(ActionTerm )

	
		Case "edit", "add"
			
			'CLICK ON THE LINK ADD NEW TO ADD /EDIT THE GENOMIC DATA SOURCE
			'********************************************************************************************	
			'THE ARGUMENTS FOR DATA(4) VALUE FIELD ARE:
			'1) WebURL
			'2) PORT
			'3) caArray_USERNAME
			'4) caArray_PASSWORD
			'5) caArray_EXPERIMENT_ID
			'6) caArray_VENDOR
			'7) caArray_DATATYPE
			'8) caArray_PLATFORM
			'9) caArray_ARRAY_DATA_LOADING_TYPE
			'10) caArray_TECHNICAL_REPLICATES
			'11) caArray_STATISTICAL_VARIABILITY
			'12) caArray_STANDARD_DEVIATION
			'13) caArray_STANDARD_DEVIATION_THRESHOLD
			'********************************************************************************************
			Data(6) = "link"
			Data(5) = "Add New_genomicDataSources"	
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Browser(Data(0)).Sync
			Data(1) = "caIntegrator - Edit Genomic"

			funcArg = parseData4(Data(4))
			webURL = funcArg(0)
			hostname = split(funcArg(0),"/",-1,1)(2)
			hostname = split(hostname,":",-1,1)(0) ' Laxmi added to remove port from host
			port = funcArg(1)
			caA_username = funcArg(2)
			caA_password = funcArg(3)
			caA_expId = funcArg(4)
			caA_vendor = funcArg(5)
			caA_dataType = funcArg(6)
			caA_platform = funcArg(7)
			caA_loadingType = funcArg(8)
			caA_techReplicates = funcArg(9)
			caA_variance = funcArg(10)
			caA_stdDev = funcArg(11)
			caA_highVarianceThreshold = funcArg(12)

			'ENTER THE caARRAY WEB URL
			Data(6) = "WebEdit"
			Data(5) = "caArrayWebUrl"
			Data(4) = webURL
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			'ENTER THE HOSTNAME	
			Data(6) = "WebEdit"
			Data(5) = "HostName"
			Data(4) = hostname
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'ENTER THE PORT	
			Data(6) = "WebEdit"
			Data(5) = "JNDIPort"
			Data(4) = port
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'ENTER THE USERNAME	
			Data(6) = "WebEdit"
			Data(5) = "UserName"
			Data(4) = caA_username
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'ENTER THE PASSWORD	
			Data(6) = "WebEdit_Secure"
			Data(5) = "Password"
			Data(4) = caA_password
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'ENTER THE Experiment ID	
			Data(6) = "WebEdit"
			Data(5) = "experimentID"
			Data(4) = caA_expId
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'ENTER THE HIGH VARIANCE	
			Data(6) = "WebEdit"
			Data(5) = "highVarianceThreshold"
			Data(4) = caA_highVarianceThreshold
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'SELECT VENDOR
			Data(6) = "WebList"
			Data(5) = "platformVendor"
			Data(4) = caA_vendor
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'SELECT DATA TYPE
			Data(6) = "WebList"
			Data(5) = "dataType"
			Data(4) = caA_dataType
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			'SELECT PLATFORM
			Data(6) = "WebList"
			Data(5) = "platformName"
			Data(4) = caA_platform
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'SELECT ARRAY DATA LOADING TYPE
			Data(6) = "WebList"
			Data(5) = "ArrayDataLoadingType"
			Data(4) = caA_loadingType
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'SELECT TECHNICAL REPLICATES
			Data(6) = "WebList"
			Data(5) = "technicalReplicates"
			Data(4) = caA_techReplicates
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'SELECT STANDARD DEVIATION TYPE
			Data(6) = "WebList"
			Data(5) = "stdDeviationType"
			Data(4) = caA_stdDev
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'SELECT USE HIGN VARIANCE CHECKBOX
			Data(6) = "WebCheckBox"
			Data(5) = "useHighVariance"
			If "check" = caA_variance Then
				Data(3) = "check"
			else
				Data(3) = "uncheck"
			end If
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'CLICK SAVE TO SAVE THE CHANGES
			Data(6) = "WebButton"
			Data(5) = "Save"
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(1) = "caIntegrator - Edit Study"

			If lcase(Environment.Value("type")) = "ie" Then
				WaitForProcessing (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			ElseIf lcase(Environment.Value("type")) = "ff" Then 
				WaitForProcessing_ff (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			End If

			isFound = verify_GenomicDataSourceTable (Data,caA_expId,"Not Mapped")

			If isFound = True Then
				Reporter.ReportEvent micPass, "caIntegrator_GenomicDataSources", "Added / Edited Genomic Data Source successfully!!"
				caIntegrator_GenomicDataSources = "Pass"
			ElseIf isFound = False Then
				Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Add / Edit Genomic Data Source failed!!"
				caIntegrator_GenomicDataSources = "Fail"
			End If
		Case "configurecopynumberdata"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) caA_EXPERIMENT_ID	
			'2) ABSOLUTE PATH(UNC) OR RELATIVE PATH OF THE SUBJECT TO SAMPLE MAPPING FILE
			'3) USE CGHCALLS  (VALUE: TRUE OR FALSE)
			'4) CGHCALL URL
			'5) CALL LEVEL (VALUE: 3 OR 4)
			'6) caDNA COPY SERVICE URL
			'7) CHANGE POINT SIGNIFICANCE LEVEL
			'8) EARLY STOPPING CRITERION
			'9) PERMUTATION REPLICATES
			'10) RANDOM NUMBER SEED
			'********************************************************************************************		
			funcArg = parseData4(Data(4))

			caA_ExpId = funcArg(0)

			isFound = verify_GenomicDataSourceTable (Data,caA_expId,"Not Mapped")

			If isFound = True Then
				Data(4) = "Host Name###" & caA_ExpId & "###ConfigureCopyNumberData"
				Data(5) = "WebTable_ClickOnLinkInCell"
				Data(6) = "keyword"
				Data(7) = "2"
				Data(8) = "7"
				clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				
				Data(1) = "caIntegrator - Edit Copy Number Data"
				Browser(Data(0)).Page(Data(1)).Sync

				If (0 = InStr(1,funcArg(1),"\\",1)) Then
					subjectTosampleMapFile = parentFldr & "\" & funcArg(1)
				Else
					subjectTosampleMapFile = funcArg(1)
				End If

				If lcase(Environment.Value("type")) = "ie" Then
		'Updated the WebFile fileupload functionality so that it works with IE 8
					Data(6) = "webfile"
					Data(5) = "mappingFile"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

					Data(1) = "Choose file"
					Data(6) = "winedit"
					Data(5) = "File name:"
					Data(4) = subjectTosampleMapFile
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


					Data(1) = "Choose file"
					Data(6) = "WinButton"
					Data(5) = "Open"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				ElseIf lcase(Environment.Value("type")) = "ff" Then
					Data(6) = "webfile"
					Data(5) = "mappingFile"
					Data(4) = subjectTosampleMapFile
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				End If
	
	
				Data(1) = "caIntegrator - Edit Copy Number Data"
				Data(6) = "WebRadioGroup"
				Data(5) = "dnaAnalysisDataConfiguration.useCghCall"
				Data(4) = funcArg(2)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
				Data(6) = "WebEdit"
				Data(5) = "caCghCallUrl"
				Data(4) = funcArg(3)
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
				Data(6) = "WebRadioGroup"
				Data(5) = "numberLevelCall"
				Data(4) = funcArg(4)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
				Data(6) = "WebEdit"
				Data(5) = "caDnaCopyUrl"
				Data(4) = funcArg(5)
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
				Data(6) = "WebEdit"
				Data(5) = "dnaAnalysisDataConfiguration.changePointSignificanceLevel"
				Data(4) = funcArg(6)
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	

				Data(6) = "WebEdit"
				Data(5) = "dnaAnalysisDataConfiguration.earlyStoppingCriterion"
				Data(4) = funcArg(7)
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	

				Data(6) = "WebEdit"
				Data(5) = "dnaAnalysisDataConfiguration.permutationReplicates"
				Data(4) = funcArg(8)
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	
				Data(6) = "WebEdit"
				Data(5) = "dnaAnalysisDataConfiguration.randomNumberSeed"
				Data(4) = funcArg(9)
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "WebButton"
				Data(5) = "Save Segmentation Data"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "caIntegrator - Edit Study"

				Set filesys = Nothing

				Browser(Data(0)).Page(Data(1)).Sync

				If lcase(Environment.Value("type")) = "ie" Then
					WaitForProcessing (Data)
					Browser(Data(0)).Page(Data(1)).Sync
				ElseIf lcase(Environment.Value("type")) = "ff" Then 
					WaitForProcessing_ff (Data)
					Browser(Data(0)).Page(Data(1)).Sync
				End If

				isFound = False
				isFound = verify_GenomicDataSourceTable (Data,caA_expId,"Ready to be loaded")
				If isFound = True Then
					Reporter.ReportEvent micPass, "caIntegrator_GenomicDataSources", "Configuring Copy Number data completed successfully!!"
					caIntegrator_GenomicDataSources = "Pass"
				ElseIf isFound = False Then
					Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Configuring Copy Number data failed!!"
					caIntegrator_GenomicDataSources = "Fail"
				End If
			Else
				Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Error occured: Either the Experiment " & caA_ExpId & " is not found or the status field does not have the Not Mapped status.Status found is " & GetVariable("aStatus") 
				caIntegrator_GenomicDataSources = "Fail"
			End If			
		Case "map"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) caA_EXPERIMENT_ID	
			'2) ABSOLUTE PATH(UNC) OR RELATIVE PATH OF THE SUBJECT TO SAMPLE MAPPING FILE
			'3) ABSOLUTE PATH (UNC) OR RELATIVE PATH OF THE CONTROL FILE
			'********************************************************************************************	
			caA_expId = parseData4(Data(4))(0)

			If (0 = InStr(1,parseData4(Data(4))(1),"\\",1)) Then
				subjectTosampleMapFile = parentFldr & "\" & parseData4(Data(4))(1)
			Else
				subjectTosampleMapFile = parseData4(Data(4))(1)
			End If	

			If (0 = InStr(1,parseData4(Data(4))(2),"\\",1)) Then
				controlSampleFile = parentFldr & "\" & parseData4(Data(4))(2)
			Else
				controlSampleFile = parseData4(Data(4))(2)
			End If	

			
			isFound = verify_GenomicDataSourceTable (Data,caA_expId,"Not Mapped")

			if isFound = True Then
				Data(4) = "Host Name###" & caA_ExpId & "###Map Samples"
				Data(5) = "WebTable_ClickOnLinkInCell"
				Data(6) = "keyword"
				Data(7) = "2"
				Data(8) = "7"
				clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)			

				Data(1) = "caIntegrator - Edit Sample"
				Browser(Data(0)).Page(Data(1)).Sync
				
			'	Data(6) = "WebFile"
			'	Data(5) = "sampleMappingFile"
			'	Data(4) = subjectTosampleMapFile
			'	Data(3) = "enter"
			'	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	

				If lcase(Environment.Value("type")) = "ie" Then
		'Updated the WebFile fileupload functionality so that it works with IE 8
					Data(1) = "caIntegrator - Edit Sample"
					Data(6) = "webfile"
					Data(5) = "sampleMappingFile"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

					Data(1) = "Choose file"
					Data(6) = "winedit"
					Data(5) = "File name:"
					Data(4) = subjectTosampleMapFile
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


					Data(1) = "Choose file"
					Data(6) = "WinButton"
					Data(5) = "Open"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				ElseIf lcase(Environment.Value("type")) = "ff" Then
					Data(1) = "caIntegrator - Edit Sample"
					Data(6) = "webfile"
					Data(5) = "sampleMappingFile"
					Data(4) = subjectTosampleMapFile
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				End If				
		'end of update
				Data(1) = "caIntegrator - Edit Sample"
				Data(6) = "WebEdit"
				Data(5) = "controlSampleSetName"
				Data(4) = "myControl"
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'	Data(6) = "WebFile"
			'	Data(5) = "controlSampleFile"
			'	Data(4) = controlSampleFile
			'	Data(3) = "enter"
			'	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				If lcase(Environment.Value("type")) = "ie" Then
		'Updated the WebFile fileupload functionality so that it works with IE 8
					Data(1) = "caIntegrator - Edit Sample"
					Data(6) = "webfile"
					Data(5) = "controlSampleFile"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

					Data(1) = "Choose file"
					Data(6) = "winedit"
					Data(5) = "File name:"
					Data(4) = controlSampleFile
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	
					Data(1) = "Choose file"
					Data(6) = "WinButton"
					Data(5) = "Open"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				ElseIf lcase(Environment.Value("type")) = "ff" Then
					Data(1) = "caIntegrator - Edit Sample"
					Data(6) = "webfile"
					Data(5) = "controlSampleFile"
					Data(4) = controlSampleFile
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				End If
		'end of update
				Data(1) = "caIntegrator - Edit Sample"
				Data(6) = "WebButton"
				Data(5) = "Map Samples"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "caIntegrator - Edit Study"

				Set filesys = Nothing

				Browser(Data(0)).Page(Data(1)).Sync

				If lcase(Environment.Value("type")) = "ie" Then
					WaitForProcessing (Data)
					Browser(Data(0)).Page(Data(1)).Sync
				ElseIf lcase(Environment.Value("type")) = "ff" Then 
					WaitForProcessing_ff (Data)
					Browser(Data(0)).Page(Data(1)).Sync
				End If

				isFound = False
				isFound = verify_GenomicDataSourceTable (Data,caA_expId,"Ready to be loaded")
				If isFound = True Then
					Reporter.ReportEvent micPass, "caIntegrator_GenomicDataSources", "Map Samples completed successfully!!"
					caIntegrator_GenomicDataSources = "Pass"
				ElseIf isFound = False Then
					Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Map Samples failed!!"
					caIntegrator_GenomicDataSources = "Fail"
				End If
			Else
				Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Error occured: Either the Experiment " & caA_ExpId & " is not found or the status field does not have the Not Mapped status.Status found is " & GetVariable("aStatus") 
				caIntegrator_GenomicDataSources = "Fail"
			End If
		Case "delete"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) EXPERIMENT ID	
			'********************************************************************************************			
			caA_ExpId = parseData4(Data(4))(0)
			Data(4) = "Host Name###" & caA_ExpId & "###Delete"
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "2"
			Data(8) = "7"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then 
				Data(1) = "Windows Internet Explorer"
				Data(6) = "WinButton"	
				Data(5) = "OK"
				Data(3) = "Click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Browser(Data(0)).Dialog("The page").Page("The page").WebButton("OK").Click
			End If
			
			Data(1) = "caIntegrator - Edit Study"

			If lcase(Environment.Value("type")) = "ie" Then
				WaitForProcessing (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			ElseIf lcase(Environment.Value("type")) = "ff" Then 
				WaitForProcessing_ff (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			End If

			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Host Name###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=1 to GetVariable("rCount")
				Data(8) = "2"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Type###aExpId"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				If GetVariable("aExpId") = caA_ExpId Then
					isFound = True
					Exit For
				End If
			Next
			If isFound = True Then
				Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Genomic Data Source for Exp_ID " & caA_ExpId & " was found even after being deleted!"
				caIntegrator_GenomicDataSources = "Fail"
			Else
				Reporter.ReportEvent micPass, "caIntegrator_GenomicDataSources", "Deleted the Genomic Data Source for Experiment " & caA_ExpId & " successfully!"
				caIntegrator_GenomicDataSources = "Pass"
			End If
		Case Else
			Reporter.ReportEvent, micFail, "caIntegrator_GenomicDataSources", "Action " & ActionTerm & " is not supported"
			caIntegrator_GenomicDataSources = "Fail"
	End Select	
End Function
'************************************************************************************************************************
Function verify_GenomicDataSourceTable(Data,caA_expId,eStatus)
	Data(6) = "keyword"
	Data(5) = "WebTable_GetTableProperty"
	Data(4) = "Host Name###rCount"
	Data(3) = "RowCount"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	For r=2 to GetVariable("rCount")
		Data(8) = "2"
		Data(7) = r
		Data(6) = "keyword"
		Data(5) = "WebTable_GetTableProperty"
		Data(4) = "Host Name###eExpID"
		Data(3) = "GetCellData"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		Data(8) = "5"
		Data(7) = r
		Data(6) = "keyword"
		Data(5) = "WebTable_GetTableProperty"
		Data(4) = "Host Name###aStatus"
		Data(3) = "GetCellData"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		If (Trim(GetVariable("eExpID")) = Trim(caA_expId) and Trim(GetVariable("aStatus")) = Trim(eStatus)) Then
			isFound = True
			Exit For
		End If
	Next
	verify_GenomicDataSourceTable = isFound
end Function
'************************************************************************************************************************
Function caIntegrator_ImagingDataSources (Data,CurrentRow,ResultsFileObj)
	funcArg = parseData4(Data(4))
	actionTerm = Data(3)
	'********************************************
	rootDir= Environment("AUTRoot")
	Set filesys = CreateObject("Scripting.FileSystemObject")
	parentFldr = filesys.GetParentFolderName(rootDir)
	parentFldr = filesys.GetParentFolderName(parentFldr)
	'********************************************
	Select Case lcase(actionTerm)
		Case "add new"
			Data(1) = "caIntegrator - Edit Study"
			Data(3) = "click"
			Data(5) = "Add New_imagingDataSources"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(1) = "caIntegrator - Edit Imaging"

			Data(3) = "enter"
			Data(4) = funcArg(0)
			Data(5) = "serverGridUrl"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(1)
			Data(5) = "NBIAWebUrl"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(2)
			Data(5) = "UserName"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(3)
			Data(5) = "Password"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(4)
			Data(5) = "collectionName"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "select"
			Data(4) = funcArg(5)
			Data(5) = "mappingType"
			Data(6) = "webradiogroup"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
			If funcArg(6) <> "" Then

				If lcase(Environment.Value("type")) = "ie" Then
			'Updated the WebFile fileupload functionality so that it works with IE 8
					Data(1) = "caIntegrator - Edit Imaging"
					Data(6) = "webfile"
					Data(5) = "imageClinicalMappingFile"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

					Data(1) = "Choose file"
					Data(6) = "winedit"
					Data(5) = "File name:"
					If (0 = InStr(1,funcArg(6),"\\",1)) Then
						Data(4) = parentFldr & "\" & funcArg(6)
					Else
						Data(4) = funcArg(6)
					End If
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

					Data(1) = "Choose file"
					Data(6) = "WinButton"
					Data(5) = "Open"
					Data(3) = "click"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				ElseIf lcase(Environment.Value("type")) = "ff" Then
					Data(1) = "caIntegrator - Edit Imaging"
					Data(6) = "webfile"
					Data(5) = "imageClinicalMappingFile"
					If (0 = InStr(1,funcArg(6),"\\",1)) Then
						Data(4) = parentFldr & "\" & funcArg(6)
					Else
						Data(4) = funcArg(6)
					End If				
					Data(3) = "enter"
					s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				End If
			End If
		
			Data(3) = "click"
			Data(5) = "Save"
			Data(6) = "WebButton"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


			Data(1) = "caIntegrator - Edit Study"

			Browser(Data(0)).Page(Data(1)).Sync

			If lcase(Environment.Value("type")) = "ie" Then
				WaitForProcessing (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			ElseIf lcase(Environment.Value("type")) = "ff" Then 
				WaitForProcessing_ff (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			End If

			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Host Name_2###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=2 to GetVariable("rCount")
				Data(8) = "2"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Host Name_2###eCollName"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(8) = "4"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Host Name_2###eStatusCode"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				If trim(GetVariable("eCollName")) = trim(funcArg(4)) and  trim(GetVariable("eStatusCode")) = "Loaded" Then
					isFound = True
					Exit For
				End If					
			Next
			If isFound = True Then
				Reporter.ReportEvent micPass, "caIntegrator_ImagingDataSources", "Imaging data source added successfully!"
				caIntegrator_ImagingDataSources = "Pass"
			Else
				Reporter.ReportEvent micFail, "caIntegrator_ImagingDataSources", "Error while loading Image data source!"
				caIntegrator_ImagingDataSources = "Fail"
			End If
		Case "edit"
			Data(1) = "caIntegrator - Edit Study"
			Data(3) = "click"
			Data(5) = "EditImagingDataSources"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(1) = "caIntegrator - Edit Imaging"

			Data(3) = "enter"
			Data(4) = funcArg(0)
			Data(5) = "serverGridUrl"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(1)
			Data(5) = "NBIAWebUrl"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(2)
			Data(5) = "UserName"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(3)
			Data(5) = "Password"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "enter"
			Data(4) = funcArg(4)
			Data(5) = "collectionName"
			Data(6) = "webedit"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "select"
			Data(4) = funcArg(5)
			Data(5) = "mappingType"
			Data(6) = "webradiogroup"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then
		'Updated the WebFile fileupload functionality so that it works with IE 8
				Data(1) = "caIntegrator - Edit Imaging"
				Data(6) = "webfile"
				Data(5) = "imageClinicalMappingFile"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "winedit"
				Data(5) = "File name:"
				If (0 = InStr(1,funcArg(6),"\\",1)) Then
					Data(4) = parentFldr & "\" & funcArg(6)
				Else
					Data(4) = funcArg(6)
				End If
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "WinButton"
				Data(5) = "Open"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Data(1) = "caIntegrator - Edit Imaging"
				Data(6) = "webfile"
				Data(5) = "imageClinicalMappingFile"
				If (0 = InStr(1,funcArg(6),"\\",1)) Then
					Data(4) = parentFldr & "\" & funcArg(6)
				Else
					Data(4) = funcArg(6)
				End If				
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If
			
			Data(3) = "click"
			Data(5) = "Save"
			Data(6) = "WebButton"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


			Data(1) = "caIntegrator - Edit Study"

			Browser(Data(0)).Page(Data(1)).Sync

			If lcase(Environment.Value("type")) = "ie" Then
				WaitForProcessing (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			ElseIf lcase(Environment.Value("type")) = "ff" Then 
				WaitForProcessing_ff (Data)
				Browser(Data(0)).Page(Data(1)).Sync
			End If

			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Host Name_2###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=2 to GetVariable("rCount")
				Data(8) = "2"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Host Name_2###eCollName"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(8) = "4"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Host Name_2###eStatusCode"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				If trim(GetVariable("eCollName")) = trim(funcArg(4)) and  trim(GetVariable("eStatusCode")) = "Loaded" Then
					isFound = True
					Exit For
				End If					
			Next
			If isFound = True Then
				Reporter.ReportEvent micPass, "caIntegrator_ImagingDataSources", "Imaging data source edited successfully!"
				caIntegrator_ImagingDataSources = "Pass"
			Else
				Reporter.ReportEvent micFail, "caIntegrator_ImagingDataSources", "Error while loading Image data source!"
				caIntegrator_ImagingDataSources = "Fail"
			End If

		Case "add annotation"
			Data(1) = "caIntegrator - Edit Study"
			Data(3) = "click"
			Data(5) = "Add Annotations"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(1) = "caIntegrator - Add Imaging"
			Data(3) = "select"
			Data(4) = funcArg(0)
			Data(5) = "uploadType"
			Data(6) = "webradiogroup"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then
		'Updated the WebFile fileupload functionality so that it works with IE 8
				Data(1) = "caIntegrator - Add Imaging"
				Data(6) = "webfile"
				Data(5) = "imageAnnotationFile"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "winedit"
				Data(5) = "File name:"
				If (0 = InStr(1,funcArg(1),"\\",1)) Then
					Data(4) = parentFldr & "\" & funcArg(1)
				Else
					Data(4) = funcArg(1)
				End If
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "WinButton"
				Data(5) = "Open"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Data(1) = "caIntegrator - Add Imaging"
				Data(6) = "webfile"
				Data(5) = "imageAnnotationFile"
				If (0 = InStr(1,funcArg(1),"\\",1)) Then
					Data(4) = parentFldr & "\" & funcArg(1)
				Else
					Data(4) = funcArg(1)
				End If				
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If

			If funcArg(2) = "check" then
				Data(3) = "check"
			elseif funcArg(2) = "uncheck" then
				Data(3) = "uncheck"
			end if
			Data(5) = "createNewAnnotationDefinition"
			Data(6) = "webcheckbox"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(3) = "click"
			Data(5) = "Add"
			Data(6) = "webbutton"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			'Add verification / validation steps..

		Case "delete"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) EXTERNAL LINKS FILE NAME	
			'********************************************************************************************			
			ImageCollName = parseData4(Data(4))(0)
			Data(4) = "Host Name_2###" & ImageCollName & "###Delete"
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "2"
			Data(8) = "6"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			If lcase(Environment.Value("type")) = "ie" Then 
				Data(1) = "Windows Internet Explorer"
				Data(6) = "WinButton"	
				Data(5) = "OK"
				Data(3) = "Click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Browser(Data(0)).Dialog("The page").Page("The page").WebButton("OK").Click
			End If
			
			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Host Name_2###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=1 to GetVariable("rCount")
				Data(8) ="2"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Name###sCollName"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				If GetVariable("sCollName") = ImageCollName Then
					isFound = True
					Exit For
				End If
			Next
			If isFound = True Then
				Reporter.ReportEvent micFail, "caIntegrator_ImagingDataSources", "Collection name found even after being deleted!"
				caIntegrator_ImagingDataSources = "Fail"
			Else
				Reporter.ReportEvent micPass, "caIntegrator_ImagingDataSources", "Deleted the Image data source with collection name " & ImageCollName & " successfully!"
				caIntegrator_ImagingDataSources = "Pass"
			End If
		Case else
			Reporter.ReportEvent micFail,"caIntegrator_ImagingDataSources", "Invalid action term specified!!"
			caIntegrator_ImagingDataSources = "Fail"
	End Select
	Set filesys = Nothing
End Function
'************************************************************************************************************************
Function caIntegrator_ExternalLinks (Data,CurrentRow, ResultsFileObj)
	'********************************************
	rootDir= Environment("AUTRoot")
	Set filesys = CreateObject("Scripting.FileSystemObject")
	parentFldr = filesys.GetParentFolderName(rootDir)
	parentFldr = filesys.GetParentFolderName(parentFldr)
	'********************************************
	isFound = False
	ActionTerm = Data(3)
	Data(1) = "caIntegrator - Edit Study"
	funcArg = parseData4(Data(4))

	Select Case lcase(ActionTerm)
		Case "add"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) RELATIVE PATH FROM THE DATA FOLDER IN THE PEDAL FRAMEWORK TO THE EXTERNAL LINKS FILE NAME 
			'********************************************************************************************

			'CLICK ON THE LINK ADD NEW TO ADD EXTERNAL LINKS

			Data(6) = "link"
			Data(5) = "Add New_externalLinks"	
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


			Data(6) = "WebEdit"
			Data(5) = "externalLinkList.name"
			Data(4) = "myExternalLinks"
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(6) = "WebEdit"
			Data(5) = "externalLinkList.description"
			Data(4) = "Some useful external links"
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		'	If (0 = InStr(1,funcArg(0),"\\",1)) Then
		'		Data(4) = TestDir & "\Data\" & funcArg(0)
		'	End If

		'	Data(6) = "WebFile"	
		'	Data(5) = "externalLinksFile"
		'	Data(3) = "enter"
		'	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			If lcase(Environment.Value("type")) = "ie" Then
		'Updated the WebFile fileupload functionality so that it works with IE 8
				Data(1) = "caIntegrator - Edit Study"
				Data(6) = "webfile"
				Data(5) = "externalLinksFile"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "winedit"
				Data(5) = "File name:"
				If (0 = InStr(1,funcArg(0),"\\",1)) Then
					Data(4) = parentFldr & "\" & funcArg(0)
				Else
					Data(4) = funcArg(0)
				End If
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "Choose file"
				Data(6) = "WinButton"
				Data(5) = "Open"
				Data(3) = "click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Data(1) = "caIntegrator - Edit Study"
				Data(6) = "webfile"
				Data(5) = "externalLinksFile"
				If (0 = InStr(1,funcArg(0),"\\",1)) Then
					Data(4) = parentFldr & "\" & funcArg(0)
				Else
					Data(4) = funcArg(0)
				End If				
				Data(3) = "enter"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If
		'end of update

			Data(1) = "caIntegrator - Edit Study"
			Data(6) = "Image"
			Data(5) = "Upload Now_2"
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Name###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			exDesc = Split(funcArg(0),"\",-1,1)

			For r=2 to GetVariable("rCount")
				Data(8) = "3"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Name###eDesc"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				If trim(GetVariable("eDesc")) = exDesc(ubound(exDesc)) Then
					isFound = True
					Exit For
				End If					

					
			Next
			If isFound = True Then
				Reporter.ReportEvent micPass, "caIntegrator_ExternalLinks", "External links file added successfully!"
				caIntegrator_ExternalLinks = "Pass"
			Else
				Reporter.ReportEvent micFail, "caIntegrator_ExternalLinks", "External links file could not be added!"
				caIntegrator_ExternalLinks = "Fail"
			End If			
		Case "delete"
			'********************************************************************************************			
			'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
			'1) EXTERNAL LINKS FILE NAME	
			'********************************************************************************************			
			externalLinksFileName = parseData4(Data(4))(0)
			Data(4) = "Name###" & externalLinksFileName & "###Delete"
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "3"
			Data(8) = "5"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			If lcase(Environment.Value("type")) = "ie" Then 
				Data(1) = "Windows Internet Explorer"
				Data(6) = "WinButton"	
				Data(5) = "OK"
				Data(3) = "Click"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then
				Browser(Data(0)).Dialog("The page").Page("The page").WebButton("OK").Click
			End If
			
			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Name###rCount"
			Data(3) = "RowCount"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			For r=1 to GetVariable("rCount")
				Data(8) ="3"
				Data(7) = r
				Data(6) = "keyword"
				Data(5) = "WebTable_GetTableProperty"
				Data(4) = "Name###sDesc"
				Data(3) = "GetCellData"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				If GetVariable("sDesc") = externalLinksFileName Then
					isFound = True
					Exit For
				End If
			Next
			If isFound = True Then
				Reporter.ReportEvent micFail, "caIntegrator_ExternalLinks", "External links file found even after being deleted!"
				caIntegrator_ExternalLinks = "Fail"
			Else
				Reporter.ReportEvent micPass, "caIntegrator_ExternalLinks", "Deleted the External links file " & externalLinksFileName & " successfully!"
				caIntegrator_ExternalLinks = "Pass"
			End If
		Case Else
			Reporter.ReportEvent, micFail, "caIntegrator_ExternalLinks", "Action " & ActionTerm & " is not supported"
	End Select				

End Function
'************************************************************************************************************************
Function caIntegrator_deployStudy(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) NONE
	'********************************************************************************************	


	Msgbox  "second"
	If Browser(Data(0)).Page(Data(1)).Image("deploy disabled").Exist(2) Then
		Data(6) = "Image"
		Data(5) = "Save"
		Data(3) = "Click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Browser(Data(0)).Page(Data(1)).Sync
	End If
	Data(6) = "Image"
	Data(5) = "Deploy Study"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	caIntegrator_deployStudy = "Done"
End Function
'************************************************************************************************************************
Function caIntegrator_verifyStudyDeployment(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) NONE
	'********************************************************************************************	
	Data(1) = "caIntegrator - Manage Studies"

	If lcase(Environment.Value("type")) = "ie" Then
		WaitForProcessing (Data)
		Browser(Data(0)).Page(Data(1)).Sync
	ElseIf lcase(Environment.Value("type")) = "ff" Then 
		WaitForProcessing_ff (Data)
		Browser(Data(0)).Page(Data(1)).Sync
	End If

	Data(6) = "keyword"
	Data(5) = "WebTable_GetTableProperty"
	Data(4) = "class:=Data###rCount"
	Data(3) = "RowCount"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	For r=1 to GetVariable("rCount")
		Data(8) ="1"
		Data(7) = r
		Data(6) = "keyword"
		Data(5) = "WebTable_GetTableProperty"
		Data(4) = "Name###aStudyName"
		Data(3) = "GetCellData"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		If trim(GetVariable("aStudyName")) = trim(GetVariable("StudyName")) Then
			Data(8) ="4"
			Data(7) = r
			Data(6) = "keyword"
			Data(5) = "WebTable_GetTableProperty"
			Data(4) = "Name###aStatus"
			Data(3) = "GetCellData"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	

			If GetVariable("aStatus") = "Deployed" Then
				Reporter.ReportEvent micPass, "caIntegrator_verifyStudyDeployment", "Study deployment successful for the study " & GetVariable("StudyName")
				caIntegrator_verifyStudyDeployment = "Pass"
			ElseIf GetVariable("aStatus") = "Not Deployed" Then
				Reporter.ReportEvent micFail, "caIntegrator_verifyStudyDeployment", "Study deployment NOT successful for the study " & GetVariable("StudyName") & ". The status is Not Deployed"
				caIntegrator_verifyStudyDeployment = "Fail"
			ElseIf GetVariable("aStatus") = "Error" Then
				Data(4) = "class:=Data###" & GetVariable("StudyName") & "###Error"
				Data(5) = "WebTable_ClickOnLinkInCell"
				Data(6) = "keyword"
				Data(7) = "1"
				Data(8) = "4"
				clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(1) = "caIntegrator - Edit Study"				
				Data(6) = "keyword"
				Data(5) = "WebElement_GetROProperty"
				Data(4) = "studyStatusDescription###errorStatus"
				Data(3) = "innertext"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				Reporter.ReportEvent micFail, "caIntegrator_verifyStudyDeployment", "Study deployment NOT successful for the study " & GetVariable("StudyName") & ". The status is Error: " & GetVariable("errorStatus")
				caIntegrator_verifyStudyDeployment = "Fail"
			End If
			Exit For
		End If
	Next
End Function
'************************************************************************************************************************
Function caIntegrator_SurvivalValues (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'ACTION - New
	' 1) SURVIVAL DEFINITION TYPE
	' 2) NAME
	' 3) SURVIVAL LENGTH UNITS
	' 4) SURVIVAL START DATE / SURVIVAL LENGTH
	' 5) DEATH DATE / CENSORED STATUS
	' 6) LAST FOLLOW UP DATE / VALUE FOR CENSORED
	'********************************************************************************************
	actionTerm = Data(3)

	Select Case lcase(actionTerm)
		Case "new"
			funcArg = parseData4(Data(4))
			Data(1) = "caIntegrator - Edit Study"
			Data(3) = "click"
			Data(5) = "Edit Survival Values"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			If Browser(Data(0)).Page("caIntegrator - Error").Exist(2) Then
				Data(1) = "caIntegrator - Error"
				Data(3) = "innertext"
				Data(4) = "detailError###errorText"
				Data(5) = "webelement_getroproperty"
				Data(6) = "keyword"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				Reporter.ReportEvent micFail,"caIntegrator_SurvivalValues", "Clicking on Edit Survival Values link resulted in an error: " & GetVariable("errorText")
				caIntegrator_SurvivalValues = "Fail"
				Exit Function
			End If
			
			Data(1) = "caIntegrator - Survival Value Definitions"
			Data(3) = "click"
			Data(5) = "New"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(6) = "webradiogroup"
			Data(5) = "survivalValueType"
			Data(4) = funcArg(0)
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				
			Data(6) = "webedit"
			Data(5) = "survivalValueDefinitionName"
			Data(4) = funcArg(1)
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	

			Data(6) = "weblist"
			Data(5) = "survivalLengthUnits"
			Data(4) = funcArg(2)
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)					

			If lcase(funcArg(0)) = lcase("By Length of time in study") Then
				Data(6) = "weblist"
				Data(5) = "survivalLengthId"
				Data(4) = funcArg(3)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "survivalStatusId"
				Data(4) = funcArg(4)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "valueForCensored"
				Data(4) = funcArg(5)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf funcArg(0) = "By Date" Then
				Data(6) = "weblist"
				Data(5) = "survivalStartDateId"
				Data(4) = funcArg(3)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "survivalDeathDateId"
				Data(4) = funcArg(4)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "lastFollowupDateId"
				Data(4) = funcArg(5)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If

			Data(6) = "webbutton"
			Data(5) = "Save"
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			caIntegrator_SurvivalValues = "Done"
		Case "edit"
			funcArg = parseData4(Data(4))
			Data(1) = "caIntegrator - Edit Study"
			Data(3) = "click"
			Data(5) = "Edit Survival Values"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			If Browser(Data(0)).Page("caIntegrator - Error").Exist(2) Then
				Data(1) = "caIntegrator - Error"
				Data(3) = "innertext"
				Data(4) = "detailError###errorText"
				Data(5) = "webelement_getroproperty"
				Data(6) = "keyword"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				Reporter.ReportEvent micFail,"caIntegrator_SurvivalValues", "Clicking on Edit Survival Values link resulted in an error: " & GetVariable("errorText")
				caIntegrator_SurvivalValues = "Fail"
				Exit Function
			End If
			
			Data(1) = "caIntegrator - Survival Value Definitions"
			Data(3) = "select"
			Data(4) = funcArg(0)
			Data(5) = "survivalValueDefinitionId"
			Data(6) = "weblist"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(3) = "click"
			Data(5) = "Edit"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(6) = "webradiogroup"
			Data(5) = "survivalValueType"
			Data(4) = funcArg(1)
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				
			Data(6) = "webedit"
			Data(5) = "survivalValueDefinitionName"
			Data(4) = funcArg(2)
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	

			Data(6) = "weblist"
			Data(5) = "survivalLengthUnits"
			Data(4) = funcArg(3)
			Data(3) = "select"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)					

			If lcase(funcArg(1)) = lcase("By Length of time in study") Then
				Data(6) = "weblist"
				Data(5) = "survivalLengthId"
				Data(4) = funcArg(4)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "survivalStatusId"
				Data(4) = funcArg(5)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "valueForCensored"
				Data(4) = funcArg(6)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf funcArg(1) = "By Date" Then
				Data(6) = "weblist"
				Data(5) = "survivalStartDateId"
				Data(4) = funcArg(4)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "survivalDeathDateId"
				Data(4) = funcArg(5)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

				Data(6) = "weblist"
				Data(5) = "lastFollowupDateId"
				Data(4) = funcArg(6)
				Data(3) = "select"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If

			Reporter.ReportEvent micDone,"caIntegrator_SurvivalValues","The survival value " & funcArg(0) & " is edited!!"

			Data(6) = "webbutton"
			Data(5) = "Save"
			Data(3) = "click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			caIntegrator_SurvivalValues = "Done"		
		Case "remove"
			funcArg = parseData4(Data(4))
			Data(1) = "caIntegrator - Edit Study"
			Data(3) = "click"
			Data(5) = "Edit Survival Values"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			If Browser(Data(0)).Page("caIntegrator - Error").Exist(2) Then
				Data(1) = "caIntegrator - Error"
				Data(3) = "innertext"
				Data(4) = "detailError###errorText"
				Data(5) = "webelement_getroproperty"
				Data(6) = "keyword"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
				Reporter.ReportEvent micFail,"caIntegrator_SurvivalValues", "Clicking on Edit Survival Values link resulted in an error: " & GetVariable("errorText")
				caIntegrator_SurvivalValues = "Fail"
				Exit Function
			End If
			
			Data(1) = "caIntegrator - Survival Value Definitions"
			Data(3) = "select"
			Data(4) = funcArg(0)
			Data(5) = "survivalValueDefinitionId"
			Data(6) = "weblist"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(3) = "click"
			Data(5) = "Remove"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Reporter.ReportEvent micDone,"caIntegrator_SurvivalValues","The Survival value " & funcArg(0) & " is removed!!"

			Data(3) = "click"
			Data(5) = "Cancel"
			Data(6) = "link"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			caIntegrator_SurvivalValues = "Done"
		Case "cancel"

		Case Else
			Reporter.ReportEvent micFail,"caIntegrator_SurvivalValues","Invalid action specified."
	End Select
End Function
'************************************************************************************************************************
Sub WaitForProcessing (Data)
	noOfAttempts = 0
	waitstatus = "cont"
	do 
		noOfAttempts = noOfAttempts + 1
		If Data(1) = "caIntegrator - Manage Studies" Then
			wait (5)
			Browser(Data(0)).Refresh
			wait(10)
		Else
			wait (15)
		End If

		If TRUE = Browser(Data(0)).Page(Data(1)).WebElement("Please wait for action").GetROProperty("visible") then
			
			waitstatus = "cont"
		elseif Browser(Data(0)).Page(Data(1)).WebElement("Processing").Exist(0) then
			waitstatus = "cont"
		else
			waitstatus = "end"
			Reporter.ReportEvent micPass, "WaitForProcessing", " Waited for '" & noOfAttempts & "' 15 seconds interval which equals " & (noOFAttempts * 15)/60 & " minutes"
		end if
		If noOfAttempts = 60 then
			waitstatus = "end"
			Reporter.ReportEvent micPass, "WaitForProcessing", " Waited for '" & noOfAttempts & "' 15 seconds interval which equals " & (noOFAttempts * 15)/60 & " minutes"
		end if	
	loop until waitstatus = "end"
End Sub
'************************************************************************************************************************

'************************************************************************************************************************
Sub WaitForProcessing_ff (Data)
	noOfAttempts = 0
	waitstatus = "cont"
	do 
		noOfAttempts = noOfAttempts + 1

		If Data(1) = "caIntegrator - Manage Studies" Then
			wait (5)
			Browser(Data(0)).Refresh
			wait(10)
		Else
			wait (15)
		End If

		if Browser(Data(0)).Page(Data(1)).WebElement("Processing").Exist(0) then
			waitstatus = "cont"
		else
			waitstatus = "end"
			Reporter.ReportEvent micPass, "WaitForProcessing", " Waited for '" & noOfAttempts & "' 15 seconds interval which equals " & (noOFAttempts * 15)/60 & " minutes"
		end if
		If noOfAttempts = 120 then
			waitstatus = "end"
			Reporter.ReportEvent micPass, "WaitForProcessing", " Waited for '" & noOfAttempts & "' 15 seconds interval which equals " & (noOFAttempts * 15)/60 & " minutes"
		end if	
	loop until waitstatus = "end"
End Sub
'************************************************************************************************************************
' Function to Click on the Different PlatformTypes 
'  Data(3) = "enter"
' Data(4) = "item to be clicked" 
'*********************************************************************************************************************************************************
public function cai_selectplatform(Data,CurrentRow,ResultsFileObj)
	Data(6) = "Weblist"
	Data(5) = "platformType"	
	Data(3) = "select"
	Data(1) = "caIntegrator - Manageplatforms"

	Select Case data(4)
		Case "Affymetrix Gene Expression"
			status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Case "Affymetrix Copy Number"
			status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Case "Agilent Gene Expression"
			status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Case "Agilent Copy Number"
			status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Case Else
			Reporter.ReportEvent micFail,"caI_SelectPlatforms","Invalid Platform name"		
	End Select

	If Status = "Fail" Then
		cai_selectplatform="Fail"
	Else
		cai_selectplatform="Pass"
	End If
End function 



'*********************************************************************************************************************************************************
'Function to load the files 
'data(4) = Location of the file to be loaded 
'Data(3)  = Enter
'********************************************************************************************************************************************************

Public Function cai_Load_platforms_Affy_Gene_EXP(Data,CurrentRow,ResultsFileObj)

	do while Browser(Data(0)).Page(Data(1)).WebElement("Processing").Exist(0) 
		wait(10)
	loop

	arra= parsedata4(data(4))

	If lcase(Environment.Value("type")) = "ie" Then
		Data(1) = "caIntegrator - Manageplatforms"
		Data(6) = "webfile"
		Data(5) = "platformFile"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		 
		Data(1) = "Choose file"
		Data(6) = "winedit"
		Data(5) = "File name:"
		Data(4) = arra(0)
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		 
		Data(1) = "Choose file"
		Data(6) = "WinButton"
		Data(5) = "Open"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	ElseIf lcase(Environment.Value("type")) = "ff" Then
		Data(1) = "caIntegrator - Manageplatforms"
		Data(6) = "webfile"
		Data(5) = "platformFile"
		Data(4) = arra(0)
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	End If

	Data(6) = "webbutton"
	Data(5)=  "Create Platform"
	Data(3)=  "click"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	wait ( 5) 

	If Status = "Fail" Then
		cai_Load_platforms_Affy_Gene_EXP="Fail"
	Else
		cai_Load_platforms_Affy_Gene_EXP="Pass"
	End If
End Function

'*****************************************************************************************************************************************************
'Function To verify after load of Load_platforms_Affy_Gene_EXP
'Data (4) = string to be verified in the table after load 
'data(3) = verify
'****************************************************************************************************************************************************
public Function cai_Verify_platforms_Affy_Gene_EXP(Data,CurrentRow,ResultsFileObj)
		do while Browser(Data(0)).Page(Data(1)).WebElement("Processing").Exist(0) 
			wait(10)
		loop
		
		If lcase(Environment.Value("type")) = "ie" then 
			WaitForProcessing(data)
		ElseIf lcase(Environment.Value("type")) = "ff" Then
			wait(10)
			WaitForProcessing_ff(data)
		End if 
 		
		arra = parsedata4(data(4))
		Data(6) = "WebTable"
		data(5) = "class:=Data"   ' ---"Platform Name"
		Data(3) = "verify"
		Data(1) = "caIntegrator - Manageplatforms"
		data(4) = arra(1)
		
		wait (5)
		r= browser(data(0)).page(data(1)).webtable(data(5)).GetRowWithCellText(arra(1) ,1,1) '---- getting the row of string match
		data(7) = r
		data(8) =6
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		 		
		If Status = "Fail" Then
			cai_Verify_platforms_Affy_Gene_EXP="Fail"
			Else
		 		if lcase(browser(data(0)).page(data(1)).webtable(data(5)).GetCellData(r,8)) ="delete" then 
				cai_Verify_platforms_Affy_Gene_EXP="Pass"
				Reporter.ReportEvent micPass,"Successfully loaded the platform : " & arra(1) , " "
				else 
				cai_Verify_platforms_Affy_Gene_EXP="Fail"
				Reporter.ReportEvent micPass,"Failure in loading the  : "  & arra(1)  , " "
				end if  
		End if 
End Function 

'*********************************************************************************************************************************************************
'Function to load Affymetrix CopyNumber the files 
'data(4) = Location of the file to be loaded ### Verification text.
'Data(3)  = Enter
'********************************************************************************************************************************************************

Public Function cai_Load_platforms_affy_copynumber(Data,CurrentRow,ResultsFileObj)
	WaitForProcessing_ff(data)

	do while Browser(Data(0)).Page(Data(1)).WebElement("Processing").Exist(0) 
		wait(10)
	loop

	arra= parsedata4(data(4))

	Data(6) = "webedit"
	Data(5)=  "platformName"
	Data(4)=  arra(1)
	Data(3)=  "enter"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If lcase(Environment.Value("type")) = "ie" Then
		Data(1) = "caIntegrator - Manageplatforms"
		Data(6) = "webfile"
		Data(5) = "platformFile"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		Data(1) = "Choose file"
		Data(6) = "winedit"
		Data(5) = "File name:"
		Data(4) = arra(0)
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		 
		Data(1) = "Choose file"
		Data(6) = "WinButton"
		Data(5) = "Open"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	ElseIf lcase(Environment.Value("type")) = "ff" Then
		Data(1) = "caIntegrator - Manageplatforms"
		Data(6) = "webfile"
		Data(5) = "platformFile"
		Data(4) = arra(0)
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	End If
		
	Data(6) = "webbutton"
	Data(5)=  "Add Annotation File"
	Data(3)=  "click"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "webedit"
	Data(5)=  "Pfilenames"
	Data(4)=  arra(2)	
	Data(3)=  "verify"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If status= "pass" then 
		Reporter.ReportEvent micPass,"Successfully loaded Step1 of  the platform : " & arra(1) , " "
	else
		Reporter.ReportEvent micPass,"Failure in loading the Step1 of  the platform : "    & arra(1)  , " "
	End If

	WaitForProcessing_ff(data)
	
	If Status = "Fail" Then
		cai_Load_platforms_affy_copynumber="Fail"
	Else
		cai_Load_platforms_affy_copynumber="Pass"
	End If


End Function

'**********************************************************************************************************************************************************
'To click on the create platform
'**********************************************************************************************************************************************************

Public Function cai_Clk_btn_create_pltform(Data,CurrentRow,ResultsFileObj)
	
	Data(6) = "webbutton"
	Data(5)=   "Create Platform"
	Data(3)=  "click"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	WaitForProcessing_ff(data)
	
	if status="pass" then 
		 cai_Clk_btn_create_pltform="pass"
	else 
		 cai_Clk_btn_create_pltform="fail"
	end if    

End Function



'**********************************************************************************************************************************************************
'Function to load Agilient Gene Experession  

'********************************************************************************************************************************************************

Public Function cai_Load_platforms_agilent_gene_exp(Data,CurrentRow,ResultsFileObj)
	WaitForProcessing_ff(data)

	do while Browser(Data(0)).Page(Data(1)).WebElement("Processing").Exist(0) 
		wait(10)
	loop
	arra= parsedata4(data(4))
	
	Data(6) = "webedit"
	Data(5)=  "platformName"
	Data(4)=   arra(1)
	Data(3)=  "enter"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	If lcase(Environment.Value("type")) = "ie" Then
		Data(1) = "caIntegrator - Manageplatforms"
		Data(6) = "webfile"
		Data(5) = "platformFile"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	  
		Data(1) = "Choose file"
		Data(6) = "winedit"
		Data(5) = "File name:"
		Data(4) = arra(0)
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		 
		Data(1) = "Choose file"
		Data(6) = "WinButton"
		Data(5) = "Open"
		Data(3) = "click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	ElseIf lcase(Environment.Value("type")) = "ff" Then
		Data(1) = "caIntegrator - Manageplatforms"
		Data(6) = "webfile"
		Data(5) = "platformFile"
		Data(4) =  arra(0)
		Data(3) = "enter"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	End If

	Data(6) = "Weblist"
	data(5) = "platformChannelType"	
	data(4)= "Two-Color"
	Data(3) = "select"
	Data(1) = "caIntegrator - Manageplatforms"
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "webbutton"
	Data(5)=  "Create Platform"
	Data(3)=  "click"
	Data(1) = "caIntegrator - Manageplatforms"	
	status= ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If status= "pass" then 
		Reporter.ReportEvent micPass,"Successfully loaded Step1 of  the platform : " & arra(1) , " "
	else
		Reporter.ReportEvent micPass,"Failure in loading the Step1 of  the platform : "    & arra(1)  , " "
	End If

		WaitForProcessing_ff(data)
	If Status = "Fail" Then
		cai_Load_platforms_agilent_gene_exp="Fail"
	Else
		cai_Load_platforms_agilent_gene_exp="Pass"
	End If
End Function
'************************************************************************************************************************
'Function Name - CAI_DeleteStudiesbyRange
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
'     FindTableRowByCellContent  --laxmi dt feb 18 2011
'************************************************************************************************************************8
Function cai_DeleteStudiesbyRange(Data,CurrentRow,ResultsFileObj)
	
	Data(6) = "Link"
	Data(5) = "Manage Studies"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(1) = "caIntegrator - Manage Studies"

	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If

	funcArg = parseData4(Data(4))
	 
	webTableName =  funcArg(0)
	SearchTerm = funcArg(1)
	LinkName = funcArg(2) 'Delete
	Action = Data(3) 'not used currently. By default set method is called
	SearchColumnNumber = Data(7) '2
	LinkColumnNumber = Data(8) '7

	wait(3)
	
	GUIObjRef = GUIObjRef & "WebTable(webTableName)."
	Browser(Data(0)).Page(Data(1)).Sync

	wait(2)
	      
        r1 = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
	wait (5) 

	if r1 <> 0 then 
		do while r1 > 0 
			e_method = "ChildItem(r1,CInt(LinkColumnNumber),""" & "link"& """,1)"
			e_Command = "Set nameOflink=" & GUIObjRef & e_Method
			Execute(e_command)
			If (LinkName = nameOflink.GetROProperty("name")) Then
				nameOflink.click
	            		If  browser(data(0)).dialog("Windows Internet Explorer").winbutton("OK").exist   Then
        	        		browser(data(0)).dialog("Windows Internet Explorer").winbutton("OK").click
					Browser(Data(0)).Page(Data(1)).Sync
					Reporter.ReportEvent micDone,"cai_DeleteStudiesbyRange","Deleted the item in row " & r1 & " that matched the search criteria"
					r1 = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
					wait(2)
					if r1= 0 then 
						r1 = FindTableRowByCellContent (GUIObjRef,SearchTerm,SearchColumnNumber,WebTableName)
					end if
				End If
				checkStatus = "Pass"
			End If
		loop	
	end if

	If checkStatus = "Fail" Then
		cai_DeleteStudiesbyRange = "Fail"
	Else
		cai_DeleteStudiesbyRange = "Pass"
	End If
End Function
'************************************************************************************************************************
Function getMicClass(Data,possibilities,ObjName)
	Browser(Data(0)).Page(Data(1)).RefreshObject
   	For each possibleChoice in possibilities
		Set oDesc = Description.Create()
		oDesc("name").value = ObjName
		oDesc("micclass").value = possibleChoice
		Set oPageObj = Browser(Data(0)).Page(Data(1)).ChildObjects(oDesc)
		
		If oPageObj.count = 1 Then
			getMicClass = possibleChoice
			Exit Function
		ElseIf oPageObj.count > 1 Then
			getMicClass = "Object not unique"
			Exit function
		End If
	Next
	getMicClass = "Object not found"
End Function
'************************************************************************************************************************
Sub SetValue(Data,objType,ObjName,ObjValue)
	Select Case objType
		Case "WebList"
			Browser(Data(0)).Page(Data(1)).WebList("name:=" & ObjName).Select ObjValue
		Case "WebEdit"
			Browser(Data(0)).Page(Data(1)).WebEdit("name:=" & ObjName).Set ObjValue
		Case Else
			MsgBox "Unexpected Object Class"
	End Select
End Sub
'************************************************************************************************************************
Function cai_DefineQueryCriteria(Data,CurrentRow,ResultsFileObj)
	wait 5
	funcArg = ParseData4(Data(4))
	criterionTypeValue = funcArg(0)
	row = funcArg(1)-1
	QueryCriterion = Split(funcArg(2),";",-1,1)
	
	propty = 0
	

	possibilities = Array("WebList","WebEdit")
	fieldName = "queryForm.criteriaGroup.rows\[" & row & "\].fieldName"
	criterionTypeName = "queryForm.criteriaGroup.criterionTypeName"
	
	
	
	'Setting the criterionType
	criterionTypeMicClass =  getMicClass(Data,possibilities,criterionTypeName)
	SetValue Data,criterionTypeMicClass,criterionTypeName,criterionTypeValue

	Data(6) = "Link"
	Data(5) = "text:=Add"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	wait 5
	' end of setting criterionType

	For each QueryCriteria in QueryCriterion
		x = Split(QueryCriteria,"=",-1,1)
		Select Case lcase(x(0))
			Case "fieldname"
				fieldNameValue = x(1)
				fieldNameMicClass =  getMicClass(Data,possibilities,fieldName)
				SetValue Data,fieldNameMicClass,fieldName,fieldNameValue
			Case "operator"
				operatorNum = x(1)
			Case "operatorvalue"
				operatorValue = x(1)
				If operatorNum > 0 Then
					propty = operatorNum - 1
					paramOperator = "queryForm.criteriaGroup.rows\[" & row & "\].parameters\[" & propty & "\].operator"
					operatorMicClass = 	getMicClass(Data,possibilities,paramOperator)
					SetValue Data,operatorMicClass,paramOperator,operatorValue
				End If					
			Case "parameter"
				paramNum = x(1)
				propty = paramNum-1
			Case "paramvalue"
				paramValue = x(1)
				paramName = "queryForm.criteriaGroup.rows\[" & row & "\].parameters\[" & propty & "\].value"
				paramMicClass = getMicClass(Data,possibilities,paramName)
				SetValue Data,paramMicClass,paramName,paramValue	
			Case Else
				MsgBox "Report Error"
		End Select
		wait 3	
	Next
	cai_DefineQueryCriteria = "Pass"
End Function
'************************************************************************************************************************
Function cai_DefineResultType (Data,CurrentRow,ResultsFileObj)
	funcArg = ParseData4(Data(4))
	ActionTerm = Data(5)
	
	Data(3) = "Click"
	Data(5) = "Results Type"
	Data(6) = "WebElement"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(3) = "select"
	Data(4) = ActionTerm
	Data(5) = "queryForm.resultConfiguration.resultType"
	Data(6) = "webradiogroup"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	
					
	Select Case lcase(ActionTerm)
		Case "clinical" , "igvviewer"
			'Select Result Columns
			s = Split(funcArg(0),"=",-1,1)
			If Replace(trim(lcase(s(0)))," ", "") = "selectcolumnsforresults" then
				If trim(lcase(s(1))) = "all" then
					Set oDesc = Description.Create()
					oDesc("name").value = "Select All"
					oDesc("micclass").value = "WebButton"
					Set oWebButtonObj = Browser(Data(0)).Page(Data(1)).ChildObjects(oDesc)
					for wb=0 to oWebButtonObj.count-1
						oWebButtonObj(wb).Click
					next
				Else
					k = split(s(1),";",-1,1)
					For j=0 to ubound(k)
						Data(6) = "WebCheckBox"
						Data(5) = "value:=" & k(j)
						Data(3) = "check"
						s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
					Next
				End If
			End If
		Case "geneexpression"
			s = Split(funcArg(0),"=",-1,1)
			t = Split(funcArg(1),"=",-1,1)
			If Replace(trim(lcase(s(0)))," ", "") = "selectreportertype" then
				Data(3) = "select"
				Data(4) = s(1)
				Data(5) = "queryForm.resultConfiguration.reporterType"
				Data(6) = "webradiogroup"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			End If
							
			If Replace(trim(lcase(t(0)))," ", "") = "selectresultsorientation" then
				Data(3) = "select"
				Data(4) = t(1)
				Data(5) = "queryForm.resultConfiguration.orientation"
				Data(6) = "webradiogroup"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)			
			End If	
		Case Else
			Reporter.ReportEvent micFail,"cai_defineResultType","Invalid action term specified!"	
	End Select
	If 	lcase(ActionTerm) = "clinical" or lcase(ActionTerm) = "geneexpression" Then
			Data(6) = "Link"
			Data(5) = "Run Query_2"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			If lcase(Environment.Value("type")) = "ie" Then
				Data(6) = "winbutton"
				Data(5) = "OK"
				Data(3) = "Click"
				Data(1) = "Windows Internet Explorer"
				s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			ElseIf lcase(Environment.Value("type")) = "ff" Then	
				Browser(Data(0)).Dialog("The Page").Page("The Page").WebButton("OK").Click
			End If	
	ElseIf lcase(ActionTerm) = 	"igvviewer" Then
		Data(6) = "Link"
		Data(5) = "View in Integrative Genomics Viewer"
		Data(3) = "Click"
		s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	
	End If
	cai_DefineResultType = "Pass"
End Function
'************************************************************************************************************************
Function cai_ActionOnQueryResults (Data,CurrentRow,ResultsFileObj)
	ActionTerm = Data(5)
	funcArg = ParseData4(Data(4))
	
	Data(3) = "Click"
	Data(5) = "Query Results"
	Data(6) = "WebElement"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	Select Case lcase(ActionTerm)
		Case "export to csv"
			Data(6) = "Link"
			Data(5) = "Export To CSV"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			cai_filedownload funcArg(0)
			
		Case "save subject list"
			Data(6) = "Link"
			Data(5) = "Save Subject List"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(6) = "WebEdit"
			Data(5) = "T1"
			Data(4) = funcArg(0)
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(6) = "WebEdit"
			Data(5) = "T2"
			Data(4) = funcArg(1)
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
						
			Data(6) = "webcheckbox"
			Data(5) = "T3"
			Data(3) = funcArg(2)
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(6) = "webbutton"
			Data(5) = "Save"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Case "view in integrative genomics viewer"
		
		Case "save query"
			Data(3) = "Click"
			Data(5) = "Save query as..."
			Data(6) = "WebElement"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(6) = "webedit"
			Data(5) = "queryForm.query.name"
			Data(4) = funcArg(0)
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(6) = "webedit"
			Data(5) = "queryForm.query.description"
			Data(4) = funcArg(1)
			Data(3) = "enter"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
			
			Data(6) = "Link"
			Data(5) = "Save Query"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		Case Else
		
	End Select
	cai_ActionOnQueryResults = "Pass"				
End Function
'************************************************************************************************************************
sub cai_filedownload (fileName)
	If lcase(Environment.Value("type")) = "ie" Then
		If Browser("caIntegrator").Dialog("File Download").Exist(10) Then
			Browser("caIntegrator").Dialog("File Download").WinButton("Save")
			Dialog("Download").Dialog("Save As").WinEdit("File name:").Set fileName
			Dialog("Download").Dialog("Save As").WinButton("Save").Click
			If Dialog("Download complete").Exist(10) Then
				Dialog("Download complete").WinButton("Close").Click
			End If
		End If
	ElseIf lcase(Environment.Value("type")) = "ff" Then
		Browser("caIntegrator").Dialog("Opening").Page("Opening").WebButton("OK").Click
		Browser("caIntegrator").Dialog("Enter name of file to save to").WinEdit("File name:").Set fileName
		Browser("caIntegrator").Dialog("Enter name of file to save to").WinButton("Save").Click
	End If
End sub

'***********************************************************************************************************************************************************
'Function to Change Url to the given url in the sheet by setting the value of environment value 
'************************************************************************************************************************************************************


public Function cai_set_env(Data,CurrentRow,ResultsFileObj)


	arr= parsedata4(data(4))
	msgbox Ubound(arr)

	browser(data(0)).navigate arr(2)

	status= caIntegrator_Login(Data,CurrentRow,ResultsFileObj)
	
	status = caIntegrator_LoginVerify(Data,CurrentRow,ResultsFileObj)
	
	if status = "fail" then 
		cai_set_env= "pass"
		Reporter.ReportEvent micPass,"Login verification with url " ,  arra(2)
	else
		cai_set_env="fail"
		Reporter.ReportEvent micfail,"Login verification with url " ,  arra(2)
	end if 


End Function
'***********************************************************************************************************************************************************





'********************************************************************************************************************************************************
'Function to very the objects are present on the page .
'*********************************************************************************************************************************************************

public function cai_Pub_Gen_obj_verify(Data,CurrentRow,ResultsFileObj)
	
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "j_password"
		data(6) = "webedit"

		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
		if len(status)= 0 then
		 status = "fail"
		end if 
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "password  not found"
			cai_Gen_obj_verify="fail"
		end if 


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "j_username"
		data(6) = "webedit"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" or status ="" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Userid  not found"
			cai_Gen_obj_verify="fail"
		end if 
	
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4)="Login"
		data(5) = "Login_2"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if (status = "fail") or status ="" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Login on the left hand is not found"
			cai_Gen_obj_verify="fail"
		end if 


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Register"
		data(4)="Register"
		data(6) = "link"
	    status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
		if status = "fail" or  status ="" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Register on the left hand is not found"
			cai_Gen_obj_verify="fail"
		end if 

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Support"
		data(4)="Support"
		data(6) = "link"
	     status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Support on the left hand is not found"
			cai_Gen_obj_verify="fail"
		end if 

		
		
	
		

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Tutorials"
		data(4)="Tutorials"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Tutorials on the left hand is not found"
			cai_Gen_obj_verify="fail"
		end if 



		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "User Guide"
		data(4)="User Guide"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "User Guide on the left hand is not found"
			cai_Gen_obj_verify="fail"
		end if 

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "User Guide"
		data(4)="User Guide"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "User Guide on the left hand is not found"
			cai_Gen_obj_verify="fail"
		end if 

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Manage Studies"
		data(4)="Manage Studies"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Manage Studies on the left hand should not be found."
			cai_Gen_obj_verify="fail"
		end if 

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Create New Study"
		data(4) = "Create New Study"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Create New Study on the left hand should not be found."
			cai_Gen_obj_verify="fail"
		end if 


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Manage Platforms"
		data(4) = "Manage Platforms"
		data(6) = "link"

		if len(status)= 0 then
		 status = "fail"
		end if 
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Manage Platforms on the left hand should not be found."
			cai_Gen_obj_verify="fail"
		end if 

		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "select"
		data(5) = "currentStudySubscriptionId"
		data(6) = "weblist"
		data(4)= "QA Test Study - Public"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		Items_in_list=Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")
		searcharr=array("qa1adminpub","qa2adminpub","qa1managpub","qa2managpub")

		for i= 0 to ubound(searcharr)
			If instr(1,Items_in_list,searcharr(i))>0 Then
				status="pass"
				Reporter.ReportEvent micpass,"Object verification passed" , searcharr(i) & "is present in the list."
				
			else
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , searcharr(i) & "is  not present in the list."
				cai_Gen_obj_verify="fail"
			end if 
		
		next

		nsearcharr= array("qa1adminpri","qa2adminpri","qa1managpri","qa2managpri")

		for i= 0 to ubound(nsearcharr)
		
			If instr(1,Items_in_list,nsearcharr(i))>0 Then
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , nsearcharr(i) & "is present in the list."
				cai_Gen_obj_verify="fail"
				
			else
				status="pass"
				Reporter.ReportEvent micpass,"Object verification failed" , nsearcharr(i) & "is  not present in the list."
				
			end if 
		
		next

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "select"
		data(4) =  "QA Test Study - Public"
		data(5) = "currentStudySubscriptionId"
		data(6) = "weblist"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" ,"QA Test Study - Public is not present in the list."
				cai_Gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Object verification pass" ,"QA Test Study - Public is  present in the list."
		end if 

		'step 15 - 16 17  To check the global list 


		data(0) = "caIntegrator"
		data(1)= "caIntegrator"
		data(3)= "verify"
		data(5)="Global Lists" 
		data(6)="Link"
		data(4)="Global Lists"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if status="pass" then 
		
			Reporter.ReportEvent micpass,"Object verification pass" , " GlobalList is  present."
		else
			Reporter.ReportEvent micfail,"Object verification fail" , " GlobalList is  present."
			cai_Gen_obj_verify="fail"
			
		end if 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator"
		data(3)= "click"
		data(5)="Global Lists" 
		data(6)="Link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		if status="pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , " GlobalList clicked Pass."
		else
			Reporter.ReportEvent micfail,"Object verification fail" , " GlobalList clicked failed."
			cai_Gen_obj_verify="fail"
		end if 
		
		data(0) = "caIntegrator"
		data(1)= "caIntegrator"
		data(3)= "verify"
		data(5)="Gene Lists" 
		data(6)="Link"
		data(4)="Gene Lists"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
						
		data(0) = "caIntegrator"
		data(1)= "caIntegrator"
		data(3)= "verify"
		data(5)="Subject Lists" 
		data(6)="Link"
		data(4)="Subject Lists"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
			
		
		
		
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) =  "Currently not logged in | Login"
		data(5) = "Currently not logged in"
		data(6) = "webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , "Currently not logged in | Login is not present on the page."
				cai_Gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Object verification pass" , "Currently not logged in | Login is  present on the page."
		end if 



		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) =  "view"
		data(5) = "study_logView"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if status= "pass" then 
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , "study_logView should nobe  not present on the page."
				cai_Gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Object verification pass" , "study_logView is not  present on the page."
		end if 

'"QA Test Study - Public"  

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(5) = "QA Test Study - Public"
		data(6) = "webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
		


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) =  "Welcome to QA Test Study - Public"
		data(5) = "Welcome to QA Test Study"
		data(6) = "webelement"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , "Welcome to QA Test Study - Public  is not present on the page."
				cai_Gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Object verification pass" , "Welcome to QA Test Study - Public is  present on the page."
		end if 


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(5) = "Create New List"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		wait(5)

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Manage Lists"
		data(3)= "verify"
		data(4)= "Must be registered to use this feature."
		data(5)="Must be registered to" 
		data(6)="webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if lcase(status) = "pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Must be registered to use this feature is  present on the page."
		else
			Reporter.ReportEvent micfail,"Object verification fail" , "Must be registered to use this feature is not  present on the page."
			cai_Gen_obj_verify="fail"
		end if 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Manage Lists"
		data(3)= "verify"
		data(4)= "Saved Queries"
		data(5)="Saved Queries" 
		data(6)="link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		

'---Saved Queries ---- link  not present
		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification fail" , "Saved Queries this feature is  present on the page."
			cai_Gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "Saved Queries this feature is not present on the page."
		end if 




		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Manage Lists"
		data(3)= "verify"
		data(4)= "Saved Lists"
		data(5)="Saved Lists" 
		data(6)="link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification fail" , "Saved Lists this feature is  present on the page."
			cai_Gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "Saved Lists this feature is not present on the page."
		end if 


		
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Manage Lists"
		data(3)= "click"
		data(4)= "KM Plot"
		data(5)="KM Plot" 
		data(6)="link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Kaplan-Meier"
		data(3)= "click"
		data(5)="For Queries and Saved" 
		data(6)="webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Kaplan-Meier"
		data(3)= "verify"
		data(5)="QuerySaved" 
		data(6)="weblist"
		data(4)="kmPlotForm.queryBasedForm.unselectedQueryNames"


		if Browser(Data(0)).Page(Data(1)).WebList(Data(5)).GetROProperty("name")=data(4) then 
			status = "pass"
		else 
			status="fail"
		end if

		if status = "pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Queries and Saved click pageis loaded."
		else 
			Reporter.ReportEvent micfail,"Object verification fail " , "Queries and Saved click page is not loaded."
			cai_Gen_obj_verify="fail"
		
		end if 

		list_of_items= Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")


		If instr(1,Items_in_list,"[Q]")>0 or  instr(1,Items_in_list,"[SL]")  Then
			status = "fail"
			Reporter.ReportEvent micfail,"Object verification pass" , "[Q] and [SL] items are present."
		else
			status="pass"
			Reporter.ReportEvent micpass,"Object verification pass" , "[Q] and [SL] items are not present."
		end if 



		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Kaplan-Meier"
		data(3)= "click"
		data(5)="Gene Expression Plot" 
		data(6)="link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "verify"
		data(5)="geneSymbols" 
		data(6)="webedit"
		data(4)="gePlotForm.annotationBasedForm.geneSymbol"


		if Browser(Data(0)).Page(Data(1)).Webedit(Data(5)).GetROProperty("name")=data(4) then 
			status = "pass"
			Reporter.ReportEvent micpass,"Object verification pass" , "Gene expression  pageis loaded."
		else 
			status="fail"
			Reporter.ReportEvent micfail,"Object verification failed." , "Gene expression  page is not loaded."
			cai_Gen_obj_verify="fail"
		end if



		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "verify"
		data(5)="For Genomic Queries" 
		data(6)="webelement"
		data(4)="For Genomic Queries"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


		if len(status)= 0 then
		 status = "fail"
		end if 

		if status="pass" then 
		
			Reporter.ReportEvent micfail,"Object verification fail" , "For genonmic expression tab is present."
			cai_Gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "For genonmic expression tab is not present."
			
		end if 
		
'step -20 --For Annotation Queries,caIntegrator - Gene Expression

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "click"
		data(5)="For Annotation Queries" 
		data(6)="webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 



		if lcase(status)="pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Annotation Queries tab is  present."
		else
			Reporter.ReportEvent micfail,"Object verification fail" , "For Annotation Queries tab is  not present."
			cai_Gen_obj_verify="fail"
			
		End if


	
'Avialble_queries is present ?? 
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "verify"
		data(5)="Avialble_queries" 
		data(6)="weblist"
		
		data(4) = "gePlotForm.clinicalQueryBasedForm.unselectedQueryNames"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
 
		 if status="pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Annotation Queries tab is  loaded."
		  else 
				Reporter.ReportEvent micpass,"Object verification fail." , "Annotation Queries tab is not  loaded."
				cai_Gen_obj_verify="fail"
		end if 	


		list_of_items= Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")


		If instr(1,Items_in_list,"[Q]")>0 or instr(1,Items_in_list,"[SL]")  Then
			status = "fail"
			Reporter.ReportEvent micfail,"Object verification fail" , "[Q] and [SL] items are present."
		else
			status="pass"
			Reporter.ReportEvent micpass,"Object verification pass" , "[Q] and [SL] items are not present."
		end if 

' GenePattern Analysis -link click 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "click"
		data(5)="GenePattern Analysis" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Link click on gene pattern failed."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Link click on gene pattern pass."
		end if 




' ---webelement text = "Must be registered to use this feature."  --

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - GenePattern"
		data(3)= "verify"
		data(5)="Must be registered to" 
		data(6)="webelement"
		data(4)="Must be registered to use this feature."
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"The page Genepattern verification failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"The page Genepattern verification pass."
		end if 

' --link  -- click 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - GenePattern"
		data(3)= "click"
		data(5)="Integrative Genomics Viewer" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Integrative Genomics Viewer link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Integrative Genomics Viewer linnk pass."
		end if 


'View IGV Selector -webelement --verify ,"caIntegrator - View IGV" --page
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "verify"
		data(5)="View IGV Selector" 
		data(6)="webelement"
		data(4) = "View IGV Selector"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"View IGV Selector page load failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"View IGV Selector page load pass."
		end if 

'Heat Map Viewer link --  click 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "click"
		data(5)="Heat Map Viewer" 
		data(6)="link"
		
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Heat Map Viewer link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Heat Map Viewer link pass."
		end if 

'View IGV Selector -- Text = "View IGV Selector" "verify"

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "verify"
		data(5)="copyNumberPlatformName" 
		data(6)="weblist"
		data(4)="copyNumberPlatformName"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)



		if lcase(Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("name"))=lcase(data(4)) then 
			status = "pass"
		else
			status = "fail"
		end if 


		if len(status)= 0 then
		 status = "fail"
		end if 
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"View IGV Selector page load failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"View IGV Selector page load pass."
		end if 


'Test External Links -- link  --click

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "click"
		data(5)="Test External Links" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		
		if len(status)= 0 then
		 status = "fail"
		end if 
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Test External Links link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Test External Links pass."
		end if 


'Test External Links  --webelement  --"verify" caIntegrator - 
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View External"
		data(3)= "verify"
		data(5)="Test External Links" 
		data(6)="webelement"
		data(4) = "Test External Links"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	
	if len(status)= 0 then
	 status = "fail"
	end if 

	if status = "fail" then 
		Reporter.ReportEvent micfail,"Object verification fail" ,"View External links --Page load failed.."
		cai_Gen_obj_verify="fail"
	else 
		Reporter.ReportEvent micpass,"Object verification pass" ,"View External links --Page load pass."
	end if 
		
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View External"
		data(3)= "click"
		data(5)="Login" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		
		if len(status)= 0 then
		 status = "fail"
		end if 
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"View External login link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"View External login link  load pass."
		end if 


'caIntegrator

		data(0) = "caIntegrator"
		data(1)= "caIntegrator"
		data(3)= "verify"
		data(5)="j_password" 
		data(6)="webedit"
		data(4)= "j_password"


		if  lcase(Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).GetROProperty("name")) = lcase(data(4))   then 
			status ="pass"
		else
			status = "fail"
		end if 

' name =   j_username

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"caIntegrator login page load failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"caIntegrator login page load pass."
		end if 

End Function 

'***********************************************************************************************************************************************************
'Function to validate the objects for Investigator role.
'***********************************************************************************************************************************************************



'projfunc_cai_invest_gen_obj_verify

public function cai_invest_gen_obj_verify(Data,CurrentRow,ResultsFileObj)
' 'Step 3 - In My Studies drop-down menu a the top, select  from Data(4) 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "select"
' 		msgbox "wait"
' 		
' 		wait(3)
' 		
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "select"
' 		data(4) =  "QA Test Study - Public"
' 		data(5) = "currentStudySubscriptionId"
' 		data(6) = "weblist"
' 		
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 		msgbox "wait agian"
' 		
' 		wait(3)
' 		
' 		
' 		
' 		
' 		
' 		
' 		
' 		
' 		
' 		
' 		
' 		
' 		data(4) =  "--Please Select--"
' 
' 		data(5) = "currentStudySubscriptionId"
' 		data(6) = "weblist"
' 		
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 		
' 		if status= "fail" then 
' 				status="fail"
' 				Reporter.ReportEvent micfail,"Object verification failed" ,   Data(4)  &  " is not present on the page."
' 				cai_invest_gen_obj_verify="fail"
' 			else 
' 				Reporter.ReportEvent micpass,"Object verification pass" ,  Data(4) &  " is not present on the page."
' 		end if 
' 		
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(4) ="To begin select a study from the ""  & My Studies   & "" drop down menu." 
' 		data(5) = "To begin select a study"
' 		data(6) = "webelement"
' 		
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if status= "fail" then 
' 				status="fail"
' 				Reporter.ReportEvent micfail,"Object verification failed" , data(4) &  " is not present on the page."
' 				cai_invest_gen_obj_verify="fail"
' 			else 
' 				Reporter.ReportEvent micpass,"Object verification pass" , Data(4) & " is  present on the page."
' 		end if 
' 		
' 		
' 		
' 'step 4 Verify that left menu contains: Support, Tutorials, User Guide
' 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "Support"
' 		data(4)=  "Support"
' 		data(6) = "link"
' 	     status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 		if status = "fail" then 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Support on the left hand is not found"
' 			cai_invest_gen_obj_verify="fail"
' 		end if 
' 
' 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "Tutorials"
' 		data(4)=  "Tutorials"
' 		data(6) = "link"
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if status = "fail" then 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Tutorials on the left hand is not found"
' 			cai_invest_gen_obj_verify="fail"
' 		end if 
' 
' 
' 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "User Guide"
' 		data(4)=  "User Guide"
' 		data(6) = "link"
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 		if status = "fail" then 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "User Guide on the left hand is not found"
' 			cai_invest_gen_obj_verify="fail"
' 		end if 
' 		
' 'Step 5 Verify that left menu does not contain Login and Register choices
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "j_username"
' 		data(6) = "webedit"
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 		if status = "fail" or status ="" then 
' 			Reporter.ReportEvent micpass,"Object verification Pass" , "Userid  not found"
' 			cai_invest_gen_obj_verify="pass"
' 		else 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Userid  found"
' 			cai_invest_gen_obj_verify="fail"
' 		
' 		end if 
' 	
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(4)="Login"
' 		data(5) = "Login_2"
' 		data(6) = "link"
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if (status = "fail") or status ="" then 
' 			Reporter.ReportEvent micpass,"Object verification pass." , "Login on the left hand is  not found"
' 			cai_invest_gen_obj_verify="pass"
' 		else
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Login on the left hand is  found"
' 			cai_invest_gen_obj_verify="fail"
' 
' 		end if 
' 'step 6: Verify that left menu does not contain Study Management Section with Manage Studies, Create Studies choices
' 
' 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "Manage Studies"
' 		data(4)="Manage Studies"
' 		data(6) = "link"
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if status = "pass" then 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Manage Studies on the left hand should not be found."
' 			cai_invest_gen_obj_verify="fail"
' 		end if 
' 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "Create New Study"
' 		data(4) = "Create New Study"
' 		data(6) = "link"
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if status = "pass" then 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Create New Study on the left hand should not be found."
' 			cai_invest_gen_obj_verify="fail"
' 		end if 
' 'step 7: Verify that left menu does not contain Application Management section with Manage Platforms choice
' 
' 		data(0) = "caIntegrator"
' 		data(1) = "caIntegrator"
' 		data(3) = "verify"
' 		data(5) = "Manage Platforms"
' 		data(4) = "Manage Platforms"
' 		data(6) = "link"
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 		if status = "pass" then 
' 			Reporter.ReportEvent micfail,"Object verification failed" , "Manage Platforms on the left hand should not be found."
' 			cai_invest_gen_obj_verify="fail"
' 		end if 
'Step 8: Verify that in Public Studies drop-down menu, the following studies are present: qa1adminpub, qa2adminpub, qa1managpub, qa2managpub
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "select"
		data(5) = "currentStudySubscriptionId"
		data(6) = "weblist"
		data(4)= "QA Test Study - Public"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		Items_in_list=Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")
		searcharr=array("qa1adminpub","qa2adminpub","qa1managpub","qa2managpub")

		for i= 0 to ubound(searcharr)
			If instr(1,Items_in_list,searcharr(i))>0 Then
				status="pass"
				Reporter.ReportEvent micpass,"Object verification passed" , searcharr(i) & "is present in the list."
				
			else
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , searcharr(i) & "is  not present in the list."
				cai_invest_gen_obj_verify="fail"
			end if 
		
		next
'Step 9: Verify that in Public Studies drop-down menu, the following studies are not present: qa1adminpri, qa2adminpri, qa1managpri, qa2managpri
		nsearcharr= array("qa1adminpri","qa2adminpri","qa1managpri","qa2managpri")

		for i= 0 to ubound(nsearcharr)
		
			If instr(1,Items_in_list,nsearcharr(i))>0 Then
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , nsearcharr(i) & "is present in the list."
				cai_invest_gen_obj_verify="fail"
				
			else
				status="pass"
				Reporter.ReportEvent micpass,"Object verification failed" , nsearcharr(i) & "is  not present in the list."
				
			end if 
		
		next
'Step 10  :In Public Studies drop-down menu a the top, select "QA Test Study - Public"

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(5) = "QA Test Study - Public"
		data(6) = "webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
		


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) =  "Welcome to QA Test Study - Public"
		data(5) = "Welcome to QA Test Study"
		data(6) = "webelement"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Object verification failed" , "Welcome to QA Test Study - Public  is not present on the page."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Object verification pass" , "Welcome to QA Test Study - Public is  present on the page."
		end if 		
'Step 11 :Verify that left menu contains: Support, Tutorials, User Guide

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Support"
		data(4)=  "Support"
		data(6) = "link"
	     status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Support on the left hand is not found"
			cai_invest_gen_obj_verify="fail"
		end if 


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Tutorials"
		data(4)=  "Tutorials"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Tutorials on the left hand is not found"
			cai_invest_gen_obj_verify="fail"
		end if 



		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "User Guide"
		data(4)=  "User Guide"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "User Guide on the left hand is not found"
			cai_invest_gen_obj_verify="fail"
		end if 
		
'Step 12 Verify that left menu does not contain Login and Register choices
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "j_username"
		data(6) = "webedit"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" or status ="" then 
			Reporter.ReportEvent micpass,"Object verification Pass" , "Userid  not found"
			cai_invest_gen_obj_verify="pass"
		else 
			Reporter.ReportEvent micfail,"Object verification failed" , "Userid  found"
			cai_invest_gen_obj_verify="fail"
		
		end if 
	
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4)="Login"
		data(5) = "Login_2"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if (status = "fail") or status ="" then 
			Reporter.ReportEvent micpass,"Object verification pass." , "Login on the left hand is  not found"
			cai_invest_gen_obj_verify="pass"
		else
			Reporter.ReportEvent micfail,"Object verification failed" , "Login on the left hand is  found"
			cai_invest_gen_obj_verify="fail"

		end if 
'step 13: Verify that left menu does not contain Study Management Section with Manage Studies, Create Studies choices


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Manage Studies"
		data(4)=  "Manage Studies"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Manage Studies on the left hand should not be found."
			cai_invest_gen_obj_verify="fail"
		end if 

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Create New Study"
		data(4) = "Create New Study"
		data(6) = "link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Create New Study on the left hand should not be found."
			cai_invest_gen_obj_verify="fail"
		end if 
'step 14: Verify that left menu does not contain Application Management section with Manage Platforms choice

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "Manage Platforms"
		data(4) = "Manage Platforms"
		data(6) = "link"

		if len(status)= 0 then
		 status = "fail"
		end if 
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		if status = "pass" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Manage Platforms on the left hand should not be found."
			cai_invest_gen_obj_verify="fail"
		end if 
'Step 15 : Click on Study Log: View link
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(5) = "View"
		data(4) = "View"
		data(6) = "link"

		if len(status)= 0 then
		 status = "fail"
		end if 
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Click on Study Log failure."
			cai_invest_gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "Click on Study Log failure."
			cai_invest_gen_obj_verify="pass"
		end if 
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(5) = "View Study Log"
		data(4) = "View Study Log"
		data(6) = "webelement"

		if len(status)= 0 then
		 status = "fail"
		end if 
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "After View Study Log Click on Study Log failure."
			cai_invest_gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "After  View Study Log Click on Study Log failure."
			cai_invest_gen_obj_verify="pass"
		end if 
'Step 16 : Click on Study Log: View link
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(5) = "Home"
		data(4) = "Home"
		data(6) = "link"

		if len(status)= 0 then
		 status = "fail"
		end if 
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification failed" , "Click on Home failure."
			cai_invest_gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "Click on Home failure."
			cai_invest_gen_obj_verify="pass"
		end if 		
'Verification after Home click		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) =  "Welcome to QA Test Study - Public"
		data(5) = "Welcome to QA Test Study"
		data(6) = "webelement"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"OVerification after Home click failed" , "Welcome to QA Test Study - Public  is not present on the page."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Verification after Home click  pass" , "Welcome to QA Test Study - Public is  present on the page."
		end if 

		
'Step 17 :Click on Search QA Test Study - Public in left menu
'  Search QA Test Study


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(5) = "Search QA Test Study"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Search QA Test Study click failed" , "Welcome to QA Test Study - Public  is not present on the page."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Search QA Test Study click  pass" , "Welcome to QA Test Study - Public is  present on the page."
		end if 
'Search QA Test Study   'webelement
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "Search QA Test Study - Public"
		data(5) = "Search QA Test Study"
		data(6) = "webelement"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Search QA Test Study click failed" , "Welcome to QA Test Study - Public  is not present on the page."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Search QA Test Study click  pass" , "Welcome to QA Test Study - Public is  present on the page."
		end if 
'msgbox "step 18"
'Step 18 : Click on Create New List in left menu


		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "Create New List"
		data(5) = "Create New List"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"SClick on Create New List in left menu failed" , "Click on Create New List in left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Click on Create New List in left menu" , "Click on Create New List in left menu Success."
		end if 
'Create List
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "Create List"
		data(5) = "Create List"
		data(6) = "webelement"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"After Click on Create New List in left menu verification failed" , "Click on Create New List in left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"After Click on Create New List in left menu verification Success" , "Click on Create New List in left menu Success."
		end if 
'msgbox "step 19"
'Step 19 : Click on Saved Queries in left menu.

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "Saved Queries"
		data(5) = "Saved Queries"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Saved Queries in left menu failed" , "Saved Queries in left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Saved Queries in left menu Success" , "Saved Queries in left menu Success."
		end if 
'msgbox "step 20"
'step 20 : My Queries

	Data(4) = "My Queries"
	data(5) = "My Queries"
	
	status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"step 20-21 My Queries in left menu failed" , "MY Queries in left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"My Queries in left menu Success" , "My Queries in left menu Success."
		end if 	
' Step 21 Verify that all individual queries under My Queries contain "qa3inves" in name
 
 status = Findall_childojects(Data,CurrentRow,ResultsFileObj ,"MyQueries" , "link")	
		
'msgbox "step 22"
'Step 22 Click on Saved Lists in left menu
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "Saved Lists"
		data(5) = "Saved Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 22 Saved Lists in left menu failed" , "Saved Lists in left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 22 Saved Lists in left menu Success" , "Saved Lists in left menu Success."
		end if 
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "Global Lists"
		data(5) = "Global Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 22 Global Lists verified in left menu failed" , "Global Lists left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 22 Global Lists Verified menu Success" , "Global Lists left menu Success."
		end if 
		
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "My Lists"
		data(5) = "My Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"My Lists verified in left menu failed" , "My Lists left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"My Lists Verified menu Success" , "My Lists left menu Success."
		end if 
'msgbox "step 23"
'Step 23 Click on Global Lists in left menu

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "Global Lists"
		data(5) = "Global Lists"
		data(6) = "link"
		
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		st1= Findall_childojects(Data,CurrentRow,ResultsFileObj ,"GlobalList" , "link")	
		
		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 23 Global Lists clicked in left menu failed" , "Global Lists Clicked left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 23 Global Lists clicked   Success" , "Global Lists clicked Success."
		end if 
		
		
' Gene Lists is present
'Subject Lists


	
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "Gene Lists"
		data(5) = "Gene Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 23 Gene Lists verified in left menu failed" , "Gene Lists verified left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 23 Gene Lists verified Success" , "Gene Lists verified Success."
		end if 

		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "Subject Lists"
		data(5) = "Subject Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 23 Gene Lists verified  in left menu failed" , "Gene Lists verified left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 23 Gene Lists verified Success" , "Gene Lists verified Success."
		end if 
'msgbox "step 24- 25"
'Step 24- 25 Click on Gene Lists below Global Lists in left menu
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "Gene Lists"
		data(5) = "Gene Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 24-25 Gene Lists Click in left menu failed" , "Gene Lists click left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 24-25 Gene Lists click Success" , "Gene Lists click Success."
		end if 

'Global Gene List
		 status = Findall_childojects(Data,CurrentRow,ResultsFileObj ,"Gene List" , "link")	
		'status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 24-25 Global Gene List verify in left menu failed" , "Global Gene List verify left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 24-25 Global Gene List verify Success" , "Global Gene List verify Success."
		end if 
		
'msgbox "step 26-27"
'Step 26 -27 Click on Subject Lists below Global Lists in left menu
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "Subject Lists"
		data(5) = "Subject Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		st1 = Findall_childojects(Data,CurrentRow,ResultsFileObj ,"Gene List" , "link")	
		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 26-27 Subject Lists click left menu failed" , "Subject Lists click left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 26-27 Subject Lists click verify Success" , "Subject Lists click verify Success."
		end if 
'Global Subject List is present
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "verify"
		data(4) = "Global Subject List"
		data(5) = "Global Subject List"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 26-27 Global Subject List verify left menu failed" , "Global Subject List verify left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 26-27 Global Subject List verify Success" , "Global Subject List verify Success."
		end if 
'msgbox "step 28-28-29"
'Step 28-28-29 Click on My Lists in left menu
		data(0) = "caIntegrator"
		data(1) = "caIntegrator"
		data(3) = "click"
		data(4) = "My Lists"
		data(5) = "My Lists"
		data(6) = "link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 


		if status= "fail" then 
				status="fail"
				Reporter.ReportEvent micfail,"Step 28-28-29  My Lists click left menu failed" , "My Lists click left menu Failure."
				cai_invest_gen_obj_verify="fail"
			else 
				Reporter.ReportEvent micpass,"Step 28-28-29  My Lists click Success" , "My Lists click Success."
		end if
		 
		data(3) = "verify"
		data(4)= "My Gene List"
		data(5)= "My Gene List"

	status = Findall_childojects(Data,CurrentRow,ResultsFileObj ,"Gene List" , "link")	
	
	
	'Step -33-		Click on KM Plot in left menu


		
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Manage Lists"
		data(3)= "click"
		data(4)= "KM Plot"
		data(5)="KM Plot" 
		data(6)="link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

'Step 34 Click on tab For Queries and Saved Lists

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Kaplan-Meier"
		data(3)= "click"
		data(5)="For Queries and Saved" 
		data(6)="webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Kaplan-Meier"
		data(3)= "verify"
		data(5)="QuerySaved" 
		data(6)="weblist"
		data(4)="kmPlotForm.queryBasedForm.unselectedQueryNames"


		if Browser(Data(0)).Page(Data(1)).WebList(Data(5)).GetROProperty("name")=data(4) then 
			status = "pass"
		else 
			status="fail"
		end if

		if status = "pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Queries and Saved click pageis loaded."
		else 
			Reporter.ReportEvent micfail,"Object verification fail " , "Queries and Saved click page is not loaded."
			cai_Gen_obj_verify="fail"
		
		end if 
'Step 35 Under section 1), in Available Queries and Lists box, verify that all items contain either "[Q]-qa3inves …", "[SL]-qa3inves …",  or "[SL-G]-Global …"

		list_of_items= Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")


		If instr(1,Items_in_list,"[Q]-qa3inves")>0 or  instr(1,Items_in_list,"[SL]-qa3inves") or instr(1,Items_in_list,"[SL-G]-Global")>0   Then
			status = "pass"
			Reporter.ReportEvent micfail,"Object verification pass" , ""[Q]-qa3inves …", "[SL]-qa3inves …",  or "[SL-G]-Global …" items are present."
		else
			status="fail"
			Reporter.ReportEvent micpass,"Object verification pass" , ""[Q]-qa3inves …", "[SL]-qa3inves …",  or "[SL-G]-Global …" items are not present."
		end if 


'Step  36 Click on Gene Expression Plot in left menu

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Kaplan-Meier"
		data(3)= "click"
		data(5)="Gene Expression Plot" 
		data(6)="link"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
		

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "verify"
		data(5)="geneSymbols" 
		data(6)="webedit"
		data(4)="gePlotForm.annotationBasedForm.geneSymbol"


		if Browser(Data(0)).Page(Data(1)).Webedit(Data(5)).GetROProperty("name")=data(4) then 
			status = "pass"
			Reporter.ReportEvent micpass,"Object verification pass" , "Gene expression  pageis loaded."
		else 
			status="fail"
			Reporter.ReportEvent micfail,"Object verification failed." , "Gene expression  page is not loaded."
			cai_Gen_obj_verify="fail"
		end if

'Step 37 Click on tab For Genomic Queries


		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "click"
		data(5)="For Genomic Queries" 
		data(6)="webelement"
		data(4)="For Genomic Queries"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)


		if len(status)= 0 then
		 status = "fail"
		end if 

		if status="pass" then 
		
			Reporter.ReportEvent micfail,"Object verification fail" , "For genonmic expression tab is present."
			cai_Gen_obj_verify="fail"
		else
			Reporter.ReportEvent micpass,"Object verification pass" , "For genonmic expression tab is not present."
			
		end if 
		
		data(5) = "gePlotForm.geneExpressionQuery"


		list_of_items= Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")


		If instr(1,Items_in_list,"qa3inves - EGFR GeneEx Query")>0   Then
			status = "pass"
			Reporter.ReportEvent micfail,"Object verification fail" , "qa3inves - EGFR GeneEx Query items are present."
		else
			status="fail"
			Reporter.ReportEvent micpass,"Object verification pass" , "qa3inves - EGFR GeneEx Query are not present."
		end if 
		
'step -38 --For Annotation Queries,caIntegrator - Gene Expression

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "click"
		data(5)="For Annotation Queries" 
		data(6)="webelement"
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 



		if lcase(status)="pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Annotation Queries tab is  present."
		else
			Reporter.ReportEvent micfail,"Object verification fail" , "For Annotation Queries tab is  not present."
			cai_Gen_obj_verify="fail"
			
		End if


	
'Avialble_queries is present ?? 
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "verify"
		data(5)="Avialble_queries" 
		data(6)="weblist"
		
		data(4) = "gePlotForm.clinicalQueryBasedForm.unselectedQueryNames"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 
 
		 if status="pass" then 
			Reporter.ReportEvent micpass,"Object verification pass" , "Annotation Queries tab is  loaded."
		  else 
				Reporter.ReportEvent micpass,"Object verification fail." , "Annotation Queries tab is not  loaded."
				cai_Gen_obj_verify="fail"
		end if 	


		list_of_items= Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("all items")


		If instr(1,Items_in_list,"[Q]")>0 or instr(1,Items_in_list,"[SL]")  Then
			status = "fail"
			Reporter.ReportEvent micfail,"Object verification fail" , "[Q] and [SL] items are present."
		else
			status="pass"
			Reporter.ReportEvent micpass,"Object verification pass" , "[Q] and [SL] items are not present."
		end if 

' GenePattern Analysis -link click 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - Gene Expression"
		data(3)= "click"
		data(5)="GenePattern Analysis" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Link click on gene pattern failed."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Link click on gene pattern pass."
		end if 




' ---webelement text = "Must be registered to use this feature."  --

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - GenePattern"
		data(3)= "verify"
		data(5)="Must be registered to" 
		data(6)="webelement"
		data(4)="Must be registered to use this feature."
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"The page Genepattern verification failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"The page Genepattern verification pass."
		end if 

' --link  -- click 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - GenePattern"
		data(3)= "click"
		data(5)="Integrative Genomics Viewer" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Integrative Genomics Viewer link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Integrative Genomics Viewer linnk pass."
		end if 


'View IGV Selector -webelement --verify ,"caIntegrator - View IGV" --page
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "verify"
		data(5)="View IGV Selector" 
		data(6)="webelement"
		data(4) = "View IGV Selector"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"View IGV Selector page load failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"View IGV Selector page load pass."
		end if 

'Heat Map Viewer link --  click 

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "click"
		data(5)="Heat Map Viewer" 
		data(6)="link"
		
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		if len(status)= 0 then
		 status = "fail"
		end if 

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Heat Map Viewer link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Heat Map Viewer link pass."
		end if 

'View IGV Selector -- Text = "View IGV Selector" "verify"

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "verify"
		data(5)="copyNumberPlatformName" 
		data(6)="weblist"
		data(4)="copyNumberPlatformName"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)



		if lcase(Browser(data(0)).page(data(1)).weblist(data(5)).getroproperty("name"))=lcase(data(4)) then 
			status = "pass"
		else
			status = "fail"
		end if 


		if len(status)= 0 then
		 status = "fail"
		end if 
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"View IGV Selector page load failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"View IGV Selector page load pass."
		end if 


'Test External Links -- link  --click

		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View IGV"
		data(3)= "click"
		data(5)="Test External Links" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		
		if len(status)= 0 then
		 status = "fail"
		end if 
		
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"Test External Links link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"Test External Links pass."
		end if 


'Test External Links  --webelement  --"verify" caIntegrator - 
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View External"
		data(3)= "verify"
		data(5)="Test External Links" 
		data(6)="webelement"
		data(4) = "Test External Links"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	
	if len(status)= 0 then
	 status = "fail"
	end if 

	if status = "fail" then 
		Reporter.ReportEvent micfail,"Object verification fail" ,"View External links --Page load failed.."
		cai_Gen_obj_verify="fail"
	else 
		Reporter.ReportEvent micpass,"Object verification pass" ,"View External links --Page load pass."
	end if 
		
		data(0) = "caIntegrator"
		data(1)= "caIntegrator - View External"
		data(3)= "click"
		data(5)="Login" 
		data(6)="link"
		
		status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

		
		if len(status)= 0 then
		 status = "fail"
		end if 
		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"View External login link failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"View External login link  load pass."
		end if 


'caIntegrator

		data(0) = "caIntegrator"
		data(1)= "caIntegrator"
		data(3)= "verify"
		data(5)="j_password" 
		data(6)="webedit"
		data(4)= "j_password"


		if  lcase(Browser(Data(0)).Page(Data(1)).WebEdit(Data(5)).GetROProperty("name")) = lcase(data(4))   then 
			status ="pass"
		else
			status = "fail"
		end if 

' name =   j_username

		if status = "fail" then 
			Reporter.ReportEvent micfail,"Object verification fail" ,"caIntegrator login page load failed.."
			cai_Gen_obj_verify="fail"
		else 
			Reporter.ReportEvent micpass,"Object verification pass" ,"caIntegrator login page load pass."
		end if 
	
' 		'status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
' 
' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if status= "fail" then 
' 				status="fail"
' 				Reporter.ReportEvent micfail,"Step 28-28-29  My Gene List verify  left menu failed" , "My Gene List verify left menu Failure."
' 				cai_invest_gen_obj_verify="fail"
' 			else 
' 				Reporter.ReportEvent micpass," Step 28-28-29  My Gene List verify Success" , "My Gene List List verify Success."
' 		end if
' 		
' 		data(3) = "verify"
' 		data(4)= "Subject Lists"
' 		data(5)= "Subject Lists"
		
	'status = Findall_childojects(Data,CurrentRow,ResultsFileObj ,"Gene List" , "link")	
		'status = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

' 		if len(status)= 0 then
' 		 status = "fail"
' 		end if 
' 
' 
' 		if status= "fail" then 
' 				status="fail"
' 				Reporter.ReportEvent micfail,"Step 28-28-29  Subject Lists verify  left menu failed" , "Subject Lists verify left menu Failure."
' 				cai_invest_gen_obj_verify="fail"
' 			else 
' 				Reporter.ReportEvent micpass,"Step 28-28-29  Subject Lists verify Success" , "Subject Lists  List verify Success."
' 		end if
' 		




End function 

'****************************************************************************************************************************************************************
'Function to find child object in a given object 
' Parent object 
' Child Object 
''****************************************************************************************************************************************************************
public Function Findall_childojects(Data,CurrentRow,ResultsFileObj ,Parentobj , ChildObjtype)

				Set oDesc = Description.Create()
				oDesc("micclass").Value = "Link"  ' ---Childobjtype
		
		
		select case Parentobj
		
		case "MyQueries"
			Set Links = Browser(data(0)).Page(data(1)).webelement("MyQueries" ).ChildObjects(oDesc)
			instrg="qa3inves"
		case "Gene List"
				
			Set Links = Browser(data(0)).Page(data(1)).webelement("Gene List" ).ChildObjects(oDesc)
			instrg="qa3inves"
		case "GlobalList"
			Set Links = Browser(data(0)).Page(data(1)).webelement("GlobalList" ).ChildObjects(oDesc)
		    instrg="Global"
		 case "Studylist"
		end select 
		
		    NumberOfLists = Links.Count()
		For i = 0 To NumberOfLists - 1
		    'Lists(i).Select i + 1
		     
		    Nm= Links(i).getroproperty("Name")
		    if len(trim(Nm)) >0 then      
	
				if Inexecption(Data,CurrentRow,ResultsFileObj,Nm)= "fail" then 
	
				    	if Instr(1, Nm, instrg, 1) >0 then 
				    			Reporter.ReportEvent micpass,instrg & " Present In the :" &  Parentobj , instrg & " Present In the :" &  Parentobj
				    	else 
				    	msgbox "failing.." & "NM= " & Nm
				    	wait(3)
				    			Reporter.ReportEvent micfail,instrg & " NOT  Present In the :" &  Parentobj , instrg & " NOT  Present In the :" &  Parentobj
				    					    			
				    	end if
				else 
			    
			    end if 
		   end if 
		Next
		
		set oDesc= nothing


end function 


function Inexecption(Data,CurrentRow,ResultsFileObj,str)
Inexecption="fail"

	i= 0 
	
	arr_exception=array("My Queries","Saved Lists" ,"Global Lists", "Gene List", "Subject Lists", "My Lists", "Gene Lists","Subject Lists")
	for i = 0 to Ubound(arr_exception) 
	
		if lcase(Trim(str)) =lcase(Trim(arr_exception(i)))  then 
			Inexecption="pass"
			exit function
		else
			
		end if  
	next 
end function 