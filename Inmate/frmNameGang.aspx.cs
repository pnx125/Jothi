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
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;

using KPI.Phoenix.WebControls;
using KPI.Phoenix.Helper;
//using KPI.Phoenix.Global;

using Infragistics.WebUI.UltraWebGrid;
using Infragistics.WebUI.UltraWebTab;

using KPI.Framework.Setup;
using KPI.Framework.Object.Setup;

namespace KPI.PhoenixWeb.Inmate
{
	/// <summary>
	/// Summary description for frmNameGang.
	/// </summary>
	public partial class frmNameGang : BasePage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			cmdInternalSave.Attributes.Add("OnClick", "glbCtrlClicked = 'Save'; return fn_ValidateScreen();"); 

			cmdAddGang.Attributes.Add("onclick", "return fn_GangGridManip_Row();");   
			cmdClearGang.Attributes.Add("onclick", "return fn_CancelEditGangRow();");
			if (Request.QueryString.Get("hdnCaller") != null )
			{
				hdnCaller.Value = Request.QueryString.Get("hdnCaller");  			
			}
			cmdInternalRefresh.Attributes.Add("onClick","TabSave('Gang', false);");
			if(!Page.IsPostBack)
				LoadData();
		}

		protected void LoadData()
		{
			try
			{
				if(!((Request.QueryString.Get("NameID") != null)&&(Request.QueryString.Get("NameID") != string.Empty)))   
				{				 
					hdnNameID.Value = Request.QueryString.Get("NameID");				
				}

				string strhdnMode ="";

				if(!((Request.QueryString.Get("hdnMode") != null)&&(Request.QueryString.Get("hdnMode") != string.Empty)))   
					strhdnMode = Request.QueryString.Get("hdnMode");

				if(strhdnMode != string.Empty && strhdnMode != null)
					hdnMode.Value = strhdnMode;	
				else		
					hdnMode.Value = UIMode.CHG.ToString();

			}
			catch(Exception objError)
			{
				ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL,objError); 
			}						

			
        
			//strhdnMode = Request.QueryString.Get("hdnMode").Trim();  
			ClearData();
			//Inquiry(Convert.ToInt64(hdnNameID.Value));							
			//hdnMode.Value = UIMode.ADD.ToString() ;		
			//
		}


		
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddGang;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearGang;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblMember;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdGang;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblGang;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddGang;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDate;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtcAffiDate;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSet;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtGangSet;
//PNX  protected KPI.Global.KPIWebControls.KPILabel KPILabel4;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtCriteria;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblActivity;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtActLocation;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblArea;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddPatrol;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsSelf;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsInformation;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsRituals;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsPhotos;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsColors;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsPossession;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsTattoos;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsObserved;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblcomment;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtComments;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalSave;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalRefresh;
//PNX  protected System.Web.UI.WebControls.Panel pnlTblInternal;
//PNX  protected KPI.Global.KPIWebControls.KPILiteral lblErrorMsg;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNameID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCaller;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnJurisID;
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