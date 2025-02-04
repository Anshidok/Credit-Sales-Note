<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kizwa.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KIZWA TIRUR</title>
    <link href="../Style/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> 
    <link href="../Style/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../Style/Style.css" rel="Stylesheet"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        form {
            border: 3px solid #f1f1f1;
        }
        .cont
        {
            width: 30em;
        }
    </style>

</head>
<body>
<div class="header ">
    <div class="heading ">
        <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/kizwa.png" ImageAlign="Middle"/>
        </div>
        <div>
        <%--  <h1>Kizwa Bridal Boutique</h1>--%>
        </div>
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
    <form id="form1" runat="server" class="frmalg">
        <div class="container cont" >       
            <div class="logindiv">
                <div class="" id="divMessage" runat="server" visible="false" >
                        <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label>
                </div>
                    <label for="psw"><b>Password</b></label>
                    <asp:TextBox runat="server" ID="txt_password" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                    <asp:Button runat="server" ID="btn_Login" CssClass="lgnbtn" Text="Login" 
                        onclick="btn_Login_Click" />
                    <asp:Button runat="server" ID="btn_cancel" Text="Cancel" class="cnbtn" />
            </div>
        </div>
    </form>
</body>
</html>