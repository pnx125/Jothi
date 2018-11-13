

function fn_ValidateScreen() {

    if (glbCtrlClicked == "Save") {
        glbCtrlClicked = "";
        if (Validate()) {
            if (KPIConfirm(KPIMsg_SAVE)) {
                ShowProgressPanel();
                TabSave("MedicalVital", false);
                return true;
            }
            else
                return false;
        }
        else
            return false;
    }
    else if (glbCtrlClicked == "Reset") {
        TabSave("MedicalVital", false);
    }
    return true;
}


function fn_setVitalDetails() {
    if (nGCV('hdnStatus') == "1") {
        window.opener.nSCV('txtBloodPressure1', nGCV('hdnBloodPressure'), 0); //bloodpressure 80
        window.opener.nSCV('txtBloodPressure2', nGCV('hdnBloodPressureMax'), 0); //bloodpressure 81
        window.opener.nSCV('hdnPulse', nGCV('hdnPulse'), 0); //pulse
        window.opener.nSCV('txtPulse', nGCV('hdnPulse'), 0); //pulse
        

        window.opener.nSCV('hdnWeight', nGCV('hdnWeight'), 0); //weight    
        window.opener.nSCV('txtWeight', nGCV('hdnWeight'), 0); //weight   

        window.opener.nSCV('hdnHeight', nGCV('hdnHeight'), 0); //height
        window.opener.nSCV('txtHeight', nGCV('hdnHeight'), 0); //height

        window.opener.nSCV('hdnMedVitalID', nGCV('hdnMedVitalID'), 0); //height
        self.close();
    } else {
        nSCV('hdnPulse', '', 0);
        nSCV('hdnWeight', '', 0);
        nSCV('hdnHeight', '', 0);
        nSCV('hdnMedVitalID', '', 0);
        nSCV('hdnBloodPressure', '', 0);
        nSCV('hdnBloodPressureMax', '', 0);
    }

}



function Validate() {
    var oRows = nGrdGAR("grdMedicalVital");

    if (nGCV("txtHeight", 0) != "" || nGCV("txtWeight", 0) != "" || nGCV("txtRespiration", 0) != "" || nGCV("txtNotes", 0) != "" || nGCV("txtTemperature", 0) != "" || nGCV("lblRest_txtRest", 0) != "" || nGCV("lblActivity_txtActivity", 0) != "" || nGCV("lblApical_txtPulse", 0) != "" || nGCV("lblRadial_txtRadial", 0) != "") {
        return KPIAlert(FrwkMsg_CTRL_UPDATE);
    }
    if (nGCV("lupPFNbr", 6) != "")
        return KPIAlert(FrwkMsg_CTRL_UPDATE);

    if (nGCV("lupPFNbr", 7) != "")
        return KPIAlert(FrwkMsg_CTRL_UPDATE);

    if (nGCV("dtDateFrom", 18) != "")
        return KPIAlert(FrwkMsg_CTRL_UPDATE);

    if (nGCV("dtDateFrom", 19) != "")
        return KPIAlert(FrwkMsg_CTRL_UPDATE);




    if (nGCV("txtBloodPressure1", 0) != "")
        return KPIAlert(FrwkMsg_CTRL_UPDATE);

    if (nGCV("txtBloodPressure2", 0).trim() != "")
        return KPIAlert(FrwkMsg_CTRL_UPDATE);

  

    if (oRows.get_length() <= 0) {
        KPIAlert(KPIMsg_NO_DATA);
        return false;
    }

    return true;
}
var grdMedicalVitalEditModeRow = "";
function fn_ManipulationVitalTab() {
    if (grdMedicalVital_Validate()) {
        if (grdMedicalVitalEditModeRow == "") {
            var row = nGrdAdd('grdMedicalVital');
            if (row != null) {
                grdMedicalVital_SetValues(row, "A");
            }
        } else {
            if (nGrdGCV(grdMedicalVitalEditModeRow, "KPIID") == "") {
                grdMedicalVital_SetValues(grdMedicalVitalEditModeRow, "A");
            } else {
                grdMedicalVital_SetValues(grdMedicalVitalEditModeRow, "C");
            }
        }
    }
    return false;
}


