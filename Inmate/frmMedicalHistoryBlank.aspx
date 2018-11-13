<%@ Page Language="c#" CodeFile="frmMedicalHistoryBlank.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicalHistoryBlank" %>

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
    <form id="frmMedicalHistoryBlank_Id" method="post" runat="server">
        <table id="Table1" height="96%" cellspacing="0" cellpadding="3" width="100%">
            <colgroup>
                <col width="1" />
                <col width="100%" />
            </colgroup>
            <tr>
                <td class="status" style="height: 25px" valign="middle" align="center" colspan="2" height="25"></td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="100%"></td>
            </tr>
            <tr>
                <td class="statusBar" width="100%" colspan="2">
                    <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral>
                    <input id="hdnScreenId" type="hidden" value="8530" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                </td>
            </tr>
        </table>
        <script src="frmMedicalHistory.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
    </form>
</body>
</html>