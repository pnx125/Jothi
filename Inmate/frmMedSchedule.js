
function grdSchedule_Validate() {

    SelectedPeriodCount = nRadGetSelectedItemsCount("radMedicalFlags");
    SelectedItems = nRadGetSelectedItems("radMedicalFlags");
    SelectedPeriodForSchedule.Medication = nGCV("cddDrug", 8);
    SelectedPeriodForSchedule.StartDate = nGCV("dcFromDate", 15);
    SelectedPeriodForSchedule.FinishDate = nGCV("dcToDate", 15);
    SelectedPeriodForSchedule.Instructions = nGCV("txtInstructions", 0);
    
    SelectedPeriodForSchedule.JMMedPrescriptionID = nGCV("hdnMedPrescribeID");
    if (SelectedItems.length == 0) {
        KPIAlert(JMSMsd_PleaseEnter, "Distribution Period");
        
        return false;
    }

    var oRows = nGrdGAR("grdSchedule");
    for (i = 0; i < oRows.get_length(); i++) {
        var row = oRows.get_row(i);
        if (row != grdSchedule_EditModeRow) {
            for (j = 0; j < SelectedPeriodCount; j++) {

                if (SelectedItems[j].Value == nGrdGCV(row, "DistributionPeriod") && nGrdGCV(row, "IsActive") == "0") {
                    KPIAlert(FrwkMsg_DUPLICATION);
                    var combo = $find('radMedicalFlags');
                    combo.trackChanges();
                    for (var i = 0; i < combo.get_items().get_count(); i++) {

                        combo.get_items().getItem(i).set_checked(false);

                    }
                    combo.set_emptyMessage("--");
                    combo.commitChanges();
                    return false;
                }
            }
        }

    }


   


    if (SelectedPeriodForSchedule.StartDate == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Start Date");
        nSCF("dcFromDate", 15)
        return false;
    }

    if (SelectedPeriodForSchedule.FinishDate == '') {
        KPIAlert(JMSMsd_PleaseEnter, "End Date");
        nSCF("dcToDate", 15)
        return false;
    }


    if (trim(nGCV('cddActivityDays', 8)) == "" && nGCV("chkdays_0", 3) == false && nGCV("chkdays_1", 3) == false && nGCV("chkdays_2", 3) == false && nGCV("chkdays_3", 3) == false && nGCV("chkdays_4", 3) == false && nGCV("chkdays_5", 3) == false && nGCV("chkdays_6", 3) == false) {
        nSCF('cddActivityDays', 8);
        KPIAlert(JMSMsd_PleaseEnter, "Distribution Days");
        return false;
    }      

  
   

    return true;
}




function converTime(time) {
    let hour = (time.split(':'))[0]
    let min = (time.split(':'))[1]


    min = (min + '').length == 1 ? '0' + min : min;
    hour = (hour + '').length == 1 ? '0' + hour : hour;

    return (hour + ':' + min);
}
    


//#region below code we used only scheduling

var SelectedPeriodForSchedule = {
    StartTime: "",
    EndTime: "",
    MedicationDistributionPeriodCodeValue: "",
    MedicationDistributionPeriodDescription: "",
    Medication: "",
    HowOften: "",
    Dispense: "",

    JMMedPrescriptionID: "",
    JurisId: "",
    JMBookingID: "",
    MedPresSchID: "",
    StartDate: "",
    FinishDate: "",
    DistributionDays: "",
    DistributionValue: "",
    Instructions: ""

}



//Schedule grid manipulation
var grdSchedule_EditModeRow = "";

