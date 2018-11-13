using KPI.Global;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicalHistoryBlank.
    /// </summary>
    public partial class frmMedicalHistoryBlank : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            //hdnMode.Value = UIMode.CHG.ToString();
            //AddClientOnLoadScript("openPositionWin(glbSitePath + '/Inmate/frmMedicalHistory.aspx?hdnMode=ADD','MedicalHistory',1020,680,0,0);");
            AddClientOnLoadScript("OpenMedicalHistoryScreen();");
        }
    }
}

