using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KPI.Phoenix.Object.Inmate;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Helper;
using System.Web.UI.HtmlControls;

namespace KPI.PhoenixWeb.Inmate.UserControls
{
    public partial class usrMedCharting : System.Web.UI.UserControl
    {
        public Int32? JurisID = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                //cmdSave.Attributes.Add("OnClick", "glbCtrlClicked = ''; return fn_NotesValidation();");
                KPIRadHuberActivityDetails.Attributes.Add("OnBlur", "TabValidate();");
                KPIRadHuberActivityDetails.Attributes.Add("OnChange", "TabValidate();");

                if (KPIRadHuberActivityDetails.Text != "")
                {
                    hdnHistory.Value = System.Web.HttpUtility.HtmlEncode(KPIRadHuberActivityDetails.Text);
                }
                //if (!IsPostBack)
                //{
                //    LoadData();                    
                //}
            }
            catch { }
        }

        private void LoadData()
        {
            try
            {
                

                if (!String.IsNullOrEmpty(Request.QueryString.Get("JMChartID")))
                {
                    this.hdnJMChartID.Value = Request.QueryString.Get("JMChartID");
                }
                if (!String.IsNullOrEmpty(Request.QueryString.Get("hdnJurisId")))
                {
                    this.hdnJurisId.Value = Request.QueryString.Get("hdnJurisId");
                }
                if (!String.IsNullOrEmpty(Request.QueryString.Get("hdnPFNbr")))
                {
                    this.hdnPFNbr.Value = Request.QueryString.Get("hdnPFNbr");
                }
                if (!String.IsNullOrEmpty(Request.QueryString.Get("hdnMode")))
                {
                    hdnMode.Value = Request.QueryString.Get("hdnMode");
                }

                string strhdnMode = "";
                if (hdnMode.Value != "ADD")
                {
                    strhdnMode = hdnMode.Value;
                }
                else
                {
                    strhdnMode = UIMode.ADD.ToString();
                }
                if (strhdnMode == UIMode.CHG.ToString())
                {
                    hdnMode.Value = UIMode.CHG.ToString();
                }
                else
                {
                    hdnMode.Value = UIMode.ADD.ToString();
                }
            }
            catch { }
        }

     

        public CMSCommentsList ReadScr(ref CMSComments objCMSComments)
        {
            CMSCommentsList objCMSCommentsList = null;
            try
            {
                String objText = KPIRadHuberActivityDetails.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.Comments);
                if (String.IsNullOrWhiteSpace(objText.Replace("\r", "").Replace("\n", "").Replace("&nbsp;", "").Replace("<p>", "").Replace("</p>", "").Trim()))
                {
                    return null;

                }


                if (KPIRadHuberActivityDetails.Content != "" && objCMSComments.RefID.HasValue && objCMSComments.RefID.Value > 0)
                {
                    objCMSCommentsList = new CMSCommentsList();
                    
                    if (!String.IsNullOrEmpty(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value) && KPIHlp.CVI32(hdnJurisId.Value) > 0)
                    {
                        JurisID = KPIHlp.CVI32(((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnJurisId"))).Value);
                    }


                    objCMSComments.CMSCommentsID = KPICounter.GetCounterID(State.sJurisID);
                    objCMSComments.RefID = objCMSComments.RefID.Value;

                    if (JurisID != null)
                    {
                        objCMSComments.JurisID = JurisID;
                    }
                    objCMSComments.RefType = (int)JMMChartingLogHistory.ChartingLogHistory;
                    objCMSComments.IsActive = 1;
                    objCMSComments.CommentDttm = System.DateTime.Now;
                    objCMSComments.PFID = State.sPFID;
                    objCMSComments.Comments = KPIRadHuberActivityDetails.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.Comments);
                    KPIRadHuberActivityDetails.Content = "";
                    hdnHistory.Value = "";
                    objCMSCommentsList.Add(objCMSComments);
                }

            }
            catch (Exception objKPIError)
            {
               ((BasePage)this.Page).ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objKPIError);
            }
            return objCMSCommentsList;
        }
    }
}