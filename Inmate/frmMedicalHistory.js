
//#region below code we used only scheduling

var SelectedPeriodForSchedule = {
    StartDate: "",
    EndDate: "",
    MedicationDistributionPeriodCodeValue: "",
    MedicationDistributionPeriodDescription: "",
    Medication: "",
    HowOften: "",
    Dispense: "",
    DispenseType: "",
    JMMedPrescriptionID: "",
    JurisId: "",
    JMBookingID: "",
    MedPresSchID: "",
    NotesMandatory: ""

}


function fn_ValidateScreen() {
    if (glbCtrlClicked == "Save") {
        if (fn_MedVisitValidate()) {
            glbCtrlClicked = "";
            nSCV("hdnSave", "Load", 0);
            if (!TabSaveAll()) {
                if (KPIConfirm(KPIMsg_SAVE)) {
                    nSCV("hdnSave", "Save", 0);
                    ShowProgressPanel();
                    return true;
                }
                else
                    return false;
            }
            else {
                return false;
            }
        } else {
            return false;
        }
    }
    else if (glbCtrlClicked == "Refresh") {
        nSCV("hdnSave", "Refresh", 0);
    }
    else if (glbCtrlClicked == "Print") {
        nSCV("hdnSave", "Print", 0);
    }
    else {
        nSCV("hdnSave", "Load", 0);
        return true;
    }
}
//======================= For Displaying Primary Dentist Info on Select of cddPrimary Dentist ===============================

function fn_DentistInfo() {
    if (trim(GCV("Dental", "lupPrimaryDentist", 7)) != null && trim(GCV("Dental", "lupPrimaryDentist", 77)) != "") {
        var Doctor = trim(GCV("Dental", "lupPrimaryDentist", 77));
        var CallerType = "PrimaryDentist";
        var szURL = glbSitePath + "/Inmate/frmInmateXML.aspx";
        var arrParams = new Array(2);
        arrParams[0] = new Array("Doctor", Doctor);
        arrParams[1] = new Array("CallerType", CallerType);
        var arrResponseData = KPIDoXMLHTTP(szURL, arrParams);
        if (arrResponseData != null) {
            for (i = 0; i < arrResponseData.length; i++) {
                if (arrResponseData[i][0] == "location") {
                    SCV("Dental", "txtOfficeLocation", arrResponseData[i][1]);
                }
                else if (arrResponseData[i][0] == "Phone") {
                    SCV("Dental", "cusHeaderPhone", arrResponseData[i][1], 12);
                }
                else if (arrResponseData[i][0] == "PhoneType") {
                    SCV("Dental", "cusHeaderPhone", arrResponseData[i][1], 11);
                }
            }
        }
        else
            return true;
    }
    else {
        SCV("Dental", "txtOfficeLocation", "");
        SCV("Dental", "cusHeaderPhone", "", 11);
        SCV("Dental", "cusHeaderPhone", "", 12);
        return true;
    }
}

//========================Manipulating History Tab history grd==========================================

//For Adding prescription history value into Table and grid manipulation

//#region hierarchicalgrid
var grdPrescripHist_EditModeRow = "";
function fn_PrescrpHistGridManip_Row() {
    if (grdPrescripHist_Validate()) {
        if (grdPrescripHist_EditModeRow == "") {
            var row = GrdAdd("MHS", "grdPrescripHist");
            if (row != null) {
                grdPrescripHist_SetValues(row, "A"); //Add mode
            }
        }
        else {
            if (GrdGCV(grdPrescripHist_EditModeRow, "KPIID") == "") {
                grdPrescripHist_SetValues(grdPrescripHist_EditModeRow, "A"); //Add mode
            }
            else {
                grdPrescripHist_SetValues(grdPrescripHist_EditModeRow, "C"); //Add mode
            }
        }
    }
    return false;
}

function grdPrescripHist_SetValues(row, Mode) {
    //For Add prescription value into Table
    //var IsFill = 1;
    var CurQuan = trim(GCV("MHS", "txtQuan", 0));
    var PresAmt = trim(GCV("MHS", "hdnPrescribedAmt", 0));
    var Refills = trim(GCV("MHS", "txtRefills", 0));
    //curent quantity

    var BalQuan = parseInt(parseInt(CurQuan) + (parseInt(PresAmt) * parseInt(Refills)));
    var RefillBal = parseInt(parseInt(trim(GCV("MHS", "txtRefillsBal", 0))) - 1);
    var ActivityDate = trim(GCV("MHS", "dttmRefill", 15));
    var PrescId = trim(GCV("MHS", "hdnPrescribeID", 0));
    var Caller = "RefillHist";

    var szURL = glbSitePath + "/Inmate/frmInmateXML.aspx";
    var arrParams = new Array(7);

    arrParams[0] = new Array("BalQuan", BalQuan);
    arrParams[1] = new Array("Refills", Refills);
    arrParams[2] = new Array("RefillBal", RefillBal);
    arrParams[3] = new Array("PrescId", PrescId);
    arrParams[4] = new Array("ActivityDate", ActivityDate);
    arrParams[5] = new Array("Caller", Caller);
    arrParams[6] = new Array("Mode", Mode);

    var arrResponseData = KPIDoXMLHTTP(szURL, arrParams);
    if (arrResponseData != null) {
        for (i = 0; i < arrResponseData.length; i++) {
            var oRows = GrdGAR("MHS", "grdPrescripHist");
            if (arrResponseData[i][0] == "PrescrpHistId") {
                GrdSCV(row, "MedPresHistID", arrResponseData[i][1]);
                GrdSCV(row, "ActivityDttm", GCV("MHS", "dttmRefill", 15));
                GrdSCV(row, "OfficerPFID", "");
                GrdSCV(row, "DispenseQty", 0);
                GrdSCV(row, "IsFill", 1);
                GrdSCV(row, "BalanceQty", BalQuan);
                GrdSCV(row, "FillQty", Refills);
                GrdSCV(row, "KPIMode", Mode); //Add Mode
            }
            else if (arrResponseData[i][0] == "PFid") {
                GrdSCV(row, "OfficerPFID", arrResponseData[i][1]);
            }
            else {
            }
        }
    }
    else
        return true;
    fn_CancelEditPrescripHistRow();
}

