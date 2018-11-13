using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Helper;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
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
    public partial class frmMedCharting : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cmdAdd.Attributes.Add("OnClick", "return fn_ManiGrdDetails();");
                cmdClear.Attributes.Add("OnClick", "return fn_CancelChartDetailsRow();");

                cmdSave.Attributes.Add("OnClick", "glbCtrlClicked='Save';");
                cmdReset.Attributes.Add("OnClick", "glbCtrlClicked='Reset';");

                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");

                hdnMode.Value = Request.QueryString.Get("Mode") == null ? string.Empty : Request.QueryString.Get("Mode").Trim().ToString(); //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisID") == null ? string.Empty : Request.QueryString.Get("hdnJurisID").Trim().ToString();
                hdnBookingID.Value = Request.QueryString.Get("BookingID") == null ? string.Empty : Request.QueryString.Get("BookingID").ToString();
                hdnNameID.Value = Request.QueryString.Get("InmateNameID") == null ? string.Empty : Request.QueryString.Get("InmateNameID").ToString();
                hdnJMMedicalHistID.Value = Request.QueryString.Get("JMMedicalHistID") == null ? string.Empty : Request.QueryString.Get("JMMedicalHistID").ToString();
                hdnStatus.Value = Request.QueryString.Get("Status") == null ? string.Empty : Request.QueryString.Get("Status").ToString();

                if (hdnStatus.Value == "1")
                {
                    tdstatusbar.Style.Remove("display");
                }
                else
                {
                    tdstatusbar.Style.Add("display", "none");
                }


                if (!IsPostBack)
                {
                    JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
                    if (!String.IsNullOrEmpty(hdnJurisId.Value))
                    {
                        objJMMMedicalHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);                        
                    }
                    if (!String.IsNullOrEmpty(hdnBookingID.Value))
                    {
                        objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                    }

                    if (!String.IsNullOrEmpty(hdnNameID.Value))
                    {
                        objJMMMedicalHist.NameID = KPIHlp.CVI64(hdnNameID.Value);
                    }
                    if (!String.IsNullOrEmpty(hdnJMMedicalHistID.Value))
                    {
                        objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                    }
                    Inquiry(ref objJMMMedicalHist);
                }
                if (KPIHlp.CVI32(hdnJurisId.Value) > 0)
                {
                    hdnSetUserPFID.Value = State.GPV((int)JailAdmissionParams.IsDefaultAllPFFields, KPIHlp.CVI32(hdnJurisId.Value));
                }

                if (hdnJurisId.Value == KPIHlp.CVS(State.sJurisID))
                {
                    hdnLoginPFCode.Value = KPI.Global.Helper.PersonnelHlp.GetPFCode(State.sPFID);
                    hdnLoginPFDesc.Value = KPI.Global.Helper.PersonnelHlp.GetPFFullName(State.sPFID);
                    hdnLoginPFID.Value = State.sPFID.ToString();
                }
            }
            catch (Exception)
            {
                KPITrace.Debug(TraceWeight.Five, "Calling page load for medical charting screen");
                WrtActivityLog(long.MinValue, " Calling page load for medical charting screen.");
                
            }

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
            DataSet ds = null;
            try
            {
                JMMChartingBL objJMMChartingBL = new JMMChartingBL();
                //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                if (objJMMMedicalHist.JMMedicalHistID.HasValue)
                {
                    ds = new DataSet();
                    ds = objJMMChartingBL.Search(ref objJMMMedicalHist);
                }
                grdChartDetails.Clear(null, null);
                grdChartDetails.ClearDataSource();
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

                AddClientOnLoadScript("fn_CancelChartDetailsRow();");

                JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
                objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJMMedicalHistID"))).Value);
                objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                objJMMMedicalHist.NameID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnNameID"))).Value);
                objJMMMedicalHist.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);

                if (objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID.Value > 0 && objJMMMedicalHist.JMBookingID.HasValue && objJMMMedicalHist.JMBookingID.Value > 0)
                {
                    Inquiry(ref objJMMMedicalHist);
                }
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }

        }
        protected void cmdSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception)
            {
                KPITrace.Debug(TraceWeight.Five, "Calling medical frmMedCharting screen Save Button");
                WrtActivityLog(long.MinValue, " Calling medical frmMedCharting screen Save Button.");
            }
            
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


                if (objJmmChartingList == null)
                    return false;
                else
                {
                    objJMMChartingBL.ManageCharting(objJmmChartingList);

                    if (objJmmChartingList.Count > 0)
                    {
                        ((BasePage)Page).ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS, null);
                    }
                    Inquiry(ref objJMMMedicalHist);


                    return true;
                }
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