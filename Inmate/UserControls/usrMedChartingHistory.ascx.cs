using KPI.Global.Helper;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KPI.PhoenixWeb.Inmate.UserControls
{
    public partial class usrMedChartingHistory : System.Web.UI.UserControl
    {
        private bool bSwitch = false;
        string color1 = "#ffffcc";
        string color2 = "#ccff99";
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    CMSComments objCMSComments = new CMSComments();

            //    DetailInquiry(ref objCMSComments);
            //}
            //catch { }
        }

        public void DetailInquiry(ref CMSComments objCMSComments)
        {
            try
            {
                

                if (KPIHlp.CVI64(Request.QueryString.Get("JMChartID")) != long.MinValue)
                {
                    objCMSComments.RefID = KPIHlp.CVI64(Request.QueryString.Get("JMChartID"));

                    
                    if (!String.IsNullOrEmpty(Request.QueryString.Get("hdnJurisId")))
                    {
                        objCMSComments.JurisID = KPIHlp.CVI32(Request.QueryString.Get("hdnJurisId"));
                    }
                    
                    DataSet objDS = new DataSet();

                    objDS = new CMSCommentsBL().SelectActiveLog(ref objCMSComments);
                    grdComments.DataSource = objDS;
                    grdComments.DataBind();
                }
               
            }
            catch
            { }
        }


        public string TRJavaScript(Control con)
        {
            string tmp;
            DataListItem dli = con as DataListItem;
            Button btn = dli.FindControl("HiddenButton") as Button;
            string _js = "bgcolor={0} onMouseover='rowcolor=this" +
                         ".style.backgroundColor;this.style.backgroundColor" +
                         "=\"yellow\"; this.style.cursor = \"hand\"' " +
                         "onMouseout='this.style.backgroundColor=rowcolor;' " +
                         " onclick='document.getElementById(\"{1}\").click();' ";
            tmp = bSwitch ? string.Format(_js, color1, btn.ClientID) :
                           string.Format(_js, color2, btn.ClientID);
            bSwitch = !bSwitch;
            return tmp;

        }
    }
}