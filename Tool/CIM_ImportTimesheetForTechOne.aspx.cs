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

            string ComCareTimesheetServerFolder2 = ConfigurationManager.AppSettings["CIMtoT1"].ToString();
            Label10.Text = ComCareTimesheetServerFolder2;

            
        } 
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        TextBox3.Text = "";
        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        string payperiod = DropDownList1.SelectedItem.Text;
        string startday = payperiod.Substring(0, 2) + payperiod.Substring(3, 2) + payperiod.Substring(8, 2);
        string endday = payperiod.Substring(13, 2) + payperiod.Substring(16, 2) + payperiod.Substring(21, 2);
        string TimesheetServerFolder = ConfigurationManager.AppSettings["CIMtoT1"].ToString();

       

        DirectoryInfo d = new DirectoryInfo(@TimesheetServerFolder);
        FileInfo[] Files = d.GetFiles("CIMT1_*.csv");

        execute_load_SSIS_package();

       // }
        
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

            TextBox3.Text = "";
            string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
            //update TechOne employe postion table : 
            string T1ToComCareEmployeePosition = ConfigurationManager.AppSettings["T1ToComCareEmployeePosition"].ToString();
            // Instantiate SSIS application object
            Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
            string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "LoadT1EmployePosition.dtsx");
            Package myPackage = myApplication.LoadPackage(@fileName3, null);
            myPackage.Variables["T1ServerFolder"].Value = T1ToComCareEmployeePosition;
            TextBox3.Text = TextBox3.Text + logtime + " == Starting updating TechOne employee position data...==\r\n";
            DTSExecResult myResult = myPackage.Execute();
            TextBox3.Text = TextBox3.Text + logtime + " == Updating result: " + myResult.ToString() + " == \r\n";
            TextBox3.Text = TextBox3.Text + " ********** If Updating fail, please contact System Admin to check! ********** \r\n";
            TextBox3.Text = TextBox3.Text + logtime + "  \r\n";

           // TextBox3.Text = "";
            TextBox3.Text = TextBox3.Text+logtime + " == Begin to process and analysis the timesheet data == \r\n";
            TextBox3.Text = TextBox3.Text + logtime + " == Need some time, please wait ...... == \r\n";
            System.Threading.Thread.Sleep(2000);
            ShowProcessBar();
            //execute sp to do data process
            string connStr = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand("P_CIM_Timesheet_ForT1", connsql);
            Cmd.CommandTimeout = 0;
            Cmd.CommandType = CommandType.StoredProcedure;

            Cmd.Parameters.Add("@P_StartDay", SqlDbType.VarChar, 10).Value = DropDownList1.SelectedValue.ToString();
           // Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar, 10).Value = "2015-08-16".ToString();
            try
            {

                Cmd.ExecuteNonQuery();
                TextBox3.Text = TextBox3.Text + logtime + " == Data Process successfully! == \r\n";
               // GridView2.Visible = true;
               // GridView2.DataBind();
                //get all the records
                Int32 newRecordCount = 0;
                string connStrall = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
                SqlConnection connsqlall = new SqlConnection(connStrall);
                if (connsqlall.State.ToString() == "Closed") connsqlall.Open();
                SqlCommand Cmdall = new SqlCommand("select count(*) from CIM_T1_CC_T1_Timesheet_ReadforExport_withno", connsqlall);
                newRecordCount = (Int32)Cmdall.ExecuteScalar();

                Label9.Visible = true;
                Label9.Text = "Data Process successfully! There are total # " + newRecordCount.ToString() + " # lines which will be exported.";

                if (newRecordCount < 2000)
                { TextBox4.Text = newRecordCount.ToString(); }
                else
                {
                    TextBox4.Text = (newRecordCount / 5).ToString();
                }
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
   
    protected void Button6_Click(object sender, EventArgs e)
    {
         string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = "";


        if (DropDownList1.SelectedItem.Text == "--Please select a pay period--")
        {

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select a Pay Period!')</script>");
            DropDownList1.Focus();

        }
        else
        {

            string payperiod = DropDownList1.SelectedItem.Text;
            string startday = payperiod.Substring(0, 2)+ payperiod.Substring(3,2)+payperiod.Substring(8,2);
            string endday = payperiod.Substring(13, 2) + payperiod.Substring(16, 2) + payperiod.Substring(21, 2);
            string TimesheetServerFolder = ConfigurationManager.AppSettings["CIMtoT1"].ToString();

            TextBox3.Text = logtime + " == Start to search all CIM files on the server folder for the selected pay period == \r\n";
            TextBox3.Text = TextBox3.Text + logtime + "The CIM timesheet files for " + payperiod + " include: \r\n";

            DirectoryInfo d = new DirectoryInfo(@TimesheetServerFolder);
            FileInfo[] Files = d.GetFiles("CIMT1*.csv"); 
            //string str = "";
            foreach (FileInfo file in Files)
            {
                //str = str + ", " + file.Name.Substring(28,6);
               
                    TextBox3.Text = TextBox3.Text + logtime + file.Name + "\r\n";
                
              
                
            }

                    

            TextBox3.Text = TextBox3.Text + logtime + "== Finish searching! If it is ok, you can do Step2 now== \r\n";
        }
    }

    public void execute_load_SSIS_package()
    {

        GridView2.Visible = false;
        Label9.Visible = false;

        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        //TextBox3.Text = "";


        if (DropDownList1.SelectedItem.Text == "--Please select a pay period--")
        {

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select a Pay Period!')</script>");
            DropDownList1.Focus();

        }
        else
        {

            try
            {
                string fileserverfolder = ConfigurationManager.AppSettings["CIMtoT1"].ToString();              
                // Instantiate SSIS application object
                Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "LoadCIMTimesheetforallfiles_for T1.dtsx");
                // TextBox3.Text = TextBox3.Text+logtime + "Loading import package from file system...\r\n";
                 //string SSISLocation = "C:\\SSIS\\KyperaToTechone_TF.dtsx";
                Package myPackage = myApplication.LoadPackage(@fileName3, null);          

                TextBox3.Text = TextBox3.Text + logtime + "Starting loading  CIM timesheet files into data warehouse table...\r\n";
                ShowProcessBar();
                DTSExecResult myResult = myPackage.Execute();
                // Show the execution result
                TextBox3.Text = TextBox3.Text + logtime + "Loading result: " + myResult.ToString() + " \r\n";
                System.Threading.Thread.Sleep(2000);
                ExitProcessBar();
               



            }
            catch (Exception ee)
            {
                TextBox3.Text = logtime + "Loading fail and Erros is: " + ee.Message + " \r\n";
            }



        }
    
    
    
    
    
    
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        TextBox3.Text = "";
        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = TextBox3.Text + logtime + " Start to export CIM timesheet for T1 CiAnywhere...\r\n";
        //invoke ssis package to export
        string fileserverfolder = ConfigurationManager.AppSettings["CIMtoT1Export"].ToString();
        // Instantiate SSIS application object
        Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
        string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "CIMTimesheetToT1Cianywhere .dtsx");
        // TextBox3.Text = TextBox3.Text+logtime + "Loading import package from file system...\r\n";
        Package myPackage = myApplication.LoadPackage(@fileName3, null);
        myPackage.Variables["filefolder"].Value = fileserverfolder;

        TextBox3.Text = TextBox3.Text + logtime + " Starting to export CIM timesheet data to file: " + fileserverfolder + "...\r\n";
        ShowProcessBar();
        DTSExecResult myResult = myPackage.Execute();
        // Show the execution result
        TextBox3.Text = TextBox3.Text + logtime + " Export result: " + myResult.ToString() + " \r\n";
        TextBox3.Text = TextBox3.Text + logtime + " Finish exporting CIM timesheet for Techone CiAnywhere.\r\n";
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Int32 newRecordCount = 0;
        string connStrall = ConfigurationManager.ConnectionStrings["ASADWHConnectionString"].ConnectionString;
        SqlConnection connsqlall = new SqlConnection(connStrall);
        if (connsqlall.State.ToString() == "Closed") connsqlall.Open();
        SqlCommand Cmdall = new SqlCommand("select count(*) from CIM_T1_CC_T1_Timesheet_ReadforExport_withno", connsqlall);
        newRecordCount = (Int32)Cmdall.ExecuteScalar(); //total record;
        string lineperfile = TextBox4.Text.ToString();  //lines in one file
        double filenumber = (float)newRecordCount / Convert.ToInt32(lineperfile);
        Int32 Filenumber = (Int32)Math.Ceiling(filenumber); // file numbers
        // TextBox3.Text = newRecordCount.ToString() + " \r\n";
        // TextBox3.Text = TextBox3.Text + filenumber.ToString() + " \r\n";
        // TextBox3.Text = TextBox3.Text + Filenumber.ToString();



        TextBox3.Text = "";
        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = TextBox3.Text + logtime + " Start to export timesheet for Techone CiAnywhere ...\r\n";
        TextBox3.Text = TextBox3.Text + logtime + " -----Please note it will export into SEVERAL files-----\r\n";
        string fileserverfolder = ConfigurationManager.AppSettings["CIMToT1Manyfiles"].ToString();
        TextBox3.Text = TextBox3.Text + logtime + " -----Server Folder: " + fileserverfolder + "-----\r\n";

        //delete all the existing files
        DirectoryInfo d = new DirectoryInfo(@fileserverfolder);
        FileInfo[] Files = d.GetFiles("CIMToT1CIAnywhereTimesheetFile*.csv");
        //string str = "";
        foreach (FileInfo file in Files)
        {
            file.Delete();
        }
        TextBox3.Text = TextBox3.Text + logtime + " -----Deleted all the exsting files-----\r\n";

        //start to export serveral files
        int totallines = 0;
        for (int i = 0; i < Filenumber; i++)
        {
            String exportfilename = "CIMToT1CIAnywhereTimesheetFile" + i.ToString() + ".csv";
            SSISExport(exportfilename, i * (Convert.ToInt32(lineperfile)) + 1, (i + 1) * (Convert.ToInt32(lineperfile)));
            TextBox3.Text = TextBox3.Text + logtime + " Lines in " + exportfilename + " are: " + CheckCsvFiles(exportfilename).ToString() + " \r\n";
            totallines = totallines + CheckCsvFiles(exportfilename);
        }

        TextBox3.Text = TextBox3.Text + logtime + " -----All lines in the files are " + totallines.ToString() + " . Please check!-----\r\n";

    }

    protected void SSISExport(string filename, int startno, int endno)
    {

        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        //invoke ssis package to export
        string fileserverfolder = ConfigurationManager.AppSettings["CIMToT1Manyfiles"].ToString();
        // Instantiate SSIS application object
        Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
        string fileName3 = Path.Combine(Server.MapPath("~/Upload"), "CIMTimesheetToT1Cianywhere_severalfiles.dtsx");
        // TextBox3.Text = TextBox3.Text+logtime + "Loading import package from file system...\r\n";
        Package myPackage = myApplication.LoadPackage(@fileName3, null);
        myPackage.Variables["filefolder"].Value = fileserverfolder;
        myPackage.Variables["filename"].Value = filename;
        myPackage.Variables["startno"].Value = startno;
        myPackage.Variables["endno"].Value = endno;

        TextBox3.Text = TextBox3.Text + logtime + " Starting to export timesheet data to file: " + filename + "...\r\n";
        ShowProcessBar();
    
        DTSExecResult myResult = myPackage.Execute();
        // Show the execution result
        TextBox3.Text = TextBox3.Text + logtime + " " + filename + " export result: " + myResult.ToString() + " \r\n";
        myPackage.Dispose();
        myPackage = null;

    }

    protected int CheckCsvFiles(string filename)
    {

        int ft_csv = 0;
        string fileserverfolder = ConfigurationManager.AppSettings["CIMToT1Manyfiles"].ToString();
        string strConn = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='text;HDR=Yes;FMT=Delimited'", fileserverfolder);
        OleDbConnection conn = new OleDbConnection(strConn);
        OleDbCommand comm1 = new OleDbCommand("select count(*) from [" + filename + "]", conn);
        conn.Open();
        return ft_csv = (int)comm1.ExecuteScalar() - 1;

    }

}

