function fn_ValidateScreen()
{
	if( glbCtrlClicked == "Save")
	{
		if( trim(nGCV("txtDoctorName",0)) == "" )
		{
		    KPIAlert(JMSMsd_PleaseEnter, "Doctor Name");
			nSCF("txtDoctorName");
			return false;
		}
	}
	return true;
}

function fn_chkInActive()
{
   var currdate = "";
   currdate = formatDate(KPIGetCurDttm(), "MM/dd/yy HH:mm:ss");
   if (nGCV('chkInActive', 3))
   {
      nSCV('txtInActive', currdate, 0);
   }
   else
   {
    nSCV('txtInActive', "", 0);
   }
   return true;
 }

function setFocusOnDoctorName()
{
	nSCF("txtDoctorName");
}