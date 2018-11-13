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
    public partial class frmMedAllergy : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                cmdAdd.Attributes.Add("OnClick", "return fn_ManipulateAllergy();");
                cmdClear.Attributes.Add("OnClick", "return fn_CancelAllergyDetails();");
                cmdSave.Attributes.Add("OnClick", "glbCtrlClicked='Save';");
                cmdReset.Attributes.Add("OnClick", "glbCtrlClicked='Reset';");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");
                chkInactive.Attributes.Add("onclick", "return fn_Inactive();");
                AddClientOnLoadScript("fn_Inactive();");
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisID") == null ? string.Empty : Request.QueryString.Get("hdnJurisID").Trim().ToString();
                hdnBookingID.Value = Request.QueryString.Get("BookingID") == null ? string.Empty : Request.QueryString.Get("BookingID").ToString();
                if (Request.QueryString.Get("Mode") != null && Request.QueryString.Get("Mode") != string.Empty) //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                {
                    hdnMode.Value = Request.QueryString.Get("Mode").ToString();
                }
                if (!IsPostBack)
                {

                    BoundCheckBoxField ChkColumn = (BoundCheckBoxField)this.grdAllergy.Columns.FromKey("Isactive");
                    ChkColumn.ValueConverter = new BoolConverter();


                    JMMAllergy objJMMAllergy = new JMMAllergy();
                    if (!String.IsNullOrEmpty(hdnJurisId.Value))
                    {
                        objJMMAllergy.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                    }
                    if (!String.IsNullOrEmpty(hdnBookingID.Value))
                    {
                        objJMMAllergy.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                        Inquiry(ref objJMMAllergy);
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
                KPITrace.Debug(TraceWeight.Five, "Calling page load for medical Allergy screen");
                WrtActivityLog(long.MinValue, " Calling page load for medical Allergy screen.");
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
                KPITrace.Debug(TraceWeight.Five, "Calling medical Allergy screen Save&Close Button");
                WrtActivityLog(long.MinValue, " Calling medical Allergy screen Save&Close Button.");
            }
        }
        protected void cmdReset_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                AddClientOnLoadScript("fn_CancelAllergyDetails();");

                JMMAllergy objJMMAllergy = new JMMAllergy();
                objJMMAllergy.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                objJMMAllergy.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);

                if (objJMMAllergy.JMBookingID.HasValue && objJMMAllergy.JMBookingID.Value > 0 && objJMMAllergy.JurisID.HasValue && objJMMAllergy.JurisID.Value > 0)
                {
                    Inquiry(ref objJMMAllergy);
                }
            }
            catch (Exception)
            {
                KPITrace.Debug(TraceWeight.Five, "Calling medical Allergy screen Reset Button");
                WrtActivityLog(long.MinValue, " Calling medical Allergy screen Reset Button.");
            }
        }

        protected void grdAllergy_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {
                if (e.Row.Items.FindItemByKey("ReactionNotes") != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("ReactionNotes").Text))
                {
                    e.Row.Items.FindItemByKey("ReactionsIcon").CssClass = "CmtNotes";
                }
                if (e.Row.Items.FindItemByKey("Notes") != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Notes").Text))
                {
                    e.Row.Items.FindItemByKey("NotesIcon").CssClass = "CmtNotes";
                }

                if (e.Row.Items.FindItemByKey("Isactive") != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Isactive").Text) && e.Row.Items.FindItemByKey("Isactive").Text == "1")
                {
                    e.Row.CssClass = "grdAllergy_row_color";
                }


                e.Row.Items.FindItemByKey("AllergyReactionNotes").Text = string.Empty;
                e.Row.Items.FindItemByKey("AllergyNotes").Text = string.Empty;
            }
            catch (Exception)
            {
                KPITrace.Debug(TraceWeight.Five, "Calling medical Allergy screen grid initialize row");
                WrtActivityLog(long.MinValue, " Calling medical Allergy screen grid initialize row.");
            }
        }


        public void Inquiry(ref JMMAllergy objJmmAllergy)
        {
            DataSet objDS = null;
            try
            {
                objDS = new DataSet();
                objDS = new JMMAllergyBL().Search(ref objJmmAllergy);
                grdAllergy.DataSource = objDS;
                grdAllergy.DataBind();
            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }

        public JMMAllergyList ReadScr()
        {
            try
            {
                JMMAllergyList objJMMAllergyList = new JMMAllergyList();
                for (int iRowCnt = 0; iRowCnt < grdAllergy.Rows.Count; iRowCnt++)
                {
                    if (grdAllergy.IsActiveRow(iRowCnt))
                    {
                        JMMAllergy objJmmAllergy = new JMMAllergy();
                        objJmmAllergy.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                        objJmmAllergy.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);

                        long JMAllergID = grdAllergy.GetLong(iRowCnt, "KPIID");
                        if (JMAllergID != long.MinValue && JMAllergID > 0)
                        {
                            objJmmAllergy.JMMAllergyID = JMAllergID;
                            objJmmAllergy.cMode = grdAllergy.GetChar(iRowCnt, "KPIMode");
                        }
                        else
                        {
                            objJmmAllergy.JMMAllergyID = KPICounter.GetCounterID(objJmmAllergy.JurisID.Value);
                            objJmmAllergy.cMode = 'A';
                        }
                        if (grdAllergy.GetDateTime(iRowCnt, "AllergyDttm") != DateTime.MinValue)
                        {
                            objJmmAllergy.AllergyDttm = grdAllergy.GetDateTime(iRowCnt, "AllergyDttm");
                        }

                        objJmmAllergy.Allergy = String.IsNullOrEmpty(grdAllergy.GetString(iRowCnt, "Allergy")) ? null : grdAllergy.GetString(iRowCnt, "Allergy");
                        objJmmAllergy.AllergyReactions = String.IsNullOrEmpty(grdAllergy.GetString(iRowCnt, "AllergyReactionNotes")) ? null : System.Web.HttpUtility.HtmlDecode(grdAllergy.GetString(iRowCnt, "AllergyReactionNotes"));
                        objJmmAllergy.AllergyNotes = String.IsNullOrEmpty(grdAllergy.GetString(iRowCnt, "AllergyNotes")) ? null : System.Web.HttpUtility.HtmlDecode(grdAllergy.GetString(iRowCnt, "AllergyNotes"));

                        if (!String.IsNullOrEmpty(objJmmAllergy.AllergyReactions))
                        {
                            if (objJmmAllergy.AllergyReactions.Length <= 254)
                            {
                                objJmmAllergy.AllergyReactions = objJmmAllergy.AllergyReactions.Substring(0, objJmmAllergy.AllergyReactions.Length);
                            }
                            else
                            {
                                objJmmAllergy.AllergyReactions = objJmmAllergy.AllergyReactions.Substring(0, txtReactions.MaxLength);
                            }

                        }

                        if (!String.IsNullOrEmpty(objJmmAllergy.AllergyNotes))
                        {
                            if (objJmmAllergy.AllergyNotes.Length <= 400)
                            {
                                objJmmAllergy.AllergyNotes = objJmmAllergy.AllergyNotes.Substring(0, objJmmAllergy.AllergyNotes.Length);
                            }
                            else
                            {
                                objJmmAllergy.AllergyNotes = objJmmAllergy.AllergyNotes.Substring(0, txtNotes.MaxLength);
                            }

                        }




                        objJmmAllergy.IsActive = grdAllergy.GetShort(iRowCnt, "Isactive");
                        if (objJmmAllergy.IsActive == 1)
                        {
                            objJmmAllergy.InactiveDttm = grdAllergy.GetDateTime(iRowCnt, "InactiveDttm");
                            if (grdAllergy.GetLong(iRowCnt, "InactivePFID") != long.MinValue)
                            {
                                objJmmAllergy.InactivePFID = grdAllergy.GetLong(iRowCnt, "InactivePFID");
                            }
                        }
                        else
                        {
                            objJmmAllergy.IsActive = null;
                            objJmmAllergy.InactiveDttm = null;
                            objJmmAllergy.InactivePFID = null;
                        }

                        objJMMAllergyList.Add(objJmmAllergy);
                    }
                }
                return objJMMAllergyList;

            }
            catch (Exception objErr)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
                throw;
            }
        }

        private bool Save()
        {
            JMMAllergyBL objJMMAllergyBL = null;
            JMMAllergyList objJmmAllergyList = null;
            JMMAllergy objJmmAllergy = new JMMAllergy();
            try
            {
                objJmmAllergyList = ReadScr();
                objJMMAllergyBL = new JMMAllergyBL();
                KPITrace.Debug(TraceWeight.Five, "Calling Manage for frmMedAllergy");
                ((BasePage)this.Page).WrtActivityLog(long.MinValue, " Managing frmMedAllergy.", ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnMode"))).Value);


                if (objJmmAllergyList == null)
                    return false;
                else
                {
                    objJMMAllergyBL.ManageAllergy(objJmmAllergyList);

                    if (objJmmAllergyList.Count > 0)
                    {
                        ((BasePage)Page).ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS, null);
                    }
                    objJmmAllergy.JMBookingID = KPIHlp.CVI64(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value);
                    objJmmAllergy.JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);
                    Inquiry(ref objJmmAllergy);


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