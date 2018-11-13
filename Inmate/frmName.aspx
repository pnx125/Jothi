<%@ Register TagPrefix="uc1" TagName="usrAlias" Src="UserControls/usrAlias.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrAddresses" Src="UserControls/usrAddresses.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrPhysical" Src="UserControls/usrPhysical.ascx" %>
<%@ Register TagPrefix="uc1" TagName="usrMain" Src="UserControls/usrMain.ascx" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebTab.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebTab" TagPrefix="igtab" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Page language="c#" CodeFile="frmName.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmName" %>
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
		<script language="javascript" src="frmName.js?v=2015.10.08" type="text/javascript"></script>
	</HEAD>
	<body class="masterfrm" XMLNS:kpicc="http://schemas.infragistics.com/ASPNET/WebControls/UltraWebTab" ><form id="frmNames_Id" method="post" runat="server" ><DIV class="tab" id="tab0" style="DISPLAY: inline">
				<table class="layout" id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0"
					width="100%">
					<colgroup>
						<col width="1%" />
						<col width="80%" />
						<col width="1%" />
					</colgroup>
					<TBODY>
						<tr>
							<td class="status" vAlign="middle" align="center" colSpan="3"><table cellSpacing="4">
									<tr vAlign="middle">
										<td><kpicc:KPIImageButton id="cmdSave" runat="server" CssClass="menuItem" KPISecurity="AC" AlternateText="Save" ToolTip="Save" ImageUrl="/KPIImages/ico/16_L_save.gif" KPITabIndex="1000" ></kpicc:kpiimagebutton></td>
										<td></td>
										<td><kpicc:KPIImageButton id="cmdSaveNClose" runat="server" CssClass="menuItem" KPISecurity="AC" AlternateText="Save &amp; Close" ToolTip="Save &amp; Close" ImageUrl="/KPIImages/ico/16_saveClose.gif" KPITabIndex="1001" ></kpicc:kpiimagebutton></td>
										<td></td>
										<TD><kpicc:KPIImageButton id="cmdPrint" runat="server" CssClass="menuItem" KPISecurity="ACID" AlternateText="Print" ToolTip="Print" ImageUrl="/KPIImages/ico/16_print.gif" KPITabIndex="1002" CausesValidation="False" ></kpicc:kpiimagebutton></TD>
										<td></td>
										<td><kpicc:KPIImageButton id="cmdRefresh" runat="server" CssClass="menuItem" KPISecurity="ACID" AlternateText="Reset" ToolTip="Reset" ImageUrl="/KPIImages/ico/16_L_refresh.gif" KPITabIndex="1003" CausesValidation="False" ></kpicc:kpiimagebutton></td>
										<td width="100%"><kpicc:kpiaccesscontrol id="alcName" runat="server" KPISecurity="AC" KPITabIndex="1004"></kpicc:kpiaccesscontrol></td>
										<td>
											<kpicc:KPIImageButton id="imgNameContacts" runat="server" KPITabIndex="1000" ImageUrl="/KPIImages/ico/Completed.gif" AlternateText="Remove Business Name Contacts &amp; move to Address Contacts" KPISecurity="C" CssClass="menuItem" Visible="False" ></kpicc:kpiimagebutton></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colSpan="2"></td>
						</tr>
						<tr vAlign="top">
							<td align="center"></td>
							<td align="center">
								<TABLE cellSpacing="0" cellPadding="0">
									<colgroup>
										<col align="right" width="8%" />
										<col align="left" width="30%" />
										<col align="right" width="8%" />
										<col align="left" width="9%" />
										<col align="right" width="1%" />
										<col align="left" width="10%" />
										<col align="left" width="1%" />
									</colgroup>
									<tr>
										<td class="req"><kpicc:kpilabel id="lblJuris" runat="server" Visible="False">Juris</kpicc:kpilabel>&nbsp;</td>
										<td><kpicc:kpijurisdropdownlist id="lstJuris" runat="server" KPISecurity="AC" KPITabIndex="500" KPIWidth="218" Visible="False"></kpicc:kpijurisdropdownlist></td>
										<td colSpan="7"></td>
									</tr>
									<TR>
										<TD><kpicc:kpilabel id="lblID" runat="server">ID</kpicc:kpilabel>&nbsp;</TD>
										<TD>
											<table cellSpacing="0" cellPadding="0">
												<colgroup>
													<col width="3%" />
													<col width="10%" />
													<col width="5%" />
													<col width="10%" />
													<col width="15%" />
												</colgroup>
												<tr>
													<td><kpicc:kpitextbox id="txtNID" runat="server" CssClass="textbox" KPISecurity="AC" KPITabIndex="501"
															Width="23px" MaxLength="1"></kpicc:kpitextbox></td>
													<td><kpicc:kpitextbox id="txtNameID" runat="server" CssClass="textbox" KPISecurity="AC" KPITabIndex="502"
															Width="98px" MaxLength="10"></kpicc:kpitextbox></td>
													<td>
														<kpicc:KPIImageButton id="imgWantBtn" runat="server" ImageUrl="/KPIImages/ico/16_L_remove.gif" ToolTip="Warrant" AlternateText="Reset" KPISecurity="ACID" CssClass="menuItem" CausesValidation="False" ></kpicc:kpiimagebutton></td>
													<td><kpicc:kpilabel id="lblNameType" runat="server" Width="112px" Visible="False" ForeColor="Blue" Font-Bold="True">Set this Name as</kpicc:kpilabel></td>
													<td><kpicc:kpidropdownlist id="cmbNameType" runat="server" KPISecurity="AC" KPITabIndex="503" Width="51px"
															Visible="False">
															<asp:ListItem Value="-1">--</asp:ListItem>
															<asp:ListItem Value="0">A</asp:ListItem>
															<asp:ListItem Value="1">J</asp:ListItem>
															<asp:ListItem Value="2">B</asp:ListItem>
														</kpicc:kpidropdownlist></td>
												</tr>
											</table>
										</TD>
										<TD align="right"><kpicc:kpilabel id="lbldeceased" runat="server">Deceased</kpicc:kpilabel>&nbsp;&nbsp;</TD>
										<TD><kpicc:kpidatechooser id="dtcDeceased" runat="server" KPISecurity="AC" KPITabIndex="511" Width="102px"
												NullDateLabel="Date" OnChangeHandler="ValidateDeceasedDate" Height="18px"></kpicc:kpidatechooser></TD>
										<TD></TD>
										<TD rowSpan="4"><kpicc:KPIImageButton id="imgNameFrontView" runat="server" Width="130px" Height="150px" ></kpicc:kpiimagebutton></TD>
										<TD></TD>
									</TR>
									<TR>
										<TD class="req" vAlign="middle" align="right"><kpicc:kpilabel id="lblNames" runat="server" Font-Bold="True">Name</kpicc:kpilabel>&nbsp;</TD>
										<TD colSpan="3"><kpicc:kpicustomname id="custNames" runat="server" KPISecurity="AC" KPITabIndex="504" Width="462px" Height="24px"
												FullName=",," KPIWidth="0" KPIAddable="Yes" IsMain="True"></kpicc:kpicustomname></TD>
										<TD></TD>
									</TR>
									<TR>
										<TD class="req" align="right"><kpicc:kpilabel id="lblAddress" runat="server" Font-Bold="True">Address</kpicc:kpilabel>&nbsp;</TD>
										<td colSpan="2"><phnxcc:addressctrl id="adrMainAddress" runat="server" KPISecurity="AC" KPITabIndex="505" Width="280px"
												MustValidate="False" OnValidEvent="validateMainAddress" ValidationAddrType="RC"></phnxcc:addressctrl></td>
										<td align="left"></td>
										<TD></TD>
									</TR>
									<TR>
										<TD align="right"><kpicc:kpilabel id="lblCity" runat="server">CSZ-Country</kpicc:kpilabel>&nbsp;</TD>
										<TD><kpicc:kpicustomcsz id="custHeaderCSZ" tabIndex="4" runat="server" KPISecurity="AC" KPITabIndex="506"
												KPIWidth="0" KPIZipLength="0"></kpicc:kpicustomcsz></TD>
										<TD align="left" colSpan="2"><kpicc:kpicodedlookup id="lupCountry" runat="server" KPISecurity="AC" KPITabIndex="507" Width="99px" KPICodeID="2068"></kpicc:kpicodedlookup></TD>
										<TD></TD>
									</TR>
									<TR>
										<TD><kpicc:kpilabel id="lblTelephone" runat="server">Phone</kpicc:kpilabel>&nbsp;</TD>
										<td colSpan="2">
											<table width="100%" cellSpacing="0" cellPadding="0">
												<colgroup>
													<col width="50%" />
													<col width="50%" />
												</colgroup>
												<tr>
													<td><kpicc:kpicustomphone id="cusHeaderPhone1" runat="server" KPISecurity="AC" KPITabIndex="508" KPIWidth="0"
															KPIMode="Add"></kpicc:kpicustomphone></td>
													<TD><kpicc:kpicustomphone id="cusHeaderPhone2" runat="server" KPISecurity="AC" KPITabIndex="509" KPIWidth="0"
															KPIMode="Add"></kpicc:kpicustomphone></TD>
												</tr>
											</table>
										</td>
										<TD align="left">
											<kpicc:KPICheckBox id="chkIsKGIS" runat="server" ToolTip="Don't share with Other Agency" KPISecurity="AC"
												Width="120px" Text="Do Not Share?" KPITabIndex="510"></kpicc:KPICheckBox></TD>
										<TD align="right"></TD>
										<TD align="left">
											<table>
												<tr>
													<td><kpicc:kpidatechooser id="dtcPhotoDate" runat="server" KPISecurity="N" Width="50px" Height="18px" KPIWidth="50"
															ReadOnly="True"></kpicc:kpidatechooser></td>
													<td><kpicc:KPIImageButton id="imgphoto" runat="server" CssClass="menuItem" KPISecurity="ACID" AlternateText="Photo" ToolTip="Photos" ImageUrl="/KPIImages/ico_16_2.gif" CausesValidation="False" Visible="False" ></kpicc:kpiimagebutton></td>
												</tr>
											</table>
										</TD>
									</TR>
									<TR>
										<TD align="right"></TD>
									<TR>
										<TD></TD>
									<TR>
										<TD><input id="hdnBusinessType" type="hidden" name="hdnBusinessType" runat="server" /><input id="hdnBusinessId" type="hidden" name="hdnBusinessId" runat="server" /><input id="hdnAddrMoreID" type="hidden" name="hdnAddrMoreID" runat="server" /><input id="hdnCaller" type="hidden" name="hdnCaller" runat="server" /></TD>
										<TD align="left" colSpan="2"><input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" /><input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" /><input id="hdnScreenId" type="hidden" value="8510" name="hdnScreenId" runat="server" /><input id="hdnPrimeTypeID" type="hidden" name="hdnPrimeTypeID" runat="server" /><input id="hdnPrimeType" type="hidden" name="hdnPrimeType" runat="server" /><input id="hdnAssocID" type="hidden" name="hdnAssocID" runat="server" /><input id="hdnOName" type="hidden" value="0" name="hdnOName" runat="server" /><input id="hdnSelNameID" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" name="hdnSelNameID" runat="server" /><input id="hdnCtrlName" type="hidden" name="hdnCtrlName" runat="server" /><input id="hdnTab" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" name="hdnTab" runat="server" /><input id="hdnLJurisId" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" name="hdnLJurisId" runat="server" /><input id="hdnIsMenu" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" value="0" name="hdnIsMenu" runat="server" /><input id="hdnFNDictID" type="hidden" name="hdnFNDictID" runat="server" /><input id="hdnFNCount" type="hidden" name="hdnFNCount" runat="server" /><input id="hdnAliasDictID" type="hidden" name="hdnAliasDictID" runat="server" /><input id="hdnAliasFNCount" type="hidden" name="hdnAliasFNCount" runat="server" /><input id="hdnPrevAddress" type="hidden" name="hdnPrevAddress" runat="server" /><input id="hdnChgAddr" type="hidden" value="0" name="hdnChgAddr" runat="server" /><input id="hdnIsCtrl" type="hidden" value="0" name="hdnIsCtrl" runat="server" /><input id="hdnIsPhoto" type="hidden" name="hdnIsPhoto" runat="server" value="0" /><input id="hdnPhotoDttm" type="hidden" name="hdnPhotoDttm" runat="server" /><input id="hdnJacket" type="hidden" name="hdnJacket" runat="server" value="0" /></TD>
										<TD align="right"><input id="hdnPhoneNo1" type="hidden" name="hdnPhoneNo1" runat="server" /><input id="hdnPhoneNo2" type="hidden" name="hdnPhoneNo2" runat="server" /><input id="hdnAddrDttm" type="hidden" name="hdnAddrDttm" runat="server" /><input id="hdnIsMain" type="hidden" name="hdnIsMain" runat="server" /></TD>
										<TD></TD>
										<TD align="right"></TD>
										<TD align="left"></TD>
									<tr>
										<td style="HEIGHT: 1px" colSpan="7"></td>
									</tr>
									<tr>
										<td colSpan="7"></td>
									</tr>
								</TABLE>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td><kpicc:kpitab id="tabNames" tabIndex="550" runat="server" KPISecurity="AC" Width="100%" Height="335px"
									BorderColor="#808080" BorderWidth="1px" BorderStyle="Solid" BackColor="Transparent" DummyTargetUrl=" ">
									<HoverTabStyle Cursor="Hand"></HoverTabStyle>
									<ClientSideEvents AfterSelectedTabChange="fn_AfterSelectedTab"></ClientSideEvents>
									<SelectedTabStyle Font-Names="Verdana" Font-Bold="True" BackColor="White"></SelectedTabStyle>
									<DefaultTabStyle Height="20px" Font-Names="Verdana" BackColor="Transparent"></DefaultTabStyle>
									<Tabs>
										<igtab:Tab Key="Main" AccessKey="M" Text="Main">
											<ContentTemplate>
												<uc1:usrMain id="UsrMain1" runat="server"></uc1:usrMain>
											</ContentTemplate>
											<Style BackColor="Transparent">
											</Style>
										</igtab:Tab>
										<igtab:Tab Key="Physical" AccessKey="P" Text="Physical">
											<ContentTemplate>
												<uc1:usrPhysical id="UsrPhysical1" runat="server"></uc1:usrPhysical>
											</ContentTemplate>
											<Style BackColor="Transparent">
											</Style>
										</igtab:Tab>
										<igtab:Tab Tag="" Key="Alias" AccessKey="A" Text="Alias">
											<ContentTemplate>
