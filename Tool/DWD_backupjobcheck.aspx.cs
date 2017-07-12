using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using OnLineExam.BusinessLogicLayer;
using OnLineExam.DataAccessLayer;
using System.Data.SqlClient;

public partial class Web_UserManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GridView2.DataBind();
        }
       
    }
 

    protected void Button2_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("[DWDASA].[dbo].[SP_BackupTables]", connsql);
        Cmd.CommandType = CommandType.StoredProcedure;
        if (CheckBox1.Checked)
        {
            Cmd.Parameters.Add("@BKDay", SqlDbType.VarChar, 8).Value = jobday.Text.Trim();
        }
      
        try
        {
            Cmd.ExecuteNonQuery();
            Label2.Visible = true;
            Label2.Text = "Job execute successfully!";
            GridView2.DataBind();
        }
        catch (Exception ee)
        {
            Label2.Visible = true;
            Label2.Text = "Job execute error: " + ee.Message;

        }
        jobday.Text = "";
        CheckBox1.Checked = false;
        Calendar1.Visible = false;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
      
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //get the yyyymmdd format date from canlendar
        string rundate = Calendar1.SelectedDate.ToShortDateString();
        string sdate = "";
        string smonth = "";
        string syear = "";
        string newrundate = "";
        if (rundate.Length == 9)
        {
            sdate = "0" + rundate.Substring(0, 1);
            smonth = rundate.Substring(2, 2);
            syear = rundate.Substring(5, 4);
            newrundate = syear + smonth + sdate;
        }

        else
        {
            sdate = rundate.Substring(0, 2);
            smonth = rundate.Substring(3, 2);
            syear = rundate.Substring(6, 4);
            newrundate = syear + smonth + sdate;
        }
        jobday.Visible = true;
        jobday.Text = newrundate;
        Calendar1.Visible = false;
    }
}
       
  

