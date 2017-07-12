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
            GridView1.DataBind();
        }

       
    }

    private void GridViewBind()
    {
        string sql = " select * from asadwh.dbo.ETL_Jobs_Run_Logs order by logno desc";
        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand(sql, connsql);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = Cmd;
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
       
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //执行循环，保证每条数据都可以更新
        int i;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = " select * from asadwh.dbo.ETL_Jobs_Run_Logs order by logno desc";
        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand(sql, connsql);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = Cmd;
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
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
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
       
  

