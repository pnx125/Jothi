<%@ Page language="c#" CodeFile="frmVisitors.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmVisitors" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
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
		<script language="javascript" src="frmVisitors.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" ><form id="frmVisitors_Id" method="post" runat="server" ><DIV class="tab" id="tab7" style="DISPLAY: inline">
				<TABLE style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
					<colgroup>
						<col width="1%" />
						<col width="4%" />
						<col width="77%" />
						<col width="18%" />
					</colgroup>
					<TR>
						<TD rowSpan="6"></TD>
						<TD class="req" vAlign="top" align="left" colSpan="2" rowSpan="6">&nbsp;
							<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" border="0">
								<COLGROUP>
									<COL width="10%" />
									<COL width="48%" />
									<COL width="42%" />
								</COLGROUP>
								<TR>
									<TD vAlign="middle" align="right" class="req"><kpicc:kpilabel id="lblName" runat="server" KPISecurity="N">Name</kpicc:kpilabel>&nbsp;</TD>
									<TD colSpan="2"><phnxcc:namectrl id="custNames" runat="server" KPISecurity="AC" KPITabIndex="601" DtlTextBox="txtAddress"
											KPIResult="Detail" DefaultNameType="A" ShowNCICLookup="True" KPIClientCallBack=" NamesEvtCallback" AcceptNameType="AJ"
											ShowWarrantIcon="True"></phnxcc:namectrl></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD colSpan="2"><kpicc:kpitextbox id="txtAddress" runat="server" KPISecurity="I" KPITabIndex="603" CssClass="ReadOnly"
											Width="375px"></kpicc:kpitextbox></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD colSpan="2"></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD colSpan="2"></TD>
								</TR>
								<TR>
									<TD align="right" colSpan="1" rowSpan="1" class="req"><kpicc:kpilabel id="lblRelationShip" runat="server" KPISecurity="N">Relationship</kpicc:kpilabel>&nbsp;</TD>
									<TD>
										<kpicc:kpicodeddropdownlist id="cddRelation" runat="server" KPISecurity="AC" KPITabIndex="603" Width="100%"
											KPIWidth="230" KPIMode="Add" KPICodeId="2077" KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
									<TD><kpicc:kpicheckbox id="chkIsVisit" runat="server" KPISecurity="AC" KPITabIndex="604" Width="100%" Text="Visitation Not Allowed"
											ToolTip="Don't share with Other Agency"></kpicc:kpicheckbox></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="left"></TD>
									<TD align="left"><kpicc:KPIButton id="btnNotes" runat="server" KPITabIndex="606" CssClass="customBtn" Text="Notes" ></kpicc:kpibutton></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="left"></TD>
									<TD align="left"></TD>
									<TD align="right"><kpicc:KPIImageButton id="cmdAddVisitor" runat="server" KPITabIndex="608" ImageUrl="/KPIImages/ico/18_add.gif" ></kpicc:kpiimagebutton>&nbsp;
										<kpicc:KPIImageButton id="cmdClearVisitor" runat="server" KPITabIndex="609" ImageUrl="/KPIImages/ico/clear_data.gif" ></kpicc:kpiimagebutton>&nbsp;
									</TD>
								</TR>
								<TR>
									<TD align="left"></TD>
									<TD align="left" colSpan="2"><kpicc:kpigrid id="grdVisitor" tabIndex="1" runat="server" KPISecurity="AC" Width="100%" KPIDefaultJurisAlias="False" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" RepositoryID="0" KPIRepositoryID="0" Height="125px" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
													<ButtonStyle BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray" ><BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

													</ButtonStyle></AddNewBox>
												<Pager ChangeLinksColor="True" QuickPages="5" PageSize="25">
													<PagerStyle BorderWidth="1px" Font-Size="X-Small" Font-Bold="True" BorderColor="#ABC0E7" BorderStyle="Solid" ForeColor="White" BackColor="#7288AC" Height="20px" ><BorderDetails ColorTop="White" WidthLeft="1px" ColorBottom="0, 55, 122" WidthTop="1px" ColorRight="0, 55, 122" ColorLeft="White">
