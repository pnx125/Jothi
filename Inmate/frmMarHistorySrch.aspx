<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMarHistorySrch.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMarHistorySrch" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtblexp" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="igtab" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.NavigationControls" TagPrefix="igtbar" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Src="UserControls/usrMedMarBasicSrch.ascx" TagPrefix="uc1" TagName="usrMedMarBasicSrch" %>



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
    <form id="frmMarHistorySrch_Id" runat="server">
         <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <div>
            <table style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 20%" />
                    <col style="width: 20%" />
                    <col style="width: 20%" />
                    <col style="width: 20%" />
                    <col style="width: 20%" />
                </colgroup>
                <tr>
                    <td class="SearchStatus" colspan="5" style="width: 100%">
                        <table style="width: 100%; padding: 0; border-spacing: 0">
                            <colgroup>
                                <col style="width: 99%" />
                                <col style="width: 1%" />
                            </colgroup>
                            <tr>
                                <td>
                                    <input type="hidden" name="hdnPageHgt" id="hdnPageHgt" runat="server" />
                                    <input type="hidden" name="hdnMenu" id="hdnMenu" runat="server" />
                                    <kpicc:KPIToolbar ID="tlbGridItem" TabIndex="1000" runat="server" Width="100%" OnItemClick="tlbGridItem_ItemClick">
                                        <GroupSettings Orientation="Horizontal" Width="100%" />
                                        <ClientEvents ItemClick="srchTlb_Click"></ClientEvents>
                                        <Items>
                                            <%--   <igtbar:DataMenuItem Key="AddNew" Value="AddNew" Text="Add New" ToolTip="Add New Item">
                                </igtbar:DataMenuItem>--%>
                                            <%--     <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>--%>
                                            <igtbar:DataMenuItem Key="Reset" Value="Reset" Text="Reset" ToolTip="Reset">
                                            </igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem Key="Back" Value="Back" Text="Back" ToolTip="Back To Search Parameter Screen">
                                            </igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem Key="Search" Value="Search" Text="Search" ToolTip="Search">
                                            </igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem Key="Print" Value="Print" ToolTip="Print" ImageUrl="/KPIImages/ico/16_print.gif">
                                            </igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem Key="Excel" Value="Excel" ToolTip="Export To Excel" ImageUrl="/KPIImages/ico/16_excel.gif">
                                            </igtbar:DataMenuItem>
                                            <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                        </Items>
                                    </kpicc:KPIToolbar>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <tr>
                    <td colspan="5">
                         <table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%; vertical-align: central">
                            <colgroup>
                                <col style="width: 2%" />
                                <col style="width: 96%" />
                                <col style="width: 2%" />
                            </colgroup>

                            <tr>
                                <td></td>
                                <td style="text-align: center">
                                    <kpicc:KPIPanel ID="pnlSearch" runat="server" Width="100%">
                                        <table id="Table5" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">
                                            <colgroup>
                                                <col style="width: 100%" />
                                            </colgroup>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <kpicc:KPITab ID="tabSuspSrch" runat="server" BackColor="Transparent" KPIRepositoryID="0" Width="100%" Height="350px" TabsOverflow="KeepSize">
                                                        <Tabs>
                                                            <igtab:ContentTabItem Key="BSC" Text="Basic">
                                                                <Template>
                                                                    <uc1:usrMedMarBasicSrch runat="server" id="usrMedMarBasicSrch" />
                                                                </Template>
                                                            </igtab:ContentTabItem>
                                                        
                                                        </Tabs>
                                                    </kpicc:KPITab>
                                                </td>
                                            </tr>
                                        </table>
                                    </kpicc:KPIPanel>
                                </td>
                                <td></td>
                            </tr>
                        </table>

                    </td>
            
                  <%--  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                        </tr>--%>
                    <tr>
                    <td colspan="5">

                        <table id="Table4" style="table-layout: fixed; width: 100%;">
                            <tr>
                                <td style="text-align: center">
                                    <kpicc:KPIPanel ID="pnlSearchResults" runat="server" Width="100%"
                                        Visible="False" HorizontalAlign="Center">
                                        <table id="Table6" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">

                                            <tr>
                                                <td>

                                                    <kpicc:KPIGrid ID="grdMarhistory" runat="server" Height="600px" IsInquiryScreen="True" KPICustomPaging="True" KPIDefaultJurisAlias="False" KPIRepositoryID="0"
                                                        AutoGenerateColumns="false" EnableDataViewState="true" KPIEnableClientSort="true" BorderStyle="None" DataKeyFields="JMMedPrescriptionHistID"
                                                        KPISecurity="I" OnInitializeRow="grdMarhistory_InitializeRow" Width="100%">
                                                        <ClientEvents Click="grdMarhistory_DblClickHandler" />
                                                        <Columns>

                                                            <igtblexp:UnboundField Key="KPIJurisAlias" Hidden="True" Width="5%"><Header Text="Juris" /></igtblexp:UnboundField>
                                                            <igtblexp:BoundDataField Key="KPIJurisID" Hidden="True" DataFieldName="JurisID"><Header Text="JurisID" /></igtblexp:BoundDataField>

                                                            <igtblexp:BoundDataField key="SubAgencyCode" Hidden="true"  datafieldname="SubAgencyCode" ><Header Text="SA" Tooltip="Sub-Agency" /></igtblexp:BoundDataField>

                                                            <igtblexp:BoundDataField Key="Drug" Hidden="True" DataFieldName="Drug"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="DrugPrescription" width="15%" DataFieldName="DrugPrescription" Header-Text="Medication Name" ></igtblexp:BoundDataField>
                                                            
                                                            <igtblexp:BoundDataField Key="JMMedPrescriptionHistID" Hidden="True" DataFieldName="JMMedPrescriptionHistID"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="JMBookingID" Hidden="True" DataFieldName="JMBookingID"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="Dosage"  DataFieldName="Dosage" Header-Text="Dosage"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="Dispense" Hidden="True" DataFieldName="Dispense"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="DispenseDesc" DataFieldName="DispenseDesc" Header-Text="Dispense"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="DispenseType" Hidden="True" DataFieldName="DispenseType"></igtblexp:BoundDataField>
                                                            
                                                            <igtblexp:BoundDataField Key="LastAdministeredDttm"  DataFieldName="LastAdministeredDttm" Header-Text="Date/Time Administered" DataFormatString="{0:MM/dd/yy HH:mm}"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="MethodAdministered" Hidden="True" DataFieldName="MethodAdministered"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="PFCode" width="10%" DataFieldName="PFCode" Header-Text="PF#"></igtblexp:BoundDataField>

                                                            <igtblexp:BoundDataField Key="Status"  Hidden="True" DataFieldName="Status"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="StatusDesc"  DataFieldName="StatusDesc" Header-Text="Status"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="SPINNbr" width="10%" DataFieldName="SPINNbr" Header-Text="SPN"></igtblexp:BoundDataField>
                                                            
                                                            <igtblexp:BoundDataField Key="OfficerName" Hidden="True" DataFieldName="OfficerName"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMedPrescriptionHistID"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="JMMScheduleEventsID" Hidden="True" DataFieldName="JMMScheduleEventsID"></igtblexp:BoundDataField>
                                                            
                                                            <igtblexp:BoundDataField Key="NameID" Hidden="True" DataFieldName="NameID"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField Key="FullName" width="20%" DataFieldName="FullName" Header-Text="Inmate Name"></igtblexp:BoundDataField>
                                                            <igtblexp:BoundDataField key="SubAgencyName" Hidden="true" datafieldname="SubAgencyName" />
                                                        </Columns>
                                                        <Behaviors>
                                                            <igtblexp:activation enabled="true"></igtblexp:activation>
                                                            <igtblexp:selection rowselecttype="Single" enabled="true" cellclickaction="Row" />
                                                            <igtblexp:rowselectors rownumbering="false" enabled="false" />
                                                            <igtblexp:editingcore autocrud="False" enabled="true" batchupdating="true">
                                                               
                                                            </igtblexp:editingcore>
                                                            <igtblexp:paging>
                                                                <PagerTemplate>
                                                                    <asp:LinkButton ID="lnkbtnPrev" runat="server" OnClick="_lnkbtnPrev_Click" Style="margin-top: -4px;"
                                                                                Text="PREV" CssClass="igg_GridPager"  />
                                                                    &nbsp;&nbsp;
                                                                    <asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="_lnkbtnNext_Click" Style="margin-top: -4px;"
                                                                            Text="NEXT" CssClass="igg_GridPager" />
                                                                </PagerTemplate>
                                                            </igtblexp:paging>
                                                        </Behaviors>
                                                    </kpicc:KPIGrid>
                                                </td>
                                            </tr>
                                        </table>
                                    </kpicc:KPIPanel>
                                </td>
                            </tr>
                        </table>

                    </td>
                    
                    <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>

                        <input id="hdnScreenId" type="hidden" value="8553" name="hdnScreenId" runat="server" />
                        <input id="hdnMode" type="hidden" value="INQ" name="hdnMode" runat="server" />
                        <input id="hdnJurisSubAgencyID" type="hidden"  name="hdnJurisSubAgencyID" runat="server" />
                        <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                        <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />
                        <input id="hdnSubAgencyParam" type="hidden" name="hdnSubAgencyParam" runat="server" />


                    </td>
                    </table>
        </div>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.09.11" type="text/javascript"></script>
        <script src="frmMarHistorySrch.js?v=2018.09.11" type="text/javascript"></script>
    </form>
</body>
</html>
