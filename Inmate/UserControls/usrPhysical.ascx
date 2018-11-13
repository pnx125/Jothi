<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrPhysical.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrPhysical" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="1" width="98%">
	<colgroup>
		<col width="2%" />
		<col align="right" width="11%" />
		<col align="left" width="16%" />
		<col align="left" width="12%" />
		<col align="left" width="49%" />
	</colgroup>
	<TR height="5%">
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD align="left"></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblLastEntry" KPISecurity="ACI" runat="server">Last Entry</kpicc:kpilabel></TD>
		<TD align="left">
			<table cellSpacing="0" cellPadding="0">
				<colgroup>
					<col width="59%" />
					<col align="left" width="41%" />
				</colgroup>
				<tr>
					<td><kpicc:kpilabel id="lblTatoos" KPISecurity="ACI" runat="server" Width="150px" CssClass="Customlbl">Scars/Marks/Tattoos</kpicc:kpilabel></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<kpicc:kpilabel id="lblDesc" KPISecurity="ACI" runat="server" Width="150px" CssClass="Customlbl">Description</kpicc:kpilabel></td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblHeight" KPISecurity="ACI" runat="server" CssClass="Customlbl">Height</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpitextbox id="txtHeight" KPISecurity="AC" runat="server" Width="118px" CssClass="textbox"
				KPITabIndex="601" MaxLength="3"></kpicc:kpitextbox></TD>
		<TD><kpicc:kpitextbox id="txtHtDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10" ReadOnly="True"></kpicc:kpitextbox></TD>
		<TD>
			<table cellSpacing="0" cellPadding="0" width="100%">
				<colgroup>
					<col width="50%" />
					<col align="right" width="25%" />
					<col align="right" width="10%" />
					<col align="left" width="15%" />
				</colgroup>
				<tr>
					<td><kpicc:kpicodedlookup id="lupMarks" KPISecurity="AC" runat="server" KPITabIndex="609" KPIWidth="100" KPICodeID="10001"></kpicc:kpicodedlookup></td>
					<td><kpicc:kpitextbox id="txtSMTDesc" KPISecurity="AC" runat="server" Width="158px" CssClass="textbox"
							KPITabIndex="610"></kpicc:kpitextbox></td>
					<td>&nbsp;<kpicc:KPIImageButton id="cmdAddSMT" runat="server" KPITabIndex="610" ImageUrl="/KPIImages/ico/18_add.gif" ></kpicc:kpiimagebutton></td>
					<td>&nbsp;<kpicc:KPIImageButton id="cmdClearSMT" runat="server" KPITabIndex="611" ImageUrl="/KPIImages/ico/clear_data.gif" ></kpicc:kpiimagebutton></td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblWeight" KPISecurity="ACI" runat="server" Width="83px" CssClass="Customlbl"> Weight</kpicc:kpilabel></TD>
		<TD><kpicc:kpitextbox id="txtWeight" KPISecurity="AC" runat="server" Width="118px" CssClass="textbox"
				KPITabIndex="602" MaxLength="3"></kpicc:kpitextbox></TD>
		<TD><kpicc:kpitextbox id="txtWtDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				ReadOnly="True"></kpicc:kpitextbox></TD>
		<TD colSpan="1" rowSpan="6"><kpicc:kpigrid id="grdMarks" KPISecurity="AC" runat="server" Width="100%" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" RepositoryID="0" Height="140px" KPIRepositoryID="0" KPIDefaultJurisAlias="False" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
						BorderColor="LightSlateGray" BorderStyle="Solid" BackColor="Transparent" Height="140px"></FrameStyle>
					<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
						<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
					</FooterStyleDefault>
					<ClientSideEvents CellClickHandler="grdMarks_CellClickHandler" AfterRowInsertHandler="grdMarks_AfterRowInsertHandler"></ClientSideEvents>
					<ActivationObject BorderWidth="" BorderColor=""></ActivationObject>
					<Images></Images>
					<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>
					<SelectedRowStyleDefault BackColor="OldLace"></SelectedRowStyleDefault>
					<RowAlternateStyleDefault BackColor="AliceBlue"></RowAlternateStyleDefault>
					<RowStyleDefault TextOverflow="Ellipsis" VerticalAlign="Top" BorderWidth="1px" Font-Size="9pt" Font-Names="Verdana"
						BorderColor="LightGray" BorderStyle="Solid" ForeColor="Black" BackColor="White">
						<Padding Left="5px"></Padding>
						<BorderDetails WidthLeft="0px" WidthTop="0px"></BorderDetails>
					</RowStyleDefault>
				</DisplayLayout>
				<Bands>
					<igtbl:UltraGridBand>
						<Columns>
							<igtbl:UltraGridColumn Key="KPIDRK" Width="5%" ><CellButtonStyle Font-Names="Comic Sans MS" ForeColor="Red" CssClass="grdDelText"></CellButtonStyle>
								<CellStyle Font-Names="Comic Sans MS" ForeColor="Red"></CellStyle>
								<Footer Key="KPIDRK"></Footer>
								<HeaderStyle Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
								<Header Key="KPIDRK" Caption="X"></Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="SMT" Width="55%" BaseColumnName="SMT" ><Footer Key="SMT">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="SMT" Caption="SMT">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="SMTD" Width="30%" ><Footer Key="SMTD">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="SMTD" Caption="Description">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
									<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIMode">
									<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
									<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIID">
									<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
						</Columns>
						<RowStyle BackColor="White"></RowStyle>
					</igtbl:UltraGridBand>
				</Bands>
			</kpicc:kpigrid></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblEyes" KPISecurity="ACI" runat="server" CssClass="Customlbl">Eyes</kpicc:kpilabel></TD>
		<TD><kpicc:kpicodeddropdownlist id="cddEyeColor" KPISecurity="AC" runat="server" KPITabIndex="603" KPIWidth="120"
				KPIMode="Add" KPICodeId="3001" KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD><kpicc:kpitextbox id="txtEyesDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				ReadOnly="True"></kpicc:kpitextbox></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblHair" KPISecurity="ACI" runat="server" CssClass="Customlbl">Hair</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpicodeddropdownlist id="cddHairColor" KPISecurity="AC" runat="server" KPITabIndex="604" KPIWidth="120"
				KPIMode="Add" KPICodeId="3002" KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD><kpicc:kpitextbox id="txtHairDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10" ReadOnly="True"></kpicc:kpitextbox></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblSkin" KPISecurity="ACI" runat="server" CssClass="Customlbl">Skin</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpicodeddropdownlist id="cddSkin" runat="server" KPITabIndex="605" KPIWidth="120" KPIMode="Add" KPICodeId="3003"
				KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD><kpicc:kpitextbox id="txtskinDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10"></kpicc:kpitextbox></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblteeth" KPISecurity="ACI" runat="server" CssClass="Customlbl">Teeth</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpicodeddropdownlist id="ccdteeth" KPISecurity="AC" runat="server" KPITabIndex="606" KPIWidth="120" KPICodeId="3004"
				KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD><kpicc:kpitextbox id="txtteethDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10"></kpicc:kpitextbox></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblhand" KPISecurity="ACI" runat="server" CssClass="Customlbl">Hand</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpicodeddropdownlist id="ccdhand" KPISecurity="AC" runat="server" KPITabIndex="606" KPIWidth="120" KPICodeId="3004"
				KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD><kpicc:kpitextbox id="txtBuildDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10"></kpicc:kpitextbox></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblBuild" KPISecurity="ACI" runat="server" CssClass="Customlbl">Build</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpicodeddropdownlist id="cddBuild" KPISecurity="AC" runat="server" KPITabIndex="606" KPIWidth="120" KPICodeId="3004"
				KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblchin" KPISecurity="ACI" runat="server" CssClass="Customlbl">Chin</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpitextbox id="txtchin" KPISecurity="AC" runat="server" Width="118px" CssClass="textbox" KPITabIndex="602"
				MaxLength="3"></kpicc:kpitextbox></TD>
		<TD></TD>
		<TD>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<colgroup>
					<col width="35%" />
					<col width="65%" />
				</colgroup>
				<TR>
					<TD align="right"><kpicc:kpilabel id="KPILabel2" KPISecurity="ACI" runat="server" CssClass="Customlbl">Handicapped</kpicc:kpilabel>&nbsp;</TD>
					<TD><kpicc:kpicodeddropdownlist id="cddHandy" KPISecurity="AC" runat="server" Width="120%" KPITabIndex="612" KPIWidth="195"
							KPIMode="Add" KPICodeId="1088" KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblfacialhair" KPISecurity="ACI" runat="server" CssClass="Customlbl">Facial Hair</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpitextbox id="txtfacialhair" KPISecurity="AC" runat="server" Width="118px" CssClass="textbox"
				KPITabIndex="602" MaxLength="3"></kpicc:kpitextbox></TD>
		<TD><kpicc:kpitextbox id="txtfacialhairDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10"></kpicc:kpitextbox></TD>
		<TD>
			<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<colgroup>
					<col width="35%" />
					<col width="65%" />
				</colgroup>
				<TR>
					<TD align="right"><kpicc:kpilabel id="lblPhysDecs" KPISecurity="ACI" runat="server" CssClass="Customlbl">Physical Description</kpicc:kpilabel>&nbsp;</TD>
					<TD><kpicc:kpitextbox id="txtPhysDesc" KPISecurity="AC" runat="server" Width="196px" CssClass="textbox"
							KPITabIndex="608" MaxLength="255" TextMode="MultiLine" height="25px"></kpicc:kpitextbox></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblCondition" KPISecurity="ACI" runat="server" CssClass="Customlbl">Condition</kpicc:kpilabel>&nbsp;</TD>
		<TD><kpicc:kpicodeddropdownlist id="cddCondition" KPISecurity="AC" runat="server" KPITabIndex="607" KPIWidth="120"
				KPIMode="Add" KPICodeId="1084" KPIDisplayOption="Description"></kpicc:kpicodeddropdownlist></TD>
		<TD><kpicc:kpitextbox id="txtConDttm" KPISecurity="N" runat="server" Width="76px" CssClass="ReadOnlyText"
				MaxLength="10"></kpicc:kpitextbox></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD><input id="hdnHeight" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" name="hdnHeight" runat="server" /><input id="hdnWeight" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" name="hdnWeight" runat="server" /><input id="hdnEyes" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" name="hdnEyes" runat="server" /><input id="hdnHair" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" name="hdnHair" runat="server" /><input id="hdnCondition" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" name="hdnCondition" runat="server" /><input id="hdnBuild" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" name="hdnBuild" runat="server" /></TD>
	</TR>
</table>