function grdMedicalVital_Validate() {

    if (nGCV('lupPFNbr', 77) <= 0) {
        KPIAlert(JMSMsd_PleaseEnter, "Vitals taken By PF#");
        nSCF('lupPFNbr', 6);
        return false;
    }
    if (nGCV('lupPFNbr', 6).trim() == "") {
        KPIAlert(JMSMsd_PleaseEnter, "Vitals taken By PF#");
        nSCF('lupPFNbr', 6);
        return false;
    }
    if (nGCV('dtDateFrom', 18) == "") {
        nSCF('dtDateFrom', 18);
        KPIAlert(JMSMsd_PleaseEnter, "Date/Time");
        return false;
    }
    return true;
}

function grdMedicalVital_SetValues(row, Mode) {
    //height, weight,respiration,temperature, spox at rest, spox activity, bloodpressure,  pulse apical,pulse radial,  notes,vital pf,vital dttm
    //weight type,temperature type,bloodpressure type,pulse rythm,
    var Pulse = "";
    var Spox = "";
    var Seperator = " , ";
    var rowIndex = row._index;
    var BPType = "";
    var BPStatus = "";
    var PulseRythm = "";
    nGrdSCV(row, "Height", nGCV('txtHeight', 0));
    nGrdSCV(row, "Weight", nGCV('txtWeight', 0));
    nGrdSCV(row, "Respiration", nGCV('txtRespiration', 0));
    nGrdSCV(row, "Temperature", nGCV('txtTemperature', 0));
    nGrdSCV(row, "SpoxAtRest", nGCV('lblRest_txtRest', 0));
    nGrdSCV(row, "SpoxActivity", nGCV('lblActivity_txtActivity', 0));
    nGrdSCV(row, "BloodPressure", nGCV('txtBloodPressure1', 0));
    nGrdSCV(row, "BloodPressureMax", nGCV('txtBloodPressure2', 0));

    nGrdSCV(row, "PulseApical", nGCV('lblApical_txtPulse', 0));
    nGrdSCV(row, "PulseRadial", nGCV('lblRadial_txtRadial', 0));
    nGrdSCV(row, "CmtsNotes", HtmlEncode(nGCV('txtNotes', 0)));
    nGrdSCV(row, "VitalPFCode", nGCV('lupPFNbr', 6));
    nGrdSCV(row, "VitalDesc", nGCV('lupPFNbr', 7));
    if (nGCV('lupPFNbr', 77) > 0) {
        nGrdSCV(row, "VitalPFID", nGCV('lupPFNbr', 77) <= 0 ? rowIndex : nGCV('lupPFNbr', 77));
    }
    nGrdSCV(row, "VitalDttm", nGCV('dtDateFrom', 18));
    //nGrdSCV(row, "PFDttm", nGCV('dtDateFrom', 18));

    if (nGrdGCV(row, "KPIID") == "") {
        nGrdSCV(row, "KPIID", -rowIndex);
    }

    if (nGrdGCV(row, "PulseApical") != "") {
        Pulse = nGrdGCV(row, "PulseApical");
    } else if (nGrdGCV(row, "PulseRadial") != "") {
        Pulse = nGrdGCV(row, "PulseRadial");
    }


    if (nGrdGCV(row, "SpoxAtRest") != "" && nGrdGCV(row, "SpoxActivity") != "") {
        Spox = nGrdGCV(row, "SpoxAtRest") + Seperator + nGrdGCV(row, "SpoxActivity");
    }
    else if (nGrdGCV(row, "SpoxActivity") != "") {
        Spox = nGrdGCV(row, "SpoxActivity");
    } else if (nGrdGCV(row, "SpoxAtRest") != "") {
        Spox = nGrdGCV(row, "SpoxAtRest");
    }


    nGrdSCV(row, "WeightType", $("[id$='RadLstWeight']").find(":checked").val());
    nGrdSCV(row, "WeightStatus", $("[id$='RadLstWeightStatus']").find(":checked").val());

    nGrdSCV(row, "WType", $("[id$='RadLstWeight']").find(":checked").val());
    nGrdSCV(row, "WStatus", $("[id$='RadLstWeightStatus']").find(":checked").val());


    nGrdSCV(row, "TemperatureType", $("[id$='RadLstTemperature']").find(":checked").val());
    nGrdSCV(row, "BloodPressureType", $("[id$='RadLstBloodPressure']").find(":checked").val());
    nGrdSCV(row, "BloodPressureStatus", $("[id$='RadLstBloodPressureStatus']").find(":checked").val());
    nGrdSCV(row, "PulseRhythm", $("[id$='RadLstRhythm']").find(":checked").val());

  



    if (nGrdGCV(row, "Weight") != "") {
        nGrdSCV(row, "WeightWithType", nGrdGCV(row, "Weight") + ' ' + $("[id*=RadLstWeight] input:checked").next().text().trim().charAt(0) + ' ' + $("[id*=RadLstWeightStatus] input:checked").next().text().trim().charAt(0));
    } else {
        nGrdSCV(row, "WeightWithType", "");
    }
    if (nGrdGCV(row, "Temperature") != "") {
        nGrdSCV(row, "TemperatureWithType", nGrdGCV(row, "Temperature") + ' ' + $("[id*=RadLstTemperature] input:checked").next().text().trim().charAt(0));
    } else {
        nGrdSCV(row, "TemperatureWithType", "");
    }
    if (nGrdGCV(row, "BloodPressure").trim() != "" || nGrdGCV(row, "BloodPressureMax").trim() != "") {

        if (nGrdGCV(row, "BloodPressureType") != "" && nGrdGCV(row, "BloodPressureType") != "0") {
            BPType = $("[id*=RadLstBloodPressure] input:checked").next().text().trim().charAt(0);
        }
        if (nGrdGCV(row, "BloodPressureStatus") != "" && nGrdGCV(row, "BloodPressureStatus") != "0") {
            BPStatus = $("[id*=RadLstBloodPressureStatus] input:checked").next().text().trim().charAt(0);
        }
        nGrdSCV(row, "BPWithType", nGrdGCV(row, "BloodPressure") + "/" + nGrdGCV(row, "BloodPressureMax") + ' ' + BPType + ' ' + BPStatus);
    } else {
        nGrdSCV(row, "BPWithType", "");
    }

    if (Pulse != "") {
        if (nGrdGCV(row, "PulseRhythm") != "" && nGrdGCV(row, "PulseRhythm") != "0") {
            PulseRythm = $("[id*=RadLstRhythm] input:checked").next().text().trim().charAt(0);
        }
        nGrdSCV(row, "Pulse", Pulse + ' ' + $("[id*=RadLstRhythm] input:checked").next().text().trim().charAt(0));
    }
    else {
        nGrdSCV(row, "Pulse", "");
    }
    nGrdSCV(row, "Spox", Spox);


    nGrdSCV(row, "KPIMode", Mode);

    fn_CancelVitals();
    TabSave("MedicalVital", true);
    return false;
}

