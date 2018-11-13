//#region Order Entry, Fill & Refill both mandatory,Order is not a mandatory
function fn_StorageLocMandatory() {
    try {
        var Code = nGCV("cddOrderAction", 8);
        switch (Code) {

            case "F":
            case "R":
                $('#tdLocationMandatory').addClass("req");
                $('#tdQuantity').addClass("req");
                $('#trEmptyRow').css("display", "none");
                $('#trWitness').css("display", "none");
                $('#trDestroy').css("display", "none");
                $('#tdDttm').removeClass("req");
                $('#tdPf').removeClass("req");
                $('#tdlableNotes').removeClass("req");
                break;
            case "RC":
                $('#tdlableNotes').addClass("req");
                $('#tdLocationMandatory').addClass("req");
                $('#trEmptyRow').css("display", "none");
                $('#trWitness').css("display", "none");
                $('#trDestroy').css("display", "none");
                $('#tdDttm').removeClass("req");
                $('#tdPf').removeClass("req");
                $('#tdQuantity').addClass("req");
                break;
            case "D":
                $('#trEmptyRow').css("display", "");
                $('#trWitness').css("display", "");
                $('#trDestroy').css("display", "");
                $('#tdLocationMandatory').removeClass("req");
                $('#tdQuantity').addClass("req");
                $('#tdlableNotes').addClass("req");

                $('#tdDttm').addClass("req");
                $('#tdPf').addClass("req");
                $('#tdWitness').addClass("req");
                $('#tdWitnessPF').addClass("req");



                break;
            case "RI":
                $('#trEmptyRow').css("display", "");
                $('#trWitness').css("display", "");
                $('#trDestroy').css("display", "");
                $('#tdLocationMandatory').removeClass("req");
                $('#tdQuantity').addClass("req");
                $('#tdlableNotes').addClass("req");

                $('#tdDttm').addClass("req");
                $('#tdPf').addClass("req");
                $('#tdWitness').removeClass("req");
                $('#tdWitnessPF').addClass("req");
                break;

            

                break;
            default:
                $('#tdLocationMandatory').removeClass("req");
                $('#tdQuantity').removeClass("req");
                $('#tdlableNotes').removeClass("req");
                //$('#tdTextNotes').removeClass("req");
                $('#trEmptyRow').css("display", "none");
                $('#trWitness').css("display", "none");
                $('#trDestroy').css("display", "none");
                $('#tdDttm').removeClass("req");
                $('#tdPf').removeClass("req");
                break;
        }
    } catch (e) {

    }
}
//#endregion 



function FillLoggedInPF() {
    try {
        if (nGCV("hdnSetUserPFID") == "1") {
            if (nGCV("hdnLoginPFCode") != "" && nGCV("hdnLoginPFDesc") != "" && nGCV("hdnLoginPFID") != "") {
                if (nGCV("lupOrderedPF", 6) == "") {
                    nSCV("lupOrderedPF", nGCV("hdnLoginPFCode"), 6);
                    nSCV("lupOrderedPF", nGCV("hdnLoginPFDesc"), 7);
                    nSCV("lupOrderedPF", nGCV("hdnLoginPFID"), 77);
                }
            }
        }
    } catch (e) {

    }
}

