<%@ Page Language="c#" CodeFile="frmMedicationRequiredListing.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicationRequiredListing" %>
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
    <link href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet">
    <%=strDynamicThemes%>
    
</head>
<body class="masterfrm">
    <form id="Form1_Id" method="post" runat="server">
         <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <div id="tab0" style="display: inline">
            <table style="table-layout: fixed" cellspacing="0" cellpadding="0" width="100%">
                <colgroup>
                    <col width="5%" />
                    <col width="10%" />
                    <col width="26%" />
                    <col width="26%" />
                    <col width="20%" />
                    <col width="15%" />
                </colgroup>
                <tr>
                    <td></td>
                    <td>
                        <input id="hdnScreenId" type="hidden" value="8533" name="hdnScreenId" runat="server" /></td>
                    <td>
                        <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" /></td>
                    <td>
                        <input id="hdnVendorID" type="hidden" name="hdnVendorID" runat="server" />
                        <input id="hdnVendorCode" type="hidden" name="hdnVendorCode" runat="server" />
                        <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" /></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr height="5%">
                    <td></td>
                    <td></td>
                    <td></td>
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
                <tr height="5%">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td align="center">
                        <kpicc:kpilabel id="lblcurrenttime" runat="server" kpirepositoryid="0">Current Time</kpicc:kpilabel>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">&nbsp;&nbsp;</td>
                    <td colspan="2">
                        <table id="Table2" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <colgroup>
                                <col width="28%" />
                                <col width="72%" />
                            </colgroup>
                            <tr>
                                <td>
                                    <kpicc:kpilabel id="lblMinutesinadv" runat="server" kpirepositoryid="0">Minutes In Advance</kpicc:kpilabel>
                                </td>
                                <td>
                                    <kpicc:kpitextbox id="txtMinsinAdv" runat="server" kpirepositoryid="0" cssclass="textbox" maxlength="4"
                                        readonly="True" kpitabindex="557" kpisecurity="ACID" width="56%"></kpicc:kpitextbox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="td1currentDate" valign="middle" nowrap align="center" width="20%" bgcolor="#99ff66">
                        <kpicc:kpilabel id="Kpilabel2" runat="server" isbigsize="Yes" forecolor="#C04000" font-size="Large">12:00</kpicc:kpilabel>
                    </td>
                    <td></td>
                </tr>
                <tr height="5%">
                    <td></td>
                    <td align="right">&nbsp;</td>
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
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <table id="Table1" cellspacing="0" cellpadding="1" width="100%" border="0">
                            <colgroup>
                                <col width="16%" />
                                <col width="28%" />
                                <col width="28%" />
                                <col width="28%" />
                            </colgroup>
                            <tr>
                                <td></td>
                                <td>
                                    <kpicc:kpilabel id="lblbuilding" runat="server" kpirepositoryid="0">Building</kpicc:kpilabel>
                                </td>
                                <td>
                                    <kpicc:kpilabel id="lblPod" runat="server" kpirepositoryid="0">Pod</kpicc:kpilabel>
                                </td>
                                <td>
                                    <kpicc:kpilabel id="lblcellno" runat="server" kpirepositoryid="0">Cell#</kpicc:kpilabel>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <kpicc:kpilabel id="lblfilter" runat="server" kpirepositoryid="0">Filter</kpicc:kpilabel>
                                    &nbsp;</td>
                                <td>
                                    <kpicc:kpicodeddropdownlist id="cddBuilding" tabindex="510" runat="server" width="85%" kpisecurity="AC" kpitabindex="554"
                                        kpicodeid="3076" kpidisplayoption="Description" kpimandatory="Yes"></kpicc:kpicodeddropdownlist>
                                </td>
                                <td>
                                    <kpicc:kpicodeddropdownlist id="cddPod" tabindex="510" runat="server" width="85%" kpisecurity="AC" kpitabindex="554"
                                        kpicodeid="3076" kpidisplayoption="Description" kpimandatory="Yes"></kpicc:kpicodeddropdownlist>
                                </td>
                                <td>
                                    <kpicc:kpicodeddropdownlist id="cddCellno" tabindex="510" runat="server" width="85%" kpisecurity="AC" kpitabindex="554"
                                        kpicodeid="3076" kpidisplayoption="Description" kpimandatory="Yes"></kpicc:kpicodeddropdownlist>
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
                </tr>
                <tr style height="5%">
                    <td></td>
                    <td></td>
                    <td></td>
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
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <kpicc:kpicheckbox id="chkShowall" runat="server" kpisecurity="A" kpitabindex="504" text="Show All"></kpicc:kpicheckbox>
                    </td>
                    <td></td>
                    <td align="right">
                        <kpicc:kpiimagebutton id="imgAdd" tabindex="562" runat="server" kpisecurity="AC" kpitabindex="562" cssclass="menuItem" imageurl="/KPIImages/ico/AddData_Text.png" tooltip="Add"></kpicc:kpiimagebutton>
                        &nbsp;
							<kpicc:kpiimagebutton id="imgClear" tabindex="563" runat="server" kpisecurity="ACI" kpitabindex="563" imageurl="/KPIImages/ico/ClearData_Text.png"></kpicc:kpiimagebutton>
                        &nbsp;&nbsp;&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="3">
                       <kpicc:kpigrid id="grdMedreqlist" runat="server" kpirepositoryid="0" Width="100%" BorderStyle="None" kpisecurity="ACID" AutoGenerateColumns="false" EnableDataViewState="true" kpidefaultjurisalias="False" kpidisplaymessage="False" height="240px"> 
	                            <Columns>
		                            <igtbl:BoundDataField Key="time" Width="12%" DataFieldName="time" > <Header Text="Sch. Time" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="SPN" Width="8%" DataFieldName="SPN" > <Header Text="SPN" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="Name" Width="25%" DataFieldName="Name" > <Header Text="Name" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="Drug" Width="12%" DataFieldName="Drug" > <Header Text="Drug" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="Administered" Width="15%" DataFieldName="Administered" > <Header Text="Administered" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="PFNo" Width="10%" DataFieldName="PFNo" > <Header Text="PF#" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="Status" Width="13%" DataFieldName="Status" > <Header Text="Status" /> </igtbl:BoundDataField> 
		                            <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="TowEquipID" > <Header Text="KPIID" /> </igtbl:BoundDataField> 
		                            <igtbl:UnboundField Key="KPIMode" Hidden="True" > <Header Text="KPIMode" /> </igtbl:UnboundField> 
		                            <igtbl:BoundDataField Key="JurisID" Hidden="True" DataFieldName="JurisID" > <Header /></igtbl:BoundDataField> 
	                            </Columns> 
	                            <Behaviors>
                                  <igtbl:Activation Enabled="true" > </igtbl:Activation>
                                 <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                  <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                             </Behaviors>

                    </kpicc:kpigrid> 

                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        <script src="../KPIFrameWorkWeb/Scripts/Date.js?v=<%=DateTime.Today.ToString("yyyy.MM.dd")%> &ComittedDate=2016.07.28" type="text/javascript"></script>
    </form>
</body>
</html>