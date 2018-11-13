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

using KPI.Phoenix.Object.Names;
using KPI.Phoenix.Names;

namespace KPI.PhoenixWeb.Inmate
{
	/// <summary>
	/// Summary description for frmVisitors.
	/// </summary>
	public partial class frmVisitors : BasePage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			//if(!Page.IsPostBack)
				//LoadData();
			hdnMode.Value = UIMode.CHG.ToString();
			cmdAddVisitor.Attributes.Add("onclick","return fn_ManipVisitorRow();");  
			cmdClearVisitor.Attributes.Add("onclick","return fn_CancelEditVisitorRow();");
		}

		protected void LoadData()
		{
			try
			{
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
			ClearData();
		}

		

		protected void chkIsKGIS_CheckedChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}

//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected KPI.Global.KPIWebControls.KPIButton Kpibutton1;
//PNX  protected KPI.Global.KPIWebControls.KPIButton Kpibutton2;
//PNX  protected System.Web.UI.WebControls.Panel pnlTblInternal;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalSave;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalRefresh;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblName;
//PNX  protected KPI.Global.KPIWebControls.KPIButton btnNotes;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtAddress;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblRelationShip;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblInActive;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblbgChecked;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkIsVisit;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdVisitor;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dttBackCheck;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblActive;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dttActive;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dttInactive;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddRelation;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddVisitor;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearVisitor;
//PNX  protected KPI.Phoenix.WebControls.NameCtrl custNames;
//PNX  protected KPI.Global.KPIWebControls.KPILiteral lblErrorMsg;
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