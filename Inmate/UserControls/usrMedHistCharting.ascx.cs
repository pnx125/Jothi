using KPI.Global;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KPI.Phoenix.Inmate;
using System.Data;
using KPI.Global.StateMachine;
using System.Web.UI.HtmlControls;
using KPI.Global.Helper;

namespace KPI.PhoenixWeb.Inmate.UserControls
{
    public partial class usrMedHistCharting : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cmdAdd.Attributes.Add("onclick", "return fn_ManiGrdDetails();");
            cmdClear.Attributes.Add("onclick", "return fn_CancelChartDetailsRow();");

            cmdSave.Attributes.Add("OnClick", "glbCtrlClicked='Save';");
            cmdClear.Attributes.Add("OnClick", "return fn_CancelChartDetailsRow();");
        }
        public JmmChartingList ReadScr(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {
                JmmChartingList objJmmChartingList = new JmmChartingList();
                for (int iRowCnt = 0; iRowCnt < grdChartDetails.Rows.Count; iRowCnt++)
                {
                    if (grdChartDetails.IsActiveRow(iRowCnt))
                    {
                        JMMCharting objJMMCharting = new JMMCharting();
                        objJMMCharting.JurisID = ((BasePage)this.Page).GetPageJuris();

                        long JMChartID = grdChartDetails.GetLong(iRowCnt, "KPIID");
                        JMChartID = JMChartID != long.MinValue ? JMChartID : grdChartDetails.GetLong(iRowCnt, "GeneratedID");
                        if (JMChartID != long.MinValue)
                        {
                            objJMMCharting.JMChartID = JMChartID;
                        }
                        else
                            objJMMCharting.JMChartID = KPICounter.GetCounterID(((BasePage)this.Page).GetPageJuris());

                        objJMMCharting.JMMedicalHistID = objJMMMedicalHist.JMMedicalHistID;
                        objJMMCharting.cMode = grdChartDetails.GetChar(iRowCnt, "KPIMode");
                        objJMMCharting.OfficerID = grdChartDetails.GetLong(iRowCnt, "PFID");
                        objJMMCharting.ChartingDttm = grdChartDetails.GetDateTime(iRowCnt, "Dttm");
                        objJMMCharting.ChartReason = grdChartDetails.GetString(iRowCnt, "ReasonCode");

                        objJmmChartingList.Add(objJMMCharting);
                    }
                }
                return objJmmChartingList;
                 
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }
        public void Inquiry(ref JMMMedicalHist objJMMMedicalHist)
        {
            DataSet ds = new DataSet();
            try
            {
                JMMChartingBL objJMMChartingBL = new JMMChartingBL();

                ds = objJMMChartingBL.Search(ref objJMMMedicalHist);
                grdChartDetails.DataSource = ds;
                grdChartDetails.DataBind();
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }

        protected void grdChartDetails_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {
                if (e.Row.Items.FindItemByKey("JMChartID") != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("JMChartID").Text))
                {
                    e.Row.Items.FindItemByKey("C").CssClass = "NotificationRules";
                }
            }

            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }
        protected void cmdReset_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
                objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJMMedicalHistID"))).Value);
                objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                objJMMMedicalHist.NameID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnNameID"))).Value);
                objJMMMedicalHist.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);
                Inquiry(ref objJMMMedicalHist);
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }

        }
        protected void cmdSave_Click(object sender, ImageClickEventArgs e)
        {
            Save();
        }

        private bool Save()
        {
            JMMChartingBL objJMMChartingBL = null;
            JmmChartingList objJmmChartingList = null;
            JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
            objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJMMedicalHistID"))).Value);
            objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
            objJMMMedicalHist.NameID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnNameID"))).Value);
            objJMMMedicalHist.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);

            try
            {
                objJmmChartingList = ReadScr(ref objJMMMedicalHist);
                objJMMChartingBL = new JMMChartingBL();
                KPITrace.Debug(TraceWeight.Five, "Calling Manage for Charting Tab");
                ((BasePage)this.Page).WrtActivityLog(long.MinValue, " Managing charge Dtls.", ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnMode"))).Value);
                objJMMChartingBL.ManageCharting(objJmmChartingList);
                Inquiry(ref objJMMMedicalHist);


                return true;
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
            finally
            {

            }

        }
    }
}