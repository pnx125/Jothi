var grdAllergy_EditModeRow = "";


function grdAllergy_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() === 'cell') {
        grdAllergy_EditModeRow = nGrdGSR("grdAllergy");
        var JMMAllergyID = nGrdGCV(grdAllergy_EditModeRow, 'JMMAllergyID');
        var JMBookingID = nGrdGCV(grdAllergy_EditModeRow, 'JMBookingID');
        var JurisID = nGrdGCV(grdAllergy_EditModeRow, 'JurisID');
        var NotesIcon = nGrdGCV(grdAllergy_EditModeRow, 'Notes');
        var ReactionsIcon = nGrdGCV(grdAllergy_EditModeRow, 'ReactionNotes');
        var JBMChargeExtnID = "";
        var RecType = "";
        var strURL = "";
        var left = (window.screen.width / 2) - ((320 / 2) + 10);
        var top = (window.screen.height / 2) - ((400 / 2) + 50);

        if (nGrdColKey(sender) === glbKPIGrdDelKey) {
            nGrdHandleDel("grdAllergy")
            TabSave("MedicalAllergy", true);
            fn_CancelAllergyDetails();
        }
        else if (nGrdColKey(sender) === "ReactionsIcon") {
            if (ReactionsIcon !== '') {
                try {
                    RecType = PnxTxtDtl_RecType.Medical.JMMAllergy_Reactions732;
                    strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &AssocID=" + JMMAllergyID + "&JurisID=" + JurisID + "&hdnScreenId=8550&JMBookingID=" + JMBookingID + "&RecType=" + RecType;
                    openPositionWin(strURL, "MedicalAllergy", 320, 400, top, left);
                    fn_CancelDiabeticDetails();
                } catch (e) {

                }
                return false;
            }


        }
        else if (nGrdColKey(sender) === "NotesIcon") {
            if (NotesIcon !== '') {
                try {
                    RecType = PnxTxtDtl_RecType.Medical.JMMAllergy_Notes733;
                    strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &AssocID=" + JMMAllergyID + "&JurisID=" + JurisID + "&hdnScreenId=8550&JMBookingID=" + JMBookingID + "&RecType=" + RecType;
                    openPositionWin(strURL, "MedicalAllergy", 320, 400, top, left);
                    fn_CancelDiabeticDetails();
                } catch (e) {

                }
                return false;
            }



        }

        else {
            nSCV("cddAllergy", nGrdGCV(grdAllergy_EditModeRow, "Allergy"), 8);
            nSCV('dttmAllergyDate', nGrdGCV(grdAllergy_EditModeRow, 'AllergyDttm'), 18);
            nSCV('dttmAllergyDate', nGrdGCV(grdAllergy_EditModeRow, 'AllergyDttm'), 19);
            nSCV('lupInactivePF', nGrdGCV(grdAllergy_EditModeRow, 'InactivePFID'), 77);
            nSCV('lupInactivePF', nGrdGCV(grdAllergy_EditModeRow, 'PFCode'), 6);
            nSCV('lupInactivePF', nGrdGCV(grdAllergy_EditModeRow, 'FullName'), 7);


            nSCV('txtReactions', decodeXml(nGrdGCV(grdAllergy_EditModeRow, 'AllergyReactionNotes'), 0));
            nSCV('txtNotes', decodeXml(nGrdGCV(grdAllergy_EditModeRow, 'AllergyNotes'), 0));

            nSCV('chkInactive', nGrdGCV(grdAllergy_EditModeRow, 'Isactive'), 3);
            fn_Inactive();
            if (nGrdGCV(grdAllergy_EditModeRow, 'Isactive') == true) {
                nSCV('dttmInactiveDate', nGrdGCV(grdAllergy_EditModeRow, 'InactiveDttm'), 18);
                nSCV('dttmInactiveDate', nGrdGCV(grdAllergy_EditModeRow, 'InactiveDttm'), 19);
            }
            TabSave("MedicalAllergy", true);
            nChangeToEditMode_WithText("cmdAdd");

        }
    }
}

function fn_ManipulateAllergy() {
    if (grdAllergy_Validate()) {
        if (grdAllergy_EditModeRow == "") {
            var row = nGrdAdd('grdAllergy');
            if (row != null) {
                grdAllergy_SetValues(row, 'A');
            }
        } else {
            if (nGrdGCV(grdAllergy_EditModeRow, 'KPIID') == '') {
                grdAllergy_SetValues(grdAllergy_EditModeRow, 'A');
            } else {
                grdAllergy_SetValues(grdAllergy_EditModeRow, 'C');
            }
        }
    }
    return false;
}

function grdAllergy_Validate() {
    if (nGCV('cddAllergy', 8) == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Allergy");
        nSCF('cddAllergy', 8);
        return false;
    }
    var AllergyDate = nGCV("dttmAllergyDate", 18);

    if (AllergyDate == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        nSCF('dttmAllergyDate', 18);
        return false;
    }
    var AllergyDateTime = nGCV("dttmAllergyDate", 19);
    if (AllergyDateTime == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        nSCF('dttmAllergyDate', 19);
        return false;
    }

    if (nGCV('chkInactive', 3)) {
        if (nGCV('lupInactivePF', 6) == '') {
            KPIAlert(JMSMsd_PleaseEnter, "PF");
            nSCF('lupInactivePF', 6);
            return false;
        }
        if (nGCV('txtNotes', 0).trim() == '') {
            KPIAlert(JMSMsd_PleaseEnter, "Notes");
            nSCF('txtNotes', 0);
            return false;
        }
    }

    return true;


}

