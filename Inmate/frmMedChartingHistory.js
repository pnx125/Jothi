function fn_ValidateScreen() {
    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (KPIConfirm(KPIMsg_SAVE)) {
            ShowProgressPanel();
            return true;
        } else
            return false;
    }
   
    return true;

}

