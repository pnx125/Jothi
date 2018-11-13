<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usrMedCharting.ascx.cs" Inherits="KPI.PhoenixWeb.Inmate.UserControls.usrMedCharting" %>

<%@ Register TagPrefix="kpicc" Namespace="KPI.Global.KPIWebControls" Assembly="KPI.Global.KPIWebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table id="Table1" style="text-align:center !important;width:100%" border="0">
    <colgroup>
        <col style="width:10%" />
        <col style="width:10%" />
        <col style="width:20%" />
        <col style="width:50%" />
        <col style="width:10%" />
    </colgroup>

    <tr style="height: 1px">
        <td>
        </td>
        <td>
            <kpicc:KPICodedLookUp ID="lupBy" runat="server" KPITabIndex="500" KPIWidth="100"
                KPICodeID="110" Visible="False"></kpicc:KPICodedLookUp>
        </td>
        <td>
            <kpicc:KPIDateTime ID="dttmDate" runat="server" Visible="False" KPIMandatory="True" 
                KPITimeDisplay="TimeShort"></kpicc:KPIDateTime>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    
    <tr>
        <td colspan="5" style="text-align:center !important">
            
        <kpicc:KPIRadEditor runat="server" ID="KPIRadHuberActivityDetails" SkinID="DefaultSetOfTools" ToolsFile="~\KPIFrameworkWeb\Telerik\BasicTools.xml"
                    SpellCheckSettings-DictionaryPath="~/KPIFrameworkWeb/Telerik/App_Data/RadSpell" EnableEmbeddedSkins="true" AutoResizeHeight="false"
                    Width="100%" CssClass="BackColor" EnableResize="False" EnableTheming="True" Height="460px" OnClientLoad="OnClientLoadCMS" >                      
                        <CssFiles> 
                         <telerik:EditorCssFile Value="~/KPIFrameworkWeb/Home/EditorCss/RadEditorOverrides.css" /> 
                        </CssFiles>
                        <SpellCheckSettings  DictionaryPath="~/KPIFrameworkWeb/Telerik/App_Data/RadSpell"> </SpellCheckSettings>                        
                        <Snippets>
                        <telerik:EditorSnippet Name="Editor Snippet" Value="1"></telerik:EditorSnippet>                        
                        </Snippets>
                        <Content>                        
                        </Content>
                        <Tools>
                        <telerik:EditorToolGroup Tag="A">
                        <telerik:EditorTool Name="LinkManager" ShortCut="CTRL+K" />
                        </telerik:EditorToolGroup>
                        </Tools>
                   </kpicc:KPIRadEditor>
         
        </td>
    </tr>
 
    
    <tr>
        <td></td>
        <td colspan="4">
            <input id="hdnMode" type="hidden" value="ADD" name="hdnMode" runat="server" />
            <input id="hdnJurisId" type="hidden" name="hdnJurisId" runat="server" />
            <input id="hdnJMChartID" type="hidden" name="hdnJMChartID" runat="server" />
            <input id="hdnPFNbr" type="hidden" name="hdnPFNbr" runat="server" />
            <input id="hdnHistory" type="hidden" name="hdnHistory" runat="server" />
            <input id="hdnAutoLoad" type="hidden" name="hdnAutoLoad" runat="server" />
        </td>
    </tr>
</table>