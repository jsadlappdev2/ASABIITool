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

public partial class Tool_ValidateCCImportOriginalTimesheetReferenceRpt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            connsql.Open();
            //string sqlstr = " select '' as startday,'' as endday,'--Please select a pay period--' as payperiod union select cast(startday as varchar),cast(endday as varchar),cast(startday as varchar)+' To '+cast(endday as varchar)  as payperiod from [ASADWH].[dbo].[CC_Payperiod] order by startday asc  ";
            string sqlstr = " select '' as startday,'' as endday,'--Please select a pay period--' as payperiod union select cast(startday as varchar),cast(endday as varchar),substring(cast(startday as varchar),9,2)+'/'+substring(cast(startday as varchar),6,2)+'/'+substring(cast(startday as varchar),1,4)+' - '+substring(cast(endday as varchar),9,2)+'/'+substring(cast(endday as varchar),6,2)+'/'+substring(cast(endday as varchar),1,4)  as payperiod from [ASADWH].[dbo].[CC_Payperiod] order by startday asc   ";
            SqlCommand Cmd = new SqlCommand(sqlstr, connsql);
            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connsql);
            DataSet ds = new DataSet();
            connsql.Close();
            da.Fill(ds);
            if (!IsPostBack)
            {
                DropDownList1.Enabled = true;
                DropDownList1.DataSource = ds;
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "payperiod";
                DropDownList1.DataValueField = "startday";
                DropDownList1.DataBind();
            }
            connsql.Close();
            DropDownList1.SelectedIndexChanged += new System.EventHandler(this.DropDownList1_SelectedIndexChanged);
        }
    }

    protected void GridViewBind()
    {

        string sql = "select Provider_ID,convert(date,[Activity_Date],103) as Activity_Date,convert(time,[Activity_Start_Time] ) as Activity_Start_Time,convert(time,[Activity_End_Time] ) as Activity_End_Time,Activity_Duration,Travel_Km,Task_Type_Code,Indirect_Activity_Type_code,Funding_Prog_Code,Classn_Shift_Centre";
        sql += "from [appsql-3\\comcareprod].[comcareprod].dbo.[activity_work_table]  where provider_id ='" + TextBox1.Text + "' ";
        sql += "and CONVERT(DATE,[Activity Start Date],103)>='" + DropDownList1.SelectedValue.ToString() + "' ";
        sql += "and CONVERT(DATE,[Activity Start Date],103)<= ((select cast(EndDay as varchar) from CC_Payperiod where cast(startday as varchar) ='" + DropDownList1.SelectedValue.ToString() + "'))";
        sql += "order by [Activity_Date], [Activity_Start_Time] asc";
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





    }

    protected void Button1_Click(object sender, EventArgs e)
    {


    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {


    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }





    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        //get data from activity_work_table
        string sql = "select Provider_ID,convert(varchar,convert(date,[Activity_Date],103))  as Activity_Date,left(convert(varchar,convert(time,[Activity_Start_Time] )),5) as Activity_Start_Time,left(convert(varchar,convert(time,[Activity_End_Time] )),5) as Activity_End_Time,Activity_Duration,Travel_Km,Task_Type_Code,Indirect_Activity_Type_code,Funding_Prog_Code,Classn_Shift_Centre";
        sql += " from [appsql-3\\comcareprod].[comcareprod].dbo.[activity_work_table] where provider_id ='" + TextBox1.Text + "' ";
        sql += " and CONVERT(DATE,[Activity_Date],103)>='" + DropDownList1.SelectedValue.ToString() + "' ";
        sql += " and CONVERT(DATE,[Activity_Date],103)<= ((select cast(EndDay as varchar) from CC_Payperiod where cast(startday as varchar) ='" + DropDownList1.SelectedValue.ToString() + "'))";
        sql += " order by [Activity_Date], [Activity_Start_Time] asc";
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
        connsql.Close();

        //get data from wi_activity table
        string sql2 = "select a.provider_id, convert(varchar,convert(date,[Activity_Date],103)) as Activity_Date,a.Schedule_time,a.schedule_duration,b.generated_provider_code from [appsql-3\\comcareprod].[comcareprod].dbo.[WI_Activity] as a left join [appsql-3\\comcareprod].[comcareprod].dbo.Service_Provision_Position  as b on a.sppid=b.Service_Prov_Position_ID";
        sql2 += " where a.provider_id ='" + TextBox1.Text + "' and CONVERT(DATE,[Activity_Date],103)>='" + DropDownList1.SelectedValue.ToString() + "' ";
        sql2 += " and CONVERT(DATE,[Activity_Date],103)<= ((select cast(EndDay as varchar) from CC_Payperiod where cast(startday as varchar) ='" + DropDownList1.SelectedValue.ToString() + "')) and a.event_type='12' order by [Activity_Date],Schedule_time asc ";
        string connStr2 = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql2 = new SqlConnection(connStr2);
        if (connsql2.State.ToString() == "Closed") connsql2.Open();
        SqlCommand Cmd2 = new SqlCommand(sql2, connsql2);
        DataTable dt2 = new DataTable();
        SqlDataAdapter sda2 = new SqlDataAdapter();
        sda2.SelectCommand = Cmd2;
        sda2.Fill(dt2);
        GridView2.DataSource = dt2;
        GridView2.DataBind();
        connsql2.Close();



        //get data from payroll_funding_code
        string sql3 = "select payroll_funding_code,provider_class_code, task_type_code,indirect_activity_type_code  ";
        sql3 += " from [appsql-3\\comcareprod].[comcareprod].dbo.Funding_For_Payroll where payroll_funding_code is not null order by task_type_code,indirect_activity_type_code ";

        string connStr3 = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsql3 = new SqlConnection(connStr3);
        if (connsql3.State.ToString() == "Closed") connsql3.Open();
        SqlCommand Cmd3 = new SqlCommand(sql3, connsql3);
        DataTable dt3 = new DataTable();
        SqlDataAdapter sda3 = new SqlDataAdapter();
        sda3.SelectCommand = Cmd3;
        sda3.Fill(dt3);
        GridView3.DataSource = dt3;
        GridView3.DataBind();
        connsql3.Close();
    }
}