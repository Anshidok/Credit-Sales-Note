<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rdlc.aspx.cs" Inherits="Kizwa.Pages.Rdlc" %>

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
    <div style="justify-content:center;display: flex;" class="">
            <a href="index.aspx">Home</a>
            <a href="Return.aspx">Returns</a>
            <a href="Report.aspx">Reports</a>
            <a href="Login.aspx">Edit</a>
            <a href="#contact">Contact</a>
            </div>
    </div>
 </div>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager></div>
    <div class="divrpt">
        <rsweb:ReportViewer  ID="rptViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="100%" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" SizeToReportContent="True" 
       ShowPrintButton="True">
    </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
