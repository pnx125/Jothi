//For Displaying Primary Dentist Info on Select of cddPrimary Dentist
var Notes = "";

///For Validating Medicalvisit
function fn_ValidateScreen()
{
	var ctrlClicked = glbCtrlClicked;
	glbCtrlClicked = "";

	
	if(ctrlClicked == "Save" || ctrlClicked=="SaveClose")
	{
		if(fn_DentalVisitValidate())
		{
		    if (KPIConfirm(KPIMsg_SAVE)) {
		        if (ctrlClicked == "SaveClose") {
		            nSCV('hdnSaveClose', '1');
		            ShowProgressPanel();
		        }
		        return true;
		    } else {
		        return false;
		    }
		}
		else
			return false;
	}
}
function fn_DentalVisitValidate() {
    var strDOReq = nGCV("dttmDentalVisitReq", 18);
    var strRecBy = nGCV("LupReceivedBy", 6);
    var RequestBy = $('#chkInmateSubmitionForm input:checked').val();
    var strDenPblm = trim(nGCV("txtDentalProblem", 0));
    var strVisitDate = nGCV("dttmDentalVisitDate", 18);
    var AttendingDoctorNurse = $('#rdoDoctorNurse input:checked').val();
    var AttendingDoctor = AttendingDoctorNurse == "2" ? nGCV("lupAttendingNurse", 6) : nGCV("lupAttendingDoctor", 6);

    var SPNNameID = nGCV("NamCtrlSPIN", 35);
    var SPNID = nGCV("NamCtrlSPIN", 32);

    if (SPNNameID == "" || SPNID < 0) {
        KPIAlert(JMSMsd_PleaseEnter, "SPN");
        nSCF("NamCtrlSPIN", 35);
        return false;
    }

    if (strDOReq == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Dental Visit Requested");
        return false;
    }
    else if (strRecBy == "") {

        if (RequestBy == "2") {
            KPIAlert(JMSMsd_PleaseEnter, "Requested By");
            nSCF("LupReceivedBy", 6);
        } else if (RequestBy == "1") {
            KPIAlert(JMSMsd_PleaseEnter, "Received By");
            nSCF("LupReceivedBy", 6);
        } else {
            KPIAlert(JMSMsd_PleaseChoose, "Inmate Submitted Dental Request Form (or) Jail Medical Staff Requested");
            document.forms[0].chkInmateSubmitionForm[0].focus();
        }
        return false;
    }

    

    else if (strVisitDate != "" && AttendingDoctor == "") {
        if (AttendingDoctorNurse == "2") {
            KPIAlert(JMSMsd_PleaseChoose, "Attending Doctor (or) Nurse");
            nSCF("lupAttendingNurse", 6);
        } else if (AttendingDoctorNurse == "1") {
            KPIAlert(JMSMsd_PleaseChoose, "Attending Doctor (or) Nurse");
            nSCF("lupAttendingDoctor", 6);
        } else {
            KPIAlert(JMSMsd_PleaseChoose, "Attending Doctor (or) Nurse");
            document.forms[0].rdoDoctorNurse[0].focus();
        }
        return false;
    }
  
    else if (strDenPblm == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Dental Problem");
        nSCF("txtDentalProblem", 0);
        return false;
    }
    else if (nGCV("cddTooth", 8) != '') {
        KPIAlert(FrwkMsg_CTRL_UPDATE);
        return false;
    }
    else if (nGCV("cddStatus", 8) != '') {
        KPIAlert(FrwkMsg_CTRL_UPDATE);
        return false;
    }
    else if (nGCV("cddOthers", 8) != '') {
        KPIAlert(FrwkMsg_CTRL_UPDATE);
        return false;
    }



    return true;
}

//CRM#55967 Received By label change as Requested By
$('#chkInmateSubmitionForm input').change(function () {

    if ($('#chkInmateSubmitionForm input:checked').val()=="2") {
        nGCO('lblReceivedBy').outerHTML = "<span id=\"lblReceivedBy\">Requested By&nbsp;</span>";
    }
    else {
        nGCO('lblReceivedBy').outerHTML = "<span id=\"lblReceivedBy\">Received By&nbsp;</span>";
    }
    nEnable('LupReceivedBy', 6);
});



function tabDentist_AfterSelectedTabChange(sender, eventArgs) {
    var strJurisID = nGCV("hdnJurisID");
    var oTab = sender.getTabAt(0);
    if (oTab.get_text().indexOf("Attachment") >= 0) {
        blnExternalLink = true;
        var strURL = "/KPIFrameworkWeb/Home/frmTxtAttachMgrEx.aspx?AssoID=" + nGCV("hdnDentVisitID") + "&AssoType=3&Internal=True&Disp=0&hdnJurisId=" + strJurisID + "&hdnMode=" + nGCV("hdnMode") + "&ScreenId=8540&GRDHeight=50";
        oTab.get_contentUrl(glbSitePath + strURL);
        oTab.set_contentUrl(glbSitePath + strURL);


    }
}

