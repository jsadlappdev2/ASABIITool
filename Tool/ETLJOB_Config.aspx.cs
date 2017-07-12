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
        string sql = " select * from asadwh.dbo.ETL_Jobs_Definition order by jobid";
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
        int jobno = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());

        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("DELETE FROM asadwh.dbo.ETL_Jobs_Definition WHERE JOBID=@jobid", connsql);
        Cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = jobno;
        int Count = -1;
        Count = Cmd.ExecuteNonQuery();
        if (Count > 0)
        {
            GridViewBind();
           // Response.Write("<script language=javascript>alert('Delete successfully!')</script>");
            changestatus.Visible = true;
            changestatus.Text = "Delete successfully!";
        }
        else
        {
            //Response.Write("<script language=javascript>alert('Delete fail!')</script>");
            changestatus.Visible = true;
            changestatus.Text = "Delete fail!";
        }
        GridView1.EditIndex = -1;
        GridViewBind();
      

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  
        GridViewBind();
    }

    
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int jobid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());

        String JobName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("JobName")).Text;
        String SourceSystem = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("SourceSystem")).Text;
        String DestinationSystem = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("DestinationSystem")).Text;
        String JobNotes = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("JobNotes")).Text;
        String JobType = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("JobType")).Text;
        String SSISPackageName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("SSISPackageName")).Text;
        String Notes1 = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Notes1")).Text;
        String Notes2 = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Notes2")).Text;
        String dbjob = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("dbjob")).Text;
        String dbjob_runtime = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("dbjob_runtime")).Text;
        String dbjob_frequency = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("dbjob_frequency")).Text;

        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("update asadwh.dbo.ETL_Jobs_Definition set JobName=@JobName,SourceSystem=@SourceSystem,DestinationSystem=@DestinationSystem,JobNotes=@JobNotes,JobType=@JobType,SSISPackageName=@SSISPackageName,Notes1=@Notes1,Notes2=@Notes2, dbjob=@dbjob,dbjob_runtime=@dbjob_runtime,dbjob_frequency=@dbjob_frequency WHERE JOBID=@jobid", connsql);

        Cmd.Parameters.Add("@JobName", SqlDbType.VarChar, 200).Value = JobName;
        Cmd.Parameters.Add("@SourceSystem", SqlDbType.VarChar, 200).Value = SourceSystem;
        Cmd.Parameters.Add("@DestinationSystem", SqlDbType.VarChar, 20).Value = DestinationSystem;
        Cmd.Parameters.Add("@JobNotes", SqlDbType.VarChar, 40).Value = JobNotes;
        Cmd.Parameters.Add("@JobType", SqlDbType.VarChar, 20).Value = JobType;
        Cmd.Parameters.Add("@SSISPackageName", SqlDbType.VarChar, 50).Value = SSISPackageName;
        Cmd.Parameters.Add("@Notes1", SqlDbType.VarChar, 200).Value = Notes1;
        Cmd.Parameters.Add("@Notes2", SqlDbType.VarChar, 50).Value = Notes2;
        Cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = jobid;
        Cmd.Parameters.Add("@dbjob", SqlDbType.VarChar, 40).Value = dbjob;
        Cmd.Parameters.Add("@dbjob_runtime", SqlDbType.VarChar, 40).Value = dbjob_runtime;
        Cmd.Parameters.Add("@dbjob_frequency", SqlDbType.VarChar, 10).Value = dbjob_frequency;
        
        
        int Count = -1;
        Count = Cmd.ExecuteNonQuery();
        if (Count > 0)
        {
            GridViewBind();
           // Response.Write("<script language=javascript>alert('Update successfully!')</script>");
            changestatus.Visible = true;
            changestatus.Text = "Update successfully!";
        }
        else
        {
           // Response.Write("<script language=javascript>alert('Update fail!')</script>");
            changestatus.Visible = true;
            changestatus.Text = "Delete fail!";
        }
        GridView1.EditIndex = -1;
        GridViewBind();
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

            string sql = " select * from asadwh.dbo.ETL_Jobs_Definition where JobName like '%" + qtablename.Text.Trim() + "%' order by jobid";
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
                changestatus.Text = "totally find " + dt.Rows.Count + " jobs.";
            }
            else
            {
                changestatus.Visible = true;
                changestatus.Text = "No this job!";
            }
        }
  
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        String JobName=TextBox1.Text;
        String SourceSystem = TextBox2.Text;
        String DestinationSystem = TextBox3.Text;
        String JobNotes = TextBox4.Text;
        String JobType = TextBox5.Text;
        String SSISPackageName = TextBox6.Text;
        String CreateBy = TextBox7.Text;
        String Notes1 =  TextBox8.Text;
        String Notes2 = TextBox9.Text;
        String dbjob = TextBox10.Text;
        String dbjob_runtime = TextBox11.Text;
        String dbjob_frequency = TextBox12.Text;

        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("insert into asadwh.dbo.ETL_Jobs_Definition (jobname,SourceSystem,DestinationSystem,JobNotes,JobType,SSISPackageName,dbjob,dbjob_runtime,dbjob_frequency,CreateBy,notes1,notes2,CreateDate) values(@JobName,@SourceSystem,@DestinationSystem,@JobNotes,@JobType,@SSISPackageName,@dbjob,@dbjob_runtime,@dbjob_frequency,@CreateBy,@Notes1,@Notes2,getdate())", connsql);

        Cmd.Parameters.Add("@JobName", SqlDbType.VarChar, 200).Value = JobName;
        Cmd.Parameters.Add("@SourceSystem", SqlDbType.VarChar, 200).Value = SourceSystem;
        Cmd.Parameters.Add("@DestinationSystem", SqlDbType.VarChar, 200).Value = DestinationSystem;
        Cmd.Parameters.Add("@JobNotes", SqlDbType.VarChar, 40).Value = JobNotes;
        Cmd.Parameters.Add("@JobType", SqlDbType.VarChar, 20).Value = JobType;
        Cmd.Parameters.Add("@SSISPackageName", SqlDbType.VarChar, 50).Value = SSISPackageName;
        Cmd.Parameters.Add("@CreateBy", SqlDbType.VarChar, 20).Value = CreateBy;
        Cmd.Parameters.Add("@Notes1", SqlDbType.VarChar, 200).Value = Notes1;
        Cmd.Parameters.Add("@Notes2", SqlDbType.VarChar, 50).Value = Notes2;
        Cmd.Parameters.Add("@dbjob", SqlDbType.VarChar, 50).Value = dbjob;
        Cmd.Parameters.Add("@dbjob_runtime", SqlDbType.VarChar, 40).Value = dbjob_runtime;
        Cmd.Parameters.Add("@dbjob_frequency", SqlDbType.VarChar, 10).Value = dbjob_frequency;

        if (JobName == "")
        {
            //Response.Write("<script language=javascript>alert('Please input table name!')</script>");
            addstatus.Visible = true;
            addstatus.Text = "Please input job name!";
            TextBox1.Focus();

        }
        else
        {

            int Count = -1;
            Count = Cmd.ExecuteNonQuery();
            if (Count > 0)
            {
                GridViewBind();
                // Response.Write("<script language=javascript>alert('Update successfully!')</script>");
                changestatus.Visible = true;
                changestatus.Text = "Add successfully!";
            }
            else
            {
                // Response.Write("<script language=javascript>alert('Update fail!')</script>");
                changestatus.Visible = true;
                changestatus.Text = "Add fail!";
            }
            GridViewBind();

        }
    }

   
}
       
  

