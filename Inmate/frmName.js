
var GlbPrm_AgeofMajority = "601";
var GlbPrm_JacketNo  = "604";
var GlbPrm_RptNames = "747"; //Added in Phoneix.js also to have solve the name control issue.Validate function

var GlbPrm_AllowDupAJType = "613";
var GlbPrm_AllowDupOType = "614";
var GlbPrm_AllowDupBType = "615";
var GlbPrm_DefaultState = "501";

function SetFocus()
{
  if(nGCV("hdnMode") == "ADD")
  {
    //nSCF("custNames",35);
    nSCF("txtNID",1);
  }
}

function fn_ValidateScreen()
{
	var ctrlClicked = glbCtrlClicked;
	glbCtrlClicked = "";

	if(ctrlClicked == "Save")
	{
		if(ValidateScr())
		{
		    CheckAddressChange();
			/*if(!TabSaveAll()) // Later on we can implement.
			{
				if((nGCV("hdnMode") == "ADD")||(nGCV("hdnMode") == "CHG"))
				{
					if(VerifyNames(false))
					{
						return KPIConfirm(KPIMsg_SAVE);
						return true;
					}
					else return false;
				}
				else
				{	if(VerifyNames(false))
					{
					return KPIConfirm(KPIMsg_SAVE);
					return true;
					}
					else return false;
				}
			}
			else
				return false;*/
		}
		else
			return false;
	}
}

function CheckAddressChange()
{
	if((nGCV("hdnMode") == "CHG")&&(nGCV("txtNID") != 'B'))
	{
	   if( nGCV("adrMainAddress",50) != "" )
	   {
			if ((nGCV("adrMainAddress",50) != nGCV("hdnPrevAddress"))&&(nGCV("hdnPrevAddress")!=""))
			{
				if(KPIConfirm(NMSMsg_CHGADDR,nGCV("hdnPrevAddress")+"?"))
				{
					nSCV("hdnChgAddr","1");
				}
				else
				{
	  				nSCV("hdnChgAddr","0");
				}
			}
		}
	}
}

function ValidateScr()
{
	if(!ValidateEditScr())
		return false;
	nEnable("custHeaderCSZ",95);
	return true;
}

