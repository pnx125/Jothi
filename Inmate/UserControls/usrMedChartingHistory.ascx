<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usrMedChartingHistory.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedChartingHistory" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<script type="text/javascript">
   $(document).ready(function () {
       $(".accordion").accordion({
            collapsible: true,
            active: true,
            heightStyle: "content",
            autoHeight: false,
            clearStyle: true,
            multiple:false
        });        
    });
    
    // extend jquery ui accordion to allow multiple
    // sections at once if the multiple option is true

    //$(document).ready(function () {
    //    // forces lose focus when accordion section closed. IE and FF.
    //    $(".ui-accordion-header").click(function () {
    //        //$(this).blur();
    //        //$('.ui-accordion').hide();
    //        //$('.accordion').hide();
    //        $('div[id^="div-"]').hide();
    //    });

    //})

</script>
<%--<style>
    .ui-accordion .ui-accordion-expand-holder {
    margin:10px 0;
}
.ui-accordion .ui-accordion-expand-holder .open, .ui-accordion .ui-accordion-expand-holder .close {
    margin:0 10px 0 0;
}
</style>--%>



<table style="width:100%;text-align:center;vertical-align:top">
    <colgroup><col style="width:100%" /></colgroup>
    <tr>
        
        <td style="text-align:left;width:100%;padding:0;border-spacing:0">
            <div id="divMyRemainder" style="overflow-y: auto; max-height: 470px;">
    <asp:DataList ID="grdComments" runat="server" Width="100%" style="table-layout:fixed">
        <ItemTemplate>

            <div  id="<%# DataBinder.Eval(Container.DataItem, "CMSCommentsID")%>"  data-parent=".accordion-toggle" data-toggle="collapse" class="accordion" style="width: 100%;">
                <h3><%# DataBinder.Eval(Container.DataItem, "CommentDttm")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "PFID") %></h3>
                <div>


                    <div style="vertical-align: top; width: 100%;word-wrap:break-word;overflow-x:auto">
                        <%# DataBinder.Eval(Container.DataItem, "Comments") %>
                    </div>
                </div>
        </ItemTemplate>
    </asp:DataList>

</div>


        </td>
        
    </tr>
</table>