

var left = (window.screen.width / 2) - ((1020 / 2) + 10);
var top = (window.screen.height / 2) - ((720 / 2) + 50);

function tabMedSrch_AfterSelectedTabChange(sender, eventArgs) {
    var index = eventArgs.get_tabIndex();    
    var oTab = sender.getTabAt(index);
    if (oTab == "" || oTab == undefined || oTab == null) {
        return;
    }
    switch (oTab.get_text()) {          
        case "Basic":
            SCF("BSC", "nmcSPIN", 15);
            break;
    }
}


function srchTlb_Click(sender, eventArgs) {
    switch (eventArgs.getItem().get_key()) {
        case "AddNew":
            var strURL = glbSitePath + "/Inmate/frmMedicalHistory.aspx?hdnMode=ADD";
            openPositionWin(strURL, "MedicationHistory", 1020, 720, top, left);
            eventArgs.set_cancel(true);
            break;

        case "Refresh":
            ClearAll();
            break;

        case "Search":
            if (!ValidateScrn()) {
                eventArgs.set_cancel(true);
                return false;
            }
            if (CheckSearchFilter()) {
                nSCV("hdnAutoLoad", "SEARCH");
            }
            else {
                nSCV("hdnAutoLoad", "");
                eventArgs.set_cancel(true);
                KPIAlert(NMSMsg_SRCH);
                return false;
            }
            break;
        case "Excel":
        case "Print":
            if (!ValidateScrn()) {
                eventArgs.set_cancel(true);
                return false;
            }
            if (!CheckSearchFilter()) {
                KPIAlert(NMSMsg_SRCH);
                eventArgs.set_cancel(true);
                return false;
            }
    }
    return false;
}
function Search_Click() {
    return true;
}
//======================for search grdMedical DblClick and open medical History in update mode======================

function grdMedical_DblClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        var BookingID = nGrdGCMVById(eventArgs, "JMBOOKINGID");
        var NameID = nGrdGCMVById(eventArgs, "InmateNameID");
        var PriDocID = nGrdGCMVById(eventArgs, "PrimeDoctorID");
        var JurisId = nGrdGCMVById(eventArgs, "KPIJurisID");
        var JMMedicalHistID = nGrdGCMVById(eventArgs, "JMMedicalHistID");
        var strURL = glbSitePath + "/Inmate/frmMedicalHistory.aspx?PriDocID=" + PriDocID + "&NameID=" + NameID + "&BookingID=" + BookingID + "&hdnMode=CHG&JurisId=" + JurisId + "&JMMedicalHistID=" + JMMedicalHistID;
        openPositionWin(strURL, "MedicalHistCHG", 1020, 720, top, left);
        return false;
    }
}


function grdMedicalHist_CellClickHandler(sender, eventArgs) {
    if (parseInt(sender._level) == 0 && eventArgs.get_type() == "cell") {

        var row = eventArgs.get_item().get_row();


        var BookingID = nGrdGCV(row, "JMBookingID");
        var NameID = nGrdGCV(row, "NameID");
        var PriDocID = nGrdGCV(row, "PrimeDoctorID");
        var JurisId = nGrdGCV(row, "KPIJurisID");
        var JMMedicalHistID = nGrdGCV(row, "JMMedicalHistID");
        var strURL = glbSitePath + "/Inmate/frmMedicalHistory.aspx?PriDocID=" + PriDocID + "&NameID=" + NameID + "&BookingID=" + BookingID + "&hdnMode=CHG&JurisId=" + JurisId + "&JMMedicalHistID=" + JMMedicalHistID;
        openPositionWin(strURL, "MedicalHistCHG", 1020, 720, top, left);
        return false;
    }
}

//Screen height set default while page load

function pageLoad() {
    nSCV('hdnPageHgt', screen.height);
}

