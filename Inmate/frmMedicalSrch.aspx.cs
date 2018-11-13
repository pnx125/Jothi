using Infragistics.Web.UI.GridControls;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;

using KPI.Phoenix.Helper;

using KPI.Phoenix.Object.Inmate;
using KPI.PhoenixWeb.Inmate.UserControls;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using KPI.Global.KPIWebControls;
using KPI.Framework.Setup;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicalSrch.
    /// </summary>
    public partial class frmMedicalSrch : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            #region Added By Jothiraj for load the grid intially Based on the screen height

            if (!String.IsNullOrEmpty(hdnPageHgt.Value))
            {
                string grdHeight = string.Format("{0}px", KPIHlp.CVI32(hdnPageHgt.Value) - 260);
                if (!string.IsNullOrEmpty(grdHeight))
                {
                    grdHeight = grdHeight.ToLower().Replace("px", string.Empty);

                    grdMedicalHist.Height = System.Web.UI.WebControls.Unit.Pixel(Convert.ToInt32(grdHeight));
                }
            }
            iGrdPageSize = GrdPageSize(this.Page, 260);
            #endregion Added By Jothiraj for load the grid intially Based on the screen height

            
            hdnJurisId.Value = KPIHlp.CVS(new CMSHlp().GetPageJurisWithUserCtrl(tabMedSrch.FindTabFromKey("BSC").FindControl("UsrMedicalBasicSrch2")));

            if (!Page.IsPostBack)
            {
                DispScr(false);              

            }
            else if (hdnAutoLoad.Value == "ENTERKEY" || hdnAutoLoad.Value.ToUpper() == "LOAD")
            {
                DisplayRecard();
                hdnAutoLoad.Value = string.Empty;
            }
            if (pnlSearchResults.Visible == true)
            {
                if (hdnAutoLoad.Value == "BACKSPACE")
                {
                    cmdBkSearch_Click();
                    hdnAutoLoad.Value = "";
                }
            }
            if (State.GPV((int)SetupParams.EnableSubAgency,KPIHlp.CVI32(hdnJurisId.Value)) == "1")
            {
                grdMedicalHist.Columns["SubAgencyCode"].Hidden = false;
                hdnSubAgencyParam.Value = "1";

            }
            else
            {
                hdnSubAgencyParam.Value = string.Empty;
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

        protected void tlbGridItem_ButtonClicked(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs be)
        {
            try
            {
                switch (be.Item.Key.ToUpper())
                {
                    case "BACK":
                        cmdBkSearch_Click();
                        break;

                    case "SEARCH":
                        cmdSearch_click();
                        break;

                    case "RESET":
                        Reset();
                        break;

                    case "PRINT":
                        PrintMedical();                        
                        break;

                    case "EXCEL":
                        UltraWebGridExcelExporter1.DownloadName = "Medical History";
                        UltraWebGridExcelExporter1.Export(grdMedicalHist);

                        

                        
                        WrtActivityLog(long.MinValue, " Exporting Medical History to Excel.", "EXL");


                        break;
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected void PrintMedical()
        {
            try
            {
                JmmMedicalHistBL objJmmMedicalBL = new JmmMedicalHistBL();
                JMMMedicalHist objJMMMedicalHist = ReadScr();
               
                // 66954
                State.PageSelectedSubAgency = -1;
                usrMedicalBasicSrch usrMedicalBasicSrchObj = (usrMedicalBasicSrch)this.tabMedSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedicalBasicSrch2");
                KPICodedDropDownList SubAgency = ((KPICodedDropDownList)usrMedicalBasicSrchObj.FindControl("cddSubAgency"));
                if (SubAgency != null && !string.IsNullOrWhiteSpace(SubAgency.CodeValue))
                {
                    State.PageSelectedSubAgency = Convert.ToInt64(SubAgency.CodeValue);
                }

                iGrdPageSize = GrdPageSize(this.Page, 290);
                new JmmMedicalHistBL().MedicalPrintRpt(ref objJMMMedicalHist);
                PrintReport();

                //
                WrtActivityLog(long.MinValue, "MedicalSrch Print", "PRT");
                
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        protected void cmdSearch_click()
        {
            try
            {
                //grdMedical.KPICurrentGrdPageIndex = 1;
                DisplayRecard();
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected bool ValidateScr()
        {
            return true;
        }

        protected JMMMedicalHist ReadScr()
        {
            JMMMedicalHist objJMMMedicalHist = null;
            try
            {
                if (ValidateScr())
                {
                    objJMMMedicalHist = new JMMMedicalHist();

                    usrMedicalBasicSrch usrMedicalBasicSrchObj = (usrMedicalBasicSrch)this.tabMedSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedicalBasicSrch2");
                    usrMedicalBasicSrchObj.ReadScr(ref objJMMMedicalHist);
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return objJMMMedicalHist;
        }

        protected void DisplayRecard()
        {
            DataSet ds = null;
            try
            {
                ds = GetData(false);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    if (grdMedicalHist.GridView.GroupedRows.Count > 0)
                    {
                        grdMedicalHist.CollapseAll();
                        grdMedicalHist.GridView.GroupedRows.Clear();
                        grdMedicalHist.Rows.Clear();
                        grdMedicalHist.GridView.Rows.Clear();
                        grdMedicalHist.GridView.ClearDataSource();
                    }

                    grdMedicalHist.DataBind();
                    
                    if (hdnAutoLoad.Value.ToUpper() != "PRINT")
                    {
                        ShowMsg(MsgType.Error, FrwkMsg.NO_RECORD_FOUND);
                    }
                    cmdBkSearch_Click();                    

                }
                else
                {
                    grdMedicalHist.GridView.ClearDataSource();
                    ds.Tables[0].TableName = "SuperMaster";
                    grdMedicalHist.CollapseAll();
                    grdMedicalHist.DataSource = ds;
                    DispScr(true);
                }

            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected DataSet GetData(bool blnExcel)
        {
            DataSet ds = new DataSet();
            try
            {
                JmmMedicalHistBL objJmmMedicalBL = new JmmMedicalHistBL();
                JMMMedicalHist objJMMMedicalHist = ReadScr();
                //iGrdPageSize = 28;
                iGrdPageSize = GrdPageSize(this.Page, 260);

                if (!blnExcel)
                {
                    objJMMMedicalHist.iPageSize = iGrdPageSize;
                    if (grdMedicalHist.KPICurrentGrdPageIndex <= 0)
                    {
                        grdMedicalHist.KPICurrentGrdPageIndex = 1;
                    }
                    objJMMMedicalHist.iPageNo = grdMedicalHist.KPICurrentGrdPageIndex;
                }
                else
                {
                    objJMMMedicalHist.iPageNo = 1;
                    objJMMMedicalHist.iPageSize = iExcelPageSize;
                }
                ds = objJmmMedicalBL.GetMedicalHist(ref objJMMMedicalHist);
           

            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return ds;
        }

        protected void cmdBkSearch_Click()
        {
            
            hdnBack.Value = "BACK";
            DispScr(false);

            grdMedicalHist.ClearTemplates();
            if (grdMedicalHist.GridView.GroupedRows.Count > 0)
            {
                grdMedicalHist.GridView.GroupedRows.Clear();
                grdMedicalHist.GridView.Behaviors.Sorting.SortedColumns.Clear();
                grdMedicalHist.Rows.Clear();
                grdMedicalHist.GridView.Rows.Clear();
                grdMedicalHist.GridView.ClearDataSource();
            }


            grdMedicalHist.DataBind();
            grdMedicalHist.KPICurrentGrdPageIndex = 1;
        }




        protected void grdMedicalHist_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {
                Infragistics.Web.UI.GridControls.ContainerGridRecord row = (Infragistics.Web.UI.GridControls.ContainerGridRecord)e.Row;
                Infragistics.Web.UI.GridControls.ContainerGrid ownerGrid = row.Owner.ControlMain;
                Infragistics.Web.UI.GridControls.IBand band = ownerGrid.Band;
                if (((ContainerGridRecord)e.Row).Level == 0)
                { 

                    if (State.gMultiJuris && KPIHlp.CVI32(hdnJurisId.Value) != Int32.MinValue && KPIHlp.CVI32(hdnJurisId.Value) != State.sJurisID)
                    {
                        e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Hidden = false;
                        e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Width = Unit.Percentage(5);
                        e.Row.Items.FindItemByKey("FullName").Column.Width = Unit.Percentage(35);

                    }
                    else
                    {
                        e.Row.Items.FindItemByKey("FullName").Column.Width = Unit.Percentage(40);
                        e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Hidden = true;

                    }


                    if (!String.IsNullOrEmpty(hdnSubAgencyParam.Value) && hdnSubAgencyParam.Value == "1")
                    {
                        e.Row.Items.FindItemByKey("SubAgencyCode").Column.Width = Unit.Percentage(5);
                        e.Row.Items.FindItemByKey("SubAgencyCode").Tooltip = e.Row.Items.FindItemByKey("SubAgencyName").Text;
                        e.Row.Items.FindItemByKey("DentistDoctor").Column.Width = Unit.Percentage(20);
                    }
                    else
                    {
                        e.Row.Items.FindItemByKey("DentistDoctor").Column.Width = Unit.Percentage(25);
                        e.Row.Items.FindItemByKey("SubAgencyCode").Column.Hidden = true;
                    }
                }

                else if (((ContainerGridRecord)e.Row).Level == 2)
                {


                    switch (e.Row.Items.FindItemByKey("MasterColumn").Text)
                    {
                        case "Medical Alerts":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Flag";
                            e.Row.Items.FindItemByKey("MedicalVisitNo").Column.Hidden = true;
                            break;
                        case "TB Result":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "TB Result";
                            break;
                        case "Diagnosed Conditions":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Diagnosed Condition";
                            break;
                        case "Drugs":
                            e.Row.Items.FindItemByKey("VisitDttm").Column.Header.Text = "Date Prescribed";
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Drug Name";
                            e.Row.Items.FindItemByKey("MedicalVisitNo").Column.Header.Text = "Balance";

                            if (e.Row.Items.FindItemByKey("IsActive").Text == "1")
                            {
                                e.Row.CssClass = "grdAllergy_row_color";
                            }
                            else
                            {
                                if (!String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("MedicalVisitNo").Text) && KPIHlp.CVI32(e.Row.Items.FindItemByKey("MedicalVisitNo").Text) <= 5)
                                {
                                    e.Row.CssClass = "grdDrugs_row_color";
                                }
                            }
                            break;
                        case "Hospital Facility":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Admitted to Medical Facility";
                            break;
                        case "Dental Procedure":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Procedure";
                            break;
                        case "Special Meal Required":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Special Meal Required";
                            break;
                        case "Allergy":
                            e.Row.Items.FindItemByKey("Description").Column.Header.Text = "Allergy";
                            e.Row.Items.FindItemByKey("MedicalVisitNo").Column.Hidden = true;
                            if(e.Row.Items.FindItemByKey("IsActive").Text == "1")
                            {
                                e.Row.CssClass = "grdAllergy_row_color";
                            }
                            break;
                    }

                   
                }

            }
            catch (Exception)
            {

                throw;
            }
        }


        protected void Reset()
        {
            try
            {
                ClearData();
                UsrMedicalBasicSrch2.Reset();
                UsrMedicalBasicSrch2.LoadSubAgency();

            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

    }
}

