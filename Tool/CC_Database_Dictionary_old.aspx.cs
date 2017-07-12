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
        changestatus.Visible = false;
       
    }
    private void GridViewBind()
    {

        string sql = " select [t_no],[Tablename] ,[Tablename_desc],[CC_FE_Desc] ,[Columnsno],[Columnsname]  ,[Columnsdesc]  ,[Isidentity]  ,[Isprimarykey]  ,[Kind]  ,[Length]  ,[Percision] ,[Scale] ,[AllowNULL]  ,[FK_Column] ,[PK_table] ,[PK_Column] ,[Constraint_Name]  FROM ASADWH.dbo.CC_database_dictionary order by tablename,columnsno asc";
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
        LabelPageInfo.Text = "Pages: current  " + (GridView1.PageIndex + 1).ToString() + " page / Total  " + GridView1.PageCount.ToString() + "  pages";
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
       int t_no = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());

        //int t_no = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].FindControl("t_no")).Text);

        String tablenamedesc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tdsc")).Text;
        String columnsdesc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("clmd")).Text;
        String cc_fe_desc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("ccfed")).Text;


        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("[ASADWH].[dbo].[Proc_CC_DBDICT_Update]", connsql);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@tablenamedesc", SqlDbType.VarChar, 200).Value = tablenamedesc;
        Cmd.Parameters.Add("@columnsdesc", SqlDbType.VarChar, 200).Value = columnsdesc;
        Cmd.Parameters.Add("@cc_fe_desc ", SqlDbType.VarChar, 200).Value = cc_fe_desc;
        Cmd.Parameters.Add("@t_no", SqlDbType.Int).Value = t_no;
        
        
        int Count = -1;
        Count = Cmd.ExecuteNonQuery();
        if (Count > 0)
        {


            string sql = " select [t_no],[Tablename] ,[Tablename_desc],[CC_FE_Desc] ,[Columnsno],[Columnsname]  ,[Columnsdesc]  ,[Isidentity]  ,[Isprimarykey]  ,[Kind]  ,[Length]  ,[Percision] ,[Scale] ,[AllowNULL]  ,[FK_Column] ,[PK_table] ,[PK_Column] ,[Constraint_Name]   from asadwh.dbo.CC_database_dictionary where tablename like '" + qtablename.Text.Trim() + "' order by tablename, columnsno asc ";
            string connStr2 = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql2 = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd2 = new SqlCommand(sql, connsql2);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = Cmd2;
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridViewBind();
           // Response.Write("<script language=javascript>alert('Update successfully!')</script>");
            changestatus.Visible = true;
            changestatus.Text = "Update successfully!";

         
        }
        else
        {
           // Response.Write("<script language=javascript>alert('Update fail!')</script>");
            changestatus.Visible = true;
            changestatus.Text = "Update fail!";
        }
        GridView1.EditIndex = -1;
        GridViewBind();
    }

    protected void ImageButtonQuery_Click(object sender, ImageClickEventArgs e)
    {
        if (qtablename.Text == "")
        {
            changestatus.Visible = true;
            changestatus.Text = "Please input some key words for searching!";
            qtablename.Focus();
        
        }
        else
        {

           // string sql = " select * from asadwh.dbo.CC_database_dictionary where tablename like '%" + qtablename.Text.Trim() + "%' or tablename_desc like '%" + qtablename.Text.Trim() + "%'  or columnsname like '%" + qtablename.Text.Trim() + "%' or columnsdesc  like '%" + qtablename.Text.Trim() + "%' or cc_fe_desc like '%" + qtablename.Text.Trim() + "%'  order by tablename, columnsno asc ";
            string sql = " select [t_no],[Tablename] ,[Tablename_desc],[CC_FE_Desc] ,[Columnsno],[Columnsname]  ,[Columnsdesc]  ,[Isidentity]  ,[Isprimarykey]  ,[Kind]  ,[Length]  ,[Percision] ,[Scale] ,[AllowNULL]  ,[FK_Column] ,[PK_table] ,[PK_Column] ,[Constraint_Name]   from asadwh.dbo.CC_database_dictionary where tablename like '" + qtablename.Text.Trim() + "' order by tablename, columnsno asc ";
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
                changestatus.Text = "totally find " + dt.Rows.Count + " records.";

            }
            else
            {
                changestatus.Visible = true;
                changestatus.Text = "No record!";
            }

            LabelPageInfo.Text = "Pages: current  " + (GridView1.PageIndex + 1).ToString() + " page / Total  " + GridView1.PageCount.ToString() + "  pages";
        }
  
    }
   
   
}
       
  

