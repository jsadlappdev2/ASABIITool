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
using System.Drawing;

public partial class Tool_ValidateCCImportOriginalTimesheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Label1.Text = PreviousPage.CurrentPayperiod;
        //Label1.Text = ((DropDownList)PreviousPage.FindControl("DropDownList1")).SelectedItem.Value;
    }

    protected void GridViewBind()
    {

        string sqlwhere = "";      

        sqlwhere = " len([Payroll Number])=0 or len([Classification-Centre from Round])<5 or len([Classification-Centre from Round])=0 or len([Payroll GL Code])<18 or [Km Travelled]<'0.00' ";
        

        string sql = "  select [Provider ID],Name,[Payroll Number] ,[Activity Start Date],[Activity Start Time],[Activity End Time],[Classification-Centre from Round],[Payroll GL Code],[Km Travelled],[Authorised by], [Task Type], [Indirect Activity Type],lno from CC_T1_Timesheetfile_import_stage where " + sqlwhere + "  order by lno asc";
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
            changestatus.Text = "=============Congratulations! No errors.=============";
        }
        else
        {
            changestatus.Text = "=============There are total: " + dt.Rows.Count.ToString() + " errors.=============";

        }
        connsql.Close();

    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {

            string lbGL = "";
            string lbCL = "";
            string lbKMS = "";
            string lbEMP = "";
            try
            {
                lbGL = ((Label)GridView1.Rows[i].FindControl("GLCodes")).Text;
            }
            catch (Exception)
            {
                lbGL = ((TextBox)GridView1.Rows[i].FindControl("GLCodes")).Text;

            }


            try
            {
                lbCL = ((Label)GridView1.Rows[i].FindControl("Classification")).Text;
            }
            catch (Exception)
            {
                lbCL = ((TextBox)GridView1.Rows[i].FindControl("Classification")).Text;

            }

            try
            {
                lbKMS = ((Label)GridView1.Rows[i].FindControl("KMS")).Text;
            }
            catch (Exception)
            {
                lbKMS = ((TextBox)GridView1.Rows[i].FindControl("KMS")).Text;

            }

            try
            {
                lbEMP = ((Label)GridView1.Rows[i].FindControl("EmployeeId")).Text;
            }
            catch (Exception)
            {
                lbEMP = ((TextBox)GridView1.Rows[i].FindControl("EmployeeId")).Text;

            }



            //check GL Codes
            if (lbGL.Length < 18)
            {

                GridView1.Rows[i].Cells[10].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");
              
            }

            //check Classification
            if (lbCL.Length < 5)
            {

                GridView1.Rows[i].Cells[9].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");
        
            }

            //check KMS
            if (lbKMS.Substring(0,1)=="-")
            {

                GridView1.Rows[i].Cells[11].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");

            }

            //check employeeid
            if (lbEMP.Length == 0)
            {

                GridView1.Rows[i].Cells[5].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");

            }





        }


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

        string eid = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("EmployeeId")).Text;
        string cls = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Classification")).Text;
        string gl = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("GLCodes")).Text;
        string kms = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("KMS")).Text;


        string updatesql = "update  CC_T1_Timesheetfile_import_stage  set [Payroll Number]='" + eid + "',[Payroll GL Code]='" + gl + "', [Classification-Centre from Round] ='" + cls + "', [Km Travelled]='" + kms + "'  where lno ='" + t_no + "' ";
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
        string sqlwhere = "";
        if (CheckBox4.Checked)
        {

            sqlwhere = " len([Payroll Number])=0 or len([Classification-Centre from Round])<5 or len([Classification-Centre from Round])=0 or len([Payroll GL Code])<18 or [Km Travelled]<'0.00' ";    
        }

       

        string sql = " select [Provider ID],Name,[Payroll Number] ,[Activity Start Date],[Activity Start Time],[Activity End Time],[Classification-Centre from Round],[Payroll GL Code], [Km Travelled],[Authorised by],[Task Type], [Indirect Activity Type], lno from CC_T1_Timesheetfile_import_stage where " + sqlwhere + "  order by [Provider ID] asc";
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
            changestatus.Text = "=============Congratulations! No errors.=============";
        }
        else
        {
            changestatus.Text = "=============There are total: " + dt.Rows.Count.ToString() + " errors.=============";

        }
        connsql.Close();

    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
       

    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
       
    }





    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
}