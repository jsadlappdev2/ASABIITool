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

            string ComCareTimesheetServerFolder2 = ConfigurationManager.AppSettings["ComCareTimesheetServerFolder"].ToString();
            Label10.Text = ComCareTimesheetServerFolder2.Replace(@"\\",@"\");

            Button5.Enabled = false;
         
        } 
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        GridView2.Visible = false;
        Label9.Visible = false;

        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = "";


        if (DropDownList1.SelectedItem.Text == "--Please select a pay period--")
        {

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select a Pay Period!')</script>");
            DropDownList1.Focus();

        }
        else
        {
            if (FileUpload1.HasFile)
            {
              try
                {
                    string SSIS_UploadFolder = ConfigurationManager.AppSettings["SSIS_UploadFolder_CIM"].ToString();
                    //upload package file to web server
                    TextBox3.Text = logtime + "Upload ComCare timesheet file to server...\r\n";
                   // string fileName = Path.Combine(Server.MapPath("~/Upload"), FileUpload1.FileName);
                  //  FileUpload1.SaveAs("\\\\clank\\COMCARETEST\\CCToCIM\\Upload\\" + FileUpload1.FileName);
                    string ComCareTimesheetUpload = ConfigurationManager.AppSettings["ComCareTimesheetUpload-Stage"].ToString();
                    FileUpload1.SaveAs(ComCareTimesheetUpload + FileUpload1.FileName);         
                   
                    TextBox3.Text = TextBox3.Text + logtime + "Upload timesheet file to server successfully.\r\n";
                    // Instantiate SSIS application object
                    Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                    string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "LoadComCareTemesheet.dtsx");
                    // TextBox3.Text = TextBox3.Text+logtime + "Loading import package from file system...\r\n";
                    string fileName2 = fileName3.Replace(@"\", @"\\");
                    //string SSISLocation = "C:\\SSIS\\KyperaToTechone_TF.dtsx";
                    Package myPackage = myApplication.LoadPackage(@fileName2, null);
                    myPackage.Variables["LoadFolder"].Value = SSIS_UploadFolder;
                    // TextBox3.Text = TextBox3.Text + logtime + "Loading import package paramter name and value...\r\n"; 
                    // myPackage.Variables[TextBox1.Text].Value = TextBox2.Text;
                    // Execute package
                    TextBox3.Text = TextBox3.Text + logtime + "Starting loading timesheet file into data warehouse table...\r\n";
                    ShowProcessBar();
                    DTSExecResult myResult = myPackage.Execute();
                    // Show the execution result
                    TextBox3.Text = TextBox3.Text + logtime + "Loading result: " + myResult.ToString() + " \r\n";
                    System.Threading.Thread.Sleep(2000);
                    ExitProcessBar();
                    TextBox3.Text = TextBox3.Text + "  =========Begin check the result========\r\n";
                    //check records in csv and database table
                    //check csv files
                    int ft_csv = 0;
                    //手工指定 csv文件所在路径，需要修改
                    // string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Jerry Shen\\ASPnet\\ASABIITool - Dev2\\Upload';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
                   // string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='\\\\clank\\COMCARETEST\\CCToCIM\\Upload';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
                    string ComCareTimesheetUpload_csv = ConfigurationManager.AppSettings["ComCareTimesheetUpload-csv"].ToString();
                    string strConn = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='text;HDR=Yes;FMT=Delimited'", ComCareTimesheetUpload_csv);  //连接数据。  Data Source为CSV文件存在的目录
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
                        string sqlstr = "SELECT count(*) from asadwh.dbo.CC_Timesheetfile_import  where p_orders=1 ";

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
                        //move file to archive
                        TextBox3.Text = TextBox3.Text + logtime + "Start to move the timsheet file to archive folder.... \r\n";
                        string fileNameSer = "CURRENT_PA_EXPORT.csv";



                        string dateString = DateTime.Now.ToLocalTime().ToString();
                        string dateString1 = dateString.Replace("/", "");
                        string dateString2 = dateString1.Replace(" ", "");
                        string dateString3 = dateString2.Replace(":", "");

                        string filenameDes = "CURRENT_PA_EXPORT" + dateString3 + ".csv";

                        string ComCareTimesheetServerFolder = ConfigurationManager.AppSettings["ComCareTimesheetServerFolder"].ToString();
                        string ComCareTimesheetServerArchiveFolder = ConfigurationManager.AppSettings["ComCareTimesheetServerArchiveFolder"].ToString();

                       // string sourcePath = @"\\\\clank\\comcaretest\\Payroll";
                       // string targetPath = @"\\\\clank\\comcaretest\\Payroll\\Archive";
                        string sourcePath = @ComCareTimesheetServerFolder;
                        string targetPath = @ComCareTimesheetServerArchiveFolder;
                        // Use Path class to manipulate file and directory paths.
                        string sourceFile = System.IO.Path.Combine(sourcePath, fileNameSer);
                        string destFile = System.IO.Path.Combine(targetPath, filenameDes);

                        // To copy a file to another location and 
                        // overwrite the destination file if it already exists.
                        try
                        {
                            System.IO.File.Copy(sourceFile, destFile, true);
                            //delete from origial file
                            try
                            {
                                System.IO.File.Delete(sourceFile);
                                TextBox3.Text = TextBox3.Text + logtime + "Finish moving the timsheet file to archive folder....";

                                Button5.Enabled = true;
                            }
                            catch (Exception e3)
                            {
                                TextBox3.Text = TextBox3.Text + logtime + "#Delete file fail and ERROR is: # " + e3.Message + " .Please try again!";
                            }

                        }
                        catch (Exception eeee)
                        {

                            TextBox3.Text = TextBox3.Text + logtime + "#Move file fail and ERROR is: # " + eeee.Message + " .Please try again!";

                        }



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
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox3.Text = "";
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
            TextBox3.Text = logtime + " == Begin to process and analysis the timesheet data == \r\n";
            TextBox3.Text = TextBox3.Text + logtime + " == Need some time, please wait ...... == \r\n";
            System.Threading.Thread.Sleep(2000);
            ShowProcessBar();
            //execute sp to do data process
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand("P_ComCare_Timesheet_ToCIM_New", connsql);
            Cmd.CommandTimeout = 0;
            Cmd.CommandType = CommandType.StoredProcedure;

            Cmd.Parameters.Add("@P_StartDay", SqlDbType.VarChar, 10).Value = DropDownList1.SelectedValue.ToString();
           // Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar, 10).Value = "2015-08-16".ToString();
            try
            {

                Cmd.ExecuteNonQuery();
                TextBox3.Text = TextBox3.Text + logtime + " == Data Process successfully! == \r\n";
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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
    protected void Button5_Click1(object sender, EventArgs e)
    {
        GridView2.Visible = false;
        Label9.Visible = false;

        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = "";


        if (DropDownList1.SelectedItem.Text == "--Please select a pay period--")
        {

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select a Pay Period!')</script>");
            DropDownList1.Focus();

        }
        else
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string SSIS_UploadFolder = ConfigurationManager.AppSettings["SSIS_UploadFolder_CIM"].ToString();
                    //upload package file to web server
                    TextBox3.Text = logtime + "Start to load the second file...\r\n";
                    TextBox3.Text = logtime + "Upload the second ComCare timesheet file to server...\r\n";
                    // string fileName = Path.Combine(Server.MapPath("~/Upload"), FileUpload1.FileName);
                    //  FileUpload1.SaveAs("\\\\clank\\COMCARETEST\\CCToCIM\\Upload\\" + FileUpload1.FileName);
                    string ComCareTimesheetUpload = ConfigurationManager.AppSettings["ComCareTimesheetUpload-Stage"].ToString();
                    FileUpload1.SaveAs(ComCareTimesheetUpload + FileUpload1.FileName);

                    TextBox3.Text = TextBox3.Text + logtime + "Upload the second timesheet file to server successfully.\r\n";
                    // Instantiate SSIS application object
                    Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                    string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "LoadComCareTemesheet_SecondFile.dtsx");
                    // TextBox3.Text = TextBox3.Text+logtime + "Loading import package from file system...\r\n";
                    string fileName2 = fileName3.Replace(@"\", @"\\");
                    //string SSISLocation = "C:\\SSIS\\KyperaToTechone_TF.dtsx";
                    Package myPackage = myApplication.LoadPackage(@fileName2, null);
                    myPackage.Variables["LoadFolder"].Value = SSIS_UploadFolder;
                    // TextBox3.Text = TextBox3.Text + logtime + "Loading import package paramter name and value...\r\n"; 
                    // myPackage.Variables[TextBox1.Text].Value = TextBox2.Text;
                    // Execute package
                    TextBox3.Text = TextBox3.Text + logtime + "Starting loading the second timesheet file into data warehouse table...\r\n";
                    ShowProcessBar();
                    DTSExecResult myResult = myPackage.Execute();
                    // Show the execution result
                    TextBox3.Text = TextBox3.Text + logtime + "Loading result: " + myResult.ToString() + " \r\n";
                    System.Threading.Thread.Sleep(2000);
                    ExitProcessBar();
                    TextBox3.Text = TextBox3.Text + "  =========Begin check the result========\r\n";
                    //check records in csv and database table
                    //check csv files
                    int ft_csv = 0;
                    //手工指定 csv文件所在路径，需要修改
                    // string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Jerry Shen\\ASPnet\\ASABIITool - Dev2\\Upload';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
                    // string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='\\\\clank\\COMCARETEST\\CCToCIM\\Upload';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
                    string ComCareTimesheetUpload_csv = ConfigurationManager.AppSettings["ComCareTimesheetUpload-csv"].ToString();
                    string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='text;HDR=Yes;FMT=Delimited'", ComCareTimesheetUpload_csv);  //连接数据。  Data Source为CSV文件存在的目录
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
                        string sqlstr = "SELECT count(*) from asadwh.dbo.CC_Timesheetfile_import where p_orders=2  ";

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





                    TextBox3.Text = TextBox3.Text + "  =========Import the second Timsheet File Conclusion========= \r\n";
                    if (ft_db == ft_csv)
                    {
                        TextBox3.Text = TextBox3.Text + "[GOOD!]the second Timesheet file records in CSV is the same with the ones got from database query \r\n";
                        //move file to archive
                        TextBox3.Text = TextBox3.Text + logtime + "Start to move the second timsheet file to archive folder.... \r\n";
                        string fileNameSer = "CURRENT_PA_EXPORT.csv";



                        string dateString = DateTime.Now.ToLocalTime().ToString();
                        string dateString1 = dateString.Replace("/", "");
                        string dateString2 = dateString1.Replace(" ", "");
                        string dateString3 = dateString2.Replace(":", "");

                        string filenameDes = "CURRENT_PA_EXPORT" + dateString3 + ".csv";

                        string ComCareTimesheetServerFolder = ConfigurationManager.AppSettings["ComCareTimesheetServerFolder"].ToString();
                        string ComCareTimesheetServerArchiveFolder = ConfigurationManager.AppSettings["ComCareTimesheetServerArchiveFolder"].ToString();

                        // string sourcePath = @"\\\\clank\\comcaretest\\Payroll";
                        // string targetPath = @"\\\\clank\\comcaretest\\Payroll\\Archive";
                        string sourcePath = @ComCareTimesheetServerFolder;
                        string targetPath = @ComCareTimesheetServerArchiveFolder;
                        // Use Path class to manipulate file and directory paths.
                        string sourceFile = System.IO.Path.Combine(sourcePath, fileNameSer);
                        string destFile = System.IO.Path.Combine(targetPath, filenameDes);

                        // To copy a file to another location and 
                        // overwrite the destination file if it already exists.
                        try
                        {
                            System.IO.File.Copy(sourceFile, destFile, true);
                            //delete from origial file
                            try
                            {
                                System.IO.File.Delete(sourceFile);
                                TextBox3.Text = TextBox3.Text + logtime + "Finish moving the second timsheet file to archive folder....";

                                Button5.Enabled = true;
                            }
                            catch (Exception e3)
                            {
                                TextBox3.Text = TextBox3.Text + logtime + "#Delete file fail and ERROR is: # " + e3.Message + " .Please try again!";
                            }

                        }
                        catch (Exception eeee)
                        {

                            TextBox3.Text = TextBox3.Text + logtime + "#Move file fail and ERROR is: # " + eeee.Message + " .Please try again!";

                        }



                    }
                    else
                    {
                        TextBox3.Text = TextBox3.Text + "[OOPS!]the second Timesheet file records in CSV is not the same with the ones got from database query. Please check! \r\n";
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
    }
}

