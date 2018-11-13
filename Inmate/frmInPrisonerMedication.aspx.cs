using KPI.Global;
using System;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmInPrisonerMedication1.
    /// </summary>
    public partial class frmInPrisonerMedication : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            cmdAdd.Attributes.Add("onClick", "return fn_ManipMedicationRow();");
            cmdClear.Attributes.Add("onClick", "return fn_CancelMedicationRow();");
            hdnMode.Value = UIMode.CHG.ToString();
        }
        protected void grdInPrisonerMedication_lnkbtnPrev_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(-1);
            grdInPrisonerMedication.KPIGrdPageIndexChanged(sender, eventArgs);
        }

        protected void grdInPrisonerMedication_lnkbtnNext_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(1);
            grdInPrisonerMedication.KPIGrdPageIndexChanged(sender, eventArgs);
        } 
    }
}

