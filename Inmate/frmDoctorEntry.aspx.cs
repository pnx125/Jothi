using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Web.UI;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmDoctorEntry.
    /// </summary>
    public partial class frmDoctorEntry : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            try
            {
                cmdSave.Attributes.Add("OnClick", "glbCtrlClicked='Save'; ");
                cmdSaveNClose.Attributes.Add("OnClick", "glbCtrlClicked='Save'; ");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");
                chkInActive.Attributes.Add("onClick", "return fn_chkInActive();");
                if (!IsPostBack)
                {
                    LoadData();
                }

                AddClientOnLoadScript("setFocusOnDoctorName()");
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void LoadData()
        {
            try
            {
                string strhdnMode = UIMode.ADD.ToString();
                try
                {
                    strhdnMode = Request.QueryString.Get("hdnMode").Trim();
                }
                catch (Exception) { }

                if (strhdnMode == UIMode.CHG.ToString()|| strhdnMode == UIMode.INQ.ToString()) //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                {
                    hdnDoctorId.Value = Request.QueryString.Get("DoctorID");
                    hdnMode.Value = strhdnMode; //CRM#65266 All inmate Booking Status should allow to create Medical Entry
                    hdnJurisId.Value = Request.QueryString.Get("JurisID");
                    int juris = KPIHlp.CVI32(hdnJurisId.Value);
                    lstJuris.SetJurisValue(juris);
                    Inquiry(KPIHlp.CVI64(hdnDoctorId.Value));
                }
                else
                {
                    hdnJurisId.Value = KPIHlp.CVS(GetPageJuris());
                    int juris = KPIHlp.CVI32(hdnJurisId.Value);
                    lstJuris.SetJurisValue(juris);

                    hdnMode.Value = UIMode.ADD.ToString();
                }
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        protected void Inquiry(long DoctorID)
        {
            try
            {
                JmsDoctor objJmsDoctor = new JmsDoctor();
                JmsDoctorBL objJmsDoctorBL = new JmsDoctorBL();

                objJmsDoctor = objJmsDoctorBL.Select(DoctorID);

                txtadrMainAddress.Text = KPIHlp.GVS(objJmsDoctor.LocationIsNull, objJmsDoctor.Location);
                custHeaderCSZ.City = KPIHlp.GVS(objJmsDoctor.CityIsNull, objJmsDoctor.City);
                custHeaderCSZ.State = KPIHlp.GVS(objJmsDoctor.StateIsNull, objJmsDoctor.State);
                custHeaderCSZ.Zip = KPIHlp.GVS(objJmsDoctor.ZipIsNull, objJmsDoctor.Zip);
                cusHeaderPhone.PhoneNumber = KPIHlp.GVS(objJmsDoctor.PhoneNbrIsNull, objJmsDoctor.PhoneNbr);
                cusHeaderPhone.PhoneType = KPIHlp.GVS(objJmsDoctor.PhoneTypeIsNull, objJmsDoctor.PhoneType);
                if (objJmsDoctor.IsActive == 0)
                {
                    chkInActive.Checked = true;
                    txtInActive.Text = Convert.ToDateTime(objJmsDoctor.InActiveDttm).ToString();
                }
                else
                {
                    chkInActive.Checked = false;
                }
                if (objJmsDoctor.IsDental == 1)
                {
                    chkDentist.Checked = true;
                }
                else
                {
                    chkDentist.Checked = false;
                }
                txtDoctorName.Text = KPIHlp.GVS(objJmsDoctor.DoctorNameIsNull, objJmsDoctor.DoctorName);
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        private bool Save()
        {
            try
            {
                JmsDoctor objJmsDoctor = ReadScr();

                JmsDoctorBL objJmsDoctorBL = new JmsDoctorBL();
                if (hdnMode.Value == UIMode.ADD.ToString())
                {
                    objJmsDoctorBL.Insert(objJmsDoctor);
                    ShowMsg(MsgType.Success, FrwkMsg.ADD_SUCCESS);
                    hdnMode.Value = UIMode.CHG.ToString();
                    hdnDoctorId.Value = KPIHlp.CVS(objJmsDoctor.DoctorID);
                }
                else
                {
                    objJmsDoctor.DoctorID = KPIHlp.CVI64(hdnDoctorId.Value);
                    objJmsDoctorBL.Update(objJmsDoctor);
                    ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS);
                    hdnMode.Value = UIMode.CHG.ToString();
                }
                //Updating the parent

                Inquiry(objJmsDoctor.DoctorID);
                AutoUpdateParent();

                return true;
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        private JmsDoctor ReadScr()
        {
            try
            {
                JmsDoctor objJmsDoctor = null;

                objJmsDoctor = new JmsDoctor();
                objJmsDoctor.JurisID = lstJuris.JurisID;

                objJmsDoctor.DoctorID = KPICounter.GetCounterID(objJmsDoctor.JurisID);

                objJmsDoctor.DoctorName = txtDoctorName.Text;
                objJmsDoctor.Location = txtadrMainAddress.Text;
                objJmsDoctor.City = KPIHlp.CVS(custHeaderCSZ.City);
                objJmsDoctor.State = KPIHlp.CVS(custHeaderCSZ.State);
                objJmsDoctor.Zip = KPIHlp.CVS(custHeaderCSZ.Zip);

                objJmsDoctor.PhoneNbr = KPIHlp.CVS(cusHeaderPhone.PhoneNumber);
                objJmsDoctor.PhoneType = KPIHlp.CVS(cusHeaderPhone.PhoneType);
                objJmsDoctor.PhoneID = KPICounter.GetCounterID(objJmsDoctor.JurisID);
                if (chkDentist.Checked)
                {
                    objJmsDoctor.IsDental = 1;
                }
                else
                {
                    objJmsDoctor.IsDental = 0;
                }

                if (chkInActive.Checked)
                {
                    objJmsDoctor.IsActive = 0;
                    objJmsDoctor.InActiveDttm = KPIHlp.CVDttm(txtInActive.Text.ToString());
                }
                else
                {
                    objJmsDoctor.IsActive = 1;
                }

                return objJmsDoctor;
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        protected void cmdSave_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }

        protected void cmdSaveNClose_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            try
            {
                Save();
                CloseScr();
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }

        protected void cmdPrint_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            try
            {
                PrintScr();
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }

        protected void cmdRefresh_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            try
            {
                ClearData();
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }
    }
}

