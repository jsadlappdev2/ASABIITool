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
            GridViewBind();
        }
       
    }
    private void GridViewBind()
    {
        string sql = " SELECT a.LogNo,a.JobID,b.JobName,a.JobLogs,a.ErrorsMsg,a.InsertTime,a.Note1,a.Note2,a.Note3  FROM [ASADWH].[dbo].[ETL_Jobs_Run_Logs] as a  inner join [ASADWH].[dbo].[ETL_Jobs_Definition] as b  on a.jobid=b.jobid order by a.logno desc";
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
        LabelPageInfo.Text = "Pages:（ current  " + (GridView1.PageIndex + 1).ToString() + " page / Total  " + GridView1.PageCount.ToString() + "  pages）";
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
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
      

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  
        GridViewBind();
    }

    
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
    }

    protected void ImageButtonQuery_Click(object sender, ImageClickEventArgs e)
    {
        if (qtablename.Text == "")
        {
            changestatus.Visible = true;
            changestatus.Text = "Please input job name or key words for the query jobs!";
            qtablename.Focus();
        
        }
        else
        {

         
            string sql = " SELECT a.LogNo,a.JobID,b.JobName,a.JobLogs,a.ErrorsMsg,a.InsertTime,a.Note1,a.Note2,a.Note3  FROM [ASADWH].[dbo].[ETL_Jobs_Run_Logs] as a  inner join [ASADWH].[dbo].[ETL_Jobs_Definition] as b  on a.jobid=b.jobid  where b.JobName like '%" + qtablename.Text.Trim() + "%' order by a.logno desc";
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand(sql, connsql);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = Cmd;
            sda.Fill(dt);

            if (dt.Rows.Count >= 1)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                changestatus.Visible = true;
                changestatus.Text = "totally find " + dt.Rows.Count + " logs.";
            }
            else
            {
                changestatus.Visible = true;
                changestatus.Text = "No this job's log!";
            }
        }
  
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }

   
}
       
  

