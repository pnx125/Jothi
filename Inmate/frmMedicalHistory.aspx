<%@ Page Language="c#" CodeFile="frmMedicalHistory.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicalHistory" %>

<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="igtab" %>
<%@ Register TagPrefix="uc1" TagName="usrMedicationHistorySupply" Src="UserControls/usrMedicationHistorySupply.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrMedicalMain" Src="UserControls/usrMedicalMain.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrDental" Src="UserControls/usrDental.ascx" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>
        <%=strProductTitle%>
			-
			<%=strPageTitle%>
    </title>
    <link href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet" />
    <%=strDynamicThemes%>
    <style type="text/css">
        .GrayColor {
            color: gray;
        }

        .BlackColor {
            color: black;
        }

        .CustRules {
            background-image: url('/KPIImages/ico/text_icon.gif') !important;
            background: url('/KPIImages/ico/text_icon.gif') no-repeat;
            background-repeat: no-repeat !important;
        }
        #tabMain_tmpl0_UsrMedicalMain1_lupPrimaryDoctor_CodeDescription, #tabMain_tmpl4_UsrDental1_lupPrimaryDentist_CodeDescription {
            display: none;
        }
     
        .NotificationRules {
            background-image: url('/KPIImages/ico/Notification.gif') !important;
            background: url('/KPIImages/ico/Notification.gif') no-repeat;
            background-repeat: no-repeat !important;
        }

        .TabRed {
            color: red !important;
        }

        .TabBlack {
            color: black !important;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmMedicalHistory_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <div class="tab" id="tab0" style="display: inline">
            <table class="layout" id="Table1" style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 1%" />
                    <col style="width: 8%" />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                    <col style="width: 40%" />
                    <col style="width: 19%" />
                    <col style="width: 12%" />
                </colgroup>
                <tbody>
                    <tr>
                        <td class="status" colspan="7">
                            <table style="border-spacing: 0.4em">
                                <tr style="vertical-align: middle">
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
                                    <td style="width: 100%">
                                        <phnxcc:JailQuickMenuCtrl ID="JailQuickMenuCtrl1" runat="server" KPIJailQuickMenuScreen="Medical" KPISecurity="N" KPIDisabled="Medical"></phnxcc:JailQuickMenuCtrl>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                
                    <tr>
                        <td style="width: 100%; text-align: left" colspan="7">
                            <phnxcc:JailSPINHeaderCtrl ID="HeaderCtrl" runat="server" KPIClientCallBack="reloadCurScreen"></phnxcc:JailSPINHeaderCtrl>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; text-align: left" colspan="7">
                            <table style="width: 100%; padding: 0; border-spacing: 0">
                                <colgroup>
                                    <col style="width: 1%" />
                                    <col style="width: 98%" />
                                    <col style="width: 1%" />
                                </colgroup>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <kpicc:KPITab ID="tabMain" runat="server" KPISecurity="A" Width="100%" Height="450px" BackColor="#EFEFEB" TabsOverflow="KeepSize">
                                            <ClientEvents SelectedIndexChanged="fn_AfterSelectedTab"></ClientEvents>

                                            <Tabs>

                                                <igtab:ContentTabItem Key="Main" Text="Main">

                                                    <Template>
                                                        <uc1:usrMedicalMain ID="UsrMedicalMain1" runat="server"></uc1:usrMedicalMain>
                                                    </Template>
                                                </igtab:ContentTabItem>

                                                 <igtab:ContentTabItem Key="Charting" Text="Charting">

                                                    <Template>
                                                      
                                                    </Template>
                                                </igtab:ContentTabItem>

                                                <igtab:ContentTabItem Key="MHS" Text="Medication History/Supply" Hidden="true">
                                                    <Template>
                                                        <uc1:usrMedicationHistorySupply ID="usrMedicationHistorySupply" runat="server"></uc1:usrMedicationHistorySupply>
                                                    </Template>
                                                </igtab:ContentTabItem>

                                                <igtab:ContentTabItem Key="Scheduled Appts" Text="Medical Appointments">

                                                    <Template>
                                                    </Template>
                                                </igtab:ContentTabItem>

                                                <igtab:ContentTabItem Key="Dental" Text="Dental">

                                                    <Template>
                                                        <uc1:usrDental ID="UsrDental1" runat="server"></uc1:usrDental>
                                                    </Template>
                                                </igtab:ContentTabItem>

                                                <igtab:ContentTabItem Key="MedicalVital" Text="Vitals">
                                                    <Template></Template>
                                                </igtab:ContentTabItem>

                                                 <igtab:ContentTabItem Key="MedicalAllergy" Text="Allergy">
                                                    <Template></Template>
                                                </igtab:ContentTabItem>

                                                 <igtab:ContentTabItem Key="MedicalDiabetic" Text="Diabetic">
                                                    <Template></Template>
                                                </igtab:ContentTabItem>

                                                <igtab:ContentTabItem Key="ATT" Text="Attachment">
                                                    <Template>
                                                    </Template>
                                                </igtab:ContentTabItem>
                                            </Tabs>
                                        </kpicc:KPITab>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="width: 100%">
                            <input id="hdnScreenId" type="hidden" value="8530" name="hdnScreenId" runat="server" />
                            <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                            <input id="hdnCheck" type="hidden" name="hdnCheck" runat="server" />
                            <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                            <input id="hdnTab" type="hidden" name="hdnTab" runat="server" />
                            <input id="hdnBookingID" type="hidden" runat="server" name="hdnBookingID" />
                            <input id="hdnJMMedicalHistID" type="hidden" runat="server" name="hdnJMMedicalHistID" />
                            <input id="hdnSPINNbr" type="hidden" runat="server" />
                            <input id="hdnSave" type="hidden" runat="server" />
                            <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />
                            <input id="hdnMedHistID" type="hidden" name="hdnMedHistID" runat="server" />
                            <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                            <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                            <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />
                            <input id="hdnSubAgeMode" type="hidden" name="hdnSubAgeMode" runat="server" />
                            <input id="hdnTabAllergy" type="hidden" name="hdnTabAllergy" runat="server" />
                            <input id="hdnAttAssocType" type="hidden" name="hdnAttAssocType" runat="server" value="3" />
                        </td>
                    </tr>
                    <tr>
                        <td class="statusBar" style="width: 100%" colspan="7">
                            <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.10.01" type="text/javascript"></script>
        <script src="frmMedicalHistory.js?v=2018.10.01" type="text/javascript"></script>
    </form>
</body>
</html>