function fn_CancelVitals() {
    try {
        nSCV('txtHeight', '', 0);
        nSCV('txtWeight', '', 0);
        nSCV('txtRespiration', '', 0);
        nSCV('lblRest_txtRest', '', 0);
        nSCV('lblActivity_txtActivity', '', 0);
        nSCV('txtTemperature', '', 0);
        nSCV('txtBloodPressure1', '', 0);
        nSCV('txtBloodPressure2', '', 0);
        nSCV('lblApical_txtPulse', '', 0);
        nSCV('lblRadial_txtRadial', '', 0);
        nSCV('txtNotes', '', 0);
        nSCV('lupPFNbr', '', 6);
        nSCV('lupPFNbr', '', 7);
        nSCV('lupPFNbr', '', 77);
        nSCV('dtDateFrom', '', 18);
        nSCV('dtDateFrom', '', 19);
        var RadLstWeight = $("[id$='RadLstWeight']").find(":checked").val();
        var RadLstWeightStatus = $("[id$='RadLstWeightStatus']").find(":checked").val();
        var RadLstTemperature = $("[id$='RadLstTemperature']").find(":checked").val();
        var RadLstBloodPressure = $("[id$='RadLstBloodPressure']").find(":checked").val();
        var RadLstBloodPressureStatus = $("[id$='RadLstBloodPressureStatus']").find(":checked").val();
        var RadLstRhythm = $("[id$='RadLstRhythm']").find(":checked").val();


        $('[id*=RadLstWeight] :radio[value="' + RadLstWeight + '"] ').prop('checked', false);
        $('[id*=RadLstWeightStatus] :radio[value="' + RadLstWeightStatus + '"] ').prop('checked', false);
        $('[id*=RadLstTemperature] :radio[value="' + RadLstTemperature + '"] ').prop('checked', false);
        $('[id*=RadLstBloodPressure] :radio[value="' + RadLstBloodPressure + '"] ').prop('checked', false);
        $('[id*=RadLstBloodPressureStatus] :radio[value="' + RadLstBloodPressureStatus + '"] ').prop('checked', false);
        $('[id*=RadLstRhythm] :radio[value="' + RadLstRhythm + '"] ').prop('checked', false);

        if (nGCV('hdnMode') == "INQ") {
            nDisable("lblApical_txtPulse", 0);
            nDisable("lblRadial_txtRadial", 0);
        } else {
            nEnable("lblApical_txtPulse", 0);
            nEnable("lblRadial_txtRadial", 0);
        }
        grdMedicalVitalEditModeRow = "";
        nChangeToAddMode("cmdAdd");

    } catch (e) {

    }
    return false;
}


