<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrAlias.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrAlias" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table id="Table1" style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="1" width="100%">
	<colgroup>
		<col width="3%" />
		<col align="right" width="20%" />
		<col width="50%" />
		<col width="25%" />
		<col width="2%" />
	</colgroup>
	<TR>
		<TD></TD>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><kpicc:kpilabel id="lblAliasNames" CssClass="Customlbl" runat="server">Alias Name</kpicc:kpilabel>&nbsp;</td>
		<td>
			<kpicc:kpicustomname id="cstNames" runat="server" KPITabIndex="651" KPISecurity="AC" KPIWidth="0"></kpicc:kpicustomname></td>
		<td>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD rowSpan="2">
						<kpicc:kpicheckbox id="chkMaiden" runat="server" KPITabIndex="652" KPISecurity="AC" Text="MaidenName"></kpicc:kpicheckbox></TD>
				</TR>
				<TR>
					<TD></TD>
				</TR>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td align="right">
			<kpicc:KPIImageButton id="cmdAddAlias" runat="server" KPITabIndex="653" KPISecurity="AC" ImageUrl="/KPIImages/ico/18_add.gif" ToolTip="Add" ></kpicc:kpiimagebutton>
			<kpicc:KPIImageButton id="cmdClearAlias" runat="server" KPITabIndex="654" KPISecurity="AC" ImageUrl="/KPIImages/ico/clear_data.gif" ></kpicc:kpiimagebutton>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<TR>
		<TD></TD>
		<TD vAlign="top" align="right">
			<kpicc:kpilabel id="lblaliasesnicknmes" runat="server" CssClass="Customlbl"> Aliases/NickName</kpicc:kpilabel>&nbsp;</TD>
		<TD>
			<kpicc:kpigrid id="grdAlias" runat="server" KPISecurity="AC" UseAccessibleHeader="False" ImageDirectory="/ig_common/Images/" RepositoryID="0" Height="200px" KPIRepositoryID="0" Width="100%" KPIDefaultJurisAlias="False" ><DisplayLayout ColWidthDefault="100%" RowSizingDefault="Free" StationaryMargins="HeaderAndFooter" AutoGenerateColumns="False" AllowAddNewDefault="Yes" AllowSortingDefault="OnClient" RowHeightDefault="18px" Version="4.00" GridLinesDefault="Horizontal" SelectTypeRowDefault="Single" ScrollBarView="Vertical" SelectTypeCellDefault="Extended" HeaderClickActionDefault="SortMulti" BorderCollapseDefault="Separate" RowSelectorsDefault="No" TableLayout="Fixed" CellClickActionDefault="RowSelect" ><AddNewBox>
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
							<igtbl:UltraGridColumn Key="KPIDRK" Width="5%" FooterTotal="Avg" ><CellStyle Font-Size="XX-Small" Font-Names="Comic Sans MS" Font-Bold="True" HorizontalAlign="Center"
									ForeColor="Red" CssClass="grdDelText"></CellStyle>
								<Footer Total="Avg" Key="KPIDRK"></Footer>
								<HeaderStyle Font-Size="X-Small" Font-Names="Comic Sans MS" HorizontalAlign="Center" ForeColor="Red"></HeaderStyle>
								<Header Key="KPIDRK" Caption=" X"></Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="Date" Width="20%" BaseColumnName="Date" ><Footer Key="Date">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="Date" Caption="Date">
									<RowLayoutColumnInfo OriginX="1"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="FullName" Width="50%" BaseColumnName="FullName" ><Footer Key="FullName">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Footer>
								<HeaderStyle Font-Bold="True"></HeaderStyle>
								<Header Key="FullName" Caption="Name">
									<RowLayoutColumnInfo OriginX="2"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="IsMaiden" Width="25%" Type="CheckBox" BaseColumnName="IsMaiden" ><Footer Key="IsMaiden">
									<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="IsMaiden" Caption="Maiden">
									<RowLayoutColumnInfo OriginX="3"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIMode" Hidden="True" ><Footer Key="KPIMode">
									<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIMode" Caption="KPIMode">
									<RowLayoutColumnInfo OriginX="4"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn Key="KPIID" Hidden="True" BaseColumnName="SeqNo" ><Footer Key="KPIID">
									<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
								</Footer>
								<Header Key="KPIID">
									<RowLayoutColumnInfo OriginX="5"></RowLayoutColumnInfo>
								</Header>
							</igtbl:UltraGridColumn>
						</Columns>
						<RowStyle BackColor="White"></RowStyle>
					</igtbl:UltraGridBand>
				</Bands>
			</kpicc:kpigrid></TD>
		<TD></TD>
	</TR>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
