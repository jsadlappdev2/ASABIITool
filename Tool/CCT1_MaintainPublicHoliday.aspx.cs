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
        string sql = "  select *  from CC_Payperiod_Publicholiday order by Pno asc ";
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
        string deletesql = "delete from   CC_Payperiod_Publicholiday   where Pno ='" + t_no + "' ";
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
        
   
       
    }



    protected void Button1_Click(object sender, EventArgs e)
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
            newrundate = syear + "-" + smonth + "-" + sdate;
        }

        else
        {
            sdate = rundate.Substring(0, 2);
            smonth = rundate.Substring(3, 2);
            syear = rundate.Substring(6, 4);
            newrundate = syear + "-" + smonth + "-" + sdate;
        }

        String notes = newnotes.Text;


        if (newrundate == "0001-01-01")
        {
            Response.Write("<script language=javascript>alert('Please select start date!')</script>");


        }
        else
        {


            string insertsql = "insert into CC_Payperiod_Publicholiday   select convert(date,'" + newrundate + "'),'" + notes + "','' ";
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

            }
            catch (Exception ex)
            {
                addstatus.Visible = true;
                addstatus.Text = "Insert fail! Error is : " + ex.Message;

            }


        }
    }
}
       
  