//#endregion hierarchicalgrid
//---------------------------------------history navigation----------------------------------------------

//For APINctrl initialize
function reloadCurScreen()
{
    document.frmMedicalHistory_Id.submit();
}


//============================================================================================

//For display primary doctor info on select of cddprimary doctor
function fn_DispInfo() {
    //	if( trim(GCV("Main","cddPrimaryDoctor",8)) != null && trim(GCV("Main","cddPrimaryDoctor",8)) != "" )
    if (trim(GCV("Main", "lupPrimaryDoctor", 77)) != null && trim(GCV("Main", "lupPrimaryDoctor", 7)) != "") {
        var Doctor = trim(GCV("Main", "lupPrimaryDoctor", 77));
        var CallerType = "PrimaryDoctor";
        var szURL = glbSitePath + "/Inmate/frmInmateXML.aspx";
        var arrParams = new Array(2);
        arrParams[0] = new Array("Doctor", Doctor);
        arrParams[1] = new Array("CallerType", CallerType);
        var arrResponseData = KPIDoXMLHTTP(szURL, arrParams);
        if (arrResponseData != null) {
            for (i = 0; i < arrResponseData.length; i++) {
                if (arrResponseData[i][0] == "location") {
                    SCV("Main", "txtOfficeLocation", arrResponseData[i][1]);
                }
                else if (arrResponseData[i][0] == "Phone") {
                    SCV("Main", "cusHeaderPhone", arrResponseData[i][1], 12);
                }
                else if (arrResponseData[i][0] == "PhoneType") {
                    SCV("Main", "cusHeaderPhone", arrResponseData[i][1], 11);
                }
            }
        }
        else
            return true;
    }
    else {
        SCV("Main", "txtOfficeLocation", "", 0);
        SCV("Main", "cusHeaderPhone", "", 11);
        SCV("Main", "cusHeaderPhone", "", 12);
        return true;
    }
}

//For GrdDoctor doubleclick and open medical visit in update mode

function grdDoctor_DblClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        var bookingid = GCV("Main", "hdnBookingid", 0);
        var NameId = GCV("Main", "hdnNameID", 0);
        var medvistID = GrdGCMVById(eventArgs, "JMMedVisitID");
        var JurisId = GrdGCMVById(eventArgs, "KPIJurisID");
        var Width = 1024;
        var Height = 678;
        var left = (window.screen.width / 2) - ((Width / 2) + 10);
        var top = (window.screen.height / 2) - ((Height / 2) + 50);

        var strURL = glbSitePath + "/Inmate/frmMedicalVisit.aspx?NameId=" + NameId + "&Bookingid=" + bookingid + "&isdental=0&hdnMode=" + nGCV("hdnMode") + "&JMMedVisitID=" + medvistID + "&JurisId=" + JurisId + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
        openPositionWin(strURL, "MedicalVisitCHG", Width, Height, top, left);
        return false;
    }
}

    //For MedicalVisit onclickevent

function Medicalvisit() {

    try {
        var bookingid = nGCV("hdnBookingID", 0);
        var NameId = nGCV("hdnNameID", 0);
        var Width = 1024;
        var Height = 678;
        var left = (window.screen.width / 2) - ((Width / 2) + 10);
        var top = (window.screen.height / 2) - ((Height / 2) + 50);
        if (nGCV("hdnJMMedicalHistID") > 0) {
            
            var strURL = glbSitePath + "/Inmate/frmMedicalVisit.aspx?NameId=" + NameId + "&Bookingid=" + bookingid + "&isdental=0&hdnMode=" + nGCV("hdnMode") + "&JurisId=" + glbPageJuris + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
            openPositionWin(strURL, "MedicalVisitADD", Width, Height, top, left);
        }
    } catch (e) {

    }
    return false;
}
//=======================================================================================
//For DentalVisit onclickevent

function Dentalvisit() {
    var Width = 1100;
    var Height = 550;
    var left = (window.screen.width / 2) - ((Width / 2) + 10);
    var top = (window.screen.height / 2) - ((Height / 2) + 90);
    
    var BookingID = nGCV("hdnBookingID", 0)
    var NameID = nGCV("hdnNameID", 0)
    var HistoryID = nGCV("hdnJMMedicalHistID");
    if (HistoryID > 0) {
        var strURL = glbSitePath + "/Inmate/frmMedicalDentist.aspx?NameID=" + NameID + "&IsDental=1&hdnMode=ADD&hdnJurisId=" + glbPageJuris + "&BookingID=" + BookingID;
        openPositionWin(strURL, "DentalVisitADD", Width, Height, top, left);
    }
    return false;
}

//For Dental GRd Manipulation
var grdDental_EditModeRow = "";
function fn_DentalGridManip_Row() {
    if (grdDental_Validate()) {
        if (grdDental_EditModeRow == "") {
            var row = GrdAdd("Dental", "grdDental");
            if (row != null) {
                grdDental_SetValues(row, "A"); //Add mode
            }
        }
        else {
            if (GrdGCV(grdDental_EditModeRow, "KPIID") == "") {
                grdDental_SetValues(grdDental_EditModeRow, "A"); //Add mode
            }
            else {
                grdDental_SetValues(grdDental_EditModeRow, "C"); //Add mode
            }
        }
    }
    return false;
}

function grdDental_Validate() {
    var strDental = GCV("Dental", "dttmDentlvisit", 15);
    var strtime = GCV("Dental", "cddPrimaryDentist", 8);
    var strLocaion = GCV("Dental", "txtOfficeLocation", 0);  //adrctrlofficelocation

    if (strDental == "") {
        KPIAlert(NMSMsg_SELECT)
        return false
    }
    else if (strtime == "") {
        KPIAlert(NMSMsg_SELECT)
        return false
    }
    else if (strLocaion == "") {
        KPIAlert(NMSMsg_SELECT)
        return false
    }

    var oRows = GrdGAR("Dental", "grdDental");
    for (i = 0; i < oRows.get_length() ; i++) {
        var row = oRows.get_row(i);
        if (strtime == GrdGCV(row, "date")) {
            KPIAlert(FrwkMsg_DUPLICATION);
            return false;
        }
    }
    return true;
}

