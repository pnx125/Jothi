<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMedSchedule.aspx.cs" Inherits="KPI.PhoenixWeb.Inmate.frmMedSchedule" %>

<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>

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
          .grdGColor {
              color: gray;
          }

       
          input[type="checkbox"] {
          margin:0px;
              vertical-align:text-top;
        }
    </style>
</head>
<body class="masterfrm">
    <form id="frmMedSchedule_Id" method="post" runat="server">
          <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table id="Table1" style="width: 100%; padding: 0; border-spacing: 0; height: 100%">
            <colgroup>
                <col style="width: 4%" />
                <col style="width: 92%" />
               <col style="width: 4%" />
            </colgroup>
            <tr>
                <td class="status" style="width: 100%; padding: 0; border-spacing: 0;" colspan="3">
                    <table id="Table5" cellspacing="4">
                        <tr valign="middle">
                            <td>
                                <kpicc:kpiimagebutton id="cmdSave" runat="server" kpisecurity="AC" alternatetext="Save" tooltip="Save" imageurl="/KPIImages/ico/16_L_save.gif" cssclass="menuItem" kpitabindex="1000" onclick="cmdSave_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdSaveNClose" runat="server" kpisecurity="AC" alternatetext="Save &amp; Close" tooltip="Save &amp; Close" imageurl="/KPIImages/ico/16_saveClose.gif" cssclass="menuItem" kpitabindex="1001" onclick="cmdSaveNClose_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdPrint" runat="server" kpisecurity="ACI" alternatetext="Print" tooltip="Print" imageurl="/KPIImages/ico/16_print.gif" cssclass="menuItem" kpitabindex="1002" causesvalidation="False" onclick="cmdPrint_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td></td>
                            <td>
                                <kpicc:kpiimagebutton id="cmdRefresh" runat="server" kpisecurity="ACI" alternatetext="Reset" tooltip="Reset" imageurl="/KPIImages/ico/16_L_refresh.gif" cssclass="menuItem" kpitabindex="1004" causesvalidation="False" onclick="cmdRefresh_Click"></kpicc:kpiimagebutton>
                            </td>
                            <td style="width: 100%"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding: 0; border-spacing: 0;vertical-align:top">
                    <table id="Table2" style="width: 100%; padding: 0; border-spacing: 0;height:100%;table-layout:fixed">

                        <colgroup>
                            <col style="width: 20%" />
                            <col style="width: 25%" />
                            <col style="width: 10%" />
                            <col style="width: 20%" />
                            <col style="width: 25%" />
                            
                        </colgroup>
                        <tr>
                            <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <kpicc:kpilabel id="lblMedication" runat="server">Medication&nbsp;</kpicc:kpilabel>
                            </td>
                            <td style="text-align: left"><kpicc:kpicodeddropdownlist id="cddDrug" runat="server" KPISecurity="N" kpitabindex="501" width="100%" kpicodeid="6007"></kpicc:kpicodeddropdownlist></td>
                          <td></td>
                              <td style="text-align: right">
                                  <kpicc:kpilabel id="lblDosage" runat="server">Dosage&nbsp;</kpicc:kpilabel>
                            </td>
                            <td style="text-align: left;">
                            <kpicc:kpitextbox id="txtDosage" runat="server" kpirepositoryid="0" cssclass="textbox" width="100%"  maxlength="3" kpitabindex="502" kpisecurity="N"></kpicc:kpitextbox>
                            </td>
                            <td></td>
                              
                        </tr>

                        <tr>
                            <td style="text-align: right">
                                <kpicc:KPILabel ID="lblInstructions" runat="server">Instructions&nbsp;</kpicc:KPILabel></td>
                            <td colspan="4" style="text-align: left;">
                                <kpicc:KPITextBox ID="txtInstructions" runat="server" KPIRepositoryID="0" CssClass="textbox" Width="100%" TextMode="MultiLine"
                                    Height="32px" MaxLength="150" KPITabIndex="503" KPISecurity="AC"></kpicc:KPITextBox>
                            </td>


                        </tr>
                      
                        <tr>
                           <td style="text-align:right;white-space:nowrap" class="req">
                                <kpicc:kpilabel id="lblDistributionPeriod" runat="server">Distribution Period &nbsp;</kpicc:kpilabel>
                            </td> 
                            <td>
                                <kpicc:KPIRadCombo ID="radMedicalFlags" runat="server" KPICodeID="4151" KPIInternal="true" EnableViewState="true" KPIMode="Search"
                                    isselected="True" KPITabIndex="504" EnableCheckAllItemsCheckBox="true" Width="100%" MaxHeight="300px" KPISecurity="AC" 
                                    Height="100%" KPIDisplayOption="Description" Enabled="true" TabIndex="504">
                                </kpicc:KPIRadCombo>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                           <%-- 
                             <td><kpicc:kpitextbox id="txtDispense" runat="server" kpirepositoryid="0" cssclass="textbox" width="20%"  maxlength="3" kpitabindex="503" kpisecurity="ACID" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:kpitextbox></td>
                  --%>
                        </tr>


                         <tr>
                            <td style="text-align:right" class="req">
                                <kpicc:kpilabel id="lblStartDate" runat="server">Start Date&nbsp;</kpicc:kpilabel>
                             </td>
                            <td><kpicc:KPIDateChooser ID="dcFromDate" runat="server" Width="100px" KPISecurity="ACI" KPIMandatory="false"
                                                    KPITabIndex="505" NullDateLabel="BirthDate" Height="8px" KPIWidth="100"  OnChangeHandler="AssignScreenSch"
                                                    MaxDate="12/31/9999 23:59:59" style="height: 22px"></kpicc:KPIDateChooser>
                                

                            </td>
                            <td></td>
                            <td style="text-align:right" class="req">
                                <kpicc:kpilabel id="lblEndDate" runat="server">End Date&nbsp;</kpicc:kpilabel>
                             </td>
                            <td><kpicc:KPIDateChooser ID="dcToDate" runat="server" Width="100px" KPISecurity="ACI" KPIMandatory="false"
                                                    KPITabIndex="506" NullDateLabel="BirthDate" Height="8px" KPIWidth="100" OnChangeHandler="AssignScreenSch"></kpicc:KPIDateChooser></td>
                             
                        </tr>


                         <tr>
                            <td style="text-align:right">
                                <kpicc:kpilabel id="lblDistributionDays" runat="server">Distribution Days&nbsp;</kpicc:kpilabel>
                             </td>
                          
                            <td colspan="4">
                                <table style="width:100%;padding:0;border-spacing:0">
                                    <colgroup><col style="width:25%" /><col style="width:75%" /></colgroup>
                                    <tr>
                                        <td><kpicc:KPICodedDropDownList ID="cddActivityDays" runat="server" Width="100px" KPISecurity="AC"
                                                    KPITabIndex="507" KPIMandatory="Yes" KPIDisplayOption="Description" KPICodeID="1985" KPIOnChangeHandler="fn_ManipChkBoxes()"
                                                    ></kpicc:KPICodedDropDownList></td>
                                        
                                        <td style="white-space:nowrap;text-align:left">

                                            <kpicc:KPICheckBoxList ID="chkdays" runat="server" KPISecurity="AC" KPITabIndex="508" RepeatDirection="Horizontal" >
                                                <asp:ListItem Text="&nbsp;Sun&nbsp;" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;Mon&nbsp;" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;Tue&nbsp;" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;Wed&nbsp;" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;Thu&nbsp;" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;Fri&nbsp;" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;Sat&nbsp;" Value="6"></asp:ListItem>
                                            </kpicc:KPICheckBoxList>


                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                            
                        </tr>


                         <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
             
                    
                   

                        <tr style="padding:0;border-spacing:0">
                            
                            <td style="white-space:nowrap;text-align:left"><kpicc:KPICheckBox ID="chkInactive" runat="server" KPISecurity="AC" KPITabIndex="509" Text="&nbsp;Include Inactive?" TextAlign="Right"  OnCheckedChanged="chkInactive_CheckedChanged" AutoPostBack="true" /></td>
                            <td></td>
                            <td></td>
                            
                            <td colspan="2">
                                <table style="width: 100%; padding: 0; border-spacing: 0">
                                    <colgroup>
                                        <col style="width: 59%" />
                                        <col style="width: 20%" />
                                        <col style="width: 1%" />
                                        <col style="width: 20%" />
                                    </colgroup>
                                    <tr style="padding: 0; border-spacing: 0">
                                        <td>&nbsp;</td>
                                        <td style="text-align: right">
                                            <kpicc:KPIImageButton ID="cmdAdd" runat="server" KPISecurity="AC" ToolTip="Add" ImageUrl="/KPIImages/ico/AddData_Text.png" KPITabIndex="510"></kpicc:KPIImageButton>
                                        </td>
                                        <td style="text-align: left">
                                            <kpicc:KPIImageButton ID="cmdClear" runat="server" KPISecurity="AC" ImageUrl="/KPIImages/ico/ClearData_Text.png" KPITabIndex="511"></kpicc:KPIImageButton>
                                        </td>
                                </table>
                            </td>
                            
                        </tr>
                          <tr>
                              <td colspan="5">


                                  <kpicc:KPIGrid ID="grdSchedule" TabIndex="18" runat="server" EnableDataViewState="true" DataKeyFields="JMPrescriptionSchduleID" AutoGenerateColumns="false"
                                      KPIRepositoryID="0" KPISecurity="ACID" Width="100%" OnInitializeRow="grdSchedule_InitializeRow"
                                      Height="250px"
                                      KPIDefaultJurisAlias="False">
                                      <ClientEvents Click="grdSchedule_CellClickHandler" />
                                      <Columns>
                                          <igtbl:UnboundField Header-Text="X" Key="KPIDRK" Width="5%"></igtbl:UnboundField>
                                          <igtbl:BoundDataField Key="SNo" Hidden="True" DataFieldName="SNo" ></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="Period" Width="35%" Header-Text="Period"></igtbl:BoundDataField>
                                          <igtbl:UnboundField Key="FromTime" Width="30%" Header-Text="Start Time" DataFormatString="{0:HH:mm}"></igtbl:UnboundField>
                                          <igtbl:UnboundField Key="EndTime" Width="30%" Header-Text="End Time" DataFormatString="{0:HH:mm}"></igtbl:UnboundField>
                                          
                                          <igtbl:BoundDataField Key="Dosage" DataFieldName="Dosage" Hidden="true"></igtbl:BoundDataField>                                      
                                          <igtbl:BoundDataField Key="JMMedPrescriptionID" DataFieldName="JMMedPrescriptionID" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="JMPrescriptionSchduleID" DataFieldName="JMPrescriptionSchduleID" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="JMBookingID" DataFieldName="JMBookingID" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="JurisID" DataFieldName="JurisID" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="Dispense" DataFieldName="Dispense" Hidden="true"></igtbl:BoundDataField>                                          
                                          <igtbl:BoundDataField Key="MedicationType" Hidden="True" DataFieldName="MedicationType"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="DistributionPeriod" Hidden="True" DataFieldName="DistributionPeriod"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="PeriodStartTime" Hidden="True" DataFieldName="PeriodStartTime"  DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="PeriodEndTime" Hidden="True" DataFieldName="PeriodEndTime"  DataFormatString="{0:MM/dd/yyyy HH:mm}"></igtbl:BoundDataField>

                                          <igtbl:BoundDataField Key="IsActive" Hidden="True" DataFieldName="IsActive"></igtbl:BoundDataField>
                                          <igtbl:UnboundField Header-Text="Startdttm" Key="Startdttm" Hidden="True"></igtbl:UnboundField>
                                          <igtbl:UnboundField Header-Text="Enddttm" Key="Enddttm" Hidden="True"></igtbl:UnboundField>
                                          
                                          <igtbl:UnboundField Header-Text="KPIMode" Key="KPIMode" Hidden="True"></igtbl:UnboundField>
                                          <igtbl:BoundDataField Key="KPIID" DataFieldName="JMPrescriptionSchduleID" Hidden="true"></igtbl:BoundDataField>

                                          <igtbl:BoundDataField Key="StartDate" DataFieldName="StartDate" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="FinishDate" DataFieldName="FinishDate" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="RepeatEvery" DataFieldName="RepeatEvery" Hidden="true"></igtbl:BoundDataField>
                                          <igtbl:BoundDataField Key="Instructions" DataFieldName="Instructions" Hidden="true"></igtbl:BoundDataField>
                                         
                                          
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
                              </td>
                        </tr>

                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>


        

            <tr>
                <td class="statusBar" style="width: 100%; text-align: left; vertical-align: top" colspan="3">
                    <kpicc:kpiliteral id="lblErrorMsg" runat="server" kpisecurity="ACID"></kpicc:kpiliteral>
                    <input id="hdnScreenId" type="hidden" value="8537" name="hdnScreenId" runat="server" />
                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                    <input id="hdnbookingid" type="hidden" name="hdnbookingid" runat="server" />
                    <input id="hdnVendorID" type="hidden" name="hdnVendorID" runat="server" />
                    <input id="hdnMedPrescribeID" type="hidden" name="hdnMedPrescribeID" runat="server" />
                    <input id="hdnMedPresSchID" type="hidden" name="hdnMedPresSchID" runat="server" />                    
                    <input id="hdnDrugCodeValue" type="hidden" name="hdnDrugCodeValue" runat="server" />   
                    
                    
                </td>
            </tr>
        </table>
        <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.10.01" type="text/javascript"></script>
        <script src="frmMedSchedule.js?v=2018.10.01" type="text/javascript"></script>
    </form>
</body>
</html>
