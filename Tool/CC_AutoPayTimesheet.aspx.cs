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
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.Data;
using System.Net;



public partial class Web_DepartmentManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            Label9.Visible = false;

            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            connsql.Open();
            //string sqlstr = " select '' as startday,'' as endday,'--Please select a pay period--' as payperiod union select cast(startday as varchar),cast(endday as varchar),cast(startday as varchar)+' To '+cast(endday as varchar)  as payperiod from [ASADWH].[dbo].[CC_Payperiod] order by startday asc  ";
            string sqlstr = " select '' as startday,'' as endday,'--Please select a pay period--' as payperiod union select cast(startday as varchar),cast(endday as varchar),substring(cast(startday as varchar),9,2)+'/'+substring(cast(startday as varchar),6,2)+'/'+substring(cast(startday as varchar),1,4)+' - '+substring(cast(endday as varchar),9,2)+'/'+substring(cast(endday as varchar),6,2)+'/'+substring(cast(endday as varchar),1,4)  as payperiod from [ASADWH].[dbo].[CC_Payperiod] order by startday asc   ";
            SqlCommand Cmd = new SqlCommand(sqlstr, connsql);
            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connsql);
            DataSet ds = new DataSet();
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

   


   
   
 
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "--Please select a pay period--")
        {

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select a Pay Period!')</script>");  
            DropDownList1.Focus();
        
        }
        else
        {

            GridView1.Visible = false;
            string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
            TextBox3.Text = "";
            TextBox3.Text = logtime + " == Begin to process and analysis the Autopay provider timesheet data == \r\n";
            TextBox3.Text = TextBox3.Text + logtime + " == Need some time, please wait ...... == \r\n";
            System.Threading.Thread.Sleep(2000);
            ShowProcessBar();
            //execute sp to do data process
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand("P_ComCare_AutoPay_New", connsql);
            Cmd.CommandTimeout = 0;
            Cmd.CommandType = CommandType.StoredProcedure;

            Cmd.Parameters.Add("@P_StartDay", SqlDbType.VarChar, 10).Value = DropDownList1.SelectedValue.ToString();
            //   Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar,10).Value = "2015-08-16".ToString();
            try
            {

                Cmd.ExecuteNonQuery();
                TextBox3.Text = TextBox3.Text + logtime + " == Data Process successfully! == \r\n";
                GridView1.Visible = true;
                GridView1.DataBind();
                GridView2.Visible = true;
                GridView2.DataBind();
                Label9.Visible = true;
                Label9.Text = "Data Process successfully!";
            }
            catch (Exception eee)
            {
                TextBox3.Text = TextBox3.Text + logtime + " == Data Process fial! [ERROR: " + eee.Message + "] == \r\n";
                Label9.Visible = true;
                Label9.Text = "Data Process fail!";
            }
            finally
            {
                connsql.Close();
            }

            System.Threading.Thread.Sleep(500);
            ExitProcessBar();
        }
    }


    protected void ShowProcessBar()
    {

        string templateFileName = Path.Combine(Server.MapPath("."), "ProcessStatusBar.html");
        StreamReader reader = new StreamReader(@templateFileName, System.Text.Encoding.GetEncoding("gb2312"));
        string html = reader.ReadToEnd();
        reader.Close();
        Response.Write(html);
        Response.Flush();
        System.Threading.Thread.Sleep(200);


        string jsBlock;
        for (int i = 1; i <= 100; i++)
        {
            System.Threading.Thread.Sleep(20);
            jsBlock = "<script>SetPorgressBar('" + "A" + i.ToString() + "','" + i.ToString() + "'); </script>";

            Response.Write(jsBlock);
            Response.Flush();
        }

    }


    protected void ExitProcessBar()
    {

        string jsBlock;
        jsBlock = "<script>SetCompleted(); </script>";
        Response.Write(jsBlock);
        Response.Flush();

    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox3.Text = "";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

