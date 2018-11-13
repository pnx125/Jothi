<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrMedicationHistorySupply.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedicationHistorySupply" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>
<style>


     #tabMain_tmpl2_usrMedicationHistorySupply_chkGenericAllowed,#tabMain_tmpl2_usrMedicationHistorySupply_chkInactive {
            margin: 0px !important;
            vertical-align: bottom !important;
        }

    .NotificationRules {
        background-image: url('/KPIImages/ico/Notification.gif') !important;
        background: url('/KPIImages/ico/Notification.gif') no-repeat;
        background-repeat: no-repeat !important;
    }

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

    .boldness {
        font-weight: bold;
    }
    .disabledFilter {
        border: none;
    }
    .OverFlow {
        overflow-y:auto;
    }


    .CustomBtnRedBold{
        height:20px !important;
    }
    /*.ighg_HGridExpandableArea {
        padding: 0px 0px 0px 0px !important;
    }*/


    .grdGColor {
        color: gray;
    }

    .grdRedColor{
        color:red !important;
    }

</style>
<table style="table-layout: fixed; padding: 0; border-spacing: 0; width: 100%;">
    <colgroup>
        <col style="width: 5%" />
        <%--<col style="width: 2%" />--%>
        <col style="width: 21%" />
        <col style="width: 2%" />
        <col style="width: 21%" />
        <col style="width: 2%" />
        <col style="width: 21%" />
        <col style="width: 2%" />
        <col style="width: 21%" />
        <col style="width: 5%" />

        <%--<col style="width: 5%" />--%>
    </colgroup>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>        
    </tr>

    <tr>
        
        <td>&nbsp;</td>
        <td class="req">
            <kpicc:KPILabel ID="lblDatePrescribed" runat="server">Date Prescribed</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        <td class="req">
            <kpicc:KPILabel ID="lblDoctor" runat="server">Prescribing Doctor</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPILabel ID="lblPrescription" runat="server">Prescription#</kpicc:KPILabel>
        </td>

        <td>&nbsp;</td>
        <td></td>
        <td>&nbsp;</td>
        
    </tr>
    <tr>
        
        <td>&nbsp;</td>
        <td>
            <kpicc:KPIDateTime ID="dttmPrescribedDate" runat="server" Visible="True" KPIMandatory="True" KPITabIndex="599"
                KPITimeDisplay="TimeShort"></kpicc:KPIDateTime>
        </td>
        <td>&nbsp;</td>
        <td style="white-space: nowrap">
            <kpicc:KPICodedLookUp ID="lupPrimaryDoctor" runat="server" KPITabIndex="600" KPICodeID="780" ValueFieldWidth="100%"
                KPIWidth="0" KPIShowDescription="False" KPISecurity="AC" KPIMode="Search"></kpicc:KPICodedLookUp>
        </td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPITextBox ID="txtPrescription" runat="server" KPITabIndex="601" KPISecurity="AC" Width="98%" MaxLength="15"></kpicc:KPITextBox>
        </td>
        <td>&nbsp;</td>
        <td></td>
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
        <td></td>
        <td></td>
        
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="req">
            <kpicc:KPILabel ID="lblDrug" runat="server">Drug</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        <td class="req">
            <kpicc:KPILabel ID="lblDosage" runat="server">Dosage</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPILabel ID="lblDuration" runat="server">Prescribed Duration/Amt.</kpicc:KPILabel></td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPILabel ID="lblRefills" runat="server">Refills</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="white-space: nowrap" class="req">
            <%--  <kpicc:KPICodedLookUp ID="lupDrug" runat="server" KPITabIndex="604" KPICodeID="6007" ValueFieldWidth="68%"
                KPIWidth="0" KPIShowDescription="False" KPISecurity="AC"  KPIMode="Search"></kpicc:KPICodedLookUp>--%>
            <kpicc:KPICodedDropDownList ID="cddDrug" runat="server" KPISecurity="AC" KPITabIndex="604" Width="78%" KPICodeID="6007" KPIMandatory="Yes"></kpicc:KPICodedDropDownList>
        </td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPITextBox ID="txtDosage" runat="server" KPITabIndex="605" KPISecurity="AC" Width="90%" MaxLength="8"></kpicc:KPITextBox>
        </td>
        <td>&nbsp;</td>
        <td>
            <table style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 50%" />
                    <col style="width: 50%" />
                </colgroup>
                <tr>
                    <td>
                        <kpicc:KPITextBox ID="txtPrescribedAmt" runat="server" KPITabIndex="606" KPISecurity="AC" Width="98%" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
                    </td>

                    <td>
                        <kpicc:KPICodedDropDownList ID="cddPrescribedAmtDuration" TabIndex="212" runat="server" KPISecurity="AC" KPITabIndex="607" KPIWidth="0" Width="100%" KPIMandatory="Yes" KPICodeID="3111"></kpicc:KPICodedDropDownList>
                    </td>

                </tr>
            </table>
        </td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPITextBox ID="txtRefills" runat="server" KPITabIndex="608" KPISecurity="AC" Width="98.6%" MaxLength="2" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox>
        </td>
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
        <td></td>
        <td></td>
        
    </tr>

    <tr>
        
        <td>&nbsp;</td>
        <td>
            <kpicc:KPICheckBox ID="chkGenericAllowed" runat="server" KPISecurity="AC" KPITabIndex="609" Text="&nbsp;Generic Allowed" TextAlign="Right" />
        </td>
        <td></td>
        <td>
            <kpicc:KPILabel ID="lblUseEnded" runat="server">Use Ended</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        <td>
            <kpicc:KPILabel ID="lblBalance" runat="server">Balance</kpicc:KPILabel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>       
    </tr>



    <tr>
        <td></td>
        <td></td>
        <td>&nbsp;</td>
        <td>
            <%-- <kpicc:KPIDateTime ID="UseEndeddttm" TabIndex="7" runat="server" KPIMandatory="True" KPITabIndex="609"
                KPISecurity="AC"></kpicc:KPIDateTime>--%>
            <kpicc:KPIDateTime ID="UseEndeddttm" runat="server" Visible="True" KPIMandatory="FALSE" KPITabIndex="610" KPISecurity="AC" OnChangeHandler="fn_validateNotes"
                KPITimeDisplay="TimeShort"></kpicc:KPIDateTime>



        </td>
        <td>&nbsp;</td>
        <td style="padding: 0; border-spacing: 0">
            <table style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 50%" />
                    <col style="width: 50%" />
                </colgroup>
                <tr>
                    <td>
                        <kpicc:KPITextBox ID="txtBalance" runat="server" KPITabIndex="611" KPISecurity="N" Width="100%" MaxLength="3" onkeydown="return AlphabetValidation(this,'1',event)"></kpicc:KPITextBox></td>
                    <td>
                        
                    </td>
                </tr>
            </table>


        </td>
        <td>&nbsp;</td>
        <td><kpicc:KPIButton ID="btnDisposition" runat="server" KPISecurity="AC" Width="100%" KPITabIndex="613" CssClass="CustomBtn" Text="Disposition"></kpicc:KPIButton></td>
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
        <td></td>
        <td></td>    
    </tr>
    <tr>
        <td>&nbsp;</td>


        <td colspan="7">
            <table style="width: 100%; padding: 0; border-spacing: 0; table-layout: fixed">
                <colgroup>
                    <col style="width: 5.5%" />
                    <col style="width: 94.5%" />
                </colgroup>
                <tr>
                    <td id="tdNotes">
                        <kpicc:KPILabel ID="lblNotes" runat="server">Notes&nbsp;</kpicc:KPILabel></td>
                    <td>
                        <kpicc:KPITextBox ID="txtDescription" runat="server" KPITabIndex="614" KPISecurity="AC" Width="100%" MaxLength="400" Height="40px" TextMode="MultiLine"></kpicc:KPITextBox></td>
                </tr>
            </table>
        </td>

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
        <td></td>
        <td></td>       
    </tr>
    <tr>
        <td colspan="2" style="white-space:nowrap;text-align:left">&nbsp; <kpicc:KPICheckBox ID="chkInactive" runat="server" KPISecurity="AC" KPITabIndex="615" Text="&nbsp;Include Inactive?" TextAlign="Right"  AutoPostBack="true"/></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
       
         
        <td>&nbsp;</td>
        <td></td>
        <td style="float: right; padding: 0; border-spacing: 0">
            <table style="width: 100%; padding: 0; border-spacing: 0; float: right">
                <colgroup>
                    <col style="width: 51%" />
                    <col style="width: 24%" />
                    <col style="width: 1%" />
                    <col style="width: 24%" />
                </colgroup>
                <tr style="padding: 0; border-spacing: 0">
                    <td></td>

                    <td style="text-align: right">
                        <kpicc:KPIImageButton ID="cmdAdd" runat="server" KPITabIndex="616" ImageUrl="/KPIImages/ico/AddData_Text.png" KPISecurity="AC"></kpicc:KPIImageButton>
                    </td>
                    <td>&nbsp;</td>
                    <td style="text-align: right">
                        <kpicc:KPIImageButton ID="cmdClear" runat="server" KPITabIndex="617" ImageUrl="/KPIImages/ico/ClearData_Text.png" KPISecurity="AC"></kpicc:KPIImageButton>
                    </td>
                </tr>
            </table>

        </td>

       
        <td>
            <input id="hdnBookingID" type="hidden" name="hdnBookingID" runat="server" />
            <input id="hdnMode" type="hidden" name="hdnMode" runat="server" />
            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
            <input id="hdnPrescribeID" type="hidden" name="hdnPrescribeID" runat="server" />
            <input id="hdnPrescribedAmt" type="hidden" name="hdnPrescribedAmt" runat="server" />
            <input id="hdnUseEndRowID" type="hidden" name="hdnUseEndRowID" runat="server" />
            <input id="hdnNotesMandatory" type="hidden" name="hdnNotesMandatory" runat="server" />


        </td>
    </tr>

    <tr>
        <td colspan="9" style="vertical-align: top; overflow-y: auto">
            <kpicc:KPIHGrid ID="grdPrescription" runat="server" KPISecurity="AC" Width="100%" Height="200px" ShowHeader="true" ShowFooter="true"
                AutoGenerateColumns="false" DataMember="Parent" EnableDataViewState="true" KPIDefaultJurisAlias="False" DataKeyFields="OrderNo" CssClass="OverFlow"
                InitialDataBindDepth="-1" AutoGenerateBands="false" OnInitializeRow="grdPrescription_InitializeRow"  
                KPIRepositoryID="0">
                <ClientEvents Click="grdPrescription_CellClickHandler"></ClientEvents>

                <GroupingSettings EnableColumnGrouping="True" InitialRowExpandState="Collapsed" GroupAreaVisibility="Hidden" GroupedRowCssClass="boldness" GroupedRowTextMask="{1}" GroupByAreaLocation="Top" >

                    <GroupedColumns>
                         <igtbl:GroupedColumn ColumnKey="Drugs" />                        
                    </GroupedColumns>
                 <ColumnSettings>
                     <igtbl:ColumnGroupingSetting ColumnKey="PrescribedDttm" DefaultSortDirection="Descending" Groupable="false" MergeCells="false" />
                     
                 </ColumnSettings>
                </GroupingSettings>
                <Columns>
                    <igtbl:BoundDataField Key="CreatedDttm" Hidden="true"  DataFieldName="CreatedDttm"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Rowno"  Hidden="true" DataFieldName="Rowno" ></igtbl:BoundDataField>
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
                    <igtbl:Band DataMember="Child" AutoGenerateColumns="false" ShowFooter="false" ShowHeader="true" >                     
                        <%--DataKeyFields="JMPreOrderHistID"--%>
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
                    <igtbl:Sorting Enabled="false"></igtbl:Sorting>
                    <igtbl:EditingCore AutoCRUD="False" Enabled="true" BatchUpdating="true">
                        <Behaviors>
                            <igtbl:CellEditing Enabled="false"></igtbl:CellEditing>
                        </Behaviors>
                    </igtbl:EditingCore>


                </Behaviors>



            </kpicc:KPIHGrid>
        </td>
    </tr>



</table>

