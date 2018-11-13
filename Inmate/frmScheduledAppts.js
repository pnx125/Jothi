function reloadScheventsCurScreen() {
    nSCV('hdnAutoLoad', 'LOAD', 0);
    document.frmScheduledAppts_Id.submit();
}
function grdScheEvent_DblClickHandler(sender, eventargs) {
    if (eventargs.get_type() == "cell") {
        var iRow = nGrdGSR(sender._id);
 
        var KPIEvtSchID = GrdGCV(iRow, "KPIID");
        var EventID = GrdGCV(iRow, "EventID");
        var GrpMvtID = GrdGCV(iRow, "GrpMvmtID")
        var GrpEventNo = GrdGCV(iRow, "GrpEventNo");
        if (GrdColKey(sender) == "Cmnts" && GrdGCV(iRow, "ShowCmts") == "1") {
            var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&KPIEvtSchID=" + KPIEvtSchID + "&EventID=" + EventID + "&GrpMvmtID=" + GrpMvtID + "&GrpEventNo=" + GrpEventNo;
            var left = (window.screen.width / 2) - ((320 / 2) + 10);
            var top = (window.screen.height / 2) - ((400 / 2) + 50);
            openPositionWin(strURL, "HuberCallIn", 320, 400, top, left);
            return false;
        }
    }

}

