<%@ Page Language="c#" CodeFile="frmMedicalDentist.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmMedicalDentist" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="igtab" %>

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
    <script src="../KPIFrameworkWeb/Loader2010.js?v=2018.07.05" type="text/javascript"></script>
    <style type="text/css">


        input[type=radio] {
            margin: 0px !important;
            vertical-align: bottom !important;
        }

    </style>
</head>
<body class="masterfrm">
    <script src="../KPIFrameworkWeb/Scripts/Tooltip.js?v=2017.01.03" type="text/javascript"></script>
    <form id="frmMedicalDentist_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <div id="tab0" style="height: 100%">
           <table style="width:100%; padding:0;border-spacing:0;table-layout:fixed;height:100%" >
    <colgroup><col style="width:100%;"/></colgroup>
    <tr>
        <td class="status" valign="middle" style="text-align:left">
            <table cellspacing="4">
                <tr valign="middle">
                    <td>
                        <kpicc:kpiimagebutton id="cmdSave" runat="server" kpitabindex="1000" cssclass="menuItem" kpisecurity="AC" alternatetext="Save" tooltip="Save" imageurl="/KPIImages/ico/16_L_save.gif" onclick="cmdSave_Click"></kpicc:kpiimagebutton>
                    </td>
                    <td></td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdSaveNClose" runat="server" kpitabindex="1001" cssclass="menuItem" kpisecurity="AC" alternatetext="Save &amp; Close" tooltip="Save &amp; Close" imageurl="/KPIImages/ico/16_saveClose.gif" onclick="cmdSaveNClose_Click"></kpicc:kpiimagebutton>
                    </td>
                    <td></td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdPrint" runat="server" kpitabindex="1003" cssclass="menuItem" kpisecurity="ACI" alternatetext="Print" tooltip="Print" imageurl="/KPIImages/ico/16_print.gif" causesvalidation="False" onclick="cmdPrint_Click"></kpicc:kpiimagebutton>
                    </td>
                    <td></td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdRefresh" runat="server" kpitabindex="1004" cssclass="menuItem" kpisecurity="ACI" alternatetext="Reset" tooltip="Reset" imageurl="/KPIImages/ico/16_L_refresh.gif" causesvalidation="False" onclick="cmdRefresh_Click"></kpicc:kpiimagebutton>
                    </td>
                    <td width="100%"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top">
             <table style="padding: 0; border-spacing: 0; width: 100%;">
                <colgroup>
                    <col style="width: 2%" />
                    <col style="width: 15%; text-align: right" />
                    <col style="width: 11%" />
                    <col style="width: 11%" />
                    <col style="width: 15%" />
                    <col style="width: 15%" />
                    <col style="width: 14%" />
                    <col style="width: 15%" />
                    <col style="width: 4%" />
                </colgroup>
              
                <tr>
                    <td colspan="9"></td>
                </tr>

                <tr>
                    <td colspan="9" style="vertical-align:top">
                        <table style="padding: 0; width: 100%;">
                            <colgroup>
                                <col style="width: 2%" />
                                <col style="width: 14%; text-align: right" />
                                <col style="width: 17%" />
                                <col style="width: 8%" />
                                <col style="width: 13% !important" />
                                <col style="width: 10% !important" />
                                <col style="width: 19% !important" />
                                <col style="width: 16%" />
                                <col style="width: 4%" />
                            </colgroup>
                    

                            <tr>
                                <td></td>
                                <td style="text-align:right"><kpicc:kpilabel id="lblJuris" runat="server" kpisecurity="I" kpirepositoryid="0"> Juris&nbsp;</kpicc:kpilabel></td>
                                <td><kpicc:kpijurisdropdownlist id="lstJuris" runat="server" kpisecurity="A" width="100%" KPITabIndex="700"></kpicc:kpijurisdropdownlist></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td style="text-align: right">
                                    <kpicc:KPILabel ID="lblDentalNo" runat="server" KPIRepositoryID="0">Dental#</kpicc:KPILabel>
                                </td>
                                <td style="text-align: left">
                                    <phnxcc:NumberCtrl ID="NumCrtlDentalNo" runat="server" KPISecurity="N" KPINumberResultType="Detail" KPIDetailLookUp="false" CounterType="DentalVisitNo" KPIMode="Add"></phnxcc:NumberCtrl>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td> <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                                    <input id="hdnScreenId" type="hidden" value="8540" name="hdnScreenId" runat="server" />
                                    <input id="hdnJurisID" type="hidden" name="hdnJurisID" runat="server" />
                                    <input id="hdnBookingID" type="hidden" name="hdnBookingID" runat="server" />
                                    <input id="hdnMedVisitID" type="hidden" name="hdnMedVisitID" runat="server" />
                                    <input id="hdnPrescriptionID" type="hidden" name="hdnPrescriptionID" runat="server" />
                                    <input id="hdnClearNamCtrl" type="hidden" name="hdnClearNamCtrl" runat="server" />
                                    <input id="hdnBookStaus" type="hidden" name="hdnBookStaus" runat="server" />
                                    <input id="hdnDentVisitID" type="hidden" name="hdnDentVisitID" runat="server" />
                                    <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                                    <input id="hdnLoginPFCode" type="hidden" name="hdnLoginPFCode" runat="server" />
                                    <input id="hdnLoginPFDesc" type="hidden" name="hdnLoginPFDesc" runat="server" />
                                    <input id="hdnLoginPFID" type="hidden" name="hdnLoginPFID" runat="server" />                                   
                                    <input id="hdnSetUserPFID" type="hidden" name="hdnSetUserPFID" runat="server" />        
                                    <input id="hdnDentalVisitNo" type="hidden" name="hdnDentalVisitNo" runat="server" />        

                                    <input id="hdnSaveClose" type="hidden" name="hdnSaveClose" runat="server" />  
                                    <input id="hdnAttAssocType" type="hidden" name="hdnAttAssocType" runat="server" value="4" />

                                </td>
                                <td rowspan="2" style="text-align:right;padding-top:13px" class="req"><kpicc:kpilabel id="spnno" runat="server">SPN&nbsp;</kpicc:kpilabel></td>
                                <td rowspan="2" colspan="4" style="text-align:left;padding:0;border-spacing:0">
                                    <phnxcc:NameCtrl ID="NamCtrlSPIN" runat="server" KPISecurity="AC" KPITabIndex="701" Width="100%" IsSPNNo="True" KPIClientCallBack="VisitReload" KPIResult="Detail"></phnxcc:NameCtrl>
                                </td>
                            
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                
                               
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                           
                            <tr>
                                <td></td>
                                <td colspan="1" class="req" style="text-align: right; white-space: nowrap">
                                    <kpicc:kpilabel id="lblDentalVisitReq" runat="server">Dental Visit Requested&nbsp;</kpicc:kpilabel>
                                    </td>
                                <td colspan="1">
                                    <kpicc:kpidatetime id="dttmDentalVisitReq" runat="server" kpitabindex="702" kpisecurity="AC" kpimandatory="True"></kpicc:kpidatetime>
                                </td>
                               
                                <td colspan="3" style="text-align:left;padding:0;border-spacing:0">
                                     <table style="width: 100%; padding: 0; border-spacing: 0;">
                                        <colgroup>
                                            <col style="width: 50%" />
                                            <col style="width: 2%" />
                                            <col style="width: 48%" />
                                        </colgroup>

                                         <tr>
                                             <td colspan="2" style="white-space: nowrap">
                                                 <kpicc:kpiradiolist id="chkInmateSubmitionForm" runat="server" kpitabindex="703" repeatdirection="Horizontal" width="100%" kpisecurity="AC" >
                                                <asp:ListItem Value="1" Text=" Inmate Submitted Dental Request Form"></asp:ListItem>
                                                <asp:ListItem Value="2" Text=" Jail Medical Staff Requested" />                                                
                                            </kpicc:kpiradiolist>
                                             </td>
                                         </tr>
                                         </table>
                                    
                                </td>
                                 
                                
                                <td colspan="2" style="width: 100%; padding: 0;border-spacing:0">
                                    <table id="Table6" style="width: 100%; table-layout: fixed">
                                        <colgroup>
                                            <col style="width: 40%" />
                                            <col style="width: 60%" />
                                        </colgroup>
                                        <tr>
                                            <td class="req" style="text-align: right;white-space:nowrap">
                                                <kpicc:kpilabel id="lblReceivedBy" runat="server">Received By&nbsp;</kpicc:kpilabel></td>
                                            <td style="text-align: left; white-space: nowrap;">
                                                <kpicc:kpicodedlookup id="LupReceivedBy" runat="server" kpitabindex="704" kpicodeid="110" kpimode="Search" KPIClientCallBack="FillLoggedInPF" kpisecurity="AC"
                                                    descfieldwidth="70%" valuefieldwidth="30%"></kpicc:kpicodedlookup>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: right">
                                    <kpicc:kpilabel id="lblVisitDate" runat="server">Visit Date&nbsp;</kpicc:kpilabel></td>
                                <td colspan="1">
                                    <kpicc:kpidatetime id="dttmDentalVisitDate" runat="server" kpitabindex="705" kpisecurity="AC" kpimandatory="false" OnChangeHandler="KPISetShortTimeHM_VisitedDttm"></kpicc:kpidatetime>
                                </td>

                                <td colspan="3">
                                    <table style="width: 93%;table-layout:fixed">
                                        <colgroup>
                                        <col style="width: 35%" />
                                        <col style="width: 10%" />
                                        <col style="width: 40%" />
                                        <col style="width: 15%" />                                    
                                    </colgroup>
                                        <tr>

                                             <td style="text-align: left; white-space: nowrap" colspan="2">
                                            <kpicc:KPIRadioList ID="rdoDoctorNurse" runat="server" KPITabIndex="706" RepeatDirection="Horizontal" Width="100%" KPISecurity="AC" TextAlign="Left">
                                                <asp:ListItem Value="1" Text="Attending Doctor&nbsp;"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Nurse&nbsp;" />
                                            </kpicc:KPIRadioList>
                                        </td>

                                        <td style="text-align: left;white-space:nowrap" colspan="2">
                                            <table style="width:100%"><colgroup><col style="width:100%" /></colgroup>
                                                <tr id="trAttendDoctor" runat="server">
                                                    <td> <kpicc:KPICodedLookUp ID="lupAttendingDoctor" TabIndex="6" runat="server" KPITabIndex="707" KPICodeID="785" KPIShowDescription="false" ValueFieldWidth="100%"
                                                KPIWidth="0" KPISecurity="AC" KPIMode="Search"></kpicc:KPICodedLookUp></td>
                                                </tr>
                                                <tr id="trAttendNurse" runat="server" style="display:none">
                                                    <td>  <kpicc:KPICodedLookUp ID="lupAttendingNurse" TabIndex="6" runat="server" KPITabIndex="707" KPICodeID="110" KPIShowDescription="true" ValueFieldWidth="40%" DescFieldWidth="60%"
                                                KPIWidth="0" KPISecurity="AC" KPIMode="Search"></kpicc:KPICodedLookUp></td>
                                                </tr>
                                            </table>

                                

                                       
                                        </td>

                                            
                                        </tr>
                                    </table>


                                </td>

                                <td colspan="2">
                                    <table style="width: 100%; table-layout: fixed">
                                        <colgroup>
                                            <col style="width: 40%" />
                                            <col style="width: 60%" />
                                        </colgroup>
                                        <tr>
                                          <td style="text-align: right">
                                                <kpicc:kpilabel id="lblLocation" runat="server">Location&nbsp;</kpicc:kpilabel></td>
                                            <td style="text-align: left">
                                                <kpicc:KPICodedDropDownList ID="cddLocation" runat="server" KPITabIndex="708" Width="90%" KPIMode="ADD" kpisecurity="AC"
                                               KPICodeID="4157"></kpicc:KPICodedDropDownList>                                             
                                            </td>
                                        </tr>
                                    </table>

                                </td>


                          
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="req" style="text-align: right">
                                    <kpicc:kpilabel id="lblDentalProblem" runat="server">Dental Problem&nbsp;</kpicc:kpilabel>
                                </td>
                                <td colspan="4">
                                    <kpicc:kpitextbox id="txtDentalProblem"  runat="server" kpitabindex="709" kpisecurity="AC"
                                        width="100%" height="40px" maxlength="255" textmode="MultiLine"></kpicc:kpitextbox>
                                </td>
                                <td colspan="2"></td>
                             
                                <td>&nbsp;</td>
                            </tr>
                        
                               <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                
                                <td colspan="2" style="text-align:center"><kpicc:kpilabel id="lblChart" runat="server">Dental Chart</kpicc:kpilabel> </td>
                                <td></td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td style="text-align:right;white-space:nowrap"><kpicc:kpilabel id="lblProcedures" runat="server" >Dental Procedures&nbsp;</kpicc:kpilabel></td>
                                <td colspan="4" style="text-align:left;padding:0;border-spacing:0">
                                    <table style="width:100%;padding:0;border-spacing:0;">
                                        <colgroup><col style="width:20%" /><col style="width:20%" /><col style="width:20%" /><col style="width:20%" /><col style="width:20%" /></colgroup>

                                        <tr>
                                            <td>
                                                <kpicc:kpiradcombo id="radDentProcedure" runat="server" KPICodeID="3172" KPIInternal="true" EnableViewState="true" 
                                                    isselected="True" KPITabIndex="710" EnableCheckAllItemsCheckBox="true" width="100%" maxheight="300px" kpisecurity="AC"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="709">
                                </kpicc:kpiradcombo>
                                            </td>
                                            <td style="text-align: right; white-space: nowrap">
                                                <kpicc:kpilabel id="Kpilabel1" runat="server">Dental Diseases&nbsp;</kpicc:kpilabel>
                                            </td>
                                            <td>
                                                <kpicc:kpiradcombo id="radDentDisease" runat="server" kpicodeid="3173" kpiinternal="true"
                                                    isselected="True" KPITabIndex="711" enablecheckallitemscheckbox="true" width="100%" maxheight="300px" kpisecurity="AC"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="710">
                                </kpicc:kpiradcombo>
                                            </td>
                                            <td style="text-align: right; white-space: nowrap">
                                                <kpicc:kpilabel id="Kpilabel2" runat="server">Dental Medications&nbsp;</kpicc:kpilabel>
                                            </td>
                                            <td>
                                                <kpicc:kpiradcombo id="radDentMedications" runat="server" kpicodeid="3174" kpiinternal="true"
                                                    isselected="True" KPITabIndex="712" enablecheckallitemscheckbox="true" width="100%" maxheight="300px" kpisecurity="AC"
                                                    height="100%" kpidisplayoption="Description" enabled="true" TabIndex="711">
                                </kpicc:kpiradcombo>
                                            </td>
                                        </tr>
                                    </table>

                                </td>



                            
                                <td rowspan="5" colspan="2" style="text-align:center"><kpicc:kpiimagebutton id="imgToothView" runat="server" width="192px" imageurl="/KPIImages/ico/DentalChart.jpg" height="238px"></kpicc:kpiimagebutton></td>
                                <td>&nbsp;</td>
                            </tr>
                            
                         

                               <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                
                                   
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>&nbsp;</td>
                                <td colspan="4" style="vertical-align: top">
                                    <table id="Table7" cellspacing="0" cellpadding="0" width="100%" border="0" style="table-layout:fixed">
                                        <colgroup>
                                            <col style="width: 25%" />
                                            <col style="width: 30%" />
                                            <col style="width: 29%" />
                                            <col style="width: 16%" />
                                        </colgroup>
                                        <tr>
                                            <td style="height: 13px">
                                                <kpicc:kpilabel id="lblToothNo" runat="server">Tooth#</kpicc:kpilabel>
                                            </td>
                                            <td style="height: 13px">
                                                <kpicc:kpilabel id="lblStatus" runat="server">Status</kpicc:kpilabel>
                                            </td>
                                            <td style="height: 13px">
                                                <kpicc:kpilabel id="lblOther" runat="server">Other</kpicc:kpilabel>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <kpicc:kpicodeddropdownlist id="cddTooth" runat="server" kpitabindex="713" width="95%" kpicodeid="3117" kpidisplayoption="Description" kpisecurity="AC"></kpicc:kpicodeddropdownlist>
                                            </td>
                                            <td>
                                                <kpicc:kpicodeddropdownlist id="cddStatus" runat="server" kpitabindex="714" width="95%" kpicodeid="3118" kpidisplayoption="Description" kpisecurity="AC"></kpicc:kpicodeddropdownlist>
                                            </td>
                                            <td>
                                                <kpicc:kpicodeddropdownlist id="cddOthers" runat="server" kpitabindex="715" width="95%" kpicodeid="3119" kpidisplayoption="Description" kpisecurity="AC"></kpicc:kpicodeddropdownlist>
                                            </td>
                                            <td style="text-align:right"><kpicc:KPIButton ID="cmdEditor" runat="server" KPISecurity="ACI" KPITabIndex="716" Width="70px" CssClass="CustomBtn" Text="Notes" Height="20px" Font-Size="10pt"></kpicc:KPIButton></td>
                                        </tr>
                                    </table>
                                </td>

                             <td></td>
                                
                                
                                
                                      
                            </tr>
                       
                            <tr>
                                <td>&nbsp;</td>
                                <td></td>
                                <td colspan="3"></td>
                                <td style="text-align: right; padding: 0; border-spacing: 0;float:right" colspan="1">
                                    <table style="width: 100%; padding: 0; border-spacing: 0">
                                        <colgroup>
                                            <col style="width: 59%" />
                                            <col style="width: 20%" />
                                            <col style="width: 1%" />
                                            <col style="width: 20%" />
                                        </colgroup>
                                        <tr style="padding: 0; border-spacing: 0">
                                            <td></td>
                                            <td style="text-align: right">
                                                <kpicc:kpiimagebutton id="cmdAdd" runat="server" kpitabindex="717" kpisecurity="AC" tooltip="Add" imageurl="/KPIImages/ico/AddData_Text.png"></kpicc:kpiimagebutton>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td style="text-align:left">
                                                <kpicc:kpiimagebutton id="cmdClear" runat="server" kpitabindex="718" kpisecurity="ACI" imageurl="/KPIImages/ico/ClearData_Text.png"></kpicc:kpiimagebutton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                
                                
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td colspan="4" style="vertical-align: top">
                                    <kpicc:kpigrid ID="grdTooth" runat="server" KPISecurity="AC" width="100%" height="140px" KPIRepositoryID="8000" EnableAjax="false" EnableDataViewState="true" AutoGenerateColumns="false" DataKeyFields="JMMToothStatusID" KPIDefaultJurisAlias="False">
                                        <ClientEvents Click="grdDental_CellClickHandler"></ClientEvents>
                                            <Columns>
                                                <igtbl:UnboundField Key="KPIDRK" Width="5%"><Header Text=" X" /></igtbl:UnboundField>
                                                <igtbl:UnboundField Key="KPIMode" Hidden="True"></igtbl:UnboundField>

                                                <igtbl:BoundDataField Key="Tooth" DataFieldName="Tooth" Hidden="True"></igtbl:BoundDataField>
                                                 <igtbl:BoundDataField Key="ToothDesc" Width="25%" DataFieldName="ToothDesc"><Header Text="Tooth" /></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="Status" DataFieldName="Status" Hidden="True"></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="StatusDesc" Width="45%" DataFieldName="StatusDesc"><Header Text="Status" /></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="Other" DataFieldName="Other" Hidden="True"></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="OtherDesc" Width="25%" DataFieldName="OtherDesc"><Header Text="Other" /></igtbl:BoundDataField>
                                                
                                                <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMToothStatusID"></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="JMMToothStatusID" Hidden="True" DataFieldName="JMMToothStatusID"></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="JurisID" Hidden="True" DataFieldName="JurisID"></igtbl:BoundDataField>
                                                <igtbl:BoundDataField Key="JMDentistVisitID" Hidden="True" DataFieldName="JMDentistVisitID"></igtbl:BoundDataField>
                                                
                                            </Columns>
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
                                        </kpicc:kpigrid>
                                </td>
                                
                                
                                <td></td>
                                
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>

                                <td>&nbsp;</td>
                                <td>&nbsp;</td>                                

                            </tr>
                        </table>
                    </td>
                </tr>


                 <tr>
                     <td>&nbsp;</td>
                     <td colspan="7" style="vertical-align: top; text-align: center;width:100%;">
                         <kpicc:kpipanel id="pnlUsrCntrls" runat="server" width="100%">

                             <table style="width:100%;padding:0;border-spacing:0;table-layout:fixed">
                                 <colgroup><col style="width:100%" /></colgroup>
                                 <tr>
                                     <td>
                                            <kpicc:KPITab ID="tabDentist" runat="server" KPISecurity="ACID" Width="100%" BackColor="Transparent" Height="230px" EnableOverlappingTabs="true">
                                                <Tabs><igtab:ContentTabItem Key="ATT" Text="Attachment"><Template></Template></igtab:ContentTabItem></Tabs>
                                                <ClientEvents Initialize="tabDentist_AfterSelectedTabChange"></ClientEvents>
                                          </kpicc:KPITab>
                                       </td>
                                 </tr>
                             </table>
                         </kpicc:kpipanel>
                     </td>
                     <td>&nbsp;</td>
                 </tr>
          
            </table>
        </td>
    </tr>

    <tr style="vertical-align: bottom">
        <td class="statusBar" colspan="9" style="text-align: left">
            <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="ACID"></kpicc:kpiliteral>
        </td>
    </tr>
</table>
        </div>
        <script src="../KPIFrameWorkWeb/Scripts/Date.js?v=2017.07.25" type="text/javascript"></script>
        <script src="frmMedicalDentist.js?v=2018.07.25" type="text/javascript"></script>
    </form>
</body>
</html>


