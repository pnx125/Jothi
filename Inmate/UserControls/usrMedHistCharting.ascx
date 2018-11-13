<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usrMedHistCharting.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedHistCharting" %>

<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>
<%@ Register TagPrefix="cc1" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>

<table id="Table1" style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%" border="0">
    <colgroup>
        <col style="width: 5%" />
        <col style="width: 10%" />
        <col style="width: 25%" />
        <col style="width: 55%" />
        <col style="width: 5%" />
    </colgroup>

    <tr>
        <td colspan="5" class="status">

            <table style="width:100%;padding:0;border-spacing:0">
                <colgroup><col style="width:1%" /><col style="width:1%" /><col style="width:1%" /><col style="width:1%" /><col style="width:98%" /></colgroup>
                <tr>
                    <td style="text-align: left; white-space: nowrap">
                        <kpicc:KPIImageButton ID="cmdSave" TabIndex="10" Height="20" runat="server" KPITabIndex="830"
                            KPISecurity="AC" CssClass="menuItem" ImageUrl="/KPIImages/ico/Save_Int.png"
                            ToolTip="Save This Tab" AlternateText="Save" OnClick="cmdSave_Click"></kpicc:KPIImageButton></td>
                    <td></td>
                    <td style="text-align: left; white-space: nowrap">
                        <kpicc:KPIImageButton ID="cmdReset" TabIndex="11" runat="server" KPIRepositoryID="0" Height="20" ImageUrl="/KPIImages/ico/Reset_Int.png" ToolTip="Reset This Tab" OnClick="cmdReset_Click"
                            KPITabIndex="831" KPISecurity="AC" CssClass="menuItem" AlternateText="Reset"></kpicc:KPIImageButton></td>
                    <td>&nbsp;</td>
                    <td style="text-align: left; white-space: nowrap"><kpicc:KPILiteral ID="lblErrorMsg" runat="server" KPISecurity="ACID"></kpicc:KPILiteral></td>
                </tr>
            </table>


              
        </td>
    </tr>
    <tr>
        <td colspan="5" style ="height:5px;"></td>
    </tr>
    <tr>
        <td></td>
        <td style="text-align: right;">
            <kpicc:KPILabel ID="lblChartingDateTime" runat="server" Text="Date/Time&nbsp;"></kpicc:KPILabel>
        </td>
        <td>
            <kpicc:KPIDateTime ID="dttmChartingDate" runat="server" KPISecurity="AC" KPITabIndex="501" KPITimeDisplay="TimeShort" KPIMandatory="True" ></kpicc:KPIDateTime>
        </td>
        <td>&nbsp;</td><td>&nbsp;</td>
    </tr>

    <tr><td></td><td></td><td></td><td></td><td></td></tr>
    <tr>
        <td></td>
        <td style="text-align: right;">
            <kpicc:KPILabel ID="lblPF" runat="server" Text="By&nbsp;"></kpicc:KPILabel>
        </td>
        <td style="text-align:left;white-space:nowrap">
            <kpicc:KPICodedLookUp ID="lupPF" runat="server" KPICodeID="110" Width="70%" DescFieldWidth="80%" ValueFieldWidth="30%" KPITabIndex="502" KPIClientCallBack="FillLoggedInPF"></kpicc:KPICodedLookUp>
        </td>
        <td></td>
        <td>&nbsp;</td>
    </tr>
    <tr><td></td><td></td><td></td><td></td><td></td></tr>
    <tr>
        <td></td>
        <td style="text-align: right;">
            <kpicc:KPILabel ID="lblReason" runat="server" Text="Reason&nbsp;"></kpicc:KPILabel>
        </td>
        <td>
           <kpicc:KPICodedDropDownList ID="cddReason" runat="server" KPIWidth="0" KPISecurity="AC" KPITabIndex="510" Width="93.6%" KPIDisplayOption="Description" KPICodeID="3175"></kpicc:KPICodedDropDownList>
        </td>
        <td></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td style="float:right">
            <table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 50%;float:right">
                <colgroup><col style="width:51%" /><col style="width:23%" /><col style="width:3%" /><col style="width:23%" /></colgroup>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align:right">
                        <kpicc:KPIImageButton ID="cmdAdd" runat="server" KPISecurity="AC" KPITabIndex="512" AlternateText="Add" ToolTip="Add" ImageUrl="/KPIImages/ico/AddData_Text.png" CssClass="menuItem"></kpicc:KPIImageButton>
                    </td>

                    <td>&nbsp;</td>
                    <td style="text-align: right;">
                        <kpicc:KPIImageButton ID="cmdClear" runat="server" KPISecurity="AC" KPITabIndex="513" AlternateText="Clear" ToolTip="Clear" ImageUrl="/KPIImages/ico/ClearData_Text.png" CssClass="menuItem" CausesValidation="False"></kpicc:KPIImageButton>
                    </td>
                </tr>
            </table>
        </td>
        
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td></td>
        <td colspan="3">
            <div class="DispTabDetails1">
                <kpicc:KPIGrid ID="grdChartDetails" runat="server" KPIRepositoryID="0" KPISecurity="AC" DataKeyFields="JMChartID" AutoGenerateColumns="false" EnableDataViewState="true"
                    Width="100%" useaccessibleheader="False" Height="220px" KPIDefaultJurisAlias="False" OnInitializeRow="grdChartDetails_InitializeRow" >
                    <ClientEvents Click="grdChartDetails_CellClickHandler"></ClientEvents>
                    <Columns>
                        <igtbl:UnboundField Key="KPIDRK" Width="4%">
                            <Header Text="X" />
                        </igtbl:UnboundField>
                        <igtbl:BoundDataField Key="Dttm" Width="20%" DataFieldName="ChartingDttm" DataFormatString="{0:MM/dd/yyyy HH:mm}">
                            <Header Text="Date/Time" />
                        </igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="PF" Width="41%" DataFieldName="FullName">
                            <Header Text="By" />
                        </igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="ReasonCode" Width="30%" DataFieldName="ReasonCode" Hidden="true">
                            <Header Text="OfficerCode" />
                        </igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="Reason" Width="30%" DataFieldName="Reason" >
                            <Header Text="Reason" />
                        </igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="JMBookingID"  Hidden="true" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="JurisID"  Hidden="true" DataFieldName="JurisID"></igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="JMMedicalHistID"  Hidden="true" DataFieldName="JMMedicalHistID"></igtbl:BoundDataField>
                        <igtbl:UnboundField Key="KPIMode" Hidden="True">
                            <Header />
                        </igtbl:UnboundField>
                        <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMChartID">
                            <Header />
                        </igtbl:BoundDataField>
                        <igtbl:UnboundField Key="GeneratedID" Hidden="True">
                        <Header />
                    </igtbl:UnboundField>
                        <igtbl:UnboundField Header-Text="C" Key="C" Width="5%">
                            <Header Text="C" />
                        </igtbl:UnboundField>
                     
                        <igtbl:BoundDataField Key="PFCode" Width="30%" DataFieldName="PFCode" Hidden="true">
                        <Header Text="PFCode" />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="PFID" Width="30%" DataFieldName="OfficerID" Hidden="true">
                        <Header Text="PFID" />
                    </igtbl:BoundDataField>
                        <igtbl:BoundDataField Key="JMChartID" Hidden="True" DataFieldName="JMChartID"></igtbl:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <igtbl:Activation Enabled="true"></igtbl:Activation>
                        <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                        <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                        <igtbl:EditingCore AutoCRUD="False" Enabled="true" BatchUpdating="true">
                            <Behaviors>
                                <igtbl:CellEditing Enabled="false">
                                </igtbl:CellEditing>
                            </Behaviors>
                        </igtbl:EditingCore>
                    </Behaviors>
                </kpicc:KPIGrid>
            </div>
        </td>
        
        <td>&nbsp;</td>
    </tr>
</table>