</BorderDetails>

													</PagerStyle></Pager>
												<HeaderStyleDefault VerticalAlign="Middle" BorderWidth="1px" Font-Bold="True" BorderStyle="Solid" HorizontalAlign="Left"
													ForeColor="White" BackColor="#7288AC" Height="20px" CssClass="mnuBar">
													<Padding Left="3px" Right="3px"></Padding>
													<BorderDetails ColorTop="171, 192, 231" WidthLeft="1px" ColorBottom="0, 55, 122" WidthTop="1px"
														ColorRight="0, 55, 122" ColorLeft="171, 192, 231"></BorderDetails>
												</HeaderStyleDefault>
												<RowSelectorStyleDefault Width="12px" Cursor="Default" BorderStyle="Solid" BackgroundImage="..\Images\ig_tblArrowRight.gif"
													BackColor="AliceBlue">
													<BorderDetails WidthLeft="0px" ColorBottom="224, 224, 224" WidthTop="0px" WidthRight="0px" StyleTop="None"
														WidthBottom="1px"></BorderDetails>
												</RowSelectorStyleDefault>
												<FrameStyle Width="100%" Cursor="Hand" BorderWidth="1px" Font-Size="8pt" Font-Names="Tahoma"
													BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="125px"></FrameStyle>
												<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
													<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
												</FooterStyleDefault>
												<ClientSideEvents CellClickHandler="grdVisitor_CellClickHandler" AfterRowInsertHandler="grdVisitor_AfterRowInsertHandler"></ClientSideEvents>
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
												<igtbl:UltraGridBand AllowUpdate="Yes" AllowAdd="Yes" GridLines="Horizontal">
													<Columns>
														<igtbl:UltraGridColumn Key="ID" Width="15%" AllowUpdate="No" BaseColumnName="ID" ><Footer Key="ID"></Footer>
															<Header Key="ID" Caption="ID"></Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Name" Width="20%" BaseColumnName="FullName" ><Footer Key="Name">
																<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Name" Caption="Name">
																<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Relation" Width="20%" BaseColumnName="Relation" ><Footer Key="Relation">
																<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Relation" Caption="Relationship">
																<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Active" Width="15%" BaseColumnName="Active" ><Footer Key="Active">
																<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Active" Caption="Active">
																<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Inactive" Width="15%" BaseColumnName="Inactive" ><Footer Key="Inactive">
																<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Inactive" Caption="Inactive">
																<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Notes" Width="15%" BaseColumnName="Notes" ><Footer Key="Notes">
																<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Notes" Caption="Notes">
																<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="NameID" ><Footer Key="KPIID">
																<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="KPIID" Caption="">
																<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
																<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="KPIMode">
																<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Relationtext" Hidden="True" ><Footer Key="Relationtext">
																<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Relationtext">
																<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="LastName" Hidden="True" ><Footer Key="LastName">
																<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="LastName">
																<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="FirstName" Hidden="True" ><Footer Key="FirstName">
																<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="FirstName">
																<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="MiddleName" Hidden="True" ><Footer Key="MiddleName">
																<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="MiddleName">
																<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="NameSuffix" Hidden="True" ><Footer Key="NameSuffix">
																<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="NameSuffix">
																<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="Type" Hidden="True" ><Footer Key="Type">
																<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="Type">
																<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
														<igtbl:UltraGridColumn Key="TypeID" Hidden="True" ><Footer Key="TypeID">
																<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
															</Footer>
															<Header Key="TypeID">
																<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
															</Header>
														</igtbl:UltraGridColumn>
													</Columns>
													<RowStyle BackColor="White"></RowStyle>
												</igtbl:UltraGridBand>
											</Bands>
										</kpicc:kpigrid></TD>
								</TR>
								<TR>
									<TD align="left"></TD>
									<TD align="left" colSpan="2"></TD>
								</TR>
								<TR>
									<TD align="left"></TD>
									<TD align="left" colSpan="2"></TD>
								</TR>
							</TABLE>
						</TD>
						<TD vAlign="top" align="left" colSpan="1" rowSpan="6">
							<P>
								<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
									<TR>
										<TD></TD>
									</TR>
									<TR>
										<TD></TD>
									</TR>
									<TR>
										<TD></TD>
									</TR>
									<TR>
										<TD><kpicc:kpilabel id="lblbgChecked" runat="server">Background Checked</kpicc:kpilabel></TD>
									</TR>
									<TR>
										<TD><kpicc:kpidatechooser id="dttBackCheck" tabIndex="7" runat="server" KPISecurity="AC" KPITabIndex="602"
												IsBigSize="No"></kpicc:kpidatechooser></TD>
									</TR>
									<TR>
										<TD><kpicc:kpilabel id="lblActive" runat="server" KPISecurity="N">Active</kpicc:kpilabel></TD>
									</TR>
									<TR>
										<TD><kpicc:kpidatechooser id="dttActive" tabIndex="7" runat="server" KPISecurity="AC" KPITabIndex="605" IsBigSize="No"></kpicc:kpidatechooser></TD>
									</TR>
									<TR>
										<TD><kpicc:kpilabel id="lblInActive" runat="server" KPISecurity="N">Inactive</kpicc:kpilabel></TD>
									</TR>
									<TR>
										<TD><kpicc:kpidatechooser id="dttInactive" tabIndex="7" runat="server" KPISecurity="AC" KPITabIndex="607"
												IsBigSize="No"></kpicc:kpidatechooser></TD>
									</TR>
								</TABLE>
							</P>
							<P>&nbsp;</P>
						</TD>
						<TD>1</TD>
					</TR>
					<TR>
						<TD></TD>
						<TD class="req" style="HEIGHT: 16px" align="right"></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD class="req"></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD class="req" style="HEIGHT: 11px" align="right">&nbsp;</TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD class="req" vAlign="middle" align="right">&nbsp;</TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD class="status" colSpan="4">
							<TABLE>
								<TR>
									<TD align="right"><asp:panel id="pnlTblInternal" Width="120px" Height="15px" DESIGNTIMEDRAGDROP="2670" HorizontalAlign="Right"
											Runat="server">
											<TABLE cellSpacing="0" cellPadding="0" border="0">
												<TR>
													<TD noWrap>
														<kpicc:KPIButton id="cmdInternalSave" tabIndex="10" runat="server" KPISecurity="AC" KPITabIndex="610" CssClass="Custombtn" Text="Save" ></kpicc:KPIButton>&nbsp;</TD>
													<TD noWrap>
														<kpicc:KPIButton id="cmdInternalRefresh" tabIndex="11" runat="server" KPISecurity="AC" KPITabIndex="611" Width="50px" CssClass="CustomBtn" Text="Reset" KPIRepositoryID="0" ></kpicc:kpibutton>&nbsp;&nbsp;</TD>
												</TR>
											</TABLE>
										</asp:panel></TD>
									<TD><kpicc:kpiliteral id="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:kpiliteral>&nbsp;</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</DIV>
			<input id="hdnMode" style="Z-INDEX: 101; LEFT: 88px; POSITION: absolute; TOP: 480px" type="hidden" value="ADD" name="hdnMode" runat="server" /><input id="hdnScreenID" style="Z-INDEX: 102; LEFT: 24px; POSITION: absolute; TOP: 480px" type="hidden" value="8519" name="hdnScreenID" runat="server" /></form>
	</body>
</HTML>
