using KPI.Global;
using System;


namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicationRequiredListing.
    /// </summary>
    public partial class frmMedicationRequiredListing : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
        }
        protected void grdMedreqlist_lnkbtnPrev_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(-1);
            grdMedreqlist.KPIGrdPageIndexChanged(sender, eventArgs);
        }

        protected void grdMedreqlist_lnkbtnNext_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(1);
            grdMedreqlist.KPIGrdPageIndexChanged(sender, eventArgs);
        } 
    }
}