function fn_ScheduleGridManip_Row() {
    var SelectedPeriodCount = "";
    var SelectedItems = "";

    if (grdSchedule_Validate()) {

        if (grdSchedule_EditModeRow == "") {

            SelectedPeriodCount = nRadGetSelectedItemsCount("radMedicalFlags");
            if (SelectedPeriodCount > 0) {
                SelectedItems = nRadGetSelectedItems("radMedicalFlags");
            }
            for (var i = 0; i < SelectedPeriodCount; i++) {
                var row = nGrdAdd("grdSchedule");
                if (row != null) {
                    GetStartEndTime(SelectedItems[i].Value);
                    grdSchedule_SetValues(row, "A"); //Add mode

                }

            }

            fn_CancelEditScheduleRow();
        }
        else {

            SelectedPeriodCount = nRadGetSelectedItemsCount("radMedicalFlags");
            if (SelectedPeriodCount > 0) {
                SelectedItems = nRadGetSelectedItems("radMedicalFlags");
            }
            for (var i = 0; i < SelectedPeriodCount; i++) {
                SelectedPeriodForSchedule.MedicationDistributionPeriodCodeValue = SelectedItems[i].Value;
                SelectedPeriodForSchedule.MedicationDistributionPeriodDescription = SelectedItems[i].Description;
                GetStartEndTime(SelectedPeriodForSchedule.MedicationDistributionPeriodCodeValue);

                if (GrdGCV(grdSchedule_EditModeRow, "KPIID") == "") {
                    var row = nGrdAdd("grdSchedule");
                    if (row != null) {
                        grdSchedule_SetValues(row, "A"); //Add mode
                    }

                } else {
                    grdSchedule_SetValues(grdSchedule_EditModeRow, "C"); //Change mode
                }
                grdSchedule_EditModeRow = "";


            }
            fn_CancelEditScheduleRow();


        }
    }
    
    return false;
}

function GetStartEndTime(Period) {
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedSchedule.aspx/GetStartEndTime",
        data: "{'Period':'" + Period + "','JurisID':'" + glbPageJuris + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);

            SelectedPeriodForSchedule.StartTime = obj["Miscellaneous"];
            SelectedPeriodForSchedule.EndTime = obj["Miscellaneous2"];
            SelectedPeriodForSchedule.MedicationDistributionPeriodDescription = obj["Description"];
            SelectedPeriodForSchedule.MedicationDistributionPeriodCodeValue = obj["CodeValue"];
        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            return false;
        }
    });
}

function fn_CancelEditScheduleRow() {
    var combo = $find('radMedicalFlags');
    combo.trackChanges();
    for (var i = 0; i < combo.get_items().get_count(); i++) {

        combo.get_items().getItem(i).set_checked(false);

    }
    combo.set_emptyMessage("--");
    combo.commitChanges();
    
    
    nSCV("cddActivityDays", "", 8);
    $('#chkdays').find('input:radio, input:checkbox').prop('checked', false);

    nSCV("dcFromDate", "", 15);
    nSCV("dcToDate", "", 15);
    
    isSelected = "";

    grdSchedule_EditModeRow = "";
    nChangeToAddMode_WithText("cmdAdd");
    nEnable("cmdAdd", 5);
    nGCO("cmdAdd", 5).className = "menuItem";
    nSCV("hdnMedPresSchID", "");
    nSCV("txtInstructions", "", 0);
    SelectedPeriodForSchedule.DistributionDays = "";
    return false;
}



