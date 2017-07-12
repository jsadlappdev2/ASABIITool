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

public partial class Tool_ValidateCCImportTimesheet : System.Web.UI.Page
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
        //string sql = "  select lno, EmployeeId,EntryDate,EntryType,Activity,PlantAssetNumber,units,ClockIn,clockout,comments,AuthorisedInd,HistoricalInd,PositionCode,PayComponentCode,SelectionCode1,SelectionCode2  from CC_T1_Timesheet_ReadforExport_withno where EmployeeId is null or len(activity)<>15 or PositionCode not like '2%'  or PositionCode is null order by employeeid,entrydate,ClockIn asc ";

        string sql = "select lno, EmployeeId, EntryDate, EntryType, Activity, PlantAssetNumber, units, ClockIn, clockout, comments, AuthorisedInd, HistoricalInd, PositionCode, PayComponentCode, SelectionCode1, SelectionCode2, t2.provider_id ";
        sql += " from CC_T1_Timesheet_ReadforExport_withno as t1 ";
        sql += "left join ";
        sql += " (select distinct[Provider ID] as provider_id, [Payroll Number] as employee_id from CC_T1_Timesheetfile_import_final) as t2 ";
        sql += "on t1.EmployeeId = t2.employee_id ";
        sql += "where EmployeeId is null or len(activity) <> 15 or PositionCode not like '2%'  or PositionCode is null or (clockin=clockout and len(clockin)<>0) order by employeeid, entrydate, ClockIn asc ";

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

        string lbEMP = "";
        string lbACT = "";
        string lbPO = "";
        string lbClockin = "";
        string lbClockout = "";
       

        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
         


            try
            {
                lbEMP = ((Label)GridView1.Rows[i].FindControl("EmployeeId")).Text;
            }
            catch (Exception)
            {
                lbEMP = ((TextBox)GridView1.Rows[i].FindControl("EmployeeId")).Text;

            }


            try
            {
                lbACT = ((Label)GridView1.Rows[i].FindControl("Activity")).Text;
            }
            catch (Exception)
            {
                lbACT = ((TextBox)GridView1.Rows[i].FindControl("Activity")).Text;

            }

            try
            {
                lbPO = ((Label)GridView1.Rows[i].FindControl("PositionCode")).Text;
            }
            catch (Exception)
            {
                lbPO = ((TextBox)GridView1.Rows[i].FindControl("PositionCode")).Text;

            }

            try
            {
                lbClockin = ((Label)GridView1.Rows[i].FindControl("ClockIn")).Text;
                lbClockout = ((Label)GridView1.Rows[i].FindControl("clockout")).Text;
            }
            catch (Exception)
            {
              

            }




            //check EmployeeId
            if (lbEMP.Length == 0)
            {

                GridView1.Rows[i].Cells[3].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");

            }

            //check GL codes
            if (lbACT.Length < 15)
            {

                GridView1.Rows[i].Cells[6].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");

            }

            //check position code
            if(lbPO.Length > 0 && lbPO.Substring(0, 1) != "2")
            //if (lbPO.Substring(0, 1) != "2")
            {

                GridView1.Rows[i].Cells[11].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");

            }

           if(lbPO.Length <=0)
            {

                GridView1.Rows[i].Cells[11].BackColor = Color.Red;
                // lbGL.ForeColor = ColorTranslator.FromHtml("#E16C0F");

            }
           //check clockin = clockout
            if (String.Compare(lbClockin,lbClockout)==0)
            {

                //GridView1.Rows[i].Cells[8].BackColor = Color.Red;
                //GridView1.Rows[i].Cells[9].BackColor = Color.Red;
                GridView1.Rows[i].Cells[8].ForeColor = Color.Red;
                GridView1.Rows[i].Cells[9].ForeColor = Color.Red;

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

        string ps = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("PositionCode")).Text;
        string eid = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("EmployeeId")).Text;
        string at = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("Activity")).Text;
        string et = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("EntryType")).Text;
        string pc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("PayComponentCode")).Text;
        string sc1 = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("SelectionCode1")).Text;

        string updatesql = "update  CC_T1_Timesheet_ReadforExport_withno  set positioncode='" + ps + "',EmployeeId='" + eid + "', Activity='" + at + "' , EntryType='" + et + "' ,PayComponentCode ='" + pc + "', SelectionCode1='" + sc1 + "' where lno ='" + t_no + "' ";
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