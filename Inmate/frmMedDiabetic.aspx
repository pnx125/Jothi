<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMedDiabetic.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMedDiabetic" %>

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
        .CmtNotes {
            background-image: url('/KPIImages/ico/text_icon.gif') !important;
            background-repeat: no-repeat !important;
        }

        input[type="checkbox"] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }
        #lupPF_CodeDescription{
            width:98% !important;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmMedDiabetic_Id" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

        <table id="Table1" style="padding: 0; border-spacing: 0; width: 100%; height: 100%" border="0">
            <colgroup>
                <col style="width: 5%" />
                <col style="width: 15%" />
                <col style="width: 10%" />
                <col style="width: 10%" />
                <col style="width: 20%" />
                <col style="width: 20%" />
                <col style="width: 15%" />
                <col style="width: 5%" />
            </colgroup>
            <tr>
                <td colspan="8" class="status">

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
                                <kpicc:KPIImageButton ID="cmdSave" TabIndex="10" Height="20" runat="server" KPITabIndex="870"
                                    KPISecurity="AC" CssClass="menuItem" ImageUrl="/KPIImages/ico/Save_Int.png"
                                    ToolTip="Save This Tab" AlternateText="Save" OnClick="cmdSave_Click"></kpicc:KPIImageButton></td>
                            <td></td>
                            <td style="text-align: left; white-space: nowrap">
                                <kpicc:KPIImageButton ID="cmdReset" TabIndex="11" runat="server" KPIRepositoryID="0" Height="20" ImageUrl="/KPIImages/ico/Reset_Int.png" ToolTip="Reset This Tab" OnClick="cmdReset_Click"
                                    KPITabIndex="871" KPISecurity="ACI" CssClass="menuItem" AlternateText="Reset"></kpicc:KPIImageButton></td>
                            <td>&nbsp;</td>
                            <td style="text-align: left; white-space: nowrap">
                                <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral></td>
                        </tr>
                    </table>
                </td>
            </tr>
               <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>&nbsp;</td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;" class="req">
                    <kpicc:KPILabel ID="lblTestType" runat="server" Text="Test Type&nbsp;"></kpicc:KPILabel></td>
                <td colspan="2" style="text-align:left">
                    <kpicc:KPICodedDropDownList ID="cddTestType" runat="server" KPIWidth="0" KPISecurity="AC" KPITabIndex="840" Width="93.6%" KPIDisplayOption="Description" KPICodeID="5151"></kpicc:KPICodedDropDownList>
                </td>
                
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblGlucoseReading" runat="server" Text="Glucose Reading&nbsp;"></kpicc:KPILabel></td>
                <td style="text-align: left">
                    <kpicc:KPITextBox ID="txtGlucoseReading" runat="server" KPISecurity="AC" MaxLength="5" KPITabIndex="841" Width="75px" onkeypress="return isNumberKey(event,this)" onkeydown="return AlphabetValidation(this,'rt',event)"></kpicc:KPITextBox>
                </td>


                <td></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblAdministered" runat="server" Text="Administered By&nbsp;"></kpicc:KPILabel></td>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right;" class="req">
                    <kpicc:KPILabel ID="lblPFName" runat="server" Text="PF# / Name&nbsp;"></kpicc:KPILabel></td>
                <td colspan="2" style="text-align:left;white-space:nowrap">
                    <kpicc:KPICodedLookUp ID="lupPF" runat="server" KPICodeID="110" Width="70%" KPISecurity="AC" DescFieldWidth="80%" ValueFieldWidth="30%" KPITabIndex="842" KPIClientCallBack="FillLoggedInPF"></kpicc:KPICodedLookUp>
                </td>
                
                <td style="text-align:right"><kpicc:KPICheckBox ID="chkInmateAdministered" runat="server" KPISecurity="AC" KPITabIndex="843" Text="&nbsp;Inmate Administered" TextAlign="Right"></kpicc:KPICheckBox></td>
                <td style="text-align: right;" class="req">
                    <kpicc:KPILabel ID="lblDateTime" runat="server" Text="Date/Time&nbsp;"></kpicc:KPILabel></td>
                <td style="text-align: left">
                    <kpicc:KPIDateTime ID="dttmDateTime" runat="server" KPISecurity="AC" KPITabIndex="844" KPITimeDisplay="TimeShort" KPIMandatory="True"></kpicc:KPIDateTime>
                </td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblActions" runat="server" Text="Actions Taken&nbsp;"></kpicc:KPILabel></td>
                <td colspan="5">
                    <kpicc:KPITextBox ID="txtActions" runat="server" KPISecurity="AC" KPITabIndex="845"
                        Width="100%" Height="40px" MaxLength="250" TextMode="MultiLine"></kpicc:KPITextBox></td>

                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="float: right;padding:0;border-spacing:0">
                    <table style="padding: 0; border-spacing: 0; width: 50%; float: right">
                        <colgroup>
                            <col style="width: 51%" />
                            <col style="width: 23%" />
                            <col style="width: 3%" />
                            <col style="width: 23%" />
                        </colgroup>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="text-align: right">
                                <kpicc:KPIImageButton ID="cmdAdd" runat="server" KPISecurity="AC" KPITabIndex="846" AlternateText="Add" ToolTip="Add" ImageUrl="/KPIImages/ico/AddData_Text.png" CssClass="menuItem"></kpicc:KPIImageButton>
                            </td>

                            <td>&nbsp;</td>
                            <td style="text-align: right;padding:0;border-spacing:0">
                                <kpicc:KPIImageButton ID="cmdClear" runat="server" KPISecurity="ACI" KPITabIndex="847" AlternateText="Clear" ToolTip="Clear" ImageUrl="/KPIImages/ico/ClearData_Text.png" CssClass="menuItem" CausesValidation="False"></kpicc:KPIImageButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td colspan="6" style="vertical-align:top">
                    <kpicc:KPIGrid ID="grdDiabetic" runat="server" KPIRepositoryID="0" KPISecurity="AC" DataKeyFields="JMMDiabeticID" AutoGenerateColumns="false" EnableDataViewState="true"
                        Width="100%"  KPIEnableClientSort="true" Height="160px" KPIDefaultJurisAlias="False" OnInitializeRow="grdDiabetic_InitializeRow">
                        <ClientEvents Click="grdDiabetic_CellClickHandler"></ClientEvents>
                        <Columns>
                            <igtbl:UnboundField Key="KPIDRK" Hidden="true" Header-Text="X"></igtbl:UnboundField>
                            <igtbl:BoundDataField Key="AdministeredDttm" Width="16%" DataFieldName="AdministeredDttm" DataFormatString="{0:MM/dd/yyyy HH:mm}" Header-Text="Date/Time"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="TestTypeDesc" Width="15%" DataFieldName="TestTypeDesc" Header-Text="Test Type"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="FullName" Width="23%" DataFieldName="FullName" Header-Text="PF#"></igtbl:BoundDataField>
                            <igtbl:BoundCheckBoxField Key="IsAdministered" Header-Text="Inmate Administered" Width="18%" DataFieldName="IsAdministered"></igtbl:BoundCheckBoxField>
                            <igtbl:BoundDataField Key="GlucoseReading" Width="13%" DataFieldName="GlucoseReading" Header-Text="Reading"></igtbl:BoundDataField>
                            <igtbl:UnboundField Header-Text="Actions Taken" HtmlEncode="false" Key="C" Width="15%"></igtbl:UnboundField>


                            <igtbl:BoundDataField Key="JMMDiabeticID" Hidden="true" DataFieldName="JMMDiabeticID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="JurisID" Hidden="true" DataFieldName="JurisID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="JMBookingID" Hidden="true" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="PFCode" DataFieldName="PFCode" Hidden="true"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="AdministeredPFID" DataFieldName="AdministeredPFID" Hidden="true"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="Isactive" Hidden="True" DataFieldName="Isactive"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="Inactivedttm" Hidden="True" DataFieldName="Inactivedttm"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="TestType" Hidden="True" DataFieldName="TestType"></igtbl:BoundDataField>
                            <igtbl:UnboundField Key="KPIMode" Hidden="True"></igtbl:UnboundField>
                            <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMDiabeticID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="ActionNotes" Hidden="True" DataFieldName="ActionNotes"></igtbl:BoundDataField>
                            <igtbl:UnboundField Key="DiabeticNotes" Hidden="True" HtmlEncode="false"></igtbl:UnboundField>
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
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>&nbsp;</td>
                <td></td>
            </tr>

            <tr>
                <td></td>

                <td colspan="6">
                    <input id="hdnScreenId" type="hidden" value="8548" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="" name="hdnMode" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                    <input id="hdnSetUserPFID" type="hidden" name="hdnSetUserPFID" runat="server" />
                    <input id="hdnBookingID" type="hidden" name="hdnBookingID" runat="server" />
                    <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                    <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                    <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />
                    <input id="hdnSubAgeMode" type="hidden" name="hdnSubAgeMode" runat="server" />
                    
                </td>
                <td></td>
            </tr>

        </table>

        <script src="frmMedDiabetic.js?v=2017.02.02" type="text/javascript"></script>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2017.02.16" type="text/javascript"></script>
    </form>
</body>
</html>