///From & To Date Validation 
function dtFromGreater_TextChanged(oDropDown, newText, oEvent) {
    var varFromDate = new Date(GCV("BSC", "dttmFromDate", 18));
    var CurDate = new KPIGetCurDttm();
    if (KPIDateCompare(varFromDate, ">", CurDate)) {
        KPIAlert(FrwkMsg_DATE_FUTURE);
        SCV("BSC", "dttmFromDate", "", 18)
        return false;
    }

    return true;
}
function dttmExpired_TextChanged(oDropDown, newText, oEvent) {
    var varFromDate = new Date(GCV("BSC", "dttmFromDate", 18));
    var varToDate = new Date(GCV("BSC", "dttmToDate", 18));
    var CurDate = new KPIGetCurDttm();
    if (KPIDateCompare(varFromDate, ">", varToDate)) {
        KPIAlert(HomeMsg_FROM_LESS_TO);
        SCV("BSC", "dttmFromDate", "", 18)
        return false;
    }

    if (KPIDateCompare(varToDate, ">", CurDate)) {
        KPIAlert(FrwkMsg_DATE_FUTURE);
        SCV("BSC", "dttmToDate", "", 18)
        return false;
    }
    return true;
}

function fn_Clear() {
    SCV("BSC", "dttmFromDate", "", 18);
    SCV("BSC", "dttmToDate", "", 18);
    return false;
}

function ValidateScrn() {
    if (GCO("BSC", "lstJuris", 1) != null && GCO("BSC", "lstJuris", 1) != undefined) {
        if (GCV("BSC", 'lstJuris', 1) == "--" || GCV("BSC", 'lstJuris', 1) == "" || GCV("BSC", 'lstJuris', 1) == "0") {
            KPIAlert(JMSMsd_PleaseEnter, "Juris");
            SCF("BSC", 'lstJuris', 1);
            nSCV("hdnAutoLoad", "");
            return false;
        }
    }   
    return true;
}


function CheckSearchFilter() {

    if (document.getElementById("pnlSearch") != null) {


        var radAllergy = RadGetSelectedItems("BSC", "radAllergy");
        var radDentProcedure = RadGetSelectedItems("BSC", "radDentProcedure");
        var radSpecialMealRequired = RadGetSelectedItems("BSC", "radSpecialMealRequired");
        var radMedicalFlags = RadGetSelectedItems("BSC", "radMedicalFlags");



        if (radAllergy.length == 0 && radDentProcedure.length == 0 && radSpecialMealRequired.length == 0 && radMedicalFlags.length == 0 && trim(GCV("BSC", "lupDiagnosed", 6)) == '' && trim(GCV("BSC", "lupDiagnosed", 7)) == '' && (trim(GCV("BSC", "lupDiagnosed", 77)) == '' || trim(GCV("BSC", "lupDiagnosed", 77)) <= 0) && trim(GCV("BSC", "cddTBResults", 8)) == '' && (trim(GCV("BSC", "NamCtrlSPIN", 32)) == '' || GCV("BSC", "NamCtrlSPIN", 32) <= 0) && trim(GCV("BSC", "cddDrugs", 8)) == '' && trim(GCV("BSC", "cddAdmMedFacility", 8)) == '' && trim(GCV("BSC", "dttmFromDate", 18)) == '' && trim(GCV("BSC", "dttmToDate", 18)) == '') {
            return false;
        }
        else {
            return true;
        }
    }
    else {
        return true;
    }
}



$(document).keypress(function (e) {
    if (e.which == 13) {
        e.preventDefault();
        if (!ValidateScrn()) {
            return false;
        }
        if (!CheckSearchFilter()) {
            KPIAlert(NMSMsg_SRCH);
            return false;
        }
        nSCV("hdnAutoLoad", "ENTERKEY");
        glbKeyCaller = "EnterKey";
        document.frmMedicalSrch_Id.submit();
    }
    else if (document.getElementById("pnlSearchResults") != null) {
        if (e.which == 8) {
            e.preventDefault();
            nSCV("hdnAutoLoad", "BACKSPACE");
            glbKeyCaller = "BackSpace";
            document.frmMedicalSrch_Id.submit();
        }
    }
});

$(document).bind("keydown", function (e) {
    if (e.which == 8)
        if (!(e.target.tagName == "INPUT" || document.getElementById("pnlSearchResults") != null)) {
            e.preventDefault();
        }
        else if (document.getElementById("pnlSearchResults") != null) {
            if (!(e.target.tagName == "INPUT")) {
                e.preventDefault();
                nSCV("hdnAutoLoad", "BACKSPACE");
                glbKeyCaller = "BackSpace";
                document.frmMedicalSrch_Id.submit();
            }
        }
});
