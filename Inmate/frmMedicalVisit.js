function reloadCurScreen()
{
	return true;
}

//function return date on click event of inactive check box
function fn_chkFacility()
{
	if (nGCV('ChkAdmMedFacility', 3))
	{
		nEnable('cddAdmMedFacility',8);
	}
	else
	{
	    nSCV('cddAdmMedFacility', '', 8);
		nDisable('cddAdmMedFacility',8);
	}
	return true;
}



function fn_chkSplMeals()
{
	if (nGCV('chkSplMealReq', 3))
	{
	    //nEnable('radSpecialMealRequired_Input', 270);
	    var combo = $find("radSpecialMealRequired");
	    //To enable the combo box
	    combo.enable();

	}
	else
	{
	    nSCV('radSpecialMealRequired', '', 270);
	    //nDisable('radSpecialMealRequired_Input', 270);
	    var combo = $find("radSpecialMealRequired");
	    //To enable the combo box
	    combo.disable();
	}
	return true;
}





//for showing schedule screen on click of Medicalsch
function fn_showmedsch()
{
    var strURL = glbSitePath + "/Inmate/frmMedSchedule.aspx?hdnJurisId=" + glbPageJuris;
    var left = (window.screen.width / 2) - ((350 / 2) + 10);
    var top = (window.screen.height / 2) - ((500 / 2) + 50);
    openPositionWin(strURL, "MedicalScheduleADD", 350, 500, top, left);
    return false;
}
///for Validating Medicalvisit
function fn_ValidateScreen() {
    var ctrlClicked = glbCtrlClicked;
    glbCtrlClicked = "";

    if (ctrlClicked == "Save") {
        if (fn_MedVisitValidate()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                ShowProgressPanel();
                return true;
            }
            else
                return false;
        }
        else
            return false;
    }
}

