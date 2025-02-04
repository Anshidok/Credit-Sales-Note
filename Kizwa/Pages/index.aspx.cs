using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OracleClient;
using System.Globalization;
using System.Data;

namespace Kizwa.Pages
{
    public partial class index : System.Web.UI.Page
    {
        string Date = "";
        string InvoiceNO = "";
        string Name = "";
        string Mobile = "";
        string Amount = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                //if (autoInvoiceId() != null)
                //{
                //    txtInvoice.Text = result.ToString();
                //}
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Date = txtDate.Text;
            InvoiceNO = txtInvoice.Text;
            Name = txtName.Text;
            Mobile = txtPhone.Text;
            Amount = txtAmount.Text;
            if (checkInvoiceNo() == true)
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-danger col-md-12";
                labelMessage.Text = "Invoice No Alredy Exist";
            }
            else
            {
                try
                {
                    OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);
                    con.Open();
                    if (Date == "" || InvoiceNO == "" || Amount == "")
                    {
                        divMessage.Visible = true;
                        divMessage.Attributes["class"] = "alert alert-warning col-md-12";
                        divMessage.Attributes["role"] = "alert";
                        labelMessage.Text = "Fill All Mandatory Fields";
                    }
                    else
                    {
                        string sql = "INSERT INTO KIZWA (SLNO,CREDIT_DATE,INVOICE_NO,CUST_NAME,CUST_MOBILE, PRODUCT_AMOUNT,CLAIM) VALUES ('"+ autoSlno()+"',to_date('" + Date + "','dd/MM/yyyy'), '" + InvoiceNO + "' ,"
                       + " '" + Name + "','" + Mobile + "','" + Amount + "','N')";
                        OracleCommand cmd = new OracleCommand(sql, con);
                        int d = cmd.ExecuteNonQuery();
                        if (d > 0)
                        {
                            divMessage.Visible = true;
                            divMessage.Attributes["class"] = "alert alert-success col-md-12";
                            labelMessage.Text = "Saved";
                            txtInvoice.Text = "";
                            txtName.Text = "";
                            txtPhone.Text = "";
                            txtAmount.Text = "";
                            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                        }
                        else
                        {
                            divMessage.Visible = true;
                            divMessage.Attributes["class"] = "alert alert-danger col-md-12";
                            labelMessage.Text = "Not Saved";
                        }
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    divMessage.Visible = true;
                    divMessage.Attributes["class"] = "alert alert-danger col-md-12";
                    labelMessage.Text = ex.Message;
                }
            }
        }

        public object autoSlno()
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);

            string sql = "SELECT MAX(SLNO) from KIZWA ";
            OracleCommand cmd = new OracleCommand(sql, con);
            con.Open();
            int slno = Convert.ToInt32(cmd.ExecuteScalar());
            slno += 1;
            return slno;
            con.Close();

        }

        protected void clear_Click(object sender, EventArgs e)
        {
            divMessage.Visible = false;
            txtInvoice.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtAmount.Text = "";
            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        public Boolean checkInvoiceNo()
        {
            try
            {
                OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);
                con.Open();
                string sql = "SELECT count(*) from KIZWA WHERE INVOICE_NO= '" + txtInvoice.Text + "'";
                OracleCommand cmd = new OracleCommand(sql, con);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0)
                    return true;
                else
                    return false;
                con.Close();
            }
            catch
            {
                return true;
            }
        }
    }
}