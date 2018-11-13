<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usrMedMarBasicSrch.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedMarBasicSrch" %>



<%@ Register Assembly="KPI.Global.KPIWebControls" Namespace="KPI.Global.KPIWebControls" TagPrefix="kpicc" %>



<%@ Register Assembly="KPI.Phoenix.WebControls" Namespace="KPI.Phoenix.WebControls" TagPrefix="phnxcc" %>



<table id="Table1" style="padding: 0; border-spacing: 0; width: 100%;">
    <colgroup>
        <col style="width: 5%" />
        <col style="width: 15%" />
        <col style="width: 20%" />
        <col style="width: 15%" />
        <col style="width: 20%" />
        <col style="width: 25%" />
    </colgroup>

     <tr>
        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
    </tr>
      <tr>
        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
    </tr>
    <tr>
        <td></td>
        <td id="tdlblJuris" runat="server" style="text-align:right" class="req"><kpicc:KPILabel ID="lblJuris" runat="server">Juris&nbsp;</kpicc:KPILabel></td>
        <td style="text-align:left" id="tdlstJuris" runat="server"><kpicc:KPIJurisDropDownList ID="lstJuris" KPISecurity="I" runat="server" KPIIsReset="True" KPITabIndex="600" OnSelectedIndexChanged="lstJuris_SelectedIndexChanged" Width="100%" KPIWidth="0" KPIMode="Search" KPIIsStartUp="True"></kpicc:KPIJurisDropDownList></td>
        <td id="tdlblsubagency"  style="text-align: right;white-space:nowrap" runat="server"><kpicc:KPILabel ID="lblsubagency" runat="server" Text="sub agency"> Sub-Agency&nbsp;</kpicc:KPILabel></td>
        <td   runat="server" id="tdcddsubagency" style="text-align:left"   ><kpicc:KPICodedDropDownList ID="cddSubAgency" TabIndex="-1" runat="server" KPITabIndex="601" Width="96%" KPISecurity="ACI" KPIMode="Search" KPICodeID="142" KPIDisplayOption="description"></kpicc:KPICodedDropDownList></td>
        <td></td>
    </tr>

    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td></td>
        <td style="text-align: right"><kpicc:KPILabel ID="lblPrescription" runat="server">Prescription&nbsp;</kpicc:KPILabel></td>
        <td><kpicc:KPICodedLookUp ID="lupPrescription" runat="server" KPITabIndex="602" KPIMode="Search" DescFieldWidth="75%" ValueFieldWidth="25%" KPISecurity="I" KPICodeID="6007"></kpicc:KPICodedLookUp></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

      <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td></td>
        <td style="text-align: right;padding-top:15px"><kpicc:KPILabel ID="lblSPN" runat="server">SPN&nbsp;</kpicc:KPILabel></td>
        <td colspan="3"><phnxcc:NameCtrl ID="NamCtrlSPIN" runat="server" Width="100%" IsSPNNo="True" KPITabIndex="603" KPIResult="Detail" KPISecurity="I"></phnxcc:NameCtrl></td>
        
        <td></td>
    </tr>
      <tr>
         <td>&nbsp;</td>
    </tr>
    <%--    <tr>
        <td>&nbsp;</td>
        <td style="text-align:right"><kpicc:kpilabel id="lblInmatename" runat="server">Inmate Name&nbsp;</kpicc:kpilabel></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td></td>
    </tr>--%>
   
    <tr>
        <td></td>
        <td></td>
        <td style="text-align:left"><kpicc:KPILabel ID="lblDateFrom" runat="server">From</kpicc:KPILabel></td>
        <td></td>
        <td style="text-align:left"><kpicc:KPILabel ID="lblDateTo" runat="server">To</kpicc:KPILabel></td>
        <td></td>
    </tr>
    <tr>
        
        <td colspan="2" style="text-align: right" class="req"><kpicc:KPILabel ID="lblFromDate" runat="server">Administered Date/Time&nbsp;</kpicc:KPILabel></td>
        <td><kpicc:KPIDateTime ID="dttmFromDate" runat="server" KPISecurity="I" KPITabIndex="604" KPIMandatory="False" KPITimeDisplay="TimeShort" ></kpicc:KPIDateTime></td>
        <td>&nbsp;</td>
        <td>
              <table style="padding: 0; border-spacing: 0; width: 100%;">
                                <colgroup>
                                    <col style="width: 50%;" /><col style="width: 1%;" />
                                    <col style="width: 49%;" />
                                </colgroup>
                                <tr>
                                    <td style="padding: 0; border-spacing: 0;">
                                       <kpicc:KPIDateTime ID="dttmToDate" KPITimeDisplay="TimeShort" runat="server"  KPITabIndex="605" ></kpicc:KPIDateTime>
                                    </td>
                                    <td style="width:1px"></td>
                                    <td style="text-align: left; padding: 0; border-spacing: 0">
                                        <kpicc:KPIImageButton ID="imgClear" KPISecurity="I" runat="server" KPITabIndex="606" ImageUrl="/KPIImages/ico/Clear_Data.png" OnClick="imgClear_Click"></kpicc:KPIImageButton></td>

                                </tr>
                            </table>
            
            
            </td>
        <td></td>
    </tr>

      <tr>
         <td>&nbsp;</td>
    </tr>

    <tr>
        <td>&nbsp;</td>
        <td style="text-align: right"><kpicc:KPILabel ID="AdministeredPF" runat="server">Administered PF#&nbsp;</kpicc:KPILabel></td>
        <td colspan="2" style="white-space:nowrap;text-align:left">
            
            <table style="width:100%;padding:0;border-spacing:0;table-layout:fixed">
                <colgroup><col style="width:60%" /><col style="width:40%" /></colgroup>
                <tr style="padding:0;border-spacing:0">
                    <td style="padding:0;border-spacing:0"><kpicc:KPICodedLookUp ID="lupBy" runat="server" KPITabIndex="607" DescFieldWidth="75%" ValueFieldWidth="25%" KPICodeID="110" Visible="True"></kpicc:KPICodedLookUp></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            


        </td>
        
        <td>&nbsp;</td>
        <td></td>
    </tr>

      <tr>
         <td>&nbsp;</td>
    </tr>

    <tr>
        <td>&nbsp;</td>
        <td style="text-align: right"><kpicc:KPILabel ID="lblStatus" runat="server">Status&nbsp;</kpicc:KPILabel></td>
        <td><kpicc:KPIRadCombo ID="radStatus" runat="server" KPICodeID="4155" KPIInternal="true" EnableViewState="true" KPIMode="Search"
                isselected="True" KPITabIndex="608" EnableCheckAllItemsCheckBox="true" Width="100%" MaxHeight="300px" KPISecurity="I"
                Height="100%" KPIDisplayOption="Description" Enabled="true" TabIndex="607">
            </kpicc:KPIRadCombo></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
     <tr>
         <td>&nbsp;<input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />   </td>
    </tr>
</table>
