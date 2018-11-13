namespace KPI.PhoenixWeb.Inmate.UserControls
{
    using KPI.Framework.Home;
    using KPI.Framework.Object.Home;
    using KPI.Global;
    using KPI.Global.Helper;
    using KPI.Global.KPIWebControls;
    using KPI.Phoenix.Inmate;
    //using KPI.Phoenix.Global;

    using KPI.Phoenix.Object.Inmate;
    using System;
    using System.Data;
    using System.Web.UI.HtmlControls;

    /// <summary>
    ///		Summary description for usrDental.
    /// </summary>
    public partial class usrDental : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            btnNewVisit.Attributes.Add("onclick", "return Dentalvisit();");
            hdnBookingid.Value = ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnBookingID"))).Value;
            btnSchedule.Attributes.Add("OnClick", "return fn_OpenScheduler();");

            KPIImageButton objDentistIbubble = ((KPI.Global.KPIWebControls.KPIImageButton)(lupPrimaryDentist.FindControl("cmdIncOnAddr")));
            objDentistIbubble.Attributes.Add("onClick", "return fn_DentistEntry('Dental');");


            if (Request.QueryString.Get("BookingID") != null)
            {
                hdnBookingid.Value = Request.QueryString.Get("BookingID");
            }
            if (Request.QueryString.Get("JurisId") != null && !String.IsNullOrEmpty(Request.QueryString.Get("JurisId")))
            {
                hdnJurisId.Value = Request.QueryString.Get("JurisId");
            }

            hdnMode.Value = ((HtmlInputHidden)(Page.FindControl("hdnMode"))).Value;


            //LoadData();
        }

        public void LoadData(ref JMMMedicalHist objJMMMedicalHist)
        {
            JMMDentistVisit objJMMDentistVisit = null;

            if (objJMMMedicalHist != null)
            {
                objJMMDentistVisit = new JMMDentistVisit();
                objJMMDentistVisit.JMBookingID = objJMMMedicalHist.JMBookingID.Value;
                objJMMDentistVisit.JurisID = objJMMMedicalHist.JurisID.Value;
            }

            string strhdnMode = UIMode.ADD.ToString();
            try
            {
                strhdnMode = Request.QueryString.Get("hdnMode").Trim();

                if (strhdnMode == UIMode.CHG.ToString())
                {
                    hdnMode.Value = UIMode.CHG.ToString();
                }

                ListDentalGrid(ref objJMMDentistVisit);
                LastDentalVisit(ref objJMMDentistVisit);
                GetDoctorInfo(ref objJMMMedicalHist);

                hdnMode.Value = UIMode.ADD.ToString();

            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        public void GetDoctorInfo(ref JMMMedicalHist objJMMMedicalHist)
        {
            JmsDoctor objJmsDoc = new JmsDoctor();
            JmsDoctorBL objJmsDocBL = new JmsDoctorBL();

            try
            {
                if (objJMMMedicalHist != null && objJMMMedicalHist.JMBookingID.HasValue && objJMMMedicalHist.JMBookingID.Value > 0 && objJMMMedicalHist.PrimeDentistID.HasValue && objJMMMedicalHist.PrimeDentistID.Value > 0)
                {
                    objJmsDoc.DoctorID = objJMMMedicalHist.PrimeDentistID.Value;
                    objJmsDoc.JurisID = objJMMMedicalHist.JurisID.Value;
                    objJmsDoc.IsDental = 1;
                    objJmsDoc = objJmsDocBL.SelectDoctor(ref objJmsDoc);
                    if (objJmsDoc != null)
                    {
                        txtOfficeLocation.Text = objJmsDoc.Location;
                        cusHeaderPhone.PhoneNumber = KPIHlp.GVS(objJmsDoc.PhoneNbrIsNull, objJmsDoc.PhoneNbr);
                        cusHeaderPhone.PhoneType = KPIHlp.GVS(objJmsDoc.PhoneTypeIsNull, objJmsDoc.PhoneType);

                        lupPrimaryDentist.KPIID = objJmsDoc.DoctorID;
                        lupPrimaryDentist.KPIValue = objJmsDoc.DoctorName;

                    }
                    else
                    {
                        txtOfficeLocation.Text = "";
                        cusHeaderPhone.PhoneNumber = null;
                        cusHeaderPhone.PhoneType = null;
                        lupPrimaryDentist.KPIID = long.MinValue;
                        lupPrimaryDentist.KPIValue = string.Empty;
                    }
                }
                else
                {
                    txtOfficeLocation.Text = "";
                    cusHeaderPhone.PhoneNumber = null;
                    cusHeaderPhone.PhoneType = null;
                    lupPrimaryDentist.KPIID = long.MinValue;
                    lupPrimaryDentist.KPIValue = string.Empty;
                    ((BasePage)this.Page).AddClientOnLoadScript("SCV('Dental', 'txtOfficeLocation', '',0);");
                }
            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        protected void ListDentalGrid(ref JMMDentistVisit objJMMDentistVisit)
        {
            try
            {
                grdDental.Rows.Clear();
                DataSet objDS = null;
                if (objJMMDentistVisit != null && objJMMDentistVisit.JMBookingID.HasValue && objJMMDentistVisit.JMBookingID.Value > 0)
                {
                    objDS = new JMMDentistVisitDB().GetDentistDetails(ref objJMMDentistVisit);
                }
                grdDental.DataSource = objDS;
                grdDental.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void LastDentalVisit(ref JMMDentistVisit objJMMDentistVisit)
        {
            try
            {
                JMMDentistVisitBL objJMMDentistVisitBL = new JMMDentistVisitBL();
                if (objJMMDentistVisit != null && objJMMDentistVisit.JMBookingID.HasValue && objJMMDentistVisit.JMBookingID.Value > 0)
                {
                    NextScheduleDisplay(ref objJMMDentistVisit);
                    objJMMDentistVisit = objJMMDentistVisitBL.LastDentalVisit(ref objJMMDentistVisit);
                    
                }
                if (objJMMDentistVisit != null)
                {
                    dttmDentlvisit.Value = objJMMDentistVisit.VisitDttm.Value;
                }
                else
                {
                    ((BasePage)this.Page).AddClientOnLoadScript("SCV('Dental', 'dttmDentlvisit', '', 15);");
                }


            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        private void clearSchedule()
        {
            ((BasePage)this.Page).AddClientOnLoadScript("SCV('Dental', 'dttmNewVisit', '', 18);SCV('Dental', 'dttmNewVisit', '', 19);");            
        }

        private bool ValidateScr()
        {
            return true;
        }
        public void NextScheduleDisplay(ref  JMMDentistVisit objJMMDentistVisit)
        {
            DataSet dsSchedule = null;
            KPIEvents objKPIEvents = new KPIEvents();
            KPIEventsBL objKPIEventsBL = new KPIEventsBL();
            string ScreenName = "Dentist";
            dsSchedule = objKPIEventsBL.GetSchedule(long.MinValue, objJMMDentistVisit.JMBookingID.Value, ScreenName);
            if (dsSchedule != null && dsSchedule.Tables.Count > 0 && dsSchedule.Tables[0].Rows.Count > 0)
            {
                DataRow objSchedule = dsSchedule.Tables[0].Rows[0];
                dttmNewVisit.DateValue = KPIHlp.CVDttm(objSchedule["StartDttm"].ToString());
                
            }
            else
            {
                clearSchedule();
            }
        }

        public void ReadScr(ref JMMMedicalHist objJMMMedicalHist)
        {
            if (lupPrimaryDentist.KPIID != long.MinValue)
            {
                objJMMMedicalHist.PrimeDentistID = lupPrimaryDentist.KPIID;
            }

            objJMMMedicalHist.JurisID = ((BasePage)(this.Page)).GetPageJuris();
            
        }


        protected void grdDental_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            try
            {
                int iRow = e.Row.Index;
                if (grdDental.GetValue(iRow, "DentalVisitNo") != null)
                {
                    if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("DentalVisitNo").Text))
                    {
                        grdDental.SetValue(iRow, "DentalVisitNo", Counter.GetFormattedNo(CounterType.DentalVisitNo, grdDental.GetValue(iRow, "DentalVisitNo")));
                    }
                }

                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("JMDentistVisitID").Text))
                {
                    e.Row.Items.FindItemByKey("Notes").CssClass = "NotificationRules";
                }
                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Procedure").Text))
                {
                    e.Row.Items.FindItemByKey("Procedure").Tooltip = e.Row.Items.FindItemByKey("Procedure").Text;
                }

                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Diseases").Text))
                {
                    e.Row.Items.FindItemByKey("Diseases").Tooltip = e.Row.Items.FindItemByKey("Diseases").Text;
                }

                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Medications").Text))
                {
                    e.Row.Items.FindItemByKey("Medications").Tooltip = e.Row.Items.FindItemByKey("Medications").Text;
                }
            }
            catch (Exception objError)
            {

                throw objError;
            }

        }
    }
}