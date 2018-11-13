<%@ Page Language="c#" CodeFile="frmMedicalVisit.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicalVisit" %>

<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>
        <%=strProductTitle%>
        -
        <%=strPageTitle%>
    </title>
    <link href="../KPIFrameWorkWeb/CSS/Global.css" type="text/css" rel="stylesheet">
    <%=strDynamicThemes%>
    <style type="text/css">
        .Schedule {
            background-image: url('/KPIImages/ico/JMSSchedule.gif') !important;
            background: url('/KPIImages/ico/JMSScheduleEnd.gif') no-repeat;
            background-repeat: no-repeat !important;
        }

        .ScheduleEnd {
            background-image: url('/KPIImages/ico/JMSScheduleEnd.gif') !important;
            background: url('/KPIImages/ico/JMSScheduleEnd.gif') no-repeat;
            background-repeat: no-repeat !important;
        }

        .Notes {
            background-image: url('/KPIImages/ico/text_icon.gif') !important;
            background: url('/KPIImages/ico/text_icon.gif') no-repeat;
            background-repeat: no-repeat !important;
        }
        .NotificationRules {
            background-image: url('/KPIImages/ico/Notification.gif') !important;
            background: url('/KPIImages/ico/Notification.gif') no-repeat;
            background-repeat: no-repeat !important;
        }

        #chkSplMealReq, #ChkAdmMedFacility, #chkTBTested, #chkGenericAllowed {
            margin: 0px !important;
            vertical-align: bottom !important;
        }       
       

        input[type=radio] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }
        #lupDiagnsis_CodeDescription{
              width:98% !important;
        }
        .boldness {
            font-weight: bold;
        }

        .disabledFilter {
            border: none;
        }

        .OverFlow {
            overflow-y: auto;
        }
        .grdGColor {
            color: gray;
        }
        .CustomBtnRedBold {
            height: 20px !important;
        }
        .grdRedColor {
            color: red !important;
        }
    </style>
    