function fn_CancelEditDentalRow() {
    SCV("Dental", "lupPrimaryDentist", "", 6);
    SCV("Dental", "lupPrimaryDentist", "", 7);
    SCV("Dental", "lupPrimaryDentist", "", 77);
    grdDental_EditModeRow = "";
    return false;
}

function grdDental_SetValues(row, Mode) {
    GrdSCV(row, "date", GCV("Dental", "dttmDentlvisit", 15));  //dttlstdentlvisit
    GrdSCV(row, "Dentist", GCV("Dental", "cddPrimaryDentist", 8));
    GrdSCV(row, "Location", GCV("Dental", "txtOfficeLocation", 0));
    GrdSCV(row, "KPIMode", Mode); //Add Mode
    fn_CancelEditDentalRow();
}


//#region Dental Tab Related Script
function grdDental_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        grdDental_EditModeRow = GrdGSR("Dental", "grdDental");
        if (GrdColKey(sender) == glbKPIGrdDelKey) {
            GrdHandleDel("Dental", "grdDental");
            fn_CancelEditDentalRow();
        }
        else if (GrdColKey(sender) == 'Notes') {
            var DentVisitID = GrdGCV(grdDental_EditModeRow, "JMDentistVisitID");

            if (DentVisitID == "")
                return false;

            try {
                var RecType = PnxTxtDtl_RecType.Medical.JMMDentistVisit_Notes730;
                var strURL = glbSitePath + "/KPIFrameworkWeb/Home/frmTextMgrEx.aspx?AssoID=" + DentVisitID + "&hdnMode=" + nGCV("hdnMode") + "&AssoType=" + RecType + "&Internal=False&Disp=0&hdnJurisId=" + glbPageJuris + "&ScreenID=8540&GRDHeight=170";
                var left = (window.screen.width / 2) - ((900 / 2) + 10);
                var top = (window.screen.height / 2) - ((600 / 2) + 50);
                openPositionWin(strURL, "MedicalDentistEditor", 900, 600, top, left);
            } catch (e) {

            }

            return false;
        }
        else {
            var Width = 1100;
            var Height = 860;
            var left = (window.screen.width / 2) - ((Width / 2) + 10);
            var top = (window.screen.height / 2) - ((Height / 2) + 50);

            var BookingID = nGCV("hdnBookingID", 0)
            var JMMedicalDentistID = GrdGCV(grdDental_EditModeRow, "JMDentistVisitID");
            var Mode = nGCV('hdnMode');
            var NameID = nGCV("hdnNameID", 0)
            var strURL = glbSitePath + "/Inmate/frmMedicalDentist.aspx?NameID=" + NameID + "&IsDental=1&hdnMode=" + Mode + "&hdnJurisId=" + glbPageJuris + "&BookingID=" + GrdGCV(grdDental_EditModeRow, "JMBookingID") + "&JMDentistVisitID=" + JMMedicalDentistID;
            openPositionWin(strURL, "DentalVisitADD", Width, Height, top, left);

            //ChangeToEditMode_WithText("Dental", "cmdAddDental");

            return false;
        }
    }
}

//#endregion






//===============================================================================================================
//For Main Tab  GrdManipulation

var grdFlag_EditModeRow = "";
function fn_FlagGridManip_Row() {
    if (grdFlag_Validate()) {
        if (grdFlag_EditModeRow == "") {
            var row = GrdAdd("Main", "grdFlag");
            if (row != null) {
                grdFlag_SetValues(row, "A"); //Add mode
            }
        }
        else {
            if (GrdGCV(grdFlag_EditModeRow, "KPIID") == "") {
                grdFlag_SetValues(grdFlag_EditModeRow, "A"); //Add mode
            }
            else {
                grdFlag_SetValues(grdFlag_EditModeRow, "C"); //Change mode
            }
        }
    }
    return false;
}

function grdFlag_Validate() {
    var strFlag = GCV("Main", "cddFlag", 8);
    var strCmt = GCV("Main", "txtComment", 0);
    if (strFlag == "") {
        KPIAlert(JMSMsg_PlsChoose, 'Medical Flags');
        SCF("Main", "cddFlag", 8);
        return false;
    }
    /*else if(strCmt=="")
    {
    KPIAlert(NMSMsg_SELECT)
    return false
    }*/
    var oRows = GrdGAR("Main", "grdFlag");
    for (i = 0; i < oRows.get_length() ; i++) {
        var row = oRows.get_row(i);
        if (strFlag == GrdGCV(row, "Flag") && row != grdFlag_EditModeRow) {
            KPIAlert(FrwkMsg_DUPLICATION);
            return false;
        }
    }
    return true;
}

function fn_CancelEditFlagRow() {
    SCV("Main", "cddFlag", "", 8);
    SCV("Main", "txtComment", "", 0);
    SCF("Main", "cddFlag", 8);
    grdFlag_EditModeRow = "";
    ChangeToAddMode_WithText("Main", "cmdAdd");
    return false;
}

function grdFlag_SetValues(row, Mode) {
    GrdSCV(row, "Description", GCV("Main", "cddFlag", 9));
    GrdSCV(row, "Flag", GCV("Main", "cddFlag", 8));
    GrdSCV(row, "Cmts", GCV("Main", "txtComment", 0));
    //GrdSCV(row, "Comments", HtmlEncode(GCV("Main", "txtComment", 0)));

    var backImage = "url(/KPIImages/ico/text_icon.gif)";
    var cell = row.get_cellByColumnKey("FLGCMNT");

    if (GCV("Main", "txtComment").trim() != "") {
        cell._element.style.backgroundRepeat = "no-repeat";
        cell._element.style.backgroundImage = backImage;
    }
    else {
        cell._element.style.backgroundRepeat = "no-repeat";
        cell._element.style.backgroundImage = "";
    }
    GrdSCV(row, "KPIMode", Mode); //Add Mode
    fn_CancelEditFlagRow();
}

