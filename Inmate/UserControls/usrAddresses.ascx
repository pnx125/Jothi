<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrAddresses.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrAddresses" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="2" width="100%">
	<colgroup>
		<col align="right" width="2%" />
		<col align="right" width="8%" />
		<col width="18%" />
		<col width="18%" />
		<col width="15%" />
		<col align="right" width="5%" />
	</colgroup>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<TR>
		<td></td>
		<TD><kpicc:kpilabel id="lblAddress" KPISecurity="ACI" CssClass="Customlbl" runat="server">Address</kpicc:kpilabel></TD>
		<td colSpan="2"><phnxcc:addressctrl id="adrAdditionalAddr" KPISecurity="AC" runat="server" ValidationAddrType="RC" KPITabIndex="701"
				MustValidate="False" Width="80px" Height="29px" OnValidEvent="validateAddtionalAddr" IsValidated="False"></phnxcc:addressctrl></td>
		<td></td>
		<td></td>
	</TR>
	<TR>
		<td></td>
		<TD><kpicc:kpilabel id="lblCity" KPISecurity="ACI" CssClass="Customlbl" runat="server">CSZ</kpicc:kpilabel></TD>
		<TD colSpan="2">
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
				<COLGROUP>
					<COL align="right" width="70%" />
					<COL align="left" width="30%" />
				</COLGROUP>
				<TR>
					<TD><kpicc:kpicustomcsz id="custCSZ" tabIndex="1" KPISecurity="AC" runat="server" KPITabIndex="702" Width="120px"
							KPIWidth="0"></kpicc:kpicustomcsz></TD>
					<TD><kpicc:kpicodedlookup id="lupAddrCountry" KPISecurity="AC" runat="server" KPITabIndex="703" Width="90px"
							KPICodeID="2068"></kpicc:kpicodedlookup></TD>
				</TR>
			</TABLE>
		</TD>
		<TD></TD>
		<td></td>
	</TR>
	<TR>
		<TD></TD>
		<TD align="right"><kpicc:kpilabel id="lblTelephone" KPISecurity="ACI" CssClass="Customlbl" runat="server">Phone</kpicc:kpilabel></TD>
		<TD align="left"><kpicc:kpicustomphone id="custAddressPhone1" tabIndex="2" KPISecurity="AC" runat="server" KPITabIndex="705"
				Width="136px" Height="32px" KPIMode="Search"></kpicc:kpicustomphone></TD>
		<TD><kpicc:kpicustomphone id="custAddressPhone2" tabIndex="3" KPISecurity="AC" runat="server" KPITabIndex="706"></kpicc:kpicustomphone></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<TR>
		<td></td>
		<TD class="req" align="right"><kpicc:kpilabel id="lblType" KPISecurity="ACI" CssClass="Customlbl" runat="server">Type</kpicc:kpilabel></TD>
		<TD>
			<table>
				<COLGROUP>
					<COL align="right" width="10%" />
					<COL align="left" width="90%" />
				</COLGROUP>
			</table>
			<kpicc:kpicodeddropdownlist id="cddType" tabIndex="4" KPISecurity="AC" runat="server" KPITabIndex="704" KPIWidth="120"
				KPIMode="Add" KPIDisplayOption="Description" KPICodeId="1089"></kpicc:kpicodeddropdownlist></TD>
		<TD>
			<table>
				<COLGROUP>
					<COL align="right" width="10%" />
					<COL align="left" width="90%" />
				</COLGROUP>
				<TR>
					<TD><kpicc:kpilabel id="Kpilabel2" KPISecurity="ACI" CssClass="Customlbl" runat="server">Delete</kpicc:kpilabel></TD>
					<TD><kpicc:kpidatechooser id="dtcDeleteDate" tabIndex="5" KPISecurity="AC" runat="server" KPITabIndex="707"
							Width="96px" KPIWidth="100" NullDateLabel="Select Date"></kpicc:kpidatechooser></TD>
				</TR>
			</table>
		</TD>
		<TD></TD>
		<td></td>
	</TR>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td align="right"><kpicc:KPIImageButton id="cmdAddAddress" KPISecurity="AC" runat="server" KPITabIndex="708" ToolTip="Add" ImageUrl="/KPIImages/ico/18_add.gif" EnableViewState="False" ></kpicc:kpiimagebutton>&nbsp;
			<kpicc:KPIImageButton id="cmdClearAddress" KPISecurity="AC" runat="server" KPITabIndex="709" ToolTip="Clear" ImageUrl="/KPIImages/ico/clear_data.gif" ></kpicc:kpiimagebutton></td>
		<td></td>
	</tr>
	<tr>
		<td align="center" colSpan="6"><kpicc:kpigrid id="grdAddress" KPISecurity="AC" runat="server" Width="734px" Height="160px" KPIDefaultJurisAlias="False" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" RepositoryID="0" KPIRepositoryID="0" ><DisplayLayout RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" ScrollBarView="Vertical" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" AllowColSizingDefault="Free" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
						<ButtonStyle BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray" ><BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

						</ButtonStyle></AddNewBox>
					<Pager PageSize="30">
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
					<FrameStyle Width="734px" BorderWidth="1px" Font-Size="8pt" Font-Names="Verdana" BorderColor="#004000"
						BorderStyle="Solid" Height="160px"></FrameStyle>
					<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid">
						<BorderDetails WidthLeft="1px" WidthTop="1px"></BorderDetails>
					</FooterStyleDefault>
					<ClientSideEvents CellClickHandler="grdAddress_CellClickHandler" AfterRowInsertHandler="grdAddress_AfterRowInsertHandler"></ClientSideEvents>
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
							<igtbl:UltraGridColumn Key="KPIDRK" Width="3%" ><CellStyle ForeColor="Red" CssClass="grdDelText"></CellStyle>
								<Footer Key="KPIDRK"></Footer>
								<HeaderStyle Font-Size="X-Small" Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
								<Header Key="KPIDRK" Caption="X"></Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Address" Width="45%" ><Footer Key="Address">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Address" Caption="Address">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneNum1" Width="15%" ><Footer Key="PhoneNum1">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneNum1" Caption="Phone 1">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneNum2" Width="15%" ><Footer Key="PhoneNum2">
									<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneNum2" Caption="Phone 2">
									<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="AddressTypeDesc" Width="10%" BaseColumnName="Description" ><Footer Key="AddressTypeDesc">
									<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="AddressTypeDesc" Caption="Type">
									<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="DeleteDttm" Width="12%" Format="MM/dd/yyyy" BaseColumnName="DeleteDttm" ><Footer Key="DeleteDttm">
									<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="DeleteDttm" Caption="Delete">
									<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneNo1Type" Hidden="True" ><Footer Key="PhoneNo1Type">
									<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneNo1Type">
									<RowLayoutColumnInfo OriginX="6"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneNo2Type" Hidden="True" ><Footer Key="PhoneNo2Type">
									<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneNo2Type">
									<RowLayoutColumnInfo OriginX="7"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneNo1" Hidden="True" ><Footer Key="PhoneNo1">
									<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneNo1">
									<RowLayoutColumnInfo OriginX="8"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneNo2" Hidden="True" ><Footer Key="PhoneNo2">
									<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneNo2">
									<RowLayoutColumnInfo OriginX="9"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Street" Hidden="True" BaseColumnName="Location" ><Footer Key="Street">
									<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Street" Caption="">
									<RowLayoutColumnInfo OriginX="10"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="City" Hidden="True" BaseColumnName="City" ><Footer Key="City">
									<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="City">
									<RowLayoutColumnInfo OriginX="11"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="State" Hidden="True" BaseColumnName="State" ><Footer Key="State">
									<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="State">
									<RowLayoutColumnInfo OriginX="12"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Zip" Hidden="True" BaseColumnName="Zip" ><Footer Key="Zip">
									<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Zip">
									<RowLayoutColumnInfo OriginX="13"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Country" Hidden="True" BaseColumnName="Country" ><Footer Key="Country">
									<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Country">
									<RowLayoutColumnInfo OriginX="14"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="AddressType" Hidden="True" BaseColumnName="AddressType" ><Footer Key="AddressType">
									<RowLayoutColumnInfo OriginX="15"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="AddressType">
									<RowLayoutColumnInfo OriginX="15"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
									<RowLayoutColumnInfo OriginX="16"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIID" Caption="KPIID">
									<RowLayoutColumnInfo OriginX="16"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
									<RowLayoutColumnInfo OriginX="17"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIMode" Caption="KPIMode">
									<RowLayoutColumnInfo OriginX="17"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="SeqNo" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="SeqNo">
									<RowLayoutColumnInfo OriginX="18"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="SeqNo">
									<RowLayoutColumnInfo OriginX="18"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Premise" Hidden="True" BaseColumnName="Premise" ><Footer Key="Premise">
									<RowLayoutColumnInfo OriginX="19"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Premise" Caption="Premise">
									<RowLayoutColumnInfo OriginX="19"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="AptNo" Hidden="True" BaseColumnName="AptNo" ><Footer Key="AptNo">
									<RowLayoutColumnInfo OriginX="20"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="AptNo" Caption="ANo">
									<RowLayoutColumnInfo OriginX="20"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="StreetID" Hidden="True" BaseColumnName="StreetID" ><Footer Key="StreetID">
									<RowLayoutColumnInfo OriginX="21"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="StreetID" Caption="Sid">
									<RowLayoutColumnInfo OriginX="21"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneID1" Hidden="True" ><Footer Key="PhoneID1">
									<RowLayoutColumnInfo OriginX="22"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneID1">
									<RowLayoutColumnInfo OriginX="22"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="PhoneID2" Hidden="True" ><Footer Key="PhoneID2">
									<RowLayoutColumnInfo OriginX="23"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="PhoneID2">
									<RowLayoutColumnInfo OriginX="23"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="CountryDesc" Hidden="True" BaseColumnName="CountryDesc" ><Footer Key="CountryDesc">
									<RowLayoutColumnInfo OriginX="24"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="CountryDesc">
									<RowLayoutColumnInfo OriginX="24"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="StreetID" Hidden="True" BaseColumnName="StreetID" ><Footer Key="StreetID">
									<RowLayoutColumnInfo OriginX="25"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="StreetID">
									<RowLayoutColumnInfo OriginX="25"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
						</Columns>
						<RowStyle BackColor="White"></RowStyle>
					</igtbl:UltraGridBand>
				</Bands>
			</kpicc:kpigrid></td>
	</tr>
</table>
