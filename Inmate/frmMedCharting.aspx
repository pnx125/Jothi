<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMedCharting.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMedCharting" %>

<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
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

    <style>
        .NotificationRules {
            background-image: url('/KPIImages/ico/Notification.gif') !important;
            background: url('/KPIImages/ico/Notification.gif') no-repeat;
            background-repeat: no-repeat !important;
        }
        #lupPF_CodeDescription{
            width:98% !important;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmMedCharting_Id" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table id="Table1" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;height:100%" border="0">
            <colgroup>
                <col style="width: 5%" />
                <col style="width: 10%" />
                <col style="width: 25%" />
                <col style="width: 55%" />
                <col style="width: 5%" />
            </colgroup>

            <tr>
                <td colspan="5" class="status">

                    <table style="width: 100%; padding: 0; border-spacing: 0">
                        <colgroup>
                            <col style="width: 1%" />
                            <col style="width: 1%" />
                            <col style="width: 1%" />
                            <col style="width: 1%" />
                            <col style="width: 98%" />
                        </colgroup>
                        <tr>
                            <td style="text-align: left; white-space: nowrap">
                                <kpicc:KPIImageButton ID="cmdSave" TabIndex="10" Height="20" runat="server" KPITabIndex="830"
                                    KPISecurity="AC" CssClass="menuItem" ImageUrl="/KPIImages/ico/Save_Int.png"
                                    ToolTip="Save This Tab" AlternateText="Save" OnClick="cmdSave_Click"></kpicc:KPIImageButton></td>
                            <td></td>
                            <td style="text-align: left; white-space: nowrap">
                                <kpicc:KPIImageButton ID="cmdReset" TabIndex="11" runat="server" KPIRepositoryID="0" Height="20" ImageUrl="/KPIImages/ico/Reset_Int.png" ToolTip="Reset This Tab" OnClick="cmdReset_Click"
                                    KPITabIndex="831" KPISecurity="ACI" CssClass="menuItem" AlternateText="Reset"></kpicc:KPIImageButton></td>
                            <td>&nbsp;</td>
                            <td style="text-align: left; white-space: nowrap">
                                <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral></td>
                        </tr>
                    </table>



                </td>
            </tr>
            <tr>
                <td colspan="5" style="height: 5px;"></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblChartingDateTime" runat="server" Text="Date/Time&nbsp;"></kpicc:KPILabel>
                </td>
                <td>
                    <kpicc:KPIDateTime ID="dttmChartingDate" runat="server" KPISecurity="AC" KPITabIndex="501" KPITimeDisplay="TimeShort" KPIMandatory="True"></kpicc:KPIDateTime>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblPF" runat="server" Text="By&nbsp;"></kpicc:KPILabel>
                </td>
                <td style="text-align: left; white-space: nowrap">
                    <kpicc:KPICodedLookUp ID="lupPF" runat="server" KPICodeID="110" KPISecurity="AC" DescFieldWidth="70%" ValueFieldWidth="30%" KPITabIndex="502" KPIClientCallBack="FillLoggedInPF"></kpicc:KPICodedLookUp>
                </td>
                <td></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblReason" runat="server" Text="Reason&nbsp;"></kpicc:KPILabel>
                </td>
                <td>
                    <kpicc:KPICodedDropDownList ID="cddReason" runat="server" KPIWidth="0" KPISecurity="AC" KPITabIndex="510" Width="93.6%" KPIDisplayOption="Description" KPICodeID="3175"></kpicc:KPICodedDropDownList>
                </td>
                <td></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>

                    <input id="hdnScreenId" type="hidden" value="8546" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnStatus" type="hidden" name="hdnStatus" runat="server" />
                    <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                    <input id="hdntab" type="hidden" name="hdntab" runat="server" />
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
                    <input id="hdnSetUserPFID" type="hidden" runat="server" name="hdnSetUserPFID" />

                </td>
                <td style="float: right;padding:0;border-spacing:0">
                    <table style="float:right;padding: 0; border-spacing: 0; width: 50%;">
                        <colgroup>
                            <col style="width: 51%" />
                            <col style="width: 23%" />
                            <col style="width: 3%" />
                            <col style="width: 23%" />
                        </colgroup>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="text-align: right">
                                <kpicc:KPIImageButton ID="cmdAdd" runat="server" KPISecurity="AC" KPITabIndex="512" AlternateText="Add" ToolTip="Add" ImageUrl="/KPIImages/ico/AddData_Text.png" CssClass="menuItem"></kpicc:KPIImageButton>
                            </td>

                            <td>&nbsp;</td>
                            <td style="text-align: right;">
                                <kpicc:KPIImageButton ID="cmdClear" runat="server" KPISecurity="ACI" KPITabIndex="513" AlternateText="Clear" ToolTip="Clear" ImageUrl="/KPIImages/ico/ClearData_Text.png" CssClass="menuItem" CausesValidation="False"></kpicc:KPIImageButton>
                            </td>
                        </tr>
                    </table>
                </td>

                <td>&nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3" style="vertical-align:top">
                    
                        <kpicc:KPIGrid ID="grdChartDetails" runat="server" KPIRepositoryID="0" KPISecurity="AC" DataKeyFields="JMChartID" AutoGenerateColumns="false" EnableDataViewState="true"
                            Width="100%" useaccessibleheader="False" Height="220px" KPIDefaultJurisAlias="False" OnInitializeRow="grdChartDetails_InitializeRow">
                            <ClientEvents Click="grdChartDetails_CellClickHandler"></ClientEvents>
                            <Columns>
                                <igtbl:UnboundField Key="KPIDRK" Width="4%">
                                    <Header Text="X" />
                                </igtbl:UnboundField>
                                <igtbl:BoundDataField Key="Dttm" Width="20%" DataFieldName="ChartingDttm" DataFormatString="{0:MM/dd/yyyy HH:mm}">
                                    <Header Text="Date/Time" />
                                </igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PF" Width="41%" DataFieldName="FullName">
                                    <Header Text="By" />
                                </igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="ReasonCode" Width="30%" DataFieldName="ReasonCode" Hidden="true">
                                    <Header Text="OfficerCode" />
                                </igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Reason" Width="30%" DataFieldName="Reason">
                                    <Header Text="Reason" />
                                </igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMBookingID" Hidden="true" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JurisID" Hidden="true" DataFieldName="JurisID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMMedicalHistID" Hidden="true" DataFieldName="JMMedicalHistID"></igtbl:BoundDataField>
                                <igtbl:UnboundField Key="KPIMode" Hidden="True">
                                    <Header />
                                </igtbl:UnboundField>
                                <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMChartID">
                                    <Header />
                                </igtbl:BoundDataField>
                                <igtbl:UnboundField Key="GeneratedID" Hidden="True">
                                    <Header />
                                </igtbl:UnboundField>
                                <igtbl:UnboundField Header-Text="C" Key="C" Width="5%">
                                    <Header Text="C" />
                                </igtbl:UnboundField>

                                <igtbl:BoundDataField Key="PFCode" Width="30%" DataFieldName="PFCode" Hidden="true">
                                    <Header Text="PFCode" />
                                </igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PFID" Width="30%" DataFieldName="OfficerID" Hidden="true">
                                    <Header Text="PFID" />
                                </igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMChartID" Hidden="True" DataFieldName="JMChartID"></igtbl:BoundDataField>
                            </Columns>
                            <Behaviors>
                                <igtbl:Activation Enabled="true"></igtbl:Activation>
                                <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                                <igtbl:EditingCore AutoCRUD="False" Enabled="true" BatchUpdating="true">
                                    <Behaviors>
                                        <igtbl:CellEditing Enabled="false">
                                        </igtbl:CellEditing>
                                    </Behaviors>
                                </igtbl:EditingCore>
                            </Behaviors>
                        </kpicc:KPIGrid>
                    
                </td>

                <td>&nbsp;</td>
            </tr>
            <tr style="vertical-align: bottom" id="tdstatusbar" runat="server">
                <td colspan="5" class="statusBar"></td>
            </tr>
        </table>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2017.02.02" type="text/javascript"></script>
        <script src="frmMedCharting.js?v=2017.05.12" type="text/javascript"></script>
    </form>
</body>
</html>
