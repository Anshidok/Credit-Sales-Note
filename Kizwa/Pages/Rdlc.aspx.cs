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
using Microsoft.Reporting.WebForms;

namespace Kizwa.Pages
{
    public partial class Rdlc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                runReport();
            }
        }

        protected void runReport()
        {
            string s_name = Request.QueryString["s_name"];
            string s_path = Request.QueryString["s_path"];
            DataTable rpt = new DataTable();
            if (Session["dTable"] != null)
            {
                rpt = ((DataTable)Session["dTable"]);
                ReportDataSource rds = new ReportDataSource(s_name, rpt);
                this.rptViewer1.LocalReport.DataSources.Add(rds);
                Response.Write("Success");
            }
            else
            {
                Response.Write("Empty");
            }
            this.rptViewer1.LocalReport.ReportPath = s_path;
            this.rptViewer1.DataBind();
            this.rptViewer1.ServerReport.Refresh();
            //Session["dTable"] = null;


        }

    }
}