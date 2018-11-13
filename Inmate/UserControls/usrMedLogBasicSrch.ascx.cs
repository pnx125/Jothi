namespace KPI.PhoenixWeb.Inmate.UserControls
{
    using KPI.Global.Helper;
    using KPI.Global.StateMachine;

    //using KPI.Phoenix.Global;
    using KPI.Phoenix.Object.Inmate;
    using System;

    /// <summary>
    ///		Summary description for usrMedLogBasicSrch.
    /// </summary>
    public partial class usrMedLogBasicSrch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            if (!State.gMultiJuris)
            {
                lstJuris.Visible = false;
                lblJuris.Visible = false;
            }
        }

        public void ReadScr(ref JMMMedicalHist objJmmMedical)
        {
            try
            {
                JmmMedPrescribe objJmmMedPres = new JmmMedPrescribe();
                JmmMedPresHist objJmmMedPresHist = new JmmMedPresHist();
                objJmmMedPres.Dosage = cddDosage.CodeValue;
                objJmmMedPres.Drug = cddDrug.CodeValue;
                objJmmMedPres.MedNameID = NamCtrlSPIN.KPIID;
                objJmmMedPres.BuildingID = KPIHlp.CVI64(cddBuilding.CodeValue);
                objJmmMedPres.PodID = lupPod.KPIID;
                objJmmMedPres.CellID = lupCell.KPIID;
                objJmmMedPresHist.OfficerPFID = lupPFID.KPIID;
                objJmmMedPresHist.MethodAdminister = cddMethod.CodeValue;
                objJmmMedPresHist.ActivityDttm = dttAdminFrom.DateValue;
                objJmmMedPresHist.ToDttm = dttAdminTo.DateValue;
                objJmmMedPresHist.Status = cddStatus.CodeValue;
                objJmmMedical.objJmmMedPrescribe = objJmmMedPres;
                objJmmMedical.objJmmMedPresHist = objJmmMedPresHist;
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }
    }
}

//PNX  protected KPI.Global.KPIWebControls.KPILabel lblMethod;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAdminFrom;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddDrug;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddMethod;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupPFID;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddStatus;
//PNX  protected KPI.Global.KPIWebControls.KPIDateTime dttAdminFrom;
//PNX  protected KPI.Global.KPIWebControls.KPIDateTime dttAdminTo;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblpfno;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSPN;
//PNX  protected KPI.Phoenix.WebControls.NameCtrl NamCtrlSPIN;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupPod;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupCell;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddDosage;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDrug;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAdminBy;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDossageLessThan;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblStatus;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblBuilding;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblPod;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblCellNo;
//PNX  protected KPI.Global.KPIWebControls.KPICodedDropDownList cddBuilding;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDaySupply;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblJuris;
//PNX  protected KPI.Global.KPIWebControls.KPIJurisDropDownList lstJuris;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAdminTo;
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

		#endregion Web Form Designer generated code

*************PNX****/