//usrmedicalmain tab grid name is grdFlag - cell click event should fire
function grdFlag_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        grdFlag_EditModeRow = GrdGSR("Main", "grdFlag");
        if (GrdColKey(sender) == glbKPIGrdDelKey) {
            GrdHandleDel("Main", "grdFlag")
            fn_CancelEditFlagRow();
        }
        else if ((GrdColKey(sender) == "FLGCMNT") && (GrdGCV(grdFlag_EditModeRow, "Comments") == "1")) {
            var Cmts = GrdGCV(grdFlag_EditModeRow, 'Comments');
            if (Cmts != '' && Cmts != '0') {
                var CMSRefValuesID = GrdGCV(grdFlag_EditModeRow, 'KPIID');
                var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?CMSRefValuesID=" + CMSRefValuesID + "&JurisID=" + nGCV("hdnJurisId", 0) + "&hdnScreenId=8530";
                var left = (window.screen.width / 2) - ((320 / 2) + 10);
                var top = (window.screen.height / 2) - ((400 / 2) + 50);
                openPositionWin(strURL, "MedFlagComments", 320, 400, top, left);
                fn_CancelEditFlagRow();
                return false;
            }
        }
        else {
            SCV("Main", "cddFlag", GrdGCV(grdFlag_EditModeRow, "Flag"), 8);
            SCV("Main", "txtComment", decodeXml(GrdGCV(grdFlag_EditModeRow, "Cmts"), 0));
            ChangeToEditMode_WithText("Main", "cmdAdd");
        }
    }
}
//===============================================================================================
//For Tab selection

function fn_AfterSelectedTab(sender, eventArgs) {
    var index = eventArgs.get_tabIndex();
    var oTab = sender.getTabAt(index);
    if (oTab == "" || oTab == undefined || oTab == null) {
        return;
    }
    switch (oTab.get_text()) {
        case "Medical Appointments":
            var strURL = "/Inmate/frmScheduledAppts.aspx?Mode=" + nGCV("hdnMode") + "&Status=0&hdnJurisID=" + nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
            if (oTab.get_contentUrl() !== ((glbSitePath + strURL))) {
                oTab.set_contentUrl(glbSitePath + strURL);
            }            
            break;
        case "Attachment":
            var strURL = "/KPIFrameworkWeb/Home/frmTxtAttachMgrEx.aspx?AssoID=" + nGCV("hdnNameID") + "&AssoType=3&Internal=True&Disp=0&hdnJurisId=" + glbPageJuris + "&hdnMode=" + nGCV("hdnMode") + "&ScreenId=8530&GRDHeight=170";
            if (oTab.get_contentUrl() !== ((glbSitePath + strURL))) {
                oTab.set_contentUrl(glbSitePath + strURL);
            }
            break;
        case "Vitals":
            var strURL = "/Inmate/frmMedVitals.aspx?Mode=" + nGCV("hdnMode") + "&Status=&hdnJurisID=" + nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
            if (oTab.get_contentUrl() !== ((glbSitePath + strURL))) {
                oTab.set_contentUrl(glbSitePath + strURL);
            }
            break;
        case "Charting":
            var strURL = "/Inmate/frmMedCharting.aspx?Mode=" + nGCV("hdnMode") + "&Status=1&hdnJurisID=" + nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
            if (oTab.get_contentUrl() !== ((glbSitePath + strURL))) {
                oTab.set_contentUrl(glbSitePath + strURL);
            }
            break;

        case "Allergy":
            var strURL = "/Inmate/frmMedAllergy.aspx?Mode=" +nGCV("hdnMode") + "&Status=0&hdnJurisID=" +nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" +nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" +nGCV("hdnJMMedicalHistID");
            if (oTab.get_contentUrl() !== ((glbSitePath + strURL))) {
                oTab.set_contentUrl(glbSitePath + strURL);
            }
            break;
        case "Diabetic":
            var strURL = "/Inmate/frmMedDiabetic.aspx?Mode=" + nGCV("hdnMode") + "&Status=0&hdnJurisID=" + nGCV("hdnJurisId", 0) + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + nGCV("hdnBookingID", 0) + "&JMMedicalHistID=" + nGCV("hdnJMMedicalHistID");
            if (oTab.get_contentUrl() !== ((glbSitePath + strURL))) {
                oTab.set_contentUrl(glbSitePath + strURL);
            }
            break;
    }
}

//dental tab, schedule button should be opened the below screen
function fn_OpenScheduler() {
    var BookingId = nGCV("hdnBookingID", 0);
    var strJurisID = nGCV("hdnJurisId", 0);
    var HistoryID = nGCV("hdnJMMedicalHistID");
    
    var ScreenID = "8218";
    if (BookingId != "" && BookingId != null) {
        var ScrHeight = 530;
        var ScrWidth = 1090;
        var SubAgeMode = "";
        if (nGCV("hdnMode") == "INQ") {
            SubAgeMode = "INQ";
        }
        if (HistoryID > 0) {
            var strURL = glbSitePath + "/FacilityMgmt/frmInmateMovement.aspx?sParent=Medical&Mode=" + nGCV("hdnMode") + "&ScreenID=" + ScreenID + "&hdnJurisID=" + strJurisID + "&InmateNameID=" + nGCV("hdnNameID") + "&BookingID=" + BookingId + "&opnFrm=Dental&SubAgeMode=" + SubAgeMode;
            var left = (window.screen.width / 2) - ((ScrWidth / 2) + 10);
            var top = (window.screen.height / 2) - ((ScrHeight / 2) + 50);
            openPositionWin(strURL, 'ClassificationSchedule', ScrWidth, ScrHeight, top, left);
        }
    }
    return false;
}

