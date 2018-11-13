using Infragistics.Web.UI.GridControls;
using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Data;
using System.Drawing;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for frmDoctorSrch1.
    /// </summary>
    public partial class frmDoctorSrch : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                //SetFocus((WebControl) txtBuildingName);
                cmdSearch.Attributes.Add("OnClick", "return ValidateScrn();");
                BoundCheckBoxField ChkDentist = (BoundCheckBoxField)this.grdDoctorSrch.Columns.FromKey("Dentist");
                ChkDentist.ValueConverter = new BoolConverter();

                BoundCheckBoxField ChkInactive = (BoundCheckBoxField)this.grdDoctorSrch.Columns.FromKey("Inactive");
                ChkInactive.ValueConverter = new BoolConverter();
                #region Added By Jothiraj for load the grid intially Based on the screen height

                if (Request.QueryString.Get("ScreenHeight") != null && !String.IsNullOrEmpty(Request.QueryString.Get("ScreenHeight")))
                {
                    string height = Request.QueryString.Get("ScreenHeight");
                    if (height.Contains(","))
                    {
                        height = height.Split(',')[0];
                    }
                    hdnPageHgt.Value = height;
                    if (!String.IsNullOrEmpty(hdnPageHgt.Value))
                    {
                        string grdHeight = string.Format("{0}px", KPIHlp.CVI32(hdnPageHgt.Value) - 300);
                        grdDoctorSrch.Style.Add("height", grdHeight);
                    }
                }
              
                iGrdPageSize = GrdPageSize(this.Page, 260);
                #endregion Added By Jothiraj for load the grid intially Based on the screen height
                switch (hdnAutoLoad.Value)
                {
                    case "LOAD":
                        RetrieveDoctorSrch();
                        break;
                }
                hdnAutoLoad.Value = "";

                if (!Page.IsPostBack)
                {
                    AddClientOnLoadScript("setFocusOnDoctorName()");
                }
            }
            catch (KPIException objKPIError)
            {
                ShowMsg(MsgType.Error, FrwkMsg.ERR, objKPIError);
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void RetrieveDoctorSrch()
        {
            try
            {
                grdDoctorSrch.DataSource = GetData(false);
                grdDoctorSrch.DataBind();
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        protected void cmdSearch_Click(object sender, System.EventArgs e)
        {
            try
            {
                grdDoctorSrch.KPICurrentGrdPageIndex = 1;
                RetrieveDoctorSrch();
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }

        protected DataSet GetData(bool blnExcel)
        {
            try
            {
                JmsDoctor objJmsDoctor = new JmsDoctor();
                objJmsDoctor.DoctorName = KPIHlp.CVS(txtName.Text);
                objJmsDoctor.Location = KPIHlp.CVS(txtLocation.Text);

                if (chkIsActive.Checked == true)
                {
                    objJmsDoctor.IsActive = 0;
                }
                else
                {
                    objJmsDoctor.IsActive = 1;
                }

                objJmsDoctor.DoctorName = KPIHlp.CVS(txtName.Text);
                objJmsDoctor.Location = KPIHlp.CVS(txtLocation.Text);
                objJmsDoctor.JurisID = lstJuris.JurisID;

                JmsDoctorBL objJmsDoctorBL = new JmsDoctorBL();
                iGrdPageSize = 23;

                if (!blnExcel)
                {
                    return objJmsDoctorBL.Search(objJmsDoctor, grdDoctorSrch.KPICurrentGrdPageIndex, iGrdPageSize);
                }
                else
                {
                    return objJmsDoctorBL.Search(objJmsDoctor, 1, iExcelPageSize);
                }
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        protected void grdDoctorSrch_InitializeRow(object sender, RowEventArgs e)
        {
            try
            {
                int iRow = e.Row.Index;
                if (e.Row.Items.FindItemByKey("Inactive") != null && e.Row.Items.FindItemByKey("Inactive").Text == "1")
                {
                    e.Row.CssClass = "RedColor";
                }
                if (e.Row.Items.FindItemByKey("PhoneNbr") != null && !string.IsNullOrEmpty(e.Row.Items.FindItemByKey("PhoneNbr").Text))
                {
                    grdDoctorSrch.SetValue(iRow, "PhoneNbr", FrameMaskString(e.Row.Items.FindItemByKey("PhoneNbr").Text));
                }
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }

        protected string FrameMaskString(string strVal)
        {
            try
            {
                if (strVal.Length >= 10)
                {
                    string strResult = null;
                    strResult = "(";
                    strResult += strVal.Substring(0, 3);
                    strResult += ")";
                    strResult += " ";
                    strResult += strVal.Substring(3, 3);
                    strResult += "-";
                    strResult += strVal.Substring(6, 4);
                    return strResult;
                }
                else
                    return strVal;
            }
            catch (Exception objErr)
            {
                throw objErr;
            }
        }

        protected void tlbGridItem_ButtonClicked(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs be)
        {
            try
            {
                switch (be.Item.Key)
                {
                    case "PRINT":
                        PrintDoctorInquiry();
                        break;

                    case "EXCEL":
                        cmdExcel();
                        break;

                    default:
                        break;
                }
            }
            catch (Exception exp)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, exp);
            }
        }

      
        protected void grdDoctorSrch_lnkbtnPrev_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(-1);
            grdDoctorSrch.KPIGrdPageIndexChanged(sender, eventArgs);
            RetrieveDoctorSrch();
        }

        protected void grdDoctorSrch_lnkbtnNext_Click(object sender, EventArgs e)
        {
            Infragistics.Web.UI.GridControls.PagingEventArgs eventArgs = new Infragistics.Web.UI.GridControls.PagingEventArgs(1);
            grdDoctorSrch.KPIGrdPageIndexChanged(sender, eventArgs);
            RetrieveDoctorSrch();
        } 

        protected void PrintDoctorInquiry()
        {
            try
            {
                JmsDoctor objJmsDoctor = new JmsDoctor();
                objJmsDoctor.DoctorName = KPIHlp.CVS(txtName.Text);
                objJmsDoctor.Location = KPIHlp.CVS(txtLocation.Text);

                if (chkIsActive.Checked == true)
                {
                    objJmsDoctor.IsActive = 0;
                }
                else
                {
                    objJmsDoctor.IsActive = 1;
                }

                objJmsDoctor.DoctorName = KPIHlp.CVS(txtName.Text);
                objJmsDoctor.Location = KPIHlp.CVS(txtLocation.Text);
                objJmsDoctor.JurisID = lstJuris.JurisID;

                JmsDoctorBL objJmsDoctorBL = new JmsDoctorBL();

                objJmsDoctorBL.DoctorPrintSearch(objJmsDoctor);
                WrtActivityLog(long.MinValue, "DoctorSearch Print", "PRT");
                // 66954
                State.PageSelectedSubAgency = -1;
                //
                PrintReport();
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);
            }
        }

        protected void cmdExcel()
        {
            DataSet objDS = GetData(true);

            for (int iCount = 0; iCount < objDS.Tables[0].Rows.Count; iCount++)
            {
                if (objDS.Tables[0].Rows[iCount]["PhoneNbr"].ToString().Trim() != "")
                    objDS.Tables[0].Rows[iCount]["PhoneNbr"] = FrameMaskString(objDS.Tables[0].Rows[iCount]["PhoneNbr"].ToString());
            }

            ExportToExcel(ref objDS, grdDoctorSrch.GetExcelColumns(), "DoctorInquiry.xls");
        }
    }
}

