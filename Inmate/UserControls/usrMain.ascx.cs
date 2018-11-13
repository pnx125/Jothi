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

	using KPI.Framework.Object.Setup;
	using KPI.Framework.Setup; 
 
	using KPI.Global.AppException;
	using KPI.Global.StateMachine;

	//using KPI.Phoenix.Global;  

	using Infragistics.WebUI.UltraWebTab ;  

	/// <summary>
	///		Summary description for usrMain.
	/// </summary>
	public partial class usrMain : System.Web.UI.UserControl
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			//added by dhaneswari
			//cmdAddFlag.Attributes.Add("onclick", "return fn_FlagGridManip_Row()");		
			cmdClearFlag.Attributes.Add("onclick", "return fn_CancelEditFlagRow()");
			
		}

		public void SetDefaultState()
		{
			if(State.GPV((int)GeoParams.DefaultState,((BasePage)this.Page).GetPageJuris()) != string.Empty) 
			{
				string strState = KPIHlp.CVS(State.GPV((int)GeoParams.DefaultState,((BasePage)this.Page).GetPageJuris())); 
				if(strState != string.Empty)
				{
					cddDLState.Coded  = strState; 
					//cddBirthState.Coded = strState;				
				}
			}
		}


		
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPILabel lblFlag;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSBI;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtSBI;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddFlag;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdAddFlag;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdClearFlag;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblBirthDate;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtDOB;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtAge;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblFBI;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtFBI;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblResident;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddResident;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblRace;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblCountry;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupBirthCountry;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSS;
//PNX  protected KPI.Global.KPIWebControls.KPIMaskEdit mskSSN;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblCZShip;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupCitizenship;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDL;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtDL;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddDLState;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblPassport;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtPassport;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblImmigration;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtImmigration;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblFprint;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtFingerPrint;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblMartialStatus;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddMaritalStatus;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDNAType;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtDNAType;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblBirthplace;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtBirthCity;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblStateCounty;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddRace;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddBirthState;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddCounty;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSex;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddSex;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdFlag;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblspnno;
//PNX  protected KPI.Global.KPIWebControls.KPIMaskEdit txtspnno;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddEthnicity;
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