function fn_MedVisitValidate()
{
    var strDOreq = nGCV("dttmDateOfReq", 18);
    var strRecBy = nGCV("lupReceivedBy", 6);
    var strmedpblm = nGCV("txtmedicalProblem", 0);

    var SPNNameID = nGCV("NamCtrlSPIN", 35);
    var SPNID = nGCV("NamCtrlSPIN", 32);
    var RequestBy = $('#chkInmateSubmitionForm input:checked').val(); //CRM#63145
    var AttendingDoctorNurse = $('#rdoDoctorNurse input:checked').val();
    var AttendingDoctor = AttendingDoctorNurse == "2" ? nGCV("lupAttendingNurse", 6) : nGCV("lupAttendingDoctor", 6);
    var VisitingDttm = nGCV("dttmVisitDate", 18);

    if (SPNNameID == "" || SPNID < 0) {
        KPIAlert(JMSMsd_PleaseEnter, "SPN#");
        nSCF("NamCtrlSPIN", 35);
        return false;
    }

    if(strDOreq =="")
    {
        KPIAlert(JMSMsd_PleaseEnter,"Date of Request");
        nSCF("dttmDateOfReq", 18);
        return false;
    }

    if (strRecBy == "") {

        if (RequestBy == "2") {
            KPIAlert(JMSMsd_PleaseEnter, "Requested By");
            nSCF("lupReceivedBy", 6);
        } else if (RequestBy == "1") {
            KPIAlert(JMSMsd_PleaseEnter, "Received By");
            nSCF("lupReceivedBy", 6);
        } else {
            KPIAlert(JMSMsd_PleaseChoose, "Inmate Submitted Medical Request Form (or) Jail Medical Staff Requested");
            document.forms[0].chkInmateSubmitionForm[0].focus();
        }
        return false;
    }

    if (strmedpblm.trim() == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Medical Problem");
        nSCF("txtmedicalProblem", 0);
        return false;
    }


    if (VisitingDttm != "" && AttendingDoctor == "") {
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
   
    return true;
}

function fn_OpenScheduler() {
    var BookingId = nGCV("hdnBookingID", 0);
    var strJurisID = nGCV("hdnJurisId", 0);
    var ScreenID = "8218";
    var SubAgeMode = "";
    if (nGCV("hdnMode") == "INQ") {
        SubAgeMode = "INQ";
    }
    if (BookingId != "" && BookingId != null) {
        var strURL = glbSitePath + "/FacilityMgmt/frmInmateMovement.aspx?sParent=Medical&Mode=" + nGCV("hdnMode") + "&ScreenID=" + ScreenID + "&hdnJurisId=" + strJurisID + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + BookingId + "&opnFrm=Medical&SubAgeMode=" + SubAgeMode;
        var left = (window.screen.width / 2) - ((1090 / 2) + 10);
        var top = (window.screen.height / 2) - ((530 / 2) + 50);
        openPositionWin(strURL, 'ClassificationSchedule', 1090, 530, top, left);
    }
    return false;
}


function fn_ClearDrugDetails() {
    nSCV("cddDrug", "", 8);
    nSCV("txtDosage", "", 0);
    nSCV("txtPrescribedAmt", "", 0);
    nSCV("txtRefills", "", 0);
    nSCV("txtNotes", "", 0);
    nSCV("chkGenericAllowed", "false", 3);
    grdPrescription_EditModeRow = "";
    nChangeToAddMode_WithText("cmdAdd");
    return false;
}


function isNumberKeyMedVisit(evt) {
    if ((event.keyCode == 219) || (event.keyCode == 220) || (event.keyCode == 221) || (event.keyCode == 186)  || (event.keyCode == 222) || (event.keyCode == 188) || (event.keyCode == 190) || (event.keyCode == 187) || (event.keyCode == 192) || (event.keyCode == 32) || (event.keyCode == 107) ||  (event.keyCode == 106) ||  (event.keyCode == 110)) {
        return false;
    }

    if (((event.keyCode >= 65) && (event.keyCode <= 90))) {
        return false;
    }

    if (event.shiftKey) {
        if ((event.keyCode == 219) || (event.keyCode == 220) || (event.keyCode == 221) || (event.keyCode == 186) || (event.keyCode == 222) || (event.keyCode == 188) || (event.keyCode == 190) || (event.keyCode == 191) || (event.keyCode == 187) || (event.keyCode == 189) || (event.keyCode == 192) || (event.keyCode == 107) || (event.keyCode == 109) || (event.keyCode == 106) || (event.keyCode == 111) || (event.keyCode == 110)) {
            return false;
        }

        if (!((event.keyCode >= 48) && (event.keyCode <= 57))) {
            return true;
        }
        else {
            return false;
        }
    }
}

function fn_DentistEntry() {
    var strDoctorID = trim(nGCV("lupAttendingDoctor", 77));
    var JurisID = glbPageJuris;
    var left = (window.screen.width / 2) - ((700 / 2) + 10);
    var top = (window.screen.height / 2) - ((350 / 2) + 50);

    if (strDoctorID > 0 && JurisID > 0) {
        var strURL = glbSitePath + "/Inmate/frmDoctorEntry.aspx?JurisID=" + JurisID + "&hdnMode=" + nGCV("hdnMode") + "&DoctorID=" + strDoctorID;
        openPositionWin(strURL, "DoctorID", 700, 350, top, left);
    }
    return false;
}


function fn_OpenVitals() {
    var strURL = glbSitePath + "/Inmate/frmMedVitals.aspx?Mode=" + nGCV("hdnMode") + "&Status=1&hdnJurisID=" + nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
    var left = (window.screen.width / 2) - ((950 / 2) + 10);
    var top = (window.screen.height / 2) - ((400 / 2) + 50);
    openPositionWin(strURL, "Vitals", 950, 445, top, left);
    return false;
}

function fn_OpenCharting() {
    var strURL = glbSitePath + "/Inmate/frmMedCharting.aspx?Mode=" + nGCV("hdnMode") + "&Status=1&hdnJurisID=" + nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
    var left = (window.screen.width / 2) - ((950 / 2) + 10);
    var top = (window.screen.height / 2) - ((400 / 2) + 50);
    openPositionWin(strURL, "Vitals", 950, 445, top, left);
    return false;
}


function fn_chkTbTested() {
    if (nGCV('chkTBTested', 3)) {
        nEnable('cddResults', 8);
    }
    else {
        nSCV('cddResults','', 8);
        nDisable('cddResults', 8);
    }
    return true;
}


function pageLoad() {
    try {
        fn_chkTbTested();
        fn_chkSplMeals();
        fn_chkFacility();
    } catch (e) {

    }
}


function FillLoggedInPF() {
    try {
        if (nGCV("hdnSetUserPFID") == "1") {
            if (nGCV("hdnLoginPFCode") != "" && nGCV("hdnLoginPFDesc") != "" && nGCV("hdnLoginPFID") != "") {
                if (nGCV("lupReceivedBy", 6) == "") {
                    nSCV("lupReceivedBy", nGCV("hdnLoginPFCode"), 6);
                    nSCV("lupReceivedBy", nGCV("hdnLoginPFDesc"), 7);
                    nSCV("lupReceivedBy", nGCV("hdnLoginPFID"), 77);
                }
            }
        }
    } catch (e) {

    }
}


function fn_OpenTextEditor() {
    try {
        var MedicalVisitID = nGCV('hdnMedVisitID');
        var RecType = PnxTxtDtl_RecType.Medical.JMMMedVisit_FacilityNotes729;
        if (MedicalVisitID == "")
            return false;

        var strURL = glbSitePath + "/KPIFrameworkWeb/Home/frmTextMgrEx.aspx?AssoID=" + MedicalVisitID + "&hdnMode=" + nGCV("hdnMode") + "&AssoType=" + RecType + "&Internal=False&Disp=0&hdnJurisId=" + glbPageJuris + "&ScreenID=8540&GRDHeight=170";
        var left = (window.screen.width / 2) - ((900 / 2) + 10);
        var top = (window.screen.height / 2) - ((600 / 2) + 50);
        openPositionWin(strURL, "MedicalDentistEditor", 900, 600, top, left);
    } catch (e) {

    }
    return false;
}



function fn_Notes(MedVisitID) {
    try {
        Notes = "";
        var btnid = document.getElementById('cmdEditor');
        var JurisID = nGCV("hdnJurisId", 0);
        var RecType = PnxTxtDtl_RecType.Medical.JMMMedVisit_FacilityNotes729;

        if (MedVisitID != "") {
            var szURL = glbSitePath + "/Inmate/frmInmateXML.aspx";
            var arrParams = new Array(4);
            arrParams[0] = new Array("JMMMedVisitID", MedVisitID);
            arrParams[1] = new Array("JurisID", JurisID);
            arrParams[2] = new Array("CallerType", "MedicalVisitNotes");
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


//CRM#55967 Received By label change as Requested By
$('#chkInmateSubmitionForm input').change(function () {

    if ($('#chkInmateSubmitionForm input:checked').val() == "2") {
        nGCO('lblReceivedBy').outerHTML = "<span id=\"lblReceivedBy\">Requested By&nbsp;</span>";
    }
    else {
        nGCO('lblReceivedBy').outerHTML = "<span id=\"lblReceivedBy\">Received By&nbsp;</span>";
    }
    nEnable('lupReceivedBy', 6);
});



//----------------------------------------------//


var grdPrescription_EditModeRow = "";
function fn_PrescriptionGridManip_Row() {
    if (grdPrescription_Validate()) {
        if (grdPrescription_EditModeRow == "") {
            var row = HGrdAdd("grdPrescription");
            if (row != null) {
                grdPrescription_SetValues(row, "A"); //Add mode
            }
        }
        else {
            if (GrdGCV(grdPrescription_EditModeRow, "KPIID") == "") {
                grdPrescription_SetValues(grdPrescription_EditModeRow, "A"); //Add mode
            }
            else {
                grdPrescription_SetValues(grdPrescription_EditModeRow, "C"); //Add mode                
            }
        }
    }
    return false;
}


function grdPrescription_Validate() {
    var PrescribedDttm = nGCV("dttmPrescribedDate", 18);
    var PrescribedDoctorCode = nGCV("lupPrimaryDoctor", 6);
    var PrescribedDoctorID = nGCV("lupPrimaryDoctor", 77);
    var Drug = nGCV("cddDrug", 8);
    var Dosage = nGCV("txtDosage", 0);
    

    if (PrescribedDttm == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Prescribed Date");
        nSCF("dttmPrescribedDate", 18);
        return false;
    }
    if ((parseInt(PrescribedDoctorID) < 0 && PrescribedDoctorCode == "") || (PrescribedDoctorID == "" && PrescribedDoctorCode == "")) {
        KPIAlert(JMSMsd_PleaseEnter, "Prescribing Doctor");
        nSCF("lupPrimaryDoctor", 6);
        return false;
    }
    if (Drug == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Drug");
        nSCF("cddDrug", 8);
        return false;
    }
    if (!Dosage.match(/\S/)) {
        KPIAlert(JMSMsd_PleaseEnter, "Dosage");
        nSCF("txtDosage", 0);
        return false;
    }
    
    return true;
}

function grdPrescription_SetValues(rows, Mode) {


    var PrescribedDttm = nGCV("dttmPrescribedDate", 18);
    var PrescribedDoctorID = nGCV("lupPrimaryDoctor", 77);
    var PrescriptionText = nGCV("txtPrescription", 0);
    var Dosage = nGCV("txtDosage", 0);
    var PrescribedAmt = nGCV("txtPrescribedAmt", 0);
    var PrescribedDuration = nGCV("cddPrescribedAmtDuration", 8);
    var PrescribedDurationDesc ="";
    if (PrescribedDuration != "") {
        PrescribedDurationDesc = nGCV("cddPrescribedAmtDuration", 9);
    }    
    
    var Refills = nGCV("txtRefills", 0);
    var IsGeneric = nGCV("chkGenericAllowed", 3) == true ? 1 : 0;

    var PrescribeNotes = nGCV("txtDescription", 0);
    var Drug = nGCV("cddDrug", 8);
    var DrugDesc = nGCV("cddDrug", 9);

    nGrdSCV(rows, "PrescribedDttm", PrescribedDttm);
    nGrdSCV(rows, "PrescribingDoctorID", PrescribedDoctorID);
    nGrdSCV(rows, "Prescription", PrescriptionText);
    nGrdSCV(rows, "Drugs", DrugDesc);
    nGrdSCV(rows, "Drug", Drug);
    nGrdSCV(rows, "Dosage", Dosage);
    nGrdSCV(rows, "PrescribedAmt", PrescribedAmt);
    nGrdSCV(rows, "PrescribedDuration", PrescribedDuration);
    nGrdSCV(rows, "DurationYrs", PrescribedAmt + " " + PrescribedDurationDesc);

    nGrdSCV(rows, "Refills", Refills);
    nGrdSCV(rows, "IsGeneric", IsGeneric);

    nGrdSCV(rows, "Notes", PrescribeNotes);
    nGrdSCV(rows, "JMMedVisitID", nGrdGCV(rows, "JMMedVisitID"));
    nGrdSCV(rows, "OrderNo", -(rows._index));

    nGrdSCV(rows, "KPIMode", Mode);
    
    fn_CancelEditPrescriptionRow();
}

function fn_CancelEditPrescriptionRow() {
    nSCV("dttmPrescribedDate", "", 18);
    nSCV("hdnPrescriptionID", "", 0);
    nSCV("lupPrimaryDoctor", "", 6);
    nSCV("lupPrimaryDoctor", "", 7);
    nSCV("lupPrimaryDoctor", "", 77);
    nSCV("txtPrescription", "", 0);
    nSCV("cddDrug", "", 8);
    nSCV("txtDosage", "", 0);
    nSCV("txtPrescribedAmt", "", 0);
    nSCV("cddPrescribedAmtDuration", "", 8);
    nSCV("txtRefills", "", 0);
    nSCV("chkGenericAllowed", false, 3);

    nSCV("txtDescription", "", 0);
    if (nGCV("lupPrimaryDoctor", 6) == "") {
        nGCO('lupPrimaryDoctor_cmdIncOnAddr').style.visibility = 'hidden';
    }
    grdPrescription_EditModeRow = "";
    $('#tdNotes').removeClass("req");
    var btnid = nGCO("btnDisposition");
    btnid.Disable = true;
    btnid.style.color = "";
    btnid.className = "CustomBtn"
    nDisable("btnDisposition", 5);
    
    nChangeToAddMode_WithText("cmdAdd");
    return false;
}

function grdPrescription_CellClickHandler(sender, eventArgs) {
    
        if (eventArgs.get_type() == 'cell') {
        grdPrescription_EditModeRow = nHIGrdGSR("grdPrescription");
        var JMMedPrescriptionID = nGrdGCVById(eventArgs, "JMMedPrescriptionID");
        var Drug = nGrdGCVById(eventArgs, "Drug");
        var JurisID = nGrdGCVById(eventArgs, "JurisID");
        var JMBookingID = nGrdGCVById(eventArgs, "JMBookingID");
        var JMPrescriptionOrderID = nGrdGCVById(eventArgs, "JMPrescriptionOrderID");
        var OrderedNo = nGrdGCVById(eventArgs, "OrderedNo");
        

        if (sender._level == 1 && eventArgs.get_type() == "cell") {

            var JMPreOrderHistID = nGrdGCVById(eventArgs, "JMPreOrderHistID");
            var JMPreOrderHistNo = nGrdGCVById(eventArgs, "JMPreOrderHistNo");

            if (GrdColKey(sender) == "Cmts") {

                var JBMChargeExtnID = "";
                CmtNotes = nGrdGCVById(eventArgs, 'OrderedNotes');
                if (CmtNotes != '') {
                    var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &JMPreOrderHistID=" + JMPreOrderHistID + "&JurisID=" + JurisID + "&hdnScreenId=8530&JMBookingID=" + JMBookingID;
                    var left = (window.screen.width / 2) - ((320 / 2) + 10);
                    var top = (window.screen.height / 2) - ((400 / 2) + 50);
                    openPositionWin(strURL, "MedicalPrescriptions", 320, 400, top, left);
                    fn_CancelEditPrescriptionRow();
                    return false;
                }
                return false;
            }
            else {
                var strURL = glbSitePath + "/Inmate/frmOrderEntry.aspx?Mode=CHG&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug + "&JMPrescriptionOrderID=" + JMPrescriptionOrderID + "&OrderedNo=" + OrderedNo + "&JMPreOrderHistID=" + JMPreOrderHistID + "&JMPreOrderHistNo=" + JMPreOrderHistNo;
                var left = (window.screen.width / 2) - ((650 / 2) + 10);
                var top = (window.screen.height / 2) - ((200 / 2) + 50);
                openPositionWin(strURL, "MedicalScheduleADD", 650, 270, top, left);
                fn_CancelEditPrescriptionRow();
                return false;
            }
        }


        else {
            let Disposition = nGrdGCVById(eventArgs, "Disposition");
            if (GrdColKey(sender) == glbKPIGrdDelKey) {
                nGrdHandleDel("grdPrescription");
                fn_CancelEditPrescriptionRow();
            }
            else if (GrdColKey(sender) == "Schedule") {
                var strURL = glbSitePath + "/Inmate/frmMedSchedule.aspx?Mode=ADD&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug;
                var left = (window.screen.width / 2) - ((750 / 2) + 10);
                var top = (window.screen.height / 2) - ((500 / 2) + 50);
                openPositionWin(strURL, "MedicalScheduleADD", 750, 500, top, left);
                fn_CancelEditPrescriptionRow();
                return false;
            } else if (GrdColKey(sender) == "SupplyStatus") {
                var strURL = glbSitePath + "/Inmate/frmOrderEntry.aspx?Mode=ADD&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug + "&JMPrescriptionOrderID=" + JMPrescriptionOrderID + "&OrderedNo=" + OrderedNo;
                var left = (window.screen.width / 2) - ((650 / 2) + 10);
                var top = (window.screen.height / 2) - ((200 / 2) + 50);
                openPositionWin(strURL, "MedicalScheduleADD", 650, 270, top, left);
                fn_CancelEditPrescriptionRow();
                return false;

            }
            else if (GrdColKey(sender) == "Cmts") {
                var JBMChargeExtnID = "";
                CmtNotes = nGrdGCVById(eventArgs, 'PrescribeNotes');
                if (CmtNotes != '') {
                    var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &JMMedPrescriptionID=" + JMMedPrescriptionID + "&JurisID=" + JurisID + "&hdnScreenId=8530&JMBookingID=" + JMBookingID;
                    var left = (window.screen.width / 2) - ((320 / 2) + 10);
                    var top = (window.screen.height / 2) - ((400 / 2) + 50);
                    openPositionWin(strURL, "MedicalPrescriptions", 320, 400, top, left);
                    fn_CancelEditPrescriptionRow();
                    return false;
                }
            }
            else {
                nSCV("dttmPrescribedDate", nGrdGCVById(eventArgs, "PrescribedDttm"), 18);
                nSCV("hdnPrescriptionID", JMMedPrescriptionID, 0);
                nSCV("lupPrimaryDoctor", nGrdGCVById(eventArgs, "DoctorName"), 6);
                nSCV("lupPrimaryDoctor", nGrdGCVById(eventArgs, "DoctorName"), 7);
                nSCV("lupPrimaryDoctor", nGrdGCVById(eventArgs, "PrescribingDoctorID"), 77);

                if (nGCV("lupPrimaryDoctor", 77) != "" && nGCV("lupPrimaryDoctor", 77) >= 0) {
                    nGCO('lupPrimaryDoctor_cmdIncOnAddr').src = glbSitePath + "/KPIFrameworkWeb/Images/ico_18_debug.gif";
                }
                else {
                    nGCO('lupPrimaryDoctor_cmdIncOnAddr').src = glbSitePath + "/KPIFrameworkWeb/Images/ico/16_L_remove.gif";
                }

                nSCV("txtPrescription", nGrdGCVById(eventArgs, "Prescription"), 0);
                nSCV("cddDrug", Drug, 8);
                nSCV("txtDosage", nGrdGCVById(eventArgs, "Dosage"), 0);
                nSCV("txtPrescribedAmt", nGrdGCVById(eventArgs, "PrescribedAmt"), 0);
                nSCV("cddPrescribedAmtDuration", nGrdGCVById(eventArgs, "PrescribedDuration"), 8);
                nSCV("txtRefills", nGrdGCVById(eventArgs, "Refills"), 0);
                nSCV("chkGenericAllowed", nGrdGCVById(eventArgs, "IsGeneric") == true ? 1 : 0, 3);
                
                nSCV("txtDescription", nGrdGCVById(eventArgs, "Notes"), 0);

                

                if (JMMedPrescriptionID > 0) {

                    nEnable("btnDisposition", 5);

                } else {
                    nDisable("btnDisposition", 5);
                }
                var btnid = nGCO("btnDisposition");
                if (Disposition > 0) {
                    btnid.style.backgroundColor = "red";
                    btnid.style.color = "red";
                    btnid.className = "CustomBtnRedBold"
                } else {
                    btnid.Disable = true;
                    btnid.style.color = "";
                    btnid.className = "CustomBtn";
                }


                nChangeToEditMode_WithText("cmdAdd");
            }
        }

       
      
    }
}


//HGrdAdd

function nHGrdAdd(tabPaneName, gridId, BandId) {
    return HGrdAdd(_KPITabGridID(tabPaneName, gridId), BandId);
}

// Adds a row to the grid. Band id is optional
function HGrdAdd(gridId, BandId) {
    if (!BandId)
        BandId = 0;

    //igtbl_addNew(gridId, BandId);
    var grid = $find(gridId);

    var colcount = 0;
    colcount = grid.get_gridView().get_columns().get_length(); //this will get the number of columns in the grid. 

    var rowcount = 0;
    rowcount = grid.get_gridView().get_rows().get_length(); //this will get the number of rows in the grid. 

    if (rowcount < 0) {
        rowcount = 0;
        grid.get_gridView().get_rows()._set_length(0);
    }

    rowcount = rowcount + 1; //Increment to 1 so that number will be unique

    if (rowcount == 0) rowcount = 1;

    var row = [];
    row.push(rowcount); //Assign the unique running number to the First Column --> UniqueRowID Column. 

    //Assign rest of the column to blank value. 
    for (var i = 1; i < colcount; i++) {
        row.push(null);
    }

    grid.get_gridView().get_rows().add(row); //This will add the empty row with UniqueRowID assigned to the first column. 

    return HGrdGRByKeyValue(gridId, "UniqueRowID", rowcount); //Get the newly added row by passing the uniqueRowId

}




function HGrdGRByKeyValue(gridId, keyName, KeyValue) {

    var allRows = nHGrdGAR(gridId); //var allRows =HGrdGAR("MHS", 'grdPrescription')

    if (allRows == null)
        return null;
    else {
        for (iRows = 0; iRows < allRows.get_length(); iRows++) {

            var keyCell = allRows.get_row(iRows).get_cellByColumnKey(keyName);

            if (keyCell.get_value() == KeyValue)
                return keyCell.get_row();
        }
    }

    return null;
}




function nHIGrdGSR(gridId) {
    try {
        var grid = nGetGrd(gridId).get_gridView();
        var row = null;

        var oRows = nHGrdGAR(gridId);
        for (var iRow = 0; iRow < oRows.get_length(); iRow++) {
            var childGrid = oRows.get_row(iRow).get_grid();//oRows.get_row(iRow).get_rowIslands(0)[0];
            if (childGrid.get_behaviors().get_activation().get_activeCell() != null) {
                row = childGrid.get_behaviors().get_activation().get_activeCell().get_row();
                break;
            }
        }

        if ((row == undefined) || (row == null)) {

            return null;
        }
        else
            return row;
    }
    catch (e) {
        return null;
    }
}




function fn_Disposition() {
    var grdPrescription_EditModeRow = nHIGrdGSR("grdPrescription");    
    if (grdPrescription_EditModeRow != null && grdPrescription_EditModeRow != "") {
        var JMMedPrescriptionID = GrdGCV(grdPrescription_EditModeRow, "JMMedPrescriptionID");
        var Drug = GrdGCV(grdPrescription_EditModeRow, "Drug");
        var JurisID = GrdGCV(grdPrescription_EditModeRow, "JurisID");
        var JMBookingID = GrdGCV(grdPrescription_EditModeRow, "JMBookingID");
        var JMPrescriptionOrderID = GrdGCV(grdPrescription_EditModeRow, "JMPrescriptionOrderID");
        var OrderedNo = GrdGCV(grdPrescription_EditModeRow, "OrderedNo");


        var strURL = glbSitePath + "/Inmate/frmOrderEntry.aspx?Mode=ADD&Disposition=1&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug + "&JMPrescriptionOrderID=" + JMPrescriptionOrderID + "&OrderedNo=" + OrderedNo;
        var left = (window.screen.width / 2) - ((650 / 2) + 10);
        var top = (window.screen.height / 2) - ((200 / 2) + 50);
        openPositionWin(strURL, "MedicalScheduleADD", 650, 270, top, left);
    }
    return false;
}


//------------------------------------------------//

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
    //nEnable('lupAttendingDoctor', 6);
    nSCV('lupAttendingDoctor', '', 6);
    nSCV('lupAttendingDoctor', '', 7);
    nSCV('lupAttendingDoctor', '', 77);


    nSCV('lupAttendingNurse', '', 6);
    nSCV('lupAttendingNurse', '', 7);
    nSCV('lupAttendingNurse', '', 77);


    nSCV("cddLocation", "", 9);
   
});


function fn_visitDoctorNurse() {

    if (nGCV("dttmVisitDate", 18) == "") {

        nSCV('lupAttendingDoctor','', 6);
        nSCV('lupAttendingDoctor', '', 7);
        nSCV('lupAttendingDoctor', '', 77);

        nSCV('lupAttendingNurse', '', 6);
        nSCV('lupAttendingNurse', '', 7);
        nSCV('lupAttendingNurse', '', 77);


        nSCV("cddLocation", "", 9);
        nSCV("dttmVisitDate", "", 19);
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


