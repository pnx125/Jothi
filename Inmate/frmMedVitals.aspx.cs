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
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KPI.PhoenixWeb.Inmate
{
    public partial class frmMedVitals : BasePage
    {
        public Int64 JMMedicalHistID = Int64.MinValue;
        public String WeightType = String.Empty;
        public String WeightStatus = String.Empty;
        public String TemperatureType = String.Empty;
        public String BloodPressureType = String.Empty;
        public String BloodPressureStatus = String.Empty;        
        public String PulseRhythm = String.Empty;
        public String SpoxActivity = String.Empty;
        public String SpoxAtRest = String.Empty;
        public Int64 JMBookingID = Int64.MinValue;
        public Int32 JurisID = Int32.MinValue;
        public Int16 Status = Int16.MinValue;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmdAdd.Attributes.Add("OnClick", "return fn_ManipulationVitalTab();");
            cmdClear.Attributes.Add("OnClick", "return fn_CancelVitals();");
            cmdSave.Attributes.Add("OnClick", "glbCtrlClicked='Save';");
            cmdReset.Attributes.Add("OnClick", "glbCtrlClicked='Reset';");
            Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");

            if (Request.QueryString.Get("hdnJurisID") != null && Request.QueryString.Get("hdnJurisID") != string.Empty)
            {
                hdnJurisId.Value = Request.QueryString.Get("hdnJurisID").ToString();
                JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                hdnSetUserPFID.Value = State.GPV((int)JailAdmissionParams.IsDefaultAllPFFields, KPIHlp.CVI32(hdnJurisId.Value));
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
            if (Request.QueryString.Get("Mode") != null && Request.QueryString.Get("Mode") != string.Empty)
            {
                hdnMode.Value = Request.QueryString.Get("Mode").ToString();
                
            }
            if (Request.QueryString.Get("Status") != null && Request.QueryString.Get("Status") != string.Empty)
            {
                hdnStatus.Value = Request.QueryString.Get("Status").ToString();
                Status = KPIHlp.CVI16(hdnStatus.Value);                
            }
            
            if(Status==1)
            {
                tdstatusbar.Style.Remove("display");
            }
            else
            {
                tdstatusbar.Style.Add("display", "none");
            }
           

            
            if (State.sJurisID == KPIHlp.CVI32(hdnJurisId.Value))
            {
                hdnLoginPFCode.Value = KPI.Global.Helper.PersonnelHlp.GetPFCode(State.sPFID);
                hdnLoginPFDesc.Value = KPI.Global.Helper.PersonnelHlp.GetPFFullName(State.sPFID);
                hdnLoginPFID.Value = State.sPFID.ToString();
            }
            if (!IsPostBack)
            {
                if (JMMedicalHistID != Int64.MinValue && JMBookingID != Int64.MinValue && JurisID != Int32.MinValue)
                {
                    Inquiry(JMMedicalHistID, JMBookingID, JurisID, Status);
                }
            }
        }
        protected void cmdReset_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                AddClientOnLoadScript("fn_CancelVitals();");
                if (JMMedicalHistID != Int64.MinValue && JMBookingID != Int64.MinValue && JurisID != Int32.MinValue)
                {
                    Inquiry(JMMedicalHistID, JMBookingID, JurisID, Status);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }
        protected void cmdSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool Save()
        {
            JmmMedVitalList objJmmMedVitalList = null;
            JMMMedVitalsBL objJmmMedVitalsBL = null;
            try
            {
                objJmmMedVitalList = ReadScr();
                objJmmMedVitalsBL = new JMMMedVitalsBL();
                KPITrace.Debug(TraceWeight.Five, "Calling Manage for medical vitals tab");
                WrtActivityLog(long.MinValue, " Managing vitals tab Dtls.", hdnMode.Value);
                if (objJmmMedVitalList == null)
                    return false;
                else
                {
                    objJmmMedVitalsBL.ManageVitals(objJmmMedVitalList);
                    if (objJmmMedVitalList.Count > 0)
                    {
                        ((BasePage)Page).ShowMsg(MsgType.Success, FrwkMsg.UPD_SUCCESS, null);
                    }
                    Inquiry(JMMedicalHistID, JMBookingID, JurisID, Status);
                    if (Status == 1)
                    {
                        AddClientOnLoadScript("fn_setVitalDetails();");
                    }
                    return true;
                }
                
            }
            catch (Exception objError)
            {
                throw objError;
            }
            finally
            {

            }

        }

        public void Inquiry(Int64 JMMedicalHistID, Int64 JMBookingID, Int32 JurisID, Int16 Status)
        {
            try
            {
                if (JMMedicalHistID!=Int64.MinValue && JMBookingID != Int64.MinValue && JurisID != Int32.MinValue)
                {
                    DataSet objDS = new JMMMedVitalsBL().SearchVitals(JMMedicalHistID, JMBookingID, JurisID, Status);
                    grdMedicalVital.ClearDataSource();
                    grdMedicalVital.DataSource = objDS;
                    grdMedicalVital.DataBind();
                    if (objDS!=null && objDS.Tables[0].Rows.Count>0 && Status == 1)
                    {
                        JMMMedVitals objJMMMedVitals = new JMMMedVitalsBL().Select(KPIHlp.CVI64(objDS.Tables[0].Rows[0]["JMMedVitaltID"].ToString()));
                        hdnBloodPressure.Value = objJMMMedVitals.BloodPressure;
                        hdnBloodPressureMax.Value = objJMMMedVitals.BloodPressureMax;
                        if (objJMMMedVitals.Height.HasValue)
                        {
                            hdnHeight.Value = objJMMMedVitals.Height.Value.ToString();
                        }
                        else
                        {
                            hdnHeight.Value = string.Empty;
                        }
                        if (objJMMMedVitals.Weight.HasValue)
                        {
                            hdnWeight.Value = objJMMMedVitals.Weight.Value.ToString();
                        }
                        else
                        {
                            hdnWeight.Value = string.Empty;
                        }
                        if (objJMMMedVitals.JMMedVitaltID.HasValue)
                        {
                            hdnMedVitalID.Value = objJMMMedVitals.JMMedVitaltID.Value.ToString();
                        }
                        else
                        {
                            hdnMedVitalID.Value = string.Empty;

                        }
                        if (objJMMMedVitals.PulseApical.HasValue)
                        {
                            hdnPulse.Value = objJMMMedVitals.PulseApical.Value.ToString();
                        }
                        else if (objJMMMedVitals.PulseRadial.HasValue)
                        {
                            hdnPulse.Value = objJMMMedVitals.PulseRadial.Value.ToString();
                        }
                        else
                        {
                            hdnPulse.Value = string.Empty;
                        }
                        
                        
                    }
                    
                }
            }
            catch (Exception)
            {

                throw;
            }


        }


        public JmmMedVitalList ReadScr()
        {
            JmmMedVitalList objJmmMedVitalList = null;
            JMMMedVitals objJmmMedVitals = null;
            try
            {
                objJmmMedVitalList = new JmmMedVitalList();                
                KPITrace.Debug(TraceWeight.Five, "Reading Data from Medical vitals Scrn");
                for (int iRowCount = 0; iRowCount < grdMedicalVital.Rows.Count; iRowCount++)
                {
                    if (grdMedicalVital.IsActiveRow(iRowCount))
                    {
                        objJmmMedVitals = new JMMMedVitals();
                        objJmmMedVitals.JMBookingID = KPIHlp.CVI64(hdnBookingID.Value);
                        objJmmMedVitals.JMMedicalHistID = KPIHlp.CVI64(hdnJMMedicalHistID.Value);
                        objJmmMedVitals.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                        objJmmMedVitals.Status = KPIHlp.CVI16(hdnStatus.Value);

                        objJmmMedVitals.cMode = grdMedicalVital.GetChar(iRowCount, "KPIMode");
                        objJmmMedVitals.VitalDttm = grdMedicalVital.GetDateTime(iRowCount, "VitalDttm");
                        objJmmMedVitals.VitalPFID = grdMedicalVital.GetLong(iRowCount, "VitalPFID");
                        if (grdMedicalVital.GetInt(iRowCount, "Height") != Int32.MinValue)
                        {
                            objJmmMedVitals.Height = grdMedicalVital.GetInt(iRowCount, "Height");
                        }
                        if (grdMedicalVital.GetDecimal(iRowCount, "Weight") != Decimal.MinValue)
                        {
                            objJmmMedVitals.Weight = grdMedicalVital.GetDecimal(iRowCount, "Weight");
                            if (grdMedicalVital.GetShort(iRowCount, "WeightType") != Int16.MinValue && grdMedicalVital.GetShort(iRowCount, "WeightType") > 0)
                            {
                                objJmmMedVitals.WeightType = grdMedicalVital.GetShort(iRowCount, "WeightType");
                            }

                            if (grdMedicalVital.GetShort(iRowCount, "WeightStatus") != Int16.MinValue && grdMedicalVital.GetShort(iRowCount, "WeightStatus") > 0)
                            {
                                objJmmMedVitals.WeightStatus = grdMedicalVital.GetShort(iRowCount, "WeightStatus");
                            }
                        }
                        
                        if (grdMedicalVital.GetInt(iRowCount, "Respiration") != Int32.MinValue)
                        {
                            objJmmMedVitals.Respiration = grdMedicalVital.GetInt(iRowCount, "Respiration");
                        }
                        if (grdMedicalVital.GetDecimal(iRowCount, "Temperature") != Decimal.MinValue)
                        {
                            objJmmMedVitals.Temperature = grdMedicalVital.GetDecimal(iRowCount, "Temperature");
                            if (grdMedicalVital.GetShort(iRowCount, "TemperatureType") != Int16.MinValue && grdMedicalVital.GetShort(iRowCount, "TemperatureType") > 0)
                            {
                                objJmmMedVitals.TemperatureType = grdMedicalVital.GetShort(iRowCount, "TemperatureType");
                            }
                        }
                        
                        if (grdMedicalVital.GetInt(iRowCount, "SpoxAtRest") != Int32.MinValue)
                        {
                            objJmmMedVitals.SpoxAtRest = grdMedicalVital.GetInt(iRowCount, "SpoxAtRest");
                        }
                        if (grdMedicalVital.GetInt(iRowCount, "SpoxActivity") != Int32.MinValue)
                        {
                            objJmmMedVitals.SpoxActivity = grdMedicalVital.GetInt(iRowCount, "SpoxActivity");
                        }                        
                        
                        if (grdMedicalVital.GetInt(iRowCount, "PulseApical") != Int32.MinValue)
                        {
                            objJmmMedVitals.PulseApical = grdMedicalVital.GetInt(iRowCount, "PulseApical");
                        }
                        if (grdMedicalVital.GetInt(iRowCount, "PulseRadial") != Int32.MinValue)
                        {
                            objJmmMedVitals.PulseRadial = grdMedicalVital.GetInt(iRowCount, "PulseRadial");
                        }


                        if (grdMedicalVital.GetLong(iRowCount, "KPIID") > 0)
                        {
                            objJmmMedVitals.JMMedVitaltID = grdMedicalVital.GetLong(iRowCount, "KPIID");
                        }
                        else
                        {
                            objJmmMedVitals.JMMedVitaltID = KPICounter.GetCounterID(objJmmMedVitals.JurisID.Value);
                            objJmmMedVitals.cMode = 'A';
                        }


                        if ((objJmmMedVitals.PulseApical != null && objJmmMedVitals.PulseApical != Int32.MinValue) || (objJmmMedVitals.PulseRadial != null && objJmmMedVitals.PulseRadial != Int32.MinValue))
                        {

                            if (grdMedicalVital.GetShort(iRowCount, "PulseRhythm") != Int16.MinValue && grdMedicalVital.GetShort(iRowCount, "PulseRhythm") > 0)
                            {
                                objJmmMedVitals.PulseRhythm = grdMedicalVital.GetShort(iRowCount, "PulseRhythm");
                            }
                        }
                        else
                        {
                            objJmmMedVitals.PulseRhythm = 0;
                        }
                        
                        

                        if (!String.IsNullOrWhiteSpace(grdMedicalVital.GetString(iRowCount, "BloodPressure")))
                        {
                            objJmmMedVitals.BloodPressure = grdMedicalVital.GetString(iRowCount, "BloodPressure");
                            if (grdMedicalVital.GetShort(iRowCount, "BloodPressureType") != Int16.MinValue && grdMedicalVital.GetShort(iRowCount, "BloodPressureType") > 0)
                            {
                                objJmmMedVitals.BloodPressureType = grdMedicalVital.GetShort(iRowCount, "BloodPressureType");
                            }
                            if (grdMedicalVital.GetShort(iRowCount, "BloodPressureStatus") != Int16.MinValue && grdMedicalVital.GetShort(iRowCount, "BloodPressureStatus") > 0)
                            {
                                objJmmMedVitals.BloodPressureStatus = grdMedicalVital.GetShort(iRowCount, "BloodPressureStatus");
                            }
                        }

                        if (!String.IsNullOrWhiteSpace(grdMedicalVital.GetString(iRowCount, "BloodPressureMax")))
                        {
                            objJmmMedVitals.BloodPressureMax = grdMedicalVital.GetString(iRowCount, "BloodPressureMax");
                        }
                        if (!String.IsNullOrWhiteSpace(grdMedicalVital.GetString(iRowCount, "CmtsNotes")))
                        {
                            objJmmMedVitals.Cmts = System.Web.HttpUtility.HtmlDecode(grdMedicalVital.GetString(iRowCount, "CmtsNotes"));

                            if (!String.IsNullOrEmpty(objJmmMedVitals.Custom1))
                            {
                                if (objJmmMedVitals.Cmts.Length <= 400)
                                {
                                    objJmmMedVitals.Cmts = objJmmMedVitals.Cmts.Substring(0, objJmmMedVitals.Cmts.Length);
                                }
                                else
                                {
                                    objJmmMedVitals.Cmts = objJmmMedVitals.Cmts.Substring(0, txtNotes.MaxLength);
                                }

                            }

                        }

                        objJmmMedVitalList.Add(objJmmMedVitals);
                    }
                }
                return objJmmMedVitalList;
                
            }
            catch (Exception objError)
            {

                throw objError;
            }
            finally
            {
                objJmmMedVitals = null;
                objJmmMedVitalList = null;
            }
        }
        protected void grdMedicalVital_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
        {

            try
            {
                #region Weight
                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Weight").Text))
                {
                    switch (e.Row.Items.FindItemByKey("WeightType").Text)
                    {
                        case "1":
                            WeightType = " L";
                            break;
                        case "2":
                            WeightType = " K";
                            break;
                        default:
                            WeightType = string.Empty;
                            break;
                    }
                    switch (e.Row.Items.FindItemByKey("WeightStatus").Text)
                    {
                        case "1":
                            WeightStatus = " A";
                            break;
                        case "2":
                            WeightStatus = " S";
                            break;
                        default:
                            WeightStatus = string.Empty;
                            break;
                    }

                    e.Row.Items.FindItemByKey("WType").Text = e.Row.Items.FindItemByKey("WeightType").Text;
                    e.Row.Items.FindItemByKey("WStatus").Text = e.Row.Items.FindItemByKey("WeightStatus").Text;

                    e.Row.Items.FindItemByKey("WeightWithType").Text = e.Row.Items.FindItemByKey("Weight").Text + WeightType + WeightStatus;
                }
                #endregion

                #region Temperature
                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Temperature").Text))
                {
                    switch (e.Row.Items.FindItemByKey("TemperatureType").Text)
                    {
                        case "1":
                            TemperatureType = " O";
                            break;
                        case "2":
                            TemperatureType = " R";
                            break;
                        case "3":
                            TemperatureType = " A";
                            break;
                        case "4":
                            TemperatureType = " E";
                            break;
                        case "5":
                            TemperatureType = "T";
                            break;
                        default:
                            TemperatureType = string.Empty;
                            break;
                    }
                    e.Row.Items.FindItemByKey("TemperatureWithType").Text = e.Row.Items.FindItemByKey("Temperature").Text + TemperatureType;
                }
                #endregion

                #region BloodPressure
                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("BloodPressure").Text) || !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("BloodPressureMax").Text))
                {
                    switch (e.Row.Items.FindItemByKey("BloodPressureType").Text)
                    {
                        case "1":
                            BloodPressureType = " L";
                            break;
                        case "2":
                            BloodPressureType = " R";
                            break;
                        default:
                            BloodPressureType = string.Empty;
                            break;
                    }
                    switch (e.Row.Items.FindItemByKey("BloodPressureStatus").Text)
                    {
                        case "1":
                            BloodPressureStatus = " S";
                            break;
                        case "2":
                            BloodPressureStatus = " L";
                            break;
                        case "3":
                            BloodPressureStatus = " S";
                            break;
                        default:
                            BloodPressureStatus = string.Empty;
                            break;
                    }
                    
                    e.Row.Items.FindItemByKey("BPWithType").Text = e.Row.Items.FindItemByKey("BloodPressure").Text + '/' + e.Row.Items.FindItemByKey("BloodPressureMax").Text + BloodPressureType + BloodPressureStatus;
                }
                #endregion

                #region PulseRhythm
                if (!String.IsNullOrEmpty(e.Row.Items.FindItemByKey("PulseWithType").Text))
                {
                    switch (e.Row.Items.FindItemByKey("PulseRhythm").Text)
                    {
                        case "1":
                            PulseRhythm = " L";
                            break;
                        case "2":
                            PulseRhythm = " R";
                            break;
                        default:
                            PulseRhythm = string.Empty;
                            break;
                       
                    }
                    e.Row.Items.FindItemByKey("Pulse").Text = e.Row.Items.FindItemByKey("PulseWithType").Text + PulseRhythm;
                }
                #endregion


                #region SPOX
                SpoxAtRest = e.Row.Items.FindItemByKey("SpoxAtRest").Text;
                SpoxActivity = e.Row.Items.FindItemByKey("SpoxActivity").Text;
                if (!String.IsNullOrEmpty(SpoxAtRest) && !String.IsNullOrEmpty(SpoxActivity))
                {
                    e.Row.Items.FindItemByKey("Spox").Text = SpoxAtRest + " , " + SpoxActivity;
                }
                else if (String.IsNullOrEmpty(SpoxAtRest) && !String.IsNullOrEmpty(SpoxActivity))
                {
                    e.Row.Items.FindItemByKey("Spox").Text = SpoxActivity;
                }
                else if (!String.IsNullOrEmpty(SpoxAtRest) && String.IsNullOrEmpty(SpoxActivity))
                {
                    e.Row.Items.FindItemByKey("Spox").Text = SpoxAtRest;
                }
             
                #endregion


                if (e.Row.Items.FindItemByKey("Cmts").Text != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("Cmts").Text))
                {
                    if (KPIHlp.CVI64(e.Row.Items.FindItemByKey("Cmts").Text) >= 1)
                    {
                        e.Row.Items.FindItemByKey("Notes").CssClass = "VitalNotes";
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

        }
}
}