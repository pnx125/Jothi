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

using KPI.Phoenix.WebControls;
using KPI.Phoenix.Helper;
//using KPI.Phoenix.Global;

using KPI.Framework.Object.Setup;
using KPI.Framework.Setup;

using Infragistics.WebUI.UltraWebTab;  
using Infragistics.WebUI.UltraWebGrid; 

namespace KPI.PhoenixWeb.Inmate
{
	/// <summary>
	/// Summary description for frmInformation.
	/// </summary>
	public partial class frmInformation : BasePage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			cmdAddDL.Attributes.Add("onclick", "return fn_DLGridManip_Row();");   
			cmdClearDL.Attributes.Add("onclick", "return fn_CancelEditDLRow();");  
            
			cmdAddDOB.Attributes.Add("onclick","return fn_DOBGridManip_Row();");
			cmdClearDOB.Attributes.Add("onclick","return fn_CancelEditDOBRow();");   

			cmdAddSSNo.Attributes.Add("onclick" , "return fn_SSNoGridManip_Row();");   
			cmdClearSSNo.Attributes.Add("onclick","return fn_CancelEditSSNoRow();");  

			cmdInternalSave.Attributes.Add("OnClick", "glbCtrlClicked = 'Save'; return fn_ValidateScreen();"); 
			cmdInternalRefresh.Attributes.Add("onclick","TabSave('Information', false);");

			//if(!Page.IsPostBack)
				//LoadData();
		}

		

		protected void LoadData()
		{
			try
			{
				if((Request.QueryString.Get("NameID") != null)&&(Request.QueryString.Get("NameID") != string.Empty))   
				{				 
					hdnNameID.Value = Request.QueryString.Get("NameID");				
				}
				if((Request.QueryString.Get("hdnCaller") != null)&&(Request.QueryString.Get("hdnCaller") != string.Empty))
				{
					hdnCaller.Value = Request.QueryString.Get("hdnCaller");
				}
				if((Request.QueryString.Get("JurisID") != null)&&(Request.QueryString.Get("JurisID") != string.Empty))
				{
					hdnJurisID.Value = Request.QueryString.Get("JurisID");   				
				}

				string strhdnMode ="";

				if(!((Request.QueryString.Get("hdnMode") == null)&&(Request.QueryString.Get("hdnMode") == string.Empty)))   
					strhdnMode = Request.QueryString.Get("hdnMode").Trim();

				if(strhdnMode != string.Empty && strhdnMode != null)
					hdnMode.Value = strhdnMode;	
				else		
					hdnMode.Value = UIMode.CHG.ToString();

			}
			catch(Exception objError)
			{
				ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL,objError); 
			}						

			
			if(State.GPV((int)GeoParams.DefaultState,GetPageJuris()) != string.Empty) 
			{
				cddDLState.Coded =State.GPV((int)GeoParams.DefaultState,GetPageJuris());
			}	
			//Inquiry(Convert.ToInt64(hdnNameID.Value));				
			SetFocus((WebControl)txtDLNo); 

		}

	}
}

//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDLNo;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSSNo;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDOB;
//PNX  protected KPI.Global.KPIWebControls.KPILabel KPILabel1;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtADLNo;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblActual;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtASSNo;
//PNX  protected KPI.Global.KPIWebControls.KPILabel KPILabel2;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtActualDOB;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtDLNo;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddDLState;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddDL;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearDL;
//PNX  protected KPI.Global.KPIWebControls.KPIMaskEdit mskSSNo;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddSSNo;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearSSNo;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtcDOB;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddDOB;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearDOB;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdDLNo;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdSSNo;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdDOB;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalSave;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalRefresh;
//PNX  protected System.Web.UI.WebControls.Panel pnlTblInternal;
//PNX  protected KPI.Global.KPIWebControls.KPILiteral lblErrorMsg;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnJurisID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNameID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCaller;
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