using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kizwa
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            string pass = txt_password.Text;
            if (pass == "kizwa123")
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-success col-md-12";
                divMessage.Attributes["role"] = "alert";
                labelMessage.Text = "Login Succesfull";

                Response.Redirect("/Pages/Edit.aspx");
            }
            else
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-danger col-md-12";
                divMessage.Attributes["role"] = "alert";
                labelMessage.Text = "Invalid Password";
            }
        }

    }
}