function fn_ValidateScreen() {
    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (ValidateScr()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                //nSCV("hdnLoad", "Save", 0);
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
    var OrderAction = nGCV("cddOrderAction", 8);
    var QuantityAmt = nGCV("txtQuantity", 0);
    var QuantityType = nGCV("cddQuantityType", 8);
    var StorageLocation = nGCV("cddStorageLocation", 8);
    var Notes = nGCV("txtDescription", 0);
    var OrderDttm = nGCV("dttmOrderedDate", 18);
    var OrderedPF = nGCV("lupOrderedPF", 6);
    var HowDestroy = nGCV("cddDestroyed", 8);
    var WitnessPF = nGCV("lupWitness", 6);
    if (OrderAction == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Order ACTION");
        return false;
    }


    if (OrderAction == "F" || OrderAction == "R" || OrderAction == "RC") {
        if (StorageLocation == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Storage Location");
            nSCF("cddStorageLocation", 8);
            return false;
        } else if (QuantityAmt == "0" || QuantityAmt == "" || QuantityType == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Quantity");
            if (QuantityAmt == "0" || QuantityAmt == "") {
                nSCF("txtQuantity", 0);
            } else {
                nSCF("cddQuantityType", 8);
            }
            return false;
        }
        if (OrderAction == "RC" && Notes == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Notes");
            nSCF("txtDescription", 0);
            return false;
        } 

    }
    else if (OrderAction == "RC" && Notes == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Notes");
        nSCF("txtDescription", 0);
        return false;
    } else if (OrderAction == "D") {
        if (OrderDttm == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Date Time");
            nSCF("dttmOrderedDate", 18);
            return false;
        }
        else if (OrderedPF == "") {
            KPIAlert(JMSMsd_PleaseEnter, "PF#");
            nSCF("lupOrderedPF", 6);
            return false;
        }

        else if (QuantityAmt == "0" || QuantityAmt == "" || QuantityType == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Quantity");

            if (QuantityAmt == "0" || QuantityAmt == "") {
                nSCF("txtQuantity", 0);
            } else {
                nSCF("cddQuantityType", 8);
            }

            return false;
        }

        else if (HowDestroy == "") {
            KPIAlert(JMSMsd_PleaseEnter, "How Destroy");
            nSCF("cddDestroyed", 8);
            return false;
        }
        else if (WitnessPF == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Witnessed by PF");
            nSCF("lupWitness", 6);
            return false;
        }
        else if (Notes == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Notes");
            nSCF("txtDescription", 0);
            return false;
        }
    } else if (OrderAction == "RI") {
        if (OrderDttm == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Date Time");
            nSCF("dttmOrderedDate", 18);
            return false;
        }
        else if (OrderedPF == "") {
            KPIAlert(JMSMsd_PleaseEnter, "PF#");
            nSCF("lupOrderedPF", 6);
            return false;
        }
        else if (QuantityAmt == "0" || QuantityAmt == "" || QuantityType == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Quantity");

            if (QuantityAmt == "0" || QuantityAmt == "") {
                nSCF("txtQuantity", 0);
            } else {
                nSCF("cddQuantityType", 8);
            }

            return false;
        }

        else if (WitnessPF == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Witnessed by PF");
            nSCF("lupWitness", 6);
            return false;
        }
        else if (Notes == "") {
            KPIAlert(JMSMsd_PleaseEnter, "Notes");
            nSCF("txtDescription", 0);
            return false;
        }


    }
    if (nGCV("hdnMode") != "CHG" && (OrderAction == "RI" || OrderAction == "D") && (QuantityAmt != '' && QuantityAmt > 0)) {
        JMMedPrescriptionID = nGCV('hdnJMMedPrescriptionID');
        var TotalBalance = fn_BalanceQty(JMMedPrescriptionID, QuantityType);
        if (TotalBalance > 0 && QuantityAmt > TotalBalance) {
            KPIAlert(JMMMsg_BalanceExceed);
            nSCF("txtQuantity", 0);
            return false;
        } else if (TotalBalance == 0 || QuantityAmt == 0) {
            KPIAlert(JMMMsg_BalanceQty);
            nSCF("txtQuantity", 0);
            return false;
        }

    }
    return true;
}


function pageLoad() {
    fn_StorageLocMandatory();
}

function fn_BalanceQty(JMMedPrescriptionID, QuantityType) {
    var TotalBalance = 0;
    UseEndedDttm = null;
    $.ajax({
        type: "POST",
        async: false,
        url: "frmOrderEntry.aspx/GetCurrentDispenseCount",
        data: "{'JMMedPrescriptionID':'" + JMMedPrescriptionID + "','MedicationType':'" + QuantityType + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);

            if (obj != null) {
                TotalBalance = obj["CurQuantity"];
            }

        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            return false;
        }
    });
    return TotalBalance; 

}