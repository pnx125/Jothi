<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmOrderEntry.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmOrderEntry" %>

<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>
        <%=strProductTitle%>
        -
        <%=strPageTitle%>
    </title>
    <link href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet">
    <%=strDynamicThemes%>

    <style>
        #lupOrderedPF_CodeDescription,#lupWitness_CodeDescription{
            width:98% !important;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmOrderEntry_Id" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

        <table style="width: 100%; padding: 0; border-spacing: 0; height: 100%">
            <colgroup>
                <col style="width: 4%" />
                <col style="width: 20%" />
                <col style="width: 10%" />
                <col style="width: 22%" />
                <col style="width: 10%" />
                <col style="width: 20%" />
                <col style="width: 10%" />
                <col style="width: 4%" />
            </colgroup>

            <tr>
                <td class="status" valign="middle" style="text-align: left" colspan="8">
                    <table cellspacing="4">
                        <tr valign="middle">
                            <td>
                                <kpicc:KPIImageButton ID="cmdSave" runat="server" ImageUrl="/KPIImages/ico/16_L_save.gif" ToolTip="Save" AlternateText="Save" KPISecurity="AC" CssClass="menuItem" KPITabIndex="1000" OnClick="cmdSave_Click"></kpicc:KPIImageButton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:KPIImageButton ID="cmdSaveNClose" runat="server" ImageUrl="/KPIImages/ico/16_saveClose.gif" ToolTip="Save &amp; Close" AlternateText="Save &amp; Close" KPISecurity="AC" CssClass="menuItem" KPITabIndex="1001" OnClick="cmdSaveNClose_Click"></kpicc:KPIImageButton>
                            </td>
                            <td></td>
                            <td>
                                    <kpicc:KPIImageButton ID="cmdPrint" runat="server" ImageUrl="/KPIImages/ico/16_print.gif" ToolTip="Print" AlternateText="Print" KPISecurity="ACI" CssClass="menuItem" KPITabIndex="1002" CausesValidation="False" OnClick="cmdPrint_Click"></kpicc:KPIImageButton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:KPIImageButton ID="cmdRefresh" runat="server" ImageUrl="/KPIImages/ico/16_L_refresh.gif" ToolTip="Reset" AlternateText="Reset" KPISecurity="ACI" CssClass="menuItem" KPITabIndex="1003" CausesValidation="False" OnClick="cmdRefresh_Click"></kpicc:KPIImageButton>
                            </td>
                            <td width="100%"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="8"></td>
            </tr>


            <tr>
                <td></td>

                <td colspan="6" style="width: 100%;vertical-align:top">

                    <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed;">
                        <colgroup>
                            <col style="width: 7%" />
                            <col style="width: 30%" />
                            <col style="width: 2%" />
                            <col style="width: 30%" />
                            <col style="width: 2%" />
                            <col style="width: 10%" />
                            <col style="width: 19%" />
                        </colgroup>


                        <tr>
                            <td></td>
                            <td style="text-align: left;vertical-align:bottom" class="req">
                                <kpicc:KPILabel ID="lblOrder" runat="server" KPIRepositoryID="0" Text="Order ACTION"></kpicc:KPILabel></td>
                            <td></td>
                            <td style="text-align: left;vertical-align:bottom" id="tdLocationMandatory">
                                <kpicc:KPILabel ID="lblStorageLocation" runat="server" KPIRepositoryID="0" Text="Storage Location"></kpicc:KPILabel></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td style="vertical-align:top">
                                <kpicc:KPICodedDropDownList ID="cddOrderAction" runat="server" KPITabIndex="600" Width="100%" KPIMode="Add" KPISecurity="A" KPIOnChangeHandler="fn_StorageLocMandatory"
                                    KPICodeID="4150" KPIDisplayOption="Description" KPIMandatory="Yes"></kpicc:KPICodedDropDownList>
                            </td>
                            <td></td>
                            <td style="vertical-align:top">
                                <kpicc:KPICodedDropDownList ID="cddStorageLocation" runat="server" KPITabIndex="601" Width="92.8%" KPIMode="Add" KPISecurity="A" KPIDisplayOption="Description"
                                    KPICodeID="4154"></kpicc:KPICodedDropDownList>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td id="tdDttm" style="text-align: left;vertical-align:bottom" >
                                <kpicc:KPILabel ID="lblDatettm" runat="server" KPIRepositoryID="0" Text="Date/Time"></kpicc:KPILabel></td>
                            <td></td>
                            <td style="text-align: left;vertical-align:bottom" id="tdPf">
                                <kpicc:KPILabel ID="lblPF" runat="server" KPIRepositoryID="0" Text="PF#"></kpicc:KPILabel></td>
                            <td></td>
                            <td style="text-align: left;vertical-align:bottom" id="tdQuantity">
                                <kpicc:KPILabel ID="lblQuantity" runat="server" KPIRepositoryID="0" Text="Quantity"></kpicc:KPILabel></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="vertical-align:top">
                                <kpicc:KPIDateTime ID="dttmOrderedDate" runat="server" KPISecurity="A" KPITabIndex="602" KPIMandatory="True"></kpicc:KPIDateTime>
                            </td>
                            <td></td>
                            <td style="white-space: nowrap;vertical-align:top">
                                <kpicc:KPICodedLookUp ID="lupOrderedPF" runat="server" KPISecurity="A" KPICodeID="110" KPIClientCallBack="FillLoggedInPF" DescFieldWidth="70%" ValueFieldWidth="40%"
                                    KPITabIndex="603"></kpicc:KPICodedLookUp>
                            </td>
                            <td></td>
                            <td style="vertical-align:top">
                                <kpicc:KPITextBox ID="txtQuantity" runat="server" KPISecurity="A" KPITabIndex="604" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"
                                    Width="100%"></kpicc:KPITextBox>
                            </td>
                            <td style="vertical-align:top">
                                <kpicc:KPICodedDropDownList ID="cddQuantityType" runat="server" KPITabIndex="605" KPIMode="Add" KPISecurity="A" Width="100%" KPIMandatory="Yes"
                                    KPIDisplayOption="Description" KPICodeID="4152"></kpicc:KPICodedDropDownList>
                            </td>

                        </tr>


                        <tr id="trEmptyRow" runat="server" style="display:none">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr id="trWitness" runat="server" style="display:none;vertical-align:bottom">
                            <td></td>
                            <td id="tdWitness">
                                <kpicc:KPILabel ID="lblHow" runat="server" KPIRepositoryID="0" Text="How Destroyed"></kpicc:KPILabel></td>
                            <td></td>
                            <td style="vertical-align:bottom" id="tdWitnessPF">
                                <kpicc:KPILabel ID="lblWitness" runat="server" KPIRepositoryID="0" Text="Witnessed by PF#"></kpicc:KPILabel></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>



                        <tr id="trDestroy"  runat="server" style="display:none">
                            <td></td>
                            <td>
                                <kpicc:KPICodedDropDownList ID="cddDestroyed" runat="server" KPITabIndex="606" Width="100%" KPIMode="Add" KPISecurity="A" KPIDisplayOption="Description"
                                    KPICodeID="4153"></kpicc:KPICodedDropDownList>
                            </td>
                            <td></td>
                            <td style="white-space: nowrap">
                                <kpicc:KPICodedLookUp ID="lupWitness" runat="server" KPISecurity="A" KPICodeID="110" DescFieldWidth="70%" ValueFieldWidth="40%"
                                    KPITabIndex="607"></kpicc:KPICodedLookUp>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>

                            <td id="tdlableNotes" style="text-align: right">
                                <kpicc:KPILabel ID="lblNotes" runat="server" KPIRepositoryID="0" Text="Notes&nbsp;"></kpicc:KPILabel></td>
                            <td id="tdTextNotes" colspan="6" style="text-align: left">
                                <kpicc:KPITextBox ID="txtDescription" runat="server" KPITabIndex="608" KPISecurity="AC" Width="99.5%" MaxLength="400" Height="40px" TextMode="MultiLine"></kpicc:KPITextBox></td>


                        </tr>

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                   
                    </table>
                </td>

                <td></td>
            </tr>
            <tr>
                <td colspan="9"></td>
            </tr>
            <tr>
                <td colspan="9" class="statusBar" style="width: 100%">
                    <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral>
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                    <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                    <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />
                    <input id="hdnScreenId" type="hidden" value="8554" name="hdnScreenId" runat="server" />
                    <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                    <input id="hdnBookingID" type="hidden" runat="server" name="hdnBookingID" />
                    <input id="hdnJMMedicalHistID" type="hidden" runat="server" name="hdnJMMedicalHistID" />
                    <input id="hdnJMMedPrescriptionID" type="hidden" runat="server" name="hdnJMMedPrescriptionID" />
                    <input id="hdnSetUserPFID" type="hidden" runat="server" name="hdnSetUserPFID" />
                    <input id="hdnJMPrescriptionOrderID" type="hidden" runat="server" name="hdnJMPrescriptionOrderID" />
                    <input id="hdnOrderNo" type="hidden" runat="server" name="hdnOrderNo" />
                    <input id="hdnDrugID" type="hidden" runat="server" name="hdnDrugID" />
                    <input id="hdnJMPreOrderHistID" type="hidden" runat="server" name="hdnJMPreOrderHistID" />
                    <input id="hdnJMPreOrderHistNo" type="hidden" runat="server" name="hdnJMPreOrderHistNo" />
                    <input id="hdnOrderAction" type="hidden" runat="server" name="hdnOrderAction" />
                    <input id="hdnQuantity" type="hidden" runat="server" name="hdnQuantity" />
                    <input id="hdnDisposition" type="hidden" runat="server" name="hdnDisposition" />                    

                </td>
            </tr>

        </table>


        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.08.07" type="text/javascript"></script>
        <script src="frmOrderEntry.js?v=2018.08.07" type="text/javascript"></script>
    </form>
</body>
</html>
