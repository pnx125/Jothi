<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrMedicalMain.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedicalMain" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="phnxcc" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>


<table id="Table1" style="table-layout: fixed;padding:0;border-spacing:0;width:100%" >
    <colgroup>
        <col style="width: 3%" />
        <col style="width: 23%" />
        <col style="width: 1%" />
        <col style="width: 18%" />
        <col style="width: 20%" />
        <col style="width: 16%" />
        <col style="width: 16%" />
        <col style="width: 3%" />
    </colgroup>
    <tr>
        <td colspan="4">&nbsp;</td><td colspan="4"></td>
    </tr>
    <tr>
        <td></td>
        <td style="text-align:left;">
           

             <table id="Table21" style="width: 100%;padding:0;border-spacing:0">
                <colgroup>
                    <col style="width: 100%" />
                </colgroup>
                 <tr>
                     <td style="text-align:left;padding:0;border-spacing:0;white-space:nowrap"> <kpicc:kpilabel id="lblPrimaryDoctor" runat="server">Primary Doctor</kpicc:kpilabel></td>
                 </tr>
                 <tr>
                     <td style="white-space:nowrap;text-align:left;padding:0;border-spacing:0">
          
            <kpicc:KPICodedLookUp ID="lupPrimaryDoctor" TabIndex="6" runat="server"  KPITabIndex="600" KPICodeID="780" ValueFieldWidth="80%"
                                                 KPIShowDescription="true" KPISecurity="AC" KPIClientCallBack="fn_DispInfo" kpimode="Search"></kpicc:KPICodedLookUp>
        </td>
                 </tr>
                 </table>
        </td>
        <td></td>
        <td></td>
        <td colspan="3" style="width: 100%; padding: 0; border-spacing: 0">
            <table id="Table3" style="width: 100%;padding:0;border-spacing:0" border="0">
                <colgroup>
                    <col style="width: 40%" />
                    <col style="width: 60%" />
                </colgroup>
                <tr>

                    <td style="text-align: left; padding: 0; border-spacing: 0">
                        <kpicc:kpilabel id="lblOfficeLocation" runat="server" cssclass="Customlbl">Office Location</kpicc:kpilabel>
                    </td>
                    <td>
                        <kpicc:kpilabel id="lblPhone" runat="server" cssclass="Customlbl">Phone Number</kpicc:kpilabel>
                    </td>
                </tr>
                <tr>

                    <td style="text-align: left; padding: 0; border-spacing: 0">
                        <kpicc:kpitextbox id="txtOfficeLocation" runat="server" cssclass="textboxInactive" kpisecurity="N" width="100%" kpitabindex="-1"></kpicc:kpitextbox>
                    </td>
                    <td>
                       <%-- <kpicc:kpitextbox id="txtPhone" runat="server" cssclass="ReadOnly" kpisecurity="N" width="100%" kpitabindex="602"></kpicc:kpitextbox>--%>
                         <kpicc:kpicustomphone id="cusHeaderPhone" runat="server" kpitabindex="-1" kpisecurity="N" width="100%" kpiwidth="0"  CssClass="PhoneInactive"  tabindex="-1"></kpicc:kpicustomphone>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td colspan="3"></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td align="center" style="width: 19.1%">
            <kpicc:kpilabel id="lblFlag" runat="server" font-bold="True" forecolor="Red">**Medical Flags**</kpicc:kpilabel>
        </td>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblLstMedvisit" runat="server" cssclass="Customlbl" Text="Last Medical Visit&nbsp;"></kpicc:kpilabel>
            </td>

        <td>
            <%--<kpicc:kpitextbox id="txtLastVisit" runat="server" cssclass="ReadOnly" kpisecurity="N" width="65%"
                kpitabindex="603"></kpicc:kpitextbox>--%>
            <kpicc:kpidatetime id="dttmVisitDate" runat="server" kpisecurity="N" kpitabindex="-1" ></kpicc:kpidatetime>
        </td>
        <td style="text-align: right">
            
            &nbsp;</td>
        <td style="text-align: left">
          
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
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>
            <kpicc:KPILabel ID="lblAttendingDoctor" runat="server" >Last Recorded Readings</kpicc:KPILabel></td>
        <td></td>
        <td></td>
        <td></td>
       

    </tr>
    <tr>
        <td></td>
        <td style="width: 19.1%">
            <kpicc:kpicodeddropdownlist id="cddFlag" runat="server" width="100%" kpitabindex="605" KPISecurity="AC" kpicodeid="2403" kpidisplayoption="Description"></kpicc:kpicodeddropdownlist>
        </td>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblBldPresure" runat="server" Text="Blood Pressure&nbsp;"></kpicc:kpilabel></td>
        <td style="text-align:left;padding:0;border-spacing:0">
            <%--<kpicc:KPIMaskEdit ID="mskBlood" runat="server" KPITabIndex="-1" width="75px" KPISecurity="N" CssClass="textboxInactive"  ReadOnly="true" InputMask="###/###"></kpicc:KPIMaskEdit>--%>

           <table style="width: 70%; table-layout: fixed;padding:0;border-spacing:0">
                            <colgroup>
                                <col style="width: 100%" />
                            </colgroup>
                            <tr>

                                <td style="text-align:left">
                                    <kpicc:KPITextBox ID="txtBloodPressure1" runat="server" Width="30px" KPISecurity="N" KPITabIndex="-1" CssClass="textboxInactive" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                    <span>/</span>
                                    <kpicc:KPITextBox ID="txtBloodPressure2" Text="" runat="server" Width="30px" KPISecurity="N" KPITabIndex="-1" CssClass="textboxInactive" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                                </td>


                            </tr>
                        </table>
        </td>

        <td style="text-align: right">
            <kpicc:kpilabel id="lblPulse" runat="server">Pulse</kpicc:kpilabel>
            &nbsp;</td>
        <td style="text-align: left">
            <kpicc:kpitextbox id="txtPulse" runat="server" cssclass="ReadOnly" kpisecurity="N" width="100%" kpitabindex="610"
                maxlength="15"></kpicc:kpitextbox>
        </td>
      
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td style="width: 19.1%">
            <kpicc:kpilabel id="lblComment" runat="server" kpirepositoryid="0"> Comment</kpicc:kpilabel>
        </td>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblHeight" runat="server" Text="Height&nbsp;"></kpicc:kpilabel></td>
        <td>
            <kpicc:kpitextbox id="txtHeight" runat="server" cssclass="ReadOnly" kpisecurity="N" width="78px" kpitabindex="611"
                maxlength="4"></kpicc:kpitextbox>
        </td>

        <td style="text-align: right">
            <kpicc:kpilabel id="lblWeight" runat="server">Weight</kpicc:kpilabel>
            &nbsp;</td>
        <td style="text-align: left">
            <kpicc:kpitextbox id="txtWeight" runat="server" cssclass="ReadOnly" kpisecurity="N" width="100%" kpitabindex="612"
                maxlength="4"></kpicc:kpitextbox>
        </td>
     
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right" style="width: 19.1%">
            <kpicc:kpitextbox id="txtComment" tabindex="561" runat="server" kpisecurity="AC" width="100%" kpitabindex="606"
                textmode="MultiLine" height="32px" maxlength="255"></kpicc:kpitextbox>
        </td>
        <td></td>
        <td align="right">
            <kpicc:kpilabel id="lblReasonLstVisit" runat="server" Text="Reason-Last Medical Visit&nbsp;"></kpicc:kpilabel>
            </td>
        <td colspan="2" style="width: 15.25%">
            <kpicc:kpitextbox id="txtReasonLstVisit" runat="server" cssclass="ReadOnly" kpisecurity="N" width="100%"
                kpitabindex="613" maxlength="255"></kpicc:kpitextbox>
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
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td style="text-align: right; padding: 0; border-spacing: 0">
            <table style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 49%" />
                    <col style="width: 25%" />
                    <col style="width: 1%" />
                    <col style="width: 25%" />
                </colgroup>
                <tr style="padding: 0; border-spacing: 0">
                    <td></td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdAdd" runat="server" kpisecurity="AC" kpitabindex="607" imageurl="/KPIImages/ico/AddData_Text.png" tooltip="Add"></kpicc:kpiimagebutton>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdClear" runat="server" kpisecurity="ACI" kpitabindex="608" imageurl="/KPIImages/ico/ClearData_Text.png"></kpicc:kpiimagebutton>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
        <td align="right"></td>
        <td style="width: 15.25%;" colspan="1">
            <kpicc:kpibutton id="btnNewVisit" runat="server" cssclass="CustomBtn" width="120px" kpitabindex="609" text="Medical Request" kpisecurity="AC"></kpicc:kpibutton>
        </td>
        <td style="text-align: right; padding: 0; border-spacing: 0" colspan="2">
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
                        <kpicc:kpiimagebutton id="cmdAddDoctor" runat="server" kpisecurity="AC" kpitabindex="672" visible="false" imageurl="/KPIImages/ico/AddData_Text.png" tooltip="Add"></kpicc:kpiimagebutton>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdClearDoctor" runat="server" kpisecurity="AC" kpitabindex="671" visible="false" imageurl="/KPIImages/ico/ClearData_Text.png"></kpicc:kpiimagebutton>
                    </td>
                </tr>
            </table>
        </td>
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
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td align="right" style="width: 19.1%;" valign="top">
            <kpicc:kpigrid id="grdFlag" runat="server" KPISecurity="AC" Width="100%" KPIRepositoryID="0" height="118px" KPIDefaultJurisAlias="False" EnableDataViewState="true" AutoGenerateColumns="false" DataKeyFields="CMSRefValuesID" oninitializerow="grdFlag_InitializeRow">
                <ClientEvents Click="grdFlag_CellClickHandler"></ClientEvents>
                 <Columns>
                    <igtbl:UnboundField Key="KPIDRK" Width="10%">
                        <%-- FooterTotal="Avg"--%>
                        <Header Text=" X" />
                    </igtbl:UnboundField>
                    <igtbl:BoundDataField Key="Description" Width="55%" DataFieldName="Description">
                        <Header Text="Flag" />
                    </igtbl:BoundDataField>
                    <igtbl:UnboundField Key="KPIMode" Hidden="True">
                        <Header Text="KPIMode" />
                    </igtbl:UnboundField>
                    <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="CMSRefValuesID">
                        <Header />
                    </igtbl:BoundDataField>
                    <igtbl:UnboundField Key="FLGCMNT" Width="10%">
                        <Header Text="C" />
                    </igtbl:UnboundField>
               
                    <igtbl:BoundDataField Key="Flag" Hidden="True" DataFieldName="Flags">
                        <Header Text="flagcodevalue" />
                    </igtbl:BoundDataField>
                 
                    <igtbl:BoundDataField Key="CreatedDttm" Hidden="True" DataFieldName="CreatedDttm">
                        <Header />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="ModifiedDttm" Hidden="True" DataFieldName="ModifiedDttm"><Header /></igtbl:BoundDataField>
                     <igtbl:BoundDataField Key="Comments" Hidden="True" DataFieldName="Comments"><Header /></igtbl:BoundDataField>
                     <igtbl:BoundDataField Key="CmtsIcon" Hidden="True" DataFieldName="Comments"><Header /></igtbl:BoundDataField>
                    <igtbl:UnboundField Key="Cmts" Hidden="true" HtmlEncode="false"></igtbl:UnboundField>
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
            </kpicc:kpigrid>
        </td>
        <td></td>
        <td valign="top" align="right">
            <kpicc:kpilabel id="lblMedicalVisits" runat="server" cssclass="Customlbl" Text="Medical Visits&nbsp;"></kpicc:kpilabel></td>
        <td colspan="3" style="width: 100%;" valign="top" rowspan="3">
            <kpicc:KPIGrid ID="grdDoctor" runat="server" Width="100%" KPISecurity="AC" KPIRepositoryID="0" Height="180px" EnableDataViewState="true" AutoGenerateColumns="false" DataKeyFields="JMMedVisitID" KPIDefaultJurisAlias="False" OnInitializeRow="grdDoctor_InitializeRow">
                <ClientEvents Click="grdDoctor_DblClickHandler"></ClientEvents>
                <Columns>
                    <igtbl:BoundDataField Key="visitDttm" Width="24%" DataFieldName="visitDttm"  DataFormatString="{0:MM/dd/yy HH:mm}">
                        <Header Text="Date" />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="MedicalNo" Width="18%" DataFieldName="MedicalVisitNo">
                        <Header Text="Medical#" />
                    </igtbl:BoundDataField>
                      
                    <igtbl:BoundDataField Key="Condition" Width="25%" DataFieldName="DiagnosisCondition">
                        <Header Text="Diagnosed&lt;br&gt;Condition" />
                    </igtbl:BoundDataField>
                     <igtbl:BoundDataField Key="Diagnosis" Hidden="true" DataFieldName="Diagnosis"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="DoctorName" Width="33%" DataFieldName="DoctorName">
                        <Header Text="Attending&lt;br&gt; Doctor / Nurse" />
                    </igtbl:BoundDataField>
                    <igtbl:UnboundField Key="KPIMode" Hidden="True">
                        <Header Text="KPIMode" />
                    </igtbl:UnboundField>
                    <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="JMMedVisitID">
                        <Header />
                    </igtbl:BoundDataField>
                     <igtbl:BoundDataField Key="SeqNo" Hidden="True" DataFieldName="SeqNo">
                        <Header />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="JMMedVisitID" Hidden="True" DataFieldName="JMMedVisitID">
                        <Header Text="MedvisitId" />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="JMBookingID" Hidden="True" DataFieldName="JMBookingID"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="IsForm" Hidden="True" DataFieldName="IsForm"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="ReceivedPFID" Hidden="True" DataFieldName="ReceivedPFID"></igtbl:BoundDataField>


                    <igtbl:BoundDataField Key="AttendDoctorID" Hidden="True" DataFieldName="AttendDoctorID"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Location" Hidden="True" DataFieldName="Location"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="BloodPressure" Hidden="True" DataFieldName="BloodPressure"></igtbl:BoundDataField>

                    <igtbl:BoundDataField Key="Pulse" Hidden="True" DataFieldName="Pulse"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Weight" Hidden="True" DataFieldName="Weight"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Height" Hidden="True" DataFieldName="Height"></igtbl:BoundDataField>

                    <igtbl:BoundDataField Key="Hospital" Hidden="True" DataFieldName="Hospital"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="SpecialMeal" Hidden="True" DataFieldName="SpecialMeal"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="IsDental" Hidden="True" DataFieldName="IsDental"></igtbl:BoundDataField>

                    <igtbl:BoundDataField Key="JMMedVitaltID" Hidden="True" DataFieldName="JMMedVitaltID"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="NextVisitDttm" Hidden="True" DataFieldName="NextVisitDttm"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="EventID" Hidden="True" DataFieldName="EventID"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="CreatedPFID" Hidden="True" DataFieldName="CreatedPFID"></igtbl:BoundDataField>

                    <igtbl:BoundDataField Key="ModifiedPFID" Hidden="True" DataFieldName="ModifiedPFID"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="ModifiedDttm" Hidden="True" DataFieldName="ModifiedDttm"></igtbl:BoundDataField>
                    
                    

                    <igtbl:BoundDataField Key="IsTbTest" Hidden="True" DataFieldName="IsTbTest"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Result" Hidden="True" DataFieldName="Result"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="IsSpecialMeal" Hidden="True" DataFieldName="IsSpecialMeal"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="IsFacility" Hidden="True" DataFieldName="IsFacility"></igtbl:BoundDataField>

                    <igtbl:UnboundField Key="KPIJurisAlias" Hidden="True">
                        <Header Text="Juris" />
                    </igtbl:UnboundField>
                    <igtbl:BoundDataField Key="KPIJurisID" Hidden="True" DataFieldName="JurisID">
                        <Header Text="Jurisid" />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="RequestDttm" Hidden="True" DataFieldName="RequestDttm" DataFormatString="{0:MM/dd/yy HH:mm}">
                        <Header Text="dateofrequest" />
                    </igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="BloodPressureMax" Hidden="True" DataFieldName="BloodPressureMax"></igtbl:BoundDataField>
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
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td colspan="2">
            <kpicc:kpilabel id="lblTBTest" runat="server" cssclass="Customlbl" font-bold="True">TB Tested</kpicc:kpilabel>
        </td>
        <td></td>
        <td></td>
        <td valign="top" align="right"></td>
        <td colspan="3"></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td style="width: 19.1%;" align="left">
            <table id="Table4" style="text-align:left;width:100%;padding:0;border-spacing:0;table-layout:fixed">
                <colgroup><col style="width:30%" /><col style="width:70%" /></colgroup>
                <tr>
                    <td style="text-align:right"><kpicc:kpilabel id="lblDate" runat="server" Text="Date&nbsp;" kpirepositoryid="0"></kpicc:kpilabel></td>
                    <td style="text-align:left">
                        <kpicc:kpidatechooser id="dcTBTestDate" tabindex="7" runat="server" kpitabindex="-1" kpisecurity="N"
                            isbigsize="No" readonly="false" kpimandatory="false"></kpicc:kpidatechooser>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right"><kpicc:kpilabel id="lblMedicalNo" runat="server" Text="Medical#&nbsp;" kpirepositoryid="0"></kpicc:kpilabel></td>
                    <td style="text-align:left;padding:0;border-spacing:0">
                         <phnxcc:NumberCtrl ID="NumCrtlMedicalNo" runat="server" KPISecurity="N" KPINumberResultType="Detail" KPIDetailLookUp="false" CounterType="MedicalVisitNo" KPIMode="Search"></phnxcc:NumberCtrl>
                    
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right"><kpicc:kpilabel id="lblResults" runat="server" Text="Results&nbsp;" kpirepositoryid="0"></kpicc:kpilabel></td>
                    <td style="text-align:left">
                        <kpicc:kpicodeddropdownlist id="cddResults" tabindex="5" runat="server" kpitabindex="-1"  kpisecurity="N"
                            kpidisplayoption="Description" kpicodeid="3176" Width="160px" kpimandatory="No">
                            </kpicc:kpicodeddropdownlist>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
        <td valign="top" align="right"></td>
        <td colspan="3"></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td style="width: 19.1%" align="left"></td>
        <td></td>
        <td valign="top" align="right">
            <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
            <input id="hdnMode" type="hidden" name="hdnMode" runat="server" />
            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
            <input id="hdnBookingid" type="hidden" name="hdnBookingid" runat="server" />
        </td>
        <td colspan="3" style="width: 15.25%"></td>
        <td></td>
        <td></td>
    </tr>
</table>