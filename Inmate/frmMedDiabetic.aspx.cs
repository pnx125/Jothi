using Infragistics.Web.UI.GridControls;
using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;
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
    public partial class frmMedDiabetic : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                cmdAdd.Attributes.Add("OnClick", "return fn_ManipulateDiabetic();");
                cmdClear.Attributes.Add("OnClick", "return fn_CancelDiabeticDetails();");
                cmdSave.Attributes.Add("OnClick", "glbCtrlClicked='Save';");
                cmdReset.Attributes.Add("OnClick", "glbCtrlClicked='Reset';");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");

                hdnJurisId.Value = Request.QueryString.Get("hdnJurisID") == null ? string.Empty : Request.QueryString.Get("hdnJurisID").Trim().ToString();
                hdnBookingID.Value = Request.QueryString.Get("BookingID") == null ? string.Empty : Request.QueryString.Get("BookingID").ToString();
                if (Request.QueryString.Get("Mode") != null && Request.QueryString.Get("Mode") != string.Empty) //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                {
                    hdnMode.Value = Request.QueryString.Get("Mode").ToString();
                }
                if (!IsPostBack)
                {

                    BoundCheckBoxField ChkColumn = (BoundCheckBoxField)this.grdDiabetic.Columns.FromKey("IsAdministered");
                    ChkColumn.ValueConverter = new BoolConverter();


                    JMMDiabetic objJMMDiabetic = new JMMDiabetic();
                    if (!String.IsNullOrEmpty(hdnJurisId.Value))
                    {
                        objJMMDiabetic.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                    }
                    if (!String.IsNullOrEmpty(hdnBookingID.Value))
                    {
                        objJMMDiabetic.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                        Inquiry(ref objJMMDiabetic);
                    }

                    
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
                KPITrace.Debug(TraceWeight.Five, "Calling page load for medical Diabetic screen");
                WrtActivityLog(long.MinValue, " Calling page load for medical Diabetic screen.");
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
                KPITrace.Debug(TraceWeight.Five, "Calling medical Diabetic screen Save&Close Button");
                WrtActivityLog(long.MinValue, " Calling medical Diabetic screen Save&Close Button.");
            }
        }
        protected void cmdReset_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                AddClientOnLoadScript("fn_CancelDiabeticDetails();");

                JMMDiabetic objJMMDiabetic = new JMMDiabetic();
                objJMMDiabetic.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                objJMMDiabetic.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);

                if (objJMMDiabetic.JMBookingID.HasValue && objJMMDiabetic.JMBookingID.Value > 0 && objJMMDiabetic.JurisID.HasValue && objJMMDiabetic.JurisID.Value > 0)
                {
                    Inquiry(ref objJMMDiabetic);
                }
            }
            catch (Exception)
            {
                KPITrace.Debug(TraceWeight.Five, "Calling medical Diabetic screen Reset Button");
                WrtActivityLog(long.MinValue, " Calling medical Diabetic screen Reset Button.");
            }
        }
        protected void grdDiabetic_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {

                if (e.Row.Items.FindItemByKey("ActionNotes") != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("ActionNotes").Text))
                {

                    e.Row.Items.FindItemByKey("C").CssClass = "CmtNotes";
                }
                e.Row.Items.FindItemByKey("DiabeticNotes").Text = string.Empty;
            }
            catch (Exception)
            {
                KPITrace.Debug(TraceWeight.Five, "Calling medical Diabetic screen grid initialize row");
                WrtActivityLog(long.MinValue, " Calling medical Diabetic screen grid initialize row.");
            }
        }

        public void Inquiry(ref JMMDiabetic objJMMDiabetic)
        {
            DataSet objDS = new DataSet();
            try
            {
                JMMDiabeticBL objJMMDiabeticBL = new JMMDiabeticBL();

                objDS = objJMMDiabeticBL.Search(ref objJMMDiabetic);
                grdDiabetic.DataSource = objDS;
                grdDiabetic.DataBind();
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }

        public JMMDiabeticList ReadScr()
        {
            try
            {
                JMMDiabeticList objJMMDiabeticList = new JMMDiabeticList();
                for (int iRowCnt = 0; iRowCnt < grdDiabetic.Rows.Count; iRowCnt++)
                {
                    if (grdDiabetic.IsActiveRow(iRowCnt))
                    {
                        JMMDiabetic objJMMDiabetic = new JMMDiabetic();
                        objJMMDiabetic.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                        objJMMDiabetic.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);

                        long JMMDiabeticID = grdDiabetic.GetLong(iRowCnt, "KPIID");
                        if (JMMDiabeticID != long.MinValue && JMMDiabeticID > 0)
                        {
                            objJMMDiabetic.JMMDiabeticID = JMMDiabeticID;
                            objJMMDiabetic.cMode = grdDiabetic.GetChar(iRowCnt, "KPIMode");
                        }
                        else
                        {
                            objJMMDiabetic.JMMDiabeticID = KPICounter.GetCounterID(objJMMDiabetic.JurisID.Value);
                            objJMMDiabetic.cMode = 'A';
                        }

                        objJMMDiabetic.TestType = String.IsNullOrEmpty(grdDiabetic.GetString(iRowCnt, "TestType")) ? null : grdDiabetic.GetString(iRowCnt, "TestType");
                        objJMMDiabetic.GlucoseReading = String.IsNullOrEmpty(grdDiabetic.GetString(iRowCnt, "GlucoseReading")) ? null : grdDiabetic.GetString(iRowCnt, "GlucoseReading");

                        if (grdDiabetic.GetLong(iRowCnt, "AdministeredPFID") != long.MinValue)
                        {
                            objJMMDiabetic.AdministeredPFID = grdDiabetic.GetLong(iRowCnt, "AdministeredPFID");
                        }
                        if (grdDiabetic.GetDateTime(iRowCnt, "AdministeredDttm") != DateTime.MinValue)
                        {
                            objJMMDiabetic.AdministeredDttm = grdDiabetic.GetDateTime(iRowCnt, "AdministeredDttm");
                        }
                        if (grdDiabetic.GetShort(iRowCnt, "IsAdministered") != short.MinValue)
                        {
                            objJMMDiabetic.IsAdministered = grdDiabetic.GetShort(iRowCnt, "IsAdministered");
                        }
                        if (grdDiabetic.GetShort(iRowCnt, "IsAdministered") == 1)
                        {
                            objJMMDiabetic.IsAdministered = grdDiabetic.GetShort(iRowCnt, "IsAdministered");
                        }
                        else
                        {
                            objJMMDiabetic.IsAdministered = null;
                        }


                        objJMMDiabetic.ActionNotes = String.IsNullOrEmpty(grdDiabetic.GetString(iRowCnt, "DiabeticNotes")) ? null : System.Web.HttpUtility.HtmlDecode(grdDiabetic.GetString(iRowCnt, "DiabeticNotes"));

                        if (!String.IsNullOrEmpty(objJMMDiabetic.ActionNotes))
                        {
                            if (objJMMDiabetic.ActionNotes.Length <= 254)
                            {
                                objJMMDiabetic.ActionNotes = objJMMDiabetic.ActionNotes.Substring(0, objJMMDiabetic.ActionNotes.Length);
                            }
                            else
                            {
                                objJMMDiabetic.ActionNotes = objJMMDiabetic.ActionNotes.Substring(0, txtActions.MaxLength);
                            }

                        }


                        objJMMDiabeticList.Add(objJMMDiabetic);
                    }
                }
                return objJMMDiabeticList;

            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }

        private bool Save()
        {
            JMMDiabeticBL objJMMDiabeticBL = null;
            JMMDiabeticList objJMMDiabeticList = null;
            JMMDiabetic objJMMDiabetic = new JMMDiabetic();
            try
            {
                objJMMDiabeticList = ReadScr();
                objJMMDiabeticBL = new JMMDiabeticBL();
                KPITrace.Debug(TraceWeight.Five, "Calling Manage for frmMedDiabetic");
                ((BasePage)this.Page).WrtActivityLog(long.MinValue, " Managing frmMedDiabetic.", ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnMode"))).Value);


                if (objJMMDiabeticList == null)
                    return false;
                else
                {
                    objJMMDiabeticBL.ManageDiabetic(objJMMDiabeticList);

                    if (objJMMDiabeticList.Count > 0)
                    {
                        ((BasePage)Page).ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS, null);
                    }
                    objJMMDiabetic.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                    objJMMDiabetic.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);
                    Inquiry(ref objJMMDiabetic);


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