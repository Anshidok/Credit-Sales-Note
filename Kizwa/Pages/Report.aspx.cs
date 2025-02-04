using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.OracleClient;
using System.Globalization;

namespace Kizwa.Pages
{
    public partial class Report : System.Web.UI.Page
    {
        DataTable dt_custDet = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.show);
        }

        protected void show_Click(object sender, EventArgs e)
        {
            try
            {
                string rptype;
                if (cbxOutStand.Checked == true)
                    rptype = "true";
                else
                    rptype = "false";
                report(rptype);
                Session["dTable"] = dt_custDet;
                string s_name = "RPT1";
                string s_path = "Reports\\Report1.rdlc";
                if (dt_custDet.Rows.Count == 0)
                {
                    divMessage.Visible = true;
                    divMessage.Attributes["class"] = "alert alert-danger col-md-12";
                    labelMessage.Text = "No Data Retrieved";
                }
                else
                    Response.Redirect("~/Pages/Rdlc.aspx?s_name=" + s_name + "&s_path=" + s_path);
            }
            catch { }
        }

        public void report(string rptype)
        {
            try
            {
                string sql;
                OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString);
                con.Open();
                string fd = txtFromDate.Text;
                string td = txtToDate.Text;
                string status = cmbStatus.SelectedValue;
                if (rptype == "true")
                {
                    sql = "SELECT CREDIT_DATE CrDate,INVOICE_NO InvoiceNo, CUST_NAME CustName,CUST_MOBILE CustMobile,PRODUCT_AMOUNT ProductAmount, " +
                    " CREDIT_RECEIVE_DATE CrReciveDate ,CRN_AMOUNT CrnAmount, BALANCE_AMOUNT BalanceAmount, DECODE(CLAIM, 'Y' ,'Yes' ,'N','No') Cliam from " +
                    " KIZWA order by INVOICE_NO";
                }
                else
                {
                    sql = "SELECT CREDIT_DATE CrDate,INVOICE_NO InvoiceNo, CUST_NAME CustName,CUST_MOBILE CustMobile,PRODUCT_AMOUNT ProductAmount, " +
                    " CREDIT_RECEIVE_DATE CrReciveDate ,CRN_AMOUNT CrnAmount, BALANCE_AMOUNT BalanceAmount, DECODE(CLAIM, 'Y' ,'Yes' ,'N','No') Cliam from " +
                    " KIZWA WHERE (CREDIT_DATE BETWEEN  to_date('" + fd + "','dd/MM/yyyy') and to_date('" + td + "','dd/MM/yyyy') or CREDIT_DATE " +
                    " <=to_date('" + fd + "','dd/MM/yyyy') ) and DECODE('" + status + "','All','All', claim)='" + status + "' order by INVOICE_NO";
                }
                OracleDataAdapter adapter = new OracleDataAdapter(sql, con);
                adapter.Fill(dt_custDet);
            }
            catch { }
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            divMessage.Visible = false;
            txtFromDate.Text = "";
            txtToDate.Text = "";
            cmbStatus.SelectedIndex = 0;
            cbxOutStand.Checked = false;

        }

        protected void cbxOutStand_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxOutStand.Checked)
            {
                txtFromDate.Enabled = false;
                txtToDate.Enabled = false;
                cmbStatus.Enabled = false;
            }
            else
            {
                txtFromDate.Enabled = true;
                txtToDate.Enabled = true;
                cmbStatus.Enabled = true;
            }
        }

    }
}