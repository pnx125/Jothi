using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.StateMachine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KPI.Phoenix.Object.Inmate;
using KPI.Phoenix.Inmate;
using KPI.PhoenixWeb.Inmate.UserControls;
using KPI.Phoenix.Helper;
using KPI.Global.Helper;
using System.Data;
using KPI.Global.KPIWebControls;
using Telerik.Web.UI;
namespace KPI.PhoenixWeb.Inmate
{
    public partial class frmMedChartingHistory : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!String.IsNullOrEmpty(Request.QueryString.Get("hdnJurisId")))
                {
                    this.hdnJurisId.Value = Request.QueryString.Get("hdnJurisId");
                }

                if (!IsPostBack)
                {
                    hdnMode.Value = Request.QueryString.Get("hdnMode").Trim();
                    Inquiry();
                }

                cmdSaveNClose.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
                cmdSave.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
                cmdRefresh.Attributes.Add("onclick", "glbCtrlClicked = 'Refresh';");
                cmdPrint.Attributes.Add("onclick", "glbCtrlClicked = 'Print';");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");

            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void cmdRefresh_Click(object sender, ImageClickEventArgs e)
        {

            usrMedCharting objusrMedCharting = (usrMedCharting)this.tabMedCharting.Tabs.FindTabFromKey("Chart").FindControl("usrMedCharting");

            RadEditor KPIRadHuberActivityDetails = ((RadEditor)objusrMedCharting.FindControl("KPIRadHuberActivityDetails"));
            KPIRadHuberActivityDetails.Content = "";
            Inquiry();
        }
        protected void cmdSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Save();
            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected bool Save()
        {
            try
            {
                CMSCommentsList objCMSCommentsList = ReadScr();
                if (objCMSCommentsList != null)
                {
                    CMSCommentsBL objCMSCommentsBL = new CMSCommentsBL();
                    objCMSCommentsBL.Manage(objCMSCommentsList);
                    Inquiry();
                }

            }
            catch (Exception objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
            return true;
        }
        protected CMSCommentsList ReadScr()
        {
            CMSCommentsList objCMSCommentsList = null;
            try
            {
                objCMSCommentsList = new CMSCommentsList();
                CMSComments objCMSComments = new CMSComments();
                if (!String.IsNullOrEmpty(Request.QueryString.Get("JMChartID")))
                {
                    objCMSComments.RefID = KPIHlp.CVI64(Request.QueryString.Get("JMChartID"));
                    if (!String.IsNullOrEmpty(Request.QueryString.Get("hdnJurisId")))
                    {
                        objCMSComments.JurisID = KPIHlp.CVI32(Request.QueryString.Get("hdnJurisId"));
                    }
                }

                if (objCMSComments.RefID.HasValue && objCMSComments.RefID.Value > 0)
                {
                    usrMedCharting objusrMedCharting = (usrMedCharting)this.tabMedCharting.Tabs.FindTabFromKey("Chart").FindControl("usrMedCharting");
                    objCMSCommentsList = objusrMedCharting.ReadScr(ref objCMSComments);

                }
            }
            catch (Exception objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }

            return objCMSCommentsList;
        }

        public void Inquiry()
        {
            try
            {
                tabMedCharting.SelectedIndex = 1;
                CMSComments objCMSComments = new CMSComments();

                if (!String.IsNullOrEmpty(Request.QueryString.Get("JMChartID")))
                {
                    objCMSComments.RefID = KPIHlp.CVI64(Request.QueryString.Get("JMChartID"));
                }


                if (objCMSComments.RefID.HasValue && objCMSComments.RefID.Value > 0)
                {
                    usrMedChartingHistory objusrMedChartingHistory = (usrMedChartingHistory)this.tabMedCharting.Tabs.FindTabFromKey("ChartingLog").FindControl("usrMedChartingHistory");
                    objusrMedChartingHistory.DetailInquiry(ref objCMSComments);
                }


            }
            catch (Exception objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
        }
        protected void cmdSaveNClose_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (Save())
                {
                    CloseScr();
                    AutoUpdateParent();
                }

            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }
        protected void cmdPrint_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                PrintReport();
                ClearData();
                usrMedCharting objusrMedCharting = (usrMedCharting)this.tabMedCharting.Tabs.FindTabFromKey("Chart").FindControl("usrMedCharting");

                RadEditor KPIRadHuberActivityDetails = ((RadEditor)objusrMedCharting.FindControl("KPIRadHuberActivityDetails"));
                KPIRadHuberActivityDetails.Content = "";
                Inquiry();
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }

        }
    }
}