var grdTooth_EditModeRow = '';
function fn_PrescriptionGridManip_Row() {
    if (grdTooth_Validate()) {
        if (grdTooth_EditModeRow == "") {
            var row = nGrdAdd('grdTooth');
            if (row != null) {
                grdTooth_SetValues(row, 'A');
            }
        }
        else {
            if (nGrdGCV(grdTooth_EditModeRow, 'KPIID') == "") {
                grdTooth_SetValues(grdTooth_EditModeRow, "A");
            } else {
                grdTooth_SetValues(grdTooth_EditModeRow, "C");
            }
        }
    }
    return false;
}

function grdTooth_SetValues(row, Mode) {
    nGrdSCV(row, "Tooth", nGCV("cddTooth", 8));
    nGrdSCV(row, "ToothDesc", nGCV("cddTooth", 9));

    nGrdSCV(row, "Status", nGCV("cddStatus", 8));
    nGrdSCV(row, "StatusDesc", nGCV("cddStatus", 9));

    nGrdSCV(row, "Other", nGCV("cddOthers", 8));
    nGrdSCV(row, "OtherDesc", nGCV("cddOthers", 9));

    nGrdSCV(row, "KPIMode", Mode);
    fn_CancelEditgrdToothRow();
}


function fn_CancelEditgrdToothRow() {
    nSCV("cddTooth", "", 9);
    nSCV("cddTooth", "", 8);

    nSCV("cddStatus", "", 9);
    nSCV("cddStatus", "", 8);

    nSCV("cddOthers", "", 9);
    nSCV("cddOthers", "", 8);
    grdTooth_EditModeRow = "";
    nChangeToAddMode_WithText("cmdAdd");
    return false;
}


function grdDental_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        if (nGrdColKey(sender) == glbKPIGrdDelKey) {
            nGrdHandleDel("grdTooth");
            fn_CancelEditgrdToothRow();
        }
        else if (nGrdIsActiveRow("grdTooth")) {
            grdTooth_EditModeRow = nGrdGSR("grdTooth");
            nSCV("cddTooth", nGrdGCV(grdTooth_EditModeRow, "Tooth"), 8);
            nSCV("cddStatus", nGrdGCV(grdTooth_EditModeRow, "Status"), 8);
            nSCV("cddOthers", nGrdGCV(grdTooth_EditModeRow, "Other"), 8);

            nChangeToEditMode_WithText("cmdAdd");
        }
    }
}


function VisitReload() {
    GetBookDtl();
    var BookStatus = nGCV("hdnBookStaus", 0);
    if (BookStatus == '9' || BookStatus == '8') {
        if (CheckRolePermissions() == false) { //CRM#65266 All inmate Booking Status should allow to create Medical Entry            
            nSCV('hdnMode', 'INQ');
            DisableAddBtn();
            
            return false;
        } else {
            EnableAddBtn();
        }
    } else {
        EnableAddBtn();
    }
}

//CRM#65266 All inmate Booking Status should allow to create Medical Entry
function DisableAddBtn() {
    nGCO("cmdAdd").className = "DisabledImgMnuItem";
    nDisable("cmdAdd", 5);

    nGCO("cmdClear").className = "DisabledImgMnuItem";
    nDisable("cmdClear", 5);

    nGCO("cmdSave").className = "DisabledImgMnuItem";
    nDisable("cmdSave", 5);

    nGCO("cmdSaveNClose").className = "DisabledImgMnuItem";
    nDisable("cmdSaveNClose", 5);


}

function EnableAddBtn() {
    nGCO("cmdAdd").className = "menuItem";
    nEnable("cmdAdd", 5);


    nGCO("cmdClear").className = "menuItem";
    nEnable("cmdClear", 5);

    nGCO("cmdSave").className = "menuItem";
    nEnable("cmdSave", 5);

    nGCO("cmdSaveNClose").className = "menuItem";
    nEnable("cmdSaveNClose", 5);


}