function ValidateEditScr()
{
	if((nGCV("custNames",35) == ""))//||(nGCV("custNames",36)== ""))
	{
		KPIAlert(NMSMsg_MANDATORY);
		return false;
	}

	if(trim(nGCV("txtNID")) == 'B')
    {
	  	if(nGCV("custNames",35) == "")
    	{
    		KPIAlert(NMSMsg_BUS_NAME);
    		return false;
    	}
    }
    else
    {
		if(( nGCV("hdnMode")== "CHG" )&&(nGCV("txtNID")== 'O'))
		{
			if( nGCO("cmbNameType").value == "2" )//for B TypeName
			{
				if( nGCV("custNames",35) == "" )
				{
					KPIAlert(NMSMsg_BUS_NAME);
					return false;
				}
				else if( nGCV("custNames",36) != "" )
				{
					if(KPIConfirm(NMSMsg_BUS_LNAME))
					{
						var strName = nGCV("custNames",36)+" "+ nGCV("custNames",35)+ " "+nGCV("custNames",37);
						nSCV("custNames","",36);
						nSCV("custNames","",37);
						nSCV("custNames","",38);
						nSCV("custNames",strName,35);
						return true;
					}
					else
					{
						nSCV("custNames", "", 36);
					}
					return false;
				}
				else if((nGCV("custNames",35) == ""))//||(nGCV("custNames",36)== ""))
				{
					KPIAlert(NMSMsg_MANDATORY);
					return false;
				}
			}
		}
		else if((nGCV("custNames",35) == ""))//||(nGCV("custNames",36)== ""))
		{
			KPIAlert(NMSMsg_MANDATORY);
			return false;
		}
	}


	if( nGCV("adrMainAddress",50) == "" )
    {
		if(nGCV("txtNID")!= 'O')
		{
			KPIAlert(NMSMsg_MAINADDR);
			return false;
		}		
	}
	else if( nGCV("adrMainAddress",61) && (!nIsAddressValidated('adrMainAddress')) )
	{
		KPIAlert(FRecMsg_ADR_VLD);
		nSCF("adrMainAddress",50);
		return false;
	}

	if(GCV("Main","txtEmail") != "")
	{
		if(!isEmailAddr(GCV("Main","txtEmail")))
		{
			KPIAlert(FrwkMsg_INVALID_EMAIL);
			GCO("Main","txtEmail").select();
			return false;
		}
	}

	var strFlag = trim(GCV("Main","cddFlag",8));
	if(strFlag != "")
	{
		KPIAlert( CADMsg_DATA );
		SCF("Main","cddFlag",8);
		return false;
	}
	
	var SMT = trim(GCV("Physical", "lupMarks", 6));
	var SMTDesc = trim(GCV("Physical", "txtSMTDesc", 0));
	
	if( (SMT != "") && (SMT != null) )
	{
		KPIAlert( CADMsg_DATA );
		SCF("Physical", "lupMarks", 6);
	    return false;
	}
	
	if( (SMTDesc != "") && (SMTDesc != null) )
	{
		KPIAlert( CADMsg_DATA );
		SCF("Physical", "txtSMTDesc", 0);
		 return false;
	}


	if(nGCV("dtcDeceased",15) != "")
	{
	    var oDate =new Date(nGCV("dtcDeceased",15));
		var strToDate = new KPIGetCurDttm();
	    if(KPIDateCompare(oDate , ">" ,strToDate))
	    {
			KPIAlert(NMSMsg_DEC_DATE);
			return false;
		}
	}

	var PnType = trim(nGCV("cusHeaderPhone1", 10));
	var PhNbr = trim(nGCV("cusHeaderPhone1", 12));
	
	if(PhNbr != null && PhNbr != "")
	{
		if(PnType == "")
		{
			KPIAlert(NMSMsg_Phn_Type);
			return false;
		}			
	}
	
	var PnType1 = trim(nGCV("cusHeaderPhone2", 10));
	var PhNbr1 = trim(nGCV("cusHeaderPhone2", 12));
	
	if(PhNbr1 != null && PhNbr1 != "")
	{
		if(PnType1 == "")
		{
			KPIAlert(NMSMsg_Phn_Type);
			return false;
		}			
	}
	
	var Pno1 = trim(nGCV("cusHeaderPhone1", 17));
	var Pno2 = trim(nGCV("cusHeaderPhone2", 17));
	if(((Pno1.length < 10)&&(Pno1.length > 0))||((Pno2.length < 10)&&(Pno2.length > 0)))
	{
		 KPIAlert(FrwkMsg_INVALID_PHONENO);
		 return false;
	}

	 var SSno = trim(GCV("Main", "mskSSN", 81));
	 if((SSno.length < 9)&&(SSno.length > 0 ))
	 {
		KPIAlert(FrwkMsg_INVALID_SSNO);
		return false;
	 }

	if(glbProductID != "2")
	{
		if((GPV(GlbPrm_JacketNo) == "3") &&( GCV("Main","txtJacket") == "" )&&( trim(nGCV("txtNID")) != 'B') && (trim(nGCV("txtNID")) != 'O'))
		{
			KPIAlert(NMSMsg_JACKET_NUM);
			return false;
		}
	}

	// Added padma on 15thMay-06 // For track# 3013

	/*if(glbProductID != "2")
	{
		if( nGCV("hdnMode") == "ADD" )
		{
			if( ( GPV(GlbPrm_JacketNo) == "2" ) && ( trim(nGCV("txtNID")) != 'B' ) && ( trim(nGCV("txtNID")) != 'O' ) )
			{
				if(KPIConfirm(NMSMsg_JACKET_NO))
					nSCV("hdnJacket", "YES");
				else
					nSCV("hdnJacket", "NO");
			}
		}
		else
		{
			if(GPV(GlbPrm_JacketNo) == "2")
			{
				if( (trim(nGCV("txtNID")) != 'A') && (trim(nGCV("txtNID")) != 'J') && (trim(nGCV("txtNID")) != 'B') && (nGCO("cmbNameType").value != "-1") )
				{
					if(KPIConfirm(NMSMsg_JACKET_NO))
						nSCV("hdnJacket", "YES");
					else
						nSCV("hdnJacket", "NO");
				}
			}
		}
	}*/

	if( GCV("Alias", "cstNames", 31) != "" )
		return KPIAlert(FrwkMsg_TABSAVE, GTText("Alias"));


	if( GCV("Addresses","adrAdditionalAddr",50) != "" )
		return KPIAlert(FrwkMsg_TABSAVE, GTText("Addresses"));


	if(	GCV("Addresses","custAddressPhone2",16) != "")
			return KPIAlert(FrwkMsg_TABSAVE, GTText("Addresses"));

	if( GCV("Addresses","custAddressPhone1",16)	!= "")
			return KPIAlert(FrwkMsg_TABSAVE, GTText("Addresses"));


	if( trim(nGCV("hdnMode")) == "ADD" )
	{
		if(ValidateFirstName())
		return true;
		else
		return false;
	}

	return true;
}

