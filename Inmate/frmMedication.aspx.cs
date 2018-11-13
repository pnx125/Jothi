using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;

using KPI.Phoenix.Object.Inmate;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Script.Services;


namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedication.
    /// </summary>
    public partial class frmMedication : BasePage
    {
        

        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                AddClientOnLoadScript("UpdateClock()");

                hdnMode.Value = UIMode.ADD.ToString();
                hdnJurisId.Value = KPIHlp.CVS(GetPageJuris());
                dttmMedicationDate.Value = DateTime.Today;

                if (!String.IsNullOrWhiteSpace(hdnAutoLoad.Value))
                {
                    switch (hdnAutoLoad.Value)
                    {
                        case "ENTERKEY":
                            GetData(false);
                            break;
                        case "ClearGrid":
                            GetData(false);
                            break;
                    }
                    hdnAutoLoad.Value = string.Empty;
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

      

        protected DataSet GetData(bool blnExcel)
        {
            DataSet ds = new DataSet();
            try
            {
                JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
              
                objJMMMedPrescriptionHist.JMBuildID = cddBuilding.CodeValue == null ? long.MinValue : KPIHlp.CVI64(cddBuilding.CodeValue);
                objJMMMedPrescriptionHist.JMPodID = luppod.KPIID;
                objJMMMedPrescriptionHist.JMCellID = lupcell.KPIID;
                objJMMMedPrescriptionHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                DateTime Curdate = DateTime.Now;                
                objJMMMedPrescriptionHist.IsActive = chkShowall.Checked ? KPIHlp.CVI16("1") : KPIHlp.CVI16("0");

                if(objJMMMedPrescriptionHist.JMBuildID.HasValue && !objJMMMedPrescriptionHist.JMPodID.HasValue)
                {
                    objJMMMedPrescriptionHist.JMBuildID = long.MinValue;
                }

                ds = new JMMMedPrescriptionHistBL().GetMedPassHistory(ref objJMMMedPrescriptionHist);

                grdMedreqlist.DataSource = ds;
                grdMedreqlist.DataBind();

                if (grdMedreqlist.Rows.Count <= 0 && String.IsNullOrWhiteSpace(hdnAutoLoad.Value))
                {
                    ShowMsg(MsgType.Error, FrwkMsg.NO_RECORD_FOUND);
                }

            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return ds;
        }

      

        protected void tlbGridItem_ButtonClicked(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs be)
        {
            DataSet objDS = objDS = GetData(true);
                
            
            switch (be.Item.Key.ToUpper())
            {
                case "PRINT":                    
                    PrintScr();
                    break;

                case "EXCEL":
                    grdMedreqlist.Columns["StartTime"].Header.Text = "Schedule Time";
                    grdMedreqlist.Columns["AdministeredDttm"].Header.Text = "Administered Date/Time";
                    ExportToExcel(ref objDS, grdMedreqlist.GetExcelColumns(), "MedPass.xls");                    
                    WrtActivityLog(long.MinValue, " Exporting MED Pass Inquiry to Excel.", "EXL");
                    break;                    
            }
            //AddClientOnLoadScript("fn_GridColorApply(nGCO('grdMedreqlist').control);");
            
        }



        [ScriptMethod()]
        [System.Web.Services.WebMethod()]
        public static string GetMedPassHistory(List<string> arr)
        {

            JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();

            if (KPIHlp.CVI64(arr[0]) != long.MinValue)
            {
                objJMMMedPrescriptionHist.JMBuildID = KPIHlp.CVI64(arr[0]);
            }
            if (KPIHlp.CVI64(arr[1]) != long.MinValue)
            {
                objJMMMedPrescriptionHist.JMPodID = KPIHlp.CVI64(arr[1]);
            }
            if (KPIHlp.CVI64(arr[2]) != long.MinValue)
            {
                objJMMMedPrescriptionHist.JMCellID = KPIHlp.CVI64(arr[2]);
            }
            if (KPIHlp.CVI64(arr[3]) != Int16.MinValue)
            {
                objJMMMedPrescriptionHist.IsActive = KPIHlp.CVI16(arr[3]);
            }
            if (KPIHlp.CVI64(arr[4]) != long.MinValue)
            {
                objJMMMedPrescriptionHist.JurisID = KPIHlp.CVI32(arr[4]);
            }
            
            if(objJMMMedPrescriptionHist.JMBuildID.HasValue && !objJMMMedPrescriptionHist.JMPodID.HasValue)
            {
                objJMMMedPrescriptionHist.JMBuildID = long.MinValue;
            }
            
            DataSet ds = new JMMMedPrescriptionHistBL().GetMedPassHistory(ref objJMMMedPrescriptionHist);
            
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in ds.Tables[0].Columns)
                {
                    row.Add(col.ColumnName, dr[col]);                 
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);



        }



        protected void btnInquiry_Click(object sender, EventArgs e)
        {
            try
            {
                if (!String.IsNullOrWhiteSpace(cddBuilding.CodeValue) && luppod.KPIID != long.MinValue)
                {
                    DataSet objDS = GetData(true);
                    //AddClientOnLoadScript("fn_GridColorApply(nGCO('grdMedreqlist').control);");
                }

            }
            catch (Exception objExp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objExp);
            }
        }




        protected void grdMedreqlist_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {
                if (!String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("JMMedPrescriptionHistID").Text))
                {
                    e.Row.CssClass = "grdGColor";
                }
                else
                {
                    e.Row.CssClass = "grdBcolor";
                }

            }
            catch (Exception objExp)
            {                
                 ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objExp);
            }
        }
}


}
