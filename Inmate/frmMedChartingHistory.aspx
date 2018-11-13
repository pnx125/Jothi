<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMedChartingHistory.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMedChartingHistory" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="igtab" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="uc1" TagName="usrMedCharting" Src="UserControls/usrMedCharting.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrMedChartingHistory" Src="UserControls/usrMedChartingHistory.ascx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    
<!DOCTYPE HTML>
<html>
<head>
    <title>
        <%=strProductTitle%>
			-
			<%=strPageTitle%>
    </title>
    <link href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../KPIFrameWorkWeb/Scripts/JQuery/JQCSS/jquery-ui-1.10.2.custom.min.css" />
    <%=strDynamicThemes%>
    <script src="../KPIFrameWorkWeb/Scripts/JQuery/JQScript/jquery-1.9.0.min.js?v=2017.01.12" type="text/javascript"></script>
    <script src="../KPIFrameWorkWeb/Scripts/JQuery/JQScript/jquery-ui.js?v=2017.01.12" type="text/javascript"></script>   
</head>
<body class="masterfrm">
    <form id="frmMedChartingHistory_Id" runat="server">
        <%--<asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>--%>

        <asp:ToolkitScriptManager ID="PnxScriptMgr" runat="server">
    </asp:ToolkitScriptManager>
            <table id="Table1"  style="padding: 0; border-spacing: 0; width: 100%; height: 100%">
                <colgroup>
                    <col style="width: 1%;" />
                    <col style="width: 99%;" />
                </colgroup>
                <tr>
                    <td colspan="2" class="status">
                        <table style="width: 50%; padding: 0; border-spacing: 0">
                            <colgroup>
                                <col style="width: 1%" />
                                <col style="width: 1%" />
                                <col style="width: 1%" />
                                <col style="width: 1%" />
                                <col style="width: 1%" />
                                <col style="width: 1%" />
                                <col style="width: 97%" />
                            </colgroup>
                            <tr>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdSave" runat="server" ImageUrl="/KPIImages/ico/16_L_save.gif" ToolTip="Save" AlternateText="Save" KPISecurity="AC" CssClass="menuItem" KPITabIndex="1000" OnClick="cmdSave_Click"></kpicc:KPIImageButton></td>
                                <td></td>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdSaveNClose" runat="server" ImageUrl="/KPIImages/ico/16_saveClose.gif" ToolTip="Save &amp; Close" AlternateText="Save &amp; Close" KPISecurity="AC" CssClass="menuItem" KPITabIndex="1001" OnClick="cmdSaveNClose_Click"></kpicc:KPIImageButton></td>
                                <td></td>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdPrint" runat="server" ImageUrl="/KPIImages/ico/16_print.gif" ToolTip="Print" AlternateText="Print" KPISecurity="ACI" CssClass="menuItem" KPITabIndex="1003" CausesValidation="False" OnClick="cmdPrint_Click"></kpicc:KPIImageButton></td>
                                <td></td>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdRefresh" runat="server" ImageUrl="/KPIImages/ico/16_L_refresh.gif" ToolTip="Reset" AlternateText="Reset" KPISecurity="ACI" CssClass="menuItem" KPITabIndex="1004" CausesValidation="False" OnClick="cmdRefresh_Click"></kpicc:KPIImageButton></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        
                        
                        
                    </td>
                </tr>
                <tr style="vertical-align: top">
                    <td colspan="2" style="vertical-align: top">
                        <table style="width: 100%; padding: 0; border-spacing: 0; vertical-align: top">
                            <colgroup>
                                <col style="width: 1%" />
                                <col style="width: 98%" />
                                <col style="width: 1%" />
                            </colgroup>
                            <tr>
                                <td colspan="3"></td>
                            </tr>
                            <tr style="vertical-align: top">
                                <td>&nbsp;</td>
                                <td style="vertical-align: top">

                                    <kpicc:KPITab ID="tabMedCharting" TabIndex="500" runat="server" Width="100%" KPIRepositoryID="0" BackColor="Transparent" Height="510px" TabsOverflow="KeepSize">
                                        <Tabs>
                                            <igtab:contenttabitem key="Chart" Text="Chart">
                                                <Template><uc1:usrMedCharting ID="usrMedCharting" runat="server"></uc1:usrMedCharting></Template>
                                            </igtab:contenttabitem>
                                            <igtab:contenttabitem key="ChartingLog" text="Charting Log">
                                                <Template><uc1:usrMedChartingHistory ID="usrMedChartingHistory" runat="server"></uc1:usrMedChartingHistory></Template>
                                            </igtab:contenttabitem>                                           
                                        </Tabs>
                                    </kpicc:KPITab>
                                    
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="statusBar" style="width: 100%; vertical-align: bottom" colspan="2">
                        <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral>
                        <input id="hdnScreenId" type="hidden" value="8545" name="hdnScreenId" runat="server" />
                        <input id="hdnMode" type="hidden" value="" name="hdnMode" runat="server" />
                        <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                    </td>
                </tr>
            </table>
        <script src="../KPIFrameWorkWeb/Scripts/Date.js?v=2018.07.17" type="text/javascript"></script>
        <script src="frmMedChartingHistory.js?v=2018.07.17" type="text/javascript"></script>
    </form>
</body>
</html>
