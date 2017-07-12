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
using System.Data.SqlClient;

public partial class Tool_CCT1_PayPeriodt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GridViewBind();
        }
    }

    protected void GridViewBind()
    {
        string sql = "  select *  from CC_Payperiod order by Pno asc ";
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
        
       
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        int i;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");

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

        string sd = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("StartDay")).Text;
        string ed = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("EndDay")).Text;
        string note = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Note")).Text;


        string updatesql = "update  CC_Payperiod  set StartDay='" + sd + "',EndDay='" + ed + "', Note='" + note + "' where Pno ='" + t_no + "' ";
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
          
        }
        catch(Exception ex)
        {
            changestatus.Visible = true;
            changestatus.Text = "Update fail! Error is : "+ ex.Message;
           
        }
   


    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
}