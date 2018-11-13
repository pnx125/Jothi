using Infragistics.Web.UI.GridControls;
using KPI.Framework.Object.Setup;
using KPI.Framework.Setup;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
//using KPI.Phoenix.Global;
using KPI.Global.KPIWebControls;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Script.Services;
using System.Web.UI;

namespace KPI.PhoenixWeb.Inmate
{
    public partial class frmMedSchedule : BasePage
    {

        #region Server Side Code
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            cmdAdd.Attributes.Add("onclick", "return fn_ScheduleGridManip_Row();");
            cmdClear.Attributes.Add("onclick", "return fn_CancelEditScheduleRow();");
            chkInactive.Attributes.Add("onChange", "nGrdClearSource('grdSchedule')");

            cmdSaveNClose.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
            cmdSave.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
            cmdRefresh.Attributes.Add("onclick", "glbCtrlClicked = 'Refresh';");
            cmdPrint.Attributes.Add("onclick", "glbCtrlClicked = 'Print';");
            Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");

            if (!Page.IsPostBack)
            {
                hdnMedPrescribeID.Value = Request.QueryString.Get("JMMedPrescriptionID") == null ? string.Empty : Request.QueryString.Get("JMMedPrescriptionID").ToString();
                hdnMedPresSchID.Value = Request.QueryString.Get("JMMedPresSchID") == null ? string.Empty : Request.QueryString.Get("JMMedPresSchID").ToString();
                hdnbookingid.Value = Request.QueryString.Get("JMBookingID") == null ? string.Empty : Request.QueryString.Get("JMBookingID").ToString();
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisId") == null ? string.Empty : Request.QueryString.Get("hdnJurisId").ToString();
                hdnDrugCodeValue.Value = Request.QueryString.Get("DrugID") == null ? string.Empty : Request.QueryString.Get("DrugID").ToString();
                LoadData();
            }

        }

