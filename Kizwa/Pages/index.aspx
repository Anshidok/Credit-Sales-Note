<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Kizwa.Pages.index" %>
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

<div>
    <form id="form1" runat="server" class="" >
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate">
        </asp:CalendarExtender>

        <div class="divcenter form-row " >
            <div class="" id="divMessage" runat="server" visible="false" >
                <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label>
            </div>
        <div class="col-md-3 col-xs-3 my-auto ">
            Date<span style="color:red">*</span>
        </div>
        <div class="col-md-9 col-sx-9 ">
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control textbox" ></asp:TextBox>
  <%--          <asp:TextBox ID="txtDate" runat="server" TextMode="DateTime" ></asp:TextBox>--%>
        </div><%--
        <div class="col-md-3">
        </div>--%>
        <br/>
        <br />
        <div class="col-md-3  my-auto">
            Invoice No<span style="color:red">*</span>
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtInvoice" runat="server" CssClass="form-control textbox"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtMinDayRenew_FilteredTextBoxExtender1" runat="server"
                   Enabled="True" TargetControlID="txtInvoice" ValidChars="1234567890">
            </asp:FilteredTextBoxExtender>
        </div>
        <br/>
        <br/>
        <div class="col-md-3  my-auto">
            Name
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control textbox"></asp:TextBox>
        </div><%--
        <div class="col-md-3">
        </div>--%>
        <br/>
        <br />
        <div class="col-md-3  my-auto">
            Phone
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control textbox"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                Enabled="True" TargetControlID="txtPhone" ValidChars="1234567890">
            </asp:FilteredTextBoxExtender>
        </div><%--
        <div class="col-md-3">
        </div>--%>
        <br/>
        <br />
        <div class="col-md-3  my-auto">
            Amount<span style="color:red">*</span>
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control textbox"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                Enabled="True" TargetControlID="txtAmount" ValidChars="1234567890">
            </asp:FilteredTextBoxExtender>
        </div><%--
        <div class="col-md-3">
        </div>--%>
        <br />
        <br />
        <div style="margin:auto;" >
        <asp:Button class="Btn btn btn-primary" ID="save" runat="server" Text="Save" onclick="save_Click" />
        <asp:Button class="Btn btn-primary" ID="clear" runat="server" Text="Clear" 
                onclick="clear_Click" />
        <asp:Button class="Btn btn-primary" ID="close" runat="server" Text="Close" />
        </div>
    </div>
    </form>
   </div>
  <!-- Footer -->
  <div>
  <footer
          class="text-center text-lg-start text-white"
          style="background-color: #1c2331"
          >
    <!-- Section: Social media -->
    <section
             class="d-flex justify-content-between p-4"
             style="background-color: #6351ce"
             >
      <!-- Left -->
      <div class="me-5">
        <span>Get connected with us on social networks:</span>
      </div>
      <!-- Left -->

      <!-- Right -->
      <div>
        <a href="" class="text-white me-4">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="" class="text-white me-4">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="" class="text-white me-4">
          <i class="fab fa-google"></i>
        </a>
        <a href="" class="text-white me-4">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="" class="text-white me-4">
          <i class="fab fa-linkedin"></i>
        </a>
        <a href="" class="text-white me-4">
          <i class="fab fa-github"></i>
        </a>
      </div>
      <!-- Right -->
    </section>
    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="">
      <div class="container text-center text-md-start mt-5">
        <!-- Grid row -->
        <div class="row mt-3">
          <!-- Grid column -->
          <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
            <!-- Content -->
            <h6 class="text-uppercase fw-bold">Company name</h6>
            <hr
                class="mb-4 mt-0 d-inline-block mx-auto"
                style="width: 60px; background-color: #7c4dff; height: 2px"
                />
            <p>
              Here you can use rows and columns to organize your footer
              content. Lorem ipsum dolor sit amet, consectetur adipisicing
              elit.
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold">Products</h6>
            <hr
                class="mb-4 mt-0 d-inline-block mx-auto"
                style="width: 60px; background-color: #7c4dff; height: 2px"
                />
            <p>
              <a href="#!" class="text-white">MDBootstrap</a>
            </p>
            <p>
              <a href="#!" class="text-white">MDWordPress</a>
            </p>
            <p>
              <a href="#!" class="text-white">BrandFlow</a>
            </p>
            <p>
              <a href="#!" class="text-white">Bootstrap Angular</a>
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold">Useful links</h6>
            <hr
                class="mb-4 mt-0 d-inline-block mx-auto"
                style="width: 60px; background-color: #7c4dff; height: 2px"
                />
            <p>
              <a href="#!" class="text-white">Your Account</a>
            </p>
            <p>
              <a href="#!" class="text-white">Become an Affiliate</a>
            </p>
            <p>
              <a href="#!" class="text-white">Shipping Rates</a>
            </p>
            <p>
              <a href="#!" class="text-white">Help</a>
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold">Contact</h6>
            <hr
                class="mb-4 mt-0 d-inline-block mx-auto"
                style="width: 60px; background-color: #7c4dff; height: 2px"
                />
            <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
            <p><i class="fas fa-envelope mr-3"></i> info@example.com</p>
            <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
            <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
          </div>
          <!-- Grid column -->
        </div>
        <!-- Grid row -->
      </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div
         class="text-center p-3"
         style="background-color: rgba(0, 0, 0, 0.2)"
         >
      © 2020 Copyright:
      <a class="text-white" href="https://mdbootstrap.com/"
         >MDBootstrap.com</a
        >
    </div>
</div>
  </footer>
 
    <script type = "text/javascript" src="../Style/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script type = "text/javascript" src="../Style/bootstrap/js/bootstrap.bundle.js"></script>
    <script type = "text/javascript" src="../Style/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
