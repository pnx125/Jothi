using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.AppException;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;
//using KPI.Global.

using KPI.Phoenix.WebControls;
using KPI.Phoenix.Helper;
//using KPI.Phoenix.Global;

using KPI.Framework.Object.Setup;
using KPI.Framework.Setup;

using KPI.PhoenixWeb.Inmate.UserControls;


using Infragistics.WebUI.UltraWebTab;  
using Infragistics.WebUI.UltraWebGrid; 


namespace KPI.PhoenixWeb.Inmate
{
	/// <summary>
	/// Summary description for frmName.
	/// </summary>
	public partial class frmName : BasePage
	{

		public bool fAdd = false;
		public bool fInquiry = false;
		public bool fChange = false;
		public bool fRemove = false;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			try
			{
				cmdSaveNClose.Attributes.Add("OnClick", "glbCtrlClicked = 'Save'; return fn_ValidateScreen();");
				cmdSave.Attributes.Add("OnClick",  "glbCtrlClicked = 'Save'; return fn_ValidateScreen();");
				txtNID.Attributes.Add("onKeyDown", "return RestrictKey('A','J','O');"); 
				txtNID.Attributes.Add("OnBlur", "doChangeCaps(this);");  
				txtNameID.Attributes.Add("onkeydown", "return AlphabetValidation('txtNameID','1')");

				if(!Page.IsPostBack)
				{
					//Loading the image of the Name - front view if present
					imgNameFrontView.GenerateImage(true, ImgType.FrontView, ImgRefType.Names,
						-1, short.MinValue);

					LoadData(); 
				}

				//txtNameID.Attributes.Add("onblur", " return VerifyNameTypeID();");   

				if(adrMainAddress.IsValidated)
					AddClientOnLoadScript("nDisable('custHeaderCSZ',95)");

				AddClientOnLoadScript("SetFocus()");
			}
			catch(Exception objErr)
			{
				ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr); 
			}
		}

		protected void LoadData()
		{
			if(Request.QueryString.Get("hdnCaller")!= null)
			{
			
				hdnCaller.Value = Request.QueryString.Get("hdnCaller");  
				hdnAssocID.Value = Request.QueryString.Get("AssocID"); 
				//for RptNames there is no onblur Names Verification Required.
				custNames.IsMain = false;  
			}
			
			try
			{
				if(Request.QueryString.Get("NameType")!= null)
				{
					string strNameType = Request.QueryString.Get("NameType").Trim();
					if(Request.QueryString.Get("CtrlName")!=null)
					{
						hdnCtrlName.Value = Request.QueryString.Get("CtrlName").Trim(); 					
						

						tabNames.ShowTab("Main", true) ;
						tabNames.ShowTab("Physical", true);
						tabNames.ShowTab("Addresses", false);
						tabNames.ShowTab("Employer", false);
						tabNames.ShowTab("Family", false);
						tabNames.ShowTab("Alias", false); 
						tabNames.ShowTab("Information",false);
						tabNames.ShowTab("Gang",false);
						tabNames.ShowTab("Activity",false);
						tabNames.ShowTab("Comments",false);
						//tabNames.ShowTab("Attach",false);
						tabNames.ShowTab("Associates",false);  
						tabNames.ShowTab("Visitors", false);
						tabNames.ShowTab("Warrants", false);
						tabNames.ShowTab("History", false);
						//tabNames.ShowTab("Business",false);
						//tabNames.ShowTab("Contacts",false);
						//tabNames.ShowTab("Court",false);
						txtNID.Text = strNameType.Trim();						
						hdnOName.Value = "1";  
						//AddClientOnLoadScript("CheckBusinessName()");						
					}
				}
				else
				{
					hdnIsMenu.Value = "1"; //to know whether the page is caled from the NameEntry Menu.
				}

				if(Request.QueryString.Get("hdnIsCtrl")!= null)
				{
					hdnIsCtrl.Value = Request.QueryString.Get("hdnIsCtrl"); 
					hdnCtrlName.Value = hdnIsCtrl.Value;   
				}
			}
			catch(Exception objError)
			{
				ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL,objError); 
			}						

			string strhdnMode ="";

			if(hdnMode.Value != string.Empty)
				strhdnMode = hdnMode.Value;	
			else		
				strhdnMode = UIMode.ADD.ToString();

			if(Request.QueryString.Get("hdnMode") != null)
				strhdnMode = Request.QueryString.Get("hdnMode").Trim();

			
			//sKGIS = Request.QueryString.Get("KGIS");
			//sJuris = Request.QueryString.Get("hdnJurisId");
		  
			if(strhdnMode == UIMode.CHG.ToString())
			{
				//SetFocus((WebControl)custNames);
				hdnMode.Value = UIMode.CHG.ToString();
				if((Request.QueryString.Get("NameID").Trim() != null)&&(Request.QueryString.Get("NameID").Trim() != string.Empty))
				{
					hdnNameID.Value = Request.QueryString.Get("NameID").Trim();				
				}
				//txtNID.CssClass = "ReadOnlyText";
				txtNID.ReadOnly = true; 
				txtNID.KPISecurity ="I";
				txtNameID.KPISecurity ="I"; 				
				ClearData();
				GetScreenFeatures(); 
			//	ChkDoNotShare(sKGIS,sJuris);
			//	Inquiry(hdnNameID.Value);				
			}
			else
			{
				SetFocus((WebControl)txtNID);
				hdnMode.Value = UIMode.ADD.ToString() ;		
				string strNameType = "";
				hdnNameID.Value = "";
				if((Request.QueryString.Get("NameType") == null)||(Request.QueryString.Get("NameType")=="MNI"))
				{

					if(Request.QueryString.Get("NameType") == null)
					{
						strNameType = "MNI";
					}
					else
						strNameType = Request.QueryString.Get("NameType").Trim();

					
//					if(strNameType == "MNI")
//					{
//						tabNames.ShowTab("Main", true) ;
//						tabNames.ShowTab("Physical", true);
//						tabNames.ShowTab("Addresses",true);
//						tabNames.ShowTab("Alias", true); 
//						tabNames.ShowTab("Employer", false);
//						tabNames.ShowTab("Family", false);
//						tabNames.ShowTab("Information",false); 							
//						tabNames.ShowTab("Gang",false); 
//						tabNames.ShowTab("Activity",false);
//						tabNames.ShowTab("Comments",false);
//						tabNames.ShowTab("Attach",false);
//						tabNames.ShowTab("Associates",false);  
//						tabNames.ShowTab("Visitors", false);
//						tabNames.ShowTab("Warrants", false);
//						tabNames.ShowTab("History", false);
//						//tabNames.ShowTab("Business",false);
//						//tabNames.ShowTab("Contacts",false);
//						//tabNames.ShowTab("Court",false);
//					}

				}
				ClearData();
				ShowTabs(true);
				custHeaderCSZ.City= "";
				
				custHeaderCSZ.Zip = "";
 
				txtNID.KPISecurity = "AC";
				txtNameID.KPISecurity = "AC"; 
				if(State.GPV((int)GeoParams.DefaultState,GetPageJuris()) != string.Empty) 
				{
					custHeaderCSZ.State = State.GPV((int)GeoParams.DefaultState,GetPageJuris()); 
				}
				else
					custHeaderCSZ.State = "";


				//TrackerNo:2128 By Ravikumar on 26-07-2006
				if(State.GPV((int)GeoParams.DefaultCountry,GetPageJuris()) != string.Empty) 
					lupCountry.CodeValue = State.GPV((int)GeoParams.DefaultCountry,GetPageJuris());
				else
					lupCountry.CodeValue = "";
	

				usrMain objMain = (usrMain)this.tabNames.FindControl("usrMain1");
				objMain.SetDefaultState();
					

				if(hdnCtrlName.Value != null)
				{
					if(Request.QueryString.Get("NewLastName")!= null)
					{
						// '&' replaced with '~~~' to get the new name like "M&I Pvt Ltd"
						//CRM# 227: Move to CRM(1391) - Name control Issue - by sundar
						custNames.LastName = Request.QueryString.Get("NewLastName");
						custNames.LastName = custNames.LastName.Replace("~~~", "&");
					}
					if(Request.QueryString.Get("NewFirstName")!= null)
					{
						custNames.FirstName = Request.QueryString.Get("NewFirstName");
						custNames.FirstName = custNames.FirstName.Replace("~~~", "&");
					}
				}

				if(Request.QueryString.Get("LastName")!= null)
					custNames.LastName = Request.QueryString.Get("LastName");
				  
				if(Request.QueryString.Get("FirstName")!= null)
					custNames.FirstName = Request.QueryString.Get("FirstName");

				if(Request.QueryString.Get("MiddleName")!= null)
					custNames.MiddleName = Request.QueryString.Get("MiddleName");

				/*if(Request.QueryString.Get("NameSuffix")!= null)
					custNames.NameSuffix = Request.QueryString.Get("NameSuffix");*/

				//State.s 
				imgNameContacts.Visible = false;
			}			
		}

		protected void GetScreenFeatures()
		{		
			RepositoryBL objRepMgr = new RepositoryBL();
			//TODO Feature Id should eb replaced with proper enum
			string FeatureID = "2230";
			string JuvenileMsg = "";
			DataSet objSysRepositoryPermissionDS = objRepMgr.GetRepoScreenSecurity(FeatureID, GetPageJuris());
			//Retrieve the screen level security & check whether permissions were applied
			DataRow objScreenUserSecurityDR = KPI.Global.Helper.Framework.GetDSColumnVal(ref objSysRepositoryPermissionDS, "RepositoryID", FeatureID);
			//Retreiving the User level security assigned for the screen

			if(objScreenUserSecurityDR != null)
			{
				if(Convert.ToInt32(objScreenUserSecurityDR["KAdd"]) == 1)	
					fAdd = true;
				if(Convert.ToInt32(objScreenUserSecurityDR["Inquiry"]) == 1)	
					fInquiry = true;
				if(Convert.ToInt32(objScreenUserSecurityDR["KChange"]) == 1)	
					fChange = true;
				if(Convert.ToInt32(objScreenUserSecurityDR["Remove"]) == 1)	
					fRemove = true;
			}
			if(!(fInquiry))
			{
				MessagesBL objMsg = new MessagesBL(); 
				Messages objMessages = objMsg.Select((int)NameMsg.NMSMsg_NO_JUVENILE);   
				JuvenileMsg = objMessages.DefaultMsg; 
			}

		}

		protected void SetClientParams()
		{
			SendParamToClient((int)NameParams.AgeofMajority);
			SendParamToClient((int)NameParams.JacketNo);
			SendParamToClient((int)RecParams.AddRptNamesAsMainNames);
			SendParamToClient((int)GeoParams.DefaultState);
			SendParamToClient((int)GeoParams.DefaultCountry);
			//AllowDuplicationNameForAJType = 613,
			//AllowDuplicationNameForOType = 614,
			// AllowDuplicationNameForBType = 615

			SendParamToClient((int)NameParams.AllowDuplicationNameForAJType);
			SendParamToClient((int)NameParams.AllowDuplicationNameForOType);
			SendParamToClient((int)NameParams.AllowDuplicationNameForBType);

		}


		private bool ValidateParams()
		{
			return true;
		}

		protected override void OnPreRender(EventArgs e)
		{
			//Sending the params values to the client
			SetClientParams();
			base.OnPreRender (e);
		}

		protected void ShowTabs(bool blnTabs)
		{
			tabNames.ShowTab("Main", blnTabs) ;
			tabNames.ShowTab("Physical", blnTabs);
			tabNames.ShowTab("Addresses", blnTabs);
			tabNames.ShowTab("Alias", blnTabs); 
			tabNames.ShowTab("Employer", blnTabs);
			tabNames.ShowTab("Information", blnTabs);
			tabNames.ShowTab("Gang", blnTabs);
			tabNames.ShowTab("Comments", blnTabs);
			tabNames.ShowTab("Associates", blnTabs);
			tabNames.ShowTab("Visitors", blnTabs);
			tabNames.ShowTab("Warrants", blnTabs);
			tabNames.ShowTab("History", blnTabs);
			tabNames.ShowTab("Activity", blnTabs);							
		}


		
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdSave;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdSaveNClose;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdPrint;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdRefresh;
//PNX  protected KPI.Global.KPIWebControls.KPIAccessControl alcName;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton imgNameContacts;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblJuris;
//PNX  protected KPI.Global.KPIWebControls.KPIJurisDropDownList lstJuris;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblID;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtNID;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtNameID;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton imgWantBtn;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblNameType;
//PNX  protected KPI.Global.KPIWebControls.KPIDropDownList cmbNameType;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lbldeceased;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtcDeceased;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton imgNameFrontView;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblNames;
//PNX  protected KPI.Global.KPIWebControls.KPICustomName custNames;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAddress;
//PNX  protected KPI.Phoenix.WebControls.AddressCtrl adrMainAddress;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblCity;
//PNX  protected KPI.Global.KPIWebControls.KPICustomCSZ custHeaderCSZ;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupCountry;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblTelephone;
//PNX  protected KPI.Global.KPIWebControls.KPICustomPhone cusHeaderPhone1;
//PNX  protected KPI.Global.KPIWebControls.KPICustomPhone cusHeaderPhone2;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsKGIS;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtcPhotoDate;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton imgphoto;
//PNX  protected KPI.Global.KPIWebControls.KPILiteral lblErrorMsg;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnBusinessType;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnBusinessId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAddrMoreID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCaller;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNameID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnPrimeTypeID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnPrimeType;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAssocID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnOName;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnSelNameID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCtrlName;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnTab;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnLJurisId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnIsMenu;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnFNDictID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnFNCount;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAliasDictID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAliasFNCount;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnPrevAddress;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnChgAddr;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnIsCtrl;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnIsPhoto;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnPhotoDttm;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnJacket;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnPhoneNo1;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnPhoneNo2;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAddrDttm;
//PNX  protected KPI.Global.KPIWebControls.KPITab tabNames;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnIsMain;
/****PNX*************  
	#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		protected void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
*************PNX****/