function GetBookDtl() {
    var NameID = trim(nGCV("NamCtrlSPIN", 32));
    var SPINNbr = trim(nGCV("NamCtrlSPIN", 44));

    if (CheckSPIN()) {
        var Juris = nGCV("hdnJurisID");
        var szURL = glbSitePath + "/Admission/frmInmateCellAssignXML.aspx";
        var arrParams = new Array();
        arrParams[0] = new Array("SPINNbr", SPINNbr);
        arrParams[1] = new Array("NameID", NameID);
        arrParams[2] = new Array("Juris", Juris);
        arrParams[3] = new Array("CallerType", "GetCellNoWithNameID");

        var arrResponseData = KPIDoXMLHTTP(szURL, arrParams);
        if (arrResponseData != null && arrResponseData.length > 0) {
            for (i = 0; i < arrResponseData.length; i++) {

                if (arrResponseData[i][0] == "BookingStatus") {
                    nSCV("hdnBookStaus", arrResponseData[i][1], 0);
                }
            }
        } else {
            nSCV("hdnBookStaus", "", 0);
        }
    }
}



function CheckSPIN() {
    var SPINNbr = trim(nGCV("NamCtrlSPIN", 44));
    if (SPINNbr == "--") {
        KPIAlert(JMSMsg_NameSPN_NotExist);
        nClearNameCtrl("NamCtrlSPIN");
        nSCV("hdnClearNamCtrl", "True", 0);
        nSCF('NamCtrlSPIN', 44);
        return false;
    }
    else {
        return true;
    }
}


function fn_OpenTextEditor() {
    try {
        var DentVisitID = nGCV('hdnDentVisitID');
        if (DentVisitID == "")
            return false;
        var RecType = PnxTxtDtl_RecType.Medical.JMMDentistVisit_Notes730;
        var strURL = glbSitePath + "/KPIFrameworkWeb/Home/frmTextMgrEx.aspx?AssoID=" + DentVisitID + "&hdnMode=" + nGCV("hdnMode") + "&AssoType=" + RecType + "&Internal=False&Disp=0&hdnJurisId=" + glbPageJuris + "&ScreenID=8540&GRDHeight=170";
        var left = (window.screen.width / 2) - ((900 / 2) + 10);
        var top = (window.screen.height / 2) - ((600 / 2) + 50);
        openPositionWin(strURL, "MedicalDentistEditor", 900, 600, top, left);
    } catch (e) {

    }
    return false;
}


function grdTooth_Validate() {
    var tooth = nGCV("cddTooth", 8);
    var status = nGCV("cddStatus", 8);
    var other = nGCV("cddOthers", 8);

    if (tooth == '' && status == '' && other == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Status");
        return false;
    } else if (status == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Status");
        return false;
    }


    var oRows = nGrdGAR("grdTooth");
    for (i = 0; i < oRows.get_length() ; i++) {
        var row = oRows.get_row(i);
        if (row != grdTooth_EditModeRow) {
            if ((trim(status) == nGrdGCV(row, "Status")) && (trim(tooth) == nGrdGCV(row, "Tooth")) && (trim(other) == nGrdGCV(row, "Other"))) {
                KPIAlert(FrwkMsg_DUPLICATION);
                nSCV("cddStatus", "", 8);
                nSCV("cddStatus", "", 9);

                nSCV("cddTooth", "", 8);
                nSCV("cddTooth", "", 9);

                nSCV("cddOthers", "", 8);
                nSCV("cddOthers", "", 9);

                return false;
            }
        }
    }


    return true;
}



function fn_DentistEntry() {
    var strDoctorID = trim(nGCV("lupAttendingDoctor", 77));
    var JurisID = glbPageJuris;
    var left = (window.screen.width / 2) - ((700 / 2) + 10);
    var top = (window.screen.height / 2) - ((350 / 2) + 50);
    var mode = nGCV('hdnMode');
    if (mode != "INQ") {
        mode = "CHG";
    }
    if (strDoctorID > 0 && JurisID > 0) {
        var strURL = glbSitePath + "/Inmate/frmDoctorEntry.aspx?JurisID=" + JurisID + "&hdnMode=" + mode + "&DoctorID=" + strDoctorID;
        openPositionWin(strURL, "DoctorID", 700, 350, top, left);
    }
    return false;
}



function fn_Notes(DentVisitID) {
    try {
        Notes = "";
    var btnid = document.getElementById('cmdEditor');
    var JurisID = nGCV("hdnJurisID", 0);
    var RecType = PnxTxtDtl_RecType.Medical.JMMDentistVisit_Notes730;

    if (DentVisitID != "") {
        var szURL = glbSitePath + "/Inmate/frmInmateXML.aspx";
        var arrParams = new Array(4);
        arrParams[0] = new Array("JMMDentVisitID", DentVisitID);
        arrParams[1] = new Array("JurisID", JurisID);
        arrParams[2] = new Array("CallerType", "DentistEntryNotes");
        arrParams[3] = new Array("RecType", RecType);

        var arrResponseData = KPIDoXMLHTTP(szURL, arrParams);
        if (arrResponseData != null) {
            if (arrResponseData.length > 0) {
                for (i = 0; i < arrResponseData.length; i++) {
                    if (arrResponseData[i][0] == "Notes") {
                        Notes = arrResponseData[i][1];
                    }
                }
            }
        }
    }
    if (Notes != "") {
        btnid.style.backgroundColor = "red";
        btnid.style.color = "green";
        btnid.className = "CustomBtnBold"
    }
    else {
        btnid.style.backgroundColor = "";
        btnid.style.color = "black";
        btnid.className = "CustomBtn"
    }

    } catch (e) {

    }
    return false;
}

