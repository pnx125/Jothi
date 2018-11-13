<%@ Page Language="c#" CodeFile="frmMedication.aspx.cs" AutoEventWireup="True"  Inherits="KPI.PhoenixWeb.Inmate.frmMedication" %>

<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.NavigationControls" TagPrefix="igtbar" %>
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
    <style type="text/css">
         input[type="checkbox"] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }

            .grdGColor {
              color: gray !important;
          }
            .grdBcolor{
                color:black !important;
            }
    </style>
</head>
<body class="masterfrm">
    <form id="frmMedication_Id" method="post" runat="server">
          <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

            <table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%; height:100%" >
                <colgroup>
                    <col style="width:3%" />
                    <col style="width:3%" />
                    <col style="width:38%" />
                    <col style="width:38%" />
                    <col style="width:16%" />
                    <col style="width:6%" />
                </colgroup>
           

                <tr>
                    <td class="SearchStatus" colspan="6" style="width: 100%;">
                        <table style="width: 100%; padding: 0; border-spacing: 0">
                            <colgroup>
                                <col style="width: 99%" />
                                <col style="width: 1%" />
                            </colgroup>
                            <tr>
                                <td>

                                    <input type="hidden" name="hdnPageHgt" id="hdnPageHgt" runat="server" /><input type="hidden" name="hdnMenu" id="hdnMenu" runat="server" />
                                    <kpicc:kpitoolbar id="tlbGridItem" tabindex="1000" runat="server" width="100%" textalign="Right" OnItemClick="tlbGridItem_ButtonClicked"> 
                                    <GroupSettings Orientation="Horizontal" Width="100%" />
                                    <ClientEvents ItemClick="srchTlb_Click"></ClientEvents>
                                    <Items>
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
                
                <tr><td colspan="5"></td><td>&nbsp;</td></tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td style="padding:0;border-spacing:0">
                    
                    </td>

                    <td style="text-align:right"><kpicc:kpilabel id="lblDate" runat="server" kpirepositoryid="0">Date&nbsp;</kpicc:kpilabel></td>
                    <td>
                          <kpicc:KPIDateChooser ID="dttmMedicationDate" runat="server" KPITabIndex="523" NullDateLabel="Birth Date" KPISecurity="N"></kpicc:KPIDateChooser>
                    </td>
                    <td></td>
                </tr>

                <tr>                 <td colspan="5"></td><td></td>                </tr>
                <tr>
                    
              
                    <td colspan="2" rowspan="2" style="text-align: right">
                        <table id="Table2" style="width: 100%; padding: 0; border-spacing: 0;">
                            <colgroup>
                                <col style="width: 100%" />
                            </colgroup>
                            <tr>
                                <td style="text-align: right;padding-top:14px">
                                    <kpicc:KPILabel ID="lblFilter" runat="server" KPIRepositoryID="0">Filter&nbsp;</kpicc:KPILabel></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                               <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="4" colspan="2" style="width:100%;padding:0;border-spacing:0;vertical-align:top">
                        <table id="Table1" style="width:100%;padding:0;border-spacing:0">
                            <colgroup>
                                
                                <col style="width:30%" />
                                <col style="width:35%" />
                                <col style="width:35%" />
                            </colgroup>
                            <tr>
                                <td class="req"><kpicc:kpilabel id="lblBuilding" runat="server" kpirepositoryid="0">Building</kpicc:kpilabel></td>
                                <td class="req"><kpicc:kpilabel id="lblPod" runat="server" kpirepositoryid="0">Pod</kpicc:kpilabel></td>
                                <td><kpicc:kpilabel id="lblCellNo" runat="server" kpirepositoryid="0">Cell#</kpicc:kpilabel></td>
                            </tr>
                            <tr>
                                
                                <td><kpicc:kpicodeddropdownlist id="cddBuilding" tabindex="510" runat="server" width="85%" kpitabindex="501" kpisecurity="AC" kpionchangehandler="" kpimandatory="Yes" kpidisplayoption="Description" kpicodeid="399"></kpicc:kpicodeddropdownlist></td>
                                <td><kpicc:kpicodedlookup id="luppod" runat="server" width="100%" kpitabindex="502" kpisecurity="AC" kpicodeid="402" kpiclientcallback="fn_PodFilter" kpimasterlookup="cddBuilding" kpiwidth="0" kpishowdescription="True" kpimode="Add"></kpicc:kpicodedlookup></td>
                                <td><kpicc:kpicodedlookup id="lupcell" runat="server" width="100%" kpitabindex="503" kpisecurity="AC" kpicodeid="403" kpiclientcallback="fn_CellFilter" kpimasterlookup="luppod" kpiwidth="0" kpishowdescription="True" kpimode="Add"></kpicc:kpicodedlookup></td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>
                            </tr>
                              <tr>
                                <td><kpicc:kpicheckbox id="chkShowall" runat="server" autopostback="false" kpitabindex="504" kpisecurity="A" text="&nbsp;Show All"></kpicc:kpicheckbox></td>
                                <td></td>
                                <td>
                                    <kpicc:KPIButton ID="btnInquiry" runat="server" KPISecurity="AC" Width="120px"  OnClick="btnInquiry_Click" OnClientClick="return fn_MEDPAssSearch()" KPITabIndex="505" CssClass="CustomBtn" Text="Search"></kpicc:KPIButton>

                                </td>
                                
                            </tr>
                        </table>
                    </td>
                    
                    <td rowspan="2"><kpicc:kpipanel id="KPITimer" runat="server" backcolor="Silver" width="100%" font-size="XX-Large" forecolor="Navy"></kpicc:kpipanel></td>
                    <td></td>
                </tr>
                
                <tr>
          
                  
                    
                    
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>                    
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr><td colspan="5"></td><td>&nbsp;</td></tr>
                       
                <tr style="vertical-align:top">
                    <td></td>
                  <td></td>
                    <td colspan="3">
                        <kpicc:KPIGrid ID="grdMedreqlist" runat="server" KPIRepositoryID="0" Width="100%" Height="450px" KPISecurity="ACID" 
                            KPIDisplayMessage="False" KPIDefaultJurisAlias="False" AutoGenerateColumns="false" EnableDataViewState="true" ShowFooter="false" DataKeyFields="JMMScheduleEventsID" OnInitializeRow="grdMedreqlist_InitializeRow" >
                            <ClientEvents Click="grdMedreqlist_DblClickHandler"  ></ClientEvents>
                            
                            <Columns>
                                <igtbl:BoundDataField Key="JMMScheduleEventsID" Hidden="true" DataFieldName="JMMScheduleEventsID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JurisID" Hidden="true" DataFieldName="JurisID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="StartTime" Width="13%" DataFieldName="StartTime" DataType="system.Date" DataFormatString="{0:HH:mm}" Header-Text="Schedule&lt;br&gt;Time"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="EndTime" DataFieldName="EndTime" Hidden="true"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="ScheduleStartDate" DataFieldName="ScheduleStartDate" Hidden="true"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="SPINNbr" Width="10%" DataFieldName="SPINNbr" Header-Text="SPN#"></igtbl:BoundDataField>

                                <igtbl:BoundDataField Key="FullName" Width="18%" DataFieldName="FullName" Header-Text="Name"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="DrugDesc" DataFieldName="DrugDesc" Header-Text="Drug" Width="15%"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Dosage" Hidden="false" DataFieldName="Dosage" Header-Text="Dosage" Width="15%"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="AdministeredDttm" DataFieldName="AdministeredDttm" Header-Text="Administered&lt;br&gt;Date/Time" Width="22%" DataFormatString="{0:MM/dd/yy HH:mm}"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="PFCode" Width="10%" DataFieldName="PFCode" Header-Text="PF"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Status" Width="12%" DataFieldName="Status" Header-Text="Status"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Dispense" Hidden="true" DataFieldName="Dispense" Header-Text="Dispense"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="MedicationType" Hidden="true" DataFieldName="MedicationType" Header-Text="MedicationType"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMBookingID" Hidden="true" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="OwnerSubAgencyID" Hidden="true" DataFieldName="OwnerSubAgencyID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="NameID" Hidden="true" DataFieldName="NameID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="SubAgencyName" Hidden="true" DataFieldName="SubAgencyName"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="CurQuantity" Hidden="true" DataFieldName="CurQuantity"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="RefillBal" Hidden="true" DataFieldName="RefillBal"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMPrescriptionSchduleID" Hidden="true" DataFieldName="JMPrescriptionSchduleID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Drug" Hidden="true" DataFieldName="Drug"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMMedPrescriptionID" Hidden="true" DataFieldName="JMMedPrescriptionID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="JMMedPrescriptionHistID" DataFieldName="JMMedPrescriptionHistID" Hidden="true"></igtbl:BoundDataField>
                                
                                <igtbl:BoundDataField Key="KPIID" Hidden="true" DataFieldName="JMPrescriptionSchduleID"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="Times" Hidden="true" DataFieldName="Times"></igtbl:BoundDataField>
                                <igtbl:BoundDataField Key="CBalance" Hidden="true" DataFieldName="CBalance"></igtbl:BoundDataField>

                            </Columns>
                            <Behaviors>
                                <igtbl:Activation Enabled="true"></igtbl:Activation>
                                <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                            </Behaviors>
                        </kpicc:KPIGrid>
                         <igtbl:WebExcelExporter ID="UltraWebGridExcelExporter1" runat="server"></igtbl:WebExcelExporter>

                    </td>
                    
                    <td></td>
                </tr>

                <tr>
                    <td> <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                        <input id="hdnScreenId" type="hidden" value="8533" name="hdnScreenId" runat="server" />
                        <input id="hdncurrenttime" type="hidden" name="hdncurrenttime" runat="server" />
                        <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                        <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />         
                        
                         
                       
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                   <td class="status" style="text-align: left; width: 100%; vertical-align: bottom;" colspan="6">
                        <kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral>
                    
                </td>
                </tr>
                <tr style="display:none">
                    <td style="display:none">
                        <kpicc:KPIButton ID="btnSearch" runat="server" KPISecurity="AC" Width="0px"  OnClick="btnInquiry_Click" CssClass="CustomBtn" Text="Search"></kpicc:KPIButton>               
                    </td>
                </tr>
         
            </table>
     
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.09.11" type="text/javascript"></script>
        <script src="frmMedication.js?v=2018.09.11" type="text/javascript"></script>
        
        
    </form>
</body>
</html>
