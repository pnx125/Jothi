

var grdChartDetails_EditModeRow = "";


function fn_ValidateScreen() {

    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (Validate()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                ShowProgressPanel();
                TabSave("Charting", false);
                return true;
            }
            else
                return false;
        }
        else
            return false;
    }
    else if (glbCtrlClicked == "Reset") {
        TabSave("Charting", false);
    }
    return true;
}



function Validate() {
    var oRows = nGrdGAR("grdChartDetails");

    if (nGCV('dttmChartingDate', 18) != '' || nGCV('lupPF', 6) != '' || nGCV('cddReason', 8) != '') {
        return KPIAlert(FrwkMsg_CTRL_UPDATE);        
    }

    if (oRows.get_length() <= 0) {
        KPIAlert(KPIMsg_NO_DATA);
        return false;
    }

    return true;
}



function fn_ManiGrdDetails() {
    if (grdChartDetails_Validate()) {
        if (grdChartDetails_EditModeRow == "") {
            var row = nGrdAdd('grdChartDetails');
            if (row != null) {
                grdChartDetails_SetValues(row, 'A');
            }
        }
        else {
            if (nGrdGCV(grdChartDetails_EditModeRow, 'KPIID') == '') {
                grdChartDetails_SetValues(grdChartDetails_EditModeRow, 'A');
            }
            else {
                grdChartDetails_SetValues(grdChartDetails_EditModeRow, 'C');
            }
        }
    }
    
    return false;
}



function grdChartDetails_Validate() {
    var dttmChartingDate = nGCV("dttmChartingDate", 18);
    var dttmChartingDateTime = nGCV("dttmChartingDate", 19);
    if (dttmChartingDate == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        nSCF('dttmChartingDate', 18);
        return false;
    }
    if (dttmChartingDateTime == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        nSCF('dttmChartingDate', 19);
        return false;
    }
    if (nGCV('lupPF', 6) == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Officer");
        nSCF('lupPF', 6);
        return false;
    }

    if (nGCV('cddReason', 8) == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Reason");
        nSCF('cddReason', 8);
        return false;
    }

    var oRows = nGrdGAR("grdChartDetails");

    for (i = 0; i < oRows.get_length() ; i++) {
        var row = oRows.get_row(i);
        if (dttmChartingDate != '') {
            var strtime = formatDate(nGCV("dttmChartingDate", 18), "MM/dd/yyyy HH:mm");
            var pf = nGCV('lupPF', 77);
            var reason = nGCV('cddReason', 8);

            var GrdPF = String(GrdGCV(row, 'PFID'));
            var GrdReason = GrdGCV(row, 'ReasonCode');
            var GrdDate = formatDate(GrdGCV(row, "Dttm"), "MM/dd/yyyy HH:mm");


            if ((strtime == GrdDate) && (pf == GrdPF) && (reason == GrdReason) && row != grdChartDetails_EditModeRow) {
                KPIAlert(FrwkMsg_DUPLICATION);
                return false;
            }
        }
    }
    return true;
}


function ValidateChartingScr() {
    if (nGCV('dttmChartingDate', 18) != '' || nGCV('lupPF', 6) != '' || nGCV('cddReason', 8) != '') {
        KPIAlert(JMSMsg_SupervisorClr, GTText("Charting"));
        nSCF('dttmChartingDate', 18);
        return false;
    }
    else {
        return true;
    }
}

//usrmedicalmain tab grid name is grdFlag - cell click event should fire
function grdChartDetails_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        grdChartDetails_EditModeRow = nGrdGSR("grdChartDetails");
        if (GrdColKey(sender) == glbKPIGrdDelKey) {
            nGrdHandleDel("grdChartDetails")
            TabSave("Charting", true);
            fn_CancelChartDetailsRow();
        }        
        else if (nGrdColKey(sender) == "C") {
            var grdRow = nGrdGSR("grdChartDetails");
            var JMChartID = nGrdGCV(grdRow, 'KPIID');
            var left = (window.screen.width / 2) - ((900 / 2) + 10);
            var top = (window.screen.height / 2) - ((590 / 2) + 50);
            var JMBookingID = nGrdGCV(grdRow, 'JMBookingID');
            var JurisID = nGrdGCV(grdRow, 'JurisID');
            var JMMedicalHistID = nGrdGCV(grdRow, 'JMMedicalHistID');
            fn_CancelChartDetailsRow();
            if (JMChartID != "" && JMChartID != null && JMChartID > 0) {
                //  var strURL = glbSitePath + "/KPIFrameworkWeb/Home/frmTextMgrEx.aspx?AssoID=" + JMChartID + "&AssoType=1&Internal=False&Disp=0&hdnMode=INQ&JurisId=" + nGCV("hdnJurisId") + "&ScreenID=8272&GRDHeight=170";
                var strURL = glbSitePath + "/Inmate/frmMedChartingHistory.aspx?JMChartID=" + JMChartID + "&hdnMode=" + nGCV("hdnMode") + "&hdnJurisId=" + JurisID + "&BookingID=" + JMBookingID + "&JMMedicalHistID=" + JMMedicalHistID;
                openPositionWin(strURL, "DispOfficerComments", 900, 590, top, left);
                return false;
            }
            else
                return false;
        }
        else if (nGrdColKey(sender) != 'C') {
            var mode = nGrdGCV(grdChartDetails_EditModeRow, 'KPIMode');

            nSCV("cddReason", nGrdGCV(grdChartDetails_EditModeRow, "ReasonCode"), 8);
            nSCV('lupPF', nGrdGCV(grdChartDetails_EditModeRow, 'PFID'), 77);
            nSCV('lupPF', nGrdGCV(grdChartDetails_EditModeRow, 'PFCode'), 6);
            nSCV('lupPF', nGrdGCV(grdChartDetails_EditModeRow, 'PF'), 7);
            nSCV('dttmChartingDate', nGrdGCV(grdChartDetails_EditModeRow, 'Dttm'), 18);
            TabSave("Charting", true);
            nChangeToEditMode_WithText("cmdAdd");
        }
    }
}



function OpenDetailsEditor() {
    var JMChartID = nGrdGCV(nGrdGSR('grdChartDetails'), 'KPIID');
    var strURL = "";
    var left = (window.screen.width / 2) - ((900 / 2) + 10);
    var top = (window.screen.height / 2) - ((590 / 2) + 50);

    if (JMChartID != "") {
        strURL = glbSitePath + "/KPIFrameworkWeb/Home/frmTextMgrEx.aspx?AssoID=" + JMChartID + "&AssoType=1&Internal=False&Disp=0&hdnMode=" + nGCV("hdnMode") + "&JurisId=" + nGCV("hdnJurisId") + "&ScreenID=8272&GRDHeight=170";
    }

    openPositionWin(strURL, "DispOfficerComments", 900, 590, top, left);
    return false;
}


function fn_CancelChartDetailsRow() {
    sGeneratedID = "";
    nSCV('lupPF', '', 6);
    nSCV('lupPF', '', 7);
    nSCV('lupPF', '', 77);
    nSCV('dttmChartingDate', '', 18);
    nSCV('cddReason', '', 8);
    nSCV('cddReason', '', 9);
    grdChartDetails_EditModeRow = '';
    nChangeToAddMode_WithText('cmdAdd');
    return false;
}



function grdChartDetails_SetValues(row, Mode) {
    try {
        nGrdSCV(row, 'PFCode', nGCV('lupPF', 6));
        nGrdSCV(row, 'PF', nGCV('lupPF', 7));
        nGrdSCV(row, 'PFID', nGCV('lupPF', 77));
        nGrdSCV(row, 'ReasonCode', nGCV('cddReason', 8));
        nGrdSCV(row, 'Reason', nGCV('cddReason', 9));
        var Offdate = new Date(nGCV('dttmChartingDate', 18));
        var varOffdate = formatDate(Offdate, "MM/dd/yyyy HH:mm");
        nGrdSCV(row, 'Dttm', varOffdate);
        nGrdSCV(row, 'KPIMode', Mode);
        fn_CancelChartDetailsRow();
        TabSave("Charting", true);

    } catch (e) {

    }
    return false;
}

function FillLoggedInPF() {
    if (nGCV("hdnSetUserPFID") == "1") {
        if (nGCV("hdnLoginPFCode") != "" && nGCV("hdnLoginPFDesc") != "" && nGCV("hdnLoginPFID") != "") {
            if (nGCV("lupPF", 6) == "") {
                nSCV("lupPF", nGCV("hdnLoginPFCode"), 6);
                nSCV("lupPF", nGCV("hdnLoginPFDesc"), 7);
                nSCV("lupPF", nGCV("hdnLoginPFID"), 77);
            }
        }
    }
}

