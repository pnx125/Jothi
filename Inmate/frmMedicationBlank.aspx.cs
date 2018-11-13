using KPI.Global;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicationBlank.
    /// </summary>
    public partial class frmMedicationBlank : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            AddClientOnLoadScript("fn_OpenMedication();"); //Medication screen should be opened
        }
    }
}