//
function OpenMedicalHistoryScreen() {
    var left = (window.screen.width / 2) - ((1020 / 2) + 10);
    var top = (window.screen.height / 2) - ((720 / 2) + 50);
    openPositionWin(glbSitePath + '/Inmate/frmMedicalHistory.aspx?hdnMode=ADD', 'MedicalHistory', 1020, 720, top, left);
}


function fn_MedVisitValidate() {
    var SPIN = nGCV("HeaderCtrl", 201);
    if (SPIN == "" || SPIN == "-9223372036854775808") {
        KPIAlert(JMSMsd_PleaseEnter, "SPN#");
        nSCF("HeaderCtrl", 200);
        return false;
    }
    return true;
}

function fn_DentistEntry(obj) {
    var strDoctorID = 0;
    if (obj == "Dental") {
        strDoctorID = trim(GCV("Dental", "lupPrimaryDentist", 77));
    }
    else if(obj=="HistorySupply"){
        strDoctorID = trim(GCV("MHS", "lupPrimaryDoctor", 77));
    }
    else {
        strDoctorID = trim(GCV("Main", "lupPrimaryDoctor", 77));
    }

    var JurisID = glbPageJuris;
    var left = (window.screen.width / 2) - ((700 / 2) + 10);
    var top = (window.screen.height / 2) - ((350 / 2) + 50);
    var mode = nGCV("hdnMode");

    if (mode != "INQ") {
        mode = "CHG";
    }
    if (strDoctorID > 0 && JurisID > 0) {
        var strURL = glbSitePath + "/Inmate/frmDoctorEntry.aspx?JurisID=" + JurisID + "&hdnMode=" + mode + "&DoctorID=" + strDoctorID;
        openPositionWin(strURL, "DoctorID", 700, 350, top, left);
    }
    return false;
}







function fn_IsClearTbTested() {
    try {
        SCV("Main", "NumCrtlMedicalNo", "", 80);
        SCV("Main", "dcTBTestDate", "", 15);
        document.getElementById("tabMain_tmpl0_UsrMedicalMain1_NumCrtlMedicalNo_Year").value = "";
        document.getElementById("tabMain_tmpl0_UsrMedicalMain1_NumCrtlMedicalNo_Number").value = "";
    } catch (e) {

    }
}

function RefreshParent() {
    try {
        if (window.opener != null) {
            if (window.opener.document.getElementById("hdnAutoLoad") != null) {
                window.opener.document.getElementById("hdnAutoLoad").value = "LOAD";
                window.opener.document.forms[0].submit();
            }
        }
    } catch (e) {
    }
}


function pageLoad() {
    nGCO('tabMain_tmpl0_UsrMedicalMain1_cusHeaderPhone_PhoneNumber').classList.add("textboxInactive");
    nGCO('tabMain_tmpl0_UsrMedicalMain1_cusHeaderPhone_PhoneNumber').classList.remove("textbox");
    nGCO('tabMain_tmpl0_UsrMedicalMain1_cusHeaderPhone_PhoneNumber').style.pointerEvents = "none";
    nGCO('tabMain_tmpl4_UsrDental1_cusHeaderPhone_PhoneNumber').classList.add("textboxInactive");
    nGCO('tabMain_tmpl4_UsrDental1_cusHeaderPhone_PhoneNumber').classList.remove("textbox");
    nGCO('tabMain_tmpl4_UsrDental1_cusHeaderPhone_PhoneNumber').style.pointerEvents = "none";
}


//CRM#65266 All inmate Booking Status should allow to create Medical Entry
function EnableAddBtsn() {
    nGCO("cmdClear").className = "menuItem";
    nEnable("cmdClear", 5);

    nGCO("cmdSave").className = "menuItem";
    nEnable("cmdSave", 5);

    nGCO("cmdSaveNClose").className = "menuItem";
    nEnable("cmdSaveNClose", 5);

    GCO("", "cmdAdd").className = "menuItem";
    Enable("", "cmdAdd", 5);

    GCO("", "cmdAdd").className = "menuItem";
    Enable("", "cmdAdd", 5);

}

//#region Medical Prescription



