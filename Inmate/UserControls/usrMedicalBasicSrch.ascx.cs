namespace KPI.PhoenixWeb.Inmate.UserControls
{
    using KPI.Framework.Setup;
    using KPI.Global;
    using KPI.Global.KPIWebControls;
    using KPI.Global.Helper;
    using KPI.Global.StateMachine;

    //using KPI.Phoenix.Global;

    using KPI.Phoenix.Object.Inmate;
    using KPI.Phoenix.Helper;
    using KPI.Phoenix.Inmate;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using Telerik.Web.UI;    /// <summary>
                             ///		Summary description for usrMedicalBasicSrch.
                             /// </summary>
    public partial class usrMedicalBasicSrch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            if (!State.gMultiJuris)
            {
                lstJuris.Visible = false;
                lblJuris.Visible = false;
                tdlblJuris.Style.Add("display", "none");
                tdlstJuris.Style.Add("display", "none");
            }
            else
            {
                tdlblJuris.Style.Add("display", "");
                tdlstJuris.Style.Add("display", "");
            }



            hdnJurisId.Value = ((HtmlInputHidden)this.Page.FindControl("hdnJurisId")).Value;


            imgClear.Attributes.Add("onclick", "return fn_Clear();");
            if (lstJuris.JurisID > 0)
            {
                hdnJurisId.Value = KPIHlp.CVS(lstJuris.JurisID);
            }            

            if (!IsPostBack)
            {
                dttmToDate.DateValue = DateTime.Now;
                int Days = 1;

                System.TimeSpan tTime = new TimeSpan(Days, 0, 0, 0);
                DateTime.Now.Subtract(tTime);
                dttmFromDate.DateValue = DateTime.Now.Subtract(tTime);


                if (State.GPV((int)SetupParams.EnableSubAgency, KPIHlp.CVI32(hdnJurisId.Value)) != "1")
                {
                    lblsubagency.Visible = false;
                    cddSubAgency.Visible = false;
                }
                else
                {
                    LoadSubAgency();
                }

            }
        }
       
        public void ReadScr(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {


                #region Medical Prescription
                JMMAllergy objJMMAllergy = new JMMAllergy();
                objJMMAllergy.Allergy = String.Format("{0}", string.Join("','", radAllergy.KPISelectedValues));
                objJMMMedicalHist.objJMMAllergy = objJMMAllergy;
                #endregion

                #region Medical Prescription
                JmmMedPrescribe objPrescribe = new JmmMedPrescribe();
                objPrescribe.Drug = cddDrugs.CodeValue; //CRM#66995
                objPrescribe.MedNameID = NamCtrlSPIN.KPIID;
                objJMMMedicalHist.objJmmMedPrescribe = objPrescribe;
                #endregion

                #region Medical Visit
                JMMMedVisit objMedVist = new JMMMedVisit();
                objMedVist.Diagnosis = lupDiagnosed.CodeValue;
                objMedVist.Result = cddTBResults.CodeValue;
                objMedVist.Hospital = cddAdmMedFacility.CodeValue;
                objMedVist.SpecialMeal = String.Format("{0}", string.Join("','", radSpecialMealRequired.KPISelectedValues));
                objJMMMedicalHist.objJmmMedVisit = objMedVist;
                #endregion

                #region Medical Flags & Dentist proceedures
                objJMMMedicalHist.DentalProceedure = String.Format("{0}", string.Join("','", radDentProcedure.KPISelectedValues));
                objJMMMedicalHist.MedicalFlags = String.Format("{0}", string.Join("','", radMedicalFlags.KPISelectedValues));// cddMedicalFlags.CodeValue;
                objJMMMedicalHist.JurisID = KPIHlp.CVI32(hdnJurisId.Value);
                #endregion

                #region From & To Date

                objJMMMedicalHist.CreatedDttm = dttmFromDate.DateValue;
                objJMMMedicalHist.ModifiedDttm = dttmToDate.DateValue;

                objJMMMedicalHist.OwnerSubAgencyID = KPIHlp.CVI64(cddSubAgency.CodeValue);


                
                #endregion

            }
            catch (Exception objError)
            {
                throw objError;
            }
        }

        public void Reset()
        {

            dttmToDate.DateValue = DateTime.Now;
            int Days = 1;

            System.TimeSpan tTime = new TimeSpan(Days, 0, 0, 0);
            DateTime.Now.Subtract(tTime);
            dttmFromDate.DateValue = DateTime.Now.Subtract(tTime);

        }

        protected void lstJuris_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubAgency();
        }

        public void LoadSubAgency()
        {
            try
            {
              ((BasePage)Page).WrtActivityLog(long.MinValue, "LoadSubAgency method in user control getting error in medical search screen.", "LOADDATA");
                if (State.GPV((int)SetupParams.EnableSubAgency, KPIHlp.CVI32(hdnJurisId.Value)) == "1")
                {
                    long ObjAgency = new PersonnelBL().GetDefaultAgency(State.sPFID, KPIHlp.CVI32(hdnJurisId.Value));

                    cddSubAgency.JurisData(null, null);
                    if (ObjAgency != long.MinValue)
                    {
                        cddSubAgency.KPISelectedCodeValue = ObjAgency.ToString();

                        ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisSubAgencyID"))).Value = ObjAgency.ToString();

                    }
                    else
                    {
                        ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisSubAgencyID"))).Value = string.Empty;
                    }
                }
                LoginSubRoleCheck();  
            }
            catch (Exception objErr)
            {
                State.KPILog.Info(" LoadSubAgency method getting error in medical search screen ");
                ((BasePage)Page).ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }


        public void LoginSubRoleCheck()
        {
            int iJurisID = KPIHlp.CVI32(hdnJurisId.Value);

            long ObjAgency = new PersonnelBL().GetDefaultAgency(State.sPFID, iJurisID);
            if (new CMSHlp().ChekLoginRoleAndSubagency(ObjAgency, iJurisID))
            {
                cddSubAgency.DropDown.Enabled = true;
                cddSubAgency.KPISecurity = "ACI";
            }
            else
            {
                cddSubAgency.DropDown.Enabled = false;
                cddSubAgency.KPISecurity = "N";
            }
        }

    }
}
