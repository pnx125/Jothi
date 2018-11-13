
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>

<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrMedicalBasicSrch.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedicalBasicSrch" %>


<table id="Table1" style="padding: 0; border-spacing: 0.2em; width: 80%;height:100%">
    <colgroup>
        <col style="width: 10%" />
        <col style="width: 20%" />
        <col style="width: 20%" />
        <col style="width: 10%" />
        <col style="width: 20%" />

        <col style="width: 10%" />
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
        <td></td>
        <td id="tdlblJuris" runat="server" style="text-align:right" class="req"><kpicc:kpilabel id="lblJuris" runat="server">Juris&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left" id="tdlstJuris" runat="server">

                        <kpicc:KPIJurisDropDownList ID="lstJuris" KPISecurity="I" runat="server" KPIIsReset="True" KPITabIndex="598" OnSelectedIndexChanged="lstJuris_SelectedIndexChanged"
                Width="100%" KPIWidth="0" KPIMode="Search" KPIIsStartUp="True">
            </kpicc:KPIJurisDropDownList>
        </td>
        <td id="tdlblsubagency"  style="text-align: right;white-space:nowrap" runat="server">
                                            <kpicc:KPILabel id="lblsubagency" runat="server" text="sub agency"> Sub-Agency&nbsp;</kpicc:KPILabel>
        </td>

        <td   runat="server" id="tdcddsubagency" style="text-align:left"   >
         <kpicc:KPICodedDropDownList id="cddSubAgency" tabindex="-1" runat="server" kpitabindex="599" width="96%" kpisecurity="ACI" kpimode="Search" kpicodeid="142" kpidisplayoption="description"></kpicc:KPICodedDropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>


    <tr>
        <td></td>
        <td rowspan="2" style="text-align:right;padding-top:13px"><kpicc:kpilabel id="lblSPN" runat="server">SPN#&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left;padding:0;border-spacing:0" colspan="3"><phnxcc:NameCtrl ID="NamCtrlSPIN" runat="server" Width="100%" IsSPNNo="True" KPITabIndex="600" KPIResult="Detail" KPISecurity="I"></phnxcc:NameCtrl></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

  
      <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblMedicalAlert" runat="server">Medical Flags&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left">
            <kpicc:kpiradcombo id="radMedicalFlags" runat="server" KPICodeID="2403" KPIInternal="true" EnableViewState="true" KPIMode="Search"
                                                    isselected="True" KPITabIndex="601" EnableCheckAllItemsCheckBox="true" width="100%" maxheight="300px" KPISecurity="I"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="601">
                                </kpicc:kpiradcombo>


        </td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblDiagnosed" runat="server">Diagnosed Condition&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"><kpicc:kpicodedlookup id="lupDiagnosed" runat="server" kpitabindex="602"  kpimode="Search" DescFieldWidth="75%" ValueFieldWidth="25%"  KPISecurity="I" kpicodeid="6013"></kpicc:kpicodedlookup></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblTBTested" runat="server">TB Test Results&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"> <kpicc:kpicodeddropdownlist id="cddTBResults" runat="server" KPISecurity="I" kpitabindex="603" KPIMode="Search" width="100%" kpicodeid="3176"></kpicc:kpicodeddropdownlist></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblDrugs" runat="server">Drugs&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"> <kpicc:kpicodeddropdownlist id="cddDrugs" runat="server" KPISecurity="I" kpitabindex="604" width="100%" kpicodeid="6007" KPIMode="Search"></kpicc:kpicodeddropdownlist></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblMedicalFacility" runat="server">Admitted to Medical Facility&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left">  <kpicc:KPICodedDropDownList ID="cddAdmMedFacility" runat="server" KPITabIndex="605" Width="100%" KPIMode="Search" KPISecurity="I"
                                               KPICodeID="3017"></kpicc:KPICodedDropDownList></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblAllergy" runat="server">Allergy&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"> 
             <kpicc:kpiradcombo id="radAllergy" runat="server" KPICodeID="5150" KPIInternal="true" EnableViewState="true" KPIMode="Search"
                                                    isselected="True" KPITabIndex="606" EnableCheckAllItemsCheckBox="true" width="100%" maxheight="300px" KPISecurity="I"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="606">
                                </kpicc:kpiradcombo>
            <%--<kpicc:KPICodedDropDownList ID="cddAllergy" runat="server" KPIWidth="0" KPISecurity="I" KPITabIndex="606" Width="100%" KPIDisplayOption="Description" KPICodeID="5150" KPIMode="Search"></kpicc:KPICodedDropDownList>--%>

        </td>
        <td></td>
        <td></td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblDentalProcedure" runat="server">Dental Procedure&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"><kpicc:kpiradcombo id="radDentProcedure" runat="server" KPICodeID="3172" KPIInternal="true" EnableViewState="true" KPIMode="Search"
                                                    isselected="True" KPITabIndex="607" EnableCheckAllItemsCheckBox="true" width="100%" maxheight="300px" KPISecurity="I"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="607">
                                </kpicc:kpiradcombo></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblSpecialMeal" runat="server">Special Meal Required&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"> 
             <kpicc:kpiradcombo id="radSpecialMealRequired" runat="server" KPICodeID="5014" KPIInternal="true" EnableViewState="true" KPIMode="Search"
                                                    isselected="True" KPITabIndex="608" EnableCheckAllItemsCheckBox="true" width="100%" maxheight="300px" KPISecurity="I"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="608"></kpicc:kpiradcombo>
            <%--<kpicc:kpicodeddropdownlist id="cddSplMealReq" runat="server" KPIDisplayOption="Description" KPISecurity="ACI" kpitabindex="608" width="100%" kpicodeid="5014" KPIMode="Search"></kpicc:kpicodeddropdownlist>--%>

        </td>
        <td></td>
        <td></td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblFromDate" runat="server">From&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left"><kpicc:kpidatetime id="dttmFromDate" runat="server" KPISecurity="I" kpitabindex="609" kpimandatory="False" KPITimeDisplay="TimeShort" OnChangeHandler="dtFromGreater_TextChanged"></kpicc:kpidatetime></td>
        <td style="text-align:right;"><kpicc:kpilabel id="lblToDate" runat="server">To&nbsp;</kpicc:kpilabel></td>
        <td style="text-align:left">
            <table style="padding: 0; border-spacing: 0; width: 50%">
                <colgroup>
                    <col style="width: 40%;" />
                    <col style="width: 30%;" />
                    <col style="width: 30%;" />
                </colgroup>
                <tr>
                    <td>
                        <kpicc:KPIDateTime ID="dttmToDate" KPITimeDisplay="TimeShort" runat="server" KPITabIndex="610" OnChangeHandler="dttmExpired_TextChanged"></kpicc:KPIDateTime>
                    </td>
                    <td style="text-align: left;">
                        <kpicc:KPIImageButton ID="imgClear" KPISecurity="I" runat="server" KPITabIndex="404"
                            ImageUrl="/KPIImages/ico/Clear_Data.png"></kpicc:KPIImageButton>
                    </td>
                    <td></td>
                </tr>
            </table>


        </td>
        <td></td>
    </tr>

     <tr>
        <td></td>
        <td></td>
         <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>

            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />            
        </td>
    </tr>

</table>

