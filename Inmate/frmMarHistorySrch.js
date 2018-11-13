function srchTlb_Click(sender, eventArgs) {

    switch (eventArgs.getItem().get_key()) {

        case "Reset":
            nSCV("hdnAutoLoad", "");
            eventArgs.set_cancel(false);
            break;
        case "Search":
        case "Excel":
        case "Print":
            if (!ValidateScrn()) {
                eventArgs.set_cancel(true);
                return false;
            }
            if (!IsDateValidate()) {
                nSCV("hdnAutoLoad", "");
                eventArgs.set_cancel(true);

            }
            else {
                nSCV("hdnAutoLoad", "SEARCH");                
            }
            break;
    }
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

function IsDateValidate() {
    if (document.getElementById("pnlSearch") != null) {
        if (trim(GCV("BSC", "dttmFromDate", 18)) == '') {
            KPIAlert(JMSMsd_PleaseEnter, "From Date");
            SCF("BSC", "dttmFromDate", 18);
            return false;
        }

        if (trim(GCV("BSC", "dttmToDate", 18)) == '') {
            KPIAlert(JMSMsd_PleaseEnter, "To Date");
            SCF("BSC", "dttmToDate", 18);
            return false;
        }
        var DToDt = trim(GCV("BSC", "dttmToDate", 18));
        var DFromDt = trim(GCV("BSC", "dttmFromDate", 18));
        if (KPIDateCompare(new Date(DToDt), "<", new Date(DFromDt))) {
            KPIAlert(JHbrMsg_HuberEndNotGrtStart);
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
                document.frmMarHistorySrch_Id.submit();
            }
        }
});

$(document).keypress(function (e) {
    if (e.which == 13) {
        e.preventDefault();
        if (!ValidateScrn()) {
            return false;
        }
        if (!IsDateValidate()) {            
            return false;
        }
        nSCV("hdnAutoLoad", "ENTERKEY");
        glbKeyCaller = "EnterKey";
        document.frmMarHistorySrch_Id.submit();
    }
    else if (document.getElementById("pnlSearchResults") != null) {
        if (e.which == 8) {
            e.preventDefault();
            nSCV("hdnAutoLoad", "BACKSPACE");
            glbKeyCaller = "BackSpace";
            document.frmMarHistorySrch_Id.submit();
        }
    }
});
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

function grdMarhistory_DblClickHandler(sender, eventArgs) {

    if (eventArgs.get_type() == "cell") {
        //var JMMedPrescriptionID = nGrdGCVById(eventArgs, "JMMedPrescriptionID");
        var Drug = nGrdGCVById(eventArgs, "Drug");
        var Dosage = nGrdGCVById(eventArgs, "Dosage");
        //var CurQuantity = nGrdGCVById(eventArgs, "CurQuantity");
        //var balrefill = nGrdGCVById(eventArgs, "RefillBal") > 0 ? nGrdGCVById(eventArgs, "RefillBal") : "";
        var NameID = nGrdGCVById(eventArgs, "NameID");
        var JMBookingID = nGrdGCVById(eventArgs, "JMBookingID");
        //var JMPrescriptionSchduleID = nGrdGCVById(eventArgs, "JMPrescriptionSchduleID");
        //var Times = nGrdGCVById(eventArgs, "Times");
        var JMMedPrescriptionHistID = nGrdGCVById(eventArgs, "JMMedPrescriptionHistID");
        var JurisID = nGrdGCVById(eventArgs, "KPIJurisID");
        var Dispense = nGrdGCVById(eventArgs, "Dispense");
        var MedicationType = nGrdGCVById(eventArgs, "DispenseType");
        var JMMScheduleEventsID = nGrdGCVById(eventArgs, "JMMScheduleEventsID");


       
        if (JMMedPrescriptionHistID >= "0") {
            var left = (window.screen.width / 2) - ((1000 / 2) + 10);
            var top = (window.screen.height / 2) - ((380 / 2) + 50);
            //var strURL = glbSitePath + "/Inmate/frmMedicationHist.aspx?hdnMode=INQ&Times=" + Times + "&NameID=" + NameID + "&Mode=INQ&JMMedPrescriptionID=" + JMMedPrescriptionID + "&JMMedPrescriptionHistID=" + JMMedPrescriptionHistID + "&MedicationType=" + MedicationType + "&Dispense=" + Dispense + "&JMMScheduleEventsID=" + JMMScheduleEventsID + "&JurisID=" + JurisID;
            var strURL = glbSitePath + "/Inmate/frmMedicationHist.aspx?Flag=1&hdnMode=INQ&Mode=INQ&JMMedPrescriptionHistID=" + JMMedPrescriptionHistID + "&MedicationType=" + MedicationType + "&Dispense=" + Dispense + "&JMMScheduleEventsID=" + JMMScheduleEventsID + "&JurisID=" + JurisID + "&NameID=" + NameID;
            openPositionWin(strURL, "InmateMedicalHist", 1000, 380, top, left);
        }
       

        
        return false;
    }
}