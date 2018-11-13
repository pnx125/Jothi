using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using KPI.Framework.Setup;
using KPI.Global;
using KPI.Global.KPIWebControls;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Object.Inmate;
using System.Text;
using System.Text.RegularExpressions;
using KPI.Phoenix.Helper;

namespace KPI.PhoenixWeb.Inmate.UserControls
{
    public partial class usrMedMarBasicSrch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
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

            if (lstJuris.JurisID > 0)
            {
                hdnJurisId.Value = KPIHlp.CVS(lstJuris.JurisID);
            }
            if (!IsPostBack)
            {
                

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



        public void ReadScr(ref JMMMedPrescriptionHist objJMMMedPrescriptionHist)
        {
            try
            {               
                if (State.gMultiJuris == true && lstJuris.JurisID != 0)
                {
                    objJMMMedPrescriptionHist.JurisID = lstJuris.JurisID;
                }
                else if (!State.gMultiJuris)
                {
                    objJMMMedPrescriptionHist.JurisID = State.sJurisID;
                }
                objJMMMedPrescriptionHist.Drug = lupPrescription.CodeValue;
                objJMMMedPrescriptionHist.NameID = NamCtrlSPIN.KPIID;
                objJMMMedPrescriptionHist.ActivityFromDttm = dttmFromDate.DateValue;
                objJMMMedPrescriptionHist.ActivityToDttm = dttmToDate.DateValue;
                objJMMMedPrescriptionHist.MarPFID = lupBy.KPIID > 0 ? lupBy.KPIID : long.MinValue; 
                objJMMMedPrescriptionHist.OwnerSubAgencyID = KPIHlp.CVI64(cddSubAgency.CodeValue);

                #region GetDocumentTypeList
                StringBuilder SBIDocType = new StringBuilder();
                if (radStatus.CheckedItems.Count > 0)
                {
                    for (int i = 0; i < radStatus.CheckedItems.Count; i++)
                    {
                        if (i == radStatus.CheckedItems.Count - 1)
                        {
                            SBIDocType.Append(radStatus.CheckedItems[i].Value);
                        }
                        else
                        {
                            SBIDocType.Append(radStatus.CheckedItems[i].Value + ",");

                        }
                    }
                    objJMMMedPrescriptionHist.Status = string.Format("'{0}'", Regex.Replace(SBIDocType.ToString(), @",", "','"));
                }

                #endregion
            }
            catch (Exception objError)
            {
                ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objError);
                
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
        protected void imgClear_Click(object sender, ImageClickEventArgs e)
        {
            dttmFromDate.DateValue = DateTime.MinValue;
            dttmToDate.DateValue = DateTime.MinValue;

        }
}
}