function grdSchedule_SetValues(row, Mode) {
    var rowIndex = row._index;
    SelectedPeriodForSchedule.Medication = nGCV("cddDrug", 8);
    
    
    SelectedPeriodForSchedule.JMMedPrescriptionID = nGCV("hdnMedPrescribeID");
    SelectedPeriodForSchedule.JurisId = nGCV("hdnJurisId");
    SelectedPeriodForSchedule.JMBookingID = nGCV("hdnbookingid");
    SelectedPeriodForSchedule.MedPresSchID = nGCV("hdnMedPresSchID");





    nGrdSCV(row, "FromTime", converTime(SelectedPeriodForSchedule.StartTime.split(" ")[1]));
    nGrdSCV(row, "EndTime", converTime(SelectedPeriodForSchedule.EndTime.split(" ")[1]));
    nGrdSCV(row, "Period", SelectedPeriodForSchedule.MedicationDistributionPeriodDescription);
    nGrdSCV(row, "JMMedPrescriptionID", SelectedPeriodForSchedule.JMMedPrescriptionID);
    nGrdSCV(row, "JMBookingID", SelectedPeriodForSchedule.JMBookingID);
    nGrdSCV(row, "JurisID", SelectedPeriodForSchedule.JurisId);
    
    
    nGrdSCV(row, "DistributionPeriod", SelectedPeriodForSchedule.MedicationDistributionPeriodCodeValue);
    nGrdSCV(row, "PeriodStartTime", SelectedPeriodForSchedule.StartDate);
    nGrdSCV(row, "PeriodEndTime", SelectedPeriodForSchedule.FinishDate);
    nGrdSCV(row, "IsActive", 0);

    nGrdSCV(row, "Startdttm", SelectedPeriodForSchedule.StartTime);
    nGrdSCV(row, "Enddttm", SelectedPeriodForSchedule.EndTime);

    if (nGrdGCV(row, 'KPIID') == '') {
        nGrdSCV(row, 'KPIID', -rowIndex);
    }



    nGrdSCV(row, "StartDate", SelectedPeriodForSchedule.StartDate);
    nGrdSCV(row, "FinishDate", SelectedPeriodForSchedule.FinishDate);
    nGrdSCV(row, "RepeatEvery", SelectedPeriodForSchedule.DistributionDays);
    nGrdSCV(row, "Instructions", SelectedPeriodForSchedule.Instructions);
    nGrdSCV(row, "KPIMode", Mode);
    //fn_CancelEditScheduleRow();
    return false;
}

function grdSchedule_CellClickHandler(sender, eventArgs) {
 if (eventArgs.get_type() == 'cell') {
        grdSchedule_EditModeRow = nGrdGSR("grdSchedule");
        if (GrdColKey(sender) == glbKPIGrdDelKey && nGrdGCV(grdSchedule_EditModeRow, "IsActive")!="1") {
            nGrdHandleDel("grdSchedule");
            fn_CancelEditScheduleRow();
        }
        else {
            nSCV('hdnMedPrescribeID', nGrdGCV(grdSchedule_EditModeRow, "JMMedPrescriptionID"), 0);
            nSCV('hdnMedPresSchID', nGrdGCV(grdSchedule_EditModeRow, "KPIID"), 0);
            nSCV("txtInstructions", nGrdGCV(grdSchedule_EditModeRow, "Instructions"), 0);

            

            nSCV("dcFromDate", nGrdGCV(grdSchedule_EditModeRow, "StartDate"), 15);
            nSCV("dcToDate", nGrdGCV(grdSchedule_EditModeRow, "FinishDate"), 15);

            var SelectedValue = "";
            var iSelectedIndex = 0;
            var RadItem = nGrdGCV(grdSchedule_EditModeRow, "DistributionPeriod");
            var combo = $find('radMedicalFlags');
            if (combo != null) {
                var checkedItems = combo._checkedIndices;
                //Clear the existing selected checkboxes for previous transactions
                while (combo._checkedIndices.length > 0 && iSelectedIndex < combo.get_items().get_count()) {
                    combo.get_items().getItem(checkedItems[iSelectedIndex]).set_checked(false);
                }
                if (RadItem != '') {
                    //Selecting the Checkboxes based on the grid column input
                    SelectedItems = RadItem;

                    var itm = combo.findItemByValue(SelectedItems);
                    if (itm != null) {
                        itm.set_checked(true);
                    }

                }
            }

            SelectedPeriodForSchedule.DistributionDays = nGrdGCV(grdSchedule_EditModeRow, "RepeatEvery");
            chkdays(SelectedPeriodForSchedule.DistributionDays);
            chkDistributionDays();
            nChangeToEditMode_WithText("cmdAdd");
            if (nGrdGCV(grdSchedule_EditModeRow, "IsActive")=="1"){
                nDisable("cmdAdd", 5);
                nGCO("cmdAdd", 5).className = "DisabledImgMnuItem";
            } else {
                nEnable("cmdAdd", 5);
                nGCO("cmdAdd", 5).className = "menuItem";
            }
        }
    }
}

