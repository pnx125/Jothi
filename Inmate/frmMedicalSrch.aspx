<%@ Page Language="c#" CodeFile="frmMedicalSrch.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicalSrch" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtblexp" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="igtab" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.NavigationControls" TagPrefix="igtbar" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="uc1" TagName="usrMedicalBasicSrch" Src="UserControls/usrMedicalBasicSrch.ascx" %>


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

      <style>    
        .grdAllergy_row_color {
            color: gray;
        } 

        .grdDrugs_row_color{
            color:red;
        }
    </style>
</head>
<body class="masterfrm"  style="overflow-y: hidden;">
    <script src="../KPIFrameworkWeb/Scripts/Tooltip.js?v=2016.12.20" type="text/javascript"></script>
    <form id="frmMedicalSrch_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

            <table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">
                <colgroup>
                    <col style="width: 2%" />
                    <col style="width: 60%" />
                    <col style="width: 35%" />
                    <col style="width: 3%" />
                </colgroup>
                <tbody>


                    <tr>
                        <td class="SearchStatus" colspan="4" style="width: 100%">
                            <table style="width: 100%; padding: 0; border-spacing: 0">
                                <colgroup>
                                    <col style="width: 99%" />
                                    <col style="width: 1%" />
                                </colgroup>
                                <tr>
                                    <td>
                                        <input type="hidden" name="hdnPageHgt" id="hdnPageHgt" runat="server" /><input type="hidden" name="hdnMenu" id="hdnMenu" runat="server" />
                                        <kpicc:kpitoolbar id="tlbGridItem" tabindex="800" runat="server" textalign="Right" kpirepositoryid="0" width="100%" onitemclick="tlbGridItem_ButtonClicked">  
                                            <GroupSettings Orientation="Horizontal" Width="100%"  />
                                            <ClientEvents ItemClick="srchTlb_Click"></ClientEvents>
                                            <Items>
                                                <igtbar:DataMenuItem  Key="Reset"  Value="Reset"  Text="Reset"  ToolTip="Reset"></igtbar:DataMenuItem>
                                                <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                                <igtbar:DataMenuItem  Key="Back"  Value="Back" Text="Back"  ToolTip="Back to Search"></igtbar:DataMenuItem>
                                                <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
                                                <igtbar:DataMenuItem  Key="Search"  Value="Search"  Text="Search"  ToolTip="Search"></igtbar:DataMenuItem>
                                                <igtbar:DataMenuItem IsSeparator="true"></igtbar:DataMenuItem>
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
                        <td colspan="4">
                              <kpicc:kpipanel id="pnlSearch" runat="server">
                            <table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%; vertical-align: central;overflow-y:auto">
                                <colgroup>
                                    <col style="width: 2%" />
                                    <col style="width: 96%" />
                                    <col style="width: 2%" />
                                </colgroup>

                                <tr>
                                    <td></td>
                                    <td style="text-align: center">
                                      
                                               <table id="Table5" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">
                                            <colgroup>
                                                <col style="width: 100%" />
                                            </colgroup>
                                                   <tr>
                                                       <td>&nbsp;</td>
                                                   </tr>
                                                   <tr>
                                                        <td style="text-align: center">
                                                            <kpicc:KPITab id="tabMedSrch" runat="server" BackColor="Transparent"  Width="100%" Height="100%" ThreeDEffect="False" TabsOverflow="KeepSize"> 
                                                                    <Tabs>
                                                                        <igtab:ContentTabItem Key="BSC" Text="Basic">
                                                                            <Template><uc1:usrMedicalBasicSrch id="UsrMedicalBasicSrch2" runat="server"></uc1:usrMedicalBasicSrch></Template>
                                                                        </igtab:ContentTabItem>                                                                 

                                                                    </Tabs>
                                                                 <ClientEvents SelectedIndexChanged="tabMedSrch_AfterSelectedTabChange"></ClientEvents>
																</kpicc:KPITab>
                                                        </td>
                                                   </tr>
                                                   </table>
                                            
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                          </kpicc:kpipanel>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <input id="hdnNameType" type="hidden" value="MNI" name="hdnNameType" runat="server" />
                            <input id="hdnScreenId" type="hidden" value="8531" name="hdnScreenId" runat="server" />
                            <input id="hdnCaller" type="hidden" name="hdnCaller" runat="server" />
                            <input id="hdnReportID" type="hidden" name="hdnReportID" runat="server" />
                            <input id="hdnIncidentID" type="hidden" name="hdnIncidentID" runat="server" />
                            <input id="hdnCtrlName" type="hidden" name="hdnCtrlName" runat="server" />
                            <input id="hdnChkSearch" type="hidden" name="hdnChkSearch" runat="server" />
                            <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />
                            <input id="rptHidden" type="hidden" name="rptHidden" runat="server" />
                            <input id="hdnNewFirstName" type="hidden" name="hdnNewFirstName" runat="server" />
                            <input id="hdnSrchCount" type="hidden" name="hdnSrchCount" runat="server" />
                            <input id="hdnAssocNameID" type="hidden" name="hdnAssocNameID" runat="server" />
                            <input id="hdnNewLastName" type="hidden" name="hdnNewLastName" runat="server" />
                            <input id="hdnMode" type="hidden" value="INQ" name="hdnMode" runat="server" />
                            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                            <input id="hdnCopyNameID" type="hidden" name="hdnJurisId" runat="server" />
                            <input id="hdnCopyNameType" type="hidden" name="hdnCopyNameType" runat="server" />
                            <input id="hdnBack" type="hidden" name="hdnBack" runat="server" />
                            <input id="hdnIsRptColVisible" type="hidden" name="hdnIsRptColVisible" runat="server" />
                            <input id="hdnSubAgencyParam" type="hidden" name="hdnSubAgencyParam" runat="server" />
                            <input id="hdnJurisSubAgencyID" type="hidden" name="hdnJurisSubAgencyID" runat="server" />
                            <input id="hdnSearchFilter" type="hidden" name="hdnSearchFilter" runat="server" />
                        </td>
                    </tr>


                    <tr>
                        <td colspan="4">
                           <kpicc:kpipanel id="pnlSearchResults" runat="server" visible="False" Height="100%" >
                                               <table id="Table6" style="padding: 0; border-spacing: 0; width: 100%;overflow-y:auto">
                                                     <colgroup><col style=" width:100%;"  /></colgroup>
                                                   <tr>
                                                       <td style="overflow-y:auto">

                                                              <kpicc:KPIHGrid ID="grdMedicalHist" runat="server" KPISecurity="AC" width="100%" InitialDataBindDepth="-1" EnableDataViewState="true" ShowHeader="true" ShowFooter="false"
                                                                  KPICustomPaging="True" kpirepositoryid="8000" KPIDefaultJurisAlias="False" datakeyfields="JMMedicalHistID" AutoGenerateBands="false" Height="100%"
                                                                  DataMember="SuperMaster" autogeneratecolumns="false" stylesetname="HGrid" OnInitializeRow="grdMedicalHist_InitializeRow" borderstyle="none" isinquiryscreen="true"  >
                                                                    <ClientEvents Click="grdMedicalHist_CellClickHandler"></ClientEvents>
                                                                          <Columns>
                                                                              <igtblexp:UnboundField Hidden="True" Key="KPIJurisAlias" Header-Text="Juris"  />
                                                                              <igtblexp:BoundDataField key="SubAgencyCode" Hidden="true"  datafieldname="SubAgencyCode" >
                                                                                  <Header Text="SA" Tooltip="Sub-Agency" />
                                                                              </igtblexp:BoundDataField>
                                                                              <igtblexp:BoundDataField key="SPINNbr" Width="10%" Hidden="false"  Header-Text="SPN#" datafieldname="SPINNbr" />
                                                                              <igtblexp:BoundDataField key="JMBookingNo" Width="10%"  Header-Text="CMS Booking#" datafieldname="JMBookingNo" />
                                                                              <igtblexp:BoundDataField key="FullName" Width="35%" Hidden="false"  Header-Text="Name" datafieldname="FullName" />
                                                                              <igtblexp:BoundDataField key="PrimaryDoctor" Width="25%" Hidden="false"  Header-Text="Primary Doctor" datafieldname="PrimaryDoctor" />
                                                                              <igtblexp:BoundDataField key="DentistDoctor" Hidden="false"  Header-Text="Primary Dentist" datafieldname="DentistDoctor" />
                                                                              <igtblexp:BoundDataField key="JMMedicalHistID" Hidden="true"  datafieldname="JMMedicalHistID" />
                                                                              <igtblexp:BoundDataField key="KPIJurisID" Hidden="true"  datafieldname="JurisID" />
                                                                              <igtblexp:BoundDataField key="JMBookingID" Hidden="true"  datafieldname="JMBookingID" />
                                                                              <igtblexp:BoundDataField key="NameID" Hidden="true"  datafieldname="NameID" />
                                                                              <igtblexp:BoundDataField key="PrimeDentistID" Hidden="true"  datafieldname="PrimeDentistID" />
                                                                              <igtblexp:BoundDataField key="PrimeDoctorID" Hidden="true"  datafieldname="PrimeDoctorID" />
                                                                              <igtblexp:BoundDataField key="Diagnosis" Hidden="true"  datafieldname="Diagnosis" />
                                                                              <igtblexp:BoundDataField key="TBResult" Hidden="true"  datafieldname="TBResult" />
                                                                              <igtblexp:BoundDataField key="DentalProcedure" Hidden="true"  datafieldname="DentalProcedure" />
                                                                              <igtblexp:BoundDataField key="SpecialMeal" Hidden="true"  datafieldname="SpecialMeal" />
                                                                              <igtblexp:BoundDataField key="Flags" Hidden="true"  datafieldname="Flags" />
                                                                              <igtblexp:BoundDataField key="Allergy" Hidden="true"  datafieldname="Allergy" />
                                                                              <igtblexp:BoundDataField key="MedicalFacility" Hidden="true"  datafieldname="MedicalFacility" />
                                                                              <igtblexp:BoundDataField key="Drugs" Hidden="true"  datafieldname="Drugs" />
                                                                              <igtblexp:BoundDataField key="SubAgencyName" Hidden="true" datafieldname="SubAgencyName" />

                                                                          </Columns>
                                                                  <Behaviors>
                                                                      <igtblexp:Activation Enabled="true"></igtblexp:Activation>
                                                                      <igtblexp:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" CellSelectType="None"></igtblexp:Selection>
                                                                      <igtblexp:RowSelectors RowNumbering="false" Enabled="false"></igtblexp:RowSelectors>
                                                                  </Behaviors> 
                                                                     <Bands>
                                                                    <igtblexp:Band DataMember="Parent" ShowHeader="false" AutoGenerateColumns="false" Width="100%" DataKeyFields="JMMedicalHistID,MasterColumn">        
                                                                         <Columns>


                                                                              <igtblexp:BoundDataField key="SerialNo" Hidden="true"  datafieldname="SerialNo" />
                                                                              <igtblexp:BoundDataField key="ParentTable"  Hidden="true"  datafieldname="ParentTable" />
                                                                              <igtblexp:BoundDataField key="MasterColumn" Width="100%" datafieldname="MasterColumn" />                                                                              
                                                                              <igtblexp:BoundDataField key="JMMedicalHistID" Hidden="true"  datafieldname="JMMedicalHistID" />
                                                                              <igtblexp:BoundDataField key="JMBookingID" Hidden="true"  datafieldname="JMBookingID" />
                                                                              <igtblexp:BoundDataField key="JurisID" Hidden="true"  datafieldname="JurisID" />
                                                                             <%--<igtblexp:BoundDataField key="DentistDoctor" Width="25%" Hidden="false"  Header-Text="DentistDoctor" datafieldname="DentistDoctor" />--%>
                                                                         </Columns>
                                                                        <Bands>
                                                                            <igtblexp:Band DataMember="Child" AutoGenerateColumns="false" Width="100%" DataKeyFields="SerialNo,JMMedicalHistID,MasterColumn">   
                                                                                <Columns>
                                                                                    <igtblexp:BoundDataField DataFieldName="VisitDttm" Key="VisitDttm" Header-Text="VisitDttm" Width="10%"  DataFormatString="{0:MM/dd/yyyy HH:mm}"/>
                                                                                    <igtblexp:BoundDataField   Key="MedicalVisitNo" Header-Text="Medical#" Width="10%"/>
                                                                                <%--    <igtblexp:UnboundField Key="MedicalNo" Header-Text="Medical#" Width="10%" />--%>
                                                                                    <igtblexp:BoundDataField   Key="Description" Header-Text="Description" Width="80%"/>
                                                                                    <igtblexp:BoundDataField DataFieldName="JMMedVisitID" Key="JMMedVisitID" Hidden="true"/>
                                                                                    <igtblexp:BoundDataField DataFieldName="SerialNo" Key="SerialNo" Hidden="true"   />  
                                                                                    <igtblexp:BoundDataField DataFieldName="Child" Key="Child" Header-Text="Child" Hidden="true"/>
                                                                                    <igtblexp:BoundDataField DataFieldName="MasterColumn" Key="MasterColumn" hidden="true"/>
                                                                                    <igtblexp:BoundDataField DataFieldName="JMMedicalHistID" Key="JMMedicalHistID" Hidden="true"/>
                                                                                    <igtblexp:BoundDataField DataFieldName="JMBookingID" Key="JMBookingID" Hidden="true"/>                                                                                    
                                                                                    <igtblexp:BoundDataField DataFieldName="JurisID" Key="JurisID" Hidden="true"/>                                                                                   
                                                                                    <igtblexp:BoundDataField DataFieldName="Sno" Key="Sno" Hidden="true"/>
                                                                                    <igtblexp:BoundDataField DataFieldName="IsActive" Key="IsActive" Hidden="true"/>

                                                                                </Columns>
                                                                            </igtblexp:Band>
                                                                        </Bands>
                                                                        <Behaviors>
                                                                            <igtblexp:EditingCore AutoCRUD="false" Enabled="true" BatchUpdating="true">
                                                                                <Behaviors><igtblexp:CellEditing Enabled="false"></igtblexp:CellEditing></Behaviors>
                                                                            </igtblexp:EditingCore>
                                                                        </Behaviors>
                                                                    </igtblexp:Band>
                                                                     </Bands>
                                                              </kpicc:KPIHGrid>


                                                        <%--       </ContentTemplate>
                                                           </asp:UpdatePanel>--%>
                          


                                                       </td>
                                                   </tr>
                                                   <tr>
                                                        <td class="statusBar" style="text-align: left; vertical-align: top" >&nbsp;</td>
                                                   </tr>
                                               </table>
                                              </kpicc:kpipanel>
                                        <igtblexp:WebExcelExporter ID="UltraWebGridExcelExporter1" runat="server" ></igtblexp:WebExcelExporter>
                        </td>
                    </tr>
                </tbody>
            </table>
          
				


        <script src="../KPIFrameworkWeb/Scripts/Date.js??v=2018.07.26" type="text/javascript"></script>
        <script src="frmMedicalSrch.js??v=2018.07.26" type="text/javascript"></script>
    </form>
</body>
</html>
