
function tabNameSrch_AfterSelectedTabChange(oWebTab, oTab, oEvent)
{
	switch(oTab.Key)
	{
		case "ADV":								 
			SCF("ADV","mskSSNo",81);		
			break;	
		case  "BSC":
			SCF("BSC","cddNameType",8);		
			break;	
	}	
}

function srchTlb_Click(oToolbar, oButton, oEvent)
{ 		
	switch(oButton.Key)
	{	
		case "AddNew" :
				var strURL = glbSitePath + "/Inmate/frmName.aspx?hdnMode=ADD";
				openStdWin(strURL,"NamesADD",820,605);
				break;
								
		case "Refresh" :
				ClearAll();
				break;				
	}
}

