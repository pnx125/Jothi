///for Validating MedicationAdministered
var ActionCommentsValue = false;

var Dosage = "";
var Drug = "";
function fn_ValidateScreen() {
    var ctrlClicked = glbCtrlClicked;
    glbCtrlClicked = "";

    if (ctrlClicked == "Save") {
        if (fn_MedAdminValidate()) {
            if (fn_Distribution()) {
                if (KPIConfirm(KPIMsg_SAVE)) {
                    ShowProgressPanel();
                    return true;
                }
                else {
                    return false;
                }
            } else {
                return false;
            }
        }
        else
            return false;
    }
    else if (ctrlClicked == "Print") {
        nSCV("hdnPrint", "1");
        return true;
    }
    else {
        return true;
    }
}

function fn_MedAdminValidate() {
    var strDateTime = nGCV("dttmDateTime", 18)
    var strMethod = nGCV("cddMethodAdmin", 8)
    var strPFNo = nGCV("lupPFNo", 6);
    var strStatus = nGCV("cddStatus", 8);
    var SPNName = nGCV("NamCtrlSPIN",32);
    var Drug = nGCV("cddDrug", 8);
    var DrugLabel = nGCO("tdDrug").className;
    var Dosage = nGCV("cddDispense", 8);
    var DispenseAmt = nGCV("txtDispense", 0);
    DispenseAmt = DispenseAmt.trim() == "" ? 0 : DispenseAmt;
    var MedBalanceStatus = nGCO("cddStatus",8).disabled;

    if (strDateTime == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Date Time");
        nSCF("dttmDateTime", 18);
        return false
    }
    else if (SPNName<=0) {
        KPIAlert(JMSMsd_PleaseEnter, "Name");
        nSCF("NamCtrlSPIN", 18);
        return false
    }
  
    else if (DrugLabel == "req" && Drug == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Drug");
        nSCF("cddDrug", 8);
        return false
    }
    else if (parseInt(DispenseAmt) == 0 && nGCO("tdDispenseAmt").className != "") {
        KPIAlert(JMSMsd_PleaseEnter, "Dispense");
        nSCF("txtDispense", 0);
        return false
    }
    else if (Dosage == "" && nGCO("tdDosageType").className != "") {
        KPIAlert(JMSMsd_PleaseEnter, "Dosage Type");
        nSCF("cddDispense", 8);
        return false
    }

    else if (strMethod == "" && !MedBalanceStatus) {
        KPIAlert(JMSMsd_PleaseEnter, "Method Administered");
        nSCF("cddMethodAdmin", 8);
        return false
    }
    else if (strPFNo == "") {
        KPIAlert(JMSMsd_PleaseEnter, "PF#");
        nSCF("lupPFNo", 6);
        return false
    }

    else if (strStatus == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Status");
        nSCF("cddStatus", 8);
        return false
    }

    else if (nGCO("tdComments").className == "req" && nGCV("txtNotes") == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Comment");
        nSCF("txtNotes", 0);
        return false
    }

    return true
}


function fn_Commentsmandatory() {
    ActionCommentsValue = CheckActionComments() == true ? 1 : 0;
    switch (ActionCommentsValue) {


        case 1:
            $('#tdComments').addClass("req");
            break;
        case 0:
            $('#tdComments').removeClass("req");
        default:

            var CurBalance = nGCV("txtBalance");
            var Dispense = nGCV("txtDispense");
            if (nGCV("cddStatus", 8) != "" && ActionCommentsValue != 1 && Dispense != "") {
                if ((Dispense != "" || Dispense == "0") && CurBalance != "" && parseInt(CurBalance) <= 5) {
                    $('#tdComments').addClass("req");
                }
                else if (parseInt(Dispense) > 5 && parseInt(Dispense) > parseInt(CurBalance)) {
                    //if (parseInt(CurBalance) <= 5) {
                    $('#tdComments').addClass("req");
                }
                else {
                    $('#tdComments').removeClass("req");
                }
                //}
            } else {
                $('#tdComments').removeClass("req");
            }


            break;

    }
}


