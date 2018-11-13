<%@ Register Assembly="Infragistics35.WebUI.UltraWebTab.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebTab" TagPrefix="igtab" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="uc1" TagName="usrNameSrchBasic" Src="UserControls/usrNameSrchBasic.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrNameSrchAdv" Src="UserControls/usrNameSrchAdv.ascx" %>
<%@ Register Assembly="Infragistics35.WebUI.WebDataInput.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebDataInput" TagPrefix="igtxt" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="cc2" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="cc1" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebToolbar.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebToolbar" TagPrefix="igtbar" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebNavigator.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebNavigator" TagPrefix="ignav" %>
<%@ Register Assembly="Infragistics35.WebUI.WebNavBar.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebNavBar" TagPrefix="ignavbar" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtblexp1" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtblexp" %>
<%@ Page language="c#" CodeFile="frmNameSrch.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmNameSrch" %>
<HTML>
	<HEAD>
		<title>
			<%=strProductTitle%>
			-
			<%=strPageTitle%>
		</title>
		<LINK href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet">
		<%=strDynamicThemes%>
		<script language="javascript" src="../KPIFrameworkWeb/Scripts/Date.js?v=2015.10.08" type="text/javascript"></script>
		<script language="javascript" src="frmNameSrch.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" leftMargin="15" rightMargin="0" ><form id="frmNameSrch_Id" method="post" runat="server" ><div class="tab" id="tab0" style="DISPLAY: inline">
				<table cellSpacing="0" cellPadding="0" width="100%">
					<COLGROUP>
						<col width="1%" />
						<col width="60%" />
						<col width="35%" />
						<col width="3%" />
					</COLGROUP>
					<TBODY>
						<tr>
							<td width="100%" colSpan="4" height="26">
								<table cellSpacing="0" cellPadding="0" width="100%" border="0">
									<tr>
										<td class="SearchStatus" noWrap width="50%"></td>
										<td class="SearchStatus" noWrap align="right" width="10%"><kpicc:kpicheckbox id="chkRptSelect" runat="server"></kpicc:kpicheckbox></td>
										<td class="SearchStatus" noWrap width="20%"><phnxcc:kpireportlist id="NameReportList" runat="server" KPISecurity="I" KPITabIndex="1"></phnxcc:kpireportlist></td>
										<td class="SearchStatus" noWrap align="right" width="20%"><kpicc:KPIImageButton id="cmdNameMine" runat="server" KPISecurity="I" KPITabIndex="1001" ImageUrl="/KPIImages/ico/18_addTeam.gif" ToolTip="Name Mine" AlternateText="Name Mine" CssClass="menuItem" ></kpicc:kpiimagebutton></td>
										<td class="SearchStatus"><kpicc:kpitoolbar id="tlbGridItem" tabIndex="1000" runat="server" CssClass="status" TextAlign="Right" ItemWidthDefault=" " BackColor="Transparent" KPIRepositoryID="0" BorderColor="Transparent" BorderWidth="0px" Width="550px" onbuttonclicked="tlbGridItem_ButtonClicked" ><HoverStyle>
													<BorderDetails ColorTop="Transparent" ColorBottom="Transparent" ColorRight="Transparent" ColorLeft="Transparent"></BorderDetails>
												</HoverStyle>
												<DefaultStyle Cursor="Hand"></DefaultStyle>
												<SelectedStyle BorderStyle="None">
													<BorderDetails ColorTop="Transparent" ColorBottom="Transparent" ColorRight="Transparent" ColorLeft="Transparent"></BorderDetails>
												</SelectedStyle>
												<ClientSideEvents Click="srchTlb_Click"></ClientSideEvents>
												<Items>
													<igtbar:TBarButton Tag="ShowMap" Key="ShowMap" HoverImage="" ToolTip="Show Map" SelectedImage="" Text="Show Map"
														DisabledImage="" Image="">
														<HoverStyle Width="75px" BorderWidth="1px" BorderColor="#004000" BorderStyle="Solid"></HoverStyle>
														<SelectedStyle Width="75px"></SelectedStyle>
														<DefaultStyle Width="75px"></DefaultStyle>
													</igtbar:TBarButton>
													<igtbar:TBarButton Tag="SelectName" Key="SelectName" HoverImage="" ToolTip="SelectName" Enabled="False"
														SelectedImage="" Text="Select Name" DisabledImage="" Image="">
														<HoverStyle Width="75px" BorderWidth="1px" BorderColor="#004000" BorderStyle="Solid" ForeColor="Highlight"></HoverStyle>
														<SelectedStyle Width="75px" ForeColor="White"></SelectedStyle>
														<DefaultStyle Width="75px" ForeColor="Highlight"></DefaultStyle>
													</igtbar:TBarButton>
													<igtbar:TBarButton Tag="Reset" Key="Reset" HoverImage="" ToolTip="Reset" SelectedImage="" Text="Reset"
														DisabledImage="" Image="">
														<HoverStyle Width="75px" BorderWidth="1px" BorderColor="#004000" BorderStyle="Solid" ForeColor="Highlight"></HoverStyle>
														<SelectedStyle Width="75px" ForeColor="White"></SelectedStyle>
														<DefaultStyle Width="75px" ForeColor="Highlight"></DefaultStyle>
													</igtbar:TBarButton>
													<igtbar:TBarButton Tag="Back" Key="Back" HoverImage="" ToolTip="Back to Search" Enabled="False" SelectedImage=""
														Text="Back" DisabledImage="" Image="">
														<HoverStyle Width="75px" BorderWidth="1px" BorderColor="#004000" BorderStyle="Solid" ForeColor="Highlight"></HoverStyle>
														<SelectedStyle Width="75px" ForeColor="White"></SelectedStyle>
														<DefaultStyle Width="75px" ForeColor="Highlight"></DefaultStyle>
													</igtbar:TBarButton>
													<igtbar:TBarButton Tag="Search" Key="Search" HoverImage="" ToolTip="Search" SelectedImage="" Text="Search"
														DisabledImage="" Image="">
														<HoverStyle Width="75px" BorderWidth="1px" BorderColor="#004000" BorderStyle="Solid" ForeColor="Highlight"></HoverStyle>
														<SelectedStyle Width="75px" ForeColor="White"></SelectedStyle>
														<DefaultStyle Width="75px" ForeColor="Highlight"></DefaultStyle>
													</igtbar:TBarButton>
													<igtbar:TBarButton Tag="AddNew" AutoPostBack="False" Key="AddNew" HoverImage="" ToolTip="Add New Item"
														SelectedImage="" Text="Add New" DisabledImage="" Image="">
														<HoverStyle Width="75px" BorderWidth="1px" BorderColor="#004000" BorderStyle="Solid" ForeColor="Highlight"></HoverStyle>
														<SelectedStyle Width="75px" ForeColor="White"></SelectedStyle>
														<DefaultStyle Width="75px" BorderStyle="None" ForeColor="Highlight"></DefaultStyle>
													</igtbar:TBarButton>
													<igtbar:TBSeparator></igtbar:TBSeparator>
													<igtbar:TBarButton Tag="Print" ImageAlign="Middle" Key="Print" HoverImage="/KPIImages/ico/16_print.gif"
														ToolTip="Print" SelectedImage="/KPIImages/ico/16_print.gif" DisabledImage="/KPIImages/ico/16_print.gif"
														Image="/KPIImages/ico/16_print.gif">
														<Images>
															<SelectedImage Url="/KPIImages/ico/16_print.gif"></SelectedImage>
															<HoverImage Url="/KPIImages/ico/16_print.gif"></HoverImage>
															<DisabledImage Url="/KPIImages/ico/16_print.gif"></DisabledImage>
															<DefaultImage Url="/KPIImages/ico/16_print.gif"></DefaultImage>
														</Images>
														<HoverStyle BorderColor="#004000"></HoverStyle>
													</igtbar:TBarButton>
													<igtbar:TBSeparator></igtbar:TBSeparator>
													<igtbar:TBarButton Tag="Excel" ImageAlign="Middle" Key="Excel" HoverImage="/KPIImages/ico/16_excel.gif"
														ToolTip="Export to Excel" SelectedImage="/KPIImages/ico/16_excel.gif" DisabledImage="/KPIImages/ico/16_excel.gif"
														Image="/KPIImages/ico/16_excel.gif">
														<Images>
															<SelectedImage Url="/KPIImages/ico/16_excel.gif"></SelectedImage>
															<HoverImage Url="/KPIImages/ico/16_excel.gif"></HoverImage>
															<DisabledImage Url="/KPIImages/ico/16_excel.gif"></DisabledImage>
															<DefaultImage Url="/KPIImages/ico/16_excel.gif"></DefaultImage>
														</Images>
														<HoverStyle BorderColor="#004000"></HoverStyle>
													</igtbar:TBarButton>
												</Items>
											</kpicc:kpitoolbar></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colSpan="4">
								<table cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TBODY>
										<tr>
											<td align="center" colSpan="4"><kpicc:kpipanel id="pnlSearch" runat="server">
													<TABLE cellSpacing="0" cellPadding="0" width="100%">
														<COLGROUP>
															<COL width="1%" />
															<COL width="30%" />
															<COL width="30%" />
															<COL width="30%" />
															<COL width="5%" />
														</COLGROUP>
														<TR>
															<TD></TD>
															<TD align="right" colSpan="4"></TD>
														</TR>
														<TR>
															<TD></TD>
															<TD>&nbsp;
															</TD>
															<TD align="right">&nbsp;</TD>
															<TD></TD>
															<TD></TD>
														</TR>
														<TR>
															<TD></TD>
															<TD colSpan="4"></TD>
														</TR>
														<TR>
															<TD align="center" colSpan="5">
																<kpicc:KPITab id="tabNameSrch" runat="server" Width="95%" BorderWidth="1px" BorderColor="Gray"
																	KPIRepositoryID="0" BackColor="#E0E0E0" Height="430px" BorderStyle="Solid" DummyTargetUrl=" "
																	ThreeDEffect="False">
																	<HoverTabStyle Cursor="Hand"></HoverTabStyle>
																	<ClientSideEvents AfterSelectedTabChange="tabNameSrch_AfterSelectedTabChange"></ClientSideEvents>
																	<SelectedTabStyle Font-Names="Verdana" Font-Bold="True" BackColor="White"></SelectedTabStyle>
																	<DefaultTabStyle Height="20px" Font-Names="Verdana" BackColor="RosyBrown"></DefaultTabStyle>
																	<Tabs>
																		<igtab:Tab Key="BSC" Text="Basic">
																			<ContentTemplate>
																				<uc1:usrNameSrchBasic id="UsrNameSrchBasic2" runat="server"></uc1:usrNameSrchBasic>
																			</ContentTemplate>
																			<Style BackColor="Transparent">
																			</Style>
																		</igtab:Tab>
																		<igtab:Tab Key="ADV" Text="Advanced">
																			<ContentTemplate>
																				<uc1:usrNameSrchAdv id="UsrNameSrchAdv2" runat="server"></uc1:usrNameSrchAdv>
																			</ContentTemplate>
																			<Style BackColor="Transparent">
																			</Style>
																		</igtab:Tab>
																	</Tabs>
																	<RoundedImage FillStyle="LeftMergedWithCenter" HoverImage="[ig_tab_winXP2.gif]"  LeftSideWidth="7" NormalImage="[ig_tab_winXP3.gif]" RightSideWidth="6"  SelectedImage="[ig_tab_winXP1.gif]" ShiftOfImages="2" /> </kpicc:KPITab></TD>
														</TR>
													</TABLE>
												</kpicc:kpipanel></td>
										</tr>
										<TR>
											<TD colSpan="4"></TD>
										</TR>
									</TBODY>
								</table>
								<input id="hdnNameType" type="hidden" value="MNI" name="hdnNameType" runat="server" /><input id="hdnScreenId" type="hidden" value="8511" name="hdnScreenId" runat="server" /><input id="hdnCaller" type="hidden" name="hdnCaller" runat="server" /><input id="hdnReportID" type="hidden" name="hdnReportID" runat="server" /><input id="hdnIncidentID" type="hidden" name="hdnIncidentID" runat="server" /><input id="hdnCtrlName" type="hidden" name="hdnCtrlName" runat="server" /><input id="hdnChkSearch" type="hidden" name="hdnChkSearch" runat="server" /><input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" /><input id="rptHidden" type="hidden" name="rptHidden" runat="server" /><input id="hdnNewFirstName" type="hidden" name="hdnNewFirstName" runat="server" /><input id="hdnSrchCount" type="hidden" name="hdnSrchCount" runat="server" /><input id="hdnAssocNameID" type="hidden" name="hdnAssocNameID" runat="server" /><input id="hdnNewLastName" type="hidden" name="hdnNewLastName" runat="server" /><input id="hdnMode" type="hidden" value="INQ" name="hdnMode" runat="server" /><input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" /><input id="hdnCopyNameID" type="hidden" name="hdnJurisId" runat="server" /><input id="hdnCopyNameType" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" name="hdnCopyNameType" runat="server" /><input id="hdnBack" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" name="hdnBack" runat="server" /><input id="hdnIsRptColVisible" style="WIDTH: 8px; HEIGHT: 22px" type="hidden" name="hdnIsRptColVisible" runat="server" /></td>
						</tr>
					</TBODY>
				</table>
				<kpicc:kpipanel id="pnlSearchResults" runat="server">
					<TABLE cellSpacing="0" cellPadding="0" width="100%">
						<TR>
							<TD style="FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#f0f8ff)"
								width="100%" colSpan="5">
								<TABLE width="100%">
									<COLGROUP>
										<COL width="45%" />
										<COL align="left" width="9%" />
										<COL align="left" width="30%" />
									</COLGROUP>
									<TR>
										<TD>
											<kpicc:KPILabel id="lblDetails" runat="server" Width="218px" BackColor="Transparent" Visible="False"
												Font-Bold="True" ForeColor="Black"></kpicc:KPILabel></TD>
										<TD style="WIDTH: 8.13%" align="right">
											<kpicc:KPILabel id="lblSSNo" runat="server" Visible="False"></kpicc:KPILabel></TD>
										<TD>
											<kpicc:KPIMaskEdit id="mskSSno" runat="server" CssClass="textbox" Width="115px" BackColor="Transparent"
												Visible="False" Font-Bold="True" ReadOnly="True" InputMask="###-##-####"></kpicc:KPIMaskEdit></TD>
									</TR>
									<TR>
										<TD>
											<kpicc:KPILabel id="lblAddress" runat="server" Visible="False" Font-Bold="True"></kpicc:KPILabel></TD>
										<TD style="WIDTH: 8.13%" align="right">
											<kpicc:KPILabel id="lblPhoneType1" runat="server" Width="90px" Height="11px" Visible="False" ForeColor="Black"></kpicc:KPILabel></TD>
										<TD align="left">
											<kpicc:KPILabel id="lblType" runat="server" KPISecurity="lblType" Visible="False" Font-Bold="True"
												ForeColor="Black"></kpicc:KPILabel>&nbsp;
											<kpicc:KPILabel id="lblPhoneNo1" runat="server" BackColor="Transparent" Font-Bold="True" ForeColor="Black"></kpicc:KPILabel>&nbsp;&nbsp;&nbsp;
										</TD>
									</TR>
								</TABLE>
							</TD>
						</TR>
						<TR>
							<TD colSpan="5">
								<kpicc:kpigrid id="grdNames" runat="server" KPISecurity="ACID" KPIRepositoryID="0" Height="488px" width="100%" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" KPICustomPaging="True" KPIDefaultJurisAlias="False" ><DisplayLayout StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" RowsRange="25" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
											<ButtonStyle BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray" ><BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

											</ButtonStyle></AddNewBox>
										<Pager ChangeLinksColor="True" QuickPages="5" PageSize="25" AllowCustomPaging="True" StyleMode="CustomLabels"
											AllowPaging="True">
											<PagerStyle BorderWidth="1px" Font-Size="X-Small" Font-Bold="True" BorderColor="#ABC0E7" BorderStyle="Solid" ForeColor="White" BackColor="#7288AC" Height="20px" ><BorderDetails ColorTop="White" WidthLeft="1px" ColorBottom="0, 55, 122" WidthTop="1px" ColorRight="0, 55, 122" ColorLeft="White">