</head>
<body class="masterfrm">
    <script src="../KPIFrameworkWeb/Scripts/Tooltip.js?v=2017.02.21" type="text/javascript"></script>
    <form id="frmMedVisit_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>

        <table style="width: 100%; padding: 0; border-spacing: 0; height: 100%" border="0">
            <colgroup>
                <col style="width: 2%" />
                <col style="width: 15%; text-align: right" />
                <col style="width: 11%" />
                <col style="width: 12%" />
                <col style="width: 15%" />
                <col style="width: 15%" />
                <col style="width: 14%" />
                <col style="width: 13%" />
                <col style="width: 3%" />
            </colgroup>
            <tr>
                <td class="status" valign="middle" style="text-align:left" colspan="9">
                    <table cellspacing="4">
                        <tr valign="middle">
                            <td>
                                <kpicc:kpiimagebutton id="cmdSave" runat="server" imageurl="/KPIImages/ico/16_L_save.gif" tooltip="Save" alternatetext="Save" kpisecurity="AC" cssclass="menuItem" kpitabindex="1000" onclick="cmdSave_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdSaveNClose" runat="server" imageurl="/KPIImages/ico/16_saveClose.gif" tooltip="Save &amp; Close" alternatetext="Save &amp; Close" kpisecurity="AC" cssclass="menuItem" kpitabindex="1001" onclick="cmdSaveNClose_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdPrint" runat="server" imageurl="/KPIImages/ico/16_print.gif" tooltip="Print" alternatetext="Print" kpisecurity="ACI" cssclass="menuItem" kpitabindex="1003" causesvalidation="False" onclick="cmdPrint_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdRefresh" runat="server" imageurl="/KPIImages/ico/16_L_refresh.gif" tooltip="Reset" alternatetext="Reset" kpisecurity="ACI" cssclass="menuItem" kpitabindex="1004" causesvalidation="False" onclick="cmdRefresh_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td width="100%"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="9"></td>
            </tr>
            <tr>
                <td colspan="9" style="vertical-align: top">
                    <table style="width: 100%; padding: 0; border-spacing: 0;height:100%" border="0">
                        <colgroup>
                            <col style="width: 2%" />
                            <col style="width: 17%; text-align: right" />
                            <col style="width: 12%" />
                            <col style="width: 12%" />
                            <col style="width: 16%" />
                            <col style="width: 14%" />
                            <col style="width: 14%" />
                            <col style="width: 10%" />
                            <col style="width: 3%" />
                        </colgroup>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" /></td>
                            <td>
                                <input id="hdnScreenId" type="hidden" value="8534" name="hdnScreenId" runat="server" /></td>
                            <td>
                                <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                                <input id="hdnBookingID" type="hidden" name="hdnBookingID" runat="server" />

                            </td>
                            <td>
                                <input id="hdnMedVisitID" type="hidden" name="hdnMedVisitId" runat="server" />
                                <input id="hdnPrescriptionID" type="hidden" name="hdnPrescriptionID" runat="server" />
                                <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                                <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />
                                <input id="hdnEventID" type="hidden" name="hdnEventID" runat="server" />
                                <input id="hdnMedVisitNo" type="hidden" name="hdnMedVisitNo" runat="server" />
                                <input id="hdnJMMedicalHistID" type="hidden" name="hdnJMMedicalHistID" runat="server" />
                                <input id="hdnBloodPressure" type="hidden" name="hdnBloodPressure" runat="server" />
                                <input id="hdnPulse" type="hidden" name="hdnPulse" runat="server" />
                                <input id="hdnWeight" type="hidden" name="hdnWeight" runat="server" />
                                <input id="hdnHeight" type="hidden" name="hdnHeight" runat="server" />
                                <input id="hdnMedVitalID" type="hidden" name="hdnMedVitalID" runat="server" />
                                <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                                <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                                <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />
                                <input id="hdnSetUserPFID" type="hidden" name="hdnSetUserPFID" runat="server" />
                                <input id="hdnEventNbr" type="hidden" name="hdnEventNbr" runat="server" />
                                <input id="hdnBloodPressureMax" type="hidden" name="hdnBloodPressureMax" runat="server" />                                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                       

                        <tr>
                            <td></td>
                            <td style="text-align:right"><kpicc:kpilabel id="lblMedicalNo" runat="server" kpirepositoryid="0" Text="Medical#&nbsp;"></kpicc:kpilabel></td>
                            <td style="text-align:left"><phnxcc:NumberCtrl ID="NumCrtlMedicalNo" runat="server" KPISecurity="N" KPINumberResultType="Detail" KPIDetailLookUp="false" CounterType="MedicalVisitNo" KPIMode="Add"></phnxcc:NumberCtrl></td>
                            <td></td><td></td><td></td><td></td><td></td><td></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td class="req" style="text-align: right; padding-top: 14px">
                                <kpicc:kpilabel id="SPINNo" runat="server" Text="SPN&nbsp;"></kpicc:kpilabel>
                                </td>

                            <td colspan="5" style="text-align: left; padding: 0; border-spacing: 0">
                                <phnxcc:NameCtrl ID="NamCtrlSPIN" runat="server" KPISecurity="N" KPITabIndex="550" Width="100%" IsSPNNo="True"></phnxcc:NameCtrl>
                            </td>

                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="req" style="text-align: right;white-space:nowrap">
                                <kpicc:kpilabel id="lblDateOfReq" runat="server" Text="Date of Request&nbsp;"></kpicc:kpilabel>
                                </td>
                            


                            <td colspan="6" style="text-align:left;padding:0;border-spacing:0;table-layout:auto">
                                <table style="text-align:left;padding:0;border-spacing:0;table-layout:auto">
                                    <colgroup><col style="width:19%" />
                                      <col style="width:1%" />
                                        <col style="width:19%" />
                                             <col style="width:1%" />
                                            <col style="width:19%" />
                                         <col style="width:3%" />
                                        <col style="width:15%" /><col style="width:38%" /></colgroup>

                                    <tr>
                                        <td style="text-align:left;white-space:nowrap"><kpicc:kpidatetime id="dttmDateOfReq" runat="server" kpisecurity="AC" kpitabindex="551" kpimandatory="True"></kpicc:kpidatetime></td>
                                        <td>&nbsp;</td>
                                        <td style="text-align:left;white-space:nowrap" colspan="4">
                                            <kpicc:kpiradiolist id="chkInmateSubmitionForm" runat="server" kpitabindex="552" repeatdirection="Horizontal" width="100%" kpisecurity="AC">
                                                <asp:ListItem Value="1" Text=" Inmate Submitted Medical Request Form"></asp:ListItem>
                                                <asp:ListItem Value="2" Text=" Jail Medical Staff Requested" />                                                
                                            </kpicc:kpiradiolist>
                                       


                                         </td>
                                        <td id="received" class="req" style="text-align:right;white-space:nowrap" runat="server"> <kpicc:kpilabel id="lblReceivedBy" runat="server">Received By&nbsp;</kpicc:kpilabel></td>
                                        <td style="text-align:left;white-space:nowrap"><kpicc:kpicodedlookup id="lupReceivedBy" runat="server" kpitabindex="553" DescFieldWidth="65%" ValueFieldWidth="40%" kpimode="Search"  kpicodeid="110" KPIClientCallBack="FillLoggedInPF" kpisecurity="AC"></kpicc:kpicodedlookup></td>
                                    </tr>
                                </table>
                            </td>



                            <td></td>
                        </tr>
                        <tr>
                            <td style="height: 44px"></td>
                            <td class="req" style="text-align: right;white-space:nowrap">
                                <kpicc:kpilabel id="lblMedProblem" runat="server" Text="Medical Problem&nbsp;"></kpicc:kpilabel>
                                </td>
                            <td style="height: 44px" colspan="4">
                                <kpicc:kpitextbox id="txtmedicalProblem" tabindex="561" runat="server" KPISecurity="AC" kpitabindex="554"
                                    width="100%" height="40px" maxlength="254" textmode="MultiLine"></kpicc:kpitextbox>
                            </td>
                            <td style="height: 44px" colspan="2"></td>
                            <td style="height: 44px"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="text-align: right">
                                <kpicc:kpilabel id="lblVisitDate" runat="server" Text="Visit Date&nbsp;"></kpicc:kpilabel>
                                </td>
                            <td colspan="1">
                                <kpicc:kpidatetime id="dttmVisitDate" runat="server" kpisecurity="AC" kpitabindex="555" kpimandatory="false" OnChangeHandler="KPISetShortTimeHM_VisitedDttm"  ></kpicc:kpidatetime>                                
                            </td>
                            
                            <td colspan="5">
                                <table style="width: 98%;table-layout:fixed">
                                    <colgroup>
                                        <col style="width: 20%" />
                                        <col style="width: 10%" />
                                        <col style="width: 30%" />
                                        <col style="width: 5%" />
                                        <col style="width: 13%" />
                                         <col style="width: 22%" />
                                    </colgroup>
                                    <tr>
                                        <td style="text-align: left; white-space: nowrap" colspan="2">
                                            <kpicc:KPIRadioList ID="rdoDoctorNurse" runat="server" KPITabIndex="556" RepeatDirection="Horizontal" Width="100%" KPISecurity="AC" TextAlign="Left">
                                                <asp:ListItem Value="1" Text="Attending Doctor&nbsp;"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Nurse&nbsp;" />
                                            </kpicc:KPIRadioList>
                                        </td>

                                        <td style="text-align: left;white-space:nowrap" colspan="2">
                                            <table style="width:100%"><colgroup><col style="width:100%" /></colgroup>
                                                <tr id="trAttendDoctor" runat="server">
                                                    <td> <kpicc:KPICodedLookUp ID="lupAttendingDoctor" TabIndex="6" runat="server" KPITabIndex="557" KPICodeID="780" KPIShowDescription="false" ValueFieldWidth="100%"
                                                KPIWidth="0" KPISecurity="AC" KPIMode="Search"></kpicc:KPICodedLookUp></td>
                                                </tr>
                                                <tr id="trAttendNurse" runat="server" style="display:none">
                                                    <td>  <kpicc:KPICodedLookUp ID="lupAttendingNurse" TabIndex="6" runat="server" KPITabIndex="557" KPICodeID="110" KPIShowDescription="true" ValueFieldWidth="40%" DescFieldWidth="60%"
                                                KPIWidth="0" KPISecurity="AC" KPIMode="Search"></kpicc:KPICodedLookUp></td>
                                                </tr>
                                            </table>
                                           

                                           
                                        </td>
                                        
                                        <td style="text-align: right">
                                            <kpicc:KPILabel ID="lblLocation" runat="server">Location&nbsp;</kpicc:KPILabel></td>
                                          <td>                                              
                                                <kpicc:KPICodedDropDownList ID="cddLocation" runat="server" KPITabIndex="558" Width="100%" KPIMode="ADD" kpisecurity="AC"
                                               KPICodeID="4157"></kpicc:KPICodedDropDownList>
                                          </td>
                                    </tr>
                                </table>

                            </td>

                        
                       
                          
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td colspan="6"></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>
                                <table style="width: 100%; padding: 0;">
                                    <colgroup>
                                        <col style="width: 100%" />
                                    </colgroup>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <kpicc:KPILabel ID="lblBldPresure" runat="server" Text="Blood Pressure"></kpicc:KPILabel></td>
                                    </tr>
                                    <tr><td></td></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <kpicc:KPILabel ID="lblWeight" runat="server" Text="Weight"></kpicc:KPILabel>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                            <td colspan="6">
                                <table style="width: 100%; padding: 0; border-spacing: 0">

                                    <colgroup>
                                        <col style="width: 19%" />
                                        <col style="width: 2%" />
                                        <col style="width: 19%" />

                                        <col style="width: 20%" />
                                        <col style="width: 10%" />
                                        <col style="width: 10%" />

                                        <col style="width: 10%" />

                                        <col style="width: 10%" />


                                    </colgroup>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <kpicc:KPILabel ID="lblLstReading" runat="server">Last Reading</kpicc:KPILabel>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <kpicc:KPILabel ID="lblLstReading2" runat="server">Last Reading</kpicc:KPILabel>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left">
                                            <kpicc:KPITextBox ID="txtBloodPressure1" runat="server" Width="40%" KPISecurity="N" KPITabIndex="-1" CssClass="textboxInactive" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                            <span>/</span>
                                            <kpicc:KPITextBox ID="txtBloodPressure2" Text="" runat="server" Width="41%" KPISecurity="N" KPITabIndex="-1" CssClass="textboxInactive" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td style="text-align: left">
                                            <kpicc:KPITextBox ID="txtBloodPressure1Old" runat="server" Width="40%" KPISecurity="N" KPITabIndex="-1" CssClass="textboxInactive" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                            <span>/</span>
                                            <kpicc:KPITextBox ID="txtBloodPressure2Old" Text="" runat="server" Width="42%" KPISecurity="N" KPITabIndex="-1" CssClass="textboxInactive" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                        </td>
                                        <td style="text-align: right">
                                            <kpicc:KPILabel ID="lblPulse" runat="server" Text="Pulse&nbsp;"></kpicc:KPILabel>
                                        </td>
                                        <td>
                                            <kpicc:KPITextBox ID="txtPulse" runat="server" KPISecurity="N" KPITabIndex="-1" Width="75px" MaxLength="3"></kpicc:KPITextBox>
                                        </td>
                                        <td>
                                            <kpicc:KPITextBox ID="txtPulseLstRead" runat="server" KPISecurity="N" CssClass="ReadOnly" KPITabIndex="-1"
                                                Width="75px"></kpicc:KPITextBox>
                                        </td>
                                        <td>
                                            <kpicc:KPIButton ID="cmdVitals" Text="Vital Entry" Width="80px" runat="server" CssClass="CustomBtn" KPISecurity="ACI" OnClientClick="fn_OpenVitals()" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <kpicc:KPITextBox ID="txtWeight" runat="server" Width="91%" KPISecurity="N" KPITabIndex="560" CssClass="textbox" MaxLength="6"></kpicc:KPITextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <kpicc:KPITextBox ID="txtWghtLstRead" runat="server" KPISecurity="N" CssClass="Readonly" KPITabIndex="-1"
                                                Width="92%"></kpicc:KPITextBox>
                                        </td>
                                        <td style="text-align: right">
                                            <kpicc:KPILabel ID="lblHeight" runat="server">Height&nbsp;</kpicc:KPILabel>
                                        </td>
                                        <td>
                                            <kpicc:KPITextBox ID="txtHeight" runat="server" Width="75px" KPISecurity="N" KPITabIndex="561" CssClass="textbox" MaxLength="3"></kpicc:KPITextBox>

                                        </td>
                                        <td>
                                            <kpicc:KPITextBox ID="txtLstHeight" runat="server" KPISecurity="N" CssClass="ReadOnly" KPITabIndex="-1"
                                                Width="75px"></kpicc:KPITextBox>
                                        </td>
                                        <td>
                                            <kpicc:KPIButton ID="cmdChart" Text="Chart Entry" runat="server" Width="80px" CssClass="CustomBtn" KPISecurity="ACI" OnClientClick="fn_OpenCharting()" /></td>
                                        <td>&nbsp;</td>
                                    </tr>

                                </table>


                            </td>
                            <td></td>
                        </tr>
                      
                        <tr>
                            <td></td>
                            <td style="text-align: right;white-space:nowrap">
                                <kpicc:kpilabel id="lblDiagCond" runat="server" Text="Diagnosed Condition&nbsp;"></kpicc:kpilabel>
                                </td>
                            <td colspan="2">
                                <kpicc:kpicodedlookup id="lupDiagnsis" runat="server" kpitabindex="562"  kpimode="Search" DescFieldWidth="38%" ValueFieldWidth="25%"  kpisecurity="AC"
                                    kpicodeid="6013"></kpicc:kpicodedlookup>
                            </td>
                            
                            <td colspan="3">
                               <table style="width:99%;padding:0;border-spacing:0;">
                                   <colgroup><col style="width:52%" /><col style="width:44%" /><col style="width:4%" /></colgroup>
                                   <tr>
                                       <td style="text-align: right; white-space: nowrap">
                                           <kpicc:KPICheckBox ID="ChkAdmMedFacility" runat="server" KPISecurity="AC" KPITabIndex="563" Width="100%" Text="&nbsp;Admitted to Medical Facility&nbsp;"></kpicc:KPICheckBox>
                                       </td>
                                       <td style="text-align: left; padding: 0; border-spacing: 0" colspan="2">
                                           <kpicc:KPICodedDropDownList ID="cddAdmMedFacility" runat="server" KPITabIndex="564" Width="100%" KPIMode="Search" kpisecurity="AC"
                                               KPICodeID="3017"></kpicc:KPICodedDropDownList>
                                       </td>
                                       
                                   </tr>
                               </table>
                            </td>
                            
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="text-align: right">
                                <kpicc:kpilabel id="lblNotes" runat="server" Text="Facility Notes&nbsp;"></kpicc:kpilabel>
                                </td>
                            <td>
                                <kpicc:KPIButton ID="cmdEditor" runat="server" KPISecurity="AC" KPITabIndex="566" Width="70px" CssClass="CustomBtn" Text="Notes" Height="20px" Font-Size="10pt"></kpicc:KPIButton>
                            </td>
                            <td colspan="5">
                              
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td colspan="2">
                                <table id="Table3" style="padding:0;border-spacing:0;width:95%">
                                    <colgroup>
                                        <col style="width:40%" />
                                        <col style="width:60%" />
                                        
                                    </colgroup>
                                    <tr>
                                        <td style="white-space:nowrap">
                                            <kpicc:kpicheckbox id="chkSplMealReq" runat="server" kpisecurity="AC" kpitabindex="570" text="&nbsp;Special Meal Required&nbsp;"></kpicc:kpicheckbox>
                                        </td>
                                        <td colspan="1">
                                            <%--<kpicc:kpicodeddropdownlist id="cddSplMealReq" runat="server" kpitabindex="570" width="100%" kpicodeid="5014"></kpicc:kpicodeddropdownlist>--%>
                                            <kpicc:kpiradcombo id="radSpecialMealRequired" runat="server" KPICodeID="5014" KPIInternal="true" EnableViewState="true" KPIMode="ADD"
                                                    isselected="True" KPITabIndex="570" EnableCheckAllItemsCheckBox="true" width="100%" maxheight="300px" KPISecurity="AC"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="570"></kpicc:kpiradcombo>
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                         <%--<td></td>--%>
                            <td colspan="4">
                                <table id="Table03" style="width:100%;padding:0;border-spacing:0"  border="0">
                                    <colgroup>
                                        <col style="width:20%" />
                                        <col style="width:40%" />
                                        <col style="width:40%" />
                                        
                                    </colgroup>
                                    <tr>
                                        <td style="white-space:nowrap">
                                            <kpicc:kpicheckbox id="chkTBTested" runat="server" kpisecurity="AC" kpitabindex="571" text="&nbsp;TB Test Administered &nbsp;&nbsp;&nbsp;TB Results&nbsp;"></kpicc:kpicheckbox>
                                        </td>
                                        <td style="text-align:left"> 
                                            <%--<kpicc:kpilabel id="lblTBResults" runat="server" Text="TB Results&nbsp;"></kpicc:kpilabel>--%>
                                             <kpicc:kpicodeddropdownlist id="cddResults" runat="server" KPISecurity="AC" kpitabindex="572" width="100%" kpicodeid="3176"></kpicc:kpicodeddropdownlist>
                                        </td>
                                       <td></td>
                                        
                                    </tr>
                                </table>
                            </td>
                            <td></td>
                        </tr>

                          <tr>
                            
                            <td colspan="9"></td>
                            
                        </tr>


                      

                                        <tr>
                                            <td></td>
                                            <td style="text-align: right; vertical-align: top">
                                                <table style="width:100%">
                                                    <colgroup><col style="width:100%" /></colgroup>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>                                                        
                                                        <td><kpicc:KPILabel ID="lblPrescription" runat="server" Text="Prescription(s)"></kpicc:KPILabel></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td colspan="6" style="padding: 0; border-spacing: 0">
                                                <table id="Table7" style="width: 100%; padding: 0; border-spacing: 0">
                                                    <colgroup>
                                                        <col style="width: 26%" />
                                                        <col style="width: 10%" />
                                                        <col style="width: 23%" />
                                                        <col style="width: 2%" />
                                                        <col style="width: 16%" />
                                                        <col style="width: 12%" />
                                                        <col style="width: 11%" />
                                                    </colgroup>

                                                    <tr>
                                                        <td class="req">
                                                            <kpicc:KPILabel ID="lblDatePrescribed" runat="server">Date Prescribed</kpicc:KPILabel></td>
                                                        <td></td>
                                                        <td class="req">
                                                            <kpicc:KPILabel ID="lblDoctor" runat="server">Prescribing Doctor</kpicc:KPILabel></td>
                                                        <td></td>
                                                        <td>
                                                            <kpicc:KPILabel ID="lblPrescriptionDoctor" runat="server">Prescription#</kpicc:KPILabel></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <kpicc:KPIDateTime ID="dttmPrescribedDate" runat="server" Visible="True" KPIMandatory="True" KPITabIndex="573" KPITimeDisplay="TimeShort"></kpicc:KPIDateTime>
                                                        </td>
                                                        <td></td>
                                                        <td style="white-space: nowrap">
                                                            <kpicc:KPICodedLookUp ID="lupPrimaryDoctor" runat="server" KPITabIndex="574" KPICodeID="780" ValueFieldWidth="100%" KPIWidth="0" KPIShowDescription="False" KPISecurity="AC" KPIMode="Search"></kpicc:KPICodedLookUp>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <kpicc:KPITextBox ID="txtPrescription" runat="server" KPITabIndex="575" KPISecurity="AC" Width="98%" MaxLength="15"></kpicc:KPITextBox></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align:left" class="req">
                                                            <kpicc:KPILabel ID="lblDrug" runat="server">Drug</kpicc:KPILabel>
                                                        </td>
                                                        <td class="req">
                                                            <kpicc:KPILabel ID="lblDosage" runat="server">Dosage</kpicc:KPILabel>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: left">
                                                            <kpicc:KPILabel ID="lblPrescribedAmt" runat="server">Prescribed Duration/Amt.</kpicc:KPILabel>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <kpicc:KPILabel ID="lblRefills" runat="server">Refills</kpicc:KPILabel>
                                                        </td>

                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <kpicc:KPICodedDropDownList ID="cddDrug" runat="server" KPISecurity="AC" KPITabIndex="576" Width="95%" KPICodeID="6007"></kpicc:KPICodedDropDownList>
                                                        </td>
                                                        <td>
                                                            <kpicc:KPITextBox ID="txtDosage" runat="server" KPISecurity="AC" KPITabIndex="577" Width="90%" MaxLength="8"></kpicc:KPITextBox>
                                                        </td>
                                                        <td>
                                                            <table style="width: 100%; padding: 0; border-spacing: 0">
                                                                <colgroup>
                                                                    <col style="width: 50%" />
                                                                    <col style="width: 50%" />
                                                                </colgroup>
                                                                <tr>
                                                                    <td>
                                                                        <kpicc:KPITextBox ID="txtPrescribedAmt" runat="server" KPITabIndex="578" KPISecurity="AC" Width="98%" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                                                    </td>

                                                                    <td>
                                                                        <kpicc:KPICodedDropDownList ID="cddPrescribedAmtDuration" TabIndex="577" runat="server" KPISecurity="AC" KPITabIndex="579" KPIWidth="0" Width="100%" KPIMandatory="Yes" KPICodeID="3111"></kpicc:KPICodedDropDownList>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <kpicc:KPITextBox ID="txtRefills" runat="server" KPISecurity="AC" KPITabIndex="580" Width="81%"
                                                                MaxLength="2" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                                        </td>

                                                        <td colspan="2" style="text-align: left; white-space: nowrap">
                                                            <kpicc:KPICheckBox ID="chkGenericAllowed" runat="server" KPISecurity="AC" KPITabIndex="581" Text="&nbsp;Generic Allowed"></kpicc:KPICheckBox></td>

                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td style="text-align: right" id="tdNotes">
                                                <kpicc:KPILabel ID="lblPresNotes" runat="server" Text="Notes&nbsp;"></kpicc:KPILabel>
                                            </td>
                                            <td colspan="5">
                                                <kpicc:KPITextBox ID="txtDescription" TabIndex="580" runat="server" KPISecurity="AC" KPITabIndex="582" TextMode="MultiLine"
                                                    Width="95%" Height="30px" MaxLength="4000"></kpicc:KPITextBox>
                                            </td>
                                            
                                            <td style="text-align:left"><kpicc:KPIButton ID="btnDisposition" runat="server" KPISecurity="AC" Width="120px" KPITabIndex="583" CssClass="CustomBtn" Text="Disposition"></kpicc:KPIButton></td>
                                            <td></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2"><kpicc:KPICheckBox ID="chkInactive" runat="server" KPISecurity="AC" KPITabIndex="584" Text="&nbsp;Include Inactive?" TextAlign="Right"  AutoPostBack="true" OnCheckedChanged="chkInactive_CheckedChanged" /></td>
                                            <td colspan="5"></td>
                                            <td colspan="1">

                                                <table style="width: 100%; padding: 0; border-spacing: 0">
                                                    <colgroup>
                                                        <col style="width: 59%" />
                                                        <col style="width: 20%" />
                                                        <col style="width: 1%" />
                                                        <col style="width: 20%" />
                                                    </colgroup>
                                                    <tr style="padding: 0; border-spacing: 0">
                                                        <td></td>
                                                        <td>
                                                            <kpicc:KPIImageButton ID="cmdAdd" runat="server" ImageUrl="/KPIImages/ico/AddData_Text.png" ToolTip="Add" KPISecurity="AC" KPITabIndex="585"></kpicc:KPIImageButton>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <kpicc:KPIImageButton ID="cmdClear" runat="server" ImageUrl="/KPIImages/ico/ClearData_Text.png" KPISecurity="ACI" KPITabIndex="586"></kpicc:KPIImageButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                        </tr>



                                        <tr>

                                            <td colspan="8" style="vertical-align: top; overflow-y: auto">
                                                <kpicc:KPIHGrid ID="grdPrescription" runat="server" KPISecurity="AC" Width="100%" ShowHeader="true" ShowFooter="true" Height="130px"
                                                    AutoGenerateColumns="false" DataMember="Parent" EnableDataViewState="true" KPIDefaultJurisAlias="False" DataKeyFields="OrderNo" CssClass="OverFlow"
                                                    InitialDataBindDepth="-1" AutoGenerateBands="false" OnInitializeRow="grdPrescription_InitializeRow"
                                                    KPIRepositoryID="0">
                                                    <ClientEvents Click="grdPrescription_CellClickHandler"></ClientEvents>

                                                    <GroupingSettings EnableColumnGrouping="True" InitialRowExpandState="Collapsed" GroupAreaVisibility="Hidden" GroupedRowCssClass="boldness" GroupedRowTextMask="{1}">

                                                        <GroupedColumns>
                                                            <igtbl:GroupedColumn ColumnKey="Drugs" />
                                                            <igtbl:GroupedColumn ColumnKey="PrescribedDttm" />
                                                        </GroupedColumns>
                                                        <ColumnSettings>
                                                            <igtbl:ColumnGroupingSetting ColumnKey="PrescribedDttm" DefaultSortDirection="Descending" Groupable="false" MergeCells="false" />
                                                        </ColumnSettings>
                                                    </GroupingSettings>
                                                    <Columns>

                                                        <igtbl:BoundDataField Key="CreatedDttm" Hidden="true" DataFieldName="CreatedDttm"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Rowno" Hidden="true" DataFieldName="Rowno"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="JMMedPrescriptionID" Hidden="True" DataFieldName="JMMedPrescriptionID"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="PrescribedDttm" Width="12%" DataFieldName="PrescribedDttm" Header-Text="Date&lt;br&gt;Prescribed" DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Prescription" Width="12%" DataFieldName="Prescription" Header-Text="Prescription#"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Drugs" Width="12%" DataFieldName="Drugs" Header-Text="Drug Name"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Dosage" Width="8%" DataFieldName="Dosage" Header-Text="Dosage"></igtbl:BoundDataField>
                                                        <igtbl:UnboundField Key="DurationYrs" Width="8%" Header-Text="Prescribed&lt;br&gt;Duration"></igtbl:UnboundField>

                                                        <igtbl:BoundDataField Key="Refills" Width="8%" DataFieldName="Refills" Header-Text="Refills&lt;br&gt;Allowed"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="UseEndedDttm" Width="13%" DataFieldName="UseEndedDttm" Header-Text="Use&lt;br&gt;Ended" DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Balance" Hidden="True" DataFieldName="Balance"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="OrderBalance" Hidden="True" DataFieldName="OrderBalance"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="CurQuantity" Width="6%" DataFieldName="CurQuantity" Header-Text="Balance"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Duration" Hidden="True" DataFieldName="Duration"></igtbl:BoundDataField>

                                                        <igtbl:UnboundField Key="SupplyStatus" Width="8%" Header-Text="Supply&lt;br&gt;Status"></igtbl:UnboundField>
                                                        <igtbl:UnboundField Key="Schedule" Width="8%" Header-Text="Schedule"></igtbl:UnboundField>
                                                        <igtbl:UnboundField Key="Cmts" Width="5%" Header-Text="C"></igtbl:UnboundField>

                                                        <igtbl:BoundDataField Key="OrderNo" Hidden="True" DataFieldName="OrderNo"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="OrderedNo" Hidden="True" DataFieldName="OrderedNo"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="JurisID" Hidden="True" DataFieldName="JurisID"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="JMBookingID" Hidden="True" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="JMMedicalHistID" Hidden="True" DataFieldName="JMMedicalHistID"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="JMMedVisitID" Hidden="True" DataFieldName="JMMedVisitID"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="PrescribingDoctorID" Hidden="True" DataFieldName="PrescribingDoctorID"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="MedicalPrescriptionNo" Hidden="True" DataFieldName="MedicalPrescriptionNo"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="Drug" Hidden="True" DataFieldName="Drug" Header-Text="Drug"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="PrescribedAmt" Hidden="True" DataFieldName="PrescribedAmt" Header-Text="PrescribedAmt"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="PrescribedDuration" Hidden="True" DataFieldName="PrescribedDuration"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="RefillBal" Hidden="True" DataFieldName="RefillBal"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="IsGeneric" Hidden="True" DataFieldName="IsGeneric"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="Times" Hidden="True" DataFieldName="Times"></igtbl:BoundDataField>

                                                        <igtbl:BoundDataField Key="MedicationType" Hidden="True" DataFieldName="MedicationType"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="IsPersonalProp" DataFieldName="IsPersonalProp" Hidden="true"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="BalanceType" Hidden="True" DataFieldName="BalanceType"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="DoctorName" Hidden="True" DataFieldName="DoctorName"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="JMPrescriptionOrderID" Hidden="True" DataFieldName="JMPrescriptionOrderID"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="PrescribeNotes" Hidden="True" DataFieldName="PrescribeNotes" HtmlEncode="false"></igtbl:BoundDataField>
                                                        <igtbl:UnboundField Key="Notes" Hidden="True" HtmlEncode="false"></igtbl:UnboundField>
                                                        <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMedPrescriptionID"></igtbl:BoundDataField>
                                                        <igtbl:UnboundField Key="KPIMode" Hidden="True"></igtbl:UnboundField>
                                                        <igtbl:UnboundField Key="IsActiveSchedule" Hidden="True"></igtbl:UnboundField>
                                                        <igtbl:UnboundField Key="UseEndedDttmTemp" DataFormatString="{0:MM/dd/yyyy HH:mm}" Hidden="True"></igtbl:UnboundField>
                                                        <igtbl:BoundDataField Key="Disposition" Hidden="True" DataFieldName="Disposition"></igtbl:BoundDataField>
                                                        <igtbl:BoundDataField Key="DrugSort" Hidden="True" DataFieldName="DrugSort"></igtbl:BoundDataField>

                                                    </Columns>
                                                    <Bands>
                                                        <igtbl:Band DataMember="Child" AutoGenerateColumns="false" ShowFooter="false" ShowHeader="true">
                                                            <Columns>


                                                                <igtbl:BoundDataField DataFieldName="RowNo" Key="RowNo" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="JMPreOrderHistID" Key="JMPreOrderHistID" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="OrderedNo" Key="OrderedNo" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="JMPreOrderHistNo" Key="JMPreOrderHistNo" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="JMMedPrescriptionID" Key="JMMedPrescriptionID" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="JurisID" Key="JurisID" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="JMBookingID" Key="JMBookingID" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="JMPrescriptionOrderID" Key="JMPrescriptionOrderID" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="Drug" Key="Drug" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="OrderAction" Key="OrderAction" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="OrderActionDesc" Key="OrderActionDesc" Header-Text="Order Action" Width="25%"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="OrderedDttm" Key="OrderedDttm" Header-Text="Date/Time" DataFormatString="{0:MM/dd/yyyy HH:mm}" Width="15%"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="FullName" Key="FullName" Header-Text="PF#/Name" Width="25%"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="QtyBalance" Key="QtyBalance" Header-Text="Quantity" Width="10%"></igtbl:BoundDataField>

                                                                <igtbl:BoundDataField Key="OrderedNotes" Hidden="True" DataFieldName="OrderedNotes"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="StorageLocation" Key="StorageLocation" Hidden="true"></igtbl:BoundDataField>
                                                                <igtbl:BoundDataField DataFieldName="StorageLocDesc" Key="StorageLocDesc" Header-Text="Storage Location" Width="20%"></igtbl:BoundDataField>

                                                                <igtbl:UnboundField Key="Cmts" Width="5%" Header-Text="C"></igtbl:UnboundField>

                                                                <igtbl:BoundDataField DataFieldName="MedicationType" Key="MedicationType" Hidden="true"></igtbl:BoundDataField>


                                                                <igtbl:BoundDataField DataFieldName="OrderedPFID" Key="OrderedPFID" Hidden="true"></igtbl:BoundDataField>




                                                                <igtbl:BoundDataField DataFieldName="QuantityDesc" Key="QuantityDesc" Hidden="true"></igtbl:BoundDataField>

                                                                <igtbl:BoundDataField DataFieldName="PFCode" Key="PFCode" Hidden="true"></igtbl:BoundDataField>





                                                            </Columns>
                                                        </igtbl:Band>
                                                    </Bands>


                                                    <Behaviors>
                                                        <igtbl:Activation Enabled="true"></igtbl:Activation>
                                                        <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                                        <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                                                        <igtbl:EditingCore AutoCRUD="False" Enabled="true" BatchUpdating="true">
                                                            <Behaviors>
                                                                <igtbl:CellEditing Enabled="false"></igtbl:CellEditing>
                                                            </Behaviors>
                                                        </igtbl:EditingCore>


                                                    </Behaviors>



                                                </kpicc:KPIHGrid>
                                            </td>
                                            <td></td>
                                        </tr>

                        <tr>
                            <td></td>
                            <td style="text-align: right">
                                <kpicc:kpilabel id="lblCourtDttm" runat="server" kpirepositoryid="0" Text="Next Appointment&nbsp;"></kpicc:kpilabel>
                            </td>
                            <td colspan="6">

                                <table style="padding: 0; border-spacing: 0; width: 70%">
                                    <colgroup>
                                        <col style="width: 15%;" />
                                        <col style="width: 1%;" />
                                        <col style="width: 20%;" />
                                        <col style="width: 1%;" />
                                        <col style="width: 63%;" />
                                    </colgroup>
                                    <tr>

                                        <td>
                                            <kpicc:kpibutton id="cmdSchedule" runat="server" kpisecurity="ACI" width="100px" cssclass="CustomBtn" text="Schedule" kpitabindex="587"></kpicc:kpibutton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <kpicc:kpidatetime id="schDttm" runat="server" kpisecurity="N" kpitimedisplay="TimeShort" kpiwidth="150" kpitabindex="-1"></kpicc:kpidatetime>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                            <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                        </tr>

                    </table>
                </td>
            </tr>
            <tr>
                <td class="statusBar" colspan="9">
                    <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="AC"></kpicc:kpiliteral>

                   
                </td>
            </tr>
        </table>
        <script src="../KPIFrameWorkWeb/Scripts/Date.js?v=2018.10.01" type="text/javascript"></script>
        <script src="frmMedicalVisit.js?v=2018.10.01" type="text/javascript"></script>
    </form>
</body>
</html>