function fn_UpdateReceivedSign(CtrlName) {

    if (nGCV(CtrlName, 0) < 0 || nGCV(CtrlName, 0) == "") {
        var Juris = glbPageJuris;
        var szURL = glbSitePath + "/FacilityMgmt/frmPropSignIDXML.aspx";
        var arrParams = new Array();
        arrParams[0] = new Array("Type", "Juris")
        arrParams[1] = new Array("Juris", Juris);
        var arrResponseData = KPIDoXMLHTTP(szURL, arrParams);
        if (arrResponseData != null) {
            for (i = 0; i < arrResponseData.length; i++) {
                if (arrResponseData[i][0] == "PropSignID") {
                    nSCV(CtrlName, arrResponseData[i][1], 0);
                }
            }
        }
    }

    KPIUpdateSign("7", "51", nGCV(CtrlName, 0), "", "", "");
    return false;
}


function fn_Distribution() {
    var CurBalance = nGCV("txtBalance");
    var Dispense = nGCV("txtDispense");

    CurBalance == "" ? 0 : CurBalance;
    Dispense == "" ? 0 : Dispense;
    if (parseInt(CurBalance) < parseInt(Dispense) && nGCV("cddStatus", 8) == "ADM") {
        if (KPIConfirm(JMMMsg_BalanceDistribute)) {

            return true;
        } else {
            return false;
        }
    }

    return true;


}


function CheckActionComments() {
    var CodeValue = nGCV("cddStatus", 8);
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedicationHist.aspx/CheckActionComments",
        // The key needs to match your method's input parameter (case-sensitive).
        data: "{'CodeValue':'" + CodeValue + "','sJurisID':'" + nGCV('hdnJurisId', 0) + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);
            if (obj != undefined) {

                if (obj == "1") {
                    ActionCommentsValue = true;
                }
                else {
                    ActionCommentsValue = false
                }

            }
        },
        failure: function (errMsg) {
            alert("Object Failed");
            return false;
        }
    });
    return ActionCommentsValue;
}


function LoadImg() {
    try {
        var NameID = nGCV("NamCtrlSPIN", 32);

        if (NameID != "" && NameID != "-9223372036854775808") {
            var szURLImg = glbSitePath + "/FacilityMgmt/frmVisitorImageURLXML.aspx";
            var arrParams = new Array(2);
            arrParams[0] = new Array("NameID", NameID);
            arrParams[1] = new Array("Type", "Image");
            var arrResponseData = KPIDoXMLHTTP(szURLImg, arrParams);
            if (arrResponseData != null) {
                for (i = 0; i < arrResponseData.length; i++) {


                    if (arrResponseData[i][0] == "ImageUrl") {
                        if (nGCV("hdnShowImage") == "Show") {
                            document.getElementById("imgFrontView").src = arrResponseData[i][1];
                        }
                        nSCV('hdnShowImage', 'Show', 0);
                        nSCV("hdnImagePath", arrResponseData[i][1]);
                    }


                }
                LoadCoded();
            }
        }
        else {
            fn_ClearBookingFields();
        }
        
        //fn_LoadDropdown();
    }
    catch (e) {
    }
    
}


function fn_ClearBookingFields() {
    try {
        fn_ClearData();
        document.forms[0].submit();
    }
    catch (e) {
    }
    return false;
}

function SetImage() {
    if (nGCV("hdnImagePath") != "" && nGCV("hdnShowImage") == "Show") {
        document.getElementById("imgFrontView").src = nGCV("hdnImagePath");
        nSCV('hdnShowImage', 'Show', 0);
    } else {
        fn_ClearBookingFields();
    }
}


function fn_ClearData() {
    nSCV("hdnJMMScheduleEventsID", "", 0);
    nSCV("hdnMarSignId", "", 0);
    nSCV("hdnPrescriptionID", "", 0);
    nSCV("txtDosage", "", 0);
    nSCV("cddDrug", "", 8);
    nSCV("txtDispense", "", 0);
    nSCV("cddDispense", "", 8);
    nSCV("txtBalance", "", 0);
    nSCV("dttmLstAdministered", "", 18);
    nSCV("dttmLstAdministered", "", 19);
    nSCV("txtNotes", "", 0);
    nSCV("hdnJMBookingID", "");
    nSCV("cddMethodAdmin", "", 8);
    nSCV("cddStatus", "", 8);
    nSCV("lupPFNo", "", 6);
    nSCV("lupPFNo", "", 7);
    nSCV("lupPFNo", "", 77);
    nSCV("txtInstructions", "");
    nClearNameCtrl("NamCtrlSPIN");
    nGCO("imgFrontView", 0).src = glbSitePath + "/KPIFrameworkWeb/Home/frmHandle.aspx?blnThumb=True&ImgType=1&RefType=1&RefID=-9223372036854775808&RefSeqNo=-32768&ImageTable=0";
    nSCV("hdnImagePath", glbSitePath + "/KPIFrameworkWeb/Home/frmHandle.aspx?blnThumb=True&ImgType=1&RefType=1&RefID=-9223372036854775808&RefSeqNo=-32768&ImageTable=0");

}



