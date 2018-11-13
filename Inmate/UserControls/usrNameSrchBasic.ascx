<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.WebDataInput.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebDataInput" TagPrefix="igtxt" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="cc1" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebToolbar.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebToolbar" TagPrefix="igtbar" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebNavigator.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebNavigator" TagPrefix="ignav" %>
<%@ Register Assembly="Infragistics35.WebUI.WebNavBar.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebNavBar" TagPrefix="ignavbar" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtblexp1" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtblexp" %>
<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrNameSrchBasic.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrNameSrchBasic" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<TABLE style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0">
	<COLGROUP>
		<COL width="3%" />
		<COL width="25%" />
		<COL width="25%" />
		<COL width="25%" />
		<COL width="4%" />
		<COL width="6%" />
	</COLGROUP>
	<TR>
		<TD style="WIDTH: 2.92%; HEIGHT: 17px"></TD>
		<TD style="WIDTH: 29.8%; HEIGHT: 17px" colSpan="4"></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<tr>
		<td></td>
		<td align="left" colspan="4">
			<table width="100%">
				<colgroup>
					<col width="5%" />
					<col width="95%" />
				</colgroup>
				<tr>
					<td align="left"><kpicc:kpilabel id="lblJuris" runat="server" Visible="False">Juris</kpicc:kpilabel>&nbsp;</td>
					<td align="left"><kpicc:kpijurisdropdownlist id="lstJuris" runat="server" KPITabIndex="500" KPIWidth="218" KPIMode="Search" KPIIsStartUp="True"
							Visible="False"></kpicc:kpijurisdropdownlist></td>
				</tr>
			</table>
		</td>
	</tr>
	<TR>
		<TD></TD>
		<TD align="left" style="WIDTH: 29.8%" colSpan="4"><kpicc:kpilabel id="Kpilabel1" Font-Bold="True" runat="server">Name</kpicc:kpilabel></TD>
	</TR>
	<TR>
		<TD style="WIDTH: 2.92%"></TD>
		<td colSpan="5">
			<table>
				<TR>
					<TD><kpicc:kpilabel id="lblNameType" runat="server">NameType</kpicc:kpilabel></TD>
					<TD>&nbsp;<kpicc:kpilabel id="lblLastName" runat="server">Last Name</kpicc:kpilabel></TD>
					<TD><kpicc:kpilabel id="lblFirstName" runat="server">First Name</kpicc:kpilabel></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<tr>
					<TD><kpicc:kpicodeddropdownlist id="cddNameType" runat="server" KPIWidth="60" KPICodeID="1931" KPIMode="Search"
							KPIDisplayOption="Description" KPIOnChangeHandler="onChangeNameType" KPITabIndex="501"></kpicc:kpicodeddropdownlist></TD>
					<TD><kpicc:kpitextbox id="txtLastName" runat="server" Width="256px" KPITabIndex="502" MaxLength="40"></kpicc:kpitextbox></TD>
					<TD><kpicc:kpitextbox id="txtFirstName" runat="server" Width="248px" KPITabIndex="503" MaxLength="25"></kpicc:kpitextbox></TD>
					<TD></TD>
					<TD></TD>
				</tr>
			</table>
		</td>
	</TR>
	<TR>
		<TD></TD>
		<TD style="WIDTH: 14.37%"><kpicc:kpicheckbox id="chkSound" runat="server" KPISecurity="I" Text="Sound alike" KPITabIndex="504"></kpicc:kpicheckbox></TD>
		<TD>
			<kpicc:kpicheckbox id="chkNickName" runat="server" Text="Include Nick Names" KPISecurity="I" KPITabIndex="505"></kpicc:kpicheckbox></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="HEIGHT: 28px"></TD>
		<TD style="WIDTH: 29.8%; HEIGHT: 28px" colSpan="4"></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD style="WIDTH: 29.8%" colSpan="4">
			<div id="PhysicalDescriptors">
				<TABLE width="100%">
					<COLGROUP>
						<COL align="left" width="1%" />
						<COL width="2%" />
						<COL align="right" width="3%" />
						<COL width="5%" />
						<COL align="right" width="5%" />
						<COL width="10%" />
						<COL align="right" width="5%" />
						<COL width="10%" />
						<COL align="right" width="5%" />
						<COL width="10%" />
					</COLGROUP>
					<TR>
						<TD colSpan="9"><kpicc:kpilabel id="phyDesc" Font-Bold="True" runat="server">Physical Descriptors</kpicc:kpilabel></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD align="right"><kpicc:kpilabel id="lblSex" runat="server">Sex</kpicc:kpilabel></TD>
						<TD><kpicc:kpicodeddropdownlist id="cddSex" runat="server" KPISecurity="I" KPIWidth="60" KPICodeId="1085" KPIDisplayOption="Description"
								KPIMode="Search" KPITabIndex="506"></kpicc:kpicodeddropdownlist></TD>
						<TD><kpicc:kpilabel id="lblRace" runat="server">Race</kpicc:kpilabel></TD>
						<TD><kpicc:kpicodeddropdownlist id="cddRace" runat="server" KPISecurity="I" KPIWidth="120" KPICodeId="1011" KPIDisplayOption="Description"
								KPIMode="Search" KPITabIndex="507"></kpicc:kpicodeddropdownlist></TD>
						<TD align="right"><kpicc:kpilabel id="lblAge" runat="server">Age</kpicc:kpilabel></TD>
						<TD>
							<TABLE width="100%">
								<TR>
									<TD width="60%"><kpicc:kpitextbox id="txtAge" runat="server" KPISecurity="I" MaxLength="3" CssClass="textbox" KPITabIndex="508"></kpicc:kpitextbox></TD>
									<TD align="center" colSpan="1"><asp:image id="Image3" runat="server" ImageUrl="/KPIImages/ico/plus.gif"></asp:image></TD>
									<TD width="100%" colSpan="2"><kpicc:kpitextbox id="txtAgeRange" runat="server" KPISecurity="I" MaxLength="1" CssClass="textbox"
											width="100%" KPITabIndex="509"></kpicc:kpitextbox></TD>
								</TR>
							</TABLE>
						</TD>
						<TD><kpicc:kpilabel id="Kpilabel10" runat="server">Height</kpicc:kpilabel></TD>
						<TD>
							<TABLE width="100%">
								<TR>
									<TD width="50%"><kpicc:kpitextbox id="txtHeight" runat="server" KPISecurity="I" MaxLength="3" CssClass="textbox" KPITabIndex="510"></kpicc:kpitextbox></TD>
									<TD align="center" colSpan="1"><asp:image id="Image2" runat="server" ImageUrl="/KPIImages/ico/plus.gif"></asp:image></TD>
									<TD width="100%" colSpan="2"><kpicc:kpitextbox id="txtHtRange" runat="server" KPISecurity="I" MaxLength="1" CssClass="textbox"
											KPITabIndex="511"></kpicc:kpitextbox></TD>
								</TR>
							</TABLE>
						</TD>
						<TD><kpicc:kpilabel id="KPILabel15" runat="server">Weight</kpicc:kpilabel></TD>
						<TD>
							<TABLE width="100%">
								<TR>
									<TD width="50%"><kpicc:kpitextbox id="txtWeight" KPITabIndex="512" runat="server" KPISecurity="I" MaxLength="3" CssClass="textbox"></kpicc:kpitextbox></TD>
									<TD align="center" colSpan="1"><asp:image id="Image1" runat="server" ImageUrl="/KPIImages/ico/plus.gif"></asp:image></TD>
									<TD width="100%" colSpan="2"><kpicc:kpitextbox id="txtWtRange" KPITabIndex="513" runat="server" KPISecurity="I" MaxLength="1" CssClass="textbox"></kpicc:kpitextbox></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</div>
		</TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="HEIGHT: 25px"></TD>
		<TD style="WIDTH: 3.92%; HEIGHT: 25px" colSpan="4"></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="HEIGHT: 16px"></TD>
		<TD style="HEIGHT: 16px" colSpan="2">
			<kpicc:kpilabel id="Kpilabel11" runat="server" Font-Bold="True">Address Search</kpicc:kpilabel></TD>
		<TD style="WIDTH: 29.5%; HEIGHT: 16px" colSpan="2">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD width="50%">
						<kpicc:kpilabel id="Kpilabel14" runat="server">City</kpicc:kpilabel></TD>
					<TD>
						<kpicc:kpilabel id="lblState" runat="server">State</kpicc:kpilabel></TD>
				</TR>
			</TABLE>
		</TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="HEIGHT: 16px"></TD>
		<TD style="HEIGHT: 25px" colSpan="2"><phnxcc:addressctrl id="adrNameAddress" runat="server" KPISecurity="I" KPIMode="Search" ValidationAddrType="RCS"
				KPITabIndex="514" MustValidate="False"></phnxcc:addressctrl></TD>
		<TD style="WIDTH: 29.5%; HEIGHT: 25px" colSpan="2">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD width="50%">
						<kpicc:kpitextbox id="txtCity" runat="server" KPITabIndex="515" MaxLength="20" Width="80%" KPISecurity="I"
							CssClass="textbox"></kpicc:kpitextbox></TD>
					<TD>
						<kpicc:kpicodeddropdownlist id="cddState" tabIndex="15" runat="server" KPITabIndex="516" KPIDisplayOption="CodeValue"
							KPIMode="Add" KPIWidth="50" Width="80%" KPISecurity="I" KPICodeId="2009"></kpicc:kpicodeddropdownlist></TD>
				</TR>
			</TABLE>
		</TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="HEIGHT: 25px"></TD>
		<TD style="WIDTH: 3.92%; HEIGHT: 25px" colSpan="4"></TD>
		<TD></TD>
	</TR>
	<tr>
		<td></td>
		<td colspan="5"><div id="flags"><table>
					<TR>
						<TD style="WIDTH: 29.8%; HEIGHT: 22px"><kpicc:kpilabel id="lblFlag" Font-Bold="True" runat="server">Flags</kpicc:kpilabel></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 19.46%; HEIGHT: 22px"><kpicc:kpicodeddropdownlist id="cddFlag" runat="server" Width="150px" KPISecurity="I" KPIDisplayOption="Description"
								KPIMode="Search" KPICodeID="2067" KPITabIndex="517"></kpicc:kpicodeddropdownlist></TD>
						<TD style="WIDTH: 29.5%; HEIGHT: 22px"></TD>
						<TD></TD>
					</TR>
				</table>
			</div>
		</td>
	</tr>
	<TR>
		<TD style="HEIGHT: 28px"></TD>
		<TD style="WIDTH: 29.8%; HEIGHT: 28px" colSpan="4"></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="WIDTH: 0.34%"></TD>
		<TD colSpan="4"></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD style="WIDTH: 0.34%; HEIGHT: 14px"></TD>
		<TD style="HEIGHT: 14px" colSpan="4"></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD colSpan="5"></TD>
		<TD></TD>
	</TR>
</TABLE>
