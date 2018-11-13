<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics35.WebUI.UltraWebGrid.v9.1, Version=9.1.20091.2055, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<%@ Page language="c#" CodeFile="frmWarrants.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmWarrants" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
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
		<script language="javascript" src="../KPIFrameWorkWeb/Scripts/MessageId.js" type="text/javascript"></script>
		<script language="javascript" src="../KPIFrameWorkWeb/Scripts/Messages.js" type="text/javascript"></script>
		<script language="javascript" src="../KPIFrameWorkWeb/Scripts/Global.js" type="text/javascript"></script>
		<script language="javascript" src="../KPIFrameworkWeb/Scripts/CtrlMgmt.js" type="text/javascript"></script>
		<script language="javascript" src="../KPIFrameworkWeb/Scripts/Date.js" type="text/javascript"></script>
		<script language="javascript" src="../Scripts/Phoenix.js" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" ><form id="frmwarrants_Id" method="post" runat="server" ><DIV class="tab" id="tab7" style="DISPLAY: inline">
				<TABLE cellSpacing="0" cellPadding="0" width="100%">
					<colgroup>
						<col width="3%" />
						<col width="95%" />
						<col width="1%" />
					</colgroup>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD align="center" colspan="3">
							<kpicc:KPILabel id="lblwarrants" runat="server">Active Detainer warrants</kpicc:KPILabel></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="3"></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="3"></TD>
					</TR>
					<TR>
						<td></td>
						<TD><kpicc:kpigrid id="grdWarrants" tabIndex="1" runat="server" Width="100%" Height="270px" KPISecurity="AC" KPIRepositoryID="0" RepositoryID="0" ImageDirectory="/ig_common/Images/" UseAccessibleHeader="False" KPIDefaultJurisAlias="False" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
									<ClientSideEvents CellClickHandler="grdFlag_CellClickHandler" AfterRowInsertHandler="grdFlag_AfterRowInsertHandler"></ClientSideEvents>
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
											<igtbl:UltraGridColumn Key="Date" Width="20%" AllowUpdate="No" BaseColumnName="Date" ><Footer Key="Date"></Footer>
												<Header Key="Date" Caption="Date"></Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Warrant" FooterText="Warrant#" Width="20%" BaseColumnName="WarrantNo" ><Footer Key="Warrant" Caption="Warrant#">
													<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Warrant" Caption="Warrant#">
													<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="CHRG" FooterText="Want/Charge" Width="20%" BaseColumnName="CHRG" ><Footer Key="CHRG" Caption="Want/Charge">
													<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="CHRG" Caption="Want/Charge">
													<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Authority" FooterText="Authority" Width="20%" BaseColumnName="Authority" ><Footer Key="Authority" Caption="Authority">
													<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Authority" Caption="Authority">
													<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Court" FooterText="Court" Width="20%" BaseColumnName="Court" ><Footer Key="Court" Caption="Court">
													<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Court" Caption="Court">
													<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="NameID" ><Footer Key="KPIID">
													<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="KPIID" Caption="">
													<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
													<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="KPIMode">
													<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
										</Columns>
										<RowStyle BackColor="White"></RowStyle>
									</igtbl:UltraGridBand>
								</Bands>
							</kpicc:kpigrid>
						</TD>
						<td></td>
					</TR>
					<TR>
						<TD align="center" colspan="3"></TD>
					</TR>
				</TABLE>
			</DIV>
			<input id="hdnMode" type="hidden" name="hdnMode" /><input id="hdnScreenID" type="hidden" name="hdnScreenID" value="8521" /></form>
	</body>
</HTML>
