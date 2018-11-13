<%@ Page Language="c#" CodeFile="frmMedicationBlank.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicationBlank" %>

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
    <form id="frmMedicationBlank_Id" method="post" runat="server">

        <table style="width:100%;padding:0;border-spacing:0;height:100%">
            <colgroup><col style="width:100%" /></colgroup>
            <tr>
                <td class="status"></td>
            </tr>

            <tr>
                <td>
                     <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="ACID"></kpicc:kpiliteral>
                    <input id="hdnScreenId"  type="hidden" value="8533" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnJurisId"  type="hidden" name="hdnJurisId" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="status"></td>
            </tr>
        </table>

        <script src="frmMedication.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
    </form>
</body>
</html>