function fn_GetScheduleEvents() {
    var objEvents = false;
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedicationHist.aspx/GetScheduleEvents",
        data: "{'JMMScheduleEventsID':'" + nGCV('cddDosage', 8) + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj = $.parseJSON(data.d);

            if (obj != null) {
                //nSCV("cddDispense", obj["MedicationType"], 8);
                //nSCV("txtDispense", obj["Dispense"] > 0 ? obj["Dispense"] : 0, 0);
                nSCV("hdnPrescriptionID", obj["JMMedPrescriptionID"], 0);
                nSCV("hdnJMMScheduleEventsID", obj["JMMScheduleEventsID"], 0);
                nSCV("txtDosage", obj["Dosage"], 0);
                nSCV("hdnDispense", obj["MedicationType"]);

                nSCV("txtInstructions", obj["Instructions"]);
                GetLastAdministered(obj["JMMedPrescriptionID"]);
                if (obj["JMMedPrescriptionID"] > 0) {
                    GetMedicationBalance(obj["JMMedPrescriptionID"], nGCV("cddDispense", 8));
                    if (parseInt(nGCV("txtBalance")) <= 0) {
                        $('#tdDosageType').removeClass("req");
                        nSCV("cddDispense", "", 8);
                        nDisable("cddDispense", 8);
                        $('#tdDispenseAmt').removeClass("req");
                        nDisable("txtDispense", 0);

                    } else {
                        nEnable("cddDispense", 8);
                        $('#tdDosageType').addClass("req");
                        $('#tdDispenseAmt').addClass("req");
                        nEnable("txtDispense", 0);
                    }

                } else {
                    nSCV("txtBalance", "0", 0);
                    fn_CommentsmandatoryLimit();
                }
                Dosage = nGCV('cddDosage', 8);
                nSCV("hdnDosage", obj["JMMScheduleEventsID"]);
                objEvents= true;
                //TotalBalance = obj["CurQuantity"];
            } else {
                nSCV("hdnJMMScheduleEventsID", "", 0);
                nSCV("hdnMarSignId", "", 0);
                nSCV("hdnPrescriptionID", "", 0);
                nSCV("txtDosage", "", 0);
                //nSCV("cddDrug", "", 8);
                nSCV("txtDispense", "", 0);
                nSCV("cddDispense", "", 8);
                nSCV("txtBalance", "", 0);
                nSCV("dttmLstAdministered", "", 18);
                nSCV("dttmLstAdministered", "", 19);
                nSCV("txtNotes", "", 0);
                nSCV("hdnDosage", "");
                $('#tdDosageType').addClass("req");
                $('#tdDispenseAmt').addClass("req");

                nEnable("cddMethodAdmin", 8);
                $('#tdMethodAdmin').addClass("req");
                nSCV("txtInstructions", "");
                nSCV("cddStatus", "", 8);
                nEnable("cddStatus", 8);


                nEnable("cddDispense", 8);
                nEnable("txtDispense", 0);
                if (nGCV("cddDosage", 8) != "") {
                    $('#tdComments').addClass("req");
                } else {
                    $('#tdComments').removeClass("req");
                }
                
                nSCV("cddMethodAdmin", "", 8);
                nSCV("cddStatus", "", 8);
                nSCV("lupPFNo", "", 6);
                nSCV("lupPFNo", "", 7);
                nSCV("lupPFNo", "", 77);

                Dosage = "";

            }

        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            objEvents= false;
        }
    });
    return objEvents;

}

function GetLastAdministered(JMMedPrescriptionID) {
    //var TotalBalance = 0;
    //UseEndedDttm = null;
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedicationHist.aspx/GetLastAdministered",
        data: "{'JMMedPrescriptionID':'" + JMMedPrescriptionID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj1 = $.parseJSON(data.d);

            if (obj1 != null) {
                nSCV("dttmLstAdministered", new Date(parseInt(obj1["ActivityDttm"].substr(6))), 18);
                return true;
                //TotalBalance = obj["CurQuantity"];
            } else {
                nSCV("dttmLstAdministered", "", 18);
                nSCV("dttmLstAdministered", "", 19);
            }

        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            return false;
        }
    });
    //return TotalBalance;

}