        protected void LoadData()
        {
            string strhdnMode = UIMode.ADD.ToString();
            try
            {
                JMMPrescriptionSchdule objJMPrescriptionSchdule = new JMMPrescriptionSchdule();              
                if (KPIHlp.CVI64(hdnMedPrescribeID.Value) > 0)
                {
                    Inquiry(ref objJMPrescriptionSchdule);
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected void Inquiry(ref JMMPrescriptionSchdule objJMPrescriptionSchdule)
        {
            DataSet ds = new DataSet();
            JMMPrescriptionSchduleBL objJMPrescriptionSchduleBL = new JMMPrescriptionSchduleBL();
            try
            {
                objJMPrescriptionSchdule.JMMedPrescriptionID = KPIHlp.CVI64(hdnMedPrescribeID.Value);
                JMMMedPrescription objJMMMedPrescription = new JMMMedPrescriptionBL().Select(objJMPrescriptionSchdule.JMMedPrescriptionID.Value);                
           

                cddDrug.CodeValue = objJMMMedPrescription.Drug;
                txtDosage.Text = objJMMMedPrescription.Dosage;
                if (chkInactive.Checked)
                {
                    objJMPrescriptionSchdule.IsActive = 1;
                }
                else
                {
                    objJMPrescriptionSchdule.IsActive = 0;
                }


                ds = objJMPrescriptionSchduleBL.GetSchedule(ref objJMPrescriptionSchdule);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hdnMode.Value = UIMode.CHG.ToString();
                }
                grdSchedule.DataSource = ds;
                grdSchedule.DataBind();
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        private bool ValidateScr()
        {
            return true;
        }

        private JMMPrescriptionSchdule ReadScr()
        {
            JMMPrescriptionSchdule objJMPrescriptionSchdule = new JMMPrescriptionSchdule();
            JMMPrescriptionSchduleList objJMPrescriptionSchduleList = null;
            try
            {
                if (ValidateScr())
                {
                    objJMPrescriptionSchduleList = new JMMPrescriptionSchduleList();
                    int times = grdSchedule.Rows.Count;
                    for (int iRowCount = 0; iRowCount < grdSchedule.Rows.Count; iRowCount++)
                    {
                        if (grdSchedule.IsActiveRow(iRowCount))
                        {
                            objJMPrescriptionSchdule = new JMMPrescriptionSchdule();
                            objJMPrescriptionSchdule.JurisID = KPIHlp.CVI32(hdnJurisId.Value);

                            DateTime StartDate = grdSchedule.GetDateTime(iRowCount, "StartDate");
                            DateTime FinishDate = grdSchedule.GetDateTime(iRowCount, "FinishDate");
                            String RepeatEvery = grdSchedule.GetString(iRowCount, "RepeatEvery");

                            if (KPIHlp.CVI64(grdSchedule.GetString(iRowCount, "KPIID")) > 0)
                            {
                                objJMPrescriptionSchdule.JMPrescriptionSchduleID = KPIHlp.CVI64(grdSchedule.GetString(iRowCount, "KPIID"));
                                objJMPrescriptionSchdule.cMode = grdSchedule.GetChar(iRowCount, "KPIMode");
                            }
                            else
                            {
                                objJMPrescriptionSchdule.JMPrescriptionSchduleID = KPICounter.GetCounterID(objJMPrescriptionSchdule.JurisID.Value);
                                if (grdSchedule.GetChar(iRowCount, "KPIMode").Equals('D'))
                                {
                                    objJMPrescriptionSchdule.cMode = grdSchedule.GetChar(iRowCount, "KPIMode");
                                }
                                else
                                {
                                    objJMPrescriptionSchdule.cMode = 'A';
                                }
                            }
                            objJMPrescriptionSchdule.IsActive = 0;

                            objJMPrescriptionSchdule.JMMedPrescriptionID = grdSchedule.GetLong(iRowCount, "JMMedPrescriptionID");
                            objJMPrescriptionSchdule.JMBookingID = grdSchedule.GetLong(iRowCount, "JMBookingID");

                            objJMPrescriptionSchdule.Dispense = grdSchedule.GetInt(iRowCount, "Dispense");
                            

                            objJMPrescriptionSchdule.DistributionPeriod = grdSchedule.GetString(iRowCount, "DistributionPeriod");
                            if (grdSchedule.GetDateTime(iRowCount, "Startdttm") != DateTime.MinValue)
                            {
                                objJMPrescriptionSchdule.StartTime = grdSchedule.GetDateTime(iRowCount, "Startdttm");
                            }
                            if (grdSchedule.GetDateTime(iRowCount, "Enddttm") != DateTime.MinValue)
                            {
                                objJMPrescriptionSchdule.EndTime = grdSchedule.GetDateTime(iRowCount, "Enddttm");
                            }
                            

                            if (objJMPrescriptionSchdule.cMode.Equals('D'))
                            {
                                times--;
                                objJMPrescriptionSchdule.IsActive = 2;

                                objJMPrescriptionSchdule.StartTime = grdSchedule.GetDateTime(iRowCount, "PeriodStartTime");
                                objJMPrescriptionSchdule.EndTime = grdSchedule.GetDateTime(iRowCount, "PeriodEndTime");

                                if (StartDate != DateTime.MinValue)
                                {
                                    objJMPrescriptionSchdule.StartDttm = KPIHlp.CVDttm(grdSchedule.GetDateTime(iRowCount, "StartDate").ToString("MM/dd/yyyy") + " " + grdSchedule.GetDateTime(iRowCount, "PeriodStartTime").ToString("HH:mm:ss"));
                                }
                                if (FinishDate != DateTime.MinValue)
                                {
                                    objJMPrescriptionSchdule.EndDttm = KPIHlp.CVDttm(grdSchedule.GetDateTime(iRowCount, "FinishDate").ToString("MM/dd/yyyy") + " " + grdSchedule.GetDateTime(iRowCount, "PeriodEndTime").ToString("HH:mm:ss"));
                                }

                            }
                            else
                            {
                                if (StartDate != DateTime.MinValue)
                                {
                                    objJMPrescriptionSchdule.StartDttm = KPIHlp.CVDttm(grdSchedule.GetDateTime(iRowCount, "StartDate").ToString("MM/dd/yyyy") + " " + grdSchedule.GetDateTime(iRowCount, "Startdttm").ToString("HH:mm:ss"));
                                }
                                if (FinishDate != DateTime.MinValue)
                                {
                                    objJMPrescriptionSchdule.EndDttm = KPIHlp.CVDttm(grdSchedule.GetDateTime(iRowCount, "FinishDate").ToString("MM/dd/yyyy") + " " + grdSchedule.GetDateTime(iRowCount, "Enddttm").ToString("HH:mm:ss"));
                                }
                            }

                            if(!String.IsNullOrWhiteSpace(RepeatEvery))
                            {
                                objJMPrescriptionSchdule.RepeatEvery = RepeatEvery;
                            }

                            objJMPrescriptionSchdule.Instructions = grdSchedule.GetString(iRowCount, "Instructions");

                            objJMPrescriptionSchduleList.Add(objJMPrescriptionSchdule);

                        }
                    }
                    objJMPrescriptionSchdule.Times = times;

                    objJMPrescriptionSchdule.objJMMPrescriptionSchduleList = objJMPrescriptionSchduleList;

                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return objJMPrescriptionSchdule;
        }

        private bool Save()
        {
            try
            {
                JMMPrescriptionSchdule objJMPrescriptionSchdule = ReadScr();
                JMMPrescriptionSchduleBL objJMPrescriptionSchduleBL = new JMMPrescriptionSchduleBL();
                if (objJMPrescriptionSchdule != null)
                {
                    objJMPrescriptionSchduleBL.ManageSchedule(objJMPrescriptionSchdule);
                    if (hdnMode.Value == UIMode.ADD.ToString())
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                    }
                    else
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);
                    }
                    if (objJMPrescriptionSchdule.JMMedPrescriptionID.HasValue)
                    {
                        Inquiry(ref objJMPrescriptionSchdule);
                    }                    
                    hdnMode.Value = UIMode.CHG.ToString();
                }
            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
            return true;
        }

        #region Master screen toolbar events

        protected void cmdSave_Click(object sender, System.Web.UI.ImageClickEventArgs e)
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

        protected void cmdSaveNClose_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            try
            {
                Save();
                CloseScr();
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

        protected void cmdPrint_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            PrintScr();
        }

        protected void cmdRefresh_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ClearData();
            LoadData();
        }

        #endregion Master screen toolbar events

        protected void chkInactive_CheckedChanged(object sender, EventArgs e)
        {
            LoadData();
        }


        protected void grdSchedule_InitializeRow(object sender, RowEventArgs e)
        {

            try
            {
                e.Row.Items.FindItemByKey("FromTime").Text = Convert.ToDateTime(e.Row.Items.FindItemByKey("PeriodStartTime").Text).ToString("HH:mm");
                e.Row.Items.FindItemByKey("EndTime").Text = Convert.ToDateTime(e.Row.Items.FindItemByKey("PeriodEndTime").Text).ToString("HH:mm");

                if (e.Row.Items.FindItemByKey("IsActive").Text == "1")
                {
                    e.Row.CssClass = "grdGColor";
                }
            }
            catch (Exception)
            {

                throw;
            }


        }



        #endregion


        #region WebService

        [ScriptMethod()]
        [System.Web.Services.WebMethod()]
        public static object GetStartEndTime(string Period, string JurisID)
        {
            Coded objCoded = new CodedBL().Select(KPIHlp.CVI32(JurisID), 4151, Period);
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(objCoded);
        }


        [ScriptMethod()]
        [System.Web.Services.WebMethod()]
        public static object GetUseEndDttm(string JMMedPrescriptionID)
        {
            JMMMedPrescriptionDB objJMMedPrescriptionDB = new JMMMedPrescriptionDB();
            JMMMedPrescription objJMMedPrescription = new JMMMedPrescriptionDB().Select(KPIHlp.CVI64(JMMedPrescriptionID));
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(objJMMedPrescription);

        }
        


        #endregion

        
    }
}