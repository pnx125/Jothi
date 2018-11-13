using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using KPI.Phoenix.Inmate;
using System.Web.UI;
using System.Web.UI.WebControls;
//using KPI.Phoenix.Global;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmScheduledAppts.
    /// </summary>
    public partial class frmScheduledAppts : BasePage
    {
        public Int64 JMMedicalHistID = Int64.MinValue;
        public Int64 NameID = Int64.MinValue;      
        public Int64 JMBookingID = Int64.MinValue;
        public Int32 JurisID = Int32.MinValue;
        
        
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

            if (Request.QueryString.Get("hdnJurisID") != null && Request.QueryString.Get("hdnJurisID") != string.Empty)
            {
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisID").ToString();
                JurisID = KPIHlp.CVI32(hdnJurisId.Value);
            }

            if (Request.QueryString.Get("BookingID") != null && Request.QueryString.Get("BookingID") != string.Empty)
            {
                hdnBookingID.Value = Request.QueryString.Get("BookingID").ToString();
                JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
            }

            if (Request.QueryString.Get("JMMedicalHistID") != null && Request.QueryString.Get("JMMedicalHistID") != string.Empty)
            {
                hdnJMMedicalHistID.Value = Request.QueryString.Get("JMMedicalHistID").ToString();
                JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
            }

            if (Request.QueryString.Get("InmateNameID") != null && Request.QueryString.Get("InmateNameID") != string.Empty)
            {
                hdnNameID.Value = Request.QueryString.Get("InmateNameID").ToString();
                NameID = KPIHlp.CVI64(hdnNameID.Value);
            }
            if (Request.QueryString.Get("Mode") != null && Request.QueryString.Get("Mode") != string.Empty)
            {
                hdnMode.Value = Request.QueryString.Get("Mode").ToString();

            }

            if (!IsPostBack)
            {              

                LoadCtrls();
                Inquiry();
            }
            else if (hdnAutoLoad.Value.ToUpper() == "LOAD")
            {
                Inquiry();
                hdnAutoLoad.Value = string.Empty;
            }


           
            
        }
        protected void BindScheduleGrid(ref long NameID)
        {
            try
            {
                State.KPILog.Info("Schedule/Payment : BindScheduleGrid function ");
                DataSet dsSchedule = null;
                
                dttmSchEvtFrom.DateValue = dttmSchEvtFrom.DateValue != DateTime.MinValue ? dttmSchEvtFrom.DateValue : DateTime.Now;
                dttmSchEvtTo.DateValue = dttmSchEvtTo.DateValue != DateTime.MinValue ? dttmSchEvtTo.DateValue : DateTime.Now;
               
                dsSchedule = new JmmMedicalHistBL().GetAllSTSHubEvents(NameID, chkShowDel.Checked, dttmSchEvtFrom.DateValue, dttmSchEvtTo.DateValue, JurisID);
                if (dsSchedule != null)
                {
                    grdScheEvent.DataSource = dsSchedule;
                    grdScheEvent.DataBind();
                }

                State.KPILog.Info("Schedule/Payment : BindScheduleGrid function  Finished");
            }
            catch (Exception objErr)
            {
                State.KPILog.Info("Schedule/Payment : BindScheduleGrid function " + objErr.Message);
                throw objErr;
            }
        }


        public void Inquiry()
        {
            try
            {
                State.KPILog.Info("Schedule/Payment : Inquiry function ");

                if (JMBookingID != Int64.MinValue && JMMedicalHistID != long.MinValue)
                {

                    BindScheduleGrid(ref NameID);

                }
                State.KPILog.Info("Schedule/Payment : Inquiry function Finished");
            }
            catch (Exception objErr)
            {
                State.KPILog.Info("Schedule/Payment : Inquiry function " + objErr.Message);
                throw objErr;
            }
        }


        public void LoadCtrls()
        {
            if (dttmSchEvtFrom.DateValue == DateTime.MinValue && dttmSchEvtTo.DateValue == DateTime.MinValue)
            {
                dttmSchEvtFrom.DateValue = DateTime.Now;
                dttmSchEvtTo.DateValue = DateTime.Now.AddDays(30.0);
            }
        }

        protected void grdScheEvent_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {
            string sSubType = grdScheEvent.GetString(e.Row.Index, "SubType").Trim();
            if (sSubType != "H05" && sSubType != "H06" && sSubType != "H07" && sSubType != "H08")
            {
                if (grdScheEvent.GetDecimal(e.Row.Index, "CostAmt") == grdScheEvent.GetDecimal(e.Row.Index, "PaidAmt") && grdScheEvent.GetBool(e.Row.Index, "IsActive") && grdScheEvent.GetDecimal(e.Row.Index, "CostAmt") != Decimal.MinValue && grdScheEvent.GetDecimal(e.Row.Index, "CostAmt") != 0)
                {
                    e.Row.CssClass = "GreenColor";
                }
            }

            if (!grdScheEvent.GetBool(e.Row.Index, "IsActive"))
            {
                e.Row.CssClass = "GrayColor";
            }

            DateTime NowDttm = DateTime.Now;
            if (grdScheEvent.GetString(e.Row.Index, "SignIn").Trim() == "out" && (grdScheEvent.GetDateTime(e.Row.Index, "END") < NowDttm) && grdScheEvent.GetBool(e.Row.Index, "IsActive"))
            {
                e.Row.CssClass = "BrownColor";
            }

            if (grdScheEvent.GetShort(e.Row.Index, "SignDone") == 1 && grdScheEvent.GetBool(e.Row.Index, "IsActive"))
            {
                e.Row.CssClass = "RoyalBlueColor";
            }

           

            string sDueTime = grdScheEvent.GetString(e.Row.Index, "END").Trim();
            string sSign = grdScheEvent.GetString(e.Row.Index, "SignIn").Trim();
            if (sDueTime != "" && sSign == "In" && grdScheEvent.GetBool(e.Row.Index, "IsActive"))
            {
                DateTime curTime = DateTime.Now;

                DateTime dTime = Convert.ToDateTime(sDueTime);
                DateTime dtDueTime = new DateTime(dTime.Year, dTime.Month, dTime.Day, dTime.Hour, dTime.Minute, 0);
                DateTime RealCurTime = new DateTime(curTime.Year, curTime.Month, curTime.Day, curTime.Hour, curTime.Minute, 0);
                if (dtDueTime < RealCurTime)
                {
                    e.Row.CssClass = "BldRedColor";
                }
                else
                {
                    e.Row.CssClass = "BoldBlueColor";
                }
            }

            if (grdScheEvent.GetDateTime(e.Row.Index, "SignInDttm") != DateTime.MinValue)
            {
                string signInDttm = grdScheEvent.GetString(e.Row.Index, "SignInDttm").Trim();
                if (sDueTime != "" && signInDttm != "" && grdScheEvent.GetBool(e.Row.Index, "IsActive"))
                {
                    DateTime dTime = Convert.ToDateTime(sDueTime);
                    DateTime dtDueTime = new DateTime(dTime.Year, dTime.Month, dTime.Day, dTime.Hour, dTime.Minute, 0);
                    DateTime sInDttm = Convert.ToDateTime(signInDttm);
                    DateTime dtSInDttm = new DateTime(sInDttm.Year, sInDttm.Month, sInDttm.Day, sInDttm.Hour, sInDttm.Minute, 0);
                    if (dtSInDttm > dtDueTime)
                    {
                        e.Row.CssClass = "RedColor";
                    }
                }
            }

            if (grdScheEvent.GetValue(e.Row.Index, "EventNo") != null)
            {
                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("EventNo").Text))
                {
                    grdScheEvent.SetValue(e.Row.Index, "EventNo", Counter.GetFormattedNo(CounterType.EventNo, grdScheEvent.GetValue(e.Row.Index, "EventNo")));
                }
            }

        }

        protected void chkShowDel_CheckedChanged(object sender, EventArgs e)
        {
            Inquiry();
            hdnAutoLoad.Value = string.Empty;

        }

    }
}

