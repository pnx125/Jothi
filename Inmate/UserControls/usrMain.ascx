<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrMain.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMain" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="1" width="100%">
	<colgroup>
		<col width="2%" />
		<col width="26%" />
		<col align="right" width="12%" />
		<col width="0%" />
		<col width="23%" />
		<col align="right" width="12%" />
		<col width="0%" />
		<col width="25%" />
	</colgroup>
	<TR>
		<TD colSpan="8"></TD>
	</TR>
	<TR height="10%">
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblFlag" runat="server" Width="150px" BorderColor="Transparent" BackColor="Transparent"
				Height="25px" Font-Size="Larger" Font-Bold="True" ForeColor="Red"> **  Flags  **</kpicc:kpilabel></TD>
		<TD><kpicc:kpilabel id="lblspnno" runat="server" CssClass="Customlbl">SPN</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD>
			<kpicc:kpimaskedit id="txtspnno" tabIndex="-1" Width="150px" runat="server" KPITabIndex="558" KPISecurity="AC"
				InputMask="###-##-####"></kpicc:kpimaskedit></TD>
		<TD><kpicc:kpilabel id="lblSex" runat="server" CssClass="Customlbl">Sex</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpicodeddropdownlist id="cddSex" tabIndex="21" runat="server" KPITabIndex="555" KPIWidth="180" KPISecurity="AC"
				KPIMode="Add" KPIDisplayOption="Description" KPICodeId="1085"></kpicc:kpicodeddropdownlist></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD>
			<table cellSpacing="0" cellPadding="0">
				<colgroup>
					<col width="70%" />
					<col width="8%" />
					<col align="left" width="15%" />
				</colgroup>
				<tr>
					<td><kpicc:kpicodeddropdownlist id="cddFlag" runat="server" KPITabIndex="551" KPIWidth="150" KPISecurity="AC" KPIMode="Add"
							KPIDisplayOption="Description" KPICodeId="2067"></kpicc:kpicodeddropdownlist></td>
					<TD>&nbsp;
						<kpicc:KPIImageButton id="cmdAddFlag" runat="server" KPITabIndex="552" KPISecurity="AC" ImageUrl="/KPIImages/ico/18_add.gif" ></kpicc:kpiimagebutton></TD>
					<TD>&nbsp;<kpicc:KPIImageButton id="cmdClearFlag" runat="server" KPITabIndex="553" KPISecurity="AC" ImageUrl="/KPIImages/ico/clear_data.gif" ></kpicc:kpiimagebutton></TD>
				</tr>
			</table>
		</TD>
		<TD><kpicc:kpilabel id="lblSS" runat="server" CssClass="Customlbl">SS#</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD>
			<kpicc:kpimaskedit id="mskSSN" tabIndex="-1" Width="150px" runat="server" KPITabIndex="558" KPISecurity="AC"
				InputMask="###-##-####"></kpicc:kpimaskedit></TD>
		<TD><kpicc:kpilabel id="lblRace" runat="server" CssClass="Customlbl">Race/Ethnic</kpicc:kpilabel>&nbsp;</TD>
		<TD colSpan="2">
			<table cellSpacing="0" cellPadding="0" width="100%">
				<colgroup>
					<col width="30%" />
					<col align="left" width="10%" />
					<col align="left" width="40%" />
				</colgroup>
				<tr>
					<td><kpicc:kpicodeddropdownlist id="cddRace" tabIndex="23" runat="server" KPITabIndex="556" KPIWidth="100" KPISecurity="AC"
							KPIMode="Add" KPIDisplayOption="Description" KPICodeId="1011"></kpicc:kpicodeddropdownlist></td>
					<TD><kpicc:kpicodeddropdownlist id="cddEthnicity" tabIndex="24" runat="server" KPITabIndex="557" KPIWidth="80" KPISecurity="AC"
							KPIMode="Add" KPIDisplayOption="Description" KPICodeId="2069"></kpicc:kpicodeddropdownlist></TD>
					<td></td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD rowSpan="9"><kpicc:kpigrid id="grdFlag" runat="server" Width="100%" Height="200px" KPISecurity="AC" KPIDefaultJurisAlias="False" KPIRepositoryID="0" RepositoryID="0" ImageDirectory="/ig_common/Images/" UseAccessibleHeader="False" ><DisplayLayout ColWidthDefault="100%" RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" ScrollBarView="Vertical" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
						<ButtonStyle BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray" ><BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

						</ButtonStyle></AddNewBox>
					<Pager PageSize="5">
						<PagerStyle BorderWidth="1px" Font-Size="X-Small" Font-Bold="True" BorderColor="#ABC0E7" BorderStyle="Solid" BackColor="#7288AC" Height="20px" ><BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

						</PagerStyle></Pager>
					<HeaderStyleDefault VerticalAlign="Middle" Font-Bold="True" BorderStyle="Solid" HorizontalAlign="Left"
						ForeColor="White" BackColor="#7288AC" Height="20px">
						<Padding Left="3px" Right="3px"></Padding>
						<BorderDetails ColorTop="171, 192, 231" WidthLeft="1px" ColorBottom="0, 55, 122" WidthTop="1px"
							ColorRight="0, 55, 122" ColorLeft="171, 192, 231"></BorderDetails>
					</HeaderStyleDefault>
					<RowSelectorStyleDefault Cursor="Default" BorderStyle="Solid" BackgroundImage="..\images\ig_tblArrowRight.gif"
						BackColor="AliceBlue">
						<BorderDetails WidthLeft="0px" ColorBottom="224, 224, 224" WidthTop="0px" WidthRight="0px" StyleTop="None"
							WidthBottom="1px"></BorderDetails>
					</RowSelectorStyleDefault>
					<FrameStyle Width="100%" BorderWidth="1px" Font-Size="8pt" Font-Names="Verdana" BorderColor="#004000"
						BorderStyle="Solid" BackColor="Transparent" Height="200px"></FrameStyle>
					<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
						<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
					</FooterStyleDefault>
					<ClientSideEvents CellClickHandler="grdAlias_CellClickHandler" AfterRowInsertHandler="grdAlias_AfterRowInsertHandler"></ClientSideEvents>
					<ActivationObject BorderWidth="" BorderColor=""></ActivationObject>
					<Images></Images>
					<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>
					<SelectedRowStyleDefault BackColor="OldLace"></SelectedRowStyleDefault>
					<RowAlternateStyleDefault BackColor="AliceBlue"></RowAlternateStyleDefault>
					<RowStyleDefault TextOverflow="Ellipsis" VerticalAlign="Top" BorderWidth="1px" Font-Size="9pt" Font-Names="Verdana"
						BorderColor="LightGray" BorderStyle="Solid" ForeColor="Black" BackColor="White">
						<Padding Left="5px"></Padding>
						<BorderDetails ColorTop="DimGray" WidthLeft="0px" ColorBottom="DimGray" WidthTop="0px"></BorderDetails>
					</RowStyleDefault>
				</DisplayLayout>
				<Bands>
					<igtbl:UltraGridBand>
						<Columns>
							<igtbl:UltraGridColumn Key="KPIDRK" Width="8%" FooterTotal="Avg" ><CellStyle Font-Size="XX-Small" Font-Names="Comic Sans MS" Font-Bold="True" HorizontalAlign="Center"
									ForeColor="Red" CssClass="grdDelText"></CellStyle>
								<Footer Total="Avg" Key="KPIDRK"></Footer>
								<HeaderStyle Font-Size="X-Small" Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
								<Header Key="KPIDRK" Caption=" X"></Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Flag" Width="92%" BaseColumnName="Flag" ><Footer Key="Flag">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Flag" Caption="Flag">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIMode" Caption="KPIMode">
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
						</Columns>
						<RowStyle BackColor="White"></RowStyle>
					</igtbl:UltraGridBand>
				</Bands>
			</kpicc:kpigrid></TD>
		<TD><kpicc:kpilabel id="lblSBI" runat="server" CssClass="Customlbl">State#</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpitextbox id="txtSBI" onblur="return doCaps(this)" tabIndex="-1" runat="server" Width="150px"
				CssClass="textbox" KPITabIndex="567" KPISecurity="AC" MaxLength="10"></kpicc:kpitextbox></TD>
		<TD><kpicc:kpilabel id="lblBirthDate" runat="server" CssClass="Customlbl">Birth Date/Age</kpicc:kpilabel>&nbsp;</TD>
		<TD colSpan="2">
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<colgroup>
					<col width="58%" />
					<col width="42%" />
				</colgroup>
				<tr>
					<td><kpicc:kpidatechooser id="dtDOB" runat="server" Width="120px" Height="8px" KPITabIndex="554" KPIWidth="100"
							KPISecurity="AC" OnChangeHandler="SetNameType" NullDateLabel="BirthDate"></kpicc:kpidatechooser></td>
					<td><kpicc:kpitextbox id="txtAge" tabIndex="-1" runat="server" Width="40px" KPISecurity="N" MaxLength="3"
							ReadOnly="True"></kpicc:kpitextbox></td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblFBI" runat="server" CssClass="Customlbl"> FBI#</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpitextbox id="txtFBI" onblur="return doCaps(this)" tabIndex="-1" runat="server" Width="150px"
				CssClass="textbox" KPITabIndex="568" KPISecurity="AC" MaxLength="10"></kpicc:kpitextbox></TD>
		<TD><kpicc:kpilabel id="lblBirthplace" runat="server" CssClass="Customlbl">Birth City</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpitextbox id="txtBirthCity" onblur="return doChangeCaps(this)" tabIndex="26" runat="server"
				Width="180px" CssClass="textbox" KPITabIndex="564" KPISecurity="AC" MaxLength="25"></kpicc:kpitextbox></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblDL" runat="server" CssClass="Customlbl">DL/State#</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<colgroup>
					<col width="25%" />
					<col width="75%" />
				</colgroup>
				<TR>
					<TD><kpicc:kpitextbox id="txtDL" onblur="return doCaps(this)" tabIndex="-1" runat="server" Width="108px"
							CssClass="textbox" KPITabIndex="559" KPISecurity="AC" MaxLength="25"></kpicc:kpitextbox></TD>
					<TD><kpicc:kpicodeddropdownlist id="cddDLState" tabIndex="15" runat="server" KPITabIndex="560" KPIWidth="40" KPISecurity="AC"
							KPIMode="Add" KPIDisplayOption="CodeValue" KPICodeId="2009"></kpicc:kpicodeddropdownlist></TD>
				</TR>
			</TABLE>
		</TD>
		<TD><kpicc:kpilabel id="lblStateCounty" runat="server" CssClass="Customlbl">Birth State/County</kpicc:kpilabel></TD>
		<TD colSpan="2">
			<TABLE cellSpacing="0" cellPadding="0">
				<COLGROUP>
					<COL width="10%" />
					<COL width="90%" />
				</COLGROUP>
				<TR>
					<TD><kpicc:kpicodeddropdownlist id="cddBirthState" tabIndex="27" runat="server" KPITabIndex="565" KPIWidth="50"
							KPISecurity="AC" KPIMode="Add" KPIDisplayOption="CodeValue" KPICodeId="2009"></kpicc:kpicodeddropdownlist></TD>
					<TD><kpicc:kpicodeddropdownlist id="cddCounty" tabIndex="28" runat="server" Width="70%" KPITabIndex="566" KPIWidth="130"
							KPISecurity="AC" KPIDisplayOption="Description" KPICodeID="2076"></kpicc:kpicodeddropdownlist></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblFprint" runat="server" CssClass="Customlbl">Fingerprint</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpitextbox id="txtFingerPrint" runat="server" Width="150px" CssClass="textbox" KPITabIndex="574"
				KPISecurity="AC" MaxLength="20"></kpicc:kpitextbox></TD>
		<TD>&nbsp;<kpicc:kpilabel id="lblCountry" runat="server" CssClass="Customlbl">Birth Country</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpicodedlookup id="lupBirthCountry" tabIndex="29" runat="server" Width="154px" KPITabIndex="570"
				KPIWidth="120" KPISecurity="AC" KPICodeID="2068"></kpicc:kpicodedlookup></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblDNAType" runat="server" CssClass="Customlbl"> DNAType</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpitextbox id="txtDNAType" tabIndex="-1" runat="server" Width="150px" CssClass="textbox" KPITabIndex="575"
				KPISecurity="AC" MaxLength="20"></kpicc:kpitextbox></TD>
		<TD><kpicc:kpilabel id="lblMartialStatus" runat="server" CssClass="Customlbl">Marital Status</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpicodeddropdownlist id="cddMaritalStatus" tabIndex="30" runat="server" Width="55%" KPITabIndex="563"
				KPIWidth="180" KPISecurity="AC" KPIDisplayOption="Description" KPICodeId="1086"></kpicc:kpicodeddropdownlist></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblCZShip" runat="server" CssClass="Customlbl">Citizenship 1</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD align="left"><kpicc:kpicodedlookup id="lupCitizenship" tabIndex="-1" runat="server" Width="25%" KPITabIndex="571" KPIWidth="90"
				KPISecurity="AC" KPICodeID="2068"></kpicc:kpicodedlookup></TD>
		<TD><kpicc:kpilabel id="lblResident" runat="server" CssClass="Customlbl">Resident</kpicc:kpilabel>&nbsp;</TD>
		<TD align="left" colSpan="2"><kpicc:kpicodeddropdownlist id="cddResident" tabIndex="-1" runat="server" Width="120%" KPITabIndex="569" KPIWidth="180"
				KPISecurity="AC" KPIMode="Add" KPIDisplayOption="Description" KPICodeId="1087"></kpicc:kpicodeddropdownlist></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblPassport" runat="server" CssClass="Customlbl"> Passport#</kpicc:kpilabel>&nbsp;</TD>
		<td></td>
		<TD><kpicc:kpitextbox id="txtPassport" tabIndex="-1" runat="server" Width="150px" CssClass="textbox" KPITabIndex="572"
				KPISecurity="AC" MaxLength="20"></kpicc:kpitextbox></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><kpicc:kpilabel id="lblImmigration" runat="server" CssClass="Customlbl"> Immigration#</kpicc:kpilabel>&nbsp;</TD>
		<TD></TD>
		<TD><kpicc:kpitextbox id="txtImmigration" tabIndex="-1" runat="server" Width="150px" CssClass="textbox"
				KPITabIndex="573" KPISecurity="AC" MaxLength="20"></kpicc:kpitextbox></TD>
		<td></td>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
</table>
