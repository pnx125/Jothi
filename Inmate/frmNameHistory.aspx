<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Page language="c#" CodeFile="frmNameHistory.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmNameHistory" %>
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
		<script language="javascript" src="frmActivity.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" ><form id="frmActivity_Id" method="post" runat="server" ><DIV class="tab" id="tab0" style="DISPLAY: inline">
				<table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0">
					<colgroup>
						<col width="3%" />
						<col width="96%" />
						<col width="1%" />
					</colgroup>
					<TBODY>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td align="center"><kpicc:kpilabel id="lblHist" runat="server">History</kpicc:kpilabel></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<kpicc:kpigrid id="grdHistory" runat="server" Width="100%" KPISecurity="AC" RepositoryID="0" KPIRepositoryID="0" Height="270px" KPICustomPaging="True" KPIDefaultJurisAlias="False" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
											BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="270px"></FrameStyle>
										<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
											<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
										</FooterStyleDefault>
										<ClientSideEvents DblClickHandler="grdActivity_DblClickHandler"></ClientSideEvents>
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
												<igtbl:UltraGridColumn Key="KPIDRK" Width="10%" AllowUpdate="No" Hidden="True" ><CellStyle Font-Size="X-Small" Font-Names="Comic Sans MS" ForeColor="Red"></CellStyle>
													<Footer Key="KPIDRK"></Footer>
													<HeaderStyle Font-Names="Comic Sans MS" ForeColor="Red"></HeaderStyle>
													<Header Key="KPIDRK" Caption="X"></Header>
												</igtbl:UltraGridColumn>
												<igtbl:UltraGridColumn Key="Date" Width="40%" AllowUpdate="No" Format="MM/dd/yy HH:mm" BaseColumnName="Date" ><Footer Key="Date">
														<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="Date" Caption="DateTime">
														<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
													</Header>
												</igtbl:UltraGridColumn>
												<igtbl:UltraGridColumn Key="ID" Hidden="True" BaseColumnName="ID" ><Footer Key="ID">
														<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="ID">
														<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
													</Header>
												</igtbl:UltraGridColumn>
												<igtbl:UltraGridColumn Key="AssocID" Hidden="True" BaseColumnName="AssocID" ><Footer Key="AssocID">
														<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="AssocID">
														<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
													</Header>
												</igtbl:UltraGridColumn>
												<igtbl:UltraGridColumn Key="FullName" Width="60%" BaseColumnName="FullName" ><Footer Key="FullName">
														<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
													</Footer>
													<Header Key="FullName" Caption="Name">
														<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
													</Header>
												</igtbl:UltraGridColumn>
											</Columns>
											<RowStyle BackColor="White"></RowStyle>
										</igtbl:UltraGridBand>
									</Bands>
								</kpicc:kpigrid></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td><input id="hdnScreenId" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" value="8518" name="hdnScreenId" runat="server" /><input id="hdnMode" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" value="INQ" name="hdnMode" runat="server" /><input id="hdnNameId" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" name="hdnNameId" runat="server" /><input id="hdnCaller" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" name="hdnCaller" runat="server" /><input id="hdnJurisID" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" name="hdnJurisID" runat="server" /></td>
							<td></td>
						</tr>
					</TBODY>
				</table>
			</DIV>
		</FORM>
	</body>
</HTML>
