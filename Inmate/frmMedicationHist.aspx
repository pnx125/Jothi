<%@ Page Language="c#" CodeFile="frmMedicationHist.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicationHist" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
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
    <script src="../KPIFrameworkWeb/Loader2010.js?v=2018.09.11" type="text/javascript"></script>
<style>
    #lupPFNo_CodeValue {
        width: 98% !important;
    }
</style>
</head>
<body class="masterfrm">
    <script  src="../KPIFrameworkWeb/Scripts/Tooltip.js?v=2016.12.20" type="text/javascript"></script>
    <form id="frmMedicationHist_Id" method="post" runat="server">
         <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

        <table style="width: 100%; padding: 0; border-spacing: 0; height: 100%;table-layout:fixed">
            <colgroup>
                <col style="width: 1%" />
                <col style="width: 89%" />
                <col style="width: 10%" />
            </colgroup>
            <tbody>
                <tr>
                    <td class="status"  style="text-align:left" colspan="3">
                        <table cellspacing="4">
                            <tr valign="middle">
                                <td>
                                    <kpicc:KPIImageButton ID="cmdSave" runat="server" KPITabIndex="1000" ImageUrl="/KPIImages/ico/16_L_save.gif" ToolTip="Save" AlternateText="Save" KPISecurity="AC" CssClass="menuItem" OnClick="cmdSave_Click"></kpicc:KPIImageButton>
                                </td>
                                <td></td>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdSaveNClose" runat="server" KPITabIndex="1001" ImageUrl="/KPIImages/ico/16_saveClose.gif" ToolTip="Save &amp; Close" AlternateText="Save &amp; Close" KPISecurity="AC" CssClass="menuItem" OnClick="cmdSaveNClose_Click"></kpicc:KPIImageButton>
                                </td>
                                <td></td>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdPrint" runat="server" KPITabIndex="1002" ImageUrl="/KPIImages/ico/16_print.gif" ToolTip="Print" AlternateText="Print" KPISecurity="ACID" CssClass="menuItem" CausesValidation="False" OnClick="cmdPrint_Click"></kpicc:KPIImageButton>
                                </td>
                                <td></td>
                                <td>
                                    <kpicc:KPIImageButton ID="cmdRefresh" runat="server" KPITabIndex="1003" ImageUrl="/KPIImages/ico/16_L_refresh.gif" ToolTip="Reset" AlternateText="Reset" KPISecurity="ACID" CssClass="menuItem" CausesValidation="False" OnClick="cmdRefresh_Click"></kpicc:KPIImageButton>
                                </td>
                                <td width="100%"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>

                    <td colspan="3" style="vertical-align: top; text-align: center;">
                        <table id="tdFlag" runat="server" style="width: 75%; padding: 0; border-spacing: 0; table-layout: fixed">
                            <colgroup>
                                <col style="width: 15%" />
                                <col style="width: 22%" />
                                <col style="width: 22%" />
                                <col style="width: 26%" />
                                <col style="width: 15%" />
                            </colgroup>
                            <tr>

                                <td class="req" style="text-align: right">
                                    <kpicc:KPILabel ID="lblJuris" runat="server" KPIRepositoryID="0" Visible="False"> Juris&nbsp;</kpicc:KPILabel></td>
                                <td class="req" valign="middle" nowrap align="left" colspan="2">
                                    <kpicc:KPIJurisDropDownList ID="lstJuris" runat="server" KPITabIndex="579" KPISecurity="A" Visible="False" KPIWidth="160"></kpicc:KPIJurisDropDownList>
                                    &nbsp;</td>



                                <td colspan="2">
                                    <input id="hdnScreenId" type="hidden" value="8535" name="hdnScreenId" runat="server" /><input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                                    <input id="hdnRefillBalanceFlag" type="hidden" name="hdnJurisId" runat="server" />
                                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                                    <input id="hdnPrescriptionID" type="hidden" name="hdnPrescriptionID" runat="server" />
                                    <input id="hdnMedPresHisID" type="hidden" name="hdnMedPresHisID" runat="server" />
                                    <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                                </td>
                            </tr>


                            <tr>

                                <td class="req" style="text-align: right">
                                    <kpicc:KPILabel ID="lblDatetime" runat="server" KPIRepositoryID="0"> Date/Time&nbsp;</kpicc:KPILabel></td>
                                <td colspan="2">
                                    <kpicc:KPIDateTime ID="dttmDateTime" runat="server" KPITabIndex="580" KPISecurity="A" KPIMandatory="True"></kpicc:KPIDateTime>
                                </td>
                                <td></td>
                                <td style="text-align: right;" colspan="1" rowspan="4">
                                    <kpicc:KPIImageButton ID="imgFrontView" runat="server" Width="112px" Height="100px" OnClientClick="return false;"></kpicc:KPIImageButton>
                                </td>

                            </tr>




                            <tr>

                                <td class="req" style="text-align: right; padding-top: 10px">
                                    <kpicc:KPILabel ID="lblName" runat="server" KPIRepositoryID="0">Name&nbsp;</kpicc:KPILabel></td>
                                <td colspan="3" style="text-align:left">
                                    <phnxcc:NameCtrl ID="NamCtrlSPIN" runat="server" KPISecurity="AC" KPITabIndex="581" KPIWidth="0" KPIClientCallBack="LoadImg" Width="100%" IsSPNNo="True" KPIResult="Detail"></phnxcc:NameCtrl>

                                </td>

                            </tr>

                            <tr>


                                <td></td>
                                <td></td>
                                 <td style="text-align: left"><kpicc:KPILabel ID="lblDosageType" runat="server" KPIRepositoryID="0"> Dosage&nbsp;</kpicc:KPILabel></td>
                                <td style="text-align: left">
                                    <kpicc:KPILabel ID="lblAdmin" runat="server" KPIRepositoryID="0">Last Administered</kpicc:KPILabel></td>

                                

                            </tr>


                            <tr>

                                <td style="text-align: right" runat="server" id="tdDrug">
                                    <kpicc:KPILabel ID="lblDrug" runat="server" KPIRepositoryID="0">Drug&nbsp;</kpicc:KPILabel></td>
                                <td style="text-align: left">
                                    <div id="individualMAr" runat="server" style="display: none">
                                        <%--<kpicc:KPIDropDownList  ID="cddDrug" AutoPostBack="true" runat="server" KPISecurity="AC"  KPIMode="Search" KPITabIndex="582" Width="97%" KPIMandatory="Yes" ></kpicc:KPIDropDownList>--%>
                                        <kpicc:KPICodedDropDownList  ID="cddDrug" runat="server" KPISecurity="AC"  KPIMode="Search" KPITabIndex="582" Width="97%" KPIDisplayOption="Description" KPICodeID="786" KPIMandatory="Yes" KPIOnChangeHandler="fn_LoadData()" ></kpicc:KPICodedDropDownList>


                                    </div>
                                    <div id="idMar" runat="server">
                                        <kpicc:KPITextBox ID="txtDrug" runat="server" KPITabIndex="583" KPISecurity="N" CssClass="Readonly" KPIRepositoryID="0" Width="95%" ReadOnly="True"></kpicc:KPITextBox>
                                    </div>




                                </td>
                                <td style="text-align:left;width:70% !important"> 
                                    <table style="width:100%;padding:0;border-spacing:0">
                                        <colgroup><col style="width:100%" /></colgroup>
                                        <tr runat="server" id="trFlagisNull">
                                            <td><kpicc:KPICodedDropDownList  ID="cddDosage" runat="server" KPISecurity="AC" KPICodeID="788" KPIDisplayOption="Description" KPIMode="Search" KPITabIndex="584" Width="100%"  KPIMandatory="Yes" KPIOnChangeHandler="fn_GetScheduleEvents()" ></kpicc:KPICodedDropDownList></td>
                                        </tr>
                                        <tr runat="server" id="trFlagisNotNull" style="display:none">
                                            <td>
                                                <kpicc:KPITextBox ID="txtDosage" runat="server" KPITabIndex="585" KPISecurity="N" CssClass="Readonly"
                                                    KPIRepositoryID="0" Width="95%" ReadOnly="True" MaxLength="20"></kpicc:KPITextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    



                                </td>
                                <td>
                                    <kpicc:KPIDateTime ID="dttmLstAdministered" runat="server" KPISecurity="N" KPITabIndex="586" KPIMandatory="True"></kpicc:KPIDateTime>
                                </td>
                                


                            </tr>

                            <tr>

                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                       <%--     <tr >
                                <td style="text-align: right"><kpicc:KPILabel ID="lblDosage" runat="server" KPIRepositoryID="0"> Dosage&nbsp;</kpicc:KPILabel></td>
                                <td style="text-align: left">
                                    <kpicc:KPITextBox ID="txtDosage" runat="server" KPITabIndex="584" KPISecurity="N" CssClass="Readonly"
                                        KPIRepositoryID="0" Width="95%" ReadOnly="True" MaxLength="20"></kpicc:KPITextBox></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>--%>








                            <tr>
                                <td style="text-align: right; padding-top: 13px" class="req" id="tdDispenseAmt">
                                    <kpicc:KPILabel ID="lblDispense" runat="server" KPIRepositoryID="0"> Dispense&nbsp;</kpicc:KPILabel></td>
                                <td colspan="4" style="padding: 0; border-spacing: 0; width: 100%">
                                    <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed">
                                        <colgroup>

                                            <col style="width: 24%" />
                                            <col style="width: 1%" />
                                            <col style="width: 20%" />
                                            <col style="width: 1%" />
                                            <col style="width: 20%" />
                                            <col style="width: 1%" />
                                            <col style="width: 20%" />
                                            <col style="width: 1%" />
                                            <col style="width: 12%" />

                                        </colgroup>                                     
                                        <tr>

                                           <td colspan="2">
                                                <table style="padding: 0; border-spacing: 0; table-layout: fixed; width: 97%">
                                                    <colgroup>
                                                        <col style="width: 25%" />
                                                        <col style="width: 75%" />
                                                    </colgroup>
                                                   
                                                    <tr>
                                                       <td>&nbsp;</td>
                                                       <td class="req" style="white-space: nowrap; text-align: left" id="tdDosageType" runat="server">
                                                            <kpicc:KPILabel ID="lblMedicationType" runat="server" KPIRepositoryID="0">Dosage Type</kpicc:KPILabel>
                                                       </td>
                                                    </tr>
                                                </table>
                                           </td>
                                            <td class="req" style="white-space: nowrap; text-align: left" id="tdMethodAdmin">
                                                <kpicc:KPILabel ID="lblMethodAdmin" runat="server" KPIRepositoryID="0">Method Administered</kpicc:KPILabel></td>
                                            <td>&nbsp;</td>
                                            <td class="req" style="text-align: left">
                                                <kpicc:KPILabel ID="lblPF" runat="server" KPIRepositoryID="0">PF#</kpicc:KPILabel></td>
                                            <td>&nbsp;</td>
                                            <td class="req" style="text-align: left" id="tdStatus">
                                                <kpicc:KPILabel ID="lblStatus" runat="server" KPIRepositoryID="0">Status</kpicc:KPILabel></td>
                                            <td></td>
                                            <td style="text-align: left">
                                                <kpicc:KPILabel ID="lblBalance" runat="server" KPIRepositoryID="0">Balance</kpicc:KPILabel></td>



                                        </tr>
                                        <tr>

                                            <td style="text-align: left;" colspan="2">
                                                <table style="padding: 0; border-spacing: 0; table-layout: fixed; width: 97%">
                                                    <colgroup>
                                                        <col style="width: 25%" />
                                                        <col style="width: 75%" />
                                                    </colgroup>
                                                    <tr>
                                                        <td style="text-align: left; padding: 0; border-spacing: 0">
                                                            <kpicc:KPITextBox ID="txtDispense" runat="server" KPIRepositoryID="0" CssClass="textbox" Width="100%" MaxLength="3" KPITabIndex="587" KPISecurity="A" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox></td>
                                                        <td>
                                                            <kpicc:KPICodedDropDownList ID="cddDispense" KPIOnChangeHandler="fn_DispenseBalance" runat="server" KPITabIndex="588" KPIDisplayOption="Description" KPICodeID="4152" KPISecurity="A" Width="100%"></kpicc:KPICodedDropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td style="text-align: left">
                                                <kpicc:KPICodedDropDownList ID="cddMethodAdmin" TabIndex="510" runat="server" KPITabIndex="589" KPISecurity="A" Width="100%" KPIMandatory="Yes" KPIDisplayOption="Description" KPICodeID="4156"></kpicc:KPICodedDropDownList>
                                            </td>
                                            <td></td>
                                            <td style="white-space: nowrap; text-align: left">
                                                <kpicc:KPICodedLookUp ID="lupPFNo" runat="server" KPITabIndex="590" KPISecurity="A" KPIWidth="100" Width="100%" ValueFieldWidth="100%" KPICodeID="110" KPIClientCallBack="VerifyLoggedPF" KPIShowDescription="False"></kpicc:KPICodedLookUp>
                                            </td>
                                            <td></td>
                                            <td style="text-align: left">
                                                <kpicc:KPICodedDropDownList ID="cddStatus" runat="server" KPITabIndex="591" KPISecurity="A" Width="100%" KPIMandatory="Yes" KPIDisplayOption="Description" KPICodeID="4155" KPIOnChangeHandler="fn_Commentsmandatory"></kpicc:KPICodedDropDownList>
                                            </td>
                                            <td></td>
                                            <td style="text-align: left">
                                                <kpicc:KPITextBox ID="txtBalance" runat="server" KPITabIndex="592" KPISecurity="N" Width="100%" MaxLength="4"></kpicc:KPITextBox></td>


                                        </tr>
                                    </table>
                                </td>

                            </tr>

                         
                          
                              <tr>
                                  <td style="text-align:right">
                                      <kpicc:KPILabel ID="lblInstructions" runat="server" KPIRepositoryID="0">Instructions&nbsp;</kpicc:KPILabel></td>
                               <td colspan="4">
                                    <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed">
                                        <colgroup>
                                            <col style="width: 100%" />
                                        </colgroup>
                                        <tr>
                                            <td style="border-spacing: 0; padding: 0; width: 100%">
                                                <kpicc:KPITextBox ID="txtInstructions" TabIndex="561" runat="server" KPITabIndex="593" KPISecurity="N" Height="40px"  TextMode="MultiLine"
                                                    Width="100%" MaxLength="150"></kpicc:KPITextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" id="tdComments" runat="server">
                                    <kpicc:KPILabel ID="lblComment" runat="server" KPIRepositoryID="0">Comment&nbsp;</kpicc:KPILabel></td>
                                <td colspan="4">
                                    <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed">
                                        <colgroup>
                                            <col style="width: 100%" />
                                        </colgroup>
                                        <tr>
                                            <td style="border-spacing: 0; padding: 0; width: 100%">
                                                <kpicc:KPITextBox ID="txtNotes" TabIndex="561" runat="server" KPITabIndex="594" KPISecurity="A"
                                                    Width="100%" Height="32px" MaxLength="255" TextMode="MultiLine"></kpicc:KPITextBox>
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
                            </tr>
                            <tr>
                                <td style="text-align: right; white-space: nowrap">
                                    <kpicc:KPILabel ID="lblSignature" runat="server" KPIRepositoryID="0">Inmate Signature&nbsp;</kpicc:KPILabel></td>
                                <td>
                                    <kpicc:KPIImageButton ID="imgMedSignature" Width="99%" runat="server" KPITabIndex="595" Height="50"></kpicc:KPIImageButton></td>
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
                            </tr>


                        </table>
                    </td>
                    
                </tr>
            </tbody>
            <tr>
                <td class="statusBar" colspan="3" style="text-align: left; width: 100%">
                    <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral>


                    <input id="hdnDispense" type="hidden" name="hdnDispense" runat="server" />
                    <input id="hdnMedicationType" type="hidden" name="hdnMedicationType" runat="server" />
                    <input id="hdnJMMScheduleEventsID" type="hidden" name="hdnJMMScheduleEventsID" runat="server" />
                    <input id="hdnMarSignId" type="hidden" name="hdnMarSignId" runat="server" />
                    <input id="hdnImagePath" type="hidden" name="hdnImagePath" runat="server" />
                    <input id="hdnShowImage" type="hidden" name="hdnShowImage" runat="server" />                    
                    <input id="hdnPrint" type="hidden" name="hdnPrint" runat="server" />   
                    <input id="hdnJMBookingID" type="hidden" name="hdnJMBookingID" runat="server" />   

                    <input id="hdnDrug" type="hidden" name="hdnDrug" runat="server" />   
                    <input id="hdnDosage" type="hidden" name="hdnDosage" runat="server" />   

                </td>
            </tr>
        </table>
       

        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.09.11" type="text/javascript"></script>
        <script src="frmMedicationHist.js?v=2018.10.01" type="text/javascript"></script>
    </form>
</body>
</html>