function ValidateFirstName()
{
	return true;
}

function ValidateJacketNo()
{
	if(glbProductID != "2")
	{
		if( trim(GPV(GlbPrm_JacketNo)) == "3" )
		{
			if((trim(nGCV("txtNID")) == "B")||(trim(nGCV("txtNID")) == "O"))
			{
				//GCO("Main", "txtJacket").disabled = true;
				//GCO("Main", "txtJacket").className = "textboxInactive";
				GCO("Main","lblJacket").style.color = '#000099';
				GCO("Main","lblJacket").style.fontWeight = 'bold';
				Disable("Main", "txtJacket", 0);
			}
			else
			{
				GCO("Main","lblJacket").style.color = '#990000';
				GCO("Main","lblJacket").style.fontWeight = 'bold';
				Enable("Main", "txtJacket", 0);
				//GCO("Main", "txtJacket").disabled = false;
				//GCO("Main", "txtJacket").className = "textbox";
			}
		}
		else if( trim(GPV(GlbPrm_JacketNo)) == "4" )
		{
			if((trim(nGCV("txtNID")) == "B")||(trim(nGCV("txtNID")) == "O"))
			{
				//GCO("Main", "txtJacket").disabled = true;
				//GCO("Main", "txtJacket").className = "textboxInactive";
				Disable("Main", "txtJacket", 0);
			}
			else
			{
				Enable("Main", "txtJacket", 0);
				//GCO("Main", "txtJacket").disabled = false;
				//GCO("Main", "txtJacket").className = "textbox";
			}
		}
	  return  false;
	}	
}

function ValidateDeceasedDate()
{
	if(nGCV("dtcDeceased",15) != "")
	{
	    var oDate =new Date(nGCV("dtcDeceased",15));
		var strToDate = new KPIGetCurDttm();
	    if(KPIDateCompare(oDate , ">" ,strToDate))
	    {
		 KPIAlert(NMSMsg_DEC_DATE);
		 return false;
		}
	}
}

function SetNameType()
{
	if(ValuechangedHandler())
	{
		var  age =  GCV("Main","txtAge");
		var agelimit =  GPV(GlbPrm_AgeofMajority);

		 if((agelimit == undefined)||(agelimit == ""))
		 {
			KPIAlert("Age of Majority is not having any Data.Default Value set as 18");
			agelimit = 18;
			//return false;
		 }

		 var nameID  = nGCV("txtNID");

		if( parseInt(age) > parseInt(agelimit))
		{
			if( nameID == "")
			{
				nSCV("txtNID","A");
			}
			else if((nameID != "A")&&(nameID != "O"))
			{
				if(KPIConfirm(NMSMsg_ADULT))
					nSCV("txtNID","A");
			}
		}
		else if( parseInt(age) < parseInt(agelimit))
		{
			if( nameID == "" )
			{
				nSCV("txtNID","J");
			}
			else if((nameID != "J")&&(nameID != "O"))
			{
  			   if(trim(GPV(GlbPrm_DefaultState))== "WI")
   				{
  					if(KPIConfirm(NMSMsg_WI_JUV))
   					{
   						nSCV("txtNID","J");
			   		}
			   	}
			   	else
			   	{
			   		if(KPIConfirm(NMSMsg_JUVENILE))
			   			nSCV("txtNID","J");
			   	}
			}
		}
	}
}

