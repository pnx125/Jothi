var GlbPrm_DefaultState = "501";
function fn_ValidateScreen()
{
	var ctrlClicked = glbCtrlClicked;
	glbCtrlClicked = ""; 

	if(ctrlClicked == "Save")
	{
		if(ValidateScr())
		{
			if(KPIConfirm(KPIMsg_SAVE))
			{
				TabSave("Information", false); 
				return true;
			}
			else
				return false;
		}
		else
			return false;
	}
}

function ValidateScr()
{
	if( nGCV("mskSSNo",80) != "" ) 
		return KPIAlert(FrwkMsg_TABSAVE, nGTT("Information")); 
		
	if( nGCV("txtDLNo")	!= "")
		return KPIAlert(FrwkMsg_TABSAVE, nGTT("Information")); 
		
	if( nGCV("dtcDOB",15)	!= "")
		return KPIAlert(FrwkMsg_TABSAVE, nGTT("Information")); 
			
	return true;
}
