using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using System;
using System.Web.UI;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System.Text;
using KPI.Global.KPIWebControls;
using Telerik.Web.UI;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using KPI.Phoenix.Helper;
using KPI.Framework.Setup;
using System.Web.UI.WebControls;
using KPI.Framework.Object.Setup;
using KPI.Global.CacheMgr;
using System.Web.UI.HtmlControls;
using KPI.Framework.Object.Home;
using KPI.Framework.Home;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmMedicalDentist.
    /// </summary>
    public partial class frmMedicalDentist : BasePage
    {

        List<RadComboBoxItem> objSaved = new List<RadComboBoxItem>();
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                cmdAdd.Attributes.Add("onclick", "return fn_PrescriptionGridManip_Row();");
                cmdClear.Attributes.Add("onclick", "return fn_CancelEditgrdToothRow();");
                cmdSaveNClose.Attributes.Add("onclick", "glbCtrlClicked = 'SaveClose';");
                cmdSave.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");
                cmdEditor.Attributes.Add("OnClick", "return fn_OpenTextEditor();");
                KPIImageButton objDentistIbubble = ((KPI.Global.KPIWebControls.KPIImageButton)(lupAttendingDoctor.FindControl("cmdIncOnAddr")));
                objDentistIbubble.Attributes.Add("onClick", "return fn_DentistEntry();");
                AddClientOnLoadScript("fn_visitDoctorNurse();"); 
                if (Request.QueryString.Get("hdnJurisId") != null && !String.IsNullOrEmpty(Request.QueryString.Get("hdnJurisId"))) //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                {
                    hdnJurisID.Value = Request.QueryString.Get("hdnJurisId");
                }
                else
                {
                    hdnJurisID.Value = KPIHlp.CVS(GetPageJuris());
                }
                if (Request.QueryString.Get("hdnMode") != null && Request.QueryString.Get("hdnMode") != string.Empty)
                {
                    hdnMode.Value = Request.QueryString.Get("hdnMode").ToString();
                }

                
                if (!Page.IsPostBack)
                {
                    hdnSetUserPFID.Value = State.GPV((int)JailAdmissionParams.IsDefaultAllPFFields, KPIHlp.CVI32(hdnJurisID.Value));
                }
                if (Request.QueryString.Get("BookingID") != null)
                {
                    hdnBookingID.Value = Request.QueryString.Get("BookingID");
                }
               

              

                if (Request.QueryString.Get("JMDentistVisitID") != null && !String.IsNullOrEmpty(Request.QueryString.Get("JMDentistVisitID")))
                {
                    hdnDentVisitID.Value = Request.QueryString.Get("JMDentistVisitID");
                }
                if (State.sJurisID == KPIHlp.CVI32(hdnJurisID.Value))
                {
                    hdnLoginPFCode.Value = KPI.Global.Helper.PersonnelHlp.GetPFCode(State.sPFID);
                    hdnLoginPFDesc.Value = KPI.Global.Helper.PersonnelHlp.GetPFFullName(State.sPFID);
                    hdnLoginPFID.Value = State.sPFID.ToString();
                }
                if (!Page.IsPostBack)
                {
                    LoadData();
                }

                Infragistics.Web.UI.EditorControls.WebDateTimeEditor WDT = (Infragistics.Web.UI.EditorControls.WebDateTimeEditor)dttmDentalVisitDate.FindControl("Time");
                WDT.ClientEvents.Blur = "KPISetShortTimeHM_VisitedDttm";

                WDT.ClientEvents.ValueChanged = "KPISetShortTimeHM_VisitedDttm";
                WDT.ClientEvents.TextChanged = "KPISetShortTimeHM_VisitedDttm";

                //hdnMode.Value = hdnMode.Value;
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }
        public void TakeSaveValues(Control radCombo)
        {


            JMMDentistVisitDB objJMMDentistVisitDB = new JMMDentistVisitDB();
            KPIRadCombo objRadComboDental = ((KPIRadCombo)this.FindControl(radCombo.ID.ToString()));
            int CodeID=Int32.MinValue;
            int RefType = int.MinValue;
            string[] SchResource = null;
            string RadComboText = string.Empty;
            switch (radCombo.ID.ToString())
            {
                case "radDentProcedure":
                    CodeID = 3172;
                    RefType = (int)CMSReferenceType.DentalProcedures;
                    break;
                case "radDentDisease":
                    CodeID = 3173;
                    RefType =(int)CMSReferenceType.DentalDiseases;
                    break;
                case "radDentMedications":
                    CodeID = 3174;
                    RefType =(int)CMSReferenceType.DentalMedications;
                    break;

            }
            RadComboBoxItem s = new RadComboBoxItem();
            DataSet objRadDentist = new DataSet();
            objRadDentist = objJMMDentistVisitDB.GetChekDetails(CodeID, KPIHlp.CVI64(hdnDentVisitID.Value), RefType, KPIHlp.CVI32(hdnJurisID.Value));

            if (objRadDentist.Tables[0] != null && objRadDentist.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < objRadDentist.Tables[0].Rows.Count; i++)
                {
                    if (radCombo.ID == "radDentProcedure")
                    {
                        if (radDentProcedure.Items.Contains(objRadComboDental.Items.FindItemByValue(objRadDentist.Tables[0].Rows[i]["CodeValue"].ToString().Trim())))
                        {
                            objRadComboDental.Items.FindItemByValue(objRadDentist.Tables[0].Rows[i]["CodeValue"].ToString()).Selected = true;
                            objRadComboDental.SelectedItem.Checked = true;
                        }
                    }
                    if (radCombo.ID == "radDentDisease")
                    {
                        if (radDentDisease.Items.Contains(objRadComboDental.Items.FindItemByValue(objRadDentist.Tables[0].Rows[i]["CodeValue"].ToString().Trim())))
                        {
                            objRadComboDental.Items.FindItemByValue(objRadDentist.Tables[0].Rows[i]["CodeValue"].ToString()).Selected = true;
                            objRadComboDental.SelectedItem.Checked = true;
                        }
                    }
                    if (radCombo.ID == "radDentMedications")
                    {
                        if (radDentMedications.Items.Contains(objRadComboDental.Items.FindItemByValue(objRadDentist.Tables[0].Rows[i]["CodeValue"].ToString().Trim())))
                        {
                            objRadComboDental.Items.FindItemByValue(objRadDentist.Tables[0].Rows[i]["CodeValue"].ToString()).Selected = true;
                            objRadComboDental.SelectedItem.Checked = true;
                        }
                    }
                }
                if (objRadComboDental.Items.Count > 0)
                {

                    //string[] SchResource = objRadComboDental.CheckedItems.Where(x => x.Value.EndsWith("")).Select(v => v.Text).ToArray<string>(); //objRadComboDental.CheckedItems.Where(x => x.Value.EndsWith("$#_00")).Select(v => v.Value.Replace("$#_00", "")).ToArray<string>();
                    
                    if (objRadComboDental.KPISelectedItems.Count >= 3)
                    {
                        objRadComboDental.Localization.AllItemsCheckedString = "All items checked";
                        ((Telerik.Web.UI.RadComboBox)(objRadComboDental)).Text = "All items checked";
                    }
                    else
                    {
                        switch (radCombo.ID.ToString())
                        {
                            case "radDentProcedure":
                                 SchResource = objRadComboDental.CheckedItems.Where(x => x.Value.EndsWith("")).Select(v => v.Text).Where(x => !x.Contains("--Add 3172 --")).ToArray<string>();
                                RadComboText = string.Join(",", SchResource);
                                break;
                            case "radDentDisease":
                                 SchResource = objRadComboDental.CheckedItems.Where(x => x.Value.EndsWith("")).Select(v => v.Text).Where(x => !x.Contains("--Add 3173 --")).ToArray<string>();
                                RadComboText = string.Join(",", SchResource);
                                break;
                            case "radDentMedications":
                                SchResource = objRadComboDental.CheckedItems.Where(x => x.Value.EndsWith("")).Select(v => v.Text).Where(x => !x.Contains("--Add 3174 --")).ToArray<string>();
                                RadComboText = string.Join(",", SchResource);
                                break;

                        }

                        objRadComboDental.Localization.AllItemsCheckedString = RadComboText;
                        ((Telerik.Web.UI.RadComboBox)(objRadComboDental)).Text = RadComboText;
                    }
                }
            }
        }
        public void AddListItem(string sDispOption, string sScreenMode, string sValue, string sText, string sIsActive)
        {
            String DescriptionText = "";

           
            if (sDispOption.Length > 1)
            {
                if (sDispOption == "Both")
                    DescriptionText = sValue + " - " + sText;
                else if (sDispOption == "CodeValue")
                    DescriptionText = sValue;
                else if (sDispOption == "Description")
                    DescriptionText = sText;
            }
            else
            {
                //In Add mode don't show Inactive Code
                if (sScreenMode == UIMode.ADD.ToString() && sIsActive != "1")
                    return;

                string sInActive = "";

                if (sIsActive != "1")
                    sInActive = "# ";
                //0-Both, 1-Description, 2-Value
                if (sDispOption == "0")
                    DescriptionText = sInActive + sValue + " - " + sText;
                else if (sDispOption == "2")
                    DescriptionText = sInActive + sValue;
                else if (sDispOption == "1")
                    DescriptionText = sInActive + sText;
            }

            if (sValue != "" && sValue != string.Empty)
                sValue = sValue.Trim();



            //Do not show the InActive coded for EMS module - CRM#25190-Mani Dated on 12/27/2012-code reviewd by Vijay.R
        
           

                if (sScreenMode != string.Empty && sScreenMode == "ADD" && sIsActive == "0")
                {
                    radDentProcedure.Items.Add(new Telerik.Web.UI.RadComboBoxItem() { Text = DescriptionText, Value = sValue, Enabled = false, ToolTip = DescriptionText });
                }

                else
                {
                    radDentProcedure.Items.Add(new Telerik.Web.UI.RadComboBoxItem() { Text = DescriptionText, Value = sValue, ToolTip = DescriptionText });
                }
            
        }


        protected void LoadData()
        {
            string strhdnMode = string.Empty;
            long BookingID = long.MinValue;
            long NameID = long.MinValue;
            JMMDentistVisit objJMMDentistVisit = new JMMDentistVisit();
            try
            {
                if (Request.QueryString.Get("hdnMode") != null)
                {
                    if (Request.QueryString.Get("hdnMode").ToString() == UIMode.ADD.ToString())
                    {
                        if (String.IsNullOrEmpty(hdnMode.Value) && hdnMode.Value == UIMode.ADD.ToString())
                        {
                            strhdnMode = Request.QueryString.Get("hdnMode").ToString();
                        }
                        else
                        {
                            strhdnMode = hdnMode.Value;
                        }
                    }
                    else
                    {
                        strhdnMode = Request.QueryString.Get("hdnMode").ToString();
                        hdnMode.Value = strhdnMode;

                    }
                    
                    
                    if (hdnMode.Value == UIMode.ADD.ToString())
                    {
                        hdnMode.Value = strhdnMode;
                    }
                    else
                    {
                        hdnMode.Value = strhdnMode;
                    }
                }
                else if (String.IsNullOrEmpty(hdnMode.Value))
                {
                    strhdnMode = UIMode.ADD.ToString();
                    hdnMode.Value = strhdnMode;
                }


                if (!String.IsNullOrEmpty(hdnNameID.Value))
                {
                    NameID = KPIHlp.CVI64(hdnNameID.Value);
                    NamCtrlSPIN.KPISecurity = "N";
                }
                else if ( Request.QueryString.Get("NameID") !=null && KPIHlp.CVI64(Request.QueryString.Get("NameID").ToString()) > 0)
                {
                    NameID = KPIHlp.CVI64(Request.QueryString.Get("NameID").ToString());
                    hdnNameID.Value = NameID.ToString();
                    NamCtrlSPIN.KPISecurity = "N";
                }
                else
                {
                    hdnMode.Value = UIMode.ADD.ToString();
                }


                if (NameID > 0 && (!NameID.Equals("")))
                {
                    NamCtrlSPIN.KPIID = NameID;
                    objJMMDentistVisit.InmateNameID = NameID;
                }

                if(hdnMode.Value==UIMode.ADD.ToString() && String.IsNullOrEmpty(hdnNameID.Value)){
                    pnlUsrCntrls.Visible = false;
                }
                if(!String.IsNullOrEmpty(hdnDentVisitID.Value)) 
                {
                    pnlUsrCntrls.Visible = true;
                    AddClientOnLoadScript("nEnable('cmdEditor',5);");
                    AddClientOnLoadScript("try{window.resizeTo(1100, 855);}catch(e){}");
                    
                }
                else
                {
                    pnlUsrCntrls.Visible = false;
                    AddClientOnLoadScript("nDisable('cmdEditor',5);nDisable('LupReceivedBy',6); nDisable('lupAttendingDoctor',6);");
                    chkInmateSubmitionForm.SelectedIndex = -1;
                    rdoDoctorNurse.SelectedIndex = -1;                   
                    
                }

                if (KPIHlp.CVI64(hdnBookingID.Value) > 0)
                {
                    objJMMDentistVisit.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                }

            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
            if (strhdnMode != UIMode.ADD.ToString())
            {
                objJMMDentistVisit.JMDentistVisitID = KPIHlp.CVI64(hdnDentVisitID.Value);
                objJMMDentistVisit.InmateNameID = KPIHlp.CVI64(hdnNameID.Value);
                if (objJMMDentistVisit.JMDentistVisitID.HasValue && objJMMDentistVisit.JMDentistVisitID.Value > 0)
                {
                    InquiryChg(ref objJMMDentistVisit);
                }
            }
            else
            {
                //hdnBookingID.Value = Request.QueryString.Get("BookingID") == null ? string.Empty : Request.QueryString.Get("BookingID").ToString();
                //BookingID = Request.QueryString.Get("BookingID") == null ? 0 : KPIHlp.CVI64(Request.QueryString.Get("BookingID"));
                hdnMode.Value = UIMode.ADD.ToString();
                if (objJMMDentistVisit.JMBookingID.HasValue && objJMMDentistVisit.JMBookingID.Value> 0)
                {
                    LastVisit(BookingID);
                }
                ClearData();
            }
        }

        protected void InquiryChg(ref JMMDentistVisit objJMMDentistVisit) //long DenVistID, long NameCtrlID
        {

            objJMMDentistVisit = new JMMDentistVisitBL().Select(objJMMDentistVisit.JMDentistVisitID.Value);

            try
            {
                KPITrace.Debug(TraceWeight.Five, "Retrieving DentistHistory info from DB for DenVistID - " + objJMMDentistVisit.JMDentistVisitID.Value);

                NamCtrlSPIN.KPIID = objJMMDentistVisit.InmateNameID.Value;
                
                if (objJMMDentistVisit != null)
                {

                    dttmDentalVisitReq.DateValue = objJMMDentistVisit.DentalReqDttm.Value;
                    if (objJMMDentistVisit.RequestedBy.Value.ToString() == "1")
                    {
                        chkInmateSubmitionForm.SelectedValue = objJMMDentistVisit.RequestedBy.Value.ToString();

                        lblReceivedBy.Text = "Received By&nbsp;";
                    }
                    else if (objJMMDentistVisit.RequestedBy.Value.ToString() == "2")
                    {
                        chkInmateSubmitionForm.SelectedValue = objJMMDentistVisit.RequestedBy.Value.ToString();
                        lblReceivedBy.Text = "Requested By&nbsp;";
                    }


                    LupReceivedBy.KPIID = objJMMDentistVisit.ReceivedByPFID.Value;
                   

                    dttmDentalVisitDate.DateValue = KPIHlp.GVDttm(objJMMDentistVisit.VisitDttm == DateTime.MinValue, objJMMDentistVisit.VisitDttm);

                    if (objJMMDentistVisit.IsDoctor.HasValue)
                    {
                        if (objJMMDentistVisit.IsDoctor.Value.ToString() == "2")
                        {
                            trAttendNurse.Style.Add("display", "");
                            trAttendDoctor.Style.Add("display", "none");
                            rdoDoctorNurse.SelectedValue = objJMMDentistVisit.IsDoctor.Value.ToString();
                            if (objJMMDentistVisit.DoctorID.HasValue)
                            {
                                lupAttendingNurse.KPIID = objJMMDentistVisit.DoctorID.Value;
                            }
                        }
                        else if (objJMMDentistVisit.IsDoctor.Value.ToString() == "1")
                        {
                            trAttendNurse.Style.Add("display", "none");
                            trAttendDoctor.Style.Add("display", "");
                            if (objJMMDentistVisit.DoctorID.HasValue)
                            {
                                lupAttendingDoctor.KPIID = objJMMDentistVisit.DoctorID.Value;
                            }
                            rdoDoctorNurse.SelectedValue = objJMMDentistVisit.IsDoctor.Value.ToString();
                           
                        }

                       
                    }

                    cddLocation.KPISelectedCodeValue = objJMMDentistVisit.DoctorLocation;  
                    
                    txtDentalProblem.Text = objJMMDentistVisit.DentalProblem;

                    #region for Dental visit #
                    if (objJMMDentistVisit.DentalVisitNo.HasValue && objJMMDentistVisit.DentalVisitNo.Value != long.MinValue)
                    {

                        NumCrtlDentalNo.KPIID = objJMMDentistVisit.DentalVisitNo.Value;

                        String[] DentalVisitNo = Counter.GetFormattedNo(CounterType.JailBookingNo, objJMMDentistVisit.DentalVisitNo.Value.ToString()).Split('-');

                        NumCrtlDentalNo.txtYear.Text = Convert.ToString(DentalVisitNo[0]);
                        NumCrtlDentalNo.txtNumber.Text = Convert.ToString(DentalVisitNo[1]);


                        hdnDentalVisitNo.Value = objJMMDentistVisit.DentalVisitNo.ToString();

                    }

                    #endregion

                    if (hdnMode.Value == UIMode.CHG.ToString())
                    {
                        pnlUsrCntrls.Visible = true;
                        AddClientOnLoadScript("try{window.resizeTo(1100, 860);}catch(e){}");
                    }

                    AddClientOnLoadScript("fn_Notes(" + objJMMDentistVisit.JMDentistVisitID.Value + ");");
                    AddClientOnLoadScript("nEnable('cmdEditor',5);");


                    DataSet objDS = new DataSet();
                    objDS = new JMMDentistVisitDB().GetToothDetails(objJMMDentistVisit.JMDentistVisitID.Value, objJMMDentistVisit.JurisID.Value);
                    grdTooth.DataSource = objDS;
                    grdTooth.DataBind();
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
            TakeSaveValues(radDentProcedure);
            TakeSaveValues(radDentDisease);
            TakeSaveValues(radDentMedications);
        }

        protected void LastVisit(long BookingID)
        {
        }

        private bool ValidateScr()
        {
            return true;
        }

        private bool Save()
        {
            try
            {
                JMMDentistVisit objJMMDentistVisit = ReadScr();


                if (objJMMDentistVisit == null)
                    return false;
                else
                {
                    JMMDentistVisitBL objJMMDentistVisitBL = new JMMDentistVisitBL();
                    KPITrace.Debug(TraceWeight.Five, "Calling Manage MedicalDentist");
                    objJMMDentistVisitBL.Manage(objJMMDentistVisit);
                    if (hdnMode.Value == "ADD")
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                        NamCtrlSPIN.KPISecurity = "N";
                        blnForceModeChange = true;
                    }
                    else if (hdnMode.Value == "CHG")
                    {
                        ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);
                    }
                    hdnBookingID.Value = objJMMDentistVisit.JMBookingID.Value.ToString();
                    hdnDentVisitID.Value = objJMMDentistVisit.JMDentistVisitID.Value.ToString();
                    hdnMode.Value = UIMode.CHG.ToString();
                    hdnNameID.Value = NamCtrlSPIN.KPIID.ToString();
                    hdnJurisID.Value = objJMMDentistVisit.JurisID.Value.ToString();

                    if (String.IsNullOrEmpty(hdnSaveClose.Value))
                    {
                        InquiryChg(ref objJMMDentistVisit); //objJMMDentistVisit.JMDentistVisitID.Value, NamCtrlSPIN.KPIID
                    }
                    AutoUpdateParent();
                }
            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
            return true;
        }



        private JMMDentistVisit ReadScr()
        {
            try
            {
                long BookingID = KPIHlp.CVI64(hdnBookingID.Value);
                JMMDentistVisit objJMMDentistVisit = new JMMDentistVisit();
                objJMMDentistVisit.objCMSRefValuesList = new CMSRefValuesList();
                JMMDentistVisitDB objJMMDentistVisitDB = new JMMDentistVisitDB();

                objJMMDentistVisit.JurisID = State.sJurisID;
                objJMMDentistVisit.InmateNameID = NamCtrlSPIN.KPIID;
               
                if (BookingID != long.MinValue)
                {
                    objJMMDentistVisit.JMBookingID = BookingID;
                }
                else if (!objJMMDentistVisit.JMBookingID.HasValue)
                {
                    objJMMDentistVisit.JMBookingID = objJMMDentistVisitDB.GetBookingIDByName(objJMMDentistVisit.InmateNameID.Value);
                }
                if (hdnMode.Value == UIMode.ADD.ToString())
                {
                    objJMMDentistVisit.JMDentistVisitID = KPICounter.GetCounterID(objJMMDentistVisit.JurisID.Value);
                    objJMMDentistVisit.DentalVisitNo = Counter.GetCounterNo(objJMMDentistVisit.JurisID.Value, CounterType.DentalVisitNo, Int64.MinValue);
                    objJMMDentistVisit.cMode = 'A';

                }
                else
                {
                    objJMMDentistVisit.cMode = 'C';
                    objJMMDentistVisit.JMDentistVisitID = KPIHlp.CVI64(hdnDentVisitID.Value);
                    objJMMDentistVisit.DentalVisitNo = KPIHlp.CVI64(hdnDentalVisitNo.Value);
                }

                objJMMDentistVisit.DentalReqDttm = dttmDentalVisitReq.DateValue;

                if (chkInmateSubmitionForm.SelectedValue == "1")
                {
                    objJMMDentistVisit.RequestedBy = 1;
                }
                else if (chkInmateSubmitionForm.SelectedValue == "2")
                {
                    objJMMDentistVisit.RequestedBy = 2;
                }                
               
                objJMMDentistVisit.ReceivedByPFID = LupReceivedBy.KPIID;
                

                if (dttmDentalVisitDate.DateValue != DateTime.MinValue)
                {
                    objJMMDentistVisit.VisitDttm = dttmDentalVisitDate.DateValue;
                   
                    switch (rdoDoctorNurse.SelectedItem.Value)
                    {
                        case "1":
                            objJMMDentistVisit.IsDoctor = 1;                           
                            objJMMDentistVisit.DoctorID = lupAttendingDoctor.KPIID;
                            lupAttendingNurse.KPIID = long.MinValue;
                            lupAttendingNurse.CodeValue = string.Empty;
                            lupAttendingNurse.Description.Text = string.Empty;
                           
                            break;
                        case "2":
                            objJMMDentistVisit.IsDoctor = 2;                            
                             objJMMDentistVisit.DoctorID = lupAttendingNurse.KPIID;
                             lupAttendingDoctor.KPIID = long.MinValue;
                             lupAttendingDoctor.CodeValue = string.Empty;
                            
                            break;
                        default:
                            objJMMDentistVisit.IsDoctor = -1;
                            break;
                    }

                    objJMMDentistVisit.DoctorLocation = cddLocation.CodeValue;
                }    


                //objJMMDentistVisit.DoctorID = lupDoctorID.KPIID;
                if (txtDentalProblem.Text.Length > txtDentalProblem.MaxLength && txtDentalProblem.MaxLength > 0)
                {
                    objJMMDentistVisit.DentalProblem = txtDentalProblem.Text.Trim().Substring(0, txtDentalProblem.MaxLength);
                }
                else
                {
                    objJMMDentistVisit.DentalProblem = txtDentalProblem.Text;
                }

                Dictionary<string, long> ObjCollection = RadCombo(radDentProcedure);
                LoadDentalCombo(radDentProcedure, ref ObjCollection, ref objJMMDentistVisit);
           

                ObjCollection = RadCombo(radDentDisease);
                LoadDentalCombo(radDentDisease, ref ObjCollection, ref objJMMDentistVisit);
           

                ObjCollection = RadCombo(radDentMedications);
                LoadDentalCombo(radDentMedications, ref ObjCollection, ref objJMMDentistVisit);
           


                //GrdTooth
                JMMToothStatusList objJMMToothStatusList = new JMMToothStatusList();
                for (int iRow = 0; iRow < grdTooth.Rows.Count; iRow++)
                {
                    if (grdTooth.IsActiveRow(iRow))
                    {
                        JMMToothStatus objJMMToothStatus = new JMMToothStatus();
                        objJMMToothStatus.JurisID = objJMMDentistVisit.JurisID.Value;
                        objJMMToothStatus.JMDentistVisitID = objJMMDentistVisit.JMDentistVisitID.Value;
                        long DentToothID = long.MinValue;

                        DentToothID = grdTooth.GetLong(iRow, "KPIID");
                        if (DentToothID !=long.MinValue)
                        {
                            objJMMToothStatus.JMMToothStatusID = DentToothID;                            
                        }
                        else
                        {
                            objJMMToothStatus.JMMToothStatusID = KPICounter.GetCounterID(objJMMToothStatus.JurisID.Value);
                        }
                        objJMMToothStatus.cMode = grdTooth.GetChar(iRow, "KPIMode");
                        objJMMToothStatus.Tooth = grdTooth.GetString(iRow, "Tooth");
                        objJMMToothStatus.Status = grdTooth.GetString(iRow, "Status");
                        objJMMToothStatus.Other = grdTooth.GetString(iRow, "Other");

                        objJMMToothStatusList.Add(objJMMToothStatus);
                    }
                }
                objJMMDentistVisit.objJMMToothStatusList = objJMMToothStatusList;
                WrtActivityLog(long.MinValue, "Retrieving Medical Dentist info from DB", "INQ");    
                    KPITrace.Debug(TraceWeight.Five, "Reading Data from Medical Entry");
                    return objJMMDentistVisit;
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }


        private Dictionary<string, long> RadCombo(Control radCombo)
        {         
            List<String> objList = new List<string>();
            KPIRadCombo objRadComboDental = ((KPIRadCombo)this.FindControl(radCombo.ID.ToString()));

            int CodeID = Int32.MinValue;
            int RefType = int.MinValue;
            switch (radCombo.ID.ToString())
            {
                case "radDentProcedure":
                    CodeID = 3172;

                    RefType = (int)CMSReferenceType.DentalProcedures;
                    break;
                case "radDentDisease":
                    CodeID = 3173;
                    RefType = (int)CMSReferenceType.DentalDiseases;
                    break;
                case "radDentMedications":
                    CodeID = 3174;
                    RefType = (int)CMSReferenceType.DentalMedications;
                    break;

            }

            DataSet objRadDentist = new JMMDentistVisitDB().GetChekDetails(CodeID, KPIHlp.CVI64(hdnDentVisitID.Value), RefType, KPIHlp.CVI32(hdnJurisID.Value));

            return objRadDentist.Tables[0].AsEnumerable().ToDictionary(x => x.Field<string>("CodeValue"), y => y.Field<long>("CMSRefValuesID"));
        }




        protected void LoadDentalCombo(Control radCombo, ref Dictionary<string, long> ObjCollection, ref JMMDentistVisit objJMMDentistVisit)
        {
            try
            {
                KPIRadCombo objRadComboDental = ((KPIRadCombo)this.FindControl(radCombo.ID.ToString()));

                foreach (RadComboBoxItem Item in objRadComboDental.CheckedItems)
                {
                    if (Item.Value != "<0>")
                    {
                        CMSRefValues objCMSRefValues = new CMSRefValues();
                        objCMSRefValues.CMSRefValuesID = ObjCollection.ContainsKey(Item.Value) ? ObjCollection[Item.Value] : long.MinValue;
                        objCMSRefValues.JurisID = objJMMDentistVisit.JurisID.Value;
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

                        switch (objRadComboDental.ID)
                        {
                            case "radDentProcedure":
                                objCMSRefValues.RefType = 1;
                                break;
                            case "radDentDisease":
                                objCMSRefValues.RefType = 2;
                                break;
                            case "radDentMedications":
                                objCMSRefValues.RefType = 3;
                                break;
                        }

                        objCMSRefValues.AssocID = objJMMDentistVisit.JMDentistVisitID;
                        objJMMDentistVisit.objCMSRefValuesList.Add(objCMSRefValues);
                    }
                }
                
            }
            catch (Exception)
            {

                throw;
            }

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
                KPITrace.Debug(TraceWeight.Five, "SaveAndClose Event-Started.");
                Save();
                string url = Request.UrlReferrer.ToString();
                CloseScr();
                if (Request.QueryString.Get("ScreenHeight") != null)
                {
                    ClearData();
                    AddClientOnLoadScript("setTimeout(function () {try{LoadCloseMenu(undefined,'" + url + "','Medical Dentist');}catch(e){}}, 100);");
                }
                KPITrace.Debug(TraceWeight.Five, "SaveAndClose Event-Finished.");
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

            long NameID = KPIHlp.CVI64(hdnNameID.Value);
            long DentistID = KPIHlp.CVI64(hdnDentVisitID.Value);
            JMMDentistVisit objJMMDentistVisit = new JMMDentistVisit();
            objJMMDentistVisit.JMDentistVisitID = DentistID;
            objJMMDentistVisit.InmateNameID = NameID;
            if (NameID != long.MinValue && DentistID != long.MinValue)
            {
                InquiryChg(ref objJMMDentistVisit);
            }
            else
            {
                if (!String.IsNullOrEmpty(hdnDentVisitID.Value))
                {
                    pnlUsrCntrls.Visible = true;
                    AddClientOnLoadScript("nEnable('cmdEditor',5);");
                    AddClientOnLoadScript("try{window.resizeTo(1100, 855);}catch(e){}");

                }
                else
                {
                    pnlUsrCntrls.Visible = false;
                    ClearData();
                    if (chkInmateSubmitionForm.SelectedItem != null)
                    {
                        switch (chkInmateSubmitionForm.SelectedItem.Value)
                        {
                            case "1":
                            case "2":
                                AddClientOnLoadScript("nDisable('cmdEditor',5);nEnable('LupReceivedBy',6);");
                                break;
                            default:
                                AddClientOnLoadScript("nDisable('cmdEditor',5);nDisable('LupReceivedBy',6);");
                                chkInmateSubmitionForm.SelectedIndex = -1;
                                break;
                        }
                    }
                    
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
                        AddClientOnLoadScript("nDisable('lupAttendingDoctor',6);");
                        AddClientOnLoadScript("nGCO('trAttendNurse').style.display = 'none';nGCO('trAttendDoctor').style.display = '';");
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
        //CRM#65266 All inmate Booking Status should allow to create Medical Entry
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string CheckRolePermissions(string sJurisID)
        {
            System.Collections.Generic.Dictionary<string, string> dict = new System.Collections.Generic.Dictionary<string, string>();

            bool bAdd;
            bool bChange;
            bool bInquiry;
            bool bDelete;
            int iJurisID = KPIHlp.CVI32(sJurisID);

            new RepositoryBL().GetRepoScreenSecurity("8551", iJurisID, out bAdd, out bChange, out bInquiry, out bDelete);
            if (bChange)
            {
                dict.Add("IsRoleAllowed", "1");
            }

            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(dict);

        }

    }
}

