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
        string sql = "  select *  from CC_T1_TimesheetProcessMapping_table order by Step_No asc ";
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

        if (dt.Rows.Count.ToString() == "0")
        {
            changestatus.Text = "=============No records.=============";
        }
        else
        {
            changestatus.Text = "=============There are total: " + dt.Rows.Count.ToString() + " records.=============";

        }
        connsql.Close();
        LabelPageInfo.Text = "Pages: current  " + (GridView1.PageIndex + 1).ToString() + " page / Total  " + GridView1.PageCount.ToString() + "  pages.";
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //ִ��ѭ������֤ÿ�����ݶ����Ը���
        int i;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //�����ж��Ƿ���������
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //�����ͣ��ʱ���ı���ɫ
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //������ƿ�ʱ��ԭ����ɫ
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
        string deletesql = "delete from   CC_T1_TimesheetProcessMapping_table   where Step_No ='" + t_no + "' ";
        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand(deletesql, connsql);
        Cmd.CommandType = CommandType.Text;
        // int Count = -1;
        try
        {
            Cmd.ExecuteNonQuery();
            GridViewBind();
            changestatus.Visible = true;
            changestatus.Text = "delete successfully!";
            GridView1.EditIndex = -1;
            GridViewBind();

        }
        catch (Exception ex)
        {
            changestatus.Visible = true;
            changestatus.Text = "delete fail! Error is : " + ex.Message;

        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  
        GridViewBind();
    }

    
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int t_no = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());

        string stepname = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Step_Name")).Text;
        string sqltext = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("SQL_Text")).Text;
        string note = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Notes")).Text;
        string vflag = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Valid_Flag")).Text;

      
        String sqltext2 = sqltext.Replace(@"'", @"''");

        string updatesql = "update  CC_T1_TimesheetProcessMapping_table  set step_name='" + stepname + "', SQL_Text='" + sqltext2 + "', Notes='" + note + "', valid_flag='"+vflag+"' where step_no ='" + t_no + "' ";
        string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand(updatesql, connsql);
        Cmd.CommandType = CommandType.Text;
        // int Count = -1;
        try
        {
            Cmd.ExecuteNonQuery();
            GridViewBind();
            changestatus.Visible = true;
            changestatus.Text = "Update successfully!";
            GridView1.EditIndex = -1;
            GridViewBind();

        }
        catch (Exception ex)
        {
            changestatus.Visible = true;
            changestatus.Text = "Update fail! Error is : " + ex.Message;

        }
   
       
    }



    protected void Button1_Click(object sender, EventArgs e)
    {

             string sqltext = SQL.Text;
             String sqltext2 = sqltext.Replace(@"'",@"''");

            string insertsql = "insert into CC_T1_TimesheetProcessMapping_table values('" + StepName.Text + "','" + sqltext2 + "','" + Notes.Text + "','" + ValidFlag.SelectedValue.ToString() + "', getdate())";
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand(insertsql, connsql);
            Cmd.CommandType = CommandType.Text;
            // int Count = -1;
            try
            {
                Cmd.ExecuteNonQuery();
                GridViewBind();
                addstatus.Visible = true;
                addstatus.Text = "Insert successfully!";
                GridView1.EditIndex = -1;
                GridViewBind();
                StepName.Text = "";
                SQL.Text = "";
                Notes.Text = "";

            }
            catch (Exception ex)
            {
                addstatus.Visible = true;
                addstatus.Text = "Insert fail! Error is : " + ex.Message;
              

            }


        
    }
}
       
  