function FillLoggedInPF() {
    if (nGCV("hdnSetUserPFID") == "1")
    {
        if (nGCV("hdnLoginPFCode") != "" && nGCV("hdnLoginPFDesc") != "" && nGCV("hdnLoginPFID") != "") {
            if (nGCV("LupReceivedBy", 6) == "") {
                nSCV("LupReceivedBy", nGCV("hdnLoginPFCode"), 6);
                nSCV("LupReceivedBy", nGCV("hdnLoginPFDesc"), 7);
                nSCV("LupReceivedBy", nGCV("hdnLoginPFID"), 77);
            }
        }
    }
}

//CRM#65266 All inmate Booking Status should allow to create Medical Entry
function CheckRolePermissions() {
    var ReturnStatus = false;

    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedicalDentist.aspx/CheckRolePermissions",
        // The key needs to match your method's input parameter (case-sensitive).
        data: "{'sJurisID':'" + nGCV("hdnJurisID") + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);
            if (obj["IsRoleAllowed"] == '1') {
                //alert(8);
                ReturnStatus = true;
                return true;
            }
        },
        failure: function (errMsg) {
            alert("Object Failed");
            ReturnStatus = false;
            return false;
        }
    });


    return ReturnStatus;
}

//CRM#80737 Modify Medical Visit screen 8534 to require Attending Doctor or Nurse name
$('#rdoDoctorNurse input').change(function () {

    if ($('#rdoDoctorNurse input:checked').val() == "2") {
        nGCO("trAttendDoctor").style.display = "none";
        nGCO("trAttendNurse").style.display = "";
    }
    else {
        nGCO("trAttendNurse").style.display = "none";
        nGCO("trAttendDoctor").style.display = "";
    }
    nSCV('lupAttendingDoctor', '', 6);
    nSCV('lupAttendingDoctor', '', 7);
    nSCV('lupAttendingDoctor', '', 77);


    nSCV('lupAttendingNurse', '', 6);
    nSCV('lupAttendingNurse', '', 7);
    nSCV('lupAttendingNurse', '', 77);


    nSCV("cddLocation", "", 9);

});


function fn_visitDoctorNurse() {

    if (nGCV("dttmDentalVisitDate", 18) == "") {

        nSCV('lupAttendingDoctor', '', 6);
        nSCV('lupAttendingDoctor', '', 7);
        nSCV('lupAttendingDoctor', '', 77);

        nSCV('lupAttendingNurse', '', 6);
        nSCV('lupAttendingNurse', '', 7);
        nSCV('lupAttendingNurse', '', 77);


        nSCV("cddLocation", "", 9);
        nSCV("dttmDentalVisitDate", "", 19);
        nSCV('lupAttendingDoctor', '', 6);
        nDisable('lupAttendingDoctor', 6);
        nDisable('lupAttendingDoctor', 7);
        nDisable('lupAttendingDoctor', 77);

        nDisable('lupAttendingNurse', 6);
        nDisable('lupAttendingNurse', 7);
        nDisable('lupAttendingNurse', 77);
        nGCO("trAttendNurse").style.display = "none";
        nGCO("trAttendDoctor").style.display = "";

        $('#rdoDoctorNurse').find('input').prop('disabled', true);
        $("#rdoDoctorNurse").find('input').attr('checked', false);
        nDisable("cddLocation", 8);

    } else {
        nEnable('lupAttendingDoctor', 6);
        nEnable('lupAttendingDoctor', 7);
        nEnable('lupAttendingDoctor', 77);

        nEnable('lupAttendingNurse', 6);
        nEnable('lupAttendingNurse', 7);
        nEnable('lupAttendingNurse', 77);


        $('#rdoDoctorNurse').find('input').prop('disabled', false);

        if ($('#rdoDoctorNurse input:checked').length == 0) {
            $("#rdoDoctorNurse").find("input[value='1']").prop("checked", true);
            nGCO("trAttendNurse").style.display = "none";
            nGCO("trAttendDoctor").style.display = "";
        }

        nEnable("cddLocation", 8);
    }
}

function KPISetShortTimeHM_VisitedDttm(editor, evtArgs) {
    //var text = editor.get_text();
    fn_visitDoctorNurse();
}
