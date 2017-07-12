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
using System.Data.SqlClient;
using System.IO;
using Microsoft.SqlServer.Dts.Runtime;
using System.Data.OleDb;
using System.Net;



public partial class Web_DepartmentManage : System.Web.UI.Page
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




    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    { 
        
            TextBox3.Text = "";
            string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";

        if (DropDownList1.SelectedItem.Text == "--Please select a pay period--")
        {

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select a Pay Period!')</script>");
            DropDownList1.Focus();

        }
        else
        {

            // check records number in dwh table
            string checkdwhsql = "";
            if (DropDownList2.SelectedItem.Value == "c1")
            {
                checkdwhsql = "select * from CC_T1_Timesheetfile_import_stage";
            }
            else
            {
                checkdwhsql = "select * from  CC_Timesheetfile_import_new";
            }
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand(checkdwhsql, connsql);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = Cmd;
            sda.Fill(dt);
            TextBox3.Text = TextBox3.Text + logtime + "RN2 - Records Number in DWH table is #" + dt.Rows.Count.ToString() +"# \r\n";
            // check comcare database acitivty_work_table
            string startdate = DropDownList1.SelectedItem.Value;
            string ccsql="";
             ccsql=" select provider_id ";
             ccsql+="from";
             ccsql+="( ";
             ccsql+="select provider_id, activity_date,activity_start_time,activity_end_time,Group_Activity_ID,client_id ";
             ccsql+="from [appsql-3\\comcareprod].comcareprod.dbo.activity_work_table  ";
             ccsql += "where activity_date >=(select convert(datetime,'" + startdate + "') ) ";
             ccsql += "and activity_date <=(select dateadd(day,13,convert(datetime,'" + startdate + "'))) ";
             ccsql+="and authorisation_date is not null  ";
             ccsql+="and date_extract_for_payroll is not null  ";
             ccsql+="and provider_id in (select provider_id from [appsql-3\\comcareprod].comcareprod.dbo.provider_contract where provider_contract_type_code =1) ";
             ccsql+="except ";
               //Do not export to payroll the group activities for clients, but need to upload for reporting
             ccsql+="select provider_id, activity_date,activity_start_time,activity_end_time,Group_Activity_ID,client_id ";
             ccsql+="from [appsql-3\\comcareprod].comcareprod.dbo.activity_work_table ";
             ccsql += "where activity_date >=(select convert(datetime,'"+startdate+"') ) ";
             ccsql += "and activity_date <=(select dateadd(day,13,convert(datetime,'" + startdate + "')))";
             ccsql+="and authorisation_date is not null  ";
             ccsql+="and date_extract_for_payroll is not null  ";
             ccsql+="and provider_id in (select provider_id from [appsql-3\\comcareprod].comcareprod.dbo.provider_contract where provider_contract_type_code =1) ";
             ccsql+="and Group_Activity_ID is not null and client_id is not null ";
             ccsql+=") as t1 ";
             string connStr2 = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
             SqlConnection connsql2 = new SqlConnection(connStr2);
             if (connsql2.State.ToString() == "Closed") connsql2.Open();
             SqlCommand Cmd2 = new SqlCommand(ccsql, connsql2);
             DataTable dt2 = new DataTable();
             SqlDataAdapter sda2 = new SqlDataAdapter();
             sda2.SelectCommand = Cmd2;
             sda2.Fill(dt2);
             TextBox3.Text = TextBox3.Text + logtime + "RN1 - Records Number in ComCare table is #" + dt2.Rows.Count.ToString() + "# \r\n";

        }
    }
}

