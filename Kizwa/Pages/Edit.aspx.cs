using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.OracleClient;

namespace Kizwa.Pages
{
    public partial class Edit : System.Web.UI.Page
    {
        string Date = "",Name = "",Mobile = "",Amount = "",Invoice = "";
        string ClaimDate = "", NewProAmt = "", BalanceAmt = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            txtBalanceAmount.Enabled = false;
        }

        protected void txtInvoice_TextChanged(object sender, EventArgs e)
        {
            Invoice = txtInvoice.Text;
            if (Invoice == "")
            {
                divMessage.Visible = false;
                divMessage.Attributes["class"] = "";
                labelMessage.Text = "";
            }
            else
            {
                OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);
                con.Open();
                string sql = "SELECT * from KIZWA WHERE INVOICE_NO = '" + Invoice + "'";
                OracleDataAdapter adapter = new OracleDataAdapter(sql, con);
                DataTable dt_custDet = new DataTable();
                adapter.Fill(dt_custDet);
                if (dt_custDet.Rows.Count > 0)
                {
                    txtDate.Text = Convert.ToDateTime(dt_custDet.Rows[0]["CREDIT_DATE"].ToString()).ToString("dd/MM/yyyy");
                    txtName.Text = dt_custDet.Rows[0]["CUST_NAME"].ToString();
                    txtPhone.Text = dt_custDet.Rows[0]["CUST_MOBILE"].ToString();
                    txtAmount.Text = dt_custDet.Rows[0]["PRODUCT_AMOUNT"].ToString();
                    txthidden.Text = dt_custDet.Rows[0]["CLAIM"].ToString();
                    if (txthidden.Text == "N")
                    {
                        txtCliamDate.Text = "";
                        txtNewAmount.Text = "";
                        txtBalanceAmount.Text = "";
                        divMessage.Visible = true;
                        divMessage.Attributes["class"] = "alert alert-primary col-md-6";
                        labelMessage.Text = "Credit Not Cliamed Yet";
                        txtCliamDate.Enabled = false;
                        txtNewAmount.Enabled = false;
                    }
                    else
                    {
                        txtCliamDate.Text = Convert.ToDateTime(dt_custDet.Rows[0]["CREDIT_RECEIVE_DATE"].ToString()).ToString("dd/MM/yyyy");
                        txtNewAmount.Text = dt_custDet.Rows[0]["CRN_AMOUNT"].ToString();
                        txtBalanceAmount.Text = dt_custDet.Rows[0]["BALANCE_AMOUNT"].ToString();
                        divMessage.Visible = true;
                        divMessage.Attributes["class"] = "alert alert-primary col-md-6";
                        labelMessage.Text = "Credit Already Cliamed";
                        txtCliamDate.Enabled = true;
                        txtNewAmount.Enabled = true;
                    }
                }
                else
                {
                    divMessage.Visible = true;
                    divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                    labelMessage.Text = "Not Data Retrieved";
                    //clearControls();
                    //disableControls();
                }
                con.Close();
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Date = txtDate.Text;
            Name = txtName.Text;
            Mobile = txtPhone.Text;
            Amount = txtAmount.Text;
            Invoice = txtInvoice.Text;
            ClaimDate = txtCliamDate.Text;
            NewProAmt = txtNewAmount.Text;
            BalanceAmt = txtBalanceAmount.Text;
            try
            {
                if(calcAmount()== false)
                {
                    divMessage.Visible = true;
                    divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                    labelMessage.Text = "The Amount Calculation Is Not Correct.";
                    txtInvoice.Text = "";
                    txtDate.Text = "";
                    txtName.Text = "";
                    txtPhone.Text = "";
                    txtAmount.Text = "";
                    txtCliamDate.Text = "";
                    txtNewAmount.Text = "";
                    txtBalanceAmount.Text = "";
                }
                else
                {

                    if (txthidden.Text == "N")
                    {
                        if (Invoice == "" || Date == "" || Amount == "")
                        {
                            divMessage.Visible = true;
                            divMessage.Attributes["class"] = "alert alert-warning col-md-6";
                            divMessage.Attributes["role"] = "alert";
                            labelMessage.Text = "Fill All * Mandatory Fields";
                        }
                        else
                        {
                            string sql = "UPDATE KIZWA SET CREDIT_DATE = to_date('" + Date + "','dd/MM/yyyy') ,CUST_NAME='" + Name + "',CUST_MOBILE='" +
                                Mobile + "',PRODUCT_AMOUNT='" + Amount + "' WHERE INVOICE_NO = '" + Invoice + "'";
                            Update(sql);
                        }
                    }
                    else
                    {
                        if (Invoice == "" || Date == "" || Amount == "" || ClaimDate == "" || NewProAmt == "" || BalanceAmt == "")
                        {
                            divMessage.Visible = true;
                            divMessage.Attributes["class"] = "alert alert-warning col-md-6";
                            divMessage.Attributes["role"] = "alert";
                            labelMessage.Text = "Fill All * Mandatory Fields";
                        }
                        else
                        {
                            string sql = "UPDATE KIZWA SET CREDIT_DATE = to_date('" + Date + "','dd/MM/yyyy') ,CUST_NAME='" + Name + "',CUST_MOBILE='" + Mobile + "',PRODUCT_AMOUNT='" + Amount +
                                "',CREDIT_RECEIVE_DATE = to_date('" + ClaimDate + "','dd/MM/yyyy') ,CRN_AMOUNT='" + NewProAmt + "',BALANCE_AMOUNT='" + BalanceAmt + "' WHERE INVOICE_NO = '" + Invoice + "'";
                            Update(sql);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                labelMessage.Text = ex.Message;
            }
        }

        public void Update(string sql)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);
            con.Open();
            OracleCommand cmd = new OracleCommand(sql, con);
            int d = cmd.ExecuteNonQuery();
            if (d > 0)
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-success col-md-6";
                labelMessage.Text = "Updated";
                clearControls();
            }
            else
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                labelMessage.Text = "Not Updated";
            }
            con.Close();
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            divMessage.Visible = false;
            clearControls();
        }

        public void clearControls()
        {
            txtInvoice.Text = "";
            txtDate.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtAmount.Text = "";
            txtCliamDate.Text = "";
            txtNewAmount.Text = "";
            txtBalanceAmount.Text = "";
        }

        protected void txtNewAmount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int Amount;
                int NewAmount = int.Parse(txtNewAmount.Text);
                Amount = int.Parse(txtAmount.Text);
                if (Amount > 0)
                {
                    int Balance = Amount - NewAmount;
                    txtBalanceAmount.Text = Balance.ToString();
                }
            }
            catch { }
        }

        public Boolean calcAmount()
        {
            int Amount, NewAmount, Balnc;
            if (txthidden.Text == "Y")
            {
                Balnc = int.Parse(txtBalanceAmount.Text);
                NewAmount = int.Parse(txtNewAmount.Text);
                Amount = int.Parse(txtAmount.Text);
                int Balance = Amount - NewAmount;
                if (Balance == Balnc)
                    return true;
                else
                    return false;
            }
            else
                return true;
        }

        protected void txtAmount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int NewAmount = int.Parse(txtNewAmount.Text);
                int Amount = int.Parse(txtAmount.Text);
                if (Amount > 0)
                {
                    int Balance = Amount - NewAmount;
                    txtBalanceAmount.Text = Balance.ToString();
                }
            }
            catch { }
        }

        protected void close_Click(object sender, EventArgs e)
        {

            Response.Redirect("/Pages/Login.aspx");
        }
    }
}