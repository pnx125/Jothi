using KPI.Framework.Setup;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;
using KPI.Phoenix.Helper;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using KPI.PhoenixWeb.Inmate.UserControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace KPI.PhoenixWeb.Inmate
{
    public partial class frmMarHistorySrch : BasePage
    {
        public Int32 sJurisID = Int32.MinValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                hdnJurisId.Value = KPIHlp.CVS(new CMSHlp().GetPageJurisWithUserCtrl(tabSuspSrch.FindTabFromKey("BSC").FindControl("usrMedMarBasicSrch")));
                #region Added By Jothiraj for load the grid intially Based on the screen height

                if (!String.IsNullOrEmpty(hdnPageHgt.Value))
                {
                    string grdHeight = string.Format("{0}px", KPIHlp.CVI32(hdnPageHgt.Value) - 240);
                    grdMarhistory.Style.Add("height", grdHeight);

                }
                iGrdPageSize = GrdPageSize(this.Page, 260);
                #endregion Added By Jothiraj for load the grid intially Based on the screen height



                if (!Page.IsPostBack)
                {
                    DispScr(false);
                }
                else
                {
                    switch (hdnAutoLoad.Value)
                    {
                        case "LOAD":
                            if (pnlSearch.Visible != true)
                            {
                                GetSelectCriteria();
                            }
                            hdnAutoLoad.Value = "";
                            break;

                        case "ENTERKEY":
                            if (pnlSearch.Visible != true)
                            {
                                GetSelectCriteria();
                            }
                            else
                            {
                                cmdSearch();
                            }
                            hdnAutoLoad.Value = "";
                            break;
                    }

                    if (pnlSearchResults.Visible == true)
                    {
                        if (hdnAutoLoad.Value == "BACKSPACE")
                        {
                            cmdBack();
                            hdnAutoLoad.Value = "";
                        }
                    }
                }
                sJurisID = ((BasePage)Page).GetPageJuris();
                if (State.GPV((int)SetupParams.EnableSubAgency, sJurisID) == "1")
                {
                    grdMarhistory.Columns["SubAgencyCode"].Hidden = false;
                    hdnSubAgencyParam.Value = "1";
                }
                else
                {
                    hdnSubAgencyParam.Value = string.Empty;
                }

            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void tlbGridItem_ItemClick(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs e)
        {
            try
            {
                switch (e.Item.Key.ToUpper())
                {
                    case "BACK":
                        cmdBack();
                        break;

                    case "EXCEL":
                        cmdExcel();
                        break;

                    case "SEARCH":
                        cmdSearch();
                        break;
                    case "RESET":
                        ClearData();
                        usrMedMarBasicSrch objusrMedMarBasicSrch = (usrMedMarBasicSrch)this.tabSuspSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedMarBasicSrch");
                        objusrMedMarBasicSrch.LoadSubAgency();
                        //usrMedMarBasicSrch objusrMedMarBasicSrch = (usrMedMarBasicSrch)this.tabSuspSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedMarBasicSrch");

                        //if (State.GPV((int)SetupParams.EnableSubAgency, KPIHlp.CVI32(hdnJurisId.Value)) == "1")
                        //{
                        //    KPICodedDropDownList SubAgency = ((KPICodedDropDownList)objusrMedMarBasicSrch.FindControl("cddSubAgency"));
                        //    PersonnelBL objPersonnelBL = new PersonnelBL();

                        //    long ObjAgency = objPersonnelBL.GetDefaultAgency(State.sPFID, ((BasePage)Page).GetPageJuris());
                        //    if (ObjAgency != long.MinValue)
                        //    {
                        //        SubAgency.CodeValue = ObjAgency.ToString();                                
                        //        hdnJurisSubAgencyID.Value = ObjAgency.ToString();
                        //    }
                        //}
                        break;
                    case "PRINT":
                        PrintMarHistory();
                        break;

                }
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }


        protected void PrintMarHistory()
        {
            try
            {
                JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
                JMMMedPrescriptionHistBL objJMMMedPrescriptionHistBL = new JMMMedPrescriptionHistBL();
                State.PageSelectedSubAgency = -1;
                usrMedMarBasicSrch objusrMedMarBasicSrch = (usrMedMarBasicSrch)this.tabSuspSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedMarBasicSrch");
                KPICodedDropDownList SubAgency = ((KPICodedDropDownList)objusrMedMarBasicSrch.FindControl("cddSubAgency"));
                if (SubAgency != null && !string.IsNullOrWhiteSpace(SubAgency.CodeValue))
                {
                    State.PageSelectedSubAgency = Convert.ToInt64(SubAgency.CodeValue);
                }
                //
                ReadScr(ref objJMMMedPrescriptionHist);
                objJMMMedPrescriptionHistBL.MarHistoryPrintSrch(objJMMMedPrescriptionHist);
                PrintReport();
                KPITrace.Debug(TraceWeight.Five, "Retrieving info from MarHistorySearch DB");
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void GetSelectCriteria()
        {
            DataSet objResultSet = null;
            try
            {
                objResultSet = GetData(false);
                grdMarhistory.DataSource = objResultSet;
                grdMarhistory.DataBind();

                if (objResultSet.Tables[0].Rows.Count == 0)
                {
                    cmdBack();
                }

                if (grdMarhistory.Rows.Count > 0)
                {
                    DispScr(true);
                    pnlSearch.Visible = false;
                    pnlSearchResults.Visible = true;
                }
                else
                {
                    pnlSearchResults.Visible = false;
                    pnlSearch.Visible = true;
                }
            }
            catch (KPIException objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected DataSet GetData(bool blnExcel)
        {
            JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
            JMMMedPrescriptionHistBL objJMMMedPrescriptionHistBL = new JMMMedPrescriptionHistBL();
            DataSet objDs = new DataSet();
            try
            {
                ReadScr(ref objJMMMedPrescriptionHist);
                iGrdPageSize = GrdPageSize(this.Page, 220);
                objJMMMedPrescriptionHist.iPageSize = iGrdPageSize;              
                
                
                if (!blnExcel)
                {
                    objJMMMedPrescriptionHist.iPageSize = iGrdPageSize;
                    if (grdMarhistory.KPICurrentGrdPageIndex <= 0)
                    {
                        grdMarhistory.KPICurrentGrdPageIndex = 1;
                    }
                    objJMMMedPrescriptionHist.iPageNo = grdMarhistory.KPICurrentGrdPageIndex;
                }
                else
                {
                    objJMMMedPrescriptionHist.iPageNo = 1;
                    objJMMMedPrescriptionHist.iPageSize = iExcelPageSize;
                    
                }
                objDs = objJMMMedPrescriptionHistBL.getMarHistoryDetails(objJMMMedPrescriptionHist);
                KPITrace.Debug(TraceWeight.Five, "Retrieving info from Maillog DB");
            }
            catch (Exception objExp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objExp);
            }
            return objDs;
        }



        protected void cmdSearch()
        {
            try
            {
                tlbGridItem.Items.FindNavItemByKey("Reset").Enabled = false;
                
                grdMarhistory.KPICurrentGrdPageIndex = 1;
                WrtActivityLog(long.MinValue, "MarHistorySearch");
                GetSelectCriteria();
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }
        protected void grdMarhistory_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {

            try
            {
                if (!String.IsNullOrEmpty(hdnSubAgencyParam.Value) && hdnSubAgencyParam.Value == "1")
                {

                    if (State.gMultiJuris)
                    {
                        e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Hidden = false;
                        e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Width = Unit.Percentage(5);
                        e.Row.Items.FindItemByKey("SubAgencyCode").Column.Width = Unit.Percentage(6);
                        e.Row.Items.FindItemByKey("SubAgencyCode").Tooltip = e.Row.Items.FindItemByKey("SubAgencyName").Text;
                        e.Row.Items.FindItemByKey("Dosage").Column.Width = Unit.Percentage(8);
                        e.Row.Items.FindItemByKey("DispenseDesc").Column.Width = Unit.Percentage(8);
                        e.Row.Items.FindItemByKey("StatusDesc").Column.Width = Unit.Percentage(8);
                        e.Row.Items.FindItemByKey("LastAdministeredDttm").Column.Width = Unit.Percentage(10);

                    }
                    else
                    {
                        e.Row.Items.FindItemByKey("SubAgencyCode").Column.Width = Unit.Percentage(6);
                        e.Row.Items.FindItemByKey("SubAgencyCode").Tooltip = e.Row.Items.FindItemByKey("SubAgencyName").Text;
                        e.Row.Items.FindItemByKey("Dosage").Column.Width = Unit.Percentage(8);
                        e.Row.Items.FindItemByKey("DispenseDesc").Column.Width = Unit.Percentage(8);
                        e.Row.Items.FindItemByKey("StatusDesc").Column.Width = Unit.Percentage(8);
                        e.Row.Items.FindItemByKey("LastAdministeredDttm").Column.Width = Unit.Percentage(15);

                    }
                }
                else
                {
                    if (State.gMultiJuris)
                    {
                        
                        e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Hidden = true;

                    }
                    else
                    {
                        e.Row.Items.FindItemByKey("Dosage").Column.Width = Unit.Percentage(10);
                        e.Row.Items.FindItemByKey("DispenseDesc").Column.Width = Unit.Percentage(10);
                        e.Row.Items.FindItemByKey("StatusDesc").Column.Width = Unit.Percentage(10);
                        e.Row.Items.FindItemByKey("LastAdministeredDttm").Column.Width = Unit.Percentage(15);
                        e.Row.Items.FindItemByKey("SubAgencyCode").Column.Hidden = true;


                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

            //if (State.gMultiJuris && KPIHlp.CVI32(hdnJurisId.Value) != Int32.MinValue && KPIHlp.CVI32(hdnJurisId.Value) != State.sJurisID)
            //{
            //    e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Hidden = false;
            //    e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Width = Unit.Percentage(5);
            //    e.Row.Items.FindItemByKey("LastAdministeredDttm").Column.Width = Unit.Percentage(10);

            //}
            //else
            //{
            //    e.Row.Items.FindItemByKey("LastAdministeredDttm").Column.Width = Unit.Percentage(15);
            //    e.Row.Items.FindItemByKey("KPIJurisAlias").Column.Hidden = true;

            //}


            //if (!String.IsNullOrEmpty(hdnSubAgencyParam.Value) && hdnSubAgencyParam.Value == "1")
            //{
            //    e.Row.Items.FindItemByKey("SubAgencyCode").Column.Width = Unit.Percentage(6);
            //    e.Row.Items.FindItemByKey("SubAgencyCode").Tooltip = e.Row.Items.FindItemByKey("SubAgencyName").Text;
            //    e.Row.Items.FindItemByKey("Dosage").Column.Width = Unit.Percentage(8);
            //    e.Row.Items.FindItemByKey("DispenseDesc").Column.Width = Unit.Percentage(8);
            //    e.Row.Items.FindItemByKey("StatusDesc").Column.Width = Unit.Percentage(8);
            //}
            //else
            //{
                
            //    e.Row.Items.FindItemByKey("Dosage").Column.Width = Unit.Percentage(10);
            //    e.Row.Items.FindItemByKey("DispenseDesc").Column.Width = Unit.Percentage(10);
            //    e.Row.Items.FindItemByKey("StatusDesc").Column.Width = Unit.Percentage(10);
            //    e.Row.Items.FindItemByKey("SubAgencyCode").Column.Hidden = true;
            //}
        }
        protected void _lnkbtnPrev_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(-1);
            grdMarhistory.KPIGrdPageIndexChanged(sender, eventArgs);
            GetSelectCriteria();
        }

        protected void _lnkbtnNext_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(1);
            grdMarhistory.KPIGrdPageIndexChanged(sender, eventArgs);
            GetSelectCriteria();
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
        protected void cmdExcel()
        {
            try
            {
                DataSet objDS = GetData(true);

                WrtActivityLog(long.MinValue, "Exporting MarHistory info to Excel", "EXL");
                ExportToExcel(ref objDS, grdMarhistory.GetExcelColumns(), "MarHistory.xls");
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void ReadScr(ref JMMMedPrescriptionHist objJMMMedPrescriptionHist)
        {
            try
            {
                usrMedMarBasicSrch objusrMedMarBasicSrch = (usrMedMarBasicSrch)this.tabSuspSrch.Tabs.FindTabFromKey("BSC").FindControl("usrMedMarBasicSrch");
                objusrMedMarBasicSrch.ReadScr(ref objJMMMedPrescriptionHist);

            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void cmdBack()
        {
            try
            {
                DispScr(false);
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }


    }
}