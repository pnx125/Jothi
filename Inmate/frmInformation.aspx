<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Page language="c#" CodeFile="frmInformation.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmInformation" %>
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
		<script language="javascript" src="frmInformation.js?v=2015.10.08" type="text/javascript"></script>
		<script language="javascript" src="../KPIFrameworkWeb/Scripts/Date.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" ><form id="Form1_Id" method="post" runat="server" ><table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="2">
				<colgroup>
					<col width="1%" />
					<col align="right" width="6%" />
					<col width="32%" />
					<col align="right" width="2%" />
					<col align="right" width="6%" />
					<col width="0%" />
					<col width="25%" />
					<col align="right" width="6%" />
					<col width="0%" />
					<col width="25%" />
				</colgroup>
				<TR>
					<td style="HEIGHT: 10px" colSpan="10"></td>
				</TR>
				<TR>
					<TD></TD>
					<TD></TD>
					<TD><kpicc:kpilabel id="lblDLNo" runat="server">DL # & DL State</kpicc:kpilabel></TD>
					<TD></TD>
					<TD></TD>
					<TD></TD>
					<TD><kpicc:kpilabel id="lblSSNo" runat="server"> SS#</kpicc:kpilabel></TD>
					<TD></TD>
					<TD></TD>
					<TD><kpicc:kpilabel id="lblDOB" runat="server">Date Of Birth</kpicc:kpilabel></TD>
				</TR>
				<TR>
					<TD></TD>
					<TD class="rec"><kpicc:kpilabel id="KPILabel1" runat="server">Actual</kpicc:kpilabel></TD>
					<TD><kpicc:kpitextbox id="txtADLNo" runat="server" CssClass="ReadOnlyText" MaxLength="7" Width="176px"
							KPISecurity="N"></kpicc:kpitextbox></TD>
					<TD></TD>
					<TD class="rec"><kpicc:kpilabel id="lblActual" runat="server">Actual</kpicc:kpilabel></TD>
					<TD></TD>
					<TD><kpicc:kpitextbox id="txtASSNo" runat="server" CssClass="ReadOnlyText" MaxLength="7" Width="176px"
							KPISecurity="N"></kpicc:kpitextbox></TD>
					<TD class="rec"><kpicc:kpilabel id="KPILabel2" runat="server">Actual</kpicc:kpilabel></TD>
					<TD></TD>
					<TD><kpicc:kpitextbox id="txtActualDOB" runat="server" CssClass="ReadOnlyText" MaxLength="7" Width="160px"
							KPISecurity="N"></kpicc:kpitextbox></TD>
				</TR>
				<TR>
					<TD></TD>
					<TD></TD>
					<TD>
						<table>
							<colgroup>
								<col width="55%" />
								<col width="10%" />
								<col width="5%" />
								<col align="left" width="5%" />
							</colgroup>
							<tr>
								<td><kpicc:kpitextbox id="txtDLNo" runat="server" CssClass="textbox" MaxLength="25" Width="135px" KPISecurity="AC"
										KPITabIndex="501"></kpicc:kpitextbox></td>
								<td><kpicc:kpicodeddropdownlist id="cddDLState" runat="server" KPIWidth="50" KPIDisplayOption="CodeValue" KPICodeId="2009"
										KPISecurity="AC" KPITabIndex="502"></kpicc:kpicodeddropdownlist></td>
								<td style="WIDTH: 5%"><kpicc:KPIImageButton id="cmdAddDL" tabIndex="1" runat="server" ImageUrl="/KPIImages/ico/18_add.gif" KPITabIndex="503" ></kpicc:kpiimagebutton></td>
								<td><kpicc:KPIImageButton id="cmdClearDL" tabIndex="3" runat="server" ImageUrl="/KPIImages/ico/clear_data.gif" KPISecurity="AC" KPITabIndex="504" ></kpicc:kpiimagebutton></td>
							</tr>
						</table>
					</TD>
					<TD></TD>
					<TD></TD>
					<TD></TD>
					<TD>
						<table>
							<colgroup>
								<col width="80%" />
								<col width="10%" />
								<col align="left" width="10%" />
							</colgroup>
							<tr>
								<td><kpicc:kpimaskedit id="mskSSNo" tabIndex="4" runat="server" Width="144px" InputMask="###-##-####" KPISecurity="AC"
										KPITabIndex="505"></kpicc:kpimaskedit></td>
								<td style="WIDTH: 10.5%"><kpicc:KPIImageButton id="cmdAddSSNo" tabIndex="5" runat="server" ImageUrl="/KPIImages/ico/18_add.gif" KPISecurity="AC" KPITabIndex="506" ></kpicc:kpiimagebutton></td>
								<td><kpicc:KPIImageButton id="cmdClearSSNo" tabIndex="7" runat="server" ImageUrl="/KPIImages/ico/clear_data.gif" KPISecurity="AC" KPITabIndex="507" ></kpicc:kpiimagebutton></td>
							</tr>
						</table>
					</TD>
					<TD style="WIDTH: 7.22%"></TD>
					<TD style="HEIGHT: 28px"></TD>
					<TD style="HEIGHT: 28px">
						<table>
							<colgroup>
								<col width="80%" />
								<col width="10%" />
								<col align="left" width="10%" />
							</colgroup>
							<tr>
								<td><kpicc:kpidatechooser id="dtcDOB" tabIndex="7" runat="server" KPISecurity="AC" KPITabIndex="508"></kpicc:kpidatechooser></td>
								<td><kpicc:KPIImageButton id="cmdAddDOB" runat="server" ImageUrl="/KPIImages/ico/18_add.gif" KPISecurity="AC" KPITabIndex="509" ></kpicc:kpiimagebutton></td>
								<td><kpicc:KPIImageButton id="cmdClearDOB" runat="server" ImageUrl="/KPIImages/ico/clear_data.gif" KPISecurity="AC" KPITabIndex="510" ></kpicc:kpiimagebutton></td>
							</tr>
						</table>
					</TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 23px"></TD>
					<TD style="HEIGHT: 20px"></TD>
					<TD style="WIDTH: 29.01%; HEIGHT: 196px" rowSpan="8">
						<kpicc:kpigrid id="grdDLNo" runat="server" Width="95%" KPISecurity="AC" RepositoryID="0" KPIRepositoryID="0" Height="175px" ImageDirectory="/ig_common/Images/" UseAccessibleHeader="False" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
								<FrameStyle Width="95%" Cursor="Hand" BorderWidth="1px" Font-Size="8pt" Font-Names="Tahoma"
									BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="175px"></FrameStyle>
								<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
									<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
								</FooterStyleDefault>
								<ClientSideEvents CellClickHandler="grdDLNo_CellClickHandler" AfterRowInsertHandler="grdDLNo_AfterRowInsertHandler"></ClientSideEvents>
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
										<igtbl:UltraGridColumn Key="KPIDRK" Width="13%" AllowUpdate="No" ><CellStyle Font-Size="X-Small" Font-Names="Comic Sans MS" ForeColor="Red"></CellStyle>
											<Footer Key="KPIDRK"></Footer>
											<HeaderStyle Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
											<Header Key="KPIDRK" Caption="X"></Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="DLNo" Width="67%" AllowUpdate="No" BaseColumnName="DLNo" ><Footer Key="DLNo">
												<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="DLNo" Caption="DL#">
												<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="SeqNo" AllowUpdate="No" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="SeqNo">
												<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="SeqNo">
												<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="KPIID" AllowUpdate="No" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
												<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="KPIID">
												<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="KPIMode" AllowUpdate="No" Hidden="True" ><Footer Key="KPIMode">
												<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="KPIMode">
												<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="State" Width="20px" AllowUpdate="No" BaseColumnName="State" ><Footer Key="State">
												<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="State" Caption="ST">
												<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
									</Columns>
									<RowStyle BackColor="White"></RowStyle>
								</igtbl:UltraGridBand>
							</Bands>
						</kpicc:kpigrid></TD>
					<TD style="HEIGHT: 23px"></TD>
					<TD style="HEIGHT: 20px"></TD>
					<TD style="HEIGHT: 23px"></TD>
					<TD style="WIDTH: 25.6%; HEIGHT: 196px" rowSpan="8">
						<kpicc:kpigrid id="grdSSNo" runat="server" Width="95%" KPIRepositoryID="0" Height="175px" KPISecurity="AC" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
								<FrameStyle Width="95%" Cursor="Hand" BorderWidth="1px" Font-Size="8pt" Font-Names="Tahoma"
									BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="175px"></FrameStyle>
								<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
									<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
								</FooterStyleDefault>
								<ClientSideEvents CellClickHandler="grdSSNo_CellClickHandler" AfterRowInsertHandler="grdSSNo_AfterRowInsertHandler"></ClientSideEvents>
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
										<igtbl:UltraGridColumn Key="KPIDRK" Width="10%" AllowUpdate="No" ><CellStyle Font-Size="X-Small" Font-Names="Comic Sans MS" ForeColor="Red"></CellStyle>
											<Footer Key="KPIDRK"></Footer>
											<HeaderStyle Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
											<Header Key="KPIDRK" Caption="X"></Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="mskSSNo" Width="50%" AllowUpdate="No" ><Footer Key="mskSSNo">
												<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="mskSSNo" Caption="SS#">
												<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="SeqNo" Width="0px" AllowUpdate="No" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="SeqNo">
												<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="SeqNo">
												<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="KPIID" Width="0px" AllowUpdate="No" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
												<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="KPIID">
												<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="KPIMode" Width="0px" AllowUpdate="No" Hidden="True" ><Footer Key="KPIMode">
												<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="KPIMode">
												<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="SSNo" AllowUpdate="No" Hidden="True" BaseColumnName="SSNo" ><Footer Key="SSNo">
												<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="SSNo">
												<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
									</Columns>
									<RowStyle BackColor="White"></RowStyle>
								</igtbl:UltraGridBand>
							</Bands>
						</kpicc:kpigrid></TD>
					<TD style="WIDTH: 12.04%; HEIGHT: 23px"></TD>
					<TD style="HEIGHT: 23px"></TD>
					<TD style="HEIGHT: 196px" rowSpan="8"><kpicc:kpigrid id="grdDOB" runat="server" Width="95%" KPIRepositoryID="0" Height="175px" KPISecurity="AC" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
								<FrameStyle Width="95%" Cursor="Hand" BorderWidth="1px" Font-Size="8pt" Font-Names="Tahoma"
									BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="175px"></FrameStyle>
								<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
									<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
								</FooterStyleDefault>
								<ClientSideEvents CellClickHandler="grdDOB_CellClickHandler" AfterRowInsertHandler="grdDOB_AfterRowInsertHandler"></ClientSideEvents>
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
								<igtbl:UltraGridBand AllowUpdate="No" AllowAdd="Yes" GridLines="Horizontal">
									<Columns>
										<igtbl:UltraGridColumn Key="KPIDRK" Width="10%" AllowUpdate="No" ><CellStyle Font-Size="X-Small" Font-Names="Comic Sans MS" ForeColor="Red"></CellStyle>
											<Footer Key="KPIDRK"></Footer>
											<HeaderStyle Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
											<Header Key="KPIDRK" Caption="X"></Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="DOBDttm" Width="50%" AllowUpdate="No" Format="MM/dd/yyyy" BaseColumnName="DOBDttm" ><Footer Key="DOBDttm">
												<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="DOBDttm" Caption="Date Of Birth ">
												<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="SeqNo" Width="0px" AllowUpdate="No" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="SeqNo">
												<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="SeqNo">
												<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="KPIID" Width="0px" AllowUpdate="No" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
												<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="KPIID">
												<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="KPIMode" Width="0px" AllowUpdate="No" Hidden="True" ><Footer Key="KPIMode">
												<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
											</Footer>
											<Header Key="KPIMode">
												<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
											</Header>
										</igtbl:UltraGridColumn>
									</Columns>
									<RowStyle BackColor="White"></RowStyle>
								</igtbl:UltraGridBand>
							</Bands>
						</kpicc:kpigrid></TD>
					<TD style="HEIGHT: 20px"></TD>
				</TR>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<TR>
					<TD></TD>
					<TD></TD>
					<TD></TD>
					<TD></TD>
					<TD><input id="hdnJurisID" type="hidden" name="hdnJurisID" runat="server" /></TD>
					<TD></TD>
					<TD><input id="hdnScreenId" style="WIDTH: 48px" type="hidden" value="8512" name="hdnScreenId" runat="server" /><input id="hdnMode" style="WIDTH: 64px" type="hidden" value="ADD" name="hdnMode" runat="server" /><input id="hdnNameID" style="WIDTH: 40px" type="hidden" name="hdnNameID" runat="server" /><input id="hdnCaller" style="WIDTH: 56px" type="hidden" name="hdnCaller" runat="server" /></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD class="status" colSpan="10">
						<table style="WIDTH: 301px; HEIGHT: 24px">
							<tr>
								<td align="right"><asp:panel id="pnlTblInternal" Width="120px" Height="18px" DESIGNTIMEDRAGDROP="2670" Runat="server"
										HorizontalAlign="Right">
										<TABLE cellSpacing="0" cellPadding="0" border="0">
											<TR>
												<TD noWrap>
													<kpicc:KPIButton id="cmdInternalSave" tabIndex="10" runat="server" KPISecurity="AC" CssClass="Custombtn" KPITabIndex="511" Text="Save" ></kpicc:KPIButton>&nbsp;</TD>
												<TD noWrap>
													<kpicc:KPIButton id="cmdInternalRefresh" tabIndex="11" runat="server" KPISecurity="AC" Width="50px" CssClass="CustomBtn" KPITabIndex="512" KPIRepositoryID="0" Text="Reset" ></kpicc:kpibutton>&nbsp;&nbsp;</TD>
											</TR>
										</TABLE>
									</asp:panel></td>
								<td noWrap width="100%"><kpicc:kpiliteral id="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:kpiliteral>&nbsp;</td>
							</tr>
						</table>
					</TD>
				</TR>
			</table>
		</form>
	</body>
</HTML>
