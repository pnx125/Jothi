function tabMedLogSrch_AfterSelectedTabChange(sender, eventArgs)
{
    var index = eventArgs.get_tabIndex();
    var oTab = sender.getTabAt(index);
    if (oTab == "" || oTab == undefined || oTab == null) {
        return;
    }
    switch (oTab.get_text()) {
	    case "Basic":
			SCF("BSC","dttAdminFrom",15);
			break;
	}
}

function srchTlb_Click(sender, eventArgs) {
    try {
        switch (eventArgs.getItem().get_key()) {
            case "AddNew":
                var strURL = glbSitePath + "/Inmate/frmMedication.aspx?hdnMode=ADD";
                var left = (window.screen.width / 2) - ((1020 / 2) + 10);
                var top = (window.screen.height / 2) - ((680 / 2) + 50);
                openPositionWin(strURL, "MedicationHistory", 1020, 680, top, left);
                eventArgs.set_cancel(true);
                break;

            case "Refresh":
                ClearAll();
                break;

            case "Search":
                if (Search_Click()) {
                    nSCV("hdnAutoLoad", "SEARCH");
                }
                else {
                    nSCV("hdnAutoLoad", "");
                    return false;
                }
                break;
        }
    } catch (e) {

    }
}

function Search_Click()
{
	return true;
}

function grdMedLog_DblClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        var sMedPresID = nGrdGCMVById(eventArgs, "MedPrescribeID");
        var sMedPresHisID = nGrdGCMVById(eventArgs, "MEDPRESHISTID");
        var MedPresSchID = nGrdGCMVById(eventArgs, "MedPresSchID");
        var INMATENAMEID = nGrdGCMVById(eventArgs, "INMATENAMEID");
        var Times = nGrdGCMVById(eventArgs, "Times");
        var left = (window.screen.width / 2) - ((856 / 2) + 10);
        var top = (window.screen.height / 2) - ((324 / 2) + 50);

        var strURL = glbSitePath + "/Inmate/frmMedicationHist.aspx?Times=" + Times + "&MedPresSchID=" + MedPresSchID + "&INMATENAMEID=" + INMATENAMEID + "&Mode=INQ&PresID=" + sMedPresID + "&PresHistID=" + sMedPresHisID;
        openPositionWin(strURL, "InmateMedicalHist", 856, 324, top, left);
        return false;
    }
}

function SetPodCellAsEmpty() {
    SCV("BSC", "lupPod", "", 6);
    SCV("BSC", "lupPod", "", 7);
    SCV("BSC", "lupPod", "", 77);
    SCV("BSC", "lupCell", "", 6);
    SCV("BSC", "lupCell", "", 7);
    SCV("BSC", "lupCell", "", 77);
}