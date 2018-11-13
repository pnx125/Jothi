var left = (window.screen.width / 2) - ((700 / 2) + 10);
var top = (window.screen.height / 2) - ((350 / 2) + 50);

function tlbGridItem_Click(sender, eventArgs) {
    switch (eventArgs.getItem().get_key()) {
        case "AddNew":
            var strURL = glbSitePath + "/Inmate/frmDoctorEntry.aspx?hdnMode=ADD";
            openPositionWin(strURL, "DoctorEntry", 700, 350, top, left);
            eventArgs.set_cancel(true);
            break;
        case "Print":
            if (!ValidateScrn()) {
                eventArgs.set_cancel(true);
                return false;
            }         
            break;
        case "Excel":
            if (!ValidateScrn()) {
                eventArgs.set_cancel(true);
                return false;
            }
            break;
    }
}
function grdDoctorSrch_DblClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        var strDoctorID = nGrdGCMVById(eventArgs, "DoctorID");
        var JurisID = nGrdGCMVById(eventArgs, "KPIJurisID");
        var strURL = glbSitePath + "/Inmate/frmDoctorEntry.aspx?JurisID=" + JurisID + "&hdnMode=CHG&DoctorID=" + strDoctorID;
        openPositionWin(strURL, "DoctorID", 700, 350, top, left);

    }
}

function setFocusOnDoctorName() {
    nSCF("txtName");
}

function AutoReload() {
    nSCV("hdnAutoLoad", "LOAD");
    document.frmDoctorSrch_Id.submit();
}

function ValidateScrn() {
    if (nGCO("lstJuris", 1) != null && nGCO("lstJuris", 1) != undefined) {
        if (nGCV('lstJuris', 1) == "--" || nGCV('lstJuris', 1) == "" || nGCV('lstJuris', 1) == "0") {
            KPIAlert(JMSMsd_PleaseEnter, "Juris");
            nSCF('lstJuris', 1);
            nSCV("hdnAutoLoad", "");
            return false;
        }
    }
    return true;
}