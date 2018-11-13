using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using KPI.PhoenixWeb.Inmate.UserControls;
using System;
using System.Data;
using System.Web.UI;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicalLogSrch.
    /// </summary>
    public partial class frmMedicalLogSrch : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            try
            {
                if (!Page.IsPostBack)
                {
                    DispScr(false);
                }
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

 

        protected void tlbGridItem_ButtonClicked(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs be)
        {
            try
            {
                switch (be.Item.Key)
                {
                    case "BACK":
                        cmdBkSearch_Click();
                        break;

                    case "SEARCH":
                        cmdSearch_click();
                        break;

                    case "RESET":
                        ClearData();
                        break;

                    case "PRINT":
                        PrintScr();
                        break;

                    case "EXCEL":
                        cmdExcel();
                        break;
                }
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void cmdSearch_click()
        {
            try
            {
                DisplayRecard();
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        private DataSet GetData(bool blnExcel)
        {
            try
            {
                JMMMedicalHist objJmmMedical = new JMMMedicalHist();
                usrMedLogBasicSrch objusrMedLogBasicSrch = (usrMedLogBasicSrch)this.tabMedLogSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedLogBasicSrch1");
                objusrMedLogBasicSrch.ReadScr(ref objJmmMedical);
                JmmMedPresHistBL objMedPresHistBL = new JmmMedPresHistBL();
                return objMedPresHistBL.SearchAllMedication(objJmmMedical);
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        protected void DisplayRecard()
        {
            try
            {
                DataSet ds = null;
                JMMMedicalHist objJmmMedical = new JMMMedicalHist();
                usrMedLogBasicSrch objusrMedLogBasicSrch = (usrMedLogBasicSrch)this.tabMedLogSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedLogBasicSrch1");
                objusrMedLogBasicSrch.ReadScr(ref objJmmMedical);
                JmmMedPresHistBL objMedPresHistBL = new JmmMedPresHistBL();
                ds = objMedPresHistBL.SearchAllMedication(objJmmMedical);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    DispScr(false);
                    ShowMsg(MsgType.Info, FrwkMsg.NO_RECORD_FOUND);
                }
                else
                {
                    grdMedLog.DataSource = ds;
                    grdMedLog.DataBind();
                    DispScr(true);
                }
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        protected void cmdBkSearch_Click()
        {
            try
            {
                pnlSearch.Visible = true;
                pnlSearchResults.Visible = false;
                hdnBack.Value = "BACK";
                DispScr(false);
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        protected void DispScr(bool blnSrchResults)
        {
            try
            {
                tlbGridItem.Items.FindNavItemByKey("Search").Text = blnSrchResults == true ? "Refresh" : "Search";
                tlbGridItem.Items.FindNavItemByKey("Search").ToolTip = blnSrchResults == true ? "Refresh" : "Search";
                tlbGridItem.Items.FindNavItemByKey("Back").Enabled = (blnSrchResults);
                tlbGridItem.Items.FindNavItemByKey("Reset").Enabled = (!blnSrchResults);
                pnlSearch.Visible = (!blnSrchResults);
                pnlSearchResults.Visible = (blnSrchResults);
            }
            catch (Exception)
            {
                throw;
            }
        }



        #region Excel

        protected void cmdExcel()
        {
            try
            {
                DataSet objDS = GetData(true);
                objDS.Tables[0].Columns.Add("MedDateTime", Type.GetType("System.String"));
                for (int iCount = 0; iCount < objDS.Tables[0].Rows.Count; iCount++)
                {
                    if (objDS.Tables[0].Rows[iCount]["ACTIVITYDTTM"].ToString() != null)
                    {
                        DateTime objdate = KPIHlp.CVDttm(objDS.Tables[0].Rows[iCount]["ACTIVITYDTTM"].ToString());
                        objDS.Tables[0].Rows[iCount]["MedDateTime"] = objdate.ToString("MM/dd/yy HH:mm");
                    }
                }
                ExportToExcel(ref objDS, grdMedLog.GetExcelColumns(), "MedicalLogInquiry.xls");
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        #endregion Excel

        protected void grdMedLog_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {
                int iRow = e.Row.Index;
                if (e.Row.Items.FindItemByKey("Emp").Text != "")
                    e.Row.Items.FindItemByKey("Emp").Tooltip = e.Row.Items.FindItemByKey("FullName").Text;

                if (grdMedLog.GetDateTime(iRow, "ACTIVITYDTTM") != DateTime.MinValue)
                {
                    DateTime objdate = grdMedLog.GetDateTime(iRow, "ACTIVITYDTTM");
                    grdMedLog.SetValue(iRow, "MedDateTime", objdate.ToString("MM/dd/yy HH:mm"));
                }
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

    

        protected void grdMedLog_lnkbtnPrev_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(-1);
            grdMedLog.KPIGrdPageIndexChanged(sender, eventArgs);
            DisplayRecard();
        }

        protected void grdMedLog_lnkbtnNext_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(1);
            grdMedLog.KPIGrdPageIndexChanged(sender, eventArgs);
            DisplayRecard();
        } 
 
    }
}

