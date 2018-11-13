<%@ Page language="c#" CodeFile="frmAssociates.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmAssociates" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics35.WebUI.UltraWebGrid.v9.1, Version=9.1.20091.2055, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
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
	<body ><form id="Form1_Id" method="post" runat="server" ><DIV class="tab" id="tab11" style="DISPLAY: inline">
				<TABLE id="Table1" cellSpacing="0" cellPadding="2" width="100%" border="0">
					<colgroup>
						<col width="2%" />
						<col width="13%" />
						<col width="75" />
						<col width="10%" />
					</colgroup>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD align="right" class="req">
							<kpicc:kpilabel id="Kpilabel1" runat="server"> Date</kpicc:kpilabel>&nbsp;</TD>
						<TD>
							<kpicc:KPIDateChooser id="dttDate" runat="server" KPITabIndex="601"></kpicc:KPIDateChooser></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD align="right" class="req">
							<kpicc:kpilabel id="lblspnno" runat="server">SPN</kpicc:kpilabel>&nbsp;</TD>
						<TD>
							<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<colgroup>
									<col width="16%" />
									<col width="49%" />
									<col width="35%" />
								</colgroup>
								<TR>
									<TD>
										<kpicc:kpitextbox id="txtSPINNO" onblur="return doCaps(this)" tabIndex="-1" runat="server" KPITabIndex="567"
											KPISecurity="AC" Width="90%" CssClass="textbox" MaxLength="10"></kpicc:kpitextbox></TD>
									<TD>
										<kpicc:kpicustomname id="custNames" runat="server" KPITabIndex="504" Width="100%" KPIWidth="0" KPISecurity="AC"
											Height="24px" FullName=",," KPIAddable="Yes" IsMain="True"></kpicc:kpicustomname></TD>
									<TD>
										<kpicc:KPICheckBox id="ChkAssocNotAllow" runat="server" KPITabIndex="603" Text="Association Not Allowed"></kpicc:KPICheckBox></TD>
								</TR>
							</TABLE>
						</TD>
						</TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD class="req" align="right"></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD align="right">
							<kpicc:kpilabel id="lblcomnt" runat="server">Comment</kpicc:kpilabel>&nbsp;</TD>
						<TD>
							<kpicc:KPITextBox id="txtcomment" runat="server" TextMode="MultiLine" KPITabIndex="604" Width="100%"></kpicc:KPITextBox></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD align="right"></TD>
						<TD align="right"></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD align="right">
							<kpicc:KPIImageButton id="imgAdd" runat="server" KPISecurity="AC" KPITabIndex="605" ImageUrl="/KPIImages/ico/18_add.gif" ></kpicc:kpiimagebutton>
							<kpicc:KPIImageButton id="imgClear" runat="server" KPISecurity="AC" KPITabIndex="606" ImageUrl="/KPIImages/ico/clear_data.gif" ></kpicc:kpiimagebutton></TD>
						<TD align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
					</TR>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD>
							<kpicc:kpigrid id="grdassociates" tabIndex="1" runat="server" KPISecurity="AC" KPIRepositoryID="0" KPIDefaultJurisAlias="False" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" RepositoryID="0" Height="180px" Width="100%" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
										BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="180px"></FrameStyle>
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
											<igtbl:UltraGridColumn Key="Date" Width="25%" AllowUpdate="No" BaseColumnName="Date" ><Footer Key="Date"></Footer>
												<Header Key="Date" Caption="Date"></Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Associate" FooterText="Warrant#" Width="25%" BaseColumnName="Associate" ><Footer Key="Associate" Caption="Warrant#">
													<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Associate" Caption="Associates">
													<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Location" FooterText="" Width="25%" BaseColumnName="Location" ><Footer Key="Location" Caption="">
													<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Location" Caption="Location">
													<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="Comment" FooterText="Comment" Width="25%" BaseColumnName="Comment" ><Footer Key="Comment" Caption="Comment">
													<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="Comment" Caption="Comment">
													<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="NameID" ><Footer Key="KPIID">
													<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="KPIID" Caption="">
													<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
											<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
													<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
												</Footer>
												<Header Key="KPIMode">
													<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
												</Header>
											</igtbl:UltraGridColumn>
										</Columns>
										<RowStyle BackColor="White"></RowStyle>
									</igtbl:UltraGridBand>
								</Bands>
							</kpicc:kpigrid></TD>
						<TD align="right"></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD align="center" colSpan="3"></TD>
					</TR>
				</TABLE>
			</DIV>
			<input id="hdnMode" style="Z-INDEX: 102; LEFT: 248px; WIDTH: 56px; POSITION: absolute; TOP: 416px; HEIGHT: 22px" type="hidden" value="ADD" name="hdnMode" /><input id="hdnScreenID" style="Z-INDEX: 103; LEFT: 192px; WIDTH: 48px; POSITION: absolute; TOP: 416px; HEIGHT: 22px" type="hidden" value="8520" name="hdnScreenID" /></form>
	</body>
</HTML>
