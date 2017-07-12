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
        DataBase DB = new DataBase();
        DataSet ds = DB.GetDataSet("[dbo].[Proc_BackuptableList]");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        LabelPageInfo.Text = "Pages:current  " + (GridView1.PageIndex + 1).ToString() + " page / Total  " + GridView1.PageCount.ToString() + "  pages";
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
        int t_no = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("[dbo].[Proc_BackuptableDelete]", connsql);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@t_no", SqlDbType.Int).Value = t_no;
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
        int t_no = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); 
     
        String table_name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tname")).Text;
        String bk_condtions = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("where")).Text;
        String server_link = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("sl")).Text;
        String database_name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("dbname")).Text;
        String table_scheme = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("scheme")).Text;
        String bk_frequency = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("bkf")).Text;
        String notes = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("notes")).Text;
        String valid_flag = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("vflag")).Text;

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("[dbo].[Proc_BackuptableModify]", connsql);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@table_name", SqlDbType.VarChar, 200).Value = table_name;
        Cmd.Parameters.Add("@bk_conditions", SqlDbType.VarChar, 200).Value = bk_condtions;
        Cmd.Parameters.Add("@server_link", SqlDbType.VarChar, 20).Value = server_link;
        Cmd.Parameters.Add("@database_name", SqlDbType.VarChar, 40).Value = database_name;
        Cmd.Parameters.Add("@table_scheme", SqlDbType.VarChar, 20).Value = table_scheme;
        Cmd.Parameters.Add("@bk_frequency", SqlDbType.VarChar, 1).Value = bk_frequency;
        Cmd.Parameters.Add("@notes", SqlDbType.VarChar, 200).Value = notes;
        Cmd.Parameters.Add("@valid_flag", SqlDbType.VarChar, 1).Value = valid_flag;
        Cmd.Parameters.Add("@t_no", SqlDbType.Int).Value = t_no;
        
        
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
            changestatus.Text = "Please input table name or key words for the query tables!";
            qtablename.Focus();
        
        }
        else
        {

            string sql = " select * from dbo.bk_tables where table_name like '%" + qtablename.Text.Trim() + "%' order by t_no";
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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
                changestatus.Text = "totally find " + dt.Rows.Count + " tables.";
            }
            else
            {
                changestatus.Visible = true;
                changestatus.Text = "No this table!";
            }
        }
  
    }
   
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        String table_name = newtn.Text ;
        String bk_condtions = newwhere.Text ;
        String server_link = newsl.Text;
        String database_name = newdb.Text;
        String table_scheme = newts.Text;
        String bk_frequency = newbf.Text;
        String notes = newnotes.Text;
        String valid_flag = newflag.Text;

        if (newtn.Text =="")
        {
            //Response.Write("<script language=javascript>alert('Please input table name!')</script>");
            addstatus.Visible = true;
            addstatus.Text = "Please input table name!";
            newtn.Focus();
                  
        }
        else
        {   
           //Step1: check table exists in source database
            string destdb = "[" + server_link + "]." + database_name + ".INFORMATION_SCHEMA.tables ";
            string SQL = "select * from "+ destdb + " where table_name='"+table_name.Trim()+"'  and table_schema ='"+table_scheme.Trim()+"'";
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand(SQL, connsql);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = Cmd;
            sda.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                //check if table exists in bk tables lists
                string sql3 = " select * from dbo.bk_tables where table_name='" + table_name.Trim() + "'  and table_scheme ='" + table_scheme.Trim() + "'  and server_link ='" + server_link.Trim() + "' and bk_frequency='" + bk_frequency.Trim() + "' and database_name='" + database_name.Trim() + "' and valid_flag='y'";
                string connStr3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connsql3 = new SqlConnection(connStr3);
                if (connsql3.State.ToString() == "Closed") connsql3.Open();
                SqlCommand Cmd3 = new SqlCommand(sql3, connsql3);
                DataTable dt3 = new DataTable();
                SqlDataAdapter sda3 = new SqlDataAdapter();
                sda3.SelectCommand = Cmd3;
                sda3.Fill(dt3);
                if (dt3.Rows.Count >= 1)
                {
                    addstatus.Visible = true;
                    addstatus.Text = "Table you want to add has existed in backup table lists,Please check!";
                    connsql3.Close();
                }
                else
                {

                string connStr2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connsql2 = new SqlConnection(connStr2);
                if (connsql2.State.ToString() == "Closed") connsql2.Open();
                SqlCommand Cmd2 = new SqlCommand("[dbo].[Proc_BackuptableAdd]", connsql2);
                Cmd2.CommandType = CommandType.StoredProcedure;
                Cmd2.Parameters.Add("@table_name", SqlDbType.VarChar, 200).Value = table_name;
                Cmd2.Parameters.Add("@bk_conditions", SqlDbType.VarChar, 200).Value = bk_condtions;
                Cmd2.Parameters.Add("@server_link", SqlDbType.VarChar, 20).Value = server_link;
                Cmd2.Parameters.Add("@database_name", SqlDbType.VarChar, 40).Value = database_name;
                Cmd2.Parameters.Add("@table_scheme", SqlDbType.VarChar, 20).Value = table_scheme;
                Cmd2.Parameters.Add("@bk_frequency", SqlDbType.VarChar, 1).Value = bk_frequency;
                Cmd2.Parameters.Add("@notes", SqlDbType.VarChar, 200).Value = notes;
                Cmd2.Parameters.Add("@valid_flag", SqlDbType.VarChar, 1).Value = valid_flag;

                int Count2 = -1;
                Count2 = Cmd2.ExecuteNonQuery();
                if (Count2 > 0)
                {
                    GridViewBind();
                    addstatus.Visible = true;
                    addstatus.Text = "Add successfully!";
                }
                else
                {
                    addstatus.Visible = true;
                    addstatus.Text = "Add fail!";
                }
                GridView1.EditIndex = -1;
                GridViewBind();
                connsql2.Close();
                }
            }
            else
            {
               addstatus.Visible = true;
               addstatus.Text = "Table you want to add doesn't exist in source database, please check!";
            }

            connsql.Close();





        }
    }
}
       
  