function grdAllergy_SetValues(row, Mode) {
    try {
        var rowIndex = row._index;

        nGrdSCV(row, 'Allergy', nGCV('cddAllergy', 8));
        nGrdSCV(row, 'AllergyDesc', nGCV('cddAllergy', 9));
        var dDttm = new Date(nGCV('dttmAllergyDate', 18));
        var AllergyDttm = formatDate(dDttm, "MM/dd/yyyy HH:mm");
        nGrdSCV(row, 'AllergyDttm', AllergyDttm);


        nGrdSCV(row, 'AllergyReactionNotes', HtmlEncode(nGCV('txtReactions', 0)));
        nGrdSCV(row, 'AllergyNotes', HtmlEncode(nGCV('txtNotes', 0)));
        nGrdSCV(row, 'Isactive', nGCV('chkInactive', 3) == true ? 1 : 0);
        var InactiveDate = new Date(nGCV('dttmInactiveDate', 18));
        var InactiveDttm = formatDate(InactiveDate, "MM/dd/yyyy HH:mm");
        nGrdSCV(row, 'InactiveDttm', InactiveDttm);
        nGrdSCV(row, 'PFCode', nGCV('lupInactivePF', 6));
        nGrdSCV(row, 'FullName', nGCV('lupInactivePF', 7));
        nGrdSCV(row, 'InactivePFID', nGCV('lupInactivePF', 77));

        nGrdSCV(row, 'KPIMode', Mode);

        if (nGrdGCV(row, 'KPIID') == '') {
            GrdSCV(row, 'KPIID', -rowIndex);
        }
        TabSave("MedicalAllergy", true);
        fn_CancelAllergyDetails();
    } catch (e) {

    }
    return false;
}



function fn_CancelAllergyDetails() {
    nSCV('dttmAllergyDate', '', 18);
    nSCV('dttmAllergyDate', '', 19);
    nSCV('cddAllergy', '', 8);
    nSCV('cddAllergy', '', 9);
    nSCV('txtReactions', '', 0);
    nSCV('txtNotes', '', 0);
    nSCV('chkInactive', false, 3);
    nSCV('dttmInactiveDate', '', 18);
    nSCV('dttmInactiveDate', '', 19);
    nDisable('dttmInactiveDate', 18);
    nDisable('dttmInactiveDate', 19);
    $('#tdInactivePF').removeClass("req");
    $('#tdNotes').removeClass("req");
    nSCV('lupInactivePF', '', 6);
    nSCV('lupInactivePF', '', 7);
    nSCV('lupInactivePF', '', 77);
    //CRM#65266 All inmate Booking Status should allow to create Medical Entry
    nDisable('lupInactivePF', 6);
    nDisable('lupInactivePF', 7);
    
    grdAllergy_EditModeRow = '';
    nChangeToAddMode_WithText('cmdAdd');
    return false;
}

function fn_Inactive() {
    if (nGCV('chkInactive', 3)) {
        nEnable('dttmInactiveDate', 18);
        nEnable('dttmInactiveDate', 19);
        nEnable('lupInactivePF', 6);
        nEnable('lupInactivePF', 7);
        nEnable('lupInactivePF', 77);
        $('#tdInactivePF').addClass("req");
        $('#tdNotes').addClass("req");
    }
    else {
        nSCV('dttmInactiveDate', '', 18);
        nSCV('dttmInactiveDate', '', 19);
        nDisable('dttmInactiveDate', 18);
        nDisable('dttmInactiveDate', 19);
        nSCV('lupInactivePF', '', 6);
        nSCV('lupInactivePF', '', 7);
        nSCV('lupInactivePF', '', 77);
        nDisable('lupInactivePF', 6);
        nDisable('lupInactivePF', 7);
        nDisable('lupInactivePF', 77);
        $('#tdInactivePF').removeClass("req");
        $('#tdNotes').removeClass("req");
    }
    return true;


}

function FillLoggedInPF() {
    if (nGCV("hdnSetUserPFID") == "1") {
        if (nGCV("hdnLoginPFCode") != "" && nGCV("hdnLoginPFDesc") != "" && nGCV("hdnLoginPFID") != "") {
            if (nGCV("lupInactivePF", 6) == "") {
                nSCV("lupInactivePF", nGCV("hdnLoginPFCode"), 6);
                nSCV("lupInactivePF", nGCV("hdnLoginPFDesc"), 7);
                nSCV("lupInactivePF", nGCV("hdnLoginPFID"), 77);
            }
        }
    }
}
function fn_ValidateScreen() {
    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (Validate()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                ShowProgressPanel();
                TabSave("MedicalAllergy", false);
                return true;
            } else
                return false;
        } else
            return false;
    }
    else if (glbCtrlClicked == "Reset") {
        TabSave("MedicalAllergy", false);
    }
    return true;
}

function Validate() {
    var oRows = nGrdGAR("grdAllergy");

    if (nGCV('dttmAllergyDate', 18) != '' || nGCV('dttmAllergyDate', 19) != '' || nGCV('cddAllergy', 8) != '' || nGCV('txtReactions', 0) != '' || nGCV('txtNotes', 0) != '' || nGCV('chkInactive', 3) == true || nGCV('lupInactivePF', 6) != '') {
        return KPIAlert(FrwkMsg_CTRL_UPDATE);
    }

    if (oRows.get_length() <= 0) {
        KPIAlert(KPIMsg_NO_DATA);
        return false;
    }

    return true;
}