function GetMedicationBalance(JMMedPrescriptionID, MedicationType) {
    $.ajax({
        type: "POST",
        async: false,
        url: "frmMedicationHist.aspx/GetMedicationBalance",
        data: "{'JMMedPrescriptionID':'" + JMMedPrescriptionID + "','MedicationType':'" + MedicationType + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj2 = $.parseJSON(data.d);
            if (obj2 != null) {
                nSCV("txtBalance", obj2["CurQuantity"], 0);
                if (obj2["CurQuantity"] == 0) {
                    //nSCV("cddStatus", "MEU", 8);
                    document.getElementById("cddStatus_DropDown").value = "MEU";
                    nDisable("cddStatus", 8);
                    nSCV("txtDispense", "");
                    nSCV("cddMethodAdmin", "", 8);
                    nDisable("cddMethodAdmin", 8);
                    nGCO("tdMethodAdmin").className = "";
                    nGCO("tdDispenseAmt").className = "";
                    nDisable("txtDispense", 0);
                } else {
                    nSCV("cddStatus", "", 8);
                    nEnable("cddStatus", 8);
                    nEnable("cddMethodAdmin", 8);
                    nGCO("tdMethodAdmin").className = "req";
                    nGCO("tdDispenseAmt").className = "req";
                    nEnable("txtDispense", 0);
                }
                fn_CommentsmandatoryLimit();
                return true;

            }
            
        },
        failure: function (errMsg) {
            KPIAlert("Object Failed");
            ReturnStatus = "FALSE";
            return false;
        }
    });
}



function fn_LoadData() {
    Dosage = nGCV("cddDosage", 8);
    var oldDosage = nGCV("hdnDosage", 0);
    Drug = nGCV('cddDrug', 8);
    fn_GetDosageDetails(Drug);
    fn_GetScheduleEvents();
    
    return false;
}

function fn_ClearDosageDetails() {
    
    nEnable("cddMethodAdmin", 8);
    nSCV("cddDosage", "", 8);
    nEnable("cddDosage", 8);

    nSCV("hdnJMMScheduleEventsID", "", 0);
    nSCV("hdnMarSignId", "", 0);
    nSCV("hdnPrescriptionID", "", 0);
    nSCV("txtDosage", "", 0);

    nSCV("txtDispense", "", 0);
    nSCV("cddDispense", "", 8);
    nSCV("txtBalance", "", 0);
    nSCV("dttmLstAdministered", "", 18);
    nSCV("dttmLstAdministered", "", 19);
    nSCV("txtNotes", "", 0);
    nSCV("cddMethodAdmin", "", 8);
    nSCV("cddStatus", "", 8);
    nEnable("cddStatus", 8);
    nGCO("tdMethodAdmin").className = "req";
    nGCO("tdDispenseAmt").className = "req";
    nEnable("txtDispense", 0);
    nSCV("txtBalance", "", 0);
    $('#tdComments').removeClass("req");
    nGCO("txtBalance", 0).style.color = 'black';
    nSCV("lupPFNo", "", 6);
    nSCV("lupPFNo", "", 7);
    nSCV("lupPFNo", "", 77);
    nSCF("cddDosage", 8);
    nSCV("txtInstructions", "");
    //$("#cddDosage_DropDown option").remove();
    //var newOption = window.document.createElement("option");
    //newOption.text = "--Select--";
    //newOption.value = "";
    //nGCO('cddDrug', 8).options.add(newOption);
    Dosage = "";
    return false;
}