//#endregion


function AssignScreenSch() {
    var StartDate = trim(nGCV("dcFromDate", 15));

    var EndDate = trim(nGCV("dcToDate", 15));
    if (StartDate != "" && EndDate != "") {
        validateDateTime();
    }
}


function fn_ManipChkBoxes() {
    var DurationDays = nGCV('cddActivityDays', 8);

    switch (DurationDays) {
        case "0":
            nSCV('chkdays_0', '0', 3);
            nSCV('chkdays_1', '1', 3);
            nSCV('chkdays_2', '1', 3);
            nSCV('chkdays_3', '1', 3);
            nSCV('chkdays_4', '1', 3);
            nSCV('chkdays_5', '1', 3);
            nSCV('chkdays_6', '0', 3);
            break;
        case "1":
            nSCV('chkdays_0', '0', 3);
            nSCV('chkdays_1', '1', 3);
            nSCV('chkdays_2', '1', 3);
            nSCV('chkdays_3', '1', 3);
            nSCV('chkdays_4', '1', 3);
            nSCV('chkdays_5', '1', 3);
            nSCV('chkdays_6', '1', 3);
            break;
        case "2":
            nSCV('chkdays_0', '0', 3);
            nSCV('chkdays_1', '1', 3);
            nSCV('chkdays_2', '1', 3);
            nSCV('chkdays_3', '1', 3);
            nSCV('chkdays_4', '1', 3);
            nSCV('chkdays_5', '0', 3);
            nSCV('chkdays_6', '0', 3);
            break;
        case "3":
            nSCV('chkdays_0', '0', 3);
            nSCV('chkdays_1', '1', 3);
            nSCV('chkdays_2', '0', 3);
            nSCV('chkdays_3', '1', 3);
            nSCV('chkdays_4', '0', 3);
            nSCV('chkdays_5', '1', 3);
            nSCV('chkdays_6', '0', 3);
            break;

        case "4":
            nSCV('chkdays_0', '0', 3);
            nSCV('chkdays_1', '0', 3);
            nSCV('chkdays_2', '1', 3);
            nSCV('chkdays_3', '0', 3);
            nSCV('chkdays_4', '1', 3);
            nSCV('chkdays_5', '0', 3);
            nSCV('chkdays_6', '0', 3);
            break;

        case "5":
            nSCV('chkdays_0', '1', 3);
            nSCV('chkdays_1', '0', 3);
            nSCV('chkdays_2', '0', 3);
            nSCV('chkdays_3', '0', 3);
            nSCV('chkdays_4', '0', 3);
            nSCV('chkdays_5', '0', 3);
            nSCV('chkdays_6', '1', 3);
            break;

        case "6":
            nSCV('chkdays_0', '1', 3);
            nSCV('chkdays_1', '1', 3);
            nSCV('chkdays_2', '1', 3);
            nSCV('chkdays_3', '1', 3);
            nSCV('chkdays_4', '1', 3);
            nSCV('chkdays_5', '1', 3);
            nSCV('chkdays_6', '1', 3);
            break;
        default:
            nSCV('chkdays_0', '0', 3);
            nSCV('chkdays_1', '0', 3);
            nSCV('chkdays_2', '0', 3);
            nSCV('chkdays_3', '0', 3);
            nSCV('chkdays_4', '0', 3);
            nSCV('chkdays_5', '0', 3);
            nSCV('chkdays_6', '0', 3);            
            break;
    }

    $('#chkdays').change();
    
}


