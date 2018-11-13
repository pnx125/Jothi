<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMedVitals.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMedVitals" %>

<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="igtbl" Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" %>
<!DOCTYPE html>

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
        input[type="radio"] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }

        .VitalNotes {
            background-image: url('/KPIImages/ico/text_icon.gif') !important;
            background-repeat: no-repeat !important;
        }
        #lupPFNbr_CodeDescription{
            width:98% !important;
        }
    </style>

</head>
<body class="masterfrm">
    <form id="frmMedVitals_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        


            <table style="width: 100%; padding: 0; border-spacing: 0; text-align: left; height: 100% !important;">
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 17%;" />
                    <col style="width: 7%;" />
                    <col style="width: 20%;" />
                    <col style="width: 7%;" />
                    <col style="width: 29%;" />
                    <col style="width: 5%;" />
                    <col style="width: 10%" />

                </colgroup>


                <tr>

                    <td class="status" id="IdColumnSave" style="text-align: left" colspan="8">
                        <table style="width: 100%; padding: 0; border-spacing: 0">
                            <colgroup>
                                <col style="width: 2%" />
                                <col style="width: 1%" />
                                <col style="width: 2%" />
                                <col style="width: 1%" />
                                <col style="width: 94%" />
                            </colgroup>
                            <tr>

                                <td style="text-align: left; white-space: nowrap">
                                    <kpicc:KPIImageButton ID="cmdSave" TabIndex="10" Height="20" runat="server" KPITabIndex="835"
                                        KPISecurity="AC" CssClass="menuItem" ImageUrl="/KPIImages/ico/Save_Int.png"
                                        ToolTip="Save This Tab" AlternateText="Save" OnClick="cmdSave_Click"></kpicc:KPIImageButton></td>
                                <td></td>
                                <td style="text-align: left; white-space: nowrap">
                                    <kpicc:KPIImageButton ID="cmdReset" TabIndex="11" runat="server" KPIRepositoryID="0"
                                        Height="20" ImageUrl="/KPIImages/ico/Reset_Int.png" ToolTip="Reset This Tab" OnClick="cmdReset_Click"
                                        KPITabIndex="836" KPISecurity="ACI" CssClass="menuItem" AlternateText="Reset"></kpicc:KPIImageButton></td>
                                <td>&nbsp;</td>
                                <td style="text-align: left; white-space: nowrap">
                                    <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral>
                                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                                    <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                                    <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                                    <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />
                                    <input id="hdnScreenId" type="hidden" value="8543" name="hdnScreenId" runat="server" />
                                    <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                                    <input id="hdnBookingID" type="hidden" runat="server" name="hdnBookingID" />
                                    <input id="hdnJMMedicalHistID" type="hidden" runat="server" name="hdnJMMedicalHistID" />
                                    <input id="hdnStatus" type="hidden" runat="server" name="hdnStatus" />
                                    <input id="hdnSetUserPFID" type="hidden" runat="server" name="hdnSetUserPFID" />
                                </td>

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
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblHeight" runat="server" Font-Bold="true" Text="Height&nbsp;"></kpicc:KPILabel></td>
                    <td>
                        <kpicc:KPITextBox ID="txtHeight" runat="server" Width="100%" KPISecurity="AC" KPITabIndex="802" CssClass="textbox" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox></td>

                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblWeight" runat="server" Font-Bold="true" Text="Weight&nbsp;"></kpicc:KPILabel></td>
                    
                    <td style="text-align: left; white-space: nowrap" colspan="2">
                        <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed">
                            <colgroup>
                                <col style="width: 10%" />
                                <col style="width: 1%" />
                                <col style="width: 29%" />
                                <col style="width: 15%" />
                                <col style="width: 30%" />
                            </colgroup>
                            <tr>
                                <td style="text-align:left;padding:0;border-spacing:0"><kpicc:KPITextBox ID="txtWeight" runat="server" Width="100%" KPISecurity="AC" KPITabIndex="803" CssClass="textbox" MaxLength="6" onkeypress="return isNumberKey(event,this)" onkeydown="return AlphabetValidation(this,'rt',event)"></kpicc:KPITextBox></td>
                                <td>&nbsp;</td>
                                <td style="text-align: left">
                                    
                                        <kpicc:KPIRadioList ID="RadLstWeight" runat="server" KPITabIndex="804" KPISecurity="AC" RepeatDirection="Horizontal" RepeatColumns="5" RepeatLayout="Table" Width="100%">
                                            <asp:ListItem Value="1" Text=" LBS"></asp:ListItem>
                                            <asp:ListItem Value="2" Text=" KG" />
                                        </kpicc:KPIRadioList>
                                    
                                </td>
                                <td>&nbsp;</td>
                                <td style="text-align: left">
                                    
                                        <kpicc:KPIRadioList ID="RadLstWeightStatus" runat="server" KPITabIndex="805" KPISecurity="AC" RepeatDirection="Horizontal" RepeatColumns="5" RepeatLayout="Table" Width="100%">
                                            <asp:ListItem Value="1" Text=" Actual" />
                                            <asp:ListItem Value="2" Text=" Stated" />
                                        </kpicc:KPIRadioList>
                                    
                                </td>
                            </tr>
                        </table>
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
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblRespiration" runat="server" Font-Bold="true" Text="Respiration&nbsp;"></kpicc:KPILabel></td>
                    <td>
                        <kpicc:KPITextBox ID="txtRespiration" runat="server" Width="100%" KPISecurity="AC" KPITabIndex="806" CssClass="textbox" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox></td>

                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblSpox" runat="server" Font-Bold="true" Text="SPOX&nbsp;"></kpicc:KPILabel></td>
                    <td colspan="2" style="text-align: left;">
                        <table style="width: 60%; padding: 0; border-spacing: 0; table-layout: fixed; text-align: left">
                            <colgroup>
                                <col style="width: 50%; text-align: left" />
                                <col style="width: 50%; text-align: left" />
                            </colgroup>
                            <tr>
                                <td style="white-space: nowrap; text-align: left">
                                    <kpicc:KPILabel ID="lblRest" runat="server" Text="At Rest " AssociatedControlID="txtRest">
                        <kpicc:KPITextBox ID="txtRest"  runat="server" Width="30%" KPISecurity="AC" KPITabIndex="807" CssClass="textbox" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>&nbsp;%</kpicc:KPILabel>
                                </td>
                                <td style="white-space: nowrap; text-align: left">
                                    <kpicc:KPILabel ID="lblActivity" runat="server" AssociatedControlID="txtActivity" Text="After Activity ">
                            <kpicc:KPITextBox ID="txtActivity"  runat="server" Width="30%" KPISecurity="AC" KPITabIndex="808" CssClass="textbox" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>&nbsp;%</kpicc:KPILabel>
                                </td>
                            </tr>
                        </table>

                    </td>
                    <td></td>
                    <td></td>

                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblTemperature" runat="server" Font-Bold="true" Text="Temperature&nbsp;"></kpicc:KPILabel></td>
                    <td>
                        <kpicc:KPITextBox ID="txtTemperature" runat="server" Width="100%" KPISecurity="AC" KPITabIndex="809" CssClass="textbox" MaxLength="6" onkeypress="return isNumberKey(event,this)" onkeydown="return AlphabetValidation(this,'rt',event)"></kpicc:KPITextBox></td>

                    <td style="text-align: left; padding-left: 15px" colspan="3">
                        <kpicc:KPIRadioList ID="RadLstTemperature" runat="server" KPITabIndex="810" RepeatDirection="Vertical" KPISecurity="AC" RepeatColumns="5" RepeatLayout="Table" Width="80%">
                            <asp:ListItem Value="1" Text=" Oral"></asp:ListItem>
                            <asp:ListItem Value="2" Text=" Rectal" />
                            <asp:ListItem Value="3" Text=" Axillary" />
                            <asp:ListItem Value="4" Text=" Ear" />
                            <asp:ListItem Value="5" Text=" Temporal" />
                        </kpicc:KPIRadioList>
                    </td>
                    <td></td>
                    <td></td>

                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblBloodPressure" runat="server" Font-Bold="true" Text="Blood Pressure&nbsp;"></kpicc:KPILabel></td>
                    <td style="padding:0;border-spacing:0;text-align:left;white-space:nowrap">
                        <%--<kpicc:KPIMaskEdit ID="mskBlood" runat="server" KPITabIndex="810" KPISecurity="AC" Width="100%" InputMask="###/###"></kpicc:KPIMaskEdit>--%>


                        <table style="width: 70%; table-layout: fixed;padding:0;border-spacing:0">
                            <colgroup>
                                <col style="width: 100%" />
                            </colgroup>
                            <tr>

                                <td style="text-align:left">
                                    <kpicc:KPITextBox ID="txtBloodPressure1" runat="server" Width="30px" KPISecurity="AC" KPITabIndex="812" CssClass="textbox" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                    <span>/</span>
                                    <kpicc:KPITextBox ID="txtBloodPressure2" Text="" runat="server" Width="30px" KPISecurity="AC" KPITabIndex="813" CssClass="textbox" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                </td>


                            </tr>
                        </table>

                    </td>
                    <td colspan="3" style="text-align: left; padding-left: 15px;">
                        <table style="width: 80%; padding: 0; border-spacing: 0;">
                            <colgroup>
                                <col style="width: 40%" />
                                <col style="width: 10%" />
                                <col style="width: 50%" />
                            </colgroup>
                            <tr>
                                <td style="text-align: left; padding: 0; border-spacing: 0">
                                    
                                        <kpicc:KPIRadioList ID="RadLstBloodPressure" runat="server" KPITabIndex="814" RepeatDirection="Horizontal" RepeatColumns="5" KPISecurity="AC" RepeatLayout="Table" Width="80%">
                                            <asp:ListItem Value="1" Text=" Left&nbsp;&nbsp;"></asp:ListItem>
                                            <asp:ListItem Value="2" Text=" Right" />
                                        </kpicc:KPIRadioList>
                                    
                                </td>
                                <td>&nbsp;</td>
                                <td style="text-align: left">
                                    
                                        <kpicc:KPIRadioList ID="RadLstBloodPressureStatus" runat="server" KPITabIndex="815" KPISecurity="AC" RepeatDirection="Horizontal" RepeatColumns="5" RepeatLayout="Table" Width="100%">
                                            <asp:ListItem Value="1" Text=" Sitting&nbsp;&nbsp;&nbsp;" />
                                            <asp:ListItem Value="2" Text=" Lying" />
                                            <asp:ListItem Value="3" Text=" Standing" />
                                        </kpicc:KPIRadioList>
                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td></td>
                    <td></td>


                </tr>


                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>


                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblPulse" runat="server" Text="Pulse&nbsp;" Font-Bold="true"></kpicc:KPILabel>
                    </td>
                    <td style="text-align: left;white-space:nowrap">
                        <kpicc:KPILabel ID="lblApical" runat="server" AssociatedControlID="txtPulse">
            <kpicc:KPITextBox ID="txtPulse" runat="server" Width="25px" KPISecurity="AC" KPITabIndex="818" CssClass="textbox" MaxLength="3" onkeyup="return isValidPulsApical(event,this)" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                Apical
                        </kpicc:KPILabel>
                    </td>

                    <td style="padding: 0; border-spacing: 0; text-align: left" colspan="2">
                        <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed">
                            <colgroup>
                                <col style="width: 2%" />
                                <col style="width: 28%" />
                                <col style="width: 20%" />
                                <col style="width: 50%" />
                            </colgroup>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="text-align: left">
                                    <kpicc:KPILabel ID="lblRadial" runat="server" AssociatedControlID="txtRadial">
            <kpicc:KPITextBox ID="txtRadial" runat="server" Width="25px" KPISecurity="AC" KPITabIndex="819" CssClass="textbox" MaxLength="3" onkeyup="return isValidPulsRadial(event,this)" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                Radial
                                    </kpicc:KPILabel>
                                </td>
                                <td style="text-align: right">
                                    <kpicc:KPILabel ID="lblRhythm" runat="server" Font-Bold="true" Text="Rhythm"></kpicc:KPILabel></td>
                                <td style="text-align: left; padding-left: 5px">
                                    <kpicc:KPIRadioList ID="RadLstRhythm" runat="server" KPITabIndex="820" RepeatDirection="Horizontal" KPISecurity="AC" RepeatColumns="5" RepeatLayout="Table" Width="100%">
                                        <asp:ListItem Value="1" Text=" Left"></asp:ListItem>
                                        <asp:ListItem Value="2" Text=" Right" />
                                    </kpicc:KPIRadioList></td>
                            </tr>
                        </table>

                    </td>

                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>



                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <kpicc:KPILabel ID="lblNotes" runat="server" Text="Notes&nbsp;" Font-Bold="true"></kpicc:KPILabel></td>

                    <td colspan="5" style="text-align: left;padding:0;border-spacing:0">
                        <table style="width:99.5%;padding:0;border-spacing:0;table-layout:fixed">
                            <colgroup><col style="width:100%;" /></colgroup>
                            <tr>
                                <td>
                                    <kpicc:KPITextBox ID="txtNotes" runat="server" Width="100%" KPISecurity="AC" TextMode="MultiLine" Height="50px" KPITabIndex="822" CssClass="textbox" MaxLength="400"></kpicc:KPITextBox>
                                </td>
                            </tr>
                        </table>
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
                    <td></td>
                    <td></td>
                </tr>


                <tr>
                    <td></td>
                    <td style="text-align: right;white-space:nowrap" class="req">
                        <kpicc:KPILabel ID="lblVitalBy" runat="server" Text="Vitals taken By PF#&nbsp;"></kpicc:KPILabel></td>
                    <td colspan="4" style="padding: 0; border-spacing: 0;width:100%">
                        <table style="width: 100%; ">
                            <colgroup>
                                <col style="width: 40%" />
                                <col style="width: 20%" />
                                <col style="width: 40%" />
                            </colgroup>
                            <tr>
                                <td style="white-space: nowrap; padding: 0; border-spacing: 0; text-align: left">
                                    <kpicc:KPICodedLookUp ID="lupPFNbr" runat="server" KPIShowDescription="True"  DescFieldWidth="80%" ValueFieldWidth="30%" KPICodeID="110" KPISecurity="AC" KPITabIndex="824" KPIClientCallBack="FillLogInPF"></kpicc:KPICodedLookUp>
                                </td>
                                <td style="text-align: right;" class="req">
                                    <kpicc:KPILabel ID="lblDateTime" runat="server" Text="Date / Time&nbsp;"></kpicc:KPILabel></td>
                                <td style="text-align: left; padding: 0; border-spacing: 0;">
                                    <kpicc:KPIDateTime ID="dtDateFrom" runat="server" KPISecurity="AC" KPITabIndex="825" KPIMandatory="True" KPITimeDisplay="TimeShort"></kpicc:KPIDateTime>
                                </td>
                            </tr>
                        </table>
                    </td>



                    <td style="width: 100%; padding: 0; border-spacing: 0">
                        <table style="table-layout: fixed; float: right; padding: 0; border-spacing: 0">
                            <colgroup>
                                <col style="width: 50%" />
                                <col style="width: 24%" />
                                <col style="width: 2%" />
                                <col style="width: 24%" />
                            </colgroup>
                            <tr>
                                <td></td>
                                <td style="text-align: right">
                                    <kpicc:KPIImageButton ID="cmdAdd" TabIndex="5" runat="server" KPISecurity="AC" KPITabIndex="829" ImageUrl="/KPIImages/ico/AddData_Text.png" CssClass="menuItem" ToolTip="Add" AlternateText="Add"></kpicc:KPIImageButton></td>
                                <td>&nbsp;</td>
                                <td style="text-align: right; padding: 0; border-spacing: 0">
                                    <kpicc:KPIImageButton ID="cmdClear" TabIndex="6" runat="server" KPISecurity="ACI" KPITabIndex="830" ImageUrl="/KPIImages/ico/ClearData_Text.png" CssClass="menuItem" ToolTip="Clear" AlternateText="Clear" CausesValidation="False"></kpicc:KPIImageButton></td>
                            </tr>

                        </table>

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
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>&nbsp;</td>

                    <td colspan="6" style="width:100%;text-align:left">
                        <table style="width:100%;padding:0;border-spacing:0;table-layout:fixed">
                            <colgroup><col style="width:100%" /></colgroup>
                            <tr>
                                <td style="width:100%;padding:0;border-spacing:0">
                                    <kpicc:KPIGrid ID="grdMedicalVital" TabIndex="13" runat="server" DataKeyFields="JMMedVitaltID" KPICustomPaging="true" Height="120px"
                            KPISecurity="AC" Width="100%" IsInquiryScreen="True" OnInitializeRow="grdMedicalVital_InitializeRow"
                            KPIDefaultJurisAlias="False" EnableDataViewState="true" AutoGenerateColumns="false">
                            <ClientEvents Click="grdMedicalVital_CellClickHandler"></ClientEvents>
                            <Columns>

                                <igtbl:UnboundField Key="KPIDRK" Hidden="true" Header-Text="X"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="KPIMode" Hidden="true"></igtbl:UnboundField>

                                <igtbl:UnboundField Key="WType" Hidden="true"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="WStatus" Hidden="true"></igtbl:UnboundField>

                                <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMedVitaltID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="KPIJurisID" Hidden="True" DataFieldName="JurisID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMBookingID" Hidden="True" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Weight" Hidden="True" DataFieldName="Weight" DataFormatString="{0:N2}"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="WeightType" Hidden="True" DataFieldName="WeightType"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="WeightStatus" Hidden="True" DataFieldName="WeightStatus"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Temperature" Hidden="True" DataFieldName="Temperature" DataFormatString="{0:N2}"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="TemperatureType" Hidden="True" DataFieldName="TemperatureType"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="SpoxAtRest" Hidden="True" DataFieldName="SpoxAtRest"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="SpoxActivity" Hidden="True" DataFieldName="SpoxActivity"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="BloodPressure" Hidden="True" DataFieldName="BloodPressure"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="BloodPressureType" Hidden="True" DataFieldName="BloodPressureType"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="BloodPressureStatus" Hidden="True" DataFieldName="BloodPressureStatus"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PulseApical" Hidden="True" DataFieldName="PulseApical"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PulseRadial" Hidden="True" DataFieldName="PulseRadial"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PulseRhythm" Hidden="True" DataFieldName="PulseRhythm"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Cmts" DataFieldName="Cmts" Hidden="True"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="VitalPFCode" DataFieldName="PFCode" Hidden="True"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="VitalPFID" DataFieldName="VitalPFID" Hidden="True"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PulseWithType" DataFieldName="PulseWithType" Hidden="true"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Status" DataFieldName="Status" Hidden="true"></igtbl:BoundDataField>

                                <igtbl:BoundDataField Key="VitalDttm" DataFieldName="VitalDttm" Header-Text="Date/Time" Width="15%" DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="VitalDesc" Header-Text="PF#/Name" DataFieldName="FullName" Width="13%"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Height" Header-Text="Height" DataFieldName="Height" Width="8%"></igtbl:BoundDataField>


                                <igtbl:UnboundField Key="WeightWithType" Header-Text="Weight" Width="12%"></igtbl:UnboundField>
                                <igtbl:BoundDataField Key="Respiration" Header-Text="Resp." DataFieldName="Respiration" Width="7%"></igtbl:BoundDataField>
                                <igtbl:UnboundField Key="TemperatureWithType" Header-Text="Temp." Width="12%"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="BPWithType" Header-Text="BP" Width="10%"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="Pulse" Header-Text="Pulse" Width="8%"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="Spox" Header-Text="SPOX" Width="10%"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="Notes" Header-Text="C" Width="5%"></igtbl:UnboundField>
                                <igtbl:UnboundField Key="CmtsNotes" Hidden="true" HtmlEncode="false"></igtbl:UnboundField>
                                <igtbl:BoundDataField Key="BloodPressureMax" Hidden="True" DataFieldName="BloodPressureMax"></igtbl:BoundDataField>


                            </Columns>


                            <Behaviors>
                                <igtbl:Activation Enabled="true"></igtbl:Activation>
                                <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                                <igtbl:EditingCore AutoCRUD="False" Enabled="true" BatchUpdating="true">
                                    <Behaviors>
                                        <igtbl:CellEditing Enabled="false"></igtbl:CellEditing>
                                    </Behaviors>
                                </igtbl:EditingCore>
                            </Behaviors>
                        </kpicc:KPIGrid>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="vertical-align: bottom" id="tdstatusbar" runat="server">
                    <td class="statusBar" colspan="8">
                        <input id="hdnBloodPressure" type="hidden" name="hdnBloodPressure" runat="server" />
                        <input id="hdnPulse" type="hidden" name="hdnPulse" runat="server" />
                        <input id="hdnWeight" type="hidden" name="hdnWeight" runat="server" />
                        <input id="hdnHeight" type="hidden" name="hdnHeight" runat="server" />
                        <input id="hdnMedVitalID" type="hidden" name="hdnMedVitalID" runat="server" />
                        <input id="hdnBloodPressureMax" type="hidden" name="hdnBloodPressureMax" runat="server" />
                    </td>
                </tr>


            </table>

        
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2017.02.02" type="text/javascript"></script>
        <script src="frmMedVitals.js?v=2017.05.08" type="text/javascript"></script>
    </form>
</body>
</html>
