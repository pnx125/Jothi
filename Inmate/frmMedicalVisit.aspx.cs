//using KPI.Phoenix.WebControls;
//using KPI.Phoenix.Global;

using Infragistics.Web.UI.GridControls;
using KPI.Framework.Object.Setup;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Data;
using System.Web.UI;
using KPI.Framework.Object.Home;
using KPI.Framework.Home;
using KPI.Global.KPIWebControls;
using System.Collections.Generic;
using KPI.Phoenix.Helper;
using System.Linq;
using Telerik.Web.UI;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicalVisit.
    /// </summary>
    public partial class frmMedicalVisit : BasePage
    {
        public Int32 JurisID;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                cmdAdd.Attributes.Add("onclick", "return fn_PrescriptionGridManip_Row();");
                cmdClear.Attributes.Add("onclick", "return fn_CancelEditPrescriptionRow();");
                cmdSaveNClose.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
                cmdSave.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
                cmdRefresh.Attributes.Add("onclick", "glbCtrlClicked = 'Refresh';");
                cmdPrint.Attributes.Add("onclick", "glbCtrlClicked = 'Print';");
                cmdEditor.Attributes.Add("OnClick", "return fn_OpenTextEditor();");
                btnDisposition.Attributes.Add("onclick", "return fn_Disposition();");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");//Added by Bujjibabu for Warning
                hdnBookingID.Value = Request.QueryString.Get("Bookingid") == null ? string.Empty : Request.QueryString.Get("Bookingid").ToString();
                hdnJMMedicalHistID.Value = Request.QueryString.Get("JMMedicalHistID") == null ? string.Empty : Request.QueryString.Get("JMMedicalHistID").ToString();
                hdnNameID.Value = Request.QueryString.Get("NameId") == null ? string.Empty : Request.QueryString.Get("NameId").ToString();
                ChkAdmMedFacility.Attributes.Add("onclick", "return fn_chkFacility();");
                chkSplMealReq.Attributes.Add("onclick", "return fn_chkSplMeals();");
                chkTBTested.Attributes.Add("onclick", "return fn_chkTbTested();");
                AddClientOnLoadScript("fn_CancelEditPrescriptionRow();fn_visitDoctorNurse();"); 
                if (Request.QueryString.Get("hdnMode") != null && Request.QueryString.Get("hdnMode") != string.Empty)
                {
                    hdnMode.Value = Request.QueryString.Get("hdnMode").ToString();

                }
                if (string.IsNullOrEmpty(hdnJurisId.Value) || KPIHlp.CVI32(hdnJurisId.Value) == Int32.MinValue)
                {
                    hdnJurisId.Value = Request.QueryString.Get("hdnJurisId") != null && KPIHlp.CVI32(Request.QueryString.Get("hdnJurisId")) > 0 ? Request.QueryString.Get("hdnJurisId") : KPIHlp.CVS(GetPageJuris());
                }
                JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                if (!Page.IsPostBack)
                {
                    if (!String.IsNullOrEmpty(hdnJurisId.Value) && JurisID > 0)
                    {
                        hdnSetUserPFID.Value = State.GPV((int)JailAdmissionParams.IsDefaultAllPFFields, KPIHlp.CVI32(hdnJurisId.Value));
                    }
                }
                if (State.sJurisID == JurisID)
                {
                    hdnLoginPFCode.Value = KPI.Global.Helper.PersonnelHlp.GetPFCode(State.sPFID);
                    hdnLoginPFDesc.Value = KPI.Global.Helper.PersonnelHlp.GetPFFullName(State.sPFID);
                    hdnLoginPFID.Value = State.sPFID.ToString();
                }
                

                //Validation for only Numbers Allowed

                //mskBlood.Attributes.Add("onkeydown", "return isNumberKeyMedVisit('mskBlood','1')");                
                txtPulse.Attributes.Add("onkeydown", "return AlphabetValidation('txtPulse','1')");
                txtWeight.Attributes.Add("onkeydown", "return AlphabetValidation('txtWeight','1')");
                txtHeight.Attributes.Add("onkeydown", "return AlphabetValidation('txtHeight','1')");
                
                txtDosage.Attributes.Add("onkeydown", "return AlphabetValidation('txtDosage','aa1')");

                cmdSchedule.Attributes.Add("OnClick", "return fn_OpenScheduler();");

                KPIImageButton objDentistIbubble = ((KPI.Global.KPIWebControls.KPIImageButton)(lupAttendingDoctor.FindControl("cmdIncOnAddr")));
                objDentistIbubble.Attributes.Add("onClick", "return fn_DentistEntry();");
               
                
                // Put user code to initialize the page here
                if (!Page.IsPostBack)
                {
                    hdnMode.Value = Request.QueryString.Get("hdnMode") == null ? string.Empty : Request.QueryString.Get("hdnMode").Trim().ToString();
                    hdnBookingID.Value = Request.QueryString.Get("Bookingid") == null ? string.Empty : Request.QueryString.Get("Bookingid").ToString();
                    hdnNameID.Value = Request.QueryString.Get("NameId") == null ? string.Empty : Request.QueryString.Get("NameId").ToString();
                    hdnMedVisitID.Value = Request.QueryString.Get("JMMedVisitID") == null ? string.Empty : Request.QueryString.Get("JMMedVisitID").ToString();
                    LoadData();
                }
                else if (hdnAutoLoad.Value == "ENTERKEY")
                {
                    LoadData();
                    hdnAutoLoad.Value = string.Empty;
                    AddClientOnLoadScript("fn_ClearDrugDetails();");

                }              


                txtBloodPressure1.ReadOnly = true;
                txtBloodPressure2.ReadOnly = true;

                Infragistics.Web.UI.EditorControls.WebDateTimeEditor WDT = (Infragistics.Web.UI.EditorControls.WebDateTimeEditor)dttmVisitDate.FindControl("Time");
                WDT.ClientEvents.Blur = "KPISetShortTimeHM_VisitedDttm";

                WDT.ClientEvents.ValueChanged = "KPISetShortTimeHM_VisitedDttm";
                WDT.ClientEvents.TextChanged = "KPISetShortTimeHM_VisitedDttm";               
                
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void LoadData()
        {
            JMMMedVisit objJmmMedVisit = new JMMMedVisit();
            JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
            string strhdnMode = UIMode.ADD.ToString();
            long sMedvisID, BookingID, NameID;
            try
            {
               
                BookingID = KPIHlp.CVI64(hdnBookingID.Value);
                sMedvisID = KPIHlp.CVI64(hdnMedVisitID.Value);
                NameID = KPIHlp.CVI64(hdnNameID.Value);
                objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                objJMMMedicalHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                if (sMedvisID > 0)
                {
                    objJMMMedicalHist.JMMedVisitID = sMedvisID;
                    AddClientOnLoadScript("nEnable('cmdEditor',5);");
                }
                else
                {
                    AddClientOnLoadScript("nDisable('cmdEditor',5);nDisable('lupReceivedBy',6);nDisable('lupReceivedBy',7);nDisable('lupReceivedBy',77);nDisable('lupAttendingDoctor',6);");
                    chkInmateSubmitionForm.SelectedIndex = -1;
                    rdoDoctorNurse.SelectedIndex = -1;
                }
                objJMMMedicalHist.JMBookingID = BookingID;


                if (NameID > 0 && (!NameID.Equals("")))
                {
                    NamCtrlSPIN.KPIID = NameID;
                    objJMMMedicalHist.NameID = NameID;
                }
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);//Added by Bujjibabu for Warning
            }
            try
            {
                if ((hdnMode.Value == UIMode.INQ.ToString() || hdnMode.Value == UIMode.CHG.ToString()) && KPIHlp.CVI64(hdnMedVisitID.Value) > 0)
                {

                    InquiryChg(ref objJMMMedicalHist);
                }
                else
                {
                    //hdnMode.Value = UIMode.ADD.ToString();
                    if (objJMMMedicalHist.JMMedicalHistID.HasValue)
                    {
                        JMMMedPrescription objJMMedPrescription = new JMMMedPrescription();
                        objJMMedPrescription.JMMedicalHistID = objJMMMedicalHist.JMMedicalHistID;
                        objJMMedPrescription.JurisID = objJMMMedicalHist.JurisID;
                        objJMMedPrescription.JMBookingID = objJMMMedicalHist.JMBookingID;
                        LastVisit(ref objJMMMedicalHist);

                        BindMedicalPrescriptionGrid(ref objJMMedPrescription);
                    }
                    //ClearData();
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }
        
        /// <summary>
        /// To display last Medical Visit Status based on Current MedVisit
        /// </summary>
        /// <param name="BookingID"></param>
        /// <param name="MedVisitID"></param>
        protected void LastMedVisit(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {
                JMMMedVisitBL objMedVistBL = new JMMMedVisitBL();
                JMMMedVisit objMedVisit = new JMMMedVisit();
                IDataReader objReader = objMedVistBL.LastMedVisit(ref objJMMMedicalHist);
                if (objReader != null)
                {
                    try
                    {
                        if (objReader.Read())
                        {
                            txtBloodPressure1Old.Text = objReader.IsDBNull(objReader.GetOrdinal("BloodPressure")) ? string.Empty : objReader.GetString(objReader.GetOrdinal("BloodPressure"));
                            txtBloodPressure2Old.Text = objReader.IsDBNull(objReader.GetOrdinal("BloodPressureMax")) ? string.Empty : objReader.GetString(objReader.GetOrdinal("BloodPressureMax"));

                            txtPulseLstRead.Text = objReader.IsDBNull(objReader.GetOrdinal("Pulse")) ? string.Empty : objReader.GetInt32(objReader.GetOrdinal("Pulse")).ToString();
                            txtWghtLstRead.Text = objReader.IsDBNull(objReader.GetOrdinal("Weight")) ? string.Empty : objReader.GetDecimal(objReader.GetOrdinal("Weight")).ToString();
                            txtLstHeight.Text = objReader.IsDBNull(objReader.GetOrdinal("Height")) ? string.Empty : objReader.GetInt32(objReader.GetOrdinal("Height")).ToString();
                        }
                    }
                    catch (Exception objErr)
                    {
                        throw objErr;
                    }
                    finally
                    {
                        if (!objReader.IsClosed)
                            objReader.Close();
                    }

                   
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        /// <summary>
        /// Display RecentLast Medical Visit Details
        /// </summary>
        /// <param name="BookingID">Return Recent Datas for the BookingID</param>
        protected void LastVisit(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {
                JMMMedVisitBL objMedVistBL = new JMMMedVisitBL();
                JMMMedVisit objMedVisit = new JMMMedVisit();
                objMedVisit = objMedVistBL.LastVisit(ref objJMMMedicalHist);
                if (objMedVisit != null)
                {

                    txtBloodPressure1Old.Text = objMedVisit.BloodPressure;
                    txtBloodPressure2Old.Text = objMedVisit.BloodPressureMax;
                    txtPulseLstRead.Text = objMedVisit.PulseApical.HasValue ? objMedVisit.PulseApical.Value.ToString() : (objMedVisit.PulseRadial.HasValue ? objMedVisit.PulseRadial.Value.ToString() : string.Empty);
                    txtWghtLstRead.Text = objMedVisit.Weight.HasValue ? objMedVisit.Weight.Value.ToString() : string.Empty;
                    txtLstHeight.Text = objMedVisit.Height.HasValue ? objMedVisit.Height.Value.ToString() : string.Empty;

                   
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected void InquiryChg(ref JMMMedicalHist objJMMMedicalHist)
        {
            DataSet ds = new DataSet();
            JMMMedVisitBL objMedVistBL = new JMMMedVisitBL();
            JMMMedPrescription objJMMedPrescription = null;
            //JmmMedPrescribeBL objmedpresc = new JmmMedPrescribeBL();

            DataSet dsSchedule = null;
            try
            {


                //ds = objmedpresc.getMedVisitPrescr(objJMMMedicalHist.JMMedVisitID.Value);
                //grdPrescription.DataSource = ds;
                //grdPrescription.DataBind();

                JMMMedVisit objMedVisit = objMedVistBL.MedicalVisit(ref objJMMMedicalHist);

                if (objJMMMedicalHist.JMMedicalHistID.HasValue)
                {
                    objJMMedPrescription = new JMMMedPrescription();
                    LastMedVisit(ref objJMMMedicalHist);
                    hdnJMMedicalHistID.Value = objJMMMedicalHist.JMMedicalHistID.HasValue ? objJMMMedicalHist.JMMedicalHistID.Value.ToString() : string.Empty;
                    hdnMedVisitID.Value = objJMMMedicalHist.JMMedVisitID.HasValue ? objJMMMedicalHist.JMMedVisitID.Value.ToString() : string.Empty;
                    hdnNameID.Value = objJMMMedicalHist.NameID.HasValue ? objJMMMedicalHist.NameID.Value.ToString() : string.Empty;
                    hdnBookingID.Value = objJMMMedicalHist.JMBookingID.HasValue ? objJMMMedicalHist.JMBookingID.Value.ToString() : string.Empty;

                    if (objJMMMedicalHist.JMMedicalHistID.HasValue)
                    {
                        objJMMedPrescription.JMMedicalHistID = objJMMMedicalHist.JMMedicalHistID.Value;
                    }
                    if (objJMMMedicalHist.JMMedVisitID.HasValue)
                    {
                        objJMMedPrescription.JMMedVisitID = objJMMMedicalHist.JMMedVisitID.Value;
                    }
                    if (objJMMMedicalHist.JMBookingID.HasValue)
                    {
                        objJMMedPrescription.JMBookingID = objJMMMedicalHist.JMBookingID.Value;
                    }

                    if (objJMMMedicalHist.JurisID.HasValue)
                    {
                        objJMMedPrescription.JurisID = objJMMMedicalHist.JurisID.Value;
                    }
                }

                if (objMedVisit != null)
                {

                    
                    txtmedicalProblem.Text = objMedVistBL.GetNotes(objMedVisit.JMMedVisitID.Value, TxtType.JmMed_MedPbmCmnt);
                    if (objJMMMedicalHist.JMMedVisitID.HasValue && objJMMMedicalHist.JMMedVisitID.Value > 0)
                    {
                        AddClientOnLoadScript("fn_Notes(" + objJMMMedicalHist.JMMedVisitID.Value + ");");
                        AddClientOnLoadScript("nEnable('cmdEditor',5);");
                    }

                    #region for medical visit except schedule functionality
                    NumCrtlMedicalNo.KPIID = objMedVisit.MedicalVisitNo.Value;
                    
                    String[] MedicalVisitNo = Counter.GetFormattedNo(CounterType.JailBookingNo, objMedVisit.MedicalVisitNo.Value.ToString()).Split('-');

                    NumCrtlMedicalNo.txtYear.Text = Convert.ToString(MedicalVisitNo[0]);
                    NumCrtlMedicalNo.txtNumber.Text = Convert.ToString(MedicalVisitNo[1]);


                    hdnMedVisitNo.Value = objMedVisit.MedicalVisitNo.ToString();
                    dttmDateOfReq.DateValue = objMedVisit.RequestDttm.Value;
                    if (objMedVisit.IsForm.HasValue)
                    {
                        if (objMedVisit.IsForm.Value.ToString() == "1")
                        {
                            chkInmateSubmitionForm.SelectedValue = objMedVisit.IsForm.Value.ToString();
                            lblReceivedBy.Text = "Received By&nbsp;";
                        }
                        else if (objMedVisit.IsForm.Value.ToString() == "2")
                        {
                            chkInmateSubmitionForm.SelectedValue = objMedVisit.IsForm.Value.ToString();
                            lblReceivedBy.Text = "Requested By&nbsp;";
                        }
                    }
                    
                    if (objMedVisit.ReceivedPFID.HasValue && objMedVisit.ReceivedPFID > 0)
                    {
                        lupReceivedBy.CodeValue = objMedVisit.PFCode;
                        lupReceivedBy.Description.Text = objMedVisit.FullName;
                        lupReceivedBy.KPIID = objMedVisit.ReceivedPFID.Value;
                    }
                    
                    


                    dttmVisitDate.DateValue = KPIHlp.GVDttm(objMedVisit.VisitDttm==DateTime.MinValue, objMedVisit.VisitDttm);



                    if (objMedVisit.IsDoctor.HasValue)
                    {
                        if (objMedVisit.IsDoctor.Value.ToString() == "2")
                        {
                           
                            rdoDoctorNurse.SelectedValue = objMedVisit.IsDoctor.Value.ToString();                           
                            trAttendNurse.Style.Add("display", "");
                            trAttendDoctor.Style.Add("display", "none");
                            if (objMedVisit.AttendDoctorID.HasValue)
                            {
                                lupAttendingNurse.KPIID = objMedVisit.AttendDoctorID.Value;
                            }
                        }
                        else if (objMedVisit.IsDoctor.Value.ToString() == "1")
                        {                            
                            rdoDoctorNurse.SelectedValue = objMedVisit.IsDoctor.Value.ToString();
                            trAttendNurse.Style.Add("display", "none");
                            trAttendDoctor.Style.Add("display", "");
                            if (objMedVisit.AttendDoctorID.HasValue)
                            {
                                lupAttendingDoctor.KPIID = objMedVisit.AttendDoctorID.Value;
                            }
                        }

                        
                    }

                    if (objMedVisit.JMMedVitaltID.HasValue)
                    {
                        hdnMedVitalID.Value = objMedVisit.JMMedVitaltID.Value.ToString();
                    }
                    else
                    {
                        hdnMedVitalID.Value = string.Empty;
                    }

                    
                    cddLocation.KPISelectedCodeValue = objMedVisit.Location;                    
                    

                    lupDiagnsis.CodeValue = objMedVisit.Diagnosis;
                 
                    if (!String.IsNullOrEmpty(objMedVisit.Hospital))
                    {
                        cddAdmMedFacility.CodeValue = objMedVisit.Hospital;
                    }

                    if (String.IsNullOrEmpty(objMedVisit.SpecialMeal))
                    {
                        radSpecialMealRequired.ClearCheckedItems();
                    }
                    

                    if (!String.IsNullOrEmpty(objMedVisit.Result))
                    {
                        cddResults.CodeValue = objMedVisit.Result;                       
                    }
                    if (objMedVisit.IsTbTest == 1)
                    {
                        chkTBTested.Checked = true;
                    }
                    if (objMedVisit.IsSpecialMeal == 1)
                    {
                        chkSplMealReq.Checked = true;
                    }
                    if (objMedVisit.IsFacility == 1)
                    {
                        ChkAdmMedFacility.Checked = true;
                    }
                    #endregion

                    #region Schedule events from medical module
                    KPIEvents objKPIEvents = new KPIEvents();
                    KPIEventsBL objKPIEventsBL = new KPIEventsBL();
                    long SchNameId = KPIHlp.CVI64(hdnNameID.Value);
                    string ScreenName = "Medical";
                    dsSchedule = objKPIEventsBL.GetSchedule(SchNameId, objMedVisit.JMBookingID.Value, ScreenName);
                    if (dsSchedule != null && dsSchedule.Tables.Count > 0 && dsSchedule.Tables[0].Rows.Count > 0)
                    {
                        DataRow objSchedule = dsSchedule.Tables[0].Rows[0];
                        schDttm.DateValue = KPIHlp.CVDttm(objSchedule["StartDttm"].ToString());
                        objKPIEvents.EventNo = KPIHlp.CVI64(objSchedule["EventNo"].ToString());
                    }
                    else
                    {
                        schDttm.DateValue = DateTime.MinValue;
                        schDttm.TimeValue = DateTime.MinValue;
                    }


                    if (objMedVisit.JMMedVitaltID.HasValue && objMedVisit.JMMedVitaltID.Value != long.MinValue)
                    {
                        JMMMedVitals objJMMMedVitals = new JMMMedVitalsBL().Select(objMedVisit.JMMedVitaltID.Value);
                        if (objJMMMedVitals.PulseApical.HasValue)
                        {
                            txtPulse.Text = objJMMMedVitals.PulseApical.Value.ToString();
                        }
                        else if (objJMMMedVitals.PulseRadial.HasValue)
                        {
                            txtPulse.Text = objJMMMedVitals.PulseRadial.Value.ToString();
                        }
                        else
                        {
                            txtPulse.Text = string.Empty;

                        }
                        if (!String.IsNullOrEmpty(objJMMMedVitals.BloodPressure))
                        {
                            txtBloodPressure1.Text = objJMMMedVitals.BloodPressure;
                        }
                        else
                        {
                            txtBloodPressure1.Text = string.Empty;
                        }
                        if (!String.IsNullOrEmpty(objJMMMedVitals.BloodPressureMax))
                        {
                            txtBloodPressure2.Text = objJMMMedVitals.BloodPressureMax;
                        }
                        else
                        {
                            txtBloodPressure2.Text = string.Empty;
                        }
                        if (objJMMMedVitals.Weight.HasValue)
                        {
                            txtWeight.Text = objJMMMedVitals.Weight.Value.ToString();
                        }
                        else
                        {
                            txtWeight.Text = string.Empty;
                        }

                        if (objJMMMedVitals.Height.HasValue)
                        {
                            txtHeight.Text = objJMMMedVitals.Height.Value.ToString();
                        }
                        else
                        {
                            txtHeight.Text = string.Empty;
                        }
                        

                    }

                    #endregion


                    #region Prescription Grid Inquiry

                    if (objJMMedPrescription != null)
                    {

                        if (chkInactive.Checked)
                        {
                            objJMMedPrescription.IsActiveSchedule = "1";
                        }
                        else
                        {
                            objJMMedPrescription.IsActiveSchedule = string.Empty;

                        }
                        BindMedicalPrescriptionGrid(ref objJMMedPrescription);
                    }
                    #endregion


                }
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

        private JMMMedVisit ReadScr()
        {
            JmmMedVisitList objJmmMedVisitList = new JmmMedVisitList();
            JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
            JMMMedVisit objJmmMedVisit = new JMMMedVisit();
            objJmmMedVisit.objJmmMedicalPrescribeList = new JmmMedPrescribeList();
            objJmmMedVisit.objCMSRefValuesList = new CMSRefValuesList();


            if (string.IsNullOrEmpty(hdnJurisId.Value))
            {
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisId") != null && KPIHlp.CVI32(Request.QueryString.Get("hdnJurisId")) > 0 ? Request.QueryString.Get("hdnJurisId") : KPIHlp.CVS(GetPageJuris());
            }
            int JurisID = KPIHlp.CVI32(hdnJurisId.Value);
            long BookingID = KPIHlp.CVI64(hdnBookingID.Value);
            
            string IsDental = null;
            try
            {
                if (ValidateScr())
                {
                    objJmmMedVisit.JurisID = JurisID;
                    objJmmMedVisit.JMBookingID = BookingID;
                    if (KPIHlp.CVI64(hdnJMMedicalHistID.Value) > 0)
                    {
                        objJmmMedVisit.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                        objJMMMedicalHist.JMMedicalHistID = objJmmMedVisit.JMMedicalHistID;
                    }
                    if (KPIHlp.CVI64(hdnMedVitalID.Value) > 0)
                    {
                        objJmmMedVisit.JMMedVitaltID = KPIHlp.CVI64(hdnMedVitalID.Value);
                    }
                    if (KPIHlp.CVI64(hdnMedVisitID.Value) == long.MinValue)
                    {
                        objJmmMedVisit.JMMedVisitID = KPICounter.GetCounterID(objJmmMedVisit.JurisID.Value);
                        objJmmMedVisit.MedicalVisitNo = Counter.GetCounterNo(objJmmMedVisit.JurisID.Value, CounterType.MedicalVisitNo, Int64.MinValue);
                        objJmmMedVisit.cMode = 'A';
                    }
                    else
                    {
                        objJmmMedVisit.JMMedVisitID = KPIHlp.CVI64(hdnMedVisitID.Value);
                        objJmmMedVisit.MedicalVisitNo = KPIHlp.CVI64(hdnMedVisitNo.Value);
                    }

                    objJMMMedicalHist.JMMedVisitID = objJmmMedVisit.JMMedVisitID;
                    objJMMMedicalHist.JurisID = objJmmMedVisit.JurisID;
                    objJMMMedicalHist.JMBookingID = objJmmMedVisit.JMBookingID;
                    if (chkInmateSubmitionForm.SelectedValue == "1")
                    {
                        objJmmMedVisit.IsForm = 1;
                    }
                    else if (chkInmateSubmitionForm.SelectedValue == "2")
                    {
                        objJmmMedVisit.IsForm = 2;
                    }


                    objJmmMedVisit.RequestDttm = dttmDateOfReq.DateValue;
                    if (lupReceivedBy.KPIID > 0)
                    {
                        objJmmMedVisit.ReceivedPFID = lupReceivedBy.KPIID;
                    }
                    else
                    {
                        objJmmMedVisit.ReceivedPFID = State.sPFID;
                    }
                    objJmmMedVisit.MedicalProblem = txtmedicalProblem.Text.ToString();

                    if (dttmVisitDate.DateValue != DateTime.MinValue)
                    {
                        objJmmMedVisit.VisitDttm = dttmVisitDate.DateValue;

                        
                        switch (rdoDoctorNurse.SelectedItem.Value)
                        {
                            case "1":
                                objJmmMedVisit.IsDoctor = 1;
                                if (lupAttendingDoctor.KPIID > 0)
                                {
                                    objJmmMedVisit.AttendDoctorID = lupAttendingDoctor.KPIID;
                                    lupAttendingNurse.KPIID = long.MinValue;
                                    lupAttendingNurse.CodeValue = string.Empty; 
                                    lupAttendingNurse.Description.Text = string.Empty;
                                }
                                break;
                            case "2":
                                objJmmMedVisit.IsDoctor = 2;
                                if (lupAttendingNurse.KPIID > 0)
                                {
                                    objJmmMedVisit.AttendDoctorID = lupAttendingNurse.KPIID;
                                    lupAttendingDoctor.KPIID = long.MinValue;
                                    lupAttendingDoctor.CodeValue = string.Empty; 
                                }
                                break;
                            default:
                                objJmmMedVisit.IsDoctor = -1;
                                break;
                        }

                        objJmmMedVisit.Location = cddLocation.CodeValue;
                    }                    
                    
                    objJmmMedVisit.Diagnosis = lupDiagnsis.CodeValue;
                    objJmmMedVisit.Hospital = cddAdmMedFacility.CodeValue;
                   
                    IsDental = Request.QueryString.Get("isdental").Trim();
                    objJmmMedVisit.IsDental = KPIHlp.CVI16(IsDental);


                    if (chkTBTested.Checked)
                    {
                        objJmmMedVisit.IsTbTest = 1;
                        objJmmMedVisit.Result = cddResults.CodeValue;
                    }
                    else
                    {
                        objJmmMedVisit.IsTbTest = 0;
                        objJmmMedVisit.Result = null;
                    }

                    if (chkSplMealReq.Checked)
                    {
                        objJmmMedVisit.IsSpecialMeal = 1;
                       

                        Dictionary<string, long> ObjCollection = RadCombo(radSpecialMealRequired);
                        LoadRadCombo(radSpecialMealRequired, ref ObjCollection, ref objJmmMedVisit);

                    }
                    else
                    {
                        objJmmMedVisit.IsSpecialMeal = 0;
                        objJmmMedVisit.SpecialMeal = null;
                    }

                    if (ChkAdmMedFacility.Checked)
                    {
                        objJmmMedVisit.IsFacility = 1;
                        objJmmMedVisit.Hospital = cddAdmMedFacility.CodeValue;
                    }
                    else
                    {
                        objJmmMedVisit.IsFacility = 0;
                        objJmmMedVisit.Hospital = null;

                    }

                    #region Medical Prescription
                    //// below code is need for medical visit prescription
                    ////Medical Visit Prescribe Grid to Read client to server side                  
                 
                    //KPITrace.Debug(TraceWeight.Five, "Reading Data from Medical Visit Entry");




                    #region
                    JMMMedPrescriptionList objJMMedPrescriptionList = new JMMMedPrescriptionList();
                    for (int iCount = 0; iCount < grdPrescription.Rows.Count; iCount++)
                    {
                        if (grdPrescription.IsActiveRow(iCount))
                        {
                            JMMMedPrescription objJMMedPrescription = new JMMMedPrescription();

                            objJMMedPrescription.JurisID = objJMMMedicalHist.JurisID != Int32.MinValue ? objJMMMedicalHist.JurisID : null;
                            objJMMedPrescription.JMMedicalHistID = objJMMMedicalHist.JMMedicalHistID.Value;
                            objJMMedPrescription.JMBookingID = objJMMMedicalHist.JMBookingID;
                            hdnBookingID.Value = objJMMMedicalHist.JMBookingID.Value.ToString();
                            objJMMedPrescription.JMMedVisitID = objJMMMedicalHist.JMMedVisitID;
                            long JMMedPrescriptionID = grdPrescription.GetLong(iCount, "KPIID");
                            if (JMMedPrescriptionID != long.MinValue && JMMedPrescriptionID > 0)
                            {
                                objJMMedPrescription.JMMedPrescriptionID = JMMedPrescriptionID;
                                objJMMedPrescription.MedicalPrescriptionNo = KPIHlp.CVI64(grdPrescription.Rows[iCount].Items.FindItemByKey("MedicalPrescriptionNo").Text);
                                objJMMedPrescription.cMode = 'C';
                            }
                            else
                            {
                                objJMMedPrescription.JMMedPrescriptionID = KPICounter.GetCounterID(objJMMedPrescription.JurisID.Value);
                                objJMMedPrescription.MedicalPrescriptionNo = Counter.GetCounterNo(objJMMedPrescription.JurisID.Value, CounterType.MedicalPrescriptionNo, Int64.MinValue);
                                objJMMedPrescription.cMode = 'A';
                            }




                            //missing prescribed date
                            if (grdPrescription.GetDateTime(iCount, "PrescribedDttm") != DateTime.MinValue)
                            {
                                objJMMedPrescription.PrescribedDttm = grdPrescription.GetDateTime(iCount, "PrescribedDttm");
                            }

                            objJMMedPrescription.PrescribingDoctorID = KPIHlp.CVI64(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribingDoctorID").Text);
                            if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Prescription").Text))
                            {
                                objJMMedPrescription.Prescription = grdPrescription.Rows[iCount].Items.FindItemByKey("Prescription").Text;
                            }
                            objJMMedPrescription.Drug = grdPrescription.Rows[iCount].Items.FindItemByKey("Drug").Text;
                            if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Dosage").Text))
                            {
                                objJMMedPrescription.Dosage = grdPrescription.Rows[iCount].Items.FindItemByKey("Dosage").Text;
                            }
                            if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedAmt").Text) && KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedAmt").Text) != Int32.MinValue)
                            {
                                objJMMedPrescription.PrescribedAmt = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedAmt").Text);
                            }
                            if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedDuration").Text))
                            {
                                objJMMedPrescription.PrescribedDuration = grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedDuration").Text;
                            }
                            if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Refills").Text) && KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Refills").Text) != Int32.MinValue)
                            {
                                objJMMedPrescription.Refills = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Refills").Text);
                            }
                            if (grdPrescription.Rows[iCount].Items.FindItemByKey("IsGeneric").Text == "1")
                            {
                                objJMMedPrescription.IsGeneric = 1;
                            }
                            else
                            {
                                objJMMedPrescription.IsGeneric = 0;
                            }
                            objJMMedPrescription.Times = 0;


                            if (grdPrescription.GetInt(iCount, "CurQuantity") > 0)
                            {
                                objJMMedPrescription.CurQuantity = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("CurQuantity").Text);
                            }
                            else
                            {
                                objJMMedPrescription.CurQuantity = 0;
                            }


                            objJMMedPrescription.IsPersonalProp = 0;
                            if (grdPrescription.GetDateTime(iCount, "UseEndedDttmTemp") != DateTime.MinValue)
                            {
                                objJMMedPrescription.UseEndedDttm = grdPrescription.GetDateTime(iCount, "UseEndedDttmTemp");
                            }
                            //if (!string.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Balance").Text) && KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Balance").Text) != Int32.MinValue)
                            //{
                            //    objJMMedPrescription.Balance = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Balance").Text);
                            //}
                            //objJMMedPrescription.MedicationType = null; //grdPrescription.Rows[iCount].Items.FindItemByKey("MedicationType").Text;

                            if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Notes").Text))
                            {
                                objJMMedPrescription.PrescribeNotes = grdPrescription.Rows[iCount].Items.FindItemByKey("Notes").Text;
                            }

                            objJMMedPrescription.IsActiveSchedule = grdPrescription.Rows[iCount].Items.FindItemByKey("IsActiveSchedule").Text;

                            objJMMedPrescriptionList.Add(objJMMedPrescription);
                        }

                    }
                    objJmmMedVisit.objJMMMedPrescriptionList  = objJMMedPrescriptionList;
                    #endregion









                    #endregion
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return objJmmMedVisit;
        }


     

        private bool Save()
        {
            try
            {
                JMMMedVisit objMedVisit = ReadScr();
               

                if (objMedVisit == null)
                    return false;
                else
                {
                    JMMMedVisitBL objMedVisitBL = new JMMMedVisitBL();
                    KPITrace.Debug(TraceWeight.Five, "Calling Manage MedicalVisit");
                    objMedVisitBL.Manage(objMedVisit);
                    if (hdnMode.Value == "ADD")
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                    }
                    else if (hdnMode.Value == "CHG")
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);
                    }
                    hdnJurisId.Value = objMedVisit.JurisID.ToString();
                    hdnBookingID.Value = objMedVisit.JMBookingID.ToString();
                    hdnMedVisitID.Value = objMedVisit.JMMedVisitID.ToString();
                    hdnMedVitalID.Value = objMedVisit.JMMedVitaltID.ToString();
                    
                    hdnMode.Value = UIMode.CHG.ToString();
                    JMMMedicalHist objJMMMedicalHist = new JmmMedicalHistBL().Select(objMedVisit.JMMedicalHistID.Value);
                    objJMMMedicalHist.JMMedVisitID = objMedVisit.JMMedVisitID;
                    hdnNameID.Value = objJMMMedicalHist.NameID.Value.ToString();
                    InquiryChg(ref objJMMMedicalHist);
                }


                AutoUpdateParent();
            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
            return true;
        }

        #region Master screen toolbar events Save, Save&Close, Print, Refresh

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
            
            

            if (KPIHlp.CVI64(hdnMedVisitID.Value) > 0)
            {

                AddClientOnLoadScript("nEnable('cmdEditor',5);");
            }
            else
            {                
                AddClientOnLoadScript("nDisable('cmdEditor',5);");
            }
            if (chkInmateSubmitionForm.SelectedItem != null)
            {
                switch (chkInmateSubmitionForm.SelectedItem.Value)
                {
                    case "1":
                        lblReceivedBy.Text = "Received By&nbsp;";
                        AddClientOnLoadScript("nEnable('lupReceivedBy',6);nEnable('lupReceivedBy',7);nEnable('lupReceivedBy',77);");
                        break;
                    case "2":
                        lblReceivedBy.Text = "Requested By&nbsp;";
                        AddClientOnLoadScript("nEnable('lupReceivedBy',6);nEnable('lupReceivedBy',7);nEnable('lupReceivedBy',77);");                        
                        break;
                    default:
                        AddClientOnLoadScript("nDisable('lupReceivedBy',6);nDisable('lupReceivedBy',7);nDisable('lupReceivedBy',77);");
                        chkInmateSubmitionForm.SelectedIndex = -1;
                        break;
                }
            }

            if (rdoDoctorNurse.SelectedItem != null)
            {
                switch (rdoDoctorNurse.SelectedItem.Value)
                {
                    case "1":
                        AddClientOnLoadScript("nGCO('trAttendNurse').style.display = 'none';nGCO('trAttendDoctor').style.display = '';");
                        break;
                    case "2":
                        AddClientOnLoadScript("nGCO('trAttendNurse').style.display = '';nGCO('trAttendDoctor').style.display = 'none';");                        
                        break;
                    default:
                        AddClientOnLoadScript("nGCO('trAttendNurse').style.display = 'none';nGCO('trAttendDoctor').style.display = '';");
                        AddClientOnLoadScript("nDisable('lupAttendingDoctor',6);");
                        chkInmateSubmitionForm.SelectedIndex = -1;
                        break;
                }
            }

        }

        protected void cmdRefresh_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ClearData();
            LoadData();
            
        }

        #endregion Master screen toolbar events

   

        //CRM#
        #region Multi-select function radcombo checkbox
        private Dictionary<string, long> RadCombo(Control radCombo)
        {
            int CodeID = Int32.MinValue;
            int RefType = int.MinValue;
            switch (radCombo.ID.ToString())
            {
                case "radSpecialMealRequired":
                    CodeID = 5014;

                    RefType = (int)CMSReferenceType.SpecialMealRequired;
                    break;

            }

            DataSet objRadDentist = new JMMDentistVisitDB().GetChekDetails(CodeID, KPIHlp.CVI64(hdnMedVisitID.Value), RefType, KPIHlp.CVI32(hdnJurisId.Value));

            return objRadDentist.Tables[0].AsEnumerable().ToDictionary(x => x.Field<string>("CodeValue"), y => y.Field<long>("CMSRefValuesID"));
        }

        protected void LoadRadCombo(Control radCombo, ref Dictionary<string, long> ObjCollection, ref JMMMedVisit objJMMMedVisit)
        {
            try
            {
                KPIRadCombo objRadCombo = ((KPIRadCombo)this.FindControl(radCombo.ID.ToString()));

                foreach (RadComboBoxItem Item in objRadCombo.CheckedItems)
                {
                    if (Item.Value != "<0>")
                    {
                        CMSRefValues objCMSRefValues = new CMSRefValues();
                        objCMSRefValues.CMSRefValuesID = ObjCollection.ContainsKey(Item.Value) ? ObjCollection[Item.Value] : long.MinValue;
                        objCMSRefValues.JurisID = objJMMMedVisit.JurisID.Value;
                        if (objCMSRefValues.CMSRefValuesID != long.MinValue)
                        {
                            objCMSRefValues.cMode = 'C';
                        }
                        else
                        {
                            objCMSRefValues.cMode = 'A';
                            objCMSRefValues.CMSRefValuesID = KPICounter.GetCounterID(objCMSRefValues.JurisID.Value);
                        }
                        objCMSRefValues.IsActive = 1;
                        objCMSRefValues.RefValue = Item.Value;

                        switch (objRadCombo.ID)
                        {
                            case "radSpecialMealRequired":
                                objCMSRefValues.RefType = (int)CMSReferenceType.SpecialMealRequired;
                                break;                         
                        }

                        objCMSRefValues.AssocID = objJMMMedVisit.JMMedVisitID;
                        objJMMMedVisit.objCMSRefValuesList.Add(objCMSRefValues);
                    }
                }

            }
            catch (Exception)
            {

                throw;
            }

        }

      


        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            TakeSaveValues(radSpecialMealRequired);            
        }

        public void TakeSaveValues(Control radCombo)
        {


            JMMDentistVisitDB objJMMDentistVisitDB = new JMMDentistVisitDB();
            KPIRadCombo objRadCombo = ((KPIRadCombo)this.FindControl(radCombo.ID.ToString()));
            int CodeID = Int32.MinValue;
            int RefType = int.MinValue;
            string[] SchResource = null;
            string RadComboText = string.Empty;
            switch (radCombo.ID.ToString())
            {
                case "radSpecialMealRequired":
                    CodeID = 5014;
                    RefType = (int)CMSReferenceType.SpecialMealRequired;
                    break;
               

            }
            RadComboBoxItem s = new RadComboBoxItem();
            DataSet objRadDS = new DataSet();
            objRadDS = objJMMDentistVisitDB.GetChekDetails(CodeID, KPIHlp.CVI64(hdnMedVisitID.Value), RefType, KPIHlp.CVI32(hdnJurisId.Value));

            if (objRadDS.Tables[0] != null && objRadDS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < objRadDS.Tables[0].Rows.Count; i++)
                {
                    if (radCombo.ID == "radSpecialMealRequired")
                    {
                        if (radSpecialMealRequired.Items.Contains(objRadCombo.Items.FindItemByValue(objRadDS.Tables[0].Rows[i]["CodeValue"].ToString().Trim())))
                        {
                            objRadCombo.Items.FindItemByValue(objRadDS.Tables[0].Rows[i]["CodeValue"].ToString()).Selected = true;
                            objRadCombo.SelectedItem.Checked = true;
                        }
                    }
                  
                }
                if (objRadCombo.Items.Count > 0)
                {
                    if (objRadCombo.KPISelectedItems.Count >= 3)
                    {
                        objRadCombo.Localization.AllItemsCheckedString = "All items checked";
                        ((Telerik.Web.UI.RadComboBox)(objRadCombo)).Text = "All items checked";
                    }
                    else
                    {
                        switch (radCombo.ID.ToString())
                        {
                            case "radSpecialMealRequired":
                                SchResource = objRadCombo.CheckedItems.Where(x => x.Value.EndsWith("")).Select(v => v.Text).Where(x => !x.Contains("--Add 5014 --")).ToArray<string>();
                                RadComboText = string.Join(",", SchResource);
                                break;

                        }

                        objRadCombo.Localization.AllItemsCheckedString = RadComboText;
                        ((Telerik.Web.UI.RadComboBox)(objRadCombo)).Text = RadComboText;
                    }
                }
            }
        }

        #endregion


        protected void grdPrescription_InitializeRow(object sender, RowEventArgs e)
        {
            try
            {
                switch (((ContainerGridRecord)e.Row).Level)
                {
                    case 0:
                        if (e.Row.Items.FindItemByKey("JMMedPrescriptionID").Text != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("JMMedPrescriptionID").Text) && KPIHlp.CVI64(e.Row.Items.FindItemByKey("JMMedPrescriptionID").Text) > 0)
                        {
                            e.Row.Items.FindItemByKey("SupplyStatus").CssClass = "NotificationRules";
                            e.Row.Items.FindItemByKey("Schedule").CssClass = "Schedule";

                        }

                        if (e.Row.Items.FindItemByKey("PrescribeNotes").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("PrescribeNotes").Text) && e.Row.Items.FindItemByKey("PrescribeNotes").Text == "1")
                        {
                            e.Row.Items.FindItemByKey("Cmts").CssClass = "Notes";
                        }

                        if ((e.Row.Items.FindItemByKey("PrescribedAmt").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("PrescribedAmt").Text)) || (e.Row.Items.FindItemByKey("Duration").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("Duration").Text)))
                        {
                            e.Row.Items.FindItemByKey("DurationYrs").Text = e.Row.Items.FindItemByKey("PrescribedAmt").Text + ' ' + e.Row.Items.FindItemByKey("Duration").Text;
                        }
                        if ((e.Row.Items.FindItemByKey("UseEndedDttm").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("UseEndedDttm").Text)))
                        {
                            e.Row.CssClass = "grdGColor";
                        }
                        else if (String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("JMPrescriptionOrderID").Text))
                        {
                            e.Row.Items.FindItemByKey("CurQuantity").Text = string.Empty;
                        }
                        else if (e.Row.Items.FindItemByKey("CurQuantity").Text != null && KPIHlp.CVI32(e.Row.Items.FindItemByKey("CurQuantity").Text) <= 5)
                        {
                            e.Row.CssClass = "grdRedColor";
                        }
                        e.Row.Items.FindItemByKey("UseEndedDttmTemp").Text = e.Row.Items.FindItemByKey("UseEndedDttm").Text;
                        break;
                    case 1:
                        if (e.Row.Items.FindItemByKey("OrderedNotes").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("OrderedNotes").Text) && e.Row.Items.FindItemByKey("OrderedNotes").Text == "1")
                        {
                            e.Row.Items.FindItemByKey("Cmts").CssClass = "Notes";
                        }
                        e.Row.Items.FindItemByKey("QtyBalance").Text = e.Row.Items.FindItemByKey("QtyBalance").Text + " " + e.Row.Items.FindItemByKey("QuantityDesc").Text;
                        break;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }



        private void BindMedicalPrescriptionGrid(ref JMMMedPrescription objJMMedPrescription)
        {
            DataSet objDS = null;
            try
            {
                objJMMedPrescription.ScreenID = hdnScreenId.Value;
                objDS = new JMMMedPrescriptionBL().GetPrescriptionDetails(ref objJMMedPrescription);
                DataRelation objDR = new DataRelation("MasterDetails1", objDS.Tables[0].Columns["JMMedPrescriptionID"], objDS.Tables[1].Columns["JMMedPrescriptionID"], true);
                objDS.Relations.Add(objDR);
                grdPrescription.GridView.GroupedRows.Clear();
                grdPrescription.Rows.Clear();
                grdPrescription.GridView.Rows.Clear();
                grdPrescription.GridView.ClearDataSource();
                grdPrescription.DataSource = objDS;
                grdPrescription.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
            //return objDS;
        }

        protected void chkInactive_CheckedChanged(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}