function grdMedicalVital_CellClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == 'cell') {
        grdMedicalVitalEditModeRow = nGrdGSR("grdMedicalVital");
        if (nGrdColKey(sender) == glbKPIGrdDelKey) {
            nGrdHandleDel("grdMedicalVital");
            TabSave("MedicalVital", true);
            fn_CancelVitals();
        }

        else if (nGrdColKey(sender) == "Notes") {
            var JMMedVitaltID = nGrdGCV(grdMedicalVitalEditModeRow, 'KPIID');
            var JMBookingID = nGrdGCV(grdMedicalVitalEditModeRow, 'JMBookingID');
            var JurisID = nGrdGCV(grdMedicalVitalEditModeRow, 'KPIJurisID');
            var JBMChargeExtnID = "";
            var Cmts = nGrdGCV(grdMedicalVitalEditModeRow, 'Cmts');
            if (Cmts != '') {
                var strURL = glbSitePath + "/Huber/frmHuberInOutNotes.aspx?hdnJurisId=" + glbPageJuris + "&JBMChargeExtnID=" + JBMChargeExtnID + " &JMMedVitaltID=" + JMMedVitaltID + "&JurisID=" + JurisID + "&hdnScreenId=8543&JMBookingID=" + JMBookingID;
                var left = (window.screen.width / 2) - ((320 / 2) + 10);
                var top = (window.screen.height / 2) - ((400 / 2) + 50);
                openPositionWin(strURL, "MedicalVitals", 320, 400, top, left);
                fn_CancelVitals();
                return false;
            }
        }
        else {
            
            nSCV('txtHeight', nGrdGCV(grdMedicalVitalEditModeRow, "Height"), 0);
            nSCV('txtWeight', nGrdGCV(grdMedicalVitalEditModeRow, "Weight"), 0);
            nSCV('txtRespiration', nGrdGCV(grdMedicalVitalEditModeRow, "Respiration"), 0);
            nSCV('txtTemperature', nGrdGCV(grdMedicalVitalEditModeRow, "Temperature"), 0);
            nSCV('lblRest_txtRest', nGrdGCV(grdMedicalVitalEditModeRow, "SpoxAtRest"), 0);
            nSCV('lblActivity_txtActivity', nGrdGCV(grdMedicalVitalEditModeRow, "SpoxActivity"), 0);
            nSCV('lblApical_txtPulse', nGrdGCV(grdMedicalVitalEditModeRow, "PulseApical"), 0);
            nSCV('lblRadial_txtRadial', nGrdGCV(grdMedicalVitalEditModeRow, "PulseRadial"), 0);
            nSCV('txtBloodPressure1', nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressure"), 0);
            nSCV('txtBloodPressure2', nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureMax"), 0);
            nSCV('txtNotes', decodeXml(nGrdGCV(grdMedicalVitalEditModeRow, "CmtsNotes"), 0));
            nSCV('lupPFNbr', nGrdGCV(grdMedicalVitalEditModeRow, "VitalPFCode"), 6);
            nSCV('lupPFNbr', nGrdGCV(grdMedicalVitalEditModeRow, "VitalDesc"), 7);
            nSCV('lupPFNbr', nGrdGCV(grdMedicalVitalEditModeRow, "VitalPFID"), 77);
            nSCV('dtDateFrom', nGrdGCV(grdMedicalVitalEditModeRow, "VitalDttm"), 18);
            nSCV('dtDateFrom', nGrdGCV(grdMedicalVitalEditModeRow, "VitalDttm"), 19);


            if (nGCV('hdnMode') == "INQ") {
                nDisable("lblApical_txtPulse", 0);
                nDisable("lblRadial_txtRadial", 0);
            } else {
                if (nGrdGCV(grdMedicalVitalEditModeRow, "PulseApical") == "" && nGrdGCV(grdMedicalVitalEditModeRow, "PulseRadial") == "") {
                    nEnable("lblApical_txtPulse", 0);
                    nEnable("lblRadial_txtRadial", 0);
                } else if (nGrdGCV(grdMedicalVitalEditModeRow, "PulseApical") != "" && nGrdGCV(grdMedicalVitalEditModeRow, "PulseRadial") == "") {
                    nEnable("lblApical_txtPulse", 0);
                    nDisable("lblRadial_txtRadial", 0);
                } else if (nGrdGCV(grdMedicalVitalEditModeRow, "PulseApical") == "" && nGrdGCV(grdMedicalVitalEditModeRow, "PulseRadial") != "") {
                    nDisable("lblApical_txtPulse", 0);
                    nEnable("lblRadial_txtRadial", 0);
                }
            }


          
            if (nGrdGCV(grdMedicalVitalEditModeRow, "WType") == "" || nGrdGCV(grdMedicalVitalEditModeRow, "WType") == "0") {
                $("input[type=radio][name=RadLstWeight]").prop("checked", false);
            } else {
                $('[id*=RadLstWeight] :radio[value="' + nGrdGCV(grdMedicalVitalEditModeRow, "WType") + '"] ').prop('checked', true);
            }
            if (nGrdGCV(grdMedicalVitalEditModeRow, "WStatus") == "" || nGrdGCV(grdMedicalVitalEditModeRow, "WStatus") == "0") {
                $("input[type=radio][name=RadLstWeightStatus]").prop("checked", false);
            }
            else {
                $('[id*=RadLstWeightStatus] :radio[value="' + nGrdGCV(grdMedicalVitalEditModeRow, "WStatus") + '"] ').prop('checked', true);
            }

            if (nGrdGCV(grdMedicalVitalEditModeRow, "TemperatureType") == "0" || nGrdGCV(grdMedicalVitalEditModeRow, "TemperatureType") == "") {
                $("input[type=radio][name=RadLstTemperature]").prop("checked", false);
            } else {
                $('[id*=RadLstTemperature] :radio[value="' + nGrdGCV(grdMedicalVitalEditModeRow, "TemperatureType") + '"] ').prop('checked', true);
            }

            if (nGrdGCV(grdMedicalVitalEditModeRow, "PulseRhythm") == "0" || nGrdGCV(grdMedicalVitalEditModeRow, "PulseRhythm") == "") {
                $("input[type=radio][name=RadLstRhythm]").prop("checked", false);
            } else {
                $('[id*=RadLstRhythm] :radio[value="' + nGrdGCV(grdMedicalVitalEditModeRow, "PulseRhythm") + '"] ').prop('checked', true);
            }

            if (nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureType") == "0" || nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureType") == "") {
                $("input[type=radio][name=RadLstBloodPressure]").prop("checked", false);
            } else {
                $('[id*=RadLstBloodPressure] :radio[value="' + nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureType") + '"] ').prop('checked', true);
            }

            if (nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureStatus") == "0" || nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureStatus") == "") {
                $("input[type=radio][name=RadLstBloodPressureStatus]").prop("checked", false);
            } else {
                $('[id*=RadLstBloodPressureStatus] :radio[value="' + nGrdGCV(grdMedicalVitalEditModeRow, "BloodPressureStatus") + '"] ').prop('checked', true);
            }

            TabSave("MedicalVital", true);

            nChangeToEditMode_WithText("cmdAdd");
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



function FillLogInPF() {


    if (nGCV("hdnSetUserPFID") == "1") {
        if (nGCV("hdnLoginPFCode") != "" && nGCV("hdnLoginPFDesc") != "" && nGCV("hdnLoginPFID") != "") {
            if (nGCV("lupPFNbr", 6) == "") {
                nSCV("lupPFNbr", nGCV("hdnLoginPFCode"), 6);
                nSCV("lupPFNbr", nGCV("hdnLoginPFDesc"), 7);
                nSCV("lupPFNbr", nGCV("hdnLoginPFID"), 77);
            }
        }
    }
}


function isValidPulsApical(evt, element) {
    var charCode = (evt.which) ? evt.which : event.keyCode

    var len = $(element).val().length;
    if (len == 0) {
        nEnable("lblRadial_txtRadial", 0);
    } else {
        nDisable("lblRadial_txtRadial", 0);
    }
    return true;
}

function isValidPulsRadial(evt, element) {
    var charCode = (evt.which) ? evt.which : event.keyCode

    var len = $(element).val().length;
    if (len == 0) {
        nEnable("lblApical_txtPulse", 0);
    } else {
        nDisable("lblApical_txtPulse", 0);
    }
    return true;
}
