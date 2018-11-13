<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrMedLogBasicSrch.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedLogBasicSrch" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.WebDataInput.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebDataInput" TagPrefix="igtxt" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebToolbar.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebToolbar" TagPrefix="igtbar" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebNavigator.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebNavigator" TagPrefix="ignav" %>
<%@ Register Assembly="Infragistics35.WebUI.WebNavBar.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebNavBar" TagPrefix="ignavbar" %>
<%@ Register Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtblexp" %>
<%@ Register TagPrefix="cc1" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics35.WebUI.WebCombo.v11.1, Version=11.1.20111.2135, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebCombo" TagPrefix="igcmbo" %>
<table style="table-layout: fixed" cellspacing="4" cellpadding="0" width="100%">
    <colgroup>
        <col width="3%" />
        <col width="20%" />
        <col width="25%" />
        <col width="23%" />
        <col width="9%" />
        <col width="8%" />
    </colgroup>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td style="height: 21px"></td>
        <td style="height: 21px" align="right">
            <kpicc:kpilabel id="lblJuris" runat="server" kpisecurity="I" kpirepositoryid="0"> Juris</kpicc:kpilabel>
            &nbsp;</td>
        <td style="height: 21px" colspan="2">
            <kpicc:kpijurisdropdownlist id="lstJuris" kpisecurity="ACI" runat="server" kpimode="Search" width="65%" kpitabindex="599"></kpicc:kpijurisdropdownlist>
        </td>
        <td style="height: 21px"></td>
        <td style="height: 21px"></td>
    </tr>
    <tr>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblAdminFrom" runat="server"> Administered</kpicc:kpilabel>
            &nbsp;</td>
        <td>
            <kpicc:kpidatetime id="dttAdminFrom" tabindex="600" runat="server" kpitabindex="600" kpisecurity="I"
                kpitimedisplay="TimeShort" kpimandatory="True"></kpicc:kpidatetime>
        </td>
        <td colspan="2">
            <table id="Table2" cellspacing="0" cellpadding="0" width="100%" border="0">
                <colgroup>
                    <col width="15%" />
                    <col width="85%" />
                </colgroup>
                <tr>
                    <td align="right">
                        <kpicc:kpilabel id="lblAdminTo" runat="server">To</kpicc:kpilabel>
                        &nbsp;</td>
                    <td>
                        <kpicc:kpidatetime id="dttAdminTo" tabindex="601" runat="server" kpitabindex="601" kpisecurity="I"
                            kpitimedisplay="TimeShort" kpimandatory="True"></kpicc:kpidatetime>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblDrug" runat="server">Drug</kpicc:kpilabel>
            &nbsp;</td>
        <td colspan="2">
            <kpicc:kpicodeddropdownlist id="cddDrug" tabindex="603" runat="server" kpicodeid="6007" width="51%" kpitabindex="602"></kpicc:kpicodeddropdownlist>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td height="23"></td>
        <td align="right" height="23">
            <kpicc:kpilabel id="lblMethod" runat="server">Method Administered</kpicc:kpilabel>
            &nbsp;</td>
        <td colspan="2" height="23">
            <kpicc:kpicodeddropdownlist id="cddMethod" runat="server" kpicodeid="5016" width="51%" kpitabindex="603"></kpicc:kpicodeddropdownlist>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td colspan="4">
            <table id="Table1" cellspacing="0" cellpadding="1" width="100%" border="0">
                <colgroup>
                    <col width="26.8%" />
                    <col width="73.2%" />
                </colgroup>
                <tr>
                    <td height="13"></td>
                    <td rowspan="2">
                        <cc1:NameCtrl ID="NamCtrlSPIN" runat="server" Width="100%" IsSPNNo="True" KPITabIndex="604"></cc1:NameCtrl>
                    </td>
                </tr>
                <tr>
                    <td align="right" height="13">
                        <kpicc:kpilabel id="lblSPN" runat="server">SPIN#</kpicc:kpilabel>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right"></td>
        <td colspan="2">
            <kpicc:kpilabel id="lblpfno" runat="server">PF#</kpicc:kpilabel>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblAdminBy" runat="server">Administered By</kpicc:kpilabel>
            &nbsp;</td>
        <td colspan="2">
            <kpicc:kpicodedlookup id="lupPFID" runat="server" width="140px" kpitabindex="605" kpimode="Add" kpicodeid="110"
                kpiwidth="150" kpisecurity="ACID"></kpicc:kpicodedlookup>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td align="left" colspan="6">
            <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                <colgroup>
                    <col width="3%" />
                    <col width="20%" />
                    <col width="10%" />
                    <col width="38%" />
                    <col width="9%" />
                    <col width="8%" />
                </colgroup>
                <tr>
                    <td></td>
                    <td align="right">
                        <kpicc:kpilabel id="lblDossageLessThan" runat="server">Dosage Less Than</kpicc:kpilabel>
                    </td>
                    <td align="left">
                        <kpicc:kpicodeddropdownlist id="cddDosage" runat="server" kpitabindex="606" width="90%" kpicodeid="3114"></kpicc:kpicodeddropdownlist>
                    </td>
                    <td align="left">
                        <kpicc:kpilabel id="lblDaySupply" runat="server"> Days Supply</kpicc:kpilabel>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblStatus" runat="server">Status</kpicc:kpilabel>
            &nbsp;</td>
        <td tabindex="638" colspan="2">
            <kpicc:kpicodeddropdownlist id="cddStatus" runat="server" kpicodeid="5015" width="35%" kpitabindex="607"></kpicc:kpicodeddropdownlist>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblBuilding" runat="server">Building</kpicc:kpilabel>
            &nbsp;</td>
        <td colspan="2">
            <kpicc:kpicodeddropdownlist id="cddBuilding" runat="server" kpicodeid="399" width="35%" kpitabindex="608" kpidisplayoption="Description"
                kpionchangehandler="SetPodCellAsEmpty"></kpicc:kpicodeddropdownlist>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblPod" runat="server">Pod</kpicc:kpilabel>
            &nbsp;</td>
        <td colspan="2">
            <kpicc:kpicodedlookup id="lupPod" runat="server" width="100%" kpitabindex="609" kpisecurity="ACID" kpiwidth="100"
                kpicodeid="402" kpimode="Add" kpishowdescription="False" kpimasterlookup="tabMedLogSrch_BSC_UsrMedLogBasicSrch1_cddbuilding"></kpicc:kpicodedlookup>
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td height="22"></td>
        <td align="right" height="22">
            <kpicc:kpilabel id="lblCellNo" runat="server">Cell#</kpicc:kpilabel>
            &nbsp;</td>
        <td colspan="2" height="22">
            <kpicc:kpicodedlookup id="lupCell" runat="server" width="100%" kpitabindex="610" kpisecurity="ACID" kpiwidth="100"
                kpicodeid="403" kpimode="Add" kpishowdescription="False" kpimasterlookup="tabMedLogSrch_BSC_UsrMedLogBasicSrch1_lupPod"></kpicc:kpicodedlookup>
        </td>
        <td height="22"></td>
        <td height="22"></td>
    </tr>
    <tr>
        <td colspan="6"></td>
    </tr>
    <tr>
        <td></td>
        <td colspan="4"></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td colspan="4"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="6"></td>
    </tr>
</table>