function LoadCoded() {

    var sFlagParameter = nGCV('cddBuilding', 8);
    let JMBookingID = fn_chkBookingIDWithNameiD(nGCV("NamCtrlSPIN", 32), glbPageJuris);
    nSCV("hdnJMBookingID", JMBookingID);
    $.ajax({
        type: "POST",
        url: "frmMedicationHist.aspx/LoadCoded",
        data: "{'sCodeID':'786','JMBookingID':'" + JMBookingID + "' , 'sJurisID' : '" + nGCV('hdnJurisId', 0) + "' }",
        async: false,
        contentType: "application/json;",
        dataType: "json",

        success:
               function (data) { 
                       FillCodedDatas(data, nGCO('cddDrug', 8));               
               },
        failure: function (errMsg) {
            return false;
        }

    });


}
function FillCodedDatas(data, CtrlObj) {
   
    var CodedCtrlObject = CtrlObj;

    CodedCtrlObject.options.length = 0;
    var newOption = window.document.createElement("option");
    newOption.text = "--Select--";
    newOption.value = "";

    CodedCtrlObject.options.add(newOption);


    if ($.parseJSON(data.d) != null) {
        var objData = $.parseJSON(data.d);
        var objDataLength = objData.length;

        if (objData != null && String(objData).toUpperCase() != 'UNDEFINED') {
            for (i = 0; i < objData.length; i++) {
                newOption = window.document.createElement("option");
                newOption.value = objData[i]["CodeValue"];
                newOption.text = objData[i]["Description"];
                CodedCtrlObject.options.add(newOption);
            }
            nSCV(CtrlObj.id.split("_")[0], "", 8);
            nEnable(CtrlObj.id.split("_")[0], 8);
        }

        if (objDataLength == 1) {
            CtrlObj.value = objData[0]["CodeValue"];

            if (CtrlObj.id == "cddDrug_DropDown") {
                Drug = CtrlObj.value;
                nSCV("hdnDrug", CtrlObj.value);
                Dosage = "";
                fn_GetDosageDetails(objData[0]["CodeValue"]);
                fn_GetScheduleEvents();

            } else if (CtrlObj.id =="cddDosage_DropDown") {
                Dosage = CtrlObj.value;
                nSCV("hdnDosage", CtrlObj.value);
            }
            nDisable(CtrlObj.id.split("_")[0], 8);

        }

       
    } else {

        //$("#cddDrug_DropDown option").remove();
        $("#cddDosage_DropDown option").remove();
        var newOption = window.document.createElement("option");
        newOption.text = "--Select--";
        newOption.value = "";
        nGCO('cddDosage', 8).options.add(newOption);
       
        //var newOption = window.document.createElement("option");
        //newOption.text = "--Select--";
        //newOption.value = "";
        //nGCO('cddDrug', 8).options.add(newOption);


        nEnable("cddDrug", 8);
        nSCV("cddDrug", "", 8);
        fn_ClearDosageDetails();
        Drug = "";
        Dosage = "";
    }
    return false;
}

function fn_DispenseBalance() {

    var TotalBalance = 0;
    var JMMedPrescriptionID = nGCV("hdnPrescriptionID", 0);
    var QuantityType = nGCV("cddDispense", 8);
    if (JMMedPrescriptionID > 0) {
        GetMedicationBalance(JMMedPrescriptionID, QuantityType);
        //fn_CommentsmandatoryLimit();
    } else {
        nSCV("cddStatus", "", 8);
        nEnable("cddStatus", 8);
        nEnable("cddMethodAdmin", 8);
        nGCO("tdMethodAdmin").className = "req";
        nGCO("tdDispenseAmt").className = "req";
        nEnable("txtDispense", 0);
        nSCV("txtBalance", "", 0);
        $('#tdComments').removeClass("req");
        nSCV("txtInstructions", "");
        nGCO("txtBalance", 0).style.color = 'black';
    }
    return false;
}

function fn_CommentsmandatoryLimit() {
    var CurBalance = nGCV("txtBalance");
    if (parseInt(CurBalance) <= 5) {
        $('#tdComments').addClass("req");
        nGCO("txtBalance", 0).style.color = 'red';
    } else {
        $('#tdComments').removeClass("req");
        nGCO("txtBalance", 0).style.color = 'black';
    }
    return false;
}



function fn_GetDosageDetails(Drug) {
    $.ajax({
        type: "POST",
        url: "frmMedicationHist.aspx/LoadCoded788",
        data: "{'sCodeID':'788','JMBookingID':'" + nGCV("hdnJMBookingID") + "' , 'Drug' : '" + nGCV('cddDrug', 8) + "' ,'sJurisID' : '" + glbPageJuris + "' }",
        async: false,
        contentType: "application/json;",
        dataType: "json",

        success:
               function (data) {                   
                   FillCodedDatas(data, nGCO('cddDosage', 8));
               },
        failure: function (errMsg) {
            return false;
        }

    });
}