function ValuechangedHandler()
{
	if(GCV("Main","dtDOB",15) == "")
		SCV("Main","txtAge","");

	var  age = GCV("Main","txtAge");
	var oDate =new Date(GCV("Main","dtDOB",15));
	var strToDate = new KPIGetCurDttm();

	if(KPIDateCompare(oDate , "<=" ,strToDate))
	 {
	    if(oDate != null)
	    {
			if(strToDate.getMonth() <= oDate.getMonth())
			{
				if((strToDate.getMonth() == oDate.getMonth()) && (strToDate.getDate() < oDate.getDate()))
					age = (strToDate.getFullYear() - oDate.getFullYear()) - 1;
				else if((strToDate.getMonth() == oDate.getMonth()) && (strToDate.getDate() >= oDate.getDate()))
				    age = strToDate.getFullYear() - oDate.getFullYear();
				else
					age = (strToDate.getFullYear() - oDate.getFullYear()) - 1;
			}
			else
			{
				age = strToDate.getFullYear() - oDate.getFullYear();
			}
			if(parseInt(GCV("Main","dtDOB",15).substring(0,2)) > 12)
				SCV("Main","txtAge","");
			else
				SCV("Main","txtAge",age);
		}
	 }
	else if((GCV("Main","dtDOB",15) != "") && (KPIDateCompare(oDate , ">" ,strToDate)) &&
			(parseInt(GCV("Main","dtDOB",15).substring(0,2)) <= 12))
	{
		SCV("Main","txtAge","");
		KPIAlert(NMSMsg_DOB);
		SCV("Main","dtDOB","",15)
	}
	return true;
}

