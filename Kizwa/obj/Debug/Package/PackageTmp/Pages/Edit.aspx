<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Kizwa.Pages.Edit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KIZWA TIRUR</title>
    <link href="../Style/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> 
    <link href="../Style/bootstrap/css/bootstrap.css" rel="stylesheet" /> 
    <link href="../Style/Style.css" rel="stylesheet"/>
</head>
<body>
<div class="header">
    <div class="heading">
<%--     <h1>Kizwa Bridal Boutique</h1>--%>
    </div>
    <div class ="hdback ">
    <div style="justify-content: center;display:flex;">
            <a href="index.aspx">Home</a>
            <a href="Return.aspx">Returns</a>
            <a href="Report.aspx">Reports</a>
            <a href="Edit.aspx">Edit</a>
            <a href="#contact">Contact</a>
            </div>
    </div>
 </div>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate">
        </asp:CalendarExtender>
        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="txtCliamDate">
        </asp:CalendarExtender>
        <div class="container">
    <div style="margin-top: 7em;">
                <asp:Label ID="txthidden" runat="server" Visible="false"></asp:Label>
                <div class="" id="divMessage" runat="server" visible="false" >
                    <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label>
                </div>
        <div class="form-row">
            <div class="col-md-6">
                  <div class="form-row" > 
                <div class="col-md-3 my-auto">
                    Invoice No<span style="color:red">*</span>
                </div>
                 <div class="col-md-9">
                <asp:TextBox ID="txtInvoice" runat="server" CssClass="form-control textbox" AutoPostBack="true"
                    ontextchanged="txtInvoice_TextChanged"></asp:TextBox>
                </div><br/><br/>
                <div class="col-md-3 my-auto">
                    Date<span style="color:red">*</span>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control textbox" ></asp:TextBox>
                </div><br/><br />
                <div class="col-md-3 my-auto">
                    Name
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control textbox"></asp:TextBox>
                </div><br/> <br />
                <div class="col-md-3 my-auto">
                    Phone
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control textbox" MaxLength="10"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                         Enabled="True" TargetControlID="txtPhone" ValidChars="1234567890">
                    </asp:FilteredTextBoxExtender>
                </div><br/><br />
                <div class="col-md-3 my-auto">
                    Amount<span style="color:red">*</span>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control textbox"  AutoPostBack="true"
                        ontextchanged="txtAmount_TextChanged"></asp:TextBox>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                         Enabled="True" TargetControlID="txtAmount" ValidChars="1234567890">
                    </asp:FilteredTextBoxExtender>
                </div><br /><br />
            </div>
            </div>
            <div class="col-md-6">
                  <div class=" form-row " >
                    <div  id="div1" runat="server" visible="false" >
                        <asp:Label ID="label1" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3 my-auto">
                        Claim Date<span style="color:red">*</span>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtCliamDate" runat="server" CssClass="form-control textbox" ></asp:TextBox>
                    </div><br/><br />
                    <div class="col-md-3 my-auto">
                        New Product Amount<span style="color:red">*</span>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtNewAmount" runat="server" CssClass="form-control textbox" AutoPostBack="true"
                            ontextchanged="txtNewAmount_TextChanged" ></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                         Enabled="True" TargetControlID="txtNewAmount" ValidChars="1234567890">
                    </asp:FilteredTextBoxExtender>
                    </div><br/><br />
                    <div class="col-md-3 my-auto">
                        Balance Amount<span style="color:red">*</span>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtBalanceAmount" runat="server" CssClass="form-control textbox"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                         Enabled="True" TargetControlID="txtBalanceAmount" ValidChars="1234567890-">
                    </asp:FilteredTextBoxExtender>
                    </div><br /><br />
                </div>
            </div>
        </div>
    </div>
    </div>
        <div style="display: flex;align-items: center;justify-content: center;">
        <div><asp:Button class="Btn btn btn-primary" ID="save" runat="server" Text="Save" onclick="save_Click" /></div>
        <div style="margin-left: 6px;"><asp:Button class="Btn btn-primary" ID="clear" runat="server" Text="Clear" onclick="clear_Click" /></div>
        <div style="margin-left: 6px;"><asp:Button class="Btn btn-primary" ID="close" 
                runat="server" Text="Close" onclick="close_Click" /></div>
        </div>
    </form>
</body>
</html>
