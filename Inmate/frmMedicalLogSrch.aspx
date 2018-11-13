<%@ Page Language="c#" CodeFile="frmMedicalLogSrch.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicalLogSrch" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtblexp1" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="igtab" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.NavigationControls" TagPrefix="igtbar" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="uc1" TagName="usrMedLogBasicSrch" Src="UserControls/usrMedLogBasicSrch.ascx" %>

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
    <script src="../KPIFrameworkWeb/Scripts/Tooltip.js?v=2016.12.20" type="text/javascript"></script>
    <form id="frmMedicalLogSrch_Id" method="post" runat="server">
        <div class="tab" id="tab0" style="display: inline">
            <table id="Table3" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">
                <colgroup>
                    <col style="width: 1%" />
                    <col style="width: 60%" />
                    <col style="width: 35%" />
                    <col style="width: 3%" />
                </colgroup>
                <tbody>

                    <tr>
                        <td colspan="4" style="width: 100%" class="SearchStatus">
                            <table style="width: 100%; padding: 0; border-spacing: 0">
                                <colgroup>
                                    <col style="width: 99%" />
                                    <col style="width: 1%" />
                                </colgroup>
                                <tr>
                                    <td>
                                        <input type="hidden" name="hdnPageHgt" id="hdnPageHgt" runat="server" /><input type="hidden" name="hdnMenu" id="hdnMenu" runat="server" />
                                        <kpicc:kpitoolbar id="tlbGridItem" tabindex="1000" runat="server" kpirepositoryid="0" width="100%" onitemclick="tlbGridItem_ButtonClicked">  
                                           <GroupSettings Orientation="Horizontal"  Width="100%" />
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
                            <table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%; vertical-align: central">
                                <colgroup>
                                    <col style="width: 2%" />
                                    <col style="width: 96%" />
                                    <col style="width: 2%" />
                                </colgroup>
                                <tr>
                                    <td></td>
                                    <td>
                                        <kpicc:kpipanel id="pnlSearch" runat="server">
                                             <table id="Table5" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">
                                            <colgroup>
                                                <col style="width: 100%" />
                                            </colgroup>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>

                                                 <tr>
                                                      <td style="text-align: center">
                                                          <kpicc:KPITab id="tabMedLogSrch" runat="server" BackColor="Transparent" KPIRepositoryID="0"  Width="100%" ThreeDEffect="False" Height="100%" TabsOverflow="KeepSize" >
                                                                    <ClientEvents SelectedIndexChanged="tabMedLogSrch_AfterSelectedTabChange"></ClientEvents>
                                                                    <Tabs>
                                                                        <igtab:ContentTabItem Key="BSC" Text="Basic">
                                                                            <Template><uc1:usrMedLogBasicSrch id="UsrMedLogBasicSrch1" runat="server"></uc1:usrMedLogBasicSrch></Template>
                                                                        </igtab:ContentTabItem>
                                                                    </Tabs>
																	
                                                                </kpicc:KPITab>
                                                      </td>
                                                 </tr>
                                                 </table>

                                        </kpicc:kpipanel>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td align="center" colspan="4">

                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                <colgroup>
                                                    <col width="1%" />
                                                    <col width="30%" />
                                                    <col width="30%" />
                                                    <col width="30%" />
                                                    <col width="5%" />
                                                </colgroup>
                                                <tr>
                                                    <td></td>
                                                    <td align="right" colspan="4"></td>
                                                </tr>
                                                <tr height="15%">
                                                    <td></td>
                                                    <td>&nbsp;
                                                    </td>
                                                    <td align="right">&nbsp;</td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td colspan="4"></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="5"></td>
                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input id="hdnNameType" type="hidden" value="MNI" name="hdnNameType" runat="server" />
                            <input id="hdnScreenId" type="hidden" value="8536" name="hdnScreenId" runat="server" />
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
                            <input id="hdnIsRptColVisible" type="hidden" name="hdnIsRptColVisible" runat="server" /></td>
                    </tr>
                </tbody>
            </table>
            <kpicc:kpipanel id="pnlSearchResults" runat="server">
					<TABLE cellSpacing="0" cellPadding="0" width="100%">
					
						<TR>
							<TD colSpan="5">
								<kpicc:kpigrid id="grdMedLog" runat="server" KPIRepositoryID="0" Height="554px" width="100%" UseAccessibleHeader="False" KPIDefaultJurisAlias="False" KPICustomPaging="True" KPISecurity="ACID" oninitializerow="grdMedLog_InitializeRow" onpageindexchanged="grdMedLog_PageIndexChanged" > 
                                <ClientEvents DblClickHandler="grdMedLog_DblClickHandler"> 
                                </ClientEvents> 
	                                <Columns>
		                                <igtblexp1:BoundDataField Key="KPIJurisAlias" Width="5%" Hidden="True" DataFieldName="KPIJurisAlias" > <Header Text="Juris" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="KPIJurisID" Hidden="True" DataFieldName="JurisID" > <Header Text="" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="InmateName" Width="20%" DataFieldName="InmateName" > <Header Text="Name" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="MedDateTime" Width="15%" DataFieldName="MedDateTime" > <Header Text="Date/Time" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="ACTIVITYDTTM" Width="17%" Hidden="True" DataFieldName="ACTIVITYDTTM" > <Header Text="Date" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="DRUG" Width="17%" DataFieldName="DRUG" > <Header Text="Drug" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="Dosage" Width="10%" DataFieldName="Dosage" > <Header Text="Dosage" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="Method" Width="16%" DataFieldName="METHODADMINSTERED" > <Header Text="Method" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="Emp" Width="9%" DataFieldName="PFCODE" > <Header Text="PF#" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="Status" Width="13%" DataFieldName="STATUS" > <Header Text="Status" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="OffPFID" Hidden="True" DataFieldName="OfficerPFID" > <Header Text="OffPFID" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="OfficerPFID" Hidden="True" DataFieldName="OfficerPFID" > <Header Text="OffPFID1" /> </igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="MEDPRESHISTID" Hidden="True" DataFieldName="MEDPRESHISTID" > <Header /></igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="FullName" Hidden="True" DataFieldName="FullName" > <Header /></igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="MedPrescribeID" Hidden="True" DataFieldName="MEDPRESCRIBEID" > <Header /></igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="MedPresSchID" Hidden="True" DataFieldName="MedPresSchID" > <Header /></igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="INMATENAMEID" Hidden="True" DataFieldName="NAMEID" > <Header /></igtblexp1:BoundDataField> 
		                                <igtblexp1:BoundDataField Key="Times" Hidden="True" DataFieldName="Times" > <Header /></igtblexp1:BoundDataField> 
	                                </Columns> 
	                                <Behaviors>
                                      <igtblexp1:Activation Enabled="true" > </igtblexp1:Activation>
                                     <igtblexp1:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                      <igtblexp1:RowSelectors RowNumbering="false" Enabled="false" />
                                      <igtblexp1:Paging>
                                           <PagerTemplate>
                                               <asp:LinkButton ID="lnkbtnPrev" runat="server" OnClick="grdMedLog_lnkbtnPrev_Click" style="margin-top:-4px;" 
                                               Text="PREV" CssClass="igg_GridPager" />
                                            &nbsp;&nbsp;
                                              <asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="grdMedLog_lnkbtnNext_Click" style="margin-top:-4px;" 
                                               Text="NEXT" CssClass="igg_GridPager" /> 
                                          </PagerTemplate>
                                      </igtblexp1:Paging>
                                 </Behaviors>

                                </kpicc:kpigrid> 

                            </TD>
						</TR>
					</TABLE>
				</kpicc:kpipanel>
        </div>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2016.12.20" type="text/javascript"></script>
        <script src="frmMedicalLogSrch.js?v=2016.12.20" type="text/javascript"></script>
    </form>
</body>
</html>