function validateDateTime() {
    var dt = formatDate(KPIGetCurDttm(), "MM/dd/yyyy");
    var StartDate = trim(nGCV("dcFromDate", 15));

    var EndDate = trim(nGCV("dcToDate", 15));

    if (StartDate != "" && nGCV("hdnMedPresSchID") <= 0) {
        if (new Date(StartDate) < new Date(dt)) {
            KPIAlert(JHbrMsg_HuberDteNotGrt);
            nSCV('dcFromDate', '', 15);
            nSCF('dcFromDate', 15);
            return false;
        }
    }
    else if (EndDate != "") {
        if (new Date(EndDate) < new Date(dt)) {
            KPIAlert(JHbrMsg_HuberDteNotGrt);
            nSCV('dcToDate', '', 15);
            nSCF('dcToDate', 15);
            return false;
        }
    }


    if (EndDate != "") {
        if (new Date(StartDate) > new Date(EndDate)) {
            KPIAlert(JHbrMsg_HuberEndNotGrtStart);
            nSCV('dcToDate', '', 15);
            nSCF('dcToDate', 15);
            return false;
        }

    }
}


var isSelected = [];


function chkdays(isSelected) {
    SelectedPeriodForSchedule.DistributionDays = isSelected;
    switch (SelectedPeriodForSchedule.DistributionDays) {
        case "0111110":
            nSCV("cddActivityDays", 0, 8);
            break;
        case "0111111":
            nSCV("cddActivityDays", 1, 8);
            break;
        case "0111100":
            nSCV("cddActivityDays", 2, 8);
            break;
        case "0101010":
            nSCV("cddActivityDays", 3, 8);
            break;
        case "0010100":
            nSCV("cddActivityDays", 4, 8);
            break;
        case "1000001":
            nSCV("cddActivityDays", 5, 8);
            break;
        case "1111111":
            nSCV("cddActivityDays", 6, 8);
            break;
        default:
            nSCV("cddActivityDays", '', 8);
            break;
    }
}



var Weekdays = [];
$('#chkdays').change(function () {
   
    isSelected = [];
    $("#chkdays :checkbox").each(function () {
        if ($(this).is(":checked")) {
            isSelected.push("1");
        } else {
            isSelected.push("0");
        }
    });
    SelectedPeriodForSchedule.DistributionDays = isSelected.join('', ',');
    chkdays(SelectedPeriodForSchedule.DistributionDays);
});




function chkDistributionDays() {
    var array = SelectedPeriodForSchedule.DistributionDays.split('');
    for (var i = 0; i < array.length; i++) {
        var Ctrl = "chkdays_" + i;
        if (array[i] == "1") {
            nSCV(Ctrl,'1', 3);
        }
        else {
            nSCV(Ctrl, '0', 3);
        }
    }
}



function fn_ValidateScreen() {
    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (ValidateScr()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                nSCV("hdnLoad", "Save", 0);
                ShowProgressPanel();
                return true;
            }
            else {
                return false;
            }
        }
        else
            return false;
    }
    else
        return true;
}

function ValidateScr() {
    var oRows = nGrdGAR("grdSchedule");

    if (oRows.get_length() <= 0) {
        KPIAlert(KPIMsg_NO_DATA);
        return false;
    }
    
    var objStartDttm = nGCV("dcFromDate", 15);
    var objEndDttm = nGCV("dcToDate", 15);
    var objDays = nGCV("cddActivityDays", 8);
    var objChkDays = SelectedPeriodForSchedule.DistributionDays;
    var objDistributionPeriod = $find('radMedicalFlags')._checkedIndices.length == 0 ? "" : $find('radMedicalFlags')._checkedIndices.length;


    if (objStartDttm != "" || objEndDttm != "" || objDays != "" || (objChkDays != "" && objChkDays != "0000000") || objDistributionPeriod != "") {
        KPIAlert(FrwkMsg_CTRL_UPDATE);
        return false;
    }
    
    return true;
}


