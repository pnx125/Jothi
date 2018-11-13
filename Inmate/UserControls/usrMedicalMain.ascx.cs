namespace KPI.PhoenixWeb.Inmate.UserControls
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using KPI.Global;
    using KPI.Global.AppException;
    using KPI.Global.Helper;
    using KPI.Global.KPIWebControls;
    using KPI.Global.StateMachine;

    using KPI.Phoenix.WebControls;
    using KPI.Phoenix.Helper;
    using KPI.Phoenix.Object.Names;

    using KPI.Phoenix.Object.Inmate;
    using KPI.Phoenix.Inmate;
    using Infragistics.Web.UI.GridControls;
    using System.Web.UI;
    using KPI.Framework.Object.Home;
    using KPI.Framework.Home;

    /// <summary>
    ///		Summary description for usrMedicalMain.
    /// </summary>
    public partial class usrMedicalMain : System.Web.UI.UserControl
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			cmdAdd.Attributes.Add("onclick","return fn_FlagGridManip_Row();");
			cmdClear.Attributes.Add("onclick","return fn_CancelEditFlagRow();");
			cmdAddDoctor.Attributes.Add("onclick","return fn_DoctorGridManip_Row();");
			cmdClearDoctor.Attributes.Add("onclick","return fn_CancelEditDoctorRow();");
			btnNewVisit.Attributes.Add("onclick","return Medicalvisit();");
            KPIImageButton objDentistIbubble = ((KPI.Global.KPIWebControls.KPIImageButton)(lupPrimaryDoctor.FindControl("cmdIncOnAddr")));
            objDentistIbubble.Attributes.Add("onClick", "return fn_DentistEntry();");

            hdnBookingid.Value = ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value; 
			hdnNameID.Value =((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnNameID"))).Value;            
            hdnMode.Value = ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnMode"))).Value;           
        }




        protected void SetDefaultState(ref JMMMedicalHist objJMMMedicalHist)
		{
            try
            {

                ListGrid(ref objJMMMedicalHist);
                LastVisit(ref objJMMMedicalHist);
                LastTbTested(ref objJMMMedicalHist);


                cddFlag.KPISelectedCodeValue = null;
                txtComment.Text = String.Empty;


            }
			catch(Exception objError)
			{
				throw objError;
			}
		}
	/// <summary>
	/// for listing Flags
	/// </summary>
	/// <param name="NameID">Return Medical Flags for the particular NameID</param>

        public void Listflag(ref JMMMedicalHist objJMMMedicalHist)
		{
			try
			{


                grdFlag.Rows.Clear();
                DataSet objDS = null;
                if (objJMMMedicalHist != null && objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID > 0 && objJMMMedicalHist.NameID.HasValue && objJMMMedicalHist.NameID.Value > 0)
                {
                    objDS = new JmmMedicalHistBL().GetMedicalFlags(ref objJMMMedicalHist);

                }
                grdFlag.DataSource = objDS;
                grdFlag.DataBind();
				
			}
			catch(Exception objError)
			{
				throw objError;
			}
		}
	    /// <summary>
	/// For Listing medical visit
	/// </summary>
	/// <param name="BookingID">Return Medical Visits</param>

        protected void ListGrid(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {
                grdDoctor.Rows.Clear();
                DataSet objDS = null;
                if (objJMMMedicalHist != null && objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID > 0 && objJMMMedicalHist.JMBookingID.HasValue && objJMMMedicalHist.JMBookingID.Value > 0)
                {
                    objDS = new JMMMedVisitBL().ListGrid(ref objJMMMedicalHist);
                }
                grdDoctor.DataSource = objDS;
                grdDoctor.DataBind();
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }
		/// <summary>
		/// To display doctor Location and Phone number in INquiy
		/// </summary>
		/// <param name="DoctorID">Return Location and Phone number</param>

        public void getDoctorInfo(ref JMMMedicalHist objJMMMedicalHist)
		{
            JmsDoctor objJmsDoc = new JmsDoctor();;
			try
			{
                if (objJMMMedicalHist != null && objJMMMedicalHist.JMBookingID.HasValue && objJMMMedicalHist.JMBookingID.Value > 0  && objJMMMedicalHist.PrimeDoctorID.HasValue && objJMMMedicalHist.PrimeDoctorID.Value > 0)
				{
                    objJmsDoc.DoctorID = objJMMMedicalHist.PrimeDoctorID.Value;
                    objJmsDoc.IsDental = 0;
                    objJmsDoc.JurisID = objJMMMedicalHist.JurisID.Value;
                    objJmsDoc = new JmsDoctorBL().SelectDoctor(ref objJmsDoc);
                    
                    if(objJmsDoc!=null)
					{
						txtOfficeLocation.Text=objJmsDoc.Location;
                        cusHeaderPhone.PhoneNumber = KPIHlp.GVS(objJmsDoc.PhoneNbrIsNull, objJmsDoc.PhoneNbr);
                        cusHeaderPhone.PhoneType = KPIHlp.GVS(objJmsDoc.PhoneTypeIsNull, objJmsDoc.PhoneType);
                        lupPrimaryDoctor.KPIID = objJmsDoc.DoctorID;
                        lupPrimaryDoctor.KPIValue = objJmsDoc.DoctorName;                        
					}
					else
					{
                        cusHeaderPhone.PhoneNumber = null;
                        cusHeaderPhone.PhoneType = null;
                        ((BasePage)this.Page).AddClientOnLoadScript("SCV('Main', 'txtOfficeLocation', '',0);SCV('Main', 'lupPrimaryDoctor', '',6);SCV('Main', 'lupPrimaryDoctor', '',7);SCV('Main', 'lupPrimaryDoctor', '',77);");
					}
				}
				else
				{
                    cusHeaderPhone.PhoneNumber = null;
                    cusHeaderPhone.PhoneType = null;
                    ((BasePage)this.Page).AddClientOnLoadScript("SCV('Main', 'txtOfficeLocation', '',0);SCV('Main', 'lupPrimaryDoctor', '',6);SCV('Main', 'lupPrimaryDoctor', '',7);SCV('Main', 'lupPrimaryDoctor', '',77);");
				}
			}
			catch(Exception objError)
			{
				throw objError;
			}
			
		}
		/// <summary>
		/// To Display the Last Medical visit Details
		/// </summary>
		/// <param name="BookingID"></param>
        protected void LastVisit(ref JMMMedicalHist objJMMMedicalHist)
		{

            JMMMedVisit objMedVisit = null;
			try
            {
                if (objJMMMedicalHist != null && objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID > 0 && objJMMMedicalHist.JMBookingID.HasValue && objJMMMedicalHist.JMBookingID.Value > 0)
                {
                    objMedVisit = new JMMMedVisitBL().LastVisit(ref objJMMMedicalHist);                   

                }
				if(objMedVisit!=null)
				{
                    
                    txtBloodPressure1.Text = objMedVisit.BloodPressure;
                    txtBloodPressure2.Text = objMedVisit.BloodPressureMax;
                   
                    txtPulse.Text = objMedVisit.PulseApical.HasValue ? objMedVisit.PulseApical.Value.ToString() : (objMedVisit.PulseRadial.HasValue?objMedVisit.PulseRadial.Value.ToString():string.Empty);
                    txtWeight.Text = objMedVisit.Weight.HasValue ? objMedVisit.Weight.Value.ToString() : string.Empty;
                    txtHeight.Text = objMedVisit.Height.HasValue ? objMedVisit.Height.Value.ToString() : string.Empty;
                    objMedVisit = new JMMMedVisit();
                    objMedVisit = new JMMMedVisitDB().LastRecentMedicalVisit(ref objJMMMedicalHist);
                    if (objMedVisit != null)
                    {
                        dttmVisitDate.DateValue = KPIHlp.GVDttm(objMedVisit.VisitDttm == DateTime.MinValue, objMedVisit.VisitDttm);
                        if (objMedVisit.JMMedVisitID.HasValue)
                        {
                            txtReasonLstVisit.Text = new JMMMedVisitBL().LstMedicalReason(ref objMedVisit);
                        }
                        else
                        {
                            txtReasonLstVisit.Text = string.Empty;
                        }
                        txtReasonLstVisit.ToolTip = txtReasonLstVisit.Text;
                    }
				}
				else
				{
                    ((BasePage)this.Page).AddClientOnLoadScript("SCV('Main', 'txtBloodPressure1', '', 0);SCV('Main', 'txtBloodPressure2', '', 0);SCV('Main', 'txtPulse', '', 0);");
                    ((BasePage)this.Page).AddClientOnLoadScript("SCV('Main', 'txtWeight', '', 0);SCV('Main', 'txtReasonLstVisit', '', 0);SCV('Main', 'txtHeight', '', 0);SCV('Main', 'dttmVisitDate', '', 18);SCV('Main', 'dttmVisitDate', '', 19);");
				}
			}
			catch(Exception objError)
			{
				throw objError;
			}
		}


        protected void LastTbTested(ref JMMMedicalHist objJMMMedicalHist)
        {
            JMMMedVisit objMedVisit = null;
            try
            {
                if (objJMMMedicalHist != null && objJMMMedicalHist.JMMedicalHistID.HasValue && objJMMMedicalHist.JMMedicalHistID > 0 && objJMMMedicalHist.JMBookingID.HasValue && objJMMMedicalHist.JMBookingID.Value > 0)
                {
                    objMedVisit = new JMMMedVisitBL().IsTBTested(ref objJMMMedicalHist);
                }
                if (objMedVisit != null)
                {
                    dcTBTestDate.CssClass = "textboxInactive";
                    if (objMedVisit.VisitDttm.HasValue)
                    {

                        dcTBTestDate.Value = objMedVisit.VisitDttm.HasValue ? objMedVisit.VisitDttm.Value : DateTime.MinValue;
                    }
                    else
                    {
                        ((BasePage)this.Page).AddClientOnLoadScript("SCV('Main', 'dcTBTestDate', '', 15);");
                    }

                    if (objMedVisit.MedicalVisitNo.HasValue)
                    {
                        NumCrtlMedicalNo.KPIID = objMedVisit.MedicalVisitNo.Value;
                        String[] MedicalVisitNo = Counter.GetFormattedNo(CounterType.JailBookingNo, objMedVisit.MedicalVisitNo.Value.ToString()).Split('-');

                        NumCrtlMedicalNo.txtYear.Text = Convert.ToString(MedicalVisitNo[0]);
                        NumCrtlMedicalNo.txtNumber.Text = Convert.ToString(MedicalVisitNo[1]);

                    }

                    cddResults_PreRender(ref objMedVisit);
                    cddResults.KPISelectedCodeValue = objMedVisit.Result;

                }
                else
                {
                    NumCrtlMedicalNo.txtMonth.Text = string.Empty;
                    NumCrtlMedicalNo.txtNumber.Text = string.Empty;
                    NumCrtlMedicalNo.txtYear.Text = string.Empty;
                    NumCrtlMedicalNo.Clear(null, null);
                    cddResults.DropDown.SelectedIndex = -1;
                    ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "fn_IsClearTbTested();", true);
                }
            }
            catch (Exception objError)
            {
                throw objError;
            }

        }

        protected void cddResults_PreRender(ref JMMMedVisit objMedVisit) 
        {
            cddResults.DropDown.Items.Clear();
            cddResults.PopulateCombo();           
        }
        public void Inquiry(ref JMMMedicalHist objJMMMedicalHist) 
		{
            try
            {
                Listflag(ref objJMMMedicalHist);
                SetDefaultState(ref objJMMMedicalHist);
                getDoctorInfo(ref objJMMMedicalHist);
            }
			catch(Exception objError)
			{
				throw objError;
			}
		}
		private bool ValidateScr()
		{
			return true;
		}
        public void ReadScr(ref JMMMedicalHist objJMMMedicalHist)
		{
			try
			{
                CMSRefValuesList objCMSRefValuesList = new CMSRefValuesList();
                if (lupPrimaryDoctor.KPIID != long.MinValue)
                {
                    objJMMMedicalHist.PrimeDoctorID = lupPrimaryDoctor.KPIID;
                }
                objJMMMedicalHist.JurisID = ((BasePage)(this.Page)).GetPageJuris();

                for (int iRowCount = 0; iRowCount < grdFlag.Rows.Count; iRowCount++)
                {

                    if (grdFlag.IsActiveRow(iRowCount))
                    {
                        CMSRefValues objCMSRefValues = new CMSRefValues();

                        objCMSRefValues.JurisID = objJMMMedicalHist.JurisID;
                        objCMSRefValues.AssocID = objJMMMedicalHist.JMMedicalHistID; //NameID;
                        objCMSRefValues.RefType = Convert.ToInt32(CMSReferenceType.MedicalHistFlags);
                        objCMSRefValues.RefValue = grdFlag.GetString(iRowCount, "Flag");
                        objCMSRefValues.Custom1 = grdFlag.GetString(iRowCount, "Cmts"); //Added Flag Comments 
                        if (!String.IsNullOrEmpty(objCMSRefValues.Custom1))
                        {
                            if (objCMSRefValues.Custom1.Length <= 255)
                            {
                                objCMSRefValues.Custom1 = objCMSRefValues.Custom1.Substring(0, objCMSRefValues.Custom1.Length);
                            }
                            else
                            {
                                objCMSRefValues.Custom1 = objCMSRefValues.Custom1.Substring(0, txtComment.MaxLength);
                            }

                        }

                        objCMSRefValues.cMode = grdFlag.GetChar(iRowCount, "KPIMode");
                        objCMSRefValues.CMSRefValuesID = KPIHlp.CVI64(grdFlag.GetString(iRowCount, "KPIID"));
                        if (objCMSRefValues.cMode == 'A')
                        {
                            objCMSRefValues.CMSRefValuesID = KPICounter.GetCounterID(objCMSRefValues.JurisID.Value);
                        }                       
                        objCMSRefValues.IsActive = 1;
                        objCMSRefValuesList.Add(objCMSRefValues);
                    }
                }
                objJMMMedicalHist.objCMSRefValuesList = objCMSRefValuesList;	
			}
			catch(Exception objError)
			{
				throw objError;
			}
		}

		protected void grdDoctor_InitializeRow(object sender, RowEventArgs e)
		{
			try
			{
				int iRow = e.Row.Index;
				if(grdDoctor.GetDateTime(iRow, "visitDttm")==DateTime.MinValue)
				{
                    DateTime objdate = grdDoctor.GetDateTime(iRow, "RequestDttm");
                    grdDoctor.SetValue(iRow, "visitDttm", objdate.ToString("MM/dd/yy HH:mm"));
					grdDoctor.SetValue(iRow, "DoctorName","Request Pending");			
				}

                if (grdDoctor.GetValue(iRow, "MedicalNo") != null)
                {
                    if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("MedicalNo").Text))
                    {
                        grdDoctor.SetValue(iRow, "MedicalNo", Counter.GetFormattedNo(CounterType.MedicalVisitNo, grdDoctor.GetValue(iRow, "MedicalNo")));
                    }
                }
			}
			catch(Exception objError)
			{
				throw objError;
			}
		}

		protected void grdFlag_InitializeRow(object sender, RowEventArgs e)
		{
			try
			{
				int iRow = e.Row.Index;

                if (e.Row.Items.FindItemByKey("Comments") != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Comments").Text))
                {
                    e.Row.Items.FindItemByKey("FLGCMNT").CssClass = "CustRules";
                }
                e.Row.Items.FindItemByKey("Cmts").Text = "";
			}
			catch(Exception objError)
			{
				throw objError;
			}
		}




 
 

	}
}