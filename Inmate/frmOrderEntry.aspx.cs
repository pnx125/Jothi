using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KPI.PhoenixWeb.Inmate
{
    public partial class frmOrderEntry : BasePage
    {
        public Int32 JurisID;
        protected void Page_Load(object sender, EventArgs e)
        {

            cmdSave.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
            cmdSaveNClose.Attributes.Add("onclick", "glbCtrlClicked = 'Save';");
            cmdRefresh.Attributes.Add("onclick", "glbCtrlClicked = 'Refresh';");
            cmdPrint.Attributes.Add("onclick", "glbCtrlClicked = 'Print';");
            Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");
            hdnDisposition.Value = Request.QueryString.Get("Disposition") == null ? string.Empty : Request.QueryString.Get("Disposition").ToString();            
            if (!IsPostBack)
            {

                hdnBookingID.Value = Request.QueryString.Get("JMBookingID") == null ? string.Empty : Request.QueryString.Get("JMBookingID").ToString();
                hdnJMMedicalHistID.Value = Request.QueryString.Get("JMMedicalHistID") == null ? string.Empty : Request.QueryString.Get("JMMedicalHistID").ToString();
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisId") == null ? string.Empty : Request.QueryString.Get("hdnJurisId").ToString();
                hdnJMMedPrescriptionID.Value = Request.QueryString.Get("JMMedPrescriptionID") == null ? string.Empty : Request.QueryString.Get("JMMedPrescriptionID").ToString();
                hdnJMPrescriptionOrderID.Value = Request.QueryString.Get("JMPrescriptionOrderID") == null ? string.Empty : Request.QueryString.Get("JMPrescriptionOrderID").ToString();
                hdnDrugID.Value = Request.QueryString.Get("DrugID") == null ? string.Empty : Request.QueryString.Get("DrugID").ToString();
                hdnOrderNo.Value = Request.QueryString.Get("OrderedNo") == null ? string.Empty : Request.QueryString.Get("OrderedNo").ToString();
                hdnJMPreOrderHistID.Value = Request.QueryString.Get("JMPreOrderHistID") == null ? string.Empty : Request.QueryString.Get("JMPreOrderHistID").ToString();
                hdnJMPreOrderHistNo.Value = Request.QueryString.Get("JMPreOrderHistNo") == null ? string.Empty : Request.QueryString.Get("JMPreOrderHistNo").ToString();
                hdnMode.Value  = Request.QueryString.Get("Mode") == null ? string.Empty : Request.QueryString.Get("Mode").ToString();
                JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                if (KPIHlp.CVI64(hdnJMPreOrderHistID.Value) != long.MinValue)
                {
                    ExistingRecordInquiry();

                }
                else if (KPIHlp.CVI64(hdnJMPrescriptionOrderID.Value) != long.MinValue)
                {
                    NewRecordInquiry();
                }

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
        }

        protected void cmdSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception objError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objError);
            }
        }

        protected void cmdSaveNClose_Click(object sender, ImageClickEventArgs e)
        {
            if(Save())
            CloseScr();
        }

        private JMMPrescriptionOrder NewReadScr()
        {
            JMMPrescriptionOrder objJMPrescriptionOrder = new JMMPrescriptionOrder();
            KPITrace.Debug(TraceWeight.Five, "Calling Readscreen for Prescription Order Entry");
            try
            {
                objJMPrescriptionOrder.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                objJMPrescriptionOrder.JMMedPrescriptionID = KPIHlp.CVI64(hdnJMMedPrescriptionID.Value);
                objJMPrescriptionOrder.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                objJMPrescriptionOrder.Drug = !String.IsNullOrWhiteSpace(hdnDrugID.Value) ? hdnDrugID.Value : null;
                if (KPIHlp.CVI64(hdnJMPrescriptionOrderID.Value) == long.MinValue)
                {
                    objJMPrescriptionOrder.JMPrescriptionOrderID = KPICounter.GetCounterID(objJMPrescriptionOrder.JurisID.Value);
                    hdnJMPrescriptionOrderID.Value = objJMPrescriptionOrder.JMPrescriptionOrderID.HasValue ? objJMPrescriptionOrder.JMPrescriptionOrderID.Value.ToString() : null;
                    objJMPrescriptionOrder.OrderedNo = Counter.GetCounterNo(objJMPrescriptionOrder.JurisID.Value, CounterType.JMPrescriptionOrderNo, Int64.MinValue);
                    hdnOrderNo.Value = objJMPrescriptionOrder.OrderedNo.HasValue ? objJMPrescriptionOrder.OrderedNo.Value.ToString() : null;
                    objJMPrescriptionOrder.cMode = 'A';
                }
                else
                {
                    objJMPrescriptionOrder.JMPrescriptionOrderID = KPIHlp.CVI64(hdnJMPrescriptionOrderID.Value);
                    objJMPrescriptionOrder.OrderedNo = KPIHlp.CVI64(hdnOrderNo.Value);
                    objJMPrescriptionOrder.cMode = 'C';
                }
                
                objJMPrescriptionOrder.OrderAction = cddOrderAction.CodeValue;
                objJMPrescriptionOrder.StorageLocation = cddStorageLocation.CodeValue;
                if (dttmOrderedDate.DateValue != DateTime.MinValue)
                {
                    objJMPrescriptionOrder.OrderedDttm = dttmOrderedDate.DateValue;
                }
                if (lupOrderedPF.KPIID > 0)
                {
                    objJMPrescriptionOrder.OrderedPFID = lupOrderedPF.KPIID;
                }
                if (!String.IsNullOrWhiteSpace(txtQuantity.Text))
                {
                    objJMPrescriptionOrder.QtyBalance = KPIHlp.CVI32(txtQuantity.Text);
                    objJMPrescriptionOrder.MedicationType = cddQuantityType.CodeValue;
                }


                


                if (txtDescription.Text.Length > txtDescription.MaxLength && txtDescription.MaxLength > 0) //Notes field as a custom column
                {
                    objJMPrescriptionOrder.OrderNotes = txtDescription.Text.Substring(0, txtDescription.MaxLength);
                }
                else
                {
                    objJMPrescriptionOrder.OrderNotes = txtDescription.Text;
                }



                switch (objJMPrescriptionOrder.OrderAction)
                {
                    case "D":
                    case "RI":
                        objJMPrescriptionOrder.CurQuantity =  objJMPrescriptionOrder.QtyBalance;
                        objJMPrescriptionOrder.HowDestroyed = cddDestroyed.CodeValue;
                        if (lupWitness.KPIID > 0)
                        {
                            objJMPrescriptionOrder.WitnessPFID = lupWitness.KPIID;
                        }
                        break;

                    case "F":                    
                    case "RC":
                        objJMPrescriptionOrder.CurQuantity = objJMPrescriptionOrder.QtyBalance;
                        break;
                    case "O":
                    case "R":
                        break;
                }
                

            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }

            return objJMPrescriptionOrder;
        }

        private JMMPreOrderHist OldReadScr()
        {
            JMMPreOrderHist objJMPreOrderHist = new JMMPreOrderHist();
            KPITrace.Debug(TraceWeight.Five, "Calling Readscreen for Prescription Order Entry");
            try
            {

                
                objJMPreOrderHist.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                objJMPreOrderHist.JMMedPrescriptionID = KPIHlp.CVI64(hdnJMMedPrescriptionID.Value);
                objJMPreOrderHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                objJMPreOrderHist.Drug = !String.IsNullOrWhiteSpace(hdnDrugID.Value) ? hdnDrugID.Value : null;
              
                objJMPreOrderHist.JMPrescriptionOrderID = KPIHlp.CVI64(hdnJMPrescriptionOrderID.Value);
                objJMPreOrderHist.JMPreOrderHistID = KPIHlp.CVI64(hdnJMPreOrderHistID.Value);
                objJMPreOrderHist.OrderedNo = KPIHlp.CVI64(hdnOrderNo.Value);
                objJMPreOrderHist.JMPreOrderHistNo = KPIHlp.CVI64(hdnJMPreOrderHistNo.Value);
              

                objJMPreOrderHist.OrderAction = cddOrderAction.CodeValue;
                objJMPreOrderHist.StorageLocation = cddStorageLocation.CodeValue;
                if (dttmOrderedDate.DateValue != DateTime.MinValue)
                {
                    objJMPreOrderHist.OrderedDttm = dttmOrderedDate.DateValue;
                }
                if (lupOrderedPF.KPIID > 0)
                {
                    objJMPreOrderHist.OrderedPFID = lupOrderedPF.KPIID;
                }
                if (!String.IsNullOrWhiteSpace(txtQuantity.Text))
                {
                    objJMPreOrderHist.QtyBalance = KPIHlp.CVI32(txtQuantity.Text);
                    objJMPreOrderHist.MedicationType = cddQuantityType.CodeValue;
                }


                


                if (txtDescription.Text.Length > txtDescription.MaxLength && txtDescription.MaxLength > 0) //Notes field as a OrderNotes column
                {
                    objJMPreOrderHist.OrderNotes = txtDescription.Text.Substring(0, txtDescription.MaxLength);
                }
                else
                {
                    objJMPreOrderHist.OrderNotes = txtDescription.Text;
                }

                switch (objJMPreOrderHist.OrderAction)
                {
                    case "D":
                    case "RI":
                        objJMPreOrderHist.CurQuantity = (-1) * objJMPreOrderHist.QtyBalance;
                        objJMPreOrderHist.HowDestroyed = cddDestroyed.CodeValue;
                        if (lupWitness.KPIID > 0)
                        {
                            objJMPreOrderHist.WitnessPFID = lupWitness.KPIID;
                        }
                        break;

                    case "F":                    
                    case "RC":
                        objJMPreOrderHist.CurQuantity = objJMPreOrderHist.QtyBalance;
                        break;
                    case "O":
                    case "R":
                        break;
                }
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }

            return objJMPreOrderHist;
        }
        private bool Save()
        {
            JMMPrescriptionOrder objJMPrescriptionOrder = null;
            JMMPreOrderHist objJMPreOrderHist = null;
            JMMPrescriptionOrderBL objJMPrescriptionOrderBL = null;
            JMMPreOrderHistBL objJMPreOrderHistBL = null;
            try
            {



                if (KPIHlp.CVI64(hdnJMPreOrderHistID.Value) == long.MinValue)
                {
                    objJMPrescriptionOrder = NewReadScr();
                    objJMPrescriptionOrderBL = new JMMPrescriptionOrderBL();
                    KPITrace.Debug(TraceWeight.Five, "Calling Manage for Prescription Order Entry");
                    WrtActivityLog(long.MinValue, " Managing Prescription Order Entry Dtls.", hdnMode.Value);
                    objJMPrescriptionOrderBL.Manage(ref objJMPrescriptionOrder);
                    hdnJMPrescriptionOrderID.Value = objJMPrescriptionOrder.JMPrescriptionOrderID.HasValue ? objJMPrescriptionOrder.JMPrescriptionOrderID.Value.ToString() : null;
                    NewRecordInquiry();                    
                }
                else {
                    objJMPreOrderHistBL = new JMMPreOrderHistBL();
                    objJMPreOrderHist = OldReadScr();
                    objJMPreOrderHistBL.UpdateHistory(objJMPreOrderHist);
                    ExistingRecordInquiry();
                }
                AutoUpdateParent();
                ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);                
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }          
            return true;

        }

        //While click on Supply status icon, it will open and create a new order entry
        protected void NewRecordInquiry()
        {
            JMMPrescriptionOrderBL objJMPrescriptionOrderBL = null;
            long? JMPrescriptionOrderID = KPIHlp.CVI64(hdnJMPrescriptionOrderID.Value);
            try
            {
                objJMPrescriptionOrderBL = new JMMPrescriptionOrderBL();

                if (JMPrescriptionOrderID.HasValue && JMPrescriptionOrderID != long.MinValue)
                {
                    JMMPrescriptionOrder objJMPrescriptionOrder = objJMPrescriptionOrderBL.Select(JMPrescriptionOrderID.Value);
                    if (objJMPrescriptionOrder != null)
                    {
                        hdnBookingID.Value = objJMPrescriptionOrder.JMBookingID.HasValue ? objJMPrescriptionOrder.JMBookingID.Value.ToString() : null;
                        hdnJMMedPrescriptionID.Value = objJMPrescriptionOrder.JMMedPrescriptionID.HasValue ? objJMPrescriptionOrder.JMMedPrescriptionID.Value.ToString() : null;
                        hdnJMPrescriptionOrderID.Value = objJMPrescriptionOrder.JMPrescriptionOrderID.HasValue ? objJMPrescriptionOrder.JMPrescriptionOrderID.Value.ToString() : null;
                        hdnOrderNo.Value = objJMPrescriptionOrder.OrderedNo.HasValue ? objJMPrescriptionOrder.OrderedNo.Value.ToString() : null;
                        hdnJurisId.Value = objJMPrescriptionOrder.JurisID.HasValue ? objJMPrescriptionOrder.JurisID.Value.ToString() : null;
                        hdnOrderNo.Value = objJMPrescriptionOrder.OrderedNo.HasValue ? objJMPrescriptionOrder.OrderedNo.Value.ToString() : null;
                        hdnOrderAction.Value = objJMPrescriptionOrder.OrderAction;
                        hdnQuantity.Value = objJMPrescriptionOrder.QtyBalance.HasValue ? objJMPrescriptionOrder.QtyBalance.Value.ToString() : string.Empty;

                        ClearData();
                        
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        protected void ExistingRecordInquiry()
        {
            JMMPreOrderHistBL objJMPreOrderHistBL = null;
            long? JMPreOrderHistID = KPIHlp.CVI64(hdnJMPreOrderHistID.Value);
            try
            {
                objJMPreOrderHistBL = new JMMPreOrderHistBL();
                if (JMPreOrderHistID.HasValue && JMPreOrderHistID.Value != long.MinValue)
                {
                    JMMPreOrderHist objJMPreOrderHist = objJMPreOrderHistBL.Select(JMPreOrderHistID.Value);
                    if (objJMPreOrderHist != null)
                    {
                        hdnJMPreOrderHistID.Value = objJMPreOrderHist.JMPreOrderHistID.HasValue ? objJMPreOrderHist.JMPreOrderHistID.Value.ToString() : null;
                        hdnBookingID.Value = objJMPreOrderHist.JMBookingID.HasValue ? objJMPreOrderHist.JMBookingID.Value.ToString() : null;
                        hdnJMMedPrescriptionID.Value = objJMPreOrderHist.JMMedPrescriptionID.HasValue ? objJMPreOrderHist.JMMedPrescriptionID.Value.ToString() : null;
                        hdnJMPrescriptionOrderID.Value = objJMPreOrderHist.JMPrescriptionOrderID.HasValue ? objJMPreOrderHist.JMPrescriptionOrderID.Value.ToString() : null;
                        hdnOrderNo.Value = objJMPreOrderHist.OrderedNo.HasValue ? objJMPreOrderHist.OrderedNo.Value.ToString() : null;
                        hdnJurisId.Value = objJMPreOrderHist.JurisID.HasValue ? objJMPreOrderHist.JurisID.Value.ToString() : null;
                        hdnOrderNo.Value = objJMPreOrderHist.OrderedNo.HasValue ? objJMPreOrderHist.OrderedNo.Value.ToString() : null;
                        
                        dttmOrderedDate.DateValue = objJMPreOrderHist.OrderedDttm.HasValue ? objJMPreOrderHist.OrderedDttm.Value : DateTime.MinValue;
                        lupOrderedPF.KPIID = objJMPreOrderHist.OrderedPFID.HasValue ? objJMPreOrderHist.OrderedPFID.Value : long.MinValue;
                        txtQuantity.Text = objJMPreOrderHist.QtyBalance.HasValue ? objJMPreOrderHist.QtyBalance.Value.ToString() : null;
                        cddOrderAction.KPISelectedCodeValue = objJMPreOrderHist.OrderAction;
                        cddStorageLocation.KPISelectedCodeValue = objJMPreOrderHist.StorageLocation;
                        cddQuantityType.KPISelectedCodeValue = objJMPreOrderHist.MedicationType;

                        cddDestroyed.KPISelectedCodeValue = objJMPreOrderHist.HowDestroyed;
                        lupWitness.KPIID = objJMPreOrderHist.WitnessPFID.HasValue ? objJMPreOrderHist.WitnessPFID.Value : long.MinValue;

                        hdnOrderAction.Value = objJMPreOrderHist.OrderAction;
                        hdnQuantity.Value = objJMPreOrderHist.QtyBalance.HasValue ? objJMPreOrderHist.QtyBalance.Value.ToString() : string.Empty;
                        txtDescription.Text = string.Empty;

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
            if (!string.IsNullOrEmpty(hdnDisposition.Value))

            {
                for (int i = 0; i < cddOrderAction.DropDown.Items.Count; i++)
                {
                    if (cddOrderAction.DropDown.Items[i].Value == "F" || cddOrderAction.DropDown.Items[i].Value == "O" || cddOrderAction.DropDown.Items[i].Value == "R" || cddOrderAction.DropDown.Items[i].Value == "RC")
                    {
                        cddOrderAction.DropDown.Items.RemoveAt(i);
                        i -= 1;
                    }
                }
            }
            base.OnPreRender(e);

        }
        protected void cmdPrint_Click(object sender, ImageClickEventArgs e)
        {
            PrintScr();
        }

        protected void cmdRefresh_Click(object sender, ImageClickEventArgs e)
        {
            if (KPIHlp.CVI64(hdnJMPreOrderHistID.Value) != long.MinValue)
            {
                ExistingRecordInquiry();

            }
  
            else
            {
                ClearData();                
            }
        }

        [ScriptMethod()]
        [System.Web.Services.WebMethod()]
        public static object GetCurrentDispenseCount(string JMMedPrescriptionID, string MedicationType)
        {
            JMMMedPrescription objJMMMedPrescription = new JMMMedPrescription();
            objJMMMedPrescription.JMMedPrescriptionID = KPIHlp.CVI64(JMMedPrescriptionID);
            objJMMMedPrescription.MedicationType = MedicationType;


            JMMMedPrescription objJMMedPrescriptiontref = new JMMMedPrescriptionDB().DispenseTypeCount(ref objJMMMedPrescription);
            return (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(objJMMedPrescriptiontref);

        }
    }
}