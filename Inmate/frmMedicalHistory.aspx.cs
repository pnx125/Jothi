using KPI.Framework.Setup;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;
using KPI.Phoenix.Admission;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Admission;
using KPI.Phoenix.Object.Inmate;
//using KPI.Phoenix.Global;

using KPI.Phoenix.Object.Names;
using KPI.PhoenixWeb.Inmate.UserControls;
using System;
using System.Data;
using System.Web.UI;
using KPI.Phoenix.WebControls;
using System.Web.Script.Services;
using System.Collections.Generic;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicalHistory.
    /// </summary>
    public partial class frmMedicalHistory : BasePage
    {
        public long JMBookingID = long.MinValue;
        public long NameID = long.MinValue;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

            cmdSaveNClose.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
            cmdSave.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
            cmdRefresh.Attributes.Add("onclick", "glbCtrlClicked = 'Refresh';");
            cmdPrint.Attributes.Add("onclick", "glbCtrlClicked = 'Print';");
            
            Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");
            if (Request.QueryString.Get("BookingID") != null)
            {
                hdnBookingID.Value = Request.QueryString.Get("BookingID").ToString();
                
            }
            if (Request.QueryString.Get("JMMedicalHistID") != null)
            {
                hdnJMMedicalHistID.Value = Request.QueryString.Get("JMMedicalHistID").ToString();
                             
            }
            hdnMode.Value = Request.QueryString.Get("hdnMode") == null ? string.Empty : Request.QueryString.Get("hdnMode").Trim().ToString();
            blnForceModeChange = false;
            if (string.IsNullOrEmpty(hdnJurisId.Value))
            {
                hdnJurisId.Value = Request.QueryString.Get("JurisID") != null && KPIHlp.CVI32(Request.QueryString.Get("JurisID").Trim()) > 0 ? Request.QueryString.Get("JurisID").Trim() : KPIHlp.CVS(GetPageJuris());
            }
            else {
                hdnJurisId.Value = KPIHlp.CVS(GetPageJuris());
            }

            
            
            
            if (!IsPostBack)
            {
                         
                LoadData();
            }
            else if (hdnAutoLoad.Value.ToUpper() == "ENTERKEY")
            {
                LoadData();
                hdnAutoLoad.Value = string.Empty;
            }
            if (!hdnSave.Value.Equals("Save"))
            {               

                if (HeaderCtrl.KPIInmateNameID != Int64.MinValue)
                {
                    JailQuickMenuCtrl1.Visible = true;
                    NameID = HeaderCtrl.KPIInmateNameID;
                    JailQuickMenuCtrl1.KPIInmateNameID=NameID;
                    hdnNameID.Value = NameID.ToString();
                    JMBookingID= HeaderCtrl.KPIID;
                    JailQuickMenuCtrl1.KPIID =JMBookingID;
                    hdnBookingID.Value = JMBookingID.ToString();
                    if (IsPostBack && hdnSave.Value.ToUpper()!="PRINT" && hdnSave.Value.ToUpper() != "REFRESH" && String.IsNullOrWhiteSpace(hdnAutoLoad.Value))
                    {
                        LoadData();
                    }
                    //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                    if (KPIHlp.CVI64(hdnJMMedicalHistID.Value) == long.MinValue)
                    {
                        JailQuickMenuCtrl1.Visible = false;                        
                    }
                }
                else
                {
                    JailQuickMenuCtrl1.Visible = false;
                    HeaderCtrl.KPIInmateNameID = long.MinValue;
                    hdnMode.Value = UIMode.ADD.ToString();
                }
                if (hdnJurisId.Value == KPIHlp.CVS(State.sJurisID))
                {
                    hdnLoginPFCode.Value = KPI.Global.Helper.PersonnelHlp.GetPFCode(State.sPFID);
                    hdnLoginPFDesc.Value = KPI.Global.Helper.PersonnelHlp.GetPFFullName(State.sPFID);
                    hdnLoginPFID.Value = State.sPFID.ToString();
                }
                hdnSave.Value = string.Empty;
                hdnAutoLoad.Value = string.Empty;

                
            }
        }
     

        protected bool ValidateScr()
        {
            return true;
        }

        protected void LoadData()
        {
            string strhdnMode = hdnMode.Value;//UIMode.ADD.ToString();
            JbmBooking objJbmBooking = new JbmBooking();
            JbmBookingBL objJbmBookingBL = new JbmBookingBL();
            JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
           
            try
            {
                if (!string.IsNullOrEmpty(hdnBookingID.Value) && KPIHlp.CVI64(hdnBookingID.Value) > 0)
                {
                    HeaderCtrl.KPIID = KPIHlp.CVI64(hdnBookingID.Value);
                    hdnNameID.Value = KPIHlp.CVS(HeaderCtrl.KPIInmateNameID);
                    hdnSPINNbr.Value = KPIHlp.CVS(HeaderCtrl.SPINNbr);

                    objJbmBooking.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                    objJbmBooking.JurisID = KPIHlp.CVI32(hdnJurisId.Value);

                }
                if (objJbmBooking.JMBookingID > 0)
                {
                    objJMMMedicalHist = new JmmMedicalHistBL().Select(ref objJbmBooking);

                    if (objJMMMedicalHist != null && objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID.Value > 0)
                    {
                        hdnJMMedicalHistID.Value = objJMMMedicalHist.JMMedicalHistID.Value.ToString();
                        strhdnMode = UIMode.CHG.ToString();                        
                    }
                    else
                    {
                        hdnJMMedicalHistID.Value = string.Empty;
                        
                        hdnMedHistID.Value = string.Empty;
                        hdnTabAllergy.Value = string.Empty;
                        //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                        this.tabMain.FindTabFromKey("Charting").Hidden = true;
                        this.tabMain.FindTabFromKey("MHS").Hidden = true;
                        this.tabMain.FindTabFromKey("MedicalVital").Hidden = true;
                        this.tabMain.FindTabFromKey("MedicalAllergy").Hidden = true;
                        this.tabMain.FindTabFromKey("MedicalDiabetic").Hidden = true;
                        this.tabMain.FindTabFromKey("Scheduled Appts").Hidden = true;
                    }
                }
                else
                {
                    ShowHideTabs(false);
                }
               

                if (objJMMMedicalHist != null)
                {
                    if (strhdnMode == UIMode.CHG.ToString())
                    {
                        hdnMode.Value = UIMode.CHG.ToString();
                        if (objJMMMedicalHist.JMBookingID > 0)
                        {
                            Inquiry(ref objJMMMedicalHist);
                        }
                    }
                    else if (objJMMMedicalHist.JMBookingID > 0)
                    {
                        Inquiry(ref objJMMMedicalHist);                        
                    }

                }
                else
                {
                    Inquiry(ref objJMMMedicalHist);

                }
                // Modified by Dhaneswari.S on May 20 CRM# 9620
                if (!string.IsNullOrEmpty(hdnBookingID.Value) && KPIHlp.CVI64(hdnBookingID.Value) > 0)
                {
                    objJbmBooking = objJbmBookingBL.Select(KPIHlp.CVI64(hdnBookingID.Value));
                }

                if (objJbmBooking.BookingStatus == "9" ||  objJbmBooking.BookingStatus == "8")
                {
                    //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                    if (new RepositoryDB().GetScreenPermission("8551", objJbmBooking.JurisID))
                    {
                        hdnMode.Value = UIMode.CHG.ToString();
                    }
                    else
                    {
                        hdnMode.Value = UIMode.INQ.ToString();
                    }
                }
                blnForceModeChange = true;
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected void Inquiry(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {
                DataSet objDS = null;
                KPITrace.Debug(TraceWeight.Five, "Retrieving Already Booked info b4 usrMain  ");
                usrMedicalMain usrMedMainObj = (usrMedicalMain)this.tabMain.Tabs.FindTabFromKey("Main").FindControl("usrMedicalMain1");
                usrDental objusrDental = (usrDental)this.tabMain.FindTabFromKey("Dental").FindControl("UsrDental1");
                usrMedicationHistorySupply objMedHistorySupply = (usrMedicationHistorySupply)this.tabMain.Tabs.FindTabFromKey("MHS").FindControl("usrMedicationHistorySupply");
                

                usrMedMainObj.Inquiry(ref objJMMMedicalHist);

                if (objJMMMedicalHist != null && objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID > 0)
                {
                    hdnJMMedicalHistID.Value = objJMMMedicalHist.JMMedicalHistID.Value.ToString();
                    NameCtrl obj = (NameCtrl)HeaderCtrl.FindControl("nmInmateName");
                    obj.KPISecurity = "N";


                    ShowHideTabs(true);
                    objDS = new JmmMedicalHistBL().GetMedicalTabColor(ref objJMMMedicalHist);
                }
                objusrDental.LoadData(ref objJMMMedicalHist);

                objMedHistorySupply.Inquiry(ref objJMMMedicalHist);
               

                #region Tab Color checking
                if (objDS != null && objDS.Tables[0].Rows.Count > 0)
                {
                    if (objDS.Tables[0].Rows[0][0].ToString() != "0")
                    {
                        tabMain.Tabs.FindTabFromKey("MedicalAllergy").TabCssClasses.TextCssClass = "TabRed";
                    }
                    else
                    {
                        tabMain.Tabs.FindTabFromKey("MedicalAllergy").TabCssClasses.TextCssClass = "TabBlack";
                    }

                }
                else
                {
                    tabMain.Tabs.FindTabFromKey("MedicalAllergy").TabCssClasses.TextCssClass = "TabBlack";
                }

                #endregion
                WrtActivityLog(Convert.ToInt64(hdnNameID.Value), "Retrieving Medical History info from DB", "INQ"); 
               
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected JMMMedicalHist ReadScr()
        {
            JMMMedicalHist objJMMMedicalHist = null;
            try
            {
                if (ValidateScr())
                {
                    long NameID = KPIHlp.CVI64(hdnNameID.Value);
                    objJMMMedicalHist = new JMMMedicalHist();
                    objJMMMedicalHist.JurisID = GetPageJuris();
                    objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                    objJMMMedicalHist.NameID = KPIHlp.CVI64(hdnNameID.Value);
                    if (KPIHlp.CVI64(hdnJMMedicalHistID.Value) == long.MinValue)
                    {
                        objJMMMedicalHist.JMMedicalHistID = KPICounter.GetCounterID(objJMMMedicalHist.JurisID.Value);
                    }
                    else
                    {
                        objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                    }
                    usrMedicalMain usrMedMainObj = (usrMedicalMain)this.tabMain.Tabs.FindTabFromKey("Main").FindControl("usrMedicalMain1");
                    usrMedMainObj.ReadScr(ref objJMMMedicalHist);

                    usrDental objusrDental = (usrDental)this.tabMain.Tabs.FindTabFromKey("Dental").FindControl("UsrDental1");
                    objusrDental.ReadScr(ref objJMMMedicalHist);


                    usrMedicationHistorySupply objMedHistorySupply = (usrMedicationHistorySupply)this.tabMain.Tabs.FindTabFromKey("MHS").FindControl("usrMedicationHistorySupply");
                    objMedHistorySupply.ReadScr(ref objJMMMedicalHist);

                }
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            return objJMMMedicalHist;
        }

        protected bool Save()
        {
            try
            {
                hdnSave.Value = "Load";
                JMMMedicalHist objJMMMedicalHist = ReadScr();
                bool result = false;
                JmmMedicalHistBL objJmmMedicalHistBL = new JmmMedicalHistBL(NameCallerType.Names);
                if (objJMMMedicalHist != null)
                {
                    result = objJmmMedicalHistBL.IsExist(ref objJMMMedicalHist);
                    if (!result)
                    {
                        objJMMMedicalHist.cMode = 'A';
                    }
                    else
                    {
                        objJMMMedicalHist.cMode = 'C';
                    }

                    objJmmMedicalHistBL.Manage(objJMMMedicalHist);
                    Inquiry(ref objJMMMedicalHist);
                    if (hdnMode.Value == UIMode.ADD.ToString())
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                    }
                    else
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);
                    }

                    hdnMode.Value = UIMode.CHG.ToString();
                    AutoUpdateParent();
                    
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
        }

        protected void cmdPrint_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ClearData();
            JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
            if (hdnMode.Value == UIMode.ADD.ToString() && KPIHlp.CVI64(hdnJMMedicalHistID.Value) ==long.MinValue)
            {
                hdnBookingID.Value = string.Empty;
                hdnNameID.Value = string.Empty;
                hdnMedHistID.Value = string.Empty;
                hdnJMMedicalHistID.Value = string.Empty;
                hdnSPINNbr.Value = string.Empty;
                HeaderCtrl.KPIID = long.MinValue;
            }
            else if (Request.QueryString.Get("hdnMode") == "ADD" && hdnMode.Value == UIMode.INQ.ToString())
            {
                hdnBookingID.Value = string.Empty;
                hdnNameID.Value = string.Empty;
                hdnMedHistID.Value = string.Empty;
                hdnJMMedicalHistID.Value = string.Empty;
                hdnSPINNbr.Value = string.Empty;
                hdnMode.Value = UIMode.ADD.ToString();
                HeaderCtrl.KPIID = long.MinValue;
                AddClientOnLoadScript(" window.document.frmMedicalHistory_Id.submit();");
            }
            else
            {
                if (!string.IsNullOrEmpty(hdnBookingID.Value) && KPIHlp.CVI64(hdnBookingID.Value) > 0)
                {
                    objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                    objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                    objJMMMedicalHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                    objJMMMedicalHist.NameID = KPIHlp.CVI64(hdnNameID.Value);
                    LoadData();
                }
            }
            if (hdnJMMedicalHistID.Value != null && hdnJMMedicalHistID.Value != "")
            {
                PrintReport(KPIHlp.CVI64(hdnJMMedicalHistID.Value));
                WrtActivityLog(KPIHlp.CVI64(hdnJMMedicalHistID.Value), "Medical History Entry ", "PRT");
            }            
        }

        protected void cmdRefresh_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            try
            {
                ClearData();

                JMMMedicalHist objJMMMedicalHist = new JMMMedicalHist();
                if (hdnMode.Value == UIMode.ADD.ToString() && KPIHlp.CVI64(hdnJMMedicalHistID.Value) == long.MinValue)
                {
                    hdnBookingID.Value = string.Empty;
                    hdnNameID.Value = string.Empty;
                    hdnMedHistID.Value = string.Empty;
                    hdnJMMedicalHistID.Value = string.Empty;
                    hdnSPINNbr.Value = string.Empty;
                    HeaderCtrl.KPIID = long.MinValue;
                    HeaderCtrl.lblEmptyCell2.Text = "";
                    HeaderCtrl.KPISecurity = "AC";
                    hdnMode.Value = UIMode.ADD.ToString();
                    blnForceModeChange = true;

                }
                else if (Request.QueryString.Get("hdnMode") == "ADD" && hdnMode.Value == UIMode.INQ.ToString() && KPIHlp.CVI64(hdnJMMedicalHistID.Value)==long.MinValue)
                {
                    hdnBookingID.Value = string.Empty;
                    hdnNameID.Value = string.Empty;
                    hdnMedHistID.Value = string.Empty;
                    hdnJMMedicalHistID.Value = string.Empty;
                    hdnSPINNbr.Value = string.Empty;
                    hdnMode.Value = UIMode.ADD.ToString();
                    HeaderCtrl.KPIID = long.MinValue;
                    HeaderCtrl.KPISecurity = "AC";
                    hdnMode.Value = UIMode.ADD.ToString();
                    blnForceModeChange = true;
                    AddClientOnLoadScript(" window.document.frmMedicalHistory_Id.submit();");
                }
                else
                {
                    if (!string.IsNullOrEmpty(hdnBookingID.Value) && KPIHlp.CVI64(hdnBookingID.Value) > 0)
                    {
                        objJMMMedicalHist.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                        objJMMMedicalHist.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                        objJMMMedicalHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                        objJMMMedicalHist.NameID = KPIHlp.CVI64(hdnNameID.Value);
                        LoadData();
                    }
                }
                
            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }              
        }

        #endregion Master screen toolbar events

        protected override void OnPreRender(EventArgs e)
        {
            SetClientParams();
            base.OnPreRender(e);
        }

        protected void SetClientParams()
        {
            SendParamToClient((int)JailAdmissionParams.IsDefaultAllPFFields);
        }


        protected void ShowHideTabs(bool Value)
        {
            tabMain.ShowTab("Charting", Value);
            tabMain.ShowTab("MHS", Value);
            tabMain.ShowTab("MedicalVital", Value);
            tabMain.ShowTab("MedicalAllergy", Value);
            tabMain.ShowTab("MedicalDiabetic", Value);
            tabMain.ShowTab("Scheduled Appts", Value);
                        

        }
        
    }
}