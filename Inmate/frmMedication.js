

function grdMedreqlist_DblClickHandler(sender, eventArgs) {
    if (eventArgs.get_type() == "cell") {
        var JMMedPrescriptionID = nGrdGCVById(eventArgs, "JMMedPrescriptionID");
        var Drug = nGrdGCVById(eventArgs, "Drug");
        var Dosage = nGrdGCVById(eventArgs, "Dosage");
        var CurQuantity = nGrdGCVById(eventArgs, "CurQuantity");
        var balrefill = nGrdGCVById(eventArgs, "RefillBal") > 0 ? nGrdGCVById(eventArgs, "RefillBal") : "";
        var NameID = nGrdGCVById(eventArgs, "NameID");
        var JMBookingID = nGrdGCVById(eventArgs, "JMBookingID");
        //var JMPrescriptionSchduleID = nGrdGCVById(eventArgs, "JMPrescriptionSchduleID");
        var Times = nGrdGCVById(eventArgs, "Times");
        var JMMedPrescriptionHistID = nGrdGCVById(eventArgs, "JMMedPrescriptionHistID");
        var JurisID = nGrdGCVById(eventArgs, "JurisID");
        var Dispense = nGrdGCVById(eventArgs, "Dispense");
        var MedicationType = nGrdGCVById(eventArgs, "MedicationType");
        var JMMScheduleEventsID = nGrdGCVById(eventArgs, "JMMScheduleEventsID");


        var left = (window.screen.width / 2) - ((1000 / 2) + 10);
        var top = (window.screen.height / 2) - ((380 / 2) + 50);
        if (JMMedPrescriptionHistID >= "0")
            var strURL = glbSitePath + "/Inmate/frmMedicationHist.aspx?Flag=1&hdnMode=INQ&Times=" + Times + "&NameID=" + NameID + "&Mode=INQ&JMMedPrescriptionID=" + JMMedPrescriptionID + "&JMMedPrescriptionHistID=" + JMMedPrescriptionHistID + "&MedicationType=" + MedicationType + "&Dispense=" + Dispense + "&JMMScheduleEventsID=" + JMMScheduleEventsID + "&JurisID=" + JurisID;
        else
            var strURL = glbSitePath + "/Inmate/frmMedicationHist.aspx?Flag=1&hdnMode=ADD&Times=" + Times + "&JMBookingID=" + JMBookingID + "&NameID=" + NameID + "&JMMedPrescriptionID=" + JMMedPrescriptionID + "&Drug=" + Drug + "&Dosage=" + Dosage + "&CurQuantity=" + CurQuantity + "&balrefill=" + balrefill + "&Mode=ADD&MedicationType=" + MedicationType + "&Dispense=" + Dispense + "&JMMScheduleEventsID=" + JMMScheduleEventsID + "&JurisID=" + JurisID;

        openPositionWin(strURL, "InmateMedicalHist", 1000, 380, top, left);
        return false;
    }
}

//M.Ravikumar
//(01/09(Wed)PM12:23)
//---------------------------
var clockID  = 0
function UpdateClock()
{
	var DisplayModeFormat = "HH:mm:ss";
	var Cntrl = "KPITimer";
		if(clockID)
		{
			clearTimeout(clockID);
			clockID  = 0;
		}

		var Date = formatDate(KPIGetCurDttm(), DisplayModeFormat);

		document.getElementById(Cntrl).innerHTML = "" + Date;

		clockID = setTimeout("UpdateClock()", 1000);
}

function StartClock()
{
	clockID = setTimeout("UpdateClock()", 500);
}

function KillClock()
{
	if(clockID)
	{
		clearTimeout(clockID);
		clockID  = 0;
	}
}


function srchTlb_Click(sender, eventArgs) {
    try {
        switch (eventArgs.getItem().get_key()) {
            case "Excel":
                if (!fn_ValidateScrn()) {
                    eventArgs.set_cancel(true);
                    return false;
                }
                break;
            case "Print":
                
                break;
        }
    } catch (e) {

    }
    return false;
}

function fn_OpenMedication() {
    var left = (window.screen.width / 2) - ((1020 / 2) + 10);
    var top = (window.screen.height / 2) - ((680 / 2) + 50);
    openPositionWin(glbSitePath + '/Inmate/frmMedication.aspx?hdnMode=ADD', 'Medication', 1080, 680, top, left);
    return false;
}

function fn_ValidateScrn() {
    var buildingid = nGCV("cddBuilding", 8);
    var podid = nGCV("luppod", 77);
    if (buildingid == '') {
        KPIAlert(JMSMsd_PleaseEnter, "Building");
        nSCF('cddBuilding', 8);
        return false;
    }
    else if (podid == '' || podid == null || parseInt(podid) <= 0) {
        KPIAlert(JMSMsd_PleaseEnter, "Pod");
        nSCF('luppod', 6);
        return false;
    }

    return true;
}


//-------------------------------------------------------------------------------------------------------------------------


$(function () {
    $('#cddBuilding_DropDown').change(function () {
        nSCV('luppod', '', 6);
        nSCV('luppod', '', 7);
        nSCV('luppod', '', 77);

        nSCV('lupcell', '', 6);
        nSCV('lupcell', '', 7);
        nSCV('lupcell', '', 77);
        
        nSCV('hdnAutoLoad', 'ClearGrid');
        nGCO("btnSearch").click();
        
    });   



});


function fn_PodFilter() {
    
    return false;
}

function fn_CellFilter() {
    
    return false;
}







function fn_MEDPAssSearch() {
    if (!fn_ValidateScrn()) {
        return false;
    }

    return true;
}



