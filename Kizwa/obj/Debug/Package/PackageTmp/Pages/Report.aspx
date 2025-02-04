<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Kizwa.Pages.Report" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KIZWA TIRUR</title>
    <link href="../Style/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> 
    <link href="../Style/bootstrap/css/bootstrap.css" rel="stylesheet" /> 
    <link href="../Style/Style.css" rel="stylesheet"/>
</head>
<body>
<div class="header ">
    <div class="heading ">
<%--     <h1>Kizwa Bridal Boutique</h1>--%>
    </div>
    <div class ="hdback ">
    <div style="justify-content: center;display: flex;" class="">
            <a href="index.aspx">Home</a>
            <a href="Return.aspx">Returns</a>
            <a href="Report.aspx">Reports</a>
            <a href="Login.aspx">Edit</a>
            <a href="#contact">Contact</a>
            </div>
    </div>
 </div>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtFromDate">
        </asp:CalendarExtender>
        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="txtToDate">
        </asp:CalendarExtender>



    <div class="divcenter form-row">
    <div class="" id="divMessage" runat="server" visible="false" >
                <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label>
            </div>
        <div class="col-md-2 my-auto">From Date</div>
        <div class="col-md-4"><asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control textbox" ></asp:TextBox></div>
        <div class="col-md-2 my-auto">To Date</div>
        <div class="col-md-4"><asp:TextBox ID="txtToDate" runat="server" CssClass="form-control textbox" ></asp:TextBox></div>
        <br /><br />
        <div class="col-md-2 my-auto">Status</div>
        <div class="col-md-4">
            <asp:DropDownList CssClass="form-control" ID="cmbStatus" runat="server">
            <asp:listitem Value="" Text="<SELECT>"></asp:listitem>
            <asp:listitem Value="Y">Cliamed</asp:listitem>
            <asp:listitem Value="N">Not Cliamed</asp:listitem>
            <asp:listitem Value="All">All</asp:listitem>
            </asp:DropDownList>
        </div>
        <div class="col-md-5"></div>
        
        <div class="col-md-2"></div>
        <div style="margin-top: 2em;margin-left: 9px;" >
        <asp:CheckBox ID="cbxOutStand"  AutoPostBack="true"
                runat="server" oncheckedchanged="cbxOutStand_CheckedChanged" />  Out Standing Report </div>
    </div>
    <br />
    <div style="display: flex;align-items: center;justify-content: center;">
        <div><asp:Button class="Btn btn btn-primary" ID="show" runat="server" Text="Show" onclick="show_Click" /></div>
        <div style="margin-left: 6px;"><asp:Button class="Btn btn btn-primary" ID="clear" runat="server" Text="Clear" onclick="clear_Click" /></div>

    </div>
    </form>
</body>
</html>
