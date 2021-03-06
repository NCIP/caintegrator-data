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
Public IE
'********************************************************************************************************************************************
Public Function  StartApp(Data)
' the following two environment vars will set  the Record and Run Settings to define the browser an the app that is start when the test starts
' during a run they will change the env var values but have no effect on browser navigation
'Environment.Value("BROWSER_ENV")="IE"
'Environment.Value("URL_ENV")="http://google.com "

'ST_Driver script Run Setting shouldbe set to Use any existing browser and the following lines will start the browser for the test
Set IE = CreateObject("InternetExplorer.Application")
IE.Visible = True

TestEnv = Environment.Value("TestEnv")
App = Data(0) & "_"& ucase(TestEnv)
Select Case App
   Case "PO_QA1"
		'browser(Data(0)).navigate " http://cbvapp-q1012:19480/po-web/home.action"
		IE.Navigate "http://cbvapp-q1012:19480/po-web/home.action"
   Case "PO_QA2"
		'browser(Data(0)).navigate " http://ncias-q224-v.nci.nih.gov:19480/po-web/home.action"
		IE.Navigate "http://ncias-q224-v.nci.nih.gov:19480/po-web/home.action"
   Case "TrialRegistration_QA1"
		'browser(Data(0)).navigate "http://cbvapp-q1012:19280/registry/home.action"
		IE.Navigate "http://cbvapp-q1012:19280/registry/home.action"
   Case "TrialRegistration_QA2"
		'browser(Data(0)).navigate "http://ncias-q224-v.nci.nih.gov:19280/registry/home.action"
		IE.Navigate  "http://ncias-q224-v.nci.nih.gov:19280/registry/home.action"
   Case "ProtocolAbstraction_QA1"
		'browser(Data(0)).navigate "http://cbvapp-q1012:19280/pa/report/studyProtocolshowCriteria.action"
		IE.Navigate "http://cbvapp-q1012:19280/pa/report/studyProtocolshowCriteria.action"
   Case "ProtocolAbstraction_QA2"
		'browser(Data(0)).navigate "http://ncias-q224-v.nci.nih.gov:19280/pa/protected/studyProtocolshowCriteria.action"
		IE.Navigate "http://ncias-q224-v.nci.nih.gov:19280/pa/protected/studyProtocolshowCriteria.action"
    Case "ProtocolAbstraction_PROD"
		'browser(Data(0)).navigate " http://trials.nci.nih.gov/pa"
		IE.Navigate "http://trials.nci.nih.gov/pa"
    Case "TermBrowser_DEV"
		'browser(Data(0)).navigate " http://ncit-dev.nci.nih.gov/ncitbrowser/start.jsf "
		IE.Navigate "http://ncit-dev.nci.nih.gov/ncitbrowser/start.jsf"
    Case "TermBrowser_QA"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://nciterms-qa.nci.nih.gov/"
    Case "TermBrowser_STAGE"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://nciterms-stage.nci.nih.gov/"
    Case "TermBrowser_STAGE2"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://ncit-stage.nci.nih.gov/"
    Case "TermBrowser_PROD"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://nciterms.nci.nih.gov/"
  Case "NcimBrowser_NCIMQA"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://ncim-qa.nci.nih.gov/"
   Case "NcimBrowser_NCIMSTAGE"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://ncim-stage.nci.nih.gov/"	
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "The application you want to start was not found in the start application function!"
			StartApp(Data) =Fail

End Select

End Function
'*******************************************************************************************************************************************

Public Function  StartAppURL(Data)
' the following two environment vars will set  the Record and Run Settings to define the browser an the app that is start when the test starts
' during a run they will change the env var values but have no effect on browser navigation
'Environment.Value("BROWSER_ENV")="IE"
'Environment.Value("URL_ENV")="http://google.com "

'ST_Driver script Run Setting shouldbe set to Use any existing browser and the following lines will start the browser for the test
Set IE = CreateObject("InternetExplorer.Application")
IE.Visible = True

TestURL = Environment.Value("TestURL")
IE.Navigate TestURL

End Function
'*******************************************************************************************************************************************

