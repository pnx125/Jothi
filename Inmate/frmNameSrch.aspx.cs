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

using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Global.AppException;
using KPI.Global;
using KPI.Global.KPIWebControls;

using KPI.Framework.Object.Setup;    
using KPI.Framework.Setup;  

//using KPI.Phoenix.Global;
using KPI.Phoenix.Helper;
using KPI.Phoenix.WebControls;

//using KPI.PhoenixWeb.Names.UserControls;

using Infragistics.WebUI.UltraWebTab;  
using Infragistics.WebUI.UltraWebGrid;

namespace KPI.PhoenixWeb.Inmate
{
	/// <summary>
	/// Summary description for frmNameSrch.
	/// </summary>
	public partial class frmNameSrch : BasePage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			DisplayGrid(false);
		}

		

		protected void DisplayGrid(bool blnSrchRslt)
		{
		  
			pnlSearch.Visible = (!blnSrchRslt);
			lblDetails.Visible = blnSrchRslt;
			lblAddress.Visible = blnSrchRslt; 
			lblSSNo.Visible = blnSrchRslt;
			
			lblPhoneType1.Visible = blnSrchRslt;	
			lblType.Visible = blnSrchRslt; 
			lblPhoneNo1.Visible = blnSrchRslt;
			pnlSearchResults.Visible = blnSrchRslt;			
		
			tlbGridItem.Items.FromKeyButton("Back").Enabled = blnSrchRslt;	
			tlbGridItem.Items.FromKeyButton("Search").Enabled = (!blnSrchRslt);	
			tlbGridItem.Items.FromKeyButton("Reset").Enabled = (!blnSrchRslt);
		}

		protected void tlbGridItem_ButtonClicked(object sender, Infragistics.WebUI.UltraWebToolbar.ButtonEvent be)
		{
			switch (be.Button.Key.ToUpper())
			{
				case "BACK" :
					cmdBkSearch_Click();
				break;

				case "SEARCH" :	
					cmdSearch_click();		
				break;

				case "RESET":
					ClearData();
					break;
			}
		}

		protected void cmdSearch_click()
		{
		
		}

		protected void cmdBkSearch_Click()
		{
			pnlSearch.Visible = true;
			pnlSearchResults.Visible = false;
			hdnBack.Value = "BACK";	
			
			tlbGridItem.Items.FromKeyButton("Back").Enabled = false;	
			tlbGridItem.Items.FromKeyButton("Search").Enabled = true;	
			tlbGridItem.Items.FromKeyButton("Reset").Enabled = true;
			// Commented padma on 21stjune-06// Fr track# 3250 -- Inquiry screens - get search results then go back & it clears the field
			//ClearData();
			NameReportList.Clear();
			chkRptSelect.Visible = false;
			grdNames.Columns.FromKey("RptListSelect").Hidden = true;
					
		}

	}
}

//PNX  protected KPI.Global.KPIWebControls.KPICheckBox chkRptSelect;
//PNX  protected KPI.Phoenix.WebControls.KPIReportList NameReportList;
//PNX  protected KPI.Global.KPIWebControls.KPIImageButton cmdNameMine;
//PNX  protected KPI.Global.KPIWebControls.KPIToolbar tlbGridItem;
//PNX  protected KPI.Global.KPIWebControls.KPIPanel pnlSearch;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblDetails;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblSSNo;
//PNX  protected KPI.Global.KPIWebControls.KPIMaskEdit mskSSno;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblAddress;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblPhoneType1;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblType;
//PNX  protected KPI.Global.KPIWebControls.KPILabel lblPhoneNo1;
//PNX  protected KPI.Global.KPIWebControls.KPIGrid grdNames;
//PNX  protected KPI.Global.KPIWebControls.KPIPanel pnlSearchResults;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNameType;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnScreenId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCaller;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnReportID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnIncidentID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCtrlName;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnChkSearch;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAutoLoad;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden rptHidden;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNewFirstName;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnSrchCount;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnAssocNameID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnNewLastName;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnMode;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnJurisId;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCopyNameID;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnCopyNameType;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnBack;
//PNX  protected KPI.Global.KPIWebControls.KPITab tabNameSrch;
//PNX  protected System.Web.UI.HtmlControls.HtmlInputHidden hdnIsRptColVisible;
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
			this.tlbGridItem.ButtonClicked += new Infragistics.WebUI.UltraWebToolbar.UltraWebToolbar.ButtonClickedEventHandler(this.tlbGridItem_ButtonClicked);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
*************PNX****/