<%@ Control Language="c#" AutoEventWireup="True" CodeFile="usrDental.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrDental" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="KPI.Phoenix.WebControls" Assembly="KPI.Phoenix.WebControls" %>
<%@ Register Assembly="Infragistics45.Web.v14.1, Version=14.1.20141.2011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="igtbl" %>

<table style="text-align: left; border-spacing: 0; padding: 0; width: 100%;">
    <colgroup>
        <col style="width: 5%" />
        <col style="width: 20%" />
        <col style="width: 5%" />
        <col style="width: 15%" />
        <col style="width: 19%" />
        <col style="width: 16%" />
        <col style="width: 12%" />
        <col style="width: 5%" />
    </colgroup>
    <tr>
        <td>&nbsp;</td>
        <td></td>
        <td>
            <input id="hdnMode" type="hidden" name="hdnMode" runat="server" />
            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
            <input id="hdnBookingid" type="hidden" name="hdnBookingid" runat="server" />
            <input id="hdnEventID" type="hidden" name="hdnEventID" runat="server" />
               
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>&nbsp;</td>
    </tr>



    <tr>
        <td></td>
        <td style="text-align: left; padding: 0; border-spacing: 0">


            <table id="Table21" style="width: 100%;">
                <colgroup>
                    <col style="width: 100%" />
                </colgroup>
                <tr>
                    <td style="text-align: left; padding: 0; border-spacing: 0; white-space: nowrap">
                        <kpicc:KPILabel ID="lblPrimaryDoctor" runat="server" Text="Primary Dentist"></kpicc:KPILabel></td>
                </tr>
                <tr>
                    <td style="white-space: nowrap; text-align: left; padding: 0; border-spacing: 0">

                        <kpicc:KPICodedLookUp ID="lupPrimaryDentist"  runat="server" KPITabIndex="600" KPICodeID="785" ValueFieldWidth="100%" 
                            KPIWidth="0" KPIShowDescription="true" KPISecurity="AC" KPIClientCallBack="fn_DentistInfo" KPIMode="Search"></kpicc:KPICodedLookUp>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
        <td></td>
        <td colspan="3" style="width: 100%; padding: 0; border-spacing: 0">
            <table id="Table3" style="width: 100%" border="0">
                <colgroup>
                    <col style="width: 40%" />
                    <col style="width: 60%" />
                </colgroup>
                <tr>

                    <td style="text-align: left; padding: 0; border-spacing: 0">
                        <kpicc:KPILabel ID="lblOfficeLocation" runat="server" CssClass="Customlbl" Text="Office Location"></kpicc:KPILabel>
                    </td>
                    <td>
                        <kpicc:KPILabel ID="lblPhone" runat="server" CssClass="Customlbl" Text="Phone Number"></kpicc:KPILabel>
                    </td>
                </tr>
                <tr>

                    <td style="text-align: left; padding: 0; border-spacing: 0">
                        <kpicc:KPITextBox ID="txtOfficeLocation" runat="server" CssClass="ReadOnly" KPISecurity="N" Width="100%" KPITabIndex="-1"></kpicc:KPITextBox>
                    </td>
                    <td>
                        <kpicc:KPICustomPhone ID="cusHeaderPhone" runat="server" KPITabIndex="-1" KPISecurity="N" Width="100%" KPIWidth="0" CssClass="PhoneInactive" TabIndex="-1"></kpicc:KPICustomPhone>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>


    <tr>
        <td></td>
        <td>
            <table style="width:100%;padding:0;border-spacing:0">
                <colgroup><col style="width:40%" /><col style="width:60%" /></colgroup>
                <tr>
                    <td style="text-align:left"><kpicc:KPIButton id="btnNewVisit" runat="server" cssclass="CustomBtn" kpitabindex="610" width="100%" Text="New Visit" KPISecurity="AC"></kpicc:KPIButton></td>
                    <td style="text-align:right;padding:0;border-spacing:0"><kpicc:kpilabel id="lblLstDentalVisit" runat="server" cssclass="Customlbl" Text="Last Dental Visit&nbsp;"></kpicc:kpilabel></td>
                </tr>
            </table>
            
            </td>
        <td><kpicc:kpidatechooser id="dttmDentlvisit"  runat="server" cssclass="ReadOnly" kpitabindex="611" kpisecurity="I"></kpicc:kpidatechooser></td>
        <td></td>

        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td>
            <table style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 40%" />
                    <col style="width: 60%" />
                </colgroup>
                <tr>
                    <td style="text-align:left"><kpicc:kpilabel id="lblNewVisit" runat="server" cssclass="Customlbl" Text="Next Visit&nbsp;"></kpicc:kpilabel></td>
                    <td style="text-align:right;padding:0;border-spacing:0"><kpicc:kpibutton id="btnSchedule" runat="server" cssclass="CustomBtn" kpitabindex="615" width="100%" Text="Schedule"></kpicc:kpibutton></td>
                </tr>
            </table>

        </td>
        <td><kpicc:KPIDateTime id="dttmNewVisit" runat="server" KPITabIndex="616" KPISecurity="N" KPIMandatory="false" width="216px" KPIWidth="130"></kpicc:KPIDateTime>

        </td>
        <td></td>

        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td></td>
        <td colspan="4"><kpicc:kpilabel id="lblDentalVisits" runat="server" cssclass="Customlbl">Dental Visits</kpicc:kpilabel></td>
        
        
         <td colspan="2" style="text-align: left; padding: 0; border-spacing: 0">
          <%--  <table style="width: 100%; padding: 0; border-spacing: 0">
                <colgroup>
                    <col style="width: 59%" />
                    <col style="width: 20%" />
                    <col style="width: 1%" />
                    <col style="width: 20%" />
                </colgroup>
                <tr style="padding: 0; border-spacing: 0">
                    <td></td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdAddDental" runat="server" kpitabindex="758" kpisecurity="AC" tooltip="Add" imageurl="/KPIImages/ico/AddData_Text.png"></kpicc:kpiimagebutton>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <kpicc:kpiimagebutton id="cmdClearDental" runat="server" kpitabindex="759" kpisecurity="AC" imageurl="/KPIImages/ico/ClearData_Text.png"></kpicc:kpiimagebutton>
                    </td>
                </tr>
            </table>--%>
        </td>
        <td></td>
    </tr>

    
    <tr>
        <td></td>
     <td colspan="6" style="width:100%">
          <kpicc:kpigrid id="grdDental" runat="server" kpisecurity="AC" width="100%" height="240px" kpirepositoryid="0" EnableDataViewState="true" 
              AutoGenerateColumns="false" DataKeyFields="SeqNo" KPIDefaultJurisAlias="False" OnInitializeRow="grdDental_InitializeRow">
                <ClientEvents Click="grdDental_CellClickHandler"></ClientEvents>
                <Columns>
                    <igtbl:BoundDataField Key="date" Width="15%" DataFieldName="DentalReqDttm" DataFormatString="{0:MM/dd/yyyy HH:mm}"><Header Text="Date/Time" /></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="DentalVisitNo" Width="10%" DataFieldName="DentalVisitNo"><Header Text="Dental#" /></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Dentist" Width="10%" DataFieldName="DoctorName"><Header Text="Dentist" /></igtbl:BoundDataField>
                    <igtbl:UnboundField Key="KPIMode" Hidden="True"><Header Text="KPIMode" /></igtbl:UnboundField>
                    <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="SeqNo"><Header /></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Location" Hidden="True" DataFieldName="Location"><Header /></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="DoctorID" Hidden="True" DataFieldName="DoctorID"><Header /></igtbl:BoundDataField>


                    <igtbl:BoundDataField Key="JMDentistVisitID" Hidden="True" DataFieldName="JMDentistVisitID"><Header /></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="JMBookingID" Hidden="True" DataFieldName="JMBookingID"><Header /></igtbl:BoundDataField>
                    

                    <igtbl:BoundDataField Key="Procedure" Header-Text="Procedure" DataFieldName="Procedures" Width="20%"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Diseases" Header-Text="Diseases" DataFieldName="Disease" Width="20%"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Medications" Header-Text="Medications" DataFieldName="Medications" Width="20%"></igtbl:BoundDataField>
                    <igtbl:BoundDataField Key="Cmts" DataFormatString="Cmts" Hidden="true"></igtbl:BoundDataField>
                    <igtbl:UnboundField Key="Notes" Header-Text="C" Width="5%"></igtbl:UnboundField>
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
    </tr>



    
   
</table>