function fn_AfterSelectedTab(owner, tabItem,evnt)
{
	switch(tabItem.Key)
	{
		case "Main":
			SCF("Main","cddFlag",9);
			break;
		case "Physical":
			SCF("Physical","txtHeight");
			break;
		case "Alias":
			SCF("Alias","cstNames",35);
			break;
		case "Addresses":
			SCF("Addresses","adrAdditionalAddr",50);
			break;
	}
			
	
	if( tabItem.getText().indexOf("Emp/") >= 0 )
	{
		var sRecordsURL = glbSitePath + "/Records/frmCBENames.aspx";
//		sQS = "?AssoType=NAMBUS&AssoID=" + nGCV("hdnNameID")+"&hdnJurisId="+glbPageJuris+ "&Internal=True&TabKey=Employer&hdnCaller="+nGCV("hdnCaller")+"&ReportId="+nGCV("hdnAssocID")+"&ScreenId=2215&hdnMode="+nGCV("hdnMode")+"&GRDHeight=110";
		sQS = "?AssoType=NAMBUS&hdnJurisId="+glbPageJuris+ "&Internal=True&TabKey=Employer&ScreenId=8517&GRDHeight=110";
		tabItem.setTargetUrl(sRecordsURL + sQS);
	}

	if(tabItem.getText().indexOf("Family") >= 0)
	{
		var sRecordsURL = glbSitePath +"/Records/frmCBENames.aspx";
		//sQS = "?AssoType=NAMFLY&AssoID=" + nGCV("hdnNameID")+"&hdnJurisId="+glbPageJuris+ "&Internal=True&TabKey=Family&hdnCaller="+nGCV("hdnCaller")+"&ReportId="+nGCV("hdnAssocID")+"&ScreenId=2214&hdnMode="+nGCV("hdnMode")+"&GRDHeight=110";
		sQS = "?AssoType=NAMFLY&hdnJurisId="+glbPageJuris+ "&Internal=True&TabKey=Family&ScreenId=8516&GRDHeight=110";
		tabItem.setTargetUrl(sRecordsURL + sQS);
	}
	if(tabItem.getText().indexOf("Info") >= 0)
	{
		var strURL =  "/Inmate/frmInformation.aspx?hdnJurisId="+glbPageJuris;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}

	if(tabItem.getText().indexOf("Gang")>= 0)
	{
		var strURL =  "/Inmate/frmNameGang.aspx?hdnJurisId="+glbPageJuris;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}

	if(tabItem.getText().indexOf("Activity")>= 0)
	{
		var strURL =  "/Inmate/frmActivity.aspx?hdnJurisId="+glbPageJuris ;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}
	if(tabItem.getText().indexOf("Comments")>= 0)
	{
		var strURL =  "/Inmate/frmNameComments.aspx?hdnJurisId="+glbPageJuris+"&GRDHeight=230";
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}
	if(tabItem.getText().indexOf("Associates")>= 0)
	{
		var strURL =  "/Inmate/frmNameAssociates.aspx?hdnJurisId="+glbPageJuris+"&hdnMode="+nGCV("hdnMode")+"&GRDHeight=120";
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}
	if(tabItem.getText().indexOf("History")>= 0)
	{
		var strURL =  "/Inmate/frmNameHistory.aspx?hdnJurisId="+glbPageJuris ;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}	
	if(tabItem.getText().indexOf("Associates")>= 0)
	{
		var strURL =  "/Inmate/frmAssociates.aspx?hdnJurisId="+glbPageJuris;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}
	if(tabItem.getText().indexOf("Warrants")>= 0)
	{
		var strURL =  "/Inmate/frmWarrants.aspx?hdnJurisId="+glbPageJuris;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}
	if(tabItem.getText().indexOf("Visitors")>= 0)
	{
		var strURL =  "/Inmate/frmVisitors.aspx?hdnJurisId="+glbPageJuris ;
		tabItem.getTargetUrl(glbSitePath + strURL);
		tabItem.setTargetUrl(glbSitePath + strURL);
	}
}

	///added by dhaneswari for ading flag value to grid control
	
	
	
	/*========================================================================================================*/
//Flag Grid Manipulation
		grdFlag_EditModeRow = "";
	function fn_FlagGridManip_Row()
	{
			if(grdFlag_Validate())
			{
				if(grdFlag_EditModeRow == "")
				{

					GrdAdd("Main","grdFlag");
					//grdFlag_SetValues(grdFlag_EditModeRow, "A"); //Add mode
				}

			}
			return false;
	}

	function grdFlag_Validate()
	{
			var strFlag = GCV("Main","cddFlag",8)
			if(strFlag  =="")
				{
				  KPIAlert(NMSMsg_SELECT)
				  return false
				}
			var oRows = GrdGAR("Main","grdFlag");
			for(i = 0; i < oRows.length; i++)
			{
				var row = oRows.getRow(i);
				if(strFlag == GrdGCV(row,"Flags"))
				{
					KPIAlert(FrwkMsg_DUPLICATION);
					return false;
				}
			}
			return true;
	}

	function fn_CancelEditFlagRow()
	{
		alert('ins');
		SCV("Main","cddFlag","",8);
		SCF("Main","cddFlag",8);
		return false;
	}

	function grdFlag_AfterRowInsertHandler(gridName, rowId)
	{
		var row = GrdGR(rowId);
		grdFlag_SetValues(row, "A"); //Add mode
	}

	function grdFlag_SetValues(row,Mode)
	{
		GrdSCV(row,"Description",GCV("Main","cddFlag",9));
		GrdSCV(row,"Flags",GCV("Main","cddFlag",8));
		GrdSCV(row, "KPIMode", Mode); //Add Mode
		fn_CancelEditFlagRow();
	}

	function grdFlag_CellClickHandler(gridName, cellId, button)
	{
		if(GrdColKey(cellId) == glbKPIGrdDelKey)
		{
			GrdHandleDel("Main","grdFlag")
		}

	}
	