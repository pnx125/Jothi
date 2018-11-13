<%@ Page Language="c#" CodeFile="frmScheduledAppts.aspx.cs" AutoEventWireup="True" Inherits="KPI.PhoenixWeb.Inmate.frmScheduledAppts" %>

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
    <script src="../KPIFrameworkWeb/Scripts/Date.js?v=2018.07.26" type="text/javascript"></script>
    <style>
         .GrayColor {
            color: gray;
        }

        .GreenColor {
            color: green;
        }

        .BrownColor {
            color: Brown;
        }

        .RoyalBlueColor {
            color: RoyalBlue;
        }

        .BldRedColor {
            color: Red;
            font-weight: bold;
        }

        .RedColor {
            color: Red;
        }

        .BlueColor {
            color: Blue;
        }

        .BoldBlueColor {
            color: Blue;
            font-weight: bold;
        }

       .CustomRule1 {
           background:url("/KPIImages/ico/text_icon.gif") no-repeat !important ;
        }

       #chkShowDel {
            margin: 0px !important;
            vertical-align: bottom !important;
        }  
    </style>
</head>
<body class="masterfrm">
    <form id="frmScheduledAppts_Id" method="post" runat="server">
        <asp:ScriptManager ID="PnxScriptMgr" runat="server"></asp:ScriptManager>
        <table style="width:100%">
            <colgroup><col style="width:1%" /><col style="width:98%" /><col style="width:1%" /></colgroup>
            <tr><td>&nbsp;</td></tr>
          <tr>
              <td>&nbsp;</td>
              <td style="text-align: left"><kpicc:KPILabel ID="lblCurrebtlySchEvents" runat="server" Font-Bold="True">Currently Scheduled Events</kpicc:KPILabel></td>
              <td>&nbsp;</td>
          </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="vertical-align: top">

                        <table id="Table7" style="border-spacing: 0; padding: 0; width: 100%;">
                            <colgroup><col style="width:20%" /><col style="width:20%" /><col style="width:20%" /><col style="width:20%" /><col style="width:20%" /></colgroup>
                            <tr>
                                <td style="text-align: right;"><kpicc:KPILabel ID="lblStartdate" runat="server" KPIRepositoryID="0" KPISecurity="A"> Start</kpicc:KPILabel>&nbsp;</td>
                                <td><kpicc:KPIDateTime ID="dttmSchEvtFrom" runat="server" KPISecurity="AC" KPITabIndex="800" KPITimeDisplay="TimeShort"  OnChangeHandler="reloadScheventsCurScreen"
                                        KPIMandatory="True" Width="100%" ></kpicc:KPIDateTime></td>
                                <td style="text-align: right;"><kpicc:KPILabel ID="lblEndDate" runat="server" KPISecurity="AC">End</kpicc:KPILabel>&nbsp;</td>
                                <td><kpicc:KPIDateTime ID="dttmSchEvtTo" runat="server" KPISecurity="AC" KPITabIndex="801" KPITimeDisplay="TimeShort"  OnChangeHandler="reloadScheventsCurScreen"
                                        KPIMandatory="True" Width="100%" ></kpicc:KPIDateTime></td>
                                <td style="text-align: right"><kpicc:KPICheckBox ID="chkShowDel" runat="server" KPISecurity="AC" KPITabIndex="802" OnCheckedChanged="chkShowDel_CheckedChanged"
                                        Text="&nbsp;Include Cancelled/Inactive" AutoPostBack="True"></kpicc:KPICheckBox></td>
                            </tr>
                           
                            
                            <tr>
                                <td style="vertical-align: bottom" colspan="5">
                                    <kpicc:KPIGrid ID="grdScheEvent" TabIndex="18" runat="server" Width="100%" KPISecurity="AC" AutoGenerateColumns="false"
                                        Height="316px" KPIDefaultJurisAlias="False" KPIRepositoryID="0" OnInitializeRow="grdScheEvent_InitializeRow" DataKeyFields="KPIEvtSchID" EnableDataViewState="true">
                                        <ClientEvents Click="grdScheEvent_DblClickHandler"></ClientEvents>
                                        <Columns>
                                            <igtbl:BoundDataField Key="StartDttm" Width="15%" DataFieldName="StartDttm" DataFormatString="{0:MM/dd/yy HH:mm}">
                                                <Header Text="Date/Time" />
                                            </igtbl:BoundDataField>

                                            <igtbl:BoundDataField Key="EventTypeDesc" DataFieldName="EventTypeDesc" Width="15%" >
                                                <Header Text="Event Type " />
                                            </igtbl:BoundDataField>

                                              <igtbl:BoundDataField Key="SubTypeDesc"  DataFieldName="SubTypeDesc" Width="25%" >
                                                <Header Text="Sub Type" />
                                            </igtbl:BoundDataField>

                                            <igtbl:BoundDataField Key="EventNo" DataFieldName="EventNo" Width="15%">
                                                <Header Text="Event# " />
                                            </igtbl:BoundDataField>

                                            <igtbl:BoundDataField Key="LocationDesc"  DataFieldName="LocationDesc" Width="30%">
                                                <Header Text="Location" />
                                            </igtbl:BoundDataField>

                                            <igtbl:BoundDataField DataFieldName="SignIn" Hidden="true" Header-Text="Sign" Key="SignIn">
                                            </igtbl:BoundDataField>
                                        
                                            <igtbl:BoundDataField Key="EndDttm" Hidden="true" DataFieldName="EndDttm" DataFormatString="{0:MM/dd/yyyy HH:mm}">
                                                <Header Text="End Time" />
                                            </igtbl:BoundDataField>

                                            


                                            <igtbl:BoundDataField Key="EventSubType" Hidden="true" DataFieldName="EventSubType">
                                              
                                            </igtbl:BoundDataField>

                                            <igtbl:BoundDataField Key="END" Hidden="true" DataFieldName="EndDttm" DataFormatString="{0:HH:mm}">
                                                <Header Text="End Time" />
                                            </igtbl:BoundDataField>



                                            


                                            <igtbl:BoundDataField Key="KPIID" Hidden="True" DataFieldName="KPIEvtSchID">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:UnboundField Key="KPIMode" Hidden="True">
                                                <Header />
                                            </igtbl:UnboundField>
                                            <igtbl:BoundDataField Key="EventTypeCode" Hidden="True" DataFieldName="EventType">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="SubType" Hidden="True" DataFieldName="SubType">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="CostAmt" Hidden="True" DataFieldName="CostAmt">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="PaidAmt" Hidden="True" DataFieldName="PaidAmt">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="IsActive" Hidden="True" DataFieldName="IsActive">
                                                <Header Text="IsActive" />
                                            </igtbl:BoundDataField>
                                            
                                            <igtbl:BoundDataField DataFieldName="TotalSnoozeTm" Hidden="True" Key="TotalSnoozeTm">
                                            </igtbl:BoundDataField>
                                       
                                            <igtbl:UnboundField Hidden="True" Key="JHSignID">
                                            </igtbl:UnboundField>
                                            <igtbl:BoundDataField DataFieldName="IsDismissed" Hidden="True" Key="IsDismissed">
                                            </igtbl:BoundDataField>
                                            <igtbl:UnboundField Hidden="True" Key="Comment">
                                            </igtbl:UnboundField>
                                            <igtbl:UnboundField Hidden="True" Key="DelComment">
                                            </igtbl:UnboundField>
                                            <igtbl:UnboundField Hidden="True" Key="AlrtComment">
                                            </igtbl:UnboundField>
                                            <igtbl:UnboundField Hidden="True" Key="SignOutDttm">
                                            </igtbl:UnboundField>
                                            <igtbl:BoundDataField Hidden="True" Key="SignInDttm" DataFieldName="SignInDttm">
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Hidden="True" Key="SignDone" DataFieldName="SignDone">
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="EventID" Hidden="True" DataFieldName="EventID">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="ShowCmts" Width="0%" Hidden="True" DataFieldName="ShowCmts">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="GrpEventNo" Width="0%" Hidden="True" DataFieldName="GrpEventNo">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="GrpMvmtID" Width="0%" Hidden="True" DataFieldName="GrpMvmtID">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField Key="EndDate" Width="0%" Hidden="True" DataFieldName="EndDttm">
                                                <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField key="JurisSubAgencyID" hidden="True" datafieldname="JurisSubAgencyID">
                                               <Header />
                                            </igtbl:BoundDataField>
                                            <igtbl:BoundDataField key="OwnerSubAgencyID" hidden="True" datafieldname="OwnerSubAgencyID">
                                               <Header />
                                            </igtbl:BoundDataField>
                                          
                                        </Columns>
                                        <Behaviors>
                                            <igtbl:Activation Enabled="true"></igtbl:Activation>
                                            <igtbl:Selection RowSelectType="Single" Enabled="true" CellClickAction="Row" />
                                            <igtbl:RowSelectors RowNumbering="false" Enabled="false" />
                                        </Behaviors>
                                    </kpicc:KPIGrid>
                                </td>
                            </tr>
                     
                            <tr>
                                <td>
                                    <input id="hdnScreenId" type="hidden" value="8532" name="hdnScreenId" runat="server" />
                                    <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
                                    <input id="hdnNameID" type="hidden" name="hdnNameID" runat="server" />
                                    <input id="hdnBookingID" type="hidden" name="hdnBookingID" runat="server" />
                                    <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
                                    <input id="hdnJMMedicalHistID" type="hidden" name="hdnJMMedicalHistID" runat="server" />
                                    <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />
                                </td>
                                <td colspan="4"></td>
                            </tr>
                        </table>

                    </td>
                <td>&nbsp;</td>
            </tr>
        </table>



        <script src="frmScheduledAppts.js?v=2018.07.26" type="text/javascript"></script>
    </form>
</body>
</html>