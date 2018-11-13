namespace KPI.PhoenixWeb.Inmate.UserControls
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using KPI.Phoenix.Helper;  

	using KPI.Global;
	using KPI.Global.Helper;
	using KPI.Framework.Object.Setup;   
	using KPI.Framework.Setup;  
	using KPI.Global.StateMachine; 

	using Infragistics.WebUI.UltraWebGrid ; 

	/// <summary>
	///		Summary description for usrAddresses.
	/// </summary>
	public partial class usrAddresses : System.Web.UI.UserControl
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAddress;
//PNX  protected KPI.Phoenix.WebControls.AddressCtrl adrAdditionalAddr;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblCity;
//PNX  protected KPI.Global.KPIWebControls.KPICustomCSZ custCSZ;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupAddrCountry;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblType;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddType;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblTelephone;
//PNX  protected KPI.Global.KPIWebControls.KPICustomPhone custAddressPhone1;
//PNX  protected KPI.Global.KPIWebControls.KPICustomPhone custAddressPhone2;
//PNX  protected KPI.Global.KPIWebControls.KPILabel Kpilabel2;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtcDeleteDate;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddAddress;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearAddress;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdAddress;
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
*************PNX****/