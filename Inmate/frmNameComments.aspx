<%@ Page language="c#" CodeFile="frmNameComments.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmNameComments" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
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
		<script language="javascript" src="frmNameComments.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" ><form id="frmNameComments_Id" method="post" runat="server" ><table id="Table1" width="100%" cellSpacing="0" cellPadding="1">
				<colgroup>
					<col width="3%" />
					<col width="95%" />
					<col width="2%" />
				</colgroup>
				<TBODY>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<table width="100%" cellSpacing="1" cellPadding="1">
								<colgroup>
									<col width="20%" />
									<col width="23%" />
									<col width="27%" />
									<col width="30%" />
								</colgroup>
								<tr>
									<TD><kpicc:kpilabel id="lblDateTime" runat="server">Date</kpicc:kpilabel>
									</TD>
									<td><kpicc:kpilabel id="lblPFNO" runat="server">PF#</kpicc:kpilabel></td>
									<td colSpan="2"><kpicc:kpilabel id="lblSubject" runat="server" Width="96px">Subject</kpicc:kpilabel></td>
								</tr>
								<tr>
									<td><kpicc:kpidatechooser id="dtcCurrDate" runat="server" KPITabIndex="501" KPISecurity="C" ReadOnly="False"
											KPIMandatory="True"></kpicc:kpidatechooser></td>
									<td>
										<kpicc:kpicodedlookup id="lupPFNO" runat="server" Width="80px" KPISecurity="AC" KPITabIndex="703" KPICodeID="2068"></kpicc:kpicodedlookup></td>
									<td><kpicc:kpitextbox id="txtSubject" runat="server" Width="354px" KPITabIndex="502" KPISecurity="AC"
											MaxLength="200" CssClass="textbox"></kpicc:kpitextbox></td>
									<td><kpicc:KPIButton id="btnComments" runat="server" Width="109px" KPITabIndex="503" KPISecurity="AC" CssClass="customBtn" Text="Entry" ></kpicc:kpibutton></td>
								</tr>
							</table>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><kpicc:kpigrid id="grdComments" runat="server" Width="100%" KPISecurity="AC" KPIRepositoryID="0" KPIDefaultJurisAlias="False" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" Height="200px" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
										BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="200px"></FrameStyle>
									<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
										<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
									</FooterStyleDefault>
									<ClientSideEvents DblClickHandler="grdComments_DblClickHandler"></ClientSideEvents>
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
									<igtbl:UltraGridBand>
										<Columns>
											<igtbl:UltraGridColumn Key="TxtDttm" Width="15%" Format="MM/dd/yy" BaseColumnName="TxtDttm" ><Footer Key="TxtDttm"></Footer>
												<Header Key="TxtDttm" Caption="Date"></Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="PFCode" Width="15%" BaseColumnName="PFCode" ><Footer Key="PFCode">
													<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="PFCode" Caption="PF#">
													<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="PFID" Hidden="True" BaseColumnName="PFID" ><Footer Key="PFID">
													<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="PFID" Caption="PFID">
													<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Subject" Width="65%" BaseColumnName="Description" ><Footer Key="Subject">
													<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Subject" Caption="Subject">
													<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Mark" Width="5%" Hidden="True" ><Footer Key="Mark">
													<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Mark" Caption="M">
													<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="TxtID" Hidden="True" BaseColumnName="TxtID" ><Footer Key="TxtID">
													<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="TxtID">
													<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="TxtHtml" Hidden="True" BaseColumnName="TxtHtml" ><Footer Key="TxtHtml">
													<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="TxtHtml">
													<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Txt" Hidden="True" BaseColumnName="Txt" ><Footer Key="Txt">
													<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Txt">
													<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
										</Columns>
									</igtbl:UltraGridBand>
								</Bands>
							</kpicc:kpigrid></td>
						<td></td>
					</tr>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<tr height="1%">
					</tr>
					<tr>
						<TD class="status" colSpan="3">
							<table>
								<tr>
									<td align="right"><asp:panel id="pnlTblInternal" Width="120px" Height="15px" Runat="server" HorizontalAlign="Right"
											DESIGNTIMEDRAGDROP="2670">
											<TABLE cellSpacing="0" cellPadding="0" border="0">
												<TR>
													<TD noWrap>
														<kpicc:KPIButton id="cmdInternalSave" tabIndex="10" runat="server" KPISecurity="AC" KPITabIndex="611" CssClass="Custombtn" Text="Save" ></kpicc:KPIButton>&nbsp;</TD>
													<TD noWrap>
														<kpicc:KPIButton id="cmdInternalRefresh" tabIndex="11" runat="server" Width="50px" KPISecurity="AC" KPITabIndex="612" CssClass="CustomBtn" Text="Reset" KPIRepositoryID="0" ></kpicc:kpibutton>&nbsp;&nbsp;</TD>
												</TR>
											</TABLE>
										</asp:panel></td>
									<td><kpicc:kpiliteral id="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:kpiliteral>&nbsp;</td>
								</tr>
							</table>
						</TD>
					</tr>
					<tr>
						<td></td>
						<td>
							<input id="hdnScreenId" type="hidden" value="8515" name="hdnScreenId" runat="server" /><input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" /><input id="hdnNameId" type="hidden" name="hdnNameId" runat="server" /><input id="hdnTextId" type="hidden" name="hdnTextId" runat="server" /><input id="hdnJurisID" type="hidden" name="hdnJurisID" runat="server" /><input id="hdnCaller" type="hidden" name="hdnCaller" runat="server" /></td>
						<td></td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