var grdPrescription_EditModeRow = "";
function fn_PrescriptionGridManip_Row() {
    if (grdPrescription_Validate()) {
        if (grdPrescription_EditModeRow == "") {
            var row = nHGrdAdd("MHS", "grdPrescription", 0);
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
        grdPrescription_EditModeRow = GCV("MHS", "hdnUseEndRowID", 0);
    }
    return false;
}

function fn_CancelEditPrescripRow() {
    SCV("MHS", "dttmPrescribedDate", "", 18);
    SCV("MHS", "hdnPrescribeID", "", 0);
    SCV("MHS", "lupPrimaryDoctor", "", 6);
    SCV("MHS", "lupPrimaryDoctor", "", 7);
    SCV("MHS", "lupPrimaryDoctor", "", 77);
    SCV("MHS", "txtPrescription", "", 0);
    SCV("MHS", "cddDrug", "", 8);
    SCV("MHS", "txtDosage", "", 0);
    SCV("MHS", "txtPrescribedAmt", "", 0);
    SCV("MHS", "cddPrescribedAmtDuration", "", 8);
    SCV("MHS", "txtRefills", "", 0);
    SCV("MHS", "chkGenericAllowed", false, 3);
    SCV("MHS", "UseEndeddttm", "", 18);
    SCV("MHS", "txtBalance", "");
    SCV("MHS", "txtDescription", "", 0);
    if (GCV("MHS", "lupPrimaryDoctor", 6) == "") {
        GCO("MHS", 'lupPrimaryDoctor_cmdIncOnAddr').style.visibility = 'hidden';
    }
    grdPrescription_EditModeRow = "";
    $('#tdNotes').removeClass("req");
    var btnid = GCO("MHS", "btnDisposition");
    btnid.Disable = true;
    btnid.style.color = "";
    btnid.className = "CustomBtn"
    Disable("MHS", "btnDisposition", 5);
    SelectedPeriodForSchedule.NotesMandatory = "";
    ChangeToAddMode_WithText("MHS", "cmdAdd");
    

    return false;
}

function grdPrescription_Validate() {
    var PrescribedDttm = GCV("MHS", "dttmPrescribedDate", 18);
    var PrescribedDoctorCode = GCV("MHS", "lupPrimaryDoctor", 6);
    var PrescribedDoctorID = GCV("MHS", "lupPrimaryDoctor", 77);
    var Drug = GCV("MHS", "cddDrug", 8);
    var Dosage = GCV("MHS", "txtDosage", 0);

    if (PrescribedDttm == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Prescribed Date");
        SCF("MHS", "dttmPrescribedDate", 18);
        return false;
    }
    if ((parseInt(PrescribedDoctorID) < 0 && PrescribedDoctorCode == "") || (PrescribedDoctorID == "" && PrescribedDoctorCode == "")) {
        KPIAlert(JMSMsd_PleaseEnter, "Prescribing Doctor");
        SCF("MHS", "lupPrimaryDoctor", 6);
        return false;
    }
    if (Drug == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Drug");
        SCF("MHS", "cddDrug", 8);
        return false;
    }
    if (!Dosage.match(/\S/)) {
        KPIAlert(JMSMsd_PleaseEnter, "Dosage");
        SCF("MHS", "txtDosage", 0);
        return false;
    }
    if (SelectedPeriodForSchedule.NotesMandatory == 1) {
        var strCmt = GCV("MHS", "txtDescription", 0);
        if (!strCmt.match(/\S/)) {
            KPIAlert(JMSMsd_PleaseEnter, "Notes");
            SCF("MHS", "UseEndeddttm", 0);
            return false;
        }
    }

    return true;
}

function grdPrescription_SetValues(rows, Mode) {

    let EndDateTime = "";
    var UseEnd = trim(GCV("MHS", "UseEndeddttm", 18));
    var comments = trim(GCV("MHS", "txtDescription", 0));
    var PrescribedDttm = GCV("MHS", "dttmPrescribedDate", 18);
    var PrescribedDoctorID = GCV("MHS", "lupPrimaryDoctor", 77);
    var PrescriptionText = GCV("MHS", "txtPrescription", 0);
    var Dosage = GCV("MHS", "txtDosage", 0);
    var PrescribedAmt = GCV("MHS", "txtPrescribedAmt", 0);
    var PrescribedDuration = GCV("MHS", "cddPrescribedAmtDuration", 8);
    var PrescribedDurationDesc = "";
    if (PrescribedDuration != "") {
        PrescribedDurationDesc = GCV("MHS", "cddPrescribedAmtDuration", 9);
    }    
    var Refills = GCV("MHS", "txtRefills", 0);
    var IsGeneric = GCV("MHS", "chkGenericAllowed", 3) == true ? 1 : 0;
    var UseEndedDttm = GCV("MHS", "UseEndeddttm", 18);
    
    var PrescribeNotes = GCV("MHS", "txtDescription", 0);
    var Drug = GCV("MHS", "cddDrug", 8);
    var DrugDesc = GCV("MHS", "cddDrug", 9);
    


    nGrdSCV(rows, "PrescribedDttm", PrescribedDttm);
    nGrdSCV(rows, "PrescribingDoctorID", PrescribedDoctorID);
    nGrdSCV(rows, "Prescription", PrescriptionText);
    nGrdSCV(rows, "Drug", Drug);
    nGrdSCV(rows, "Drugs", DrugDesc);
    nGrdSCV(rows, "Dosage", Dosage);
    nGrdSCV(rows, "PrescribedAmt", PrescribedAmt);
    nGrdSCV(rows, "PrescribedDuration", PrescribedDuration);

    nGrdSCV(rows, "DurationYrs", PrescribedAmt + " " + PrescribedDurationDesc);
    if (nGrdGCV(rows, "JMMedPrescriptionID") > 0) {
        
        var grdPrescription_EditModeRow = HIGrdGSR("MHS", "grdPrescription");
        SelectedPeriodForSchedule.UseEndedDttm = GrdGCV(grdPrescription_EditModeRow, "UseEndedDttm");
        if (SelectedPeriodForSchedule.UseEndedDttm != "" && (SelectedPeriodForSchedule.UseEndedDttm != null && UseEndedDttm !=null) && UseEndedDttm == "") {
            if (KPIConfirm(JMMMsg_DistributionSchedule)) {
                nGrdSCV(rows, "IsActiveSchedule", 1);
            } else {
                nGrdSCV(rows, "IsActiveSchedule", "0");
            }

        } else {
            nGrdSCV(rows, "IsActiveSchedule", "0");
        }
    }

    nGrdSCV(rows, "Refills", Refills);
    nGrdSCV(rows, "IsGeneric", IsGeneric);
    nGrdSCV(rows, "UseEndedDttmTemp", UseEndedDttm);
    nGrdSCV(rows, "JMMedVisitID", nGrdGCV(rows, "JMMedVisitID"));
    
    nGrdSCV(rows, "Notes", PrescribeNotes);

    nGrdSCV(rows, "OrderNo", -(rows._index));
    nGrdSCV(rows, "KPIMode", Mode);
    

    fn_CancelEditPrescripRow();
}



function grdPrescription_CellClickHandler(sender, eventArgs) {
    let CmtNotes = '';   

        if (eventArgs.get_type() == 'cell') {
        grdPrescription_EditModeRow = HIGrdGSR("MHS", "grdPrescription");
        var JMMedPrescriptionID = nGrdGCVById(eventArgs, "JMMedPrescriptionID");
        var Drug = nGrdGCVById(eventArgs,  "Drug");
        var JurisID = nGrdGCVById(eventArgs,  "JurisID");
        var JMBookingID = nGrdGCVById(eventArgs,  "JMBookingID");
        var JMPrescriptionOrderID = nGrdGCVById(eventArgs,  "JMPrescriptionOrderID");
        var OrderedNo = nGrdGCVById(eventArgs, "OrderedNo");
        


        if (sender._level == 1 && eventArgs.get_type() == "cell") {

            var JMPreOrderHistID = nGrdGCVById(eventArgs,  "JMPreOrderHistID");
            var JMPreOrderHistNo = nGrdGCVById(eventArgs,  "JMPreOrderHistNo");

            if (GrdColKey(sender) == "Cmts") {

                var JBMChargeExtnID = "";
                CmtNotes = nGrdGCVById(eventArgs, 'OrderedNotes');//nGrdGCV(grdPrescription_EditModeRow, 'OrderedNotes');
                if (CmtNotes != '') {
                    var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &JMPreOrderHistID=" + JMPreOrderHistID + "&JurisID=" + JurisID + "&hdnScreenId=8530&JMBookingID=" + JMBookingID;
                    var left = (window.screen.width / 2) - ((320 / 2) + 10);
                    var top = (window.screen.height / 2) - ((400 / 2) + 50);
                    openPositionWin(strURL, "MedicalPrescriptions", 320, 400, top, left);
                    fn_CancelEditPrescripRow();
                    return false;
                }
                return false;
            }
            else {
                var strURL = glbSitePath + "/Inmate/frmOrderEntry.aspx?Mode=CHG&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug + "&JMPrescriptionOrderID=" + JMPrescriptionOrderID + "&OrderedNo=" + OrderedNo + "&JMPreOrderHistID=" + JMPreOrderHistID + "&JMPreOrderHistNo=" + JMPreOrderHistNo;
                var left = (window.screen.width / 2) - ((650 / 2) + 10);
                var top = (window.screen.height / 2) - ((200 / 2) + 50);
                openPositionWin(strURL, "MedicalScheduleADD", 650, 270, top, left);
                fn_CancelEditPrescripRow();
                return false;
            }
        }
        else {

            let Disposition = nGrdGCVById(eventArgs,  "Disposition");

            if (GrdColKey(sender) == glbKPIGrdDelKey) {
                GrdHandleDel("MHS", "grdPrescription");
                fn_CancelEditPrescripRow();
            }
            else if (GrdColKey(sender) == "Schedule") {
                var strURL = glbSitePath + "/Inmate/frmMedSchedule.aspx?Mode=ADD&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug;
                var left = (window.screen.width / 2) - ((750 / 2) + 10);
                var top = (window.screen.height / 2) - ((500 / 2) + 50);
                openPositionWin(strURL, "MedicalScheduleADD", 750, 500, top, left);
                fn_CancelEditPrescripRow();
                return false;
            } else if (GrdColKey(sender) == "SupplyStatus") {
                var strURL = glbSitePath + "/Inmate/frmOrderEntry.aspx?Mode=ADD&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug + "&JMPrescriptionOrderID=" + JMPrescriptionOrderID + "&OrderedNo=" + OrderedNo;
                var left = (window.screen.width / 2) - ((650 / 2) + 10);
                var top = (window.screen.height / 2) - ((200 / 2) + 50);
                openPositionWin(strURL, "MedicalScheduleADD", 650, 270, top, left);
                fn_CancelEditPrescripRow();
                return false;

            }
            else if (GrdColKey(sender) == "Cmts") {

                var JBMChargeExtnID = "";
                CmtNotes = nGrdGCV(grdPrescription_EditModeRow, 'PrescribeNotes');
                if (CmtNotes != '') {
                    var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &JMMedPrescriptionID=" + JMMedPrescriptionID + "&JurisID=" + JurisID + "&hdnScreenId=8530&JMBookingID=" + JMBookingID;
                    var left = (window.screen.width / 2) - ((320 / 2) + 10);
                    var top = (window.screen.height / 2) - ((400 / 2) + 50);
                    openPositionWin(strURL, "MedicalPrescriptions", 320, 400, top, left);
                    fn_CancelEditPrescripRow();
                    return false;
                }
            }
            else {
                SCV("MHS", "dttmPrescribedDate", nGrdGCVById(eventArgs,  "PrescribedDttm"), 18);
                SCV("MHS", "hdnPrescribeID", JMMedPrescriptionID, 0);
                SCV("MHS", "lupPrimaryDoctor", nGrdGCVById(eventArgs,  "DoctorName"), 6);
                SCV("MHS", "lupPrimaryDoctor", nGrdGCVById(eventArgs,  "DoctorName"), 7);
                SCV("MHS", "lupPrimaryDoctor", nGrdGCVById(eventArgs,  "PrescribingDoctorID"), 77);

                if (GCV("MHS", "lupPrimaryDoctor", 77) != "" && GCV("MHS", "lupPrimaryDoctor", 77) >= 0) {
                    GCO("MHS", 'lupPrimaryDoctor_cmdIncOnAddr').src = glbSitePath + "/KPIFrameworkWeb/Images/ico_18_debug.gif";
                }
                else {
                    GCO("MHS", 'lupPrimaryDoctor_cmdIncOnAddr').src = glbSitePath + "/KPIFrameworkWeb/Images/ico/16_L_remove.gif";
                }

                SCV("MHS", "txtPrescription", nGrdGCVById(eventArgs,  "Prescription"), 0);
                SCV("MHS", "cddDrug", Drug, 8);
                SCV("MHS", "txtDosage", nGrdGCVById(eventArgs,  "Dosage"), 0);
                SCV("MHS", "txtPrescribedAmt", nGrdGCVById(eventArgs,  "PrescribedAmt"), 0);
                SCV("MHS", "cddPrescribedAmtDuration", nGrdGCVById(eventArgs,  "PrescribedDuration"), 8);
                SCV("MHS", "txtRefills", nGrdGCVById(eventArgs, "Refills"), 0);
                
                
                SCV("MHS", "chkGenericAllowed", nGrdGCVById(eventArgs,  "IsGeneric") == true ? 1 : 0, 3);
                if (nGrdGCVById(eventArgs,  "UseEndedDttmTemp") != "") {
                    SCV("MHS", "UseEndeddttm", nGrdGCVById(eventArgs,  "UseEndedDttmTemp"), 18);
                }
                else {
                    SCV("MHS", "UseEndedDttmTemp", "", 18);
                }
                
                
                SCV("MHS", "txtDescription", nGrdGCVById(eventArgs, "Notes"), 0);
                
                
                SCV("MHS", "txtBalance", nGrdGCVById(eventArgs, "CurQuantity"), 0);
                if (JMMedPrescriptionID > 0) {

                    Enable("MHS", "btnDisposition", 5);
                    fn_validateNotesMandatory(eventArgs);
                } else {
                    Disable("MHS", "btnDisposition", 5);
                }
                var btnid = GCO("MHS", "btnDisposition");
                if (Disposition > 0) {
                    btnid.style.backgroundColor = "green";
                    btnid.style.color = "green";
                    btnid.className = "CustomBtnRedBold"
                } else {
                    btnid.Disable = true;
                    btnid.style.color = "";
                    btnid.className = "CustomBtn";                    
                }
                ChangeToEditMode_WithText("MHS", "cmdAdd");
                
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
        for (iRows = 0; iRows < allRows.get_length() ; iRows++) {

            var keyCell = allRows.get_row(iRows).get_cellByColumnKey(keyName);

            if (keyCell.get_value() == KeyValue)
                return keyCell.get_row();
        }
    }

    return null;
}



function HIGrdGSR(tabPaneName, gridId) {
    return nHIGrdGSR(_KPITabGridID(tabPaneName, gridId));
}


function nHIGrdGSR(gridId) {
    try {
        var grid = nGetGrd(gridId).get_gridView();
        var row = null;

        var oRows = nHGrdGAR(gridId);
        for (var iRow = 0; iRow < oRows.get_length() ; iRow++) {
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


function GetUseEndDttm(JMMedPrescriptionID) {
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedSchedule.aspx/GetUseEndDttm",
        data: "{'JMMedPrescriptionID':'" + JMMedPrescriptionID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);

            SelectedPeriodForSchedule.UseEndedDttm = obj["UseEndedDttm"] == null ? null : eval(obj["UseEndedDttm"].replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
          
        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            return false;
        }
    });
}




function fn_validateNotesMandatory(eventArgs) {

    GetUseEndDttm(nGrdGCVById(eventArgs, "JMMedPrescriptionID"));

    if (SelectedPeriodForSchedule.UseEndedDttm == null && GCV("MHS", "UseEndeddttm", 18) == "") {
        SelectedPeriodForSchedule.NotesMandatory = "";
    } else {
        SelectedPeriodForSchedule.NotesMandatory = 1;
    }

    fn_Mandatory();
}

function fn_validateNotes() {
    var UseEndedDttm = GCV("MHS", "UseEndeddttm", 18);
    var grdPrescription_EditModeRow = HIGrdGSR("MHS", "grdPrescription");
    var JMMedPrescriptionID = GrdGCV(grdPrescription_EditModeRow, "JMMedPrescriptionID");

    SelectedPeriodForSchedule.UseEndedDttm = GrdGCV(grdPrescription_EditModeRow, "UseEndedDttm");
    if (UseEndedDttm == "" && (SelectedPeriodForSchedule.UseEndedDttm == null || SelectedPeriodForSchedule.UseEndedDttm == "")) {
        SelectedPeriodForSchedule.NotesMandatory = "";
    } else {
        SelectedPeriodForSchedule.NotesMandatory = 1;
        if (UseEndedDttm == "") {
            SCV("MHS", "UseEndeddttm", "", 19);
        }
    }
    fn_Mandatory();
}


function fn_Mandatory() {
    if (SelectedPeriodForSchedule.NotesMandatory == 1) {
        $('#tdNotes').addClass("req");
    }
    else {
        $('#tdNotes').removeClass("req");
    }
}



function fn_Disposition() {
    var grdPrescription_EditModeRow = HIGrdGSR("MHS", "grdPrescription");
    if (grdPrescription_EditModeRow != null && grdPrescription_EditModeRow != "") {
        var JMMedPrescriptionID = GrdGCV(grdPrescription_EditModeRow, "JMMedPrescriptionID");
        var Drug = GrdGCV(grdPrescription_EditModeRow, "Drug");
        var JurisID = GrdGCV(grdPrescription_EditModeRow, "JurisID");
        var JMBookingID = GrdGCV(grdPrescription_EditModeRow, "JMBookingID");
        var JMPrescriptionOrderID = GrdGCV(grdPrescription_EditModeRow, "JMPrescriptionOrderID");
        var OrderedNo = GrdGCV(grdPrescription_EditModeRow, "OrderedNo");
        
        if (!fn_BalanceQty(JMMedPrescriptionID)) {
            var strURL = glbSitePath + "/Inmate/frmOrderEntry.aspx?Mode=ADD&Disposition=1&JMMedPrescriptionID=" + JMMedPrescriptionID + "&hdnJurisId=" + JurisID + "&JMBookingID=" + JMBookingID + "&DrugID=" + Drug + "&JMPrescriptionOrderID=" + JMPrescriptionOrderID + "&OrderedNo=" + OrderedNo;
            var left = (window.screen.width / 2) - ((650 / 2) + 10);
            var top = (window.screen.height / 2) - ((200 / 2) + 50);
            openPositionWin(strURL, "MedicalScheduleADD", 650, 270, top, left);
        } else {
            KPIAlert(JMMMsg_BalanceQty);
        }
    }
    return false;
}

function fn_BalanceQty(JMMedPrescriptionID) {
    TotalBalance = 0;
    UseEndedDttm = null;
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedSchedule.aspx/GetUseEndDttm",
        data: "{'JMMedPrescriptionID':'" + JMMedPrescriptionID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);

            UseEndedDttm = obj["UseEndedDttm"] == null ? null : eval(obj["UseEndedDttm"].replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
            if (UseEndedDttm == null) {
                TotalBalance = obj["CurQuantity"];
            }

        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            return false;
        }
    });

    if (UseEndedDttm == null && TotalBalance <= 0) {
        return true;
    } else {
        return false;
    }

}
//#endregion

