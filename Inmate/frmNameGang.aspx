<%@ Page language="c#" CodeFile="frmNameGang.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmNameGang" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>
			<%=strProductTitle%>
			-
			<%=strPageTitle%>
		</TITLE>
		<LINK href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet">
		<%=strDynamicThemes%>
		<script language="javascript" src="../KPIFrameworkWeb/Scripts/Date.js?v=2015.10.08" type="text/javascript"></script>
		<script language="javascript" src="frmNameGang.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" ><form id="frmNameGang_Id" method="post" runat="server" ><DIV class="tab" id="tab0" style="DISPLAY: inline">
				<table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0">
					<colgroup>
						<col width="1%" />
						<col width="95%" />
						<col width="1%" />
					</colgroup>
					<TBODY>
						<tr>
							<td style="HEIGHT: 15px"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<table>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<TBODY>
										<tr>
											<td style="WIDTH: 18.64%; HEIGHT: 7px" align="right"><kpicc:KPIImageButton id="cmdAddGang" tabIndex="1" runat="server" KPISecurity="AC" ImageUrl="/KPIImages/ico/18_add.gif" KPITabIndex="516" ></kpicc:kpiimagebutton>&nbsp;<kpicc:KPIImageButton id="cmdClearGang" tabIndex="3" runat="server" KPISecurity="AC" ImageUrl="/KPIImages/ico/clear_data.gif" KPITabIndex="517" ></kpicc:kpiimagebutton></td>
											<td style="HEIGHT: 7px" align="center"><kpicc:kpilabel id="lblMember" runat="server" Font-Bold="True">Membership  Entry</kpicc:kpilabel></td>
										</tr>
										<tr>
											<TD vAlign="top" rowSpan="8"><kpicc:kpigrid id="grdGang" runat="server" KPISecurity="AC" Width="200px" Height="175px" KPIRepositoryID="0" ImageDirectory="/ig_common/Images/" UseAccessibleHeader="False" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
														<FrameStyle Width="200px" Cursor="Hand" BorderWidth="1px" Font-Size="8pt" Font-Names="Tahoma"
															BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="175px"></FrameStyle>
														<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
															<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
														</FooterStyleDefault>
														<ClientSideEvents CellClickHandler="grdGang_CellClickHandler" AfterRowInsertHandler="grdGang_AfterRowInsertHandler"></ClientSideEvents>
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
																<igtbl:UltraGridColumn Key="GangCodeDesc" Width="90%" AllowUpdate="No" BaseColumnName="GangCodeDesc" ><Footer Key="GangCodeDesc">
																		<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="GangCodeDesc" Caption="Gang Membership">
																		<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="SeqNo" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="SeqNo">
																		<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="SeqNo">
																		<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
																		<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="KPIID">
																		<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
																		<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="KPIMode">
																		<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="GangSet" Hidden="True" BaseColumnName="GangSet" ><Footer Key="GangSet">
																		<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="GangSet">
																		<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="AffiliationDttm" Hidden="True" Format="" BaseColumnName="AffiliationDttm" ><Footer Key="AffiliationDttm">
																		<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="AffiliationDttm">
																		<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="Criteria" Hidden="True" BaseColumnName="Criteria" ><Footer Key="Criteria">
																		<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="Criteria">
																		<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="PatrolArea" Hidden="True" BaseColumnName="PatrolArea" ><Footer Key="PatrolArea">
																		<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="PatrolArea">
																		<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="ActLocation" Hidden="True" BaseColumnName="ActLocation" ><Footer Key="ActLocation">
																		<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="ActLocation">
																		<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsSelf" Hidden="True" Type="CheckBox" BaseColumnName="IsSelf" ><Footer Key="IsSelf">
																		<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsSelf" Caption="S">
																		<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsPhotos" Hidden="True" Type="CheckBox" BaseColumnName="IsPhotos" ><Footer Key="IsPhotos">
																		<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsPhotos" Caption="P">
																		<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsPossession" Hidden="True" Type="CheckBox" BaseColumnName="IsPossession" ><Footer Key="IsPossession">
																		<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsPossession">
																		<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsInformation" Hidden="True" Type="CheckBox" BaseColumnName="IsInformation" ><Footer Key="IsInformation">
																		<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsInformation">
																		<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsTattoos" Hidden="True" Type="CheckBox" BaseColumnName="IsTattoos" ><Footer Key="IsTattoos">
																		<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsTattoos">
																		<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsRituals" Hidden="True" Type="CheckBox" BaseColumnName="IsRituals" ><Footer Key="IsRituals">
																		<RowLayoutColumnInfo OriginX="15"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsRituals">
																		<RowLayoutColumnInfo OriginX="15"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsColors" Hidden="True" Type="CheckBox" BaseColumnName="IsColors" ><Footer Key="IsColors">
																		<RowLayoutColumnInfo OriginX="16"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsColors">
																		<RowLayoutColumnInfo OriginX="16"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="IsObserved" Hidden="True" Type="CheckBox" BaseColumnName="IsObserved" ><Footer Key="IsObserved">
																		<RowLayoutColumnInfo OriginX="17"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="IsObserved">
																		<RowLayoutColumnInfo OriginX="17"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="Cmt" Hidden="True" BaseColumnName="Cmt" ><Footer Key="Cmt">
																		<RowLayoutColumnInfo OriginX="18"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="Cmt">
																		<RowLayoutColumnInfo OriginX="18"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
																<igtbl:UltraGridColumn Key="GangCode" Hidden="True" BaseColumnName="GangCode" ><Footer Key="GangCode">
																		<RowLayoutColumnInfo OriginX="19"></RowLayoutColumnInfo>
																	</Footer>
																	<Header Key="GangCode">
																		<RowLayoutColumnInfo OriginX="19"></RowLayoutColumnInfo>
																	</Header>
																</igtbl:UltraGridColumn>
															</Columns>
															<RowStyle BackColor="White"></RowStyle>
														</igtbl:UltraGridBand>
													</Bands>
												</kpicc:kpigrid></TD>
											<td>
												<table cellSpacing="0" cellPadding="3" width="100%">
													<colgroup>
														<col width="25%" />
														<col width="25%" />
														<col width="15%" />
														<col width="10%" />
														<col width="18%" />
													</colgroup>
													<tr>
														<td align="right"><kpicc:kpilabel id="lblGang" runat="server" KPISecurity="I">Gang</kpicc:kpilabel></td>
														<td><kpicc:kpicodeddropdownlist id="cddGang" runat="server" KPISecurity="AC" KPICodeID="3022" KPIWidth="170" KPITabIndex="501"></kpicc:kpicodeddropdownlist></td>
														<td align="right"><kpicc:kpilabel id="lblDate" runat="server">Affiliation Date</kpicc:kpilabel></td>
														<td align="left"><kpicc:kpidatechooser id="dtcAffiDate" runat="server" KPISecurity="AC" Width="96px" NullDateLabel="Select Date"
																KPITabIndex="508"></kpicc:kpidatechooser></td>
														<td></td>
													</tr>
													<tr>
														<td align="right"><kpicc:kpilabel id="lblSet" runat="server">GangSet</kpicc:kpilabel></td>
														<td><kpicc:kpitextbox id="txtGangSet" runat="server" KPISecurity="AC" Width="168px" MaxLength="20" CssClass="textbox"
																KPITabIndex="502"></kpicc:kpitextbox></td>
														<td align="right"><kpicc:kpilabel id="KPILabel4" runat="server">Level of Criteria</kpicc:kpilabel></td>
														<td><kpicc:kpitextbox id="txtCriteria" runat="server" KPISecurity="AC" Width="32px" MaxLength="1" CssClass="textbox"
																KPITabIndex="509"></kpicc:kpitextbox></td>
														<td></td>
													</tr>
													<tr>
														<td align="right" style="HEIGHT: 27px"><kpicc:kpilabel id="lblActivity" runat="server" Width="120px">Location of Activity</kpicc:kpilabel></td>
														<td style="HEIGHT: 27px"><kpicc:kpitextbox id="txtActLocation" runat="server" KPISecurity="AC" Width="168px" MaxLength="50"
																CssClass="textbox" KPITabIndex="503"></kpicc:kpitextbox></td>
														<td align="right" style="HEIGHT: 27px"><kpicc:kpilabel id="lblArea" runat="server">Patrol Area</kpicc:kpilabel></td>
														<td colSpan="2" style="HEIGHT: 27px"><kpicc:kpicodeddropdownlist id="cddPatrol" runat="server" KPISecurity="AC" KPICodeID="2066" KPIWidth="120" KPITabIndex="510"></kpicc:kpicodeddropdownlist></td>
													</tr>
													<tr>
														<td></td>
														<td><kpicc:kpicheckbox id="chkIsSelf" runat="server" KPISecurity="AC" Text="Self Admission" KPITabIndex="504"></kpicc:kpicheckbox></td>
														<td colSpan="3"><kpicc:kpicheckbox id="chkIsInformation" runat="server" KPISecurity="AC" Text="Information from Outside Agency"
																KPITabIndex="511"></kpicc:kpicheckbox></td>
													</tr>
													<TR>
														<td></td>
														<td><kpicc:kpicheckbox id="chkIsRituals" runat="server" KPISecurity="AC" Text="Gang Rituals / Handsigns"
																KPITabIndex="505"></kpicc:kpicheckbox></td>
														<td colSpan="3"><kpicc:kpicheckbox id="chkIsPhotos" runat="server" KPISecurity="AC" Text="Photos with Gang Members"
																KPITabIndex="512"></kpicc:kpicheckbox></td>
													</TR>
													<TR>
														<td></td>
														<td><kpicc:kpicheckbox id="chkIsColors" runat="server" KPISecurity="AC" Text="Gang Colors / Flags" KPITabIndex="506"></kpicc:kpicheckbox></td>
														<td colSpan="3"><kpicc:kpicheckbox id="chkIsPossession" runat="server" KPISecurity="AC" Text="Possession of Gang Material"
																KPITabIndex="513"></kpicc:kpicheckbox></td>
													</TR>
													<TR>
														<td></td>
														<td><kpicc:kpicheckbox id="chkIsTattoos" runat="server" KPISecurity="AC" Width="136px" Text="Gang Tattoos"
																KPITabIndex="507"></kpicc:kpicheckbox></td>
														<TD colSpan="3"><kpicc:kpicheckbox id="chkIsObserved" runat="server" KPISecurity="AC" Width="282px" Text="Observed with Known Gang Members"
																KPITabIndex="514"></kpicc:kpicheckbox></TD>
													</TR>
													<TR>
														<td align="right"><kpicc:kpilabel id="lblcomment" runat="server">Comments</kpicc:kpilabel>&nbsp;</td>
														<td colSpan="4"><kpicc:kpitextbox id="txtComments" runat="server" KPISecurity="AC" Width="388px" Height="42px" MaxLength="255"
																TextMode="MultiLine" KPITabIndex="515"></kpicc:kpitextbox></td>
													</TR>
													<TR>
														<td><input id="hdnMode" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" value="ADD" name="hdnMode" runat="server" /></td>
														<td style="WIDTH: 282px"><input id="hdnScreenId" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" value="8514" name="hdnScreenId" runat="server" /><input id="hdnNameID" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" name="hdnNameID" runat="server" /><input id="hdnCaller" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" name="hdnCaller" runat="server" /><input id="hdnJurisID" style="WIDTH: 48px; HEIGHT: 22px" type="hidden" name="hdnJurisID" runat="server" /></td>
														<td style="WIDTH: 1px"></td>
														<td></td>
													</TR>
												</table>
											</td>
										</tr>
									</TBODY>
								</table>
							</td>
						</tr>
						<tr>
						<tr>
							<td colSpan="3"></td>
						</tr>
						<tr>
							<TD class="status" colSpan="3">
								<table>
									<tr>
										<td align="right"><asp:panel id="pnlTblInternal" Width="120px" Height="18px" DESIGNTIMEDRAGDROP="2670" HorizontalAlign="Right"
												Runat="server">
												<TABLE cellSpacing="0" cellPadding="0" border="0">
													<TR>
														<TD noWrap>
															<kpicc:KPIButton id="cmdInternalSave" tabIndex="10" runat="server" KPITabIndex="518" KPISecurity="AC" CssClass="Custombtn" Text="Save" ></kpicc:KPIButton>&nbsp;</TD>
														<TD noWrap>
															<kpicc:KPIButton id="cmdInternalRefresh" tabIndex="11" runat="server" KPITabIndex="519" KPISecurity="AC" KPIRepositoryID="0" Width="50px" CssClass="CustomBtn" Text="Reset" ></kpicc:kpibutton>&nbsp;&nbsp;</TD>
													</TR>
												</TABLE>
											</asp:panel></td>
										<td noWrap width="100%"><kpicc:kpiliteral id="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:kpiliteral>&nbsp;</td>
									</tr>
								</table>
							</TD>
						</tr>
					</TBODY>
				</table>
			</DIV>
		</form>
	</body>
</HTML>
