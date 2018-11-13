<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMedAllergy.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMedAllergy" %>

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

        .grdAllergy_row_color {
            color: gray;
        }
        input[type="checkbox"] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }
        #lupInactivePF_CodeDescription{
            width:98% !important;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmMedAllergy_Id" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

        <table id="Table1" style="padding: 0; border-spacing: 0; width: 100%; height: 100%" border="0">
            <colgroup>
                <col style="width: 5%" />
                <col style="width: 10%" />
                <col style="width: 10%" />
                <col style="width: 10%" />
                <col style="width: 15%" />
                <col style="width: 25%" />
                <col style="width: 20%" />
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
                                <kpicc:KPIImageButton ID="cmdSave" TabIndex="10" Height="20" runat="server" KPITabIndex="840"
                                    KPISecurity="AC" CssClass="menuItem" ImageUrl="/KPIImages/ico/Save_Int.png"
                                    ToolTip="Save This Tab" AlternateText="Save" OnClick="cmdSave_Click"></kpicc:KPIImageButton></td>
                            <td></td>
                            <td style="text-align: left; white-space: nowrap">
                                <kpicc:KPIImageButton ID="cmdReset" TabIndex="11" runat="server" KPIRepositoryID="0" Height="20" ImageUrl="/KPIImages/ico/Reset_Int.png" ToolTip="Reset This Tab" OnClick="cmdReset_Click"
                                    KPITabIndex="841" KPISecurity="ACI" CssClass="menuItem" AlternateText="Reset"></kpicc:KPIImageButton></td>
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
                <td>&nbsp;</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;" class="req">
                    <kpicc:KPILabel ID="lblChartingDateTime" runat="server" Text="Allergy&nbsp;"></kpicc:KPILabel></td>
                <td colspan="2" style="text-align:left">
                    <kpicc:KPICodedDropDownList ID="cddAllergy" runat="server" KPIWidth="0" KPISecurity="AC" KPITabIndex="820" Width="93.6%" KPIDisplayOption="Description" KPICodeID="5150"></kpicc:KPICodedDropDownList>
                </td>
                

                <td style="text-align: right;" class="req">
                    <kpicc:KPILabel ID="lblAlergyDateTime" runat="server" Text="Date/Time&nbsp;"></kpicc:KPILabel></td>
                <td style="text-align: left">
                    <kpicc:KPIDateTime ID="dttmAllergyDate" runat="server" KPISecurity="AC" KPITabIndex="821" KPITimeDisplay="TimeShort" KPIMandatory="True"></kpicc:KPIDateTime>
                </td>
                <td></td>

                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblReactions" runat="server" Text="Reactions&nbsp;"></kpicc:KPILabel></td>
                <td colspan="5" style="text-align:left">
                    <kpicc:KPITextBox ID="txtReactions"  runat="server" KPISecurity="AC" KPITabIndex="822"
                        Width="100%" Height="40px" MaxLength="254" TextMode="MultiLine"></kpicc:KPITextBox></td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;" id="tdNotes" runat="server">
                    <kpicc:KPILabel ID="lblNotes" runat="server" Text="Notes&nbsp;"></kpicc:KPILabel></td>
                <td colspan="5" style="text-align:left">
                    <kpicc:KPITextBox ID="txtNotes" runat="server" KPISecurity="AC" KPITabIndex="823"
                        Width="100%" Height="40px" MaxLength="254" TextMode="MultiLine"></kpicc:KPITextBox></td>

                <td></td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align: right;">
                    <kpicc:KPILabel ID="lblInactive" runat="server" Text="Inactive&nbsp;"></kpicc:KPILabel></td>

                <td colspan="3">
                    <table style="width: 80%; padding: 0; border-spacing: 0; table-layout: fixed; float: left">
                        <colgroup>
                            <col style="width: 10%" />
                            <col style="width: 30%" />
                            <col style="width: 60%" />
                        </colgroup>
                        <tr>
                            <td style="text-align: left; padding: 0; border-spacing: 0">
                                <kpicc:KPICheckBox ID="chkInactive" runat="server" KPISecurity="AC" KPITabIndex="824" Text=""></kpicc:KPICheckBox></td>
                            <td style="text-align: right;">
                                <kpicc:KPILabel ID="lblInactiveDttm" runat="server" Text="Date/Time&nbsp;"></kpicc:KPILabel></td>
                            <td style="text-align: left">
                                <kpicc:KPIDateTime ID="dttmInactiveDate" runat="server" KPISecurity="AC" KPITabIndex="825" KPITimeDisplay="TimeShort" KPIMandatory="True"></kpicc:KPIDateTime>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="padding: 0; border-spacing: 0;text-align:left">
                    <table style="width: 100%; padding: 0; border-spacing: 0">
                        <colgroup>
                            <col style="width: 30%" />
                            <col style="width: 70%" />
                        </colgroup>
                        <tr>
                            <td id="tdInactivePF" runat="server" style="text-align: right"><kpicc:KPILabel ID="lblInactivePF" runat="server" Text="PF&nbsp;"></kpicc:KPILabel></td>
                            <td style="text-align: left; white-space: nowrap"><kpicc:KPICodedLookUp ID="lupInactivePF" runat="server" KPICodeID="110"  KPISecurity="AC" DescFieldWidth="80%" ValueFieldWidth="30%" KPITabIndex="826" KPIClientCallBack="FillLoggedInPF"></kpicc:KPICodedLookUp></td>
                            
                        </tr>
                    </table>

                </td>
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
                                <kpicc:KPIImageButton ID="cmdAdd" runat="server" KPISecurity="AC" KPITabIndex="827" AlternateText="Add" ToolTip="Add" ImageUrl="/KPIImages/ico/AddData_Text.png" CssClass="menuItem"></kpicc:KPIImageButton>
                            </td>

                            <td>&nbsp;</td>
                            <td style="text-align: right;padding:0;border-spacing:0">
                                <kpicc:KPIImageButton ID="cmdClear" runat="server" KPISecurity="ACI" KPITabIndex="828" AlternateText="Clear" ToolTip="Clear" ImageUrl="/KPIImages/ico/ClearData_Text.png" CssClass="menuItem" CausesValidation="False"></kpicc:KPIImageButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td colspan="6">
                    <kpicc:KPIGrid ID="grdAllergy" runat="server" KPIRepositoryID="0" KPISecurity="AC" DataKeyFields="JMMAllergyID" AutoGenerateColumns="false" EnableDataViewState="true"
                        Width="100%" KPIEnableClientSort="true" Height="160px" KPIDefaultJurisAlias="False" OnInitializeRow="grdAllergy_InitializeRow">
                        <ClientEvents Click="grdAllergy_CellClickHandler"></ClientEvents>
                        <Columns>
                            <igtbl:UnboundField Key="KPIDRK" Hidden="true" Header-Text="X"></igtbl:UnboundField>
                            <igtbl:BoundDataField Key="AllergyDesc" Width="20%" DataFieldName="AllergyDesc" Header-Text="Allergy"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="AllergyDttm" Width="20%" DataFieldName="AllergyDttm" Header-Text="Date/Time" DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:BoundDataField>
                            <igtbl:UnboundField Header-Text="Reactions" Key="ReactionsIcon" HtmlEncode="false"  Width="14%"></igtbl:UnboundField>
                            <igtbl:UnboundField Header-Text="Notes" Key="NotesIcon" HtmlEncode="false"  Width="15%"></igtbl:UnboundField>
                            <igtbl:BoundCheckBoxField Key="Isactive" Header-Text="Inactive" Width="16%" DataFieldName="Isactive"></igtbl:BoundCheckBoxField>
                            <%--<igtbl:UnboundField Header-Text="Inactive PF" Key="InactivePF"  Width="15%"></igtbl:UnboundField>--%>
                            
                            <igtbl:BoundDataField Key="InactivePFID" Hidden="true" DataFieldName="InactivePFID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="PFCode" Hidden="true" DataFieldName="PFCode"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="FullName" Header-Text="Inactive PF" DataFieldName="FullName" Width="15%"></igtbl:BoundDataField>


                            <igtbl:BoundDataField Key="JMBookingID" Hidden="true" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="JurisID" Hidden="true" DataFieldName="JurisID"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="JMMAllergyID" Hidden="true" DataFieldName="JMMAllergyID"></igtbl:BoundDataField>
                            <igtbl:UnboundField Key="KPIMode" Hidden="True"></igtbl:UnboundField>
                            <igtbl:BoundDataField Key="Allergy" Hidden="True" DataFieldName="Allergy"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="ReactionNotes" Hidden="true" DataFieldName="ReactionNotes"></igtbl:BoundDataField>
                            <igtbl:BoundDataField Key="Notes" Hidden="true" DataFieldName="Notes"></igtbl:BoundDataField>
                            <igtbl:UnboundField Key="AllergyNotes" Hidden="true" HtmlEncode="false"></igtbl:UnboundField>
                            <igtbl:UnboundField Key="AllergyReactionNotes" Hidden="true" HtmlEncode="false"></igtbl:UnboundField>
                            <igtbl:UnboundField Key="InactiveDttm" Hidden="true" DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:UnboundField>
                            <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMAllergyID"></igtbl:BoundDataField>
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
                <td>&nbsp;</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>


            <tr>
                <td></td>
                <td colspan="6">
                    <input id="hdnScreenId" type="hidden" value="8550" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="" name="hdnMode" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                    <input id="hdnBookingID" type="hidden" name="hdnBookingID" runat="server" />
                    <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                    <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                    <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />
                    <input id="hdnSubAgeMode" type="hidden" name="hdnSubAgeMode" runat="server" />
                    <input id="hdnSetUserPFID" type="hidden" runat="server" name="hdnSetUserPFID" />
                </td>
                <td></td>
            </tr>

        </table>

        <script src="frmMedAllergy.js?v=2017.05.08" type="text/javascript"></script>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2017.05.12" type="text/javascript"></script>
    </form>
</body>
</html>