Public Function ProjFunc_Handler (Data,CurrentRow,ResultsFileObj)
	GUIObjRef = "Browser(Data(0)).Page(Data(1))."
	If Data(2) <> "" Then
		GUIObjRef = GUIObjRef & "Frame(Data(2))."
	End If
	'GUIObjRef = GUIObjRef & "Link(Data(5))."
	GUIObjRef = GUIObjRef & Data(6) & "(Data(5))."


	Select Case LCase(Data(6))
		Case "projfunc_cai_login"
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
		Case "projfunc_caa_verifyhomepage"
			status = caA_verifyHomePage (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_caa_login"
			status = caA_Login (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_caa_createexperiment"
			status = caA_CreateExperiment (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_caa_getexperimentid"
			status = caA_GetExperimentID (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_caa_manageexperiments"
			status = caA_ManageExperiments (Data,CurrentRow,ResultsFileObj)
		Case "projfunc_caa_waitformessage"
			status = caA_WaitForMessage (Data,CurrentRow,ResultFileObj)
		Case "projfunc_caa_check_login_success"
			status = caA_check_login_success (Data,CUrrentRow, ResultsFileObj)
		Case Else
			Reporter.ReportEvent micFail, Data(5), "The object type was not found!"
	End Select
	ProjFunc_Handler = status
End Function
'**********************************************************************************************************************************************************
'					caINTEGRATOR PROJECT SPECIFIC FUNCTIONS										  '
'						VIVEK RAMANI												  '
'**********************************************************************************************************************************************************

'************************************************************************************************************************
Public Function caIntegrator_Login(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) USERNAME
	'2) PASSWORD	
	'********************************************************************************************
	funcArg = parseData4(Data(4))
	'set username
	Data(6) = "WebEdit"
	Data(5) = "j_username"
	Data(4) = funcArg(0)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	'set password
	Data(6) = "WebEdit_secure"
	Data(5) = "j_password"
	Data(4) = funcArg(1)
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
	If (var_Exist = "True") Then
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

	If (var_Exist = "Pass" )Then
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
			status = validateEdit (oTextArea,myRandomEditField,sAction,sUpdate,oCheckBox)
		Case "Cancel"
			Data(1) = "caIntegrator - View/Edit studyLog"
			Data(6) = "WebButton"
			Data(5) = "Cancel"
			Data(3) = "Click"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Browser(Data(0)).Sync
			status = validateEdit (oTextArea,myRandomEditField,sAction,sUpdate,oCheckBox)
	End Select
	caIntegrator_EditStudyLog = status
End Function
'************************************************************************************************************************
Function validateEdit(oTextArea,myRandomEditField,sAction,sUpdate,oCheckBox)
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
			status = verify_CreateStudy (newStudyName,newStudyDesc)
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
Function verify_CreateStudy(newStudyName,newStudyDesc)
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
	TestDir= Environment("TestDir")
	For BackDirLevel = 1 To 2
		pos = InstrRev(TestDir, "\", -1, 1)
		TestDir = Left(TestDir, pos-1) 
	Next
	'********************************************
	'Upload image for study logo
	'********************************************************************************************
	'THE ARGUMENT FOR THE FUNCTION IS AS FOLLOWS (DATA(4) VALUE FIELD):
	'1) STUDY LOGO FILE NAME	
	'********************************************************************************************
	studyLogoFilename = parseData4(Data(4))(0)

	If (0 = InStr(1,studyLogoFilename,"\\",1)) Then
		StudyLogoFileName = TestDir & "\Data\" & studyLogoFilename
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
	TestDir= Environment("TestDir")
	For BackDirLevel = 1 To 2
		pos = InstrRev(TestDir, "\", -1, 1)
		TestDir = Left(TestDir, pos-1) 
	Next
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
				sAnnotationGrpFileName = TestDir & "\Data\" & AnnotationGrpFileName
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
	TestDir= Environment("TestDir")
	For BackDirLevel = 1 To 2
		pos = InstrRev(TestDir, "\", -1, 1)
		TestDir = Left(TestDir, pos-1) 
	Next
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
				subjectDataSource = TestDir & "\Data\" & funcArg(0)
				subDesc = Split(subjectDataSource,"\",-1,1)
				e_subDesc = subDesc(2)
			Else
				subjectDataSource = funcArg(0)
				subDesc = Split(subjectDataSource,"\",-1,1)
				e_subDesc = subDesc(10)
			End If			
			
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
			
			Data(1) = "caIntegrator - Define Fields for Subject Data"
			Data(6) = "WebButton"
			Data(5) = "Save"
			s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			Data(1) = "caIntegrator - Edit Study"
			Browser(Data(0)).Page(Data(1)).Sync
			WaitForProcessing (Data)

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
			Data(4) = "Type###Not Loaded###Load Subject Annotation Source"
			Data(5) = "WebTable_ClickOnLinkInCell"
			Data(6) = "keyword"
			Data(7) = "3"
			Data(8) = "5"
			clickStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

			WaitForProcessing (Data)
			Browser(Data(0)).Page(Data(1)).Sync


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
			WaitForProcessing (Data)
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
	TestDir= Environment("TestDir")
	For BackDirLevel = 1 To 2
		pos = InstrRev(TestDir, "\", -1, 1)
		TestDir = Left(TestDir, pos-1) 
	Next
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
			Browser(Data(0)).Page(Data(1)).Sync
			WaitForProcessing (Data)

			isFound = verify_GenomicDataSourceTable (caA_expId,"Not Mapped")

			If isFound = True Then
				Reporter.ReportEvent micPass, "caIntegrator_GenomicDataSources", "Added / Edited Genomic Data Source successfully!!"
				caIntegrator_GenomicDataSources = "Pass"
			ElseIf isFound = False Then
				Reporter.ReportEvent micFail, "caIntegrator_GenomicDataSources", "Add / Edit Genomic Data Source failed!!"
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
				subjectTosampleMapFile = TestDir & "\Data\" & parseData4(Data(4))(1)
			Else
				subjectTosampleMapFile = parseData4(Data(4))(1)
			End If	

			If (0 = InStr(1,parseData4(Data(4))(2),"\\",1)) Then
				controlSampleFile = TestDir & "\Data\" & parseData4(Data(4))(2)
			Else
				controlSampleFile = parseData4(Data(4))(2)
			End If	

			
			isFound = verify_GenomicDataSourceTable (caA_expId,"Not Mapped")

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
				Browser(Data(0)).Page(Data(1)).Sync

				WaitForProcessing (Data)
				isFound = False
				isFound = verify_GenomicDataSourceTable (caA_expId,"Ready to be loaded")
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
			WaitForProcessing (Data)
			Browser(Data(0)).Page(Data(1)).Sync

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
Function verify_GenomicDataSourceTable(caA_expId,eStatus)
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

		If (GetVariable("eExpID") = caA_expId and GetVariable("aStatus") = eStatus) Then
			isFound = True
			Exit For
		End If
	Next
	verify_GenomicDataSourceTable = isFound
end Function
'************************************************************************************************************************
Function caIntegrator_ImagingDataSources (Data,CurrentRow,ResultsFileObj)

End Function
'************************************************************************************************************************
Function caIntegrator_ExternalLinks (Data,CurrentRow, ResultsFileObj)
	'********************************************
	TestDir= Environment("TestDir")
	For BackDirLevel = 1 To 2
		pos = InstrRev(TestDir, "\", -1, 1)
		TestDir = Left(TestDir, pos-1) 
	Next
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
					Data(4) = TestDir & "\Data\" & funcArg(0)
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
					Data(4) = TestDir & "\Data\" & funcArg(0)
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
	WaitForProcessing (Data)
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
		
		Case "remove"

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
'**********************************************************************************************************************************************************
'					caARRAY PROJECT SPECIFIC FUNCTIONS										  '
'						VIVEK RAMANI												  '
'**********************************************************************************************************************************************************
Function caA_verifyHomePage (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) NONE
	'********************************************************************************************	
	If (Browser(Data(0)).Page(Data(1)).Object.title = "Certificate Error: Navigation Blocked") Then
		Browser(Data(0)).Page(Data(1)).Link("certificate_continue").Click
		If (Browser(Data(0)).Page(Data(1)).Object.title = "caArray - Array Data Management System") Then
			caA_verifyHomePage = "Pass"
		Else
		caA_verifyHomePage = "Fail"
		End If
	End If
End Function
'************************************************************************************************************************
Function caA_Login (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) USERNAME
	'2) PASSWORD (ENCRYPTED)
	'********************************************************************************************		
	funcArg = parseData4(Data(4))

	'Set userName
	Data(6) = "WebEdit"
	Data(5) = "j_username"
	Data(4) = funcArg(0) 
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	

	'Set password secure
	Data(6) = "WebEdit_secure"
	Data(5) = "j_password"
	Data(4) = funcArg(1) 
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)	

	'Click on Login link
	Data(6) = "Link"
	Data(5) = "Login"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	caA_Login = "Pass"
End Function
'************************************************************************************************************************
Function caA_check_login_success (Data,CUrrentRow, ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) NONE
	'********************************************************************************************	
	'Checks if the login was successful based upon the presence of the logout link
	Data(6) = "Link"
	Data(5) = "Logout"
	Data(4) = "Logout"
	Data(3) = "verify"
	linkExists = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	If linkExists = "Pass" Then
		caA_check_login_success = "Pass"
	Else
		caA_check_login_success = "Fail"
	End If
End Function
'************************************************************************************************************************

Function caA_CreateExperiment (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) EXP_TITLE
	'2) EXP_DESC
	'3) ASSAY TYPE
	'4) PROVIDER
	'5) ARRAY DESIGNS
	'6) ORGANISMS
	'********************************************************************************************	
	funcArg = parseData4(Data(4))
	Data(1) = "caArray - My Experiment"
	Data(6) = "link"
	Data(5) = "Create/Propose Experiment"
	Data(3) = "click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(1) = "caArray - Experiment Details"
	Data(6) = "webedit"
	Data(5) = "project.experiment.title"
	Data(4) = funcArg(0)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	SetVariable "ExperimentTitle", funcArg(0)

	Data(6) = "webedit"
	Data(5) = "project.experiment.description"
	Data(4) = funcArg(1)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "webelement"
	Data(5) = funcArg(2)
	Data(3) = "click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	Data(6) = "weblist"
	Data(5) = "project.experiment.manufacture"
	Data(4) = funcArg(3) 'Agilent
	Data(3) = "select"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "weblist"
	Data(5) = "project.experiment.arrayDesign"
	Data(4) = funcArg(4) 'Agilent_aCGH_XML
	Data(3) = "select"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "weblist"
	Data(5) = "project.experiment.organism"
	Data(4) = funcArg(5) 'Human (ncbitax)
	Data(3) = "select"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "link"
	Data(5) = "Save"
	Data(3) = "click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "webelement"
	Data(5) = "class:=message"
	Data(4) = "Experiment has been successfully saved."
	Data(3) = "verify"
	verifyStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If verifyStatus = "Pass" Then
		Reporter.ReportEvent micPass, "caA_CreateExperiment", "Experimment created successfully"
		caA_CreateExperiment = "Pass"
	ElseIf s = "Fail" Then
		Reporter.ReportEvent micFail, "caA_CreateExperiment", "Experimment creation failed!!"
		caA_CreateExperiment = "Fail"
	End If
End Function
'************************************************************************************************************************
Function caA_generalSearch (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) Keyword search term
	'2) Category
	'********************************************************************************************
	Data(1) = "caArray - My Experiment"
	funcArg = parseData4(Data(4))

	kword = funcArg(0)
	category = funcArg(1)

	Set myOR = New caA_ObjectRefresh

	Set myEditObj = myOR.caAKeyword (Data)
	myEditObj.Set kword

	Set myCombo = myOR.caAcategory (Data)
	myCombo.Select category

	Set mySearchButton = myOR.caASearch(Data)
	mySearchButton.Click

	caA_generalSearch = "Done"	
End Function
'************************************************************************************************************************
Function caA_GetExperimentID (Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************			
	'THE ARGUMENT FOR THE DATA(4) VALUE FIELD IS:
	'1) Keyword search term
	'2) Category
	'********************************************************************************************
	s = caA_generalSearch (Data,CurrentRow,ResultsFileObj)

	Data(7) = 2
	Data(8) = 1
	Data(6) = "keyword"
	Data(5) = "WebTable_GetTableProperty"
	Data(4) = "class:=searchresults###ExpID"
	Data(3) = "GetCellData"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	caA_GetExperimentID = "Done"
End Function
'************************************************************************************************************************
Function caA_ManageExperiments (Data,CurrentRow,ResultsFileObj)

	expId = GetVariable("ExpID")

	Data(1) = "title:=caArray - Search Results"
	Data(6) = "keyword"
	Data(5) = "WebTable_ClickOnLinkInCell"
	Data(4) = "class:=searchresults###" & expId & "###" & expId
	Data(7) = 1
	Data(8) = 1
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(1) = "caArray - Experiment Details"
	Data(3) = "verify"
	Data(4) = GetVariable("ExperimentTitle")
	Data(5) = "html id:=experimentTitleHeader"
	Data(6) = "webelement"
	verifyStatus = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	If verifySTATUS = "Pass" Then
		caA_ManageExperiments = "Pass"
	Else
		caA_ManageExperiments = "Fail"
	End If

End Function
'************************************************************************************************************************
Class caA_ObjectRefresh
	Private sData

	property Get arrayData()
		arrayData = sData
	End Property

	property Let arrayData(Data)
		sData = Data
	End Property

	Public function caABrowseLink(arrayData)	
		Set caA_Browse_Link = Browser(arrayData(0)).Page(arrayData(1)).Link("Browse")
		caA_Browse_Link.RefreshObject
		Set caABrowseLink = caA_Browse_Link
	End Function

	Public Function caACreateExp (arrayData)
		Set caA_CreateProposeExperiment = Browser(arrayData(0)).Page(arrayData(1)).Link("Create/Propose Experiment")
		caA_CreateProposeExperiment.RefreshObject
		Set caACreateExp = caA_CreateProposeExperiment
	End Function

	Public Function caAHelp (arrayData)
		Set caA_Help = Browser(arrayData(0)).Page(arrayData(1)).Link("Help")
		caA_Help.RefreshObject
		Set caAHelp = caA_Help
	End Function

	Public Function caAManageArrayDesigns (arrayData)
		Set caA_ManageArrayDesigns = Browser(arrayData(0)).Page(arrayData(1)).Link("Manage Array Designs")
		caA_ManageArrayDesigns.RefreshObject
		Set caAManageArrayDesigns = caA_ManageArrayDesigns
	End Function

	Public Function caAManageCollabGrps (arrayData)
		Set caA_ManageCollaborationGroups = Browser(arrayData(0)).Page(arrayData(1)).Link("Manage Collaboration Groups")
		caA_ManageCollaborationGroups.RefreshObject
		Set caAManageCollabGrps = caA_ManageCollaborationGroups
	End Function

	Public Function caAManageProtocols(arrayData)
		Set caA_ManageProtocols = Browser(arrayData(0)).Page(arrayData(1)).Link("Manage Protocols")
		caA_ManageProtocols.RefreshObject
		Set caAManageProtocols = caA_ManageProtocols
	End Function

	Public Function caAManageVocabulary (arrayData)
		Set caA_ManageVocabulary = Browser(arrayData(0)).Page(arrayData(1)).Link("Manage Vocabulary")
		caA_ManageVocabulary.RefreshObject
		Set caAManageVocabulary = caA_ManageVocabulary
	End Function

	Public Function caAMyExpWS (arrayData)
		Set caA_MyExperimentWorkspace = Browser(arrayData(0)).Page(arrayData(1)).Link("My Experiment Workspace")
		caA_MyExperimentWorkspace.RefreshObject
		Set caAMyExpWS = caA_MyExperimentWorkspace
	End Function

	Public Function caASearch (arrayData)
		Set caA_Search = Browser(arrayData(0)).Page(arrayData(1)).WebButton("Search")
		caA_Search.RefreshObject
		Set caASearch = caA_Search
	End Function

	Public Function caAKeyword (arrayData)
		Set caA_Keyword = Browser(arrayData(0)).Page(arrayData(1)).WebEdit("keyword")
		caA_Keyword.RefreshObject
		Set caAKeyword = caA_Keyword
	End Function
	
	Public Function caAcategory(arrayData)
		Set caA_category = Browser(arrayData(0)).Page(arrayData(1)).WebList("categoryCombo")
		caA_category.RefreshObject
		set caAcategory = caA_category
	End Function

End Class
'************************************************************************************************************************
Function caA_WaitForMessage (Data,CurrentRow,ResultsFileObj)
	noOfAttempts = 0
	waitstatus = "cont"
	do 
		noOfAttempts = noOfAttempts + 1
		wait 10
		If False = Browser(Data(0)).Page(Data(1)).WebElement("class:=message").GetROProperty("visible") then
			waitstatus = "cont"
		else
			waitstatus = "end"
			Reporter.ReportEvent micPass, "caA_WaitForMessage", " Waited for '" & noOfAttempts & "' 10 seconds interval which equals " & (noOFAttempts * 10)/60 & " minutes"
		end if
		If noOfAttempts = 10 then
			waitstatus = "end"
			Reporter.ReportEvent micPass, "caA_WaitForMessage", " Waited for '" & noOfAttempts & "' 10 seconds interval which equals " & (noOFAttempts * 10)/60 & " minutes"
		end if	
	loop until waitstatus = "end"
End Function
'************************************************************************************************************************
