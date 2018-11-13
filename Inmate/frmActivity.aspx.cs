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
	/// Summary description for frmActivity.
	/// </summary>
	public partial class frmActivity : BasePage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdActivity;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNameId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCaller;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblActivity;
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