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
    public partial class Return : System.Web.UI.Page
    {
        string ClaimDate = "";
        string NewProAmt = "";
        string BalanceAmt = "";
        string Invoice = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            divMessage.Visible = false;
            divMessage.Attributes["class"] = "";
            labelMessage.Text = "";
            txtCliamDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            if (!IsPostBack)
            {
                txtInvoice.Focus();
                disableControls();
            }
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

                string sql = "SELECT * from KIZWA WHERE INVOICE_NO = '" + Invoice + "' AND CLAIM='N'";
                OracleDataAdapter adapter = new OracleDataAdapter(sql, con);
                DataTable dt_custDet = new DataTable();
                adapter.Fill(dt_custDet);
                if (dt_custDet.Rows.Count > 0)
                {
                    txtDate.Text = Convert.ToDateTime(dt_custDet.Rows[0]["CREDIT_DATE"].ToString()).ToString("dd/MM/yyyy");
                    txtName.Text = dt_custDet.Rows[0]["CUST_NAME"].ToString();
                    txtPhone.Text = dt_custDet.Rows[0]["CUST_MOBILE"].ToString();
                    txtAmount.Text = dt_custDet.Rows[0]["PRODUCT_AMOUNT"].ToString();

                    divMessage.Visible = false;
                    txtNewAmount.Focus();
                    txtBalanceAmount.Text = "";
                    txtNewAmount.Text = "";
                    txtBalanceAmount.Enabled = true;
                    txtNewAmount.Enabled = true;
                }
                else
                {
                    divMessage.Visible = true;
                    divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                    labelMessage.Text = "Not Data Retrieved";
                    clearControls();
                    disableControls();
                }
                con.Close();
            }
        }

        protected void txtNewAmount_TextChanged(object sender, EventArgs e)
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

        protected void clear_Click(object sender, EventArgs e)
        {
            divMessage.Visible = false;
            clearControls();
            txtCliamDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Invoice = txtInvoice.Text;
            ClaimDate = txtCliamDate.Text;
            NewProAmt = txtNewAmount.Text;
            BalanceAmt = txtBalanceAmount.Text;
            //if (checkInvoiceNo() == true)
            //{
            //    divMessage.Visible = true;
            //    divMessage.Attributes["class"] = "alert alert-danger col-md-12";
            //    labelMessage.Text = "Invoice No Alredy Exist";
            //}
            //else
            //{
            try
            {
                OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);
                con.Open();
                if (ClaimDate == "" || NewProAmt == "" || BalanceAmt == "")
                {
                    divMessage.Visible = true;
                    divMessage.Attributes["class"] = "alert alert-warning col-md-6";
                    divMessage.Attributes["role"] = "alert";
                    labelMessage.Text = "Fill All * Mandatory Fields";
                }
                else
                {
                    string sql = "UPDATE KIZWA SET CREDIT_RECEIVE_DATE = to_date('" + ClaimDate + "','dd/MM/yyyy') ,CRN_AMOUNT='" + NewProAmt + "',BALANCE_AMOUNT='" + BalanceAmt + "', CLAIM ='Y' WHERE INVOICE_NO = '" + Invoice + "'";
                    OracleCommand cmd = new OracleCommand(sql, con);
                    int d = cmd.ExecuteNonQuery();
                    if (d > 0)
                    {
                        divMessage.Visible = true;
                        divMessage.Attributes["class"] = "alert alert-success col-md-6";
                        labelMessage.Text = "Saved";
                        clearControls();
                    }
                    else
                    {
                        divMessage.Visible = true;
                        divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                        labelMessage.Text = "Not Saved";
                        clearControls();
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                divMessage.Visible = true;
                divMessage.Attributes["class"] = "alert alert-danger col-md-6";
                labelMessage.Text = ex.Message;
            }

        }

        public void disableControls()
        {
            txtDate.Enabled = false;
            txtName.Enabled = false;
            txtPhone.Enabled = false;
            txtAmount.Enabled = false;
            txtBalanceAmount.Enabled = false;
            txtNewAmount.Enabled = false;
        }

        public void clearControls()
        {
            txtDate.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtAmount.Text = "";
            txtBalanceAmount.Text = "";
            txtNewAmount.Text = "";
        }

    }
}