var grdDiabetic_EditModeRow = "";

function grdDiabetic_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        grdDiabetic_EditModeRow = nGrdGSR("grdDiabetic");
        if (nGrdColKey(sender) == glbKPIGrdDelKey) {
            nGrdHandleDel("grdDiabetic")
            TabSave("MedicalDiabetic", true);
            fn_CancelDiabeticDetails();
        } else if (nGrdColKey(sender) == "C") {
            var JMMDiabeticID = nGrdGCV(grdDiabetic_EditModeRow, 'JMMDiabeticID');
            var JMBookingID = nGrdGCV(grdDiabetic_EditModeRow, 'JMBookingID');
            var JurisID = nGrdGCV(grdDiabetic_EditModeRow, 'JurisID');
            var JBMChargeExtnID = "";
            var Cmts = nGrdGCV(grdDiabetic_EditModeRow, 'ActionNotes');
            if (Cmts != '') {
                try {
                    var RecType = PnxTxtDtl_RecType.Medical.JMMDiabetic_ActionNotes731;
                    var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &JMMDiabeticID=" + JMMDiabeticID + "&JurisID=" + JurisID + "&hdnScreenId=8548&JMBookingID=" + JMBookingID+"&RecType="+RecType;
                    var left = (window.screen.width / 2) - ((320 / 2) + 10);
                    var top = (window.screen.height / 2) - ((400 / 2) + 50);
                    openPositionWin(strURL, "MedicalDiabetic", 320, 400, top, left);
                    fn_CancelDiabeticDetails();
                } catch (e) {

                }
                return false;
            }
        } else {
            nSCV("cddTestType", nGrdGCV(grdDiabetic_EditModeRow, "TestType"), 8);
            nSCV('lupPF', nGrdGCV(grdDiabetic_EditModeRow, 'AdministeredPFID'), 77);
            nSCV('lupPF', nGrdGCV(grdDiabetic_EditModeRow, 'PFCode'), 6);
            nSCV('lupPF', nGrdGCV(grdDiabetic_EditModeRow, 'FullName'), 7);
            nSCV('txtGlucoseReading', nGrdGCV(grdDiabetic_EditModeRow, 'GlucoseReading'), 0);
            nSCV('dttmDateTime', nGrdGCV(grdDiabetic_EditModeRow, 'AdministeredDttm'), 18);
            nSCV('dttmDateTime', nGrdGCV(grdDiabetic_EditModeRow, 'AdministeredDttm'), 19);
            nSCV('txtActions', decodeXml(nGrdGCV(grdDiabetic_EditModeRow, 'DiabeticNotes'), 0));
            nSCV('chkInmateAdministered', nGrdGCV(grdDiabetic_EditModeRow, 'IsAdministered'), 3);
            TabSave("MedicalDiabetic", true);
            nChangeToEditMode_WithText("cmdAdd");
        }
    }
}

function fn_ManipulateDiabetic() {
    if (grdDiabetic_Validate()) {
        if (grdDiabetic_EditModeRow == "") {
            var row = nGrdAdd('grdDiabetic');
            if (row != null) {
                grdDiabetic_SetValues(row, 'A');
            }
        } else {
            if (nGrdGCV(grdDiabetic_EditModeRow, 'KPIID') == '') {
                grdDiabetic_SetValues(grdDiabetic_EditModeRow, 'A');
            } else {
                grdDiabetic_SetValues(grdDiabetic_EditModeRow, 'C');
            }
        }
    }
    return false;
}

function grdDiabetic_Validate() {
    if (nGCV('cddTestType', 8) == '') {
        KPIAlert(JMSMsd_PleaseEnter, "TestType");
        nSCF('cddTestType', 8);
        return false;
    }
    if (nGCV('lupPF', 6) == '') {
        KPIAlert(JMSMsd_PleaseEnter, "PF#/Name");
        nSCF('lupPF', 6);
        return false;
    }

    var AdministerdDate = nGCV("dttmDateTime", 18);
    if (AdministerdDate == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        nSCF('dttmDateTime', 18);
        return false;
    }

    var AdministerdDateTime = nGCV("dttmDateTime", 19);
    if (AdministerdDateTime == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        nSCF('dttmDateTime', 19);
        return false;
    }

    return true;
}

function grdDiabetic_SetValues(row, Mode) {
    try {
        var rowIndex = row._index;
        nGrdSCV(row, 'PFCode', nGCV('lupPF', 6));
        nGrdSCV(row, 'FullName', nGCV('lupPF', 7));
        nGrdSCV(row, 'AdministeredPFID', nGCV('lupPF', 77));
        nGrdSCV(row, 'TestType', nGCV('cddTestType', 8));
        nGrdSCV(row, 'TestTypeDesc', nGCV('cddTestType', 9));
        nGrdSCV(row, 'GlucoseReading', nGCV('txtGlucoseReading', 0));
        nGrdSCV(row, 'DiabeticNotes', HtmlEncode(nGCV('txtActions', 0)));
        nGrdSCV(row, 'IsAdministered', nGCV('chkInmateAdministered', 3) == true ? 1 : 0);

        var dDttm = new Date(nGCV('dttmDateTime', 18));
        var AdministerdDttm = formatDate(dDttm, "MM/dd/yyyy HH:mm");
        nGrdSCV(row, 'AdministeredDttm', AdministerdDttm);
        nGrdSCV(row, 'KPIMode', Mode);

        if (nGrdGCV(row, 'KPIID') == '') {
            GrdSCV(row, 'KPIID', -rowIndex);
        }
        TabSave("MedicalDiabetic", true);
        fn_CancelDiabeticDetails();

    } catch (e) {

    }
    return false;
}
function fn_CancelDiabeticDetails() {
    nSCV('lupPF', '', 6);
    nSCV('lupPF', '', 7);
    nSCV('lupPF', '', 77);
    nSCV('dttmDateTime', '', 18);
    nSCV('dttmDateTime', '', 19);
    nSCV('cddTestType', '', 8);
    nSCV('cddTestType', '', 9);
    nSCV('txtGlucoseReading', '', 0);
    nSCV('chkInmateAdministered', false, 3);
    nSCV('txtActions', '', 0);
    grdDiabetic_EditModeRow = '';
    nChangeToAddMode_WithText('cmdAdd');
    return false;
}

function fn_ValidateScreen() {
    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (Validate()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                ShowProgressPanel();
                TabSave("MedicalDiabetic", false);
                return true;
            } else
                return false;
        } else
            return false;
    }
    else if (glbCtrlClicked == "Reset") {
        TabSave("MedicalDiabetic", false);
    }
    return true;
}

function Validate() {
    var oRows = nGrdGAR("grdDiabetic");

    if (nGCV('dttmDateTime', 18) != '' || nGCV('lupPF', 6) != '' || nGCV('cddTestType', 8) != '' || nGCV('txtGlucoseReading', 0) != '' || nGCV('txtActions', 0) != '' || nGCV('chkInmateAdministered', 3) == true) {
        return KPIAlert(FrwkMsg_CTRL_UPDATE);
    }

    if (oRows.get_length() <= 0) {
        KPIAlert(KPIMsg_NO_DATA);
        return false;
    }

    return true;
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


function isNumberKey(evt, element) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && !(charCode == 46 || charCode == 8))
        return false;
    else {
        var len = $(element).val().length;
        var index = $(element).val().indexOf('.');
        if (index > 0 && charCode == 46) {
            return false;
        }
        if (index > 0 && charCode != 49) {
            var CharAfterdot = (len + 1) - index;
            if (CharAfterdot > 3) {
                return false;
            }
        }

    }
    return true;
}
