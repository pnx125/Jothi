<%@ Page Language="c#" CodeFile="frmDoctorEntry.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmDoctorEntry" %>
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
    <link href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet" />
    <%=strDynamicThemes%>

</head>
<body class="masterfrm">
    <form id="frmDoctorEntry_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table id="Table1" style="table-layout: fixed; left: 0px; top: 0px; width: 100%; padding: 0; border-spacing: 0; height: 100%">
            <colgroup>
                <col style="width: 100%" />
            </colgroup>
            <tbody>
                <tr>
                    <td class="status" style="vertical-align: top; text-align: left; width: 100%">
                        <div class="tab" id="tab0" style="display: inline">
                            <table id="Table5" style="float: left">
                                <tr>
                                    <td style="text-align: left">
                                        <kpicc:kpiimagebutton id="cmdSave" tabindex="10" runat="server" alternatetext="Save" kpirepositoryid="0" imageurl="/KPIImages/ico/16_L_save.gif" tooltip="Save" cssclass="menuItem" kpitabindex="1000" kpisecurity="AC" onclick="cmdSave_Click"></kpicc:kpiimagebutton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td style="text-align: left">
                                        <kpicc:kpiimagebutton id="cmdSaveNClose" tabindex="11" runat="server" alternatetext="Save &amp; Close" kpirepositoryid="0" imageurl="/KPIImages/ico/16_saveClose.gif" tooltip="Save &amp; &#13;&#10;Close" cssclass="menuItem" kpitabindex="1001" kpisecurity="AC" onclick="cmdSaveNClose_Click"></kpicc:kpiimagebutton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td style="text-align: left">
                                        <kpicc:kpiimagebutton id="cmdPrint" tabindex="12" runat="server" alternatetext="Print" imageurl="/KPIImages/ico/16_print.gif" tooltip="Print" cssclass="menuItem" kpitabindex="1002" kpisecurity="ACI" onclick="cmdPrint_Click"></kpicc:kpiimagebutton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td style="text-align: left">
                                        <kpicc:kpiimagebutton id="cmdRefresh" tabindex="13" runat="server" alternatetext="Reset" imageurl="/KPIImages/ico/16_L_refresh.gif" tooltip="Reset" cssclass="menuItem" kpitabindex="1004" kpisecurity="ACI" onclick="cmdRefresh_Click"></kpicc:kpiimagebutton>
                                    </td>
                                    <td style="width: 100%"></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <table id="Table3" style="width: 100%; border-spacing: 0; padding: 0;">
                            <colgroup>
                                <col style="width: 20%" />
                                <col style="width: 60%" />
                                <col style="width: 20%" />
                            </colgroup>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="req">
                                    <kpicc:kpilabel id="lblJuris" runat="server" kpisecurity="I" kpirepositoryid="0"> Juris&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left">
                                    <kpicc:kpijurisdropdownlist id="lstJuris" runat="server" kpisecurity="A" width="50%"></kpicc:kpijurisdropdownlist>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="req" style="text-align: right">
                                    <kpicc:kpilabel id="lblNames" runat="server">Doctor Name&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left">
                                    <kpicc:kpitextbox id="txtDoctorName" runat="server" cssclass="textbox" kpitabindex="501" kpisecurity="AC" width="65%"></kpicc:kpitextbox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <kpicc:kpilabel id="lblAddress" runat="server">Address&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left">
                                    <kpicc:kpitextbox id="txtadrMainAddress" tabindex="1" runat="server" cssclass="textbox" kpitabindex="502" kpisecurity="AC" width="65%"></kpicc:kpitextbox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <kpicc:kpilabel id="lblCSZ" runat="server">CSZ&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left; padding: 0; border-spacing: 0">
                                    <kpicc:kpicustomcsz id="custHeaderCSZ" tabindex="2" runat="server" kpitabindex="503" kpisecurity="AC" width="70%" kpiziplength="0" kpiwidth="0"></kpicc:kpicustomcsz>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <kpicc:kpilabel id="lblphone" runat="server">Phone&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left">
                                    <kpicc:kpicustomphone id="cusHeaderPhone" runat="server" kpitabindex="504" kpisecurity="AC" width="100%" kpiwidth="0" kpimode="Add" tabindex="4"></kpicc:kpicustomphone>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <kpicc:kpilabel id="lblDentist" runat="server">Dentist&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left; padding: 0; border-spacing: 0">
                                    <kpicc:kpicheckbox id="chkDentist" runat="server" tooltip="IsDentist" kpitabindex="505" kpisecurity="AC" width="120px" tabindex="5"></kpicc:kpicheckbox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="rec" style="text-align: right">
                                    <kpicc:kpilabel id="lblInActive" runat="server">Inactive&nbsp;</kpicc:kpilabel>
                                </td>
                                <td style="text-align: left; padding: 0; border-spacing: 0">
                                    <table id="Table2" style="width: 100%; border-spacing: 0; padding: 0; table-layout: fixed">
                                        <colgroup>
                                            <col style="width: 5%" />
                                            <col style="width: 95%" />
                                        </colgroup>
                                        <tr>
                                            <td style="text-align: left; padding: 0; border-spacing: 0">
                                                <kpicc:kpicheckbox id="chkInActive" runat="server" tooltip="InActive" kpitabindex="506" kpisecurity="AC" width="25px" tabindex="6"></kpicc:kpicheckbox>
                                            </td>
                                            <td style="text-align: left">
                                                <kpicc:kpitextbox id="txtInActive" tabindex="6" runat="server" cssclass="textbox" kpitabindex="507" kpisecurity="I" width="33%"></kpicc:kpitextbox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="statusBar" style="width: 100%; text-align: left">
                        <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="ACID"></kpicc:kpiliteral>
                        <input id="hdnScreenId" type="hidden" value="8538" name="hdnScreenId" runat="server" />
                        <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                        <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                        <input id="hdnVendorCode" type="hidden" name="hdnVendorCode" runat="server" />
                        <input id="hdnDoctorId" type="hidden" name="hdnDoctorId" runat="server" />
                    </td>
                </tr>
            </tbody>
        </table>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2016.12.23" type="text/javascript"></script>
        <script src="frmDoctorEntry.js?v=2016.12.23" type="text/javascript"></script>
    </form>
</body>
</html>
