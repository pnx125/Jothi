<%@ Page Language="c#" CodeFile="frmInPrisonerMedication.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmInPrisonerMedication" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtblexp" %>
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
    
</head>
<body class="masterfrm">
    <form id="frmInPrisonerMedication_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table id="Table1" cellspacing="0" cellpadding="3" width="959" style="table-layout: fixed; width: 959px; height: 360px">
            <colgroup>
                <col width="1" />
                <col width="100%" />
            </colgroup>
            <tr>
                <td class="status" valign="top" align="left" colspan="2" height="28" style="height: 28px">
                    <table id="Table5" cellspacing="4">
                        <tr valign="middle">
                            <td>
                                <kpicc:kpiimagebutton id="cmdSave" runat="server" cssclass="menuItem" kpisecurity="AC" alternatetext="Save" tooltip="Save" imageurl="/KPIImages/ico/16_L_save.gif" kpitabindex="1000"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdSaveNClose" runat="server" cssclass="menuItem" kpisecurity="AC" alternatetext="Save &amp; Close" tooltip="Save &amp; Close" imageurl="/KPIImages/ico/16_saveClose.gif" kpitabindex="1001"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdPrint" runat="server" cssclass="menuItem" kpisecurity="ACI" alternatetext="Print" tooltip="Print" imageurl="/KPIImages/ico/16_print.gif" kpitabindex="1002" causesvalidation="False"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdRefresh" runat="server" cssclass="menuItem" kpisecurity="ACI" alternatetext="Reset" tooltip="Reset" imageurl="/KPIImages/ico/16_L_refresh.gif" kpitabindex="1004" causesvalidation="False"></kpicc:kpiimagebutton>
                            </td>
                            <td width="100%"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 2px" colspan="2" height="2"></td>
            </tr>
            <tr>
                <td style="height: 293px" colspan="2" height="293">
                    <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                        <tr>
                            <td style="width: 105px; height: 16px"></td>
                            <td style="width: 72px; height: 16px">
                                <kpicc:kpilabel id="lblDrug" runat="server">Drug</kpicc:kpilabel>
                            </td>
                            <td style="height: 16px">
                                <kpicc:kpilabel id="Kpilabel1" runat="server">Job#</kpicc:kpilabel>
                            </td>
                            <td style="height: 16px">
                                <kpicc:kpilabel id="lblDosage" runat="server">Dosage</kpicc:kpilabel>
                            </td>
                            <td style="height: 16px">
                                <kpicc:kpilabel id="lblPrescribedAmt" runat="server">Prescribed Amt</kpicc:kpilabel>
                            </td>
                            <td style="height: 16px">
                                <kpicc:kpilabel id="lblCurrentBalance" runat="server">Current Balance</kpicc:kpilabel>
                            </td>
                            <td style="height: 16px">
                                <kpicc:kpilabel id="lblRefils" runat="server">Refills</kpicc:kpilabel>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px" align="right">
                                <kpicc:kpilabel id="lblPrescription" runat="server" width="91px">Prescription(s)</kpicc:kpilabel>
                                &nbsp;</td>
                            <td style="width: 72px">
                                <kpicc:kpicodeddropdownlist id="cddEventType" tabindex="10" runat="server" kpitabindex="502" kpisecurity="AC"
                                    height="11px" kpicodeid="1806" kpiwidth="150" width="130px" kpidisplayoption="Description"></kpicc:kpicodeddropdownlist>
                            </td>
                            <td>
                                <kpicc:kpitextbox id="txtJob" onkeydown="return AlphabetValidation(txtCensusTract,'aa1')" tabindex="2"
                                    runat="server" kpitabindex="512" kpisecurity="AC" width="140px" maxlength="6" cssclass="textbox"></kpicc:kpitextbox>
                            </td>
                            <td>
                                <kpicc:kpitextbox id="txtDosage" onkeydown="return AlphabetValidation(txtCensusTract,'aa1')" tabindex="2"
                                    runat="server" kpitabindex="512" kpisecurity="AC" width="140px" maxlength="6" cssclass="textbox"></kpicc:kpitextbox>
                            </td>
                            <td>
                                <kpicc:kpitextbox id="txtAmt" onkeydown="return AlphabetValidation(txtCensusTract,'aa1')" tabindex="2"
                                    runat="server" kpitabindex="512" kpisecurity="AC" width="140px" maxlength="6" cssclass="textbox"></kpicc:kpitextbox>
                            </td>
                            <td>
                                <kpicc:kpitextbox id="txtCurBal" onkeydown="return AlphabetValidation(txtCensusTract,'aa1')" tabindex="2"
                                    runat="server" kpitabindex="512" kpisecurity="AC" width="140px" maxlength="6" cssclass="textbox"></kpicc:kpitextbox>
                            </td>
                            <td>
                                <kpicc:kpicheckbox id="ChkGeneric" tabindex="9" runat="server" text="Generic Allowed"></kpicc:kpicheckbox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px"></td>
                            <td colspan="3">&nbsp;&nbsp;
									<kpicc:kpibutton id="cmdMedicationSch" runat="server" kpitabindex="506" kpisecurity="ACI" cssclass="CustomBtn" height="21px" width="96px" text="Medication Sch"></kpicc:kpibutton>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 105px" align="right">
                                <kpicc:kpilabel id="lblNotes" runat="server">Notes</kpicc:kpilabel>
                                &nbsp;</td>
                            <td colspan="6">
                                <kpicc:kpitextbox id="txtNotes" onkeydown="return AlphabetValidation(txtCensusTract,'aa1')" tabindex="2"
                                    runat="server" kpitabindex="512" kpisecurity="AC" width="140px" maxlength="6" cssclass="textbox"></kpicc:kpitextbox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px"></td>
                            <td style="width: 72px"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdAdd" runat="server" kpitabindex="519" imageurl="/KPIImages/ico/AddData_Text.png" tooltip="Add" alternatetext="Add" kpisecurity="AC" cssclass="menuItem"></kpicc:kpiimagebutton>
                                &nbsp;
									<kpicc:kpiimagebutton id="cmdClear" runat="server" kpitabindex="520" imageurl="/KPIImages/ico/ClearData_Text.png" tooltip="Clear" alternatetext="Clear" kpisecurity="AC" cssclass="menuItem" causesvalidation="False"></kpicc:kpiimagebutton>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px" align="center" colspan="7">
                                <kpicc:kpigrid id="grdInPrisonerMedication" tabindex="23" runat="server" kpisecurity="AC" height="150px" width="100%" autogeneratecolumns="false" enabledataviewstate="true" kpidefaultjurisalias="False" kpirepositoryid="0"> 
                                   <ClientEvents Click="grdStreet_DblClickHandler"Click="grdStreet_CellClickHandler" > </ClientEvents> 
                                   <Columns>
                                       <igtblexp:UnboundField Key="Preecription" Width="25%" > <Header Text="Prescription#" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="Durg" FooterText="" Width="10%" > <Header Text="Drug" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="Job" Hidden="True" > <Header Text="Job" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="Dosage" FooterText="" Width="10%" > <Header Text="Dosage" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="PrescribeAmt" FooterText="" Width="15%" > <Header Text="Prescribed Amt" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="CurBalance" Hidden="True" > <Header Text="Current Balance" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="Refills" FooterText="" Width="10%" > <Header Text="Refills" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="Note" Width="30%" > <Header Text="Note" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="KPIID" Hidden="True" > <Header Text="KPIID" /> </igtblexp:UnboundField> 
                                       <igtblexp:UnboundField Key="KPIMode" Hidden="True" > <Header Text="KPIMode" /> </igtblexp:UnboundField> 
                                   </Columns> 
                                   <Behaviors>
                                       <igtblexp:Activation Enabled="true" > </igtblexp:Activation>
                                       <igtblexp:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                       <igtblexp:RowSelectors RowNumbering="false" Enabled="false" />
                                   </Behaviors>
                               </kpicc:kpigrid>

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
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" height="18" align="center" valign="top" style="height: 18px"></td>
            </tr>
            <tr>
                <td class="statusBar" width="100%" colspan="2">
                    <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="ACID"></kpicc:kpiliteral>
                    <input id="hdnScreenId" type="hidden" value="8544" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />

                </td>
            </tr>
        </table>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
        <script src="frmAdmission.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
    </form>
</body>
</html>
