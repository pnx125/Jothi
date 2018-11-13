<%@ Page Language="c#" CodeFile="frmInmateReceipt.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmInmateReceipt" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
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
    <form id="frmIntMgmt_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table id="Table1" style="table-layout: fixed" cellspacing="0" cellpadding="3" width="100%">
            <colgroup>
                <col width="1" />
                <col width="100%" />
            </colgroup>
            <tr>
                <td class="status" style="height: 25px" valign="middle" align="center" colspan="2" height="25">
                    <div class="tab" id="tab0" style="display: inline">
                        <table id="Table5" width="75%" align="left">
                            <tr valign="middle">
                                <td>
                                    <kpicc:kpiimagebutton id="cmdSave" runat="server" kpisecurity="AC" alternatetext="Save" tooltip="Save" imageurl="/KPIImages/ico/16_L_save.gif" cssclass="menuItem" kpirepositoryid="0" kpitabindex="1000" tabindex="10"></kpicc:kpiimagebutton>
                                </td>
                                <td></td>
                                <td style="width: 19px">
                                    <kpicc:kpiimagebutton id="cmdSaveNClose" runat="server" kpisecurity="AC" alternatetext="Save &amp; Close" tooltip="Save &amp; Close" imageurl="/KPIImages/ico/16_saveClose.gif" cssclass="menuItem" kpirepositoryid="0" kpitabindex="1001" tabindex="11"></kpicc:kpiimagebutton>
                                </td>
                                <td style="width: 2px"></td>
                                <td>
                                    <kpicc:kpiimagebutton id="cmdPrint" runat="server" kpisecurity="ACI" alternatetext="Print" tooltip="Print" imageurl="/KPIImages/ico/16_print.gif" cssclass="menuItem" kpitabindex="1002" tabindex="12"></kpicc:kpiimagebutton>
                                </td>
                                <td></td>
                                <td>
                                    <kpicc:kpiimagebutton id="cmdRefresh" runat="server" kpisecurity="ACI" alternatetext="Reset" tooltip="Reset" imageurl="/KPIImages/ico/16_L_refresh.gif" cssclass="menuItem" kpitabindex="1004" tabindex="13"></kpicc:kpiimagebutton>
                                </td>
                                <td width="100%"></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="535" style="height: 535px" valign="middle">
                    <table id="Table2" cellspacing="1" cellpadding="1" width="100%" border="0">
                        <tr>
                        </tr>
                    </table>
                    <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                        <tr>
                            <td style="width: 106px; height: 15px"></td>
                            <td style="width: 113px; height: 15px"></td>
                            <td style="width: 428px; height: 15px"></td>
                            <td style="height: 15px"></td>
                        </tr>
                        <tr>
                            <td style="width: 106px"></td>
                            <td style="width: 113px"></td>
                            <td style="width: 428px"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 106px; height: 193px"></td>
                            <td style="width: 113px; height: 193px" colspan="2">
                                <kpicc:kpitextbox id="Kpitextbox3" runat="server" width="628px" height="253px" textmode="MultiLine"></kpicc:kpitextbox>
                            </td>
                            <td style="height: 193px"></td>
                        </tr>
                        <tr>
                            <td style="width: 106px"></td>
                            <td style="width: 113px" align="center" colspan="2">&nbsp;&nbsp;
									<kpicc:kpicheckbox id="chkStatement" runat="server" kpisecurity="ACI" kpitabindex="523" width="532px"
                                        text="I have Read and Understand the above Statement" autopostback="True"></kpicc:kpicheckbox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 106px"></td>
                            <td style="width: 113px" align="right" colspan="1" rowspan="1">
                                <kpicc:kpilabel id="lblSignature" runat="server" halign="right">Signature</kpicc:kpilabel>
                                &nbsp;</td>
                            <td style="width: 428px">
                                <kpicc:kpitextbox id="Kpitextbox5" runat="server" width="95%" height="57px" textmode="MultiLine"></kpicc:kpitextbox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 106px"></td>
                            <td style="width: 113px" align="right">
                                <kpicc:kpilabel id="lblNote" runat="server" halign="right">Note</kpicc:kpilabel>
                                &nbsp;</td>
                            <td style="width: 428px">
                                <kpicc:kpitextbox id="Kpitextbox1" runat="server" width="95%" height="57px" textmode="MultiLine"></kpicc:kpitextbox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 106px"></td>
                            <td style="width: 113px"></td>
                            <td style="width: 428px"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 106px"></td>
                            <td style="width: 113px"></td>
                            <td style="width: 428px"></td>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="statusBar" width="100%" colspan="2">
                    <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="ACID"></kpicc:kpiliteral>
                    <input id="hdnScreenId" type="hidden" value="8542" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />

                </td>
            </tr>
        </table>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
        <script src="frmIntMgmt.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
    </form>
</body>
</html>