&nbsp;&nbsp; 
<uc1:usrAlias id="UsrAlias1" runat="server"></uc1:usrAlias>
</ContentTemplate>
											<Style BackColor="Transparent">
											</Style>
										</igtab:Tab>
										<igtab:Tab Key="Addresses" AccessKey="D" Text="Addresses">
											<ContentTemplate>
												<uc1:usrAddresses id="UsrAddresses1" runat="server"></uc1:usrAddresses>
											</ContentTemplate>
											<Style BackColor="Transparent">
											</Style>
										</igtab:Tab>
										<igtab:Tab Key="Information" AccessKey="I" Text="Info">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Key="Employer" AccessKey="E" Text="Emp/School">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Key="Family" AccessKey="F" Text="Family">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Key="Activity" AccessKey="t" Text="Activity">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Key="Gang" AccessKey="G" Text="Gang">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Tag="Warrants" Key="Warrants" Text="Warrants">
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Tag="Associates" Key="Associates" Text="Associates">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Tag="Visitors" Key="Visitors" Text="Visitors">
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Key="Comments" AccessKey="C" Text="Comments">
											<Style BackColor="Transparent">
											</Style>
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
										<igtab:Tab Tag="History" Key="History" Text="History">
											<ContentPane TargetUrl="Blank.htm"></ContentPane>
										</igtab:Tab>
									</Tabs>
									<RoundedImage FillStyle="LeftMergedWithCenter" HoverImage="[ig_tab_winXP2.gif]"  LeftSideWidth="7" NormalImage="[ig_tab_winXP3.gif]" RightSideWidth="6"  SelectedImage="[ig_tab_winXP1.gif]" ShiftOfImages="2" /> </kpicc:kpitab></td>
							<td></td>
						</tr>
						<TR>
							<TD style="HEIGHT: 1px" align="center"></TD>
							<TD style="HEIGHT: 1px"></TD>
							<TD style="HEIGHT: 1px"></TD>
						</TR>
						<TR>
							<TD style="HEIGHT: 3px" colSpan="3">&nbsp;&nbsp;&nbsp;
							</TD>
						</TR>
						<TR>
							<TD class="statusBar" colSpan="3"><kpicc:kpiliteral id="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:kpiliteral></TD>
						</TR>
					</TBODY>
				</table>
			</DIV>
		</form>
	</body>
</HTML>
