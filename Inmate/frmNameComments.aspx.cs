using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using KPI.Global;
using KPI.Global.AppException;
using KPI.Global.Helper;
using KPI.Global.KPIWebControls;
using KPI.Global.StateMachine;

using KPI.Phoenix.Helper;
//using KPI.Phoenix.Global;
using KPI.Phoenix.WebControls;

using Infragistics.WebUI.UltraWebGrid;
using Infragistics.WebUI.UltraWebTab;

using KPI.Framework.Setup;
using KPI.Framework.Object.Setup;

namespace KPI.PhoenixWeb.Inmate
{
	/// <summary>
	/// Summary description for frmNameComments.
	/// </summary>
	public partial class frmNameComments : BasePage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			try
			{
				if( !IsPostBack )
				{
					SetGridHeight();	
				}

				LoadData();
				//Page.RegisterOnSubmitStatement("OnSubmit", "return fn_ValidateScreen();");
                Page.ClientScript.RegisterOnSubmitStatement(Page.GetType(), "OnSubmit", "return fn_ValidateScreen();");//Added by Bujjibabu for Warning
				btnComments.Attributes.Add("onClick","glbCtrlClicked='Save'");  
			}

			catch(Exception objErr)
			{
				ShowMsg(MsgType.Error, FrwkMsg.PAGE_ERR, objErr);  
			}
		}

		protected void LoadData()
		{
			try
			{
				string strhdnMode ="";

				if(!((Request.QueryString.Get("hdnMode") == null)&&(Request.QueryString.Get("hdnMode") == string.Empty)))   
					strhdnMode = Request.QueryString.Get("hdnMode");

				if(strhdnMode != string.Empty && strhdnMode != null)
					hdnMode.Value = strhdnMode;	
				else		
					hdnMode.Value = UIMode.CHG.ToString();
			}
			catch(Exception objError)
			{
				ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL,objError); 
			}

		      
			//strhdnMode = Request.QueryString.Get("hdnMode").Trim();  
			ClearData();
			//Inquiry(Convert.ToInt64(hdnNameId.Value));	
			SetFocus((WebControl)txtSubject);	
		}

		protected void SetGridHeight()
		{
			try
			{
				String strGRDHeight = Request.QueryString.Get("GRDHeight");

				if( strGRDHeight != null && strGRDHeight != String.Empty )
					grdComments.Height = Unit.Pixel(Convert.ToInt32( strGRDHeight, 10 ));
			}
			catch(Exception){} 
		}


		

		protected void grdComments_InitializeLayout(object sender, Infragistics.WebUI.UltraWebGrid.LayoutEventArgs e)
		{
		
		}
	}
}

//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDateTime;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSubject;
//PNX  protected KPI.Global.KPIWebControls.KPIDateChooser dtcCurrDate;
//PNX  protected KPI.Global.KPIWebControls.KPITextBox txtSubject;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdComments;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNameId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnTextId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnJurisID;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblPFNO;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalSave;
//PNX  protected KPI.Global.KPIWebControls.KPIButton cmdInternalRefresh;
//PNX  protected KPI.Global.KPIWebControls.KPILiteral lblErrorMsg;
//PNX  protected KPI.Global.KPIWebControls.KPIButton btnComments;
//PNX  protected KPI.Global.KPIWebControls.KPICodedLookUp lupPFNO;
//PNX  protected System.Web.UI.WebControls.Panel pnlTblInternal;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCaller;
/****PNX*************  
	#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		protected void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
*************PNX****/