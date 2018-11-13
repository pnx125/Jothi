<%@ Page Language="c#" CodeFile="frmDoctorSrch.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmDoctorSrch" %>

<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.NavigationControls" TagPrefix="igtbar" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtblexp" %>
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
    
    <style type="text/css">
        .RedColor{
            color:red;
        }
        input[type="checkbox"] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmDoctorSrch_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table id="Table1" style="table-layout: fixed; left: 0px; top: 0px; width: 100%; padding: 0; border-spacing: 0;">
            <tr>
                <td align="center">
                    <table id="Table2" style="table-layout: fixed" cellspacing="0" cellpadding="0" width="96%">
                        <colgroup>
                            <col width="1%" />
                            <col width="100%" />
                        </colgroup>
                        <tr>
                            <td colspan="4">
                                <input type="hidden" id="hdnPageHgt" runat="server" name="hdnPageHgt" /></td>
                        </tr>
                        <tr>
                            <td class="n" style="height: 79px" colspan="4">
                                <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                                    <tr>
                                        <td style="width: 89px" align="right" colspan="1" rowspan="1" class="req">
                                            <kpicc:kpilabel id="lblJuris" runat="server" kpirepositoryid="0" kpisecurity="I"> Juris</kpicc:kpilabel>
                                            &nbsp;</td>
                                        <td style="width: 274px">
                                            <kpicc:kpijurisdropdownlist id="lstJuris" runat="server" kpisecurity="ACI" kpimode="Search" width="100%" kpitabindex="501"></kpicc:kpijurisdropdownlist>
                                        </td>
                                        <td style="width: 206px">
                                            <input id="hdnJurisId" style="width: 32px; height: 22px" type="hidden" name="hdnJurisId" runat="server" /><input id="hdnMode" style="width: 32px; height: 22px" type="hidden" value="ADD" name="hdnMode" runat="server" /><input id="hdnScreenId" style="width: 32px; height: 22px" type="hidden" value="8539" name="hdnScreenId" runat="server" /><input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" /></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 89px; height: 25px" align="right">
                                            <kpicc:kpilabel id="lblName" runat="server" kpirepositoryid="0">Name</kpicc:kpilabel>
                                            &nbsp;</td>
                                        <td style="width: 274px; height: 25px">
                                            <kpicc:kpitextbox id="txtName" onkeydown="return AlphabetValidation(this,'aa1')" runat="server" kpirepositoryid="0"
                                                kpisecurity="ACI" width="100%" kpitabindex="502" maxlength="8" cssclass="textbox" onchange=" doChangeCaps(this)"></kpicc:kpitextbox>
                                        </td>
                                        <td style="width: 206px; height: 25px" align="right">
                                            <kpicc:kpilabel id="lblLocation" runat="server" kpirepositoryid="0">Location</kpicc:kpilabel>
                                            &nbsp;</td>
                                        <td style="height: 25px" align="right">
                                            <kpicc:kpitextbox id="txtLocation" onkeydown="return AlphabetValidation(this,'aa1')" runat="server"
                                                kpirepositoryid="0" kpisecurity="ACI" width="100%" kpitabindex="502" maxlength="8" cssclass="textbox" onchange=" doChangeCaps(this)"></kpicc:kpitextbox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 89px" align="right">&nbsp;</td>
                                        <td style="width: 274px">
                                            <kpicc:kpicheckbox id="chkIsActive" runat="server" kpisecurity="ACI" kpitabindex="504" text="Include Inactive"></kpicc:kpicheckbox>
                                        </td>
                                        <td align="center">&nbsp;&nbsp;&nbsp;</td>
                                        <td align="right">
                                            <kpicc:kpibutton id="cmdSearch" runat="server" kpirepositoryid="-1" kpisecurity="ACI" width="70px" kpitabindex="506" cssclass="CustomBtn" text="Search" onclick="cmdSearch_Click"></kpicc:kpibutton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="n" colspan="4" height="10"></td>
                        </tr>
                        <tr>
                            <td class="SearchStatus" colspan="4" style="width: 100%">
                                <table style="width: 100%; padding: 0; border-spacing: 0">
                                    <colgroup>
                                        <col style="width: 99%" />
                                        <col style="width: 1%" />
                                    </colgroup>
                                    <tr>
                                        <td>

                                            <kpicc:kpitoolbar id="tlbGridItem" tabindex="1000" runat="server" width="100%" onitemclick="tlbGridItem_ButtonClicked">  
                                    <GroupSettings Orientation="Horizontal" Width="100%"/>
                                    <ClientEvents ItemClick="tlbGridItem_Click"></ClientEvents>
                                    <Items>
                                        <igtbar:DataMenuItem  Key="AddNew"  Value="AddNew"  Text="Add New"  ToolTip="Add New Item"></igtbar:DataMenuItem>
                                         <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                        <igtbar:DataMenuItem  Key="Print"  Value="Print" ToolTip="Print" ImageUrl="/KPIImages/ico/16_print.gif"></igtbar:DataMenuItem>
                                         <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                        <igtbar:DataMenuItem  Key="Excel"  Value="Excel" ToolTip="Export to Excel" ImageUrl="/KPIImages/ico/16_excel.gif"></igtbar:DataMenuItem>
                                         <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                    </Items>
                                </kpicc:kpitoolbar>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="100%" colspan="4">
                                <kpicc:kpigrid id="grdDoctorSrch" runat="server" kpisecurity="I" width="100%" isinquiryscreen="True" kpicustompaging="True" kpidefaultjurisalias="False" kpirepositoryid="0" borderstyle="None"
                                    autogeneratecolumns="false" enabledataviewstate="true" height="465px" oninitializerow="grdDoctorSrch_InitializeRow" kpienableclientsort="true"> 
                                    <ClientEvents Click="grdDoctorSrch_DblClickHandler"> </ClientEvents> 
                                    <Columns>
                                        <igtblexp:BoundDataField Key="KPIJurisAlias" Width="5%" Hidden="True" DataFieldName="KPIJurisAlias" > <Header Text="Juris" /> </igtblexp:BoundDataField> 
                                        <igtblexp:BoundDataField Key="KPIJurisID" Hidden="True" DataFieldName="JurisID" > <Header Text="JurisID" /> </igtblexp:BoundDataField> 
                                        <igtblexp:BoundDataField Key="DoctorName" Width="25%" DataFieldName="DoctorName" > <Header Text="Doctor Name" /> </igtblexp:BoundDataField> 
                                        <igtblexp:BoundDataField Key="Location" Width="30%" DataFieldName="Location" > <Header Text="Location" /> </igtblexp:BoundDataField> 
                                        <igtblexp:BoundDataField Key="PhoneNbr" Width="20%" DataFieldName="PhoneNbr" > <Header Text="Phone#" /> </igtblexp:BoundDataField> 
                                        <igtblexp:BoundCheckBoxField Key="Dentist" Width="10%" DataFieldName="IsDental" > <Header Text="Dentist" /> </igtblexp:BoundCheckBoxField> 
                                        <igtblexp:BoundCheckBoxField Key="Inactive" Width="10%" DataFieldName="IsActive" > <Header Text="Inactive" /> </igtblexp:BoundCheckBoxField> 
                                        <igtblexp:BoundDataField Key="DoctorID" Hidden="True" DataFieldName="DoctorID" > <Header /></igtblexp:BoundDataField> 
                                    </Columns> 
                                    <Behaviors>
                                        <igtblexp:Activation Enabled="true" > </igtblexp:Activation>
                                        <igtblexp:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                        <igtblexp:RowSelectors RowNumbering="false" Enabled="false" />
                                            <igtblexp:EditingCore AutoCRUD="False" Enabled="true" BatchUpdating="true">
                                                              
                                                                <Behaviors>
                                                                    <igtblexp:CellEditing Enabled="false">                                                                           
                                                                                                                                         
                                                                    </igtblexp:CellEditing>
                                                                </Behaviors>
                                                            </igtblexp:EditingCore>
                                        <igtblexp:Paging>
                                            <PagerTemplate>
                                                <asp:LinkButton ID="lnkbtnPrev" runat="server" OnClick="grdDoctorSrch_lnkbtnPrev_Click" style="margin-top:-4px;"  Text="PREV" CssClass="igg_GridPager" />&nbsp;&nbsp;
                                                <asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="grdDoctorSrch_lnkbtnNext_Click" style="margin-top:-4px;"  Text="NEXT" CssClass="igg_GridPager" /> 
                                            </PagerTemplate>
                                        </igtblexp:Paging>
                                    </Behaviors>
                                </kpicc:kpigrid>
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" colspan="4">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2017.06.16" type="text/javascript"></script>
        <script src="frmDoctorSrch.js?v=2017.06.16" type="text/javascript"></script>   
    </form>
</body>
</html>
