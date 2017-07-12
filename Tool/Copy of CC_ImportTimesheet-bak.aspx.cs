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




public partial class Web_DepartmentManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GridView1.Visible = false;
        } 
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = "";
        
        if (FileUpload1.HasFile)
        {





            try
            {
                //upload package file to web server
                TextBox3.Text = logtime + "Upload ComCare timesheet file to server...\r\n";
                string fileName = Path.Combine(Server.MapPath("~/Upload"), FileUpload1.FileName);
                FileUpload1.SaveAs(fileName);
                TextBox3.Text = TextBox3.Text + logtime + "Upload timesheet file to server successfully.\r\n";
                // Instantiate SSIS application object
                Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "LoadComCareTemesheet.dtsx");
                // TextBox3.Text = TextBox3.Text+logtime + "Loading import package from file system...\r\n";
                string fileName2 = fileName3.Replace(@"\", @"\\");
                //string SSISLocation = "C:\\SSIS\\KyperaToTechone_TF.dtsx";
                Package myPackage = myApplication.LoadPackage(@fileName2, null);
                // TextBox3.Text = TextBox3.Text + logtime + "Loading import package paramter name and value...\r\n"; 
                // myPackage.Variables[TextBox1.Text].Value = TextBox2.Text;
                // Execute package
                TextBox3.Text = TextBox3.Text + logtime + "Starting loading timesheet file into data warehouse table...\r\n";
                DTSExecResult myResult = myPackage.Execute();
                // Show the execution result
                TextBox3.Text = TextBox3.Text + logtime + "Loading result: " + myResult.ToString() + " \r\n";
                TextBox3.Text = TextBox3.Text + "  =========Begin check the result========\r\n";
                //check records in csv and database table
                //check csv files
                int ft_csv = 0;
                //手工指定 csv文件所在路径，需要修改
               // string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\ASABIITool - Dev\\Upload';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
                string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\Jerry Shen\\ASPnet\\ASABIITool - Dev2\\Upload';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
                OleDbConnection conn = new OleDbConnection(strConn);
                OleDbCommand comm1 = new OleDbCommand("select count(*) from [CURRENT_PA_EXPORT.csv]", conn);
                try
                {
                    conn.Open();
                    ft_csv = (int)comm1.ExecuteScalar();

                    TextBox3.Text = TextBox3.Text + " == Begin to check results from Timesheet CSV files == \r\n";
                    TextBox3.Text = TextBox3.Text + " Total records in CURRENT_PA_EXPORT.csv is :" + ft_csv.ToString() + " \r\n";
                    TextBox3.Text = TextBox3.Text + " == Check CSV files finished == \r\n";
                }
                catch (Exception ee)
                {
                    TextBox3.Text = TextBox3.Text + " == Begin to check results from Timesheet CSV files == \r\n";
                    TextBox3.Text = TextBox3.Text + "#Read CSV File ERROR# " + ee.Message + " .Please try again!\r\n";
                }
                finally
                {
                    conn.Close();
                }



                //check records in database querey
                int ft_db = 0;
                string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
                SqlConnection connsql = new SqlConnection(connStr);
                try
                {
                    TextBox3.Text = TextBox3.Text + "\r\n";
                    TextBox3.Text = TextBox3.Text + " == Begin to check records using database query == \r\n";

                    if (connsql.State.ToString() == "Closed") connsql.Open();
                    //check financil transaction data  (most types)         
                    string sqlstr = "SELECT count(*) from asadwh.dbo.CC_Timesheetfile_import  ";

                    SqlCommand Cmd = new SqlCommand(sqlstr, connsql);
                    ft_db = (int)Cmd.ExecuteScalar();
                    TextBox3.Text = TextBox3.Text + "Total records in CC_Timesheetfile_import is  :" + ft_db.ToString() + " \r\n";
                    TextBox3.Text = TextBox3.Text + " == Check database table finished == \r\n";


                }

                catch (Exception eee)
                {

                    TextBox3.Text = "#Query From Database ERROR# " + eee.Message + " .Please try again!";
                }
                finally
                {
                    connsql.Close();
                }


                TextBox3.Text = TextBox3.Text + "  =========Import Timsheet File Conclusion========= \r\n";
                if (ft_db == ft_csv)
                {
                    TextBox3.Text = TextBox3.Text + "[GOOD!]the Timesheet file records in CSV is the same with the ones got from database query \r\n";
                }
                else
                {
                    TextBox3.Text = TextBox3.Text + "[OOPS!]the Timesheet file records in CSV is not the same with the ones got from database query. Please check! \r\n";
                }


                GridView1.Visible = true;
                GridView1.DataBind();

            }
            catch (Exception ee)
            {
                TextBox3.Text = logtime + "Loading fail and Erros is: " + ee.Message + " \r\n";
            }

            
        }
                  
            
       else
         {
                ClientScript.RegisterStartupScript(this.GetType(), "SystemMessage", "alert('" + "Please select a timesheet file !" + "');", true);
                FileUpload1.Focus();
         }
                     

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox3.Text = "";
    }

   
    protected void Button4_Click1(object sender, EventArgs e)
    {
       
    }
}

