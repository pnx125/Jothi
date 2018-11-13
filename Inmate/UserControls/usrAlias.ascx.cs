namespace KPI.PhoenixWeb.Inmate.UserControls
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using KPI.Global;
	using KPI.Global.KPIWebControls; 
	using KPI.Global.Helper;
	using KPI.Global.AppException;
	using KPI.Global.StateMachine;

	using KPI.Framework.Object.Setup;
	using KPI.Framework.Setup; 	

	//using KPI.Phoenix.Global;
	using KPI.Phoenix.Helper; 

	/// <summary>
	///		Summary description for usrAlias.
	/// </summary>
	public partial class usrAlias : System.Web.UI.UserControl
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		

		protected void chkMaiden_CheckedChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPICustomName cstNames;
//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkMaiden;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddAlias;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearAlias;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdAlias;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblaliasesnicknmes;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAliasNames;
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
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		protected void InitializeComponent()
		{
			this.chkMaiden.CheckedChanged += new System.EventHandler(this.chkMaiden_CheckedChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
*************PNX****/