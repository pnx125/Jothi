using KPI.Framework.Object.Setup;
using KPI.Framework.Setup;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Web.UI;
using KPI.Global.KPIWebControls;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;


namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicationHist.
    /// </summary>
    public partial class frmMedicationHist : BasePage
    {
        private long MARSignID = long.MinValue;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            cmdSaveNClose.Attributes.Add("OnClick", "glbCtrlClicked = 'Save';");
            cmdSave.Attributes.Add("OnClick", "glbCtrlClicked = 'Save';");
            cmdPrint.Attributes.Add("OnClick", "glbCtrlClicked = 'Print';");
            Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");
            imgMedSignature.GenerateImage(true, ImgType.Signature, ImgRefType.SignOfficer, long.MinValue, short.MinValue);
            imgMedSignature.Attributes.Add("OnClick", "return fn_UpdateReceivedSign('hdnMarSignId');");
            hdnJurisId.Value = ((BasePage)Page).GetPageJuris().ToString();
            MARSignID = KPIHlp.CVI64(hdnMarSignId.Value);
            txtDispense.Attributes.Add("OnBlur", "return fn_Commentsmandatory();");
            if (!Page.IsPostBack)
            {
                imgFrontView.GenerateImage(true, ImgType.FrontView, ImgRefType.Names, -1, short.MinValue);
                if (Request.QueryString.Get("Flag") != null && Request.QueryString.Get("Flag") != string.Empty)
                {
                    idMar.Style.Add("display", "");
                    individualMAr.Style.Add("display", "none");
                    NamCtrlSPIN.KPISecurity = "N";
                    tdFlag.Style.Add("height", "100% !important;");
                    tdFlag.Style.Add("width", "90% !important;");

                    trFlagisNotNull.Style.Add("display", "");
                    trFlagisNull.Style.Add("display", "none");

                    if (Request.QueryString.Get("hdnMode") != null && Request.QueryString.Get("hdnMode") != string.Empty)
                    {
                        hdnMode.Value = Request.QueryString.Get("hdnMode").Trim();
                    }
                    else
                    {
                        hdnMode.Value = UIMode.ADD.ToString();
                    }

                    LoadData();

                }
                else
                {
                    hdnMode.Value = "ADD";
                    idMar.Style.Add("display", "none");
                    individualMAr.Style.Add("display", "");
                    tdDrug.Attributes.Add("class", "req");

                    lupPFNo.KPIID = State.sPFID;

                    trFlagisNull.Style.Add("display", "");
                    trFlagisNotNull.Style.Add("display", "none");
                    
                }
               
            }

            if (String.IsNullOrWhiteSpace(Request.QueryString.Get("Flag")))
            {
                    AddClientOnLoadScript("SetImage();");
                    hdnShowImage.Value = "Show";
                    AddClientOnLoadScript("nDisable('dttmLstAdministered',18);nDisable('dttmLstAdministered',19);");                                  
            }
            if (MARSignID != long.MinValue)
            {
                imgMedSignature.GenerateImage(true, ImgType.Signature, ImgRefType.JMMMarInmateOfficer, MARSignID, short.MinValue);
            }
        }

        protected void LoadData()
        {
            JMMMedVisit objMedVisit = new JMMMedVisit();
            string strhdnMode = UIMode.ADD.ToString();
            long NameID, JMBookingID;
            try
            {

             

                if (Request.QueryString.Get("JMMedPrescriptionID") != null && Request.QueryString.Get("JMMedPrescriptionID") != string.Empty)
                {
                    hdnPrescriptionID.Value = Request.QueryString.Get("JMMedPrescriptionID").Trim();
                }
                

                //hdnSchID.Value = Request.QueryString.Get("JMPrescriptionSchduleID") == null ? string.Empty : Request.QueryString.Get("JMPrescriptionSchduleID").Trim();
                NameID = Request.QueryString.Get("NameID") == null ? long.MinValue : KPIHlp.CVI64(Request.QueryString.Get("NameID").Trim());
                if (Request.QueryString.Get("JMMedPrescriptionHistID") != null && Request.QueryString.Get("JMMedPrescriptionHistID") != string.Empty)
                {
                    hdnMedPresHisID.Value = Request.QueryString.Get("JMMedPrescriptionHistID").Trim();
                    hdnMode.Value = UIMode.INQ.ToString();
                }

                hdnJMMScheduleEventsID.Value = Request.QueryString.Get("JMMScheduleEventsID") == null ? string.Empty : Request.QueryString.Get("JMMScheduleEventsID").Trim();
                hdnJurisId.Value = Request.QueryString.Get("JurisID") == null ? GetPageJuris().ToString(): Request.QueryString.Get("JurisID").Trim();
                try
                {
                    if (NameID > 0)
                    {
                        NamCtrlSPIN.KPIID = NameID;
                        imgFrontView.GenerateImage(true, ImgType.FrontView, ImgRefType.Names, NameID, short.MinValue);
                    }
                }
                catch (KPIException objKPIError)
                {
                    throw objKPIError;
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }

            if (hdnMode.Value == UIMode.INQ.ToString()) //Added by jeyaganesh
            {               
                blnForceModeChange = true;       
                JMMMedPrescription objJMMMedPrescription = new JMMMedPrescription();
                JMMMedPrescriptionBL objJMMMedPrescriptionBL = new JMMMedPrescriptionBL();
                JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
                KPITxtBL objKPITxtBL = new KPITxtBL();
                

                try
                {
                    objJMMMedPrescriptionHist = new JMMMedPrescriptionHistBL().Select(KPIHlp.CVI64(hdnMedPresHisID.Value));
                    
                    
                    if (objJMMMedPrescriptionHist != null && objJMMMedPrescriptionHist.JMMedPrescriptionHistID.HasValue)
                    {
                        txtNotes.Text = objKPITxtBL.GetDisplayText(objJMMMedPrescriptionHist.JMMedPrescriptionHistID.Value, TxtType.JmMed_MedHisCmnts);
                        txtDrug.Text = new CodedBL().GetCodeDescription(6007, objJMMMedPrescriptionHist.Drug, objJMMMedPrescriptionHist.JurisID.Value);
                        txtDosage.Text = objJMMMedPrescriptionHist.Dosage;
                        txtBalance.Text = objJMMMedPrescriptionHist.CurQuantity.HasValue ? objJMMMedPrescriptionHist.CurQuantity.Value.ToString() : string.Empty;
                        if(!String.IsNullOrWhiteSpace(txtBalance.Text) && KPIHlp.CVI32(txtBalance.Text) <= 5)
                        {
                            txtBalance.ForeColor = System.Drawing.Color.Red;
                            tdComments.Attributes.Add("class", "req");
                        }

                        imgMedSignature.Style.Add("pointer-events", "none");
                        if (objJMMMedPrescriptionHist.Dispense.HasValue && objJMMMedPrescriptionHist.Dispense.Value > 0)
                        {
                            txtDispense.Text = objJMMMedPrescriptionHist.Dispense.HasValue ? objJMMMedPrescriptionHist.Dispense.Value.ToString() : String.Empty;
                        }
                        else
                        {
                            txtDispense.Text = string.Empty;

                        }
                        
                        cddDispense.KPISelectedCodeValue = objJMMMedPrescriptionHist.MedicationType;

                        if (objJMMMedPrescriptionHist.LastAdministeredDttm.HasValue)
                        {
                            dttmLstAdministered.DateValue = objJMMMedPrescriptionHist.LastAdministeredDttm.Value;

                        }
                        else
                        {
                            if (dttmLstAdministered.DateValue == DateTime.MinValue)
                            {
                                dttmLstAdministered.DateValue = new JMMMedPrescriptionHistBL().GetLastAdministeredDttm(ref objJMMMedPrescriptionHist);
                            }
                        }
                        if (objJMMMedPrescriptionHist.ActivityDttm.HasValue)
                        {                           
                            dttmDateTime.DateValue = objJMMMedPrescriptionHist.ActivityDttm.Value;
                        }
                        if (objJMMMedPrescriptionHist.MarPFID.HasValue)
                        {
                            lupPFNo.KPIID = objJMMMedPrescriptionHist.MarPFID.Value; 
                        }
                        cddMethodAdmin.KPISelectedCodeValue = objJMMMedPrescriptionHist.MethodAdministered; 
                        cddStatus.KPISelectedCodeValue = objJMMMedPrescriptionHist.Status;
                        if (objJMMMedPrescriptionHist.MarPFSignID.HasValue)
                        {
                            hdnMarSignId.Value = objJMMMedPrescriptionHist.MarPFSignID.ToString();
                            imgMedSignature.GenerateImage(true, ImgType.Signature, ImgRefType.JMMMarInmateOfficer, objJMMMedPrescriptionHist.MarPFSignID.Value, short.MinValue);                            
                        }
                        else
                        {
                            hdnMarSignId.Value =string.Empty;
                        }

                        txtInstructions.Text = objJMMMedPrescriptionHist.Instructions;
                        
                       
                    }
                }
                catch (Exception objError)
                {
                    ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
                }
            }
            else
            {
                hdnMode.Value = UIMode.ADD.ToString();
                txtDrug.Text = Request.QueryString.Get("Drug") == null ? string.Empty : Request.QueryString.Get("Drug").Trim();

                if (!String.IsNullOrWhiteSpace(txtDrug.Text))
                {
                    txtDrug.Text = new CodedBL().GetCodeDescription(6007, txtDrug.Text, KPIHlp.CVI32(hdnJurisId.Value));
                }

                txtDosage.Text = Request.QueryString.Get("Dosage") ==null?string.Empty: Request.QueryString.Get("Dosage").Trim();
                //txtBalance.Text = Request.QueryString.Get("CurQuantity") == null ? string.Empty : Request.QueryString.Get("CurQuantity").Trim();

                JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
                objJMMMedPrescriptionHist.JMMedPrescriptionID = KPIHlp.CVI64(hdnPrescriptionID.Value);
                txtBalance.Text = new JMMMedPrescriptionHistBL().GetMedicationBalance(ref objJMMMedPrescriptionHist).ToString();

                hdnPrescriptionID.Value = Request.QueryString.Get("JMMedPrescriptionID") == null ? string.Empty : Request.QueryString.Get("JMMedPrescriptionID").Trim();
                JMBookingID = Request.QueryString.Get("JMBookingID") == null ? long.MinValue : KPIHlp.CVI64(Request.QueryString.Get("JMBookingID").Trim());

                
                lupPFNo.KPIID = State.sPFID;


                ReadAddMode();

                

                
            }
        }

        private bool ValidateScr()
        {
            return true;
        }

        private JMMMedPrescriptionHist ReadScr(ref JMMMedPrescription objJMMMedPrescription)
        {
            JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
            
            try
            {
                if (ValidateScr())
                {
                    objJMMMedPrescriptionHist.JMMedPrescriptionID = objJMMMedPrescription.JMMedPrescriptionID;
                    objJMMMedPrescriptionHist.JurisID = objJMMMedPrescription.JurisID;
                    objJMMMedPrescriptionHist.JMBookingID = objJMMMedPrescription.JMBookingID;
                    objJMMMedPrescriptionHist.JMMedicalHistID = objJMMMedPrescription.JMMedicalHistID;
                    objJMMMedPrescriptionHist.JMMedVisitID = objJMMMedPrescription.JMMedVisitID;
                    objJMMMedPrescriptionHist.PrescribedDttm = objJMMMedPrescription.PrescribedDttm;
                    objJMMMedPrescriptionHist.PrescribingDoctorID = objJMMMedPrescription.PrescribingDoctorID;
                    objJMMMedPrescriptionHist.MedicalPrescriptionNo = objJMMMedPrescription.MedicalPrescriptionNo;
                    objJMMMedPrescriptionHist.Prescription = objJMMMedPrescription.Prescription;
                    objJMMMedPrescriptionHist.Drug = objJMMMedPrescription.Drug;
                    objJMMMedPrescriptionHist.Dosage = objJMMMedPrescription.Dosage;
                    objJMMMedPrescriptionHist.PrescribedAmt = objJMMMedPrescription.PrescribedAmt;
                    objJMMMedPrescriptionHist.PrescribedDuration = objJMMMedPrescription.PrescribedDuration;
                    objJMMMedPrescriptionHist.CurQuantity = KPIHlp.CVI32(txtBalance.Text); //objJMMMedPrescription.CurQuantity;
                    objJMMMedPrescriptionHist.RefillBal = objJMMMedPrescription.RefillBal == short.MinValue ? 0 : objJMMMedPrescription.RefillBal;
                    objJMMMedPrescriptionHist.IsGeneric = objJMMMedPrescription.IsGeneric;
                    objJMMMedPrescriptionHist.Times = objJMMMedPrescription.Times;
                    
                    if (String.IsNullOrWhiteSpace(Request.QueryString.Get("Flag")))
                    {
                        objJMMMedPrescriptionHist.IsPersonalProp = 1;
                    }
                    else
                    {
                        objJMMMedPrescriptionHist.IsPersonalProp = objJMMMedPrescription.IsPersonalProp;
                    }                   
                    objJMMMedPrescriptionHist.MedicationType = cddDispense.CodeValue;                    
                    objJMMMedPrescriptionHist.UseEndedDttm = objJMMMedPrescription.UseEndedDttm;
                    
                   
                    objJMMMedPrescriptionHist.CreatedPFID = objJMMMedPrescription.CreatedPFID;
                    objJMMMedPrescriptionHist.CreatedDttm = objJMMMedPrescription.CreatedDttm;
                    objJMMMedPrescriptionHist.ModifiedPFID = objJMMMedPrescription.ModifiedPFID;
                    objJMMMedPrescriptionHist.ModifiedDttm = objJMMMedPrescription.ModifiedDttm;
                    objJMMMedPrescriptionHist.Custom1 = objJMMMedPrescription.Custom1;
                    objJMMMedPrescriptionHist.Custom2 = objJMMMedPrescription.Custom2;
                    objJMMMedPrescriptionHist.Dispense = KPIHlp.CVI32(txtDispense.Text); 
                    
                    objJMMMedPrescriptionHist.JMMScheduleEventsID = KPIHlp.CVI64(hdnJMMScheduleEventsID.Value);                    
                    objJMMMedPrescriptionHist.JMMedPrescriptionHistID = KPICounter.GetCounterID(objJMMMedPrescriptionHist.JurisID.Value);

                    objJMMMedPrescriptionHist.ActivityDttm = dttmDateTime.DateValue;
                    if (lupPFNo.KPIID != long.MinValue)
                    {
                        objJMMMedPrescriptionHist.MarPFID = lupPFNo.KPIID;
                    }
                    if (KPIHlp.CVI64(hdnMarSignId.Value) != long.MinValue)
                    {
                        objJMMMedPrescriptionHist.MarPFSignID = KPIHlp.CVI64(hdnMarSignId.Value);
                    }
                    objJMMMedPrescriptionHist.MethodAdministered = cddMethodAdmin.CodeValue;
                    if (objJMMMedPrescriptionHist.CurQuantity == 0 && String.IsNullOrWhiteSpace(objJMMMedPrescriptionHist.MethodAdministered))
                    {
                        objJMMMedPrescriptionHist.Status = "MEU";
                    }
                    else
                    {
                        objJMMMedPrescriptionHist.Status = cddStatus.CodeValue;
                    }
                    objJMMMedPrescriptionHist.MedicationNotes = txtNotes.Text;
                    objJMMMedPrescriptionHist.Instructions = txtInstructions.Text;
                    if (dttmLstAdministered.DateValue != DateTime.MinValue)
                    {
                        objJMMMedPrescriptionHist.LastAdministeredDttm = dttmLstAdministered.DateValue;
                    }
                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return objJMMMedPrescriptionHist;
        }

        private bool Save()
        {
            try
            {
                JMMMedPrescription objJMMMedPrescription = new JMMMedPrescriptionBL().Select(KPIHlp.CVI64(hdnPrescriptionID.Value));

                JMMMedPrescriptionHist objJMMMedPrescriptionHist = ReadScr(ref objJMMMedPrescription);
                objJMMMedPrescription.JMMedPrescriptionID = KPIHlp.CVI64(hdnPrescriptionID.Value);
             

                if (objJMMMedPrescriptionHist != null && objJMMMedPrescription != null)
                {
                    if (Request.QueryString.Get("Flag") != null && Request.QueryString.Get("Flag") != string.Empty)
                    {
                        if (hdnMode.Value == UIMode.ADD.ToString())
                        {
                            new JMMMedPrescriptionHistBL().Manage(objJMMMedPrescriptionHist);
                            ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                            hdnMedPresHisID.Value = objJMMMedPrescriptionHist.JMMedPrescriptionHistID.Value.ToString();
                            AutoUpdateParent();
                        }
                        else
                        {
                            ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);
                        }
                        hdnMode.Value = UIMode.INQ.ToString();
                        blnForceModeChange = true;


                    }
                    else
                    {
                        if (hdnMode.Value == UIMode.ADD.ToString())
                        {
                            new JMMMedPrescriptionHistBL().Manage(objJMMMedPrescriptionHist);
                            ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                            hdnMedPresHisID.Value = string.Empty; //objJMMMedPrescriptionHist.JMMedPrescriptionHistID.Value.ToString();
                            ClearData();
                            cddDrug.DropDown.Items.Clear();
                            cddDrug.DropDown.DataTextField = "Description";
                            cddDrug.DropDown.DataValueField = "ID";
                            cddDrug.DropDown.DataBind();

                            ListItem objItem1 = new ListItem("--", "");
                            cddDrug.DropDown.Items.Insert(0, objItem1);
                            AddClientOnLoadScript("fn_ClearData();");
                        }

                    }
                    
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
                CloseScr();
                //AddClientOnLoadScript("window.opener.grdMedreqlist_Grid_Initialize();");
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
                KPITrace.Debug(TraceWeight.Five, "SaveAndClose Event-Started.");
                Save();
                string url = Request.UrlReferrer.ToString();
                CloseScr();
                if (Request.QueryString.Get("ScreenHeight") != null)
                {
                    ClearData();
                    AddClientOnLoadScript("setTimeout(function () {try{LoadCloseMenu(undefined,'" + url + "','Individual MAR');}catch(e){}}, 100);");
                }
                KPITrace.Debug(TraceWeight.Five, "SaveAndClose Event-Finished.");
                //AddClientOnLoadScript("window.opener.grdMedreqlist_Grid_Initialize();");
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
            if (KPIHlp.CVI64(hdnMedPresHisID.Value) != long.MinValue)
            {
                PrintReport(KPIHlp.CVI64(hdnMedPresHisID.Value));
            }
            else
            {
                PrintReport();
            }         
        }

        protected void cmdRefresh_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ClearData();
            LoadData();

            if (String.IsNullOrWhiteSpace(Request.QueryString.Get("Flag")))
            {
                if (NamCtrlSPIN.KPIID == long.MinValue)
                {
                    AddClientOnLoadScript("nGCO('imgNameFrontView').src = '';nGCO('imgFrontView').src = glbSitePath + '/KPIFrameworkWeb/Home/frmHandle.aspx?blnThumb=True&ImgType=1&RefType=1&RefID=-9223372036854775808&RefSeqNo=-32768&ImageTable=0';");                    
                }
                hdnShowImage.Value = "Hide";
            }
        }

        #endregion Master screen toolbar events

        [ScriptMethod()]
        [WebMethod()]
        public static object CheckActionComments(string CodeValue, Int32 sJurisID)
        {
            string obj = new JMMMedPrescriptionHistBL().GetActionComments(CodeValue, sJurisID);
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(obj);
        }

        [ScriptMethod()]
        [WebMethod()]
        public static List<ListItem> GetDrugData(string BookingID, Int32 sJurisID)
        {
            DataSet objDs = new DataSet();
            IDataReader objReader = new TableDB().TableWhere(sJurisID, (int)TableID.JMMDrug, string.Empty, String.Empty, BookingID);
            List<ListItem> customers = new List<ListItem>();
            while (objReader.Read())
            {
                customers.Add(new ListItem
                {
                    Value = objReader["ID"].ToString(),
                    Text = objReader["Description"].ToString()
                });

            }

            if (objReader != null && !objReader.IsClosed)
            {
                objReader.Close();
            }

            return customers;
        }

        public void ReadAddMode()
        {
            try
            {
                JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
                objJMMMedPrescriptionHist.JMMScheduleEventsID = KPIHlp.CVI64(hdnJMMScheduleEventsID.Value);
                objJMMMedPrescriptionHist.JMMedPrescriptionID = KPIHlp.CVI64(hdnPrescriptionID.Value);

                JMMScheduleEvents objJMMScheduleEvents = null;
                if (objJMMMedPrescriptionHist.JMMScheduleEventsID.HasValue)
                {

                    objJMMScheduleEvents = new JMMScheduleEventsBL().Select(objJMMMedPrescriptionHist.JMMScheduleEventsID.Value);
                    if (objJMMScheduleEvents != null)
                    {
                        cddDispense.KPISelectedCodeValue = objJMMScheduleEvents.MedicationType; //Request.QueryString.Get("MedicationType") == null ? string.Empty : Request.QueryString.Get("MedicationType").Trim();
                        //txtDispense.Text = objJMMScheduleEvents.Dispense.HasValue ? objJMMScheduleEvents.Dispense.ToString() : "0";// Request.QueryString.Get("Dispense") == null ? string.Empty : Request.QueryString.Get("Dispense").Trim();

                        txtInstructions.Text = objJMMScheduleEvents.Instructions;
                        objJMMMedPrescriptionHist.MedicationType = objJMMScheduleEvents.MedicationType;// Request.QueryString.Get("MedicationType") == null ? string.Empty : Request.QueryString.Get("MedicationType").Trim();
                    }

                }

             

                objJMMMedPrescriptionHist = new JMMMedPrescriptionHistBL().GetLastAdministered(objJMMMedPrescriptionHist.JMMedPrescriptionID.Value);  //objJMMMedPrescriptionHist.MedPresSchID

                if (objJMMMedPrescriptionHist != null && objJMMMedPrescriptionHist.ActivityDttm.HasValue)
                {
                    dttmLstAdministered.DateValue = objJMMMedPrescriptionHist.ActivityDttm.Value;
                }              

            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
        }


        #region WebService

        [ScriptMethod()]
        [WebMethod()]
        public static object GetLastAdministered(string JMMedPrescriptionID)
        {
            JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHistBL().GetLastAdministered(KPIHlp.CVI64(JMMedPrescriptionID));
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(objJMMMedPrescriptionHist);
        }


        [ScriptMethod()]
        [WebMethod()]
        public static object GetScheduleEvents(string JMMScheduleEventsID)
        {
            JMMScheduleEvents objJMMScheduleEvents = new JMMScheduleEventsBL().Select(KPIHlp.CVI64(JMMScheduleEventsID));
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(objJMMScheduleEvents);

        }

        [ScriptMethod()]
        [WebMethod()]
        public static object GetMedicationBalance(string JMMedPrescriptionID, string MedicationType)
        {
            JMMMedPrescriptionHist objJMMMedPrescriptionHist = new JMMMedPrescriptionHist();
            objJMMMedPrescriptionHist.JMMedPrescriptionID = KPIHlp.CVI64(JMMedPrescriptionID);
            objJMMMedPrescriptionHist.MedicationType = MedicationType;
            objJMMMedPrescriptionHist.CurQuantity = new JMMMedPrescriptionHistBL().GetMedicationBalance(ref objJMMMedPrescriptionHist);
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(objJMMMedPrescriptionHist);

        }


        [ScriptMethod()]
        [WebMethod()]
        public static object LoadCoded(string sCodeID, string JMBookingID, string sJurisID)
        {
            IDataReader objReader = new TableDB().TableWhere(KPIHlp.CVI32(sJurisID), KPIHlp.CVI32(sCodeID), string.Empty, String.Empty, JMBookingID);
            DataSet DSCoded = new DataSet();

            DSCoded.Tables.Add();
            DSCoded.Load(objReader, LoadOption.PreserveChanges, DSCoded.Tables[0]);
            if (objReader != null && !objReader.IsClosed)
            {
                objReader.Close();
            }

            List<Coded> LstCoded = null;
            if (DSCoded != null && DSCoded.Tables[0].Rows.Count > 0)
            {
                LstCoded = (from CodedRow in DSCoded.Tables[0].AsEnumerable().Cast<DataRow>()
                            select new Coded
                            {
                                CodeValue = Convert.ToString(CodedRow["CodeValue"]).Trim(),
                                Description = Convert.ToString(CodedRow["Description"])
                            }).ToList();
            }
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(LstCoded);
        }


        [ScriptMethod()]
        [WebMethod()]
        public static object LoadCoded788(string sCodeID, string JMBookingID, string Drug, string sJurisID)
        {
            IDataReader objReader = new TableDB().TableWhere(KPIHlp.CVI32(sJurisID), KPIHlp.CVI32(sCodeID), string.Empty, String.Empty, JMBookingID, Drug);
            DataSet DSCoded = new DataSet();

            DSCoded.Tables.Add();
            DSCoded.Load(objReader, LoadOption.PreserveChanges, DSCoded.Tables[0]);
            if (objReader != null && !objReader.IsClosed)
            {
                objReader.Close();
            }

            List<Coded> LstCoded = null;
            if (DSCoded != null && DSCoded.Tables[0].Rows.Count > 0)
            {
                LstCoded = (from CodedRow in DSCoded.Tables[0].AsEnumerable().Cast<DataRow>()
                            select new Coded
                            {
                                CodeValue = Convert.ToString(CodedRow["CodeValue"]).Trim(),
                                Description = Convert.ToString(CodedRow["Description"])
                            }).ToList();
            }
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(LstCoded);
        }



 

        #endregion

        protected void Page_Init(object sender, System.EventArgs e)
        {
            if (String.IsNullOrWhiteSpace(Request.QueryString.Get("Flag")))
            {
                if (Request.QueryString.Get("JMMedPrescriptionID") != null && Request.QueryString.Get("JMMedPrescriptionID").ToString() != string.Empty)
                {
                    cddDispense.KPIFlag = Request.QueryString.Get("JMMedPrescriptionID").ToString();

                }
            }
        }
    }
}

