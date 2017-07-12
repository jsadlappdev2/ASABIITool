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
        string sql = " select *  FROM ASADWH.dbo.CC_database_dictionary order by tablename,columnsno asc";
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

        String tbdesc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tbdesc")).Text;
        String comcare = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("comcare")).Text;
        String columnsdesc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("columnsdesc")).Text;


        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("[dbo].[Proc_CC_DBDICT_Update]", connsql);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@tablenamedesc", SqlDbType.VarChar, 200).Value = tbdesc;
        Cmd.Parameters.Add("@columnsdesc", SqlDbType.VarChar, 200).Value = columnsdesc;
        Cmd.Parameters.Add("@cc_fe_desc", SqlDbType.VarChar, 20).Value = comcare;
       
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

   
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (qtablename.Text == "")
        {
            changestatus.Visible = true;
            changestatus.Text = "Please input table name or column name or ComCare front end key words for the query!";
            qtablename.Focus();

        }
        else
        {
            string selectoption = DropDownList1.SelectedValue.ToString();
            

                string sql = " select * from ASADWH.dbo.CC_database_dictionary where  ";
                if (selectoption == "TN")
                {
                    sql = sql + "tablename like '" + qtablename.Text.Trim() + "' ";
                }
                else if(selectoption == "CN")
                {
                    sql = sql + "columnsdesc like '" + qtablename.Text.Trim() + "' ";
                }
                else 
                {
                    sql = sql + "cc_fe_desc like '" + qtablename.Text.Trim() + "' ";
                }
                sql=sql+" order by t_no,columnsno asc";
       

             changestatus.Visible = true;
             changestatus.Text = sql;

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
                LabelPageInfo.Text = "Pages: current  " + (GridView1.PageIndex + 1).ToString() + " page / Total  " + GridView1.PageCount.ToString() + "  pages";
            }
            else
            {
                changestatus.Visible = true;
                changestatus.Text = "No this table!";
            }
        }
    }
}
       
  