</BorderDetails>

											</PagerStyle></Pager>
										<HeaderStyleDefault VerticalAlign="Middle" BorderWidth="1px" Font-Bold="True" BorderStyle="Solid" HorizontalAlign="Left"
											ForeColor="White" BackColor="#7288AC" Height="20px" CssClass="mnuBar">
											<Padding Left="3px" Right="3px"></Padding>
											<BorderDetails ColorTop="171, 192, 231" WidthLeft="1px" ColorBottom="0, 55, 122" WidthTop="1px"
												ColorRight="0, 55, 122" ColorLeft="171, 192, 231"></BorderDetails>
										</HeaderStyleDefault>
										<RowSelectorStyleDefault Width="32px" Cursor="Default" BorderStyle="Solid" BackgroundImage="..\Images\ig_tblArrowRight.gif"
											BackColor="AliceBlue">
											<BorderDetails WidthLeft="0px" ColorBottom="224, 224, 224" WidthTop="0px" WidthRight="0px" StyleTop="None"
												WidthBottom="1px"></BorderDetails>
										</RowSelectorStyleDefault>
										<FrameStyle Width="100%" Cursor="Hand" BorderWidth="0px" Font-Size="8pt" Font-Names="Tahoma"
											BorderColor="Transparent" BorderStyle="None" BackColor="Transparent" Height="488px"></FrameStyle>
										<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
											<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
										</FooterStyleDefault>
										<ClientSideEvents ClickCellButtonHandler="grdNames_ClickCellButtonHandler" AfterCellUpdateHandler="grdNames_AfterCellUpdateHandler"
											DblClickHandler="grdNames_DblClickHandler" CellClickHandler="Flag_CellClickHandler"></ClientSideEvents>
										<ActivationObject BorderWidth="" BorderColor=""></ActivationObject>
										<Images></Images>
										<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>
										<SelectedRowStyleDefault BackColor="OldLace"></SelectedRowStyleDefault>
										<RowAlternateStyleDefault BackColor="AliceBlue"></RowAlternateStyleDefault>
										<RowStyleDefault TextOverflow="Ellipsis" VerticalAlign="Top" BorderWidth="1px" Font-Size="9pt" Font-Names="Verdana"
											BorderColor="LightGray" BorderStyle="Solid" ForeColor="Black" BackColor="White">
											<Padding Left="5px"></Padding>
											<BorderDetails ColorTop="DimGray" WidthLeft="0px" WidthTop="0px" ColorLeft="DimGray"></BorderDetails>
										</RowStyleDefault>
									</DisplayLayout>
									<Bands>
										<igtblexp:UltraGridBand>
											<Columns>
												<igtblexp:UltraGridColumn Key="KPIJurisID" Width="10%" Hidden="True" BaseColumnName="JurisID" ><Footer Key="KPIJurisID"></Footer>
													<Header Key="KPIJurisID" Caption=""></Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="KPIJurisAlias" Width="6%" Hidden="True" ><Footer Key="KPIJurisAlias">
														<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="KPIJurisAlias" Caption="Juris">
														<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="RptListSelect" Width="3%" AllowUpdate="Yes" Type="CheckBox" BaseColumnName="RptListSelect" ><Footer Key="RptListSelect">
														<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="RptListSelect">
														<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="NameTypeID" Width="12%" BaseColumnName="NameTypeID" ><Footer Key="NameTypeID">
														<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="NameTypeID" Caption="ID">
														<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="FullName" Width="20%" BaseColumnName="FullName" ><Footer Key="FullName">
														<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="FullName" Caption="Name">
														<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Address" Hidden="True" BaseColumnName="Location" ><Footer Key="Address">
														<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Address" Caption="Address">
														<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Race" Width="5%" BaseColumnName="Race" ><Footer Key="Race">
														<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Race" Caption="R">
														<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Sex" Width="3%" BaseColumnName="Sex" ><Footer Key="Sex">
														<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Sex" Caption="S">
														<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="DOBDttm" Width="8%" Format="MM/dd/yy" BaseColumnName="DOBDttm" ><Footer Key="DOBDttm">
														<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="DOBDttm" Caption="DOB">
														<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Age" Width="5%" ><Footer Key="Age">
														<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Age" Caption="Age">
														<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Height1" Width="5%" BaseColumnName="Height1" ><Footer Key="Height1">
														<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Height1" Caption="HGT">
														<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Weight1" Width="5%" BaseColumnName="Weight1" ><Footer Key="Weight1">
														<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Weight1" Caption="WGT">
														<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="HairColor" Width="5%" BaseColumnName="HairColor" ><Footer Key="HairColor">
														<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="HairColor" Caption="Hair">
														<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="EyeColor" Width="5%" BaseColumnName="EyeColor" ><Footer Key="EyeColor">
														<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="EyeColor" Caption="Eye">
														<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Flags" Width="3%" ><Footer Key="Flags">
														<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Flags" Caption="F">
														<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="WCount" Width="3%" BaseColumnName="WCount" ><Footer Key="WCount">
														<RowLayoutColumnInfo OriginX="15"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="WCount" Caption="W">
														<RowLayoutColumnInfo OriginX="15"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="NameID" Hidden="True" BaseColumnName="NameID" ><Footer Key="NameID">
														<RowLayoutColumnInfo OriginX="16"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="NameID" Caption="NameID">
														<RowLayoutColumnInfo OriginX="16"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="SuffixDesc" Hidden="True" BaseColumnName="SuffixDesc" ><Footer Key="SuffixDesc">
														<RowLayoutColumnInfo OriginX="17"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="SuffixDesc" Caption="">
														<RowLayoutColumnInfo OriginX="17"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="LastName" Hidden="True" BaseColumnName="LastName" ><Footer Key="LastName">
														<RowLayoutColumnInfo OriginX="18"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="LastName">
														<RowLayoutColumnInfo OriginX="18"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="FirstName" Hidden="True" BaseColumnName="FirstName" ><Footer Key="FirstName">
														<RowLayoutColumnInfo OriginX="19"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="FirstName">
														<RowLayoutColumnInfo OriginX="19"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="MiddleName" Hidden="True" BaseColumnName="MiddleName" ><Footer Key="MiddleName">
														<RowLayoutColumnInfo OriginX="20"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="MiddleName">
														<RowLayoutColumnInfo OriginX="20"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="NameSuffix" Hidden="True" BaseColumnName="NameSuffix" ><Footer Key="NameSuffix">
														<RowLayoutColumnInfo OriginX="21"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="NameSuffix">
														<RowLayoutColumnInfo OriginX="21"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="NameType" Hidden="True" BaseColumnName="NameType" ><Footer Key="NameType">
														<RowLayoutColumnInfo OriginX="22"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="NameType">
														<RowLayoutColumnInfo OriginX="22"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="SeqNo" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="SeqNo">
														<RowLayoutColumnInfo OriginX="23"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="SeqNo">
														<RowLayoutColumnInfo OriginX="23"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="MainName" Hidden="True" BaseColumnName="MainName" ><Footer Key="MainName">
														<RowLayoutColumnInfo OriginX="24"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="MainName" Caption="M">
														<RowLayoutColumnInfo OriginX="24"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="IsFlag" Hidden="True" BaseColumnName="IsFlag" ><Footer Key="IsFlag">
														<RowLayoutColumnInfo OriginX="25"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="IsFlag">
														<RowLayoutColumnInfo OriginX="25"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="WarCount" Hidden="True" BaseColumnName="WarCount" ><Footer Key="WarCount">
														<RowLayoutColumnInfo OriginX="26"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="WarCount">
														<RowLayoutColumnInfo OriginX="26"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="PhoneNbr" Hidden="True" BaseColumnName="PhoneNbr" ><Footer Key="PhoneNbr">
														<RowLayoutColumnInfo OriginX="27"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="PhoneNbr">
														<RowLayoutColumnInfo OriginX="27"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="City" Hidden="True" BaseColumnName="City" ><Footer Key="City">
														<RowLayoutColumnInfo OriginX="28"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="City">
														<RowLayoutColumnInfo OriginX="28"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="State" Hidden="True" BaseColumnName="State" ><Footer Key="State">
														<RowLayoutColumnInfo OriginX="29"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="State">
														<RowLayoutColumnInfo OriginX="29"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Zip" Hidden="True" BaseColumnName="Zip" ><Footer Key="Zip">
														<RowLayoutColumnInfo OriginX="30"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Zip">
														<RowLayoutColumnInfo OriginX="30"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="SSNo" Hidden="True" BaseColumnName="SSNo" ><Footer Key="SSNo">
														<RowLayoutColumnInfo OriginX="31"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="SSNo">
														<RowLayoutColumnInfo OriginX="31"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="PhoneType" Hidden="True" BaseColumnName="PhoneType" ><Footer Key="PhoneType">
														<RowLayoutColumnInfo OriginX="32"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="PhoneType">
														<RowLayoutColumnInfo OriginX="32"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="JInq" Hidden="True" BaseColumnName="JInq" ><Footer Key="JInq">
														<RowLayoutColumnInfo OriginX="33"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="JInq">
														<RowLayoutColumnInfo OriginX="33"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="Country" Hidden="True" BaseColumnName="Country" ><Footer Key="Country">
														<RowLayoutColumnInfo OriginX="34"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Country">
														<RowLayoutColumnInfo OriginX="34"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="IsPhoto" Width="3%" BaseColumnName="IsPhoto" ><Footer Key="IsPhoto">
														<RowLayoutColumnInfo OriginX="35"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="IsPhoto" Caption="P">
														<RowLayoutColumnInfo OriginX="35"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="IsCourt" Hidden="True" BaseColumnName="IsCourt" ><Footer Key="IsCourt">
														<RowLayoutColumnInfo OriginX="36"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="IsCourt">
														<RowLayoutColumnInfo OriginX="36"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="CourtName" Width="3%" ><Footer Key="CourtName">
														<RowLayoutColumnInfo OriginX="37"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="CourtName" Caption="C">
														<RowLayoutColumnInfo OriginX="37"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
												<igtblexp:UltraGridColumn Key="IsKGIS" Width="7%" Hidden="True" Type="CheckBox" BaseColumnName="IsKGIS" ><Footer Key="IsKGIS">
														<RowLayoutColumnInfo OriginX="38"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="IsKGIS" Caption="Do Not Share">
														<RowLayoutColumnInfo OriginX="38"></RowLayoutColumnInfo>
													</Header>
												</igtblexp:UltraGridColumn>
											</Columns>
										</igtblexp:UltraGridBand>
									</Bands>
								</kpicc:kpigrid></TD>
						</TR>
					</TABLE>
				</kpicc:kpipanel></div>
		</form>
	</body>
</HTML>
