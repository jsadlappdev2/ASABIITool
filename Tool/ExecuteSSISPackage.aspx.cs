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



public partial class Web_DepartmentManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
          
        } 
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string logtime = "[ " + DateTime.Now.ToLocalTime().ToString() + " ]";
        TextBox3.Text = "";
        
        if (FileUpload1.HasFile)
        {

            
            
            if (CheckBox1.Checked == true)
            {

                if (TextBox1.Text == "" )
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SystemMessage", "alert('Parameter name and value cannot be NULL');", true);
                    TextBox1.Focus();
                }
                else
                {

                    try
                    {
                        //upload package file to web server
                        TextBox3.Text = logtime + "Uploade package file to server...\r\n";   
                        string fileName = Path.Combine(Server.MapPath("~/Upload"), FileUpload1.FileName);
                        TextBox3.Text = FileUpload1.FileName;
                        FileUpload1.SaveAs(fileName);
                        TextBox3.Text = TextBox3.Text + logtime + "Upload package file to server successfully.\r\n";   
                        // Instantiate SSIS application object
                        Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                        TextBox3.Text = TextBox3.Text+logtime + "Loading package from file system...\r\n";
                        string fileName2 = fileName.Replace(@"\", @"\\");            
                        //string SSISLocation = "C:\\SSIS\\KyperaToTechone_TF.dtsx";
                        Package myPackage = myApplication.LoadPackage(@fileName2, null);
                        TextBox3.Text = TextBox3.Text + logtime + "Loading package paramter name and value...\r\n"; 
                        myPackage.Variables[TextBox1.Text].Value = TextBox2.Text;
                        // Execute package
                        TextBox3.Text = TextBox3.Text + logtime + "Executing package...\r\n"; 
                        DTSExecResult myResult = myPackage.Execute();
                        // Show the execution result
                        TextBox3.Text = TextBox3.Text + logtime + "Package executed result: " + myResult.ToString() + " \r\n"; 
                     
                    }
                    catch (Exception ee)
                    {
                        TextBox3.Text = logtime + "Package executed fail and Erros is: " + ee.Message + " \r\n"; 
                    }

                }

            }
            else
            {
                try
                {
                    //upload package file to web server
                    TextBox3.Text = logtime + "Uploade package file to server...\r\n";   
                    string fileName = Path.Combine(Server.MapPath("~/Upload"), FileUpload1.FileName);
                    FileUpload1.SaveAs(fileName);
                    TextBox3.Text = TextBox3.Text + logtime + "Upload package file to server successfully.\r\n";   
                    Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                    TextBox3.Text = TextBox3.Text + logtime + "Loading package from file system...\r\n";
                    string fileName2 = fileName.Replace(@"\",@"\\");
                    // string SSISLocation = "C:\\SSIS\\KyperaToTechone_TF.dtsx";
                    Package myPackage = myApplication.LoadPackage(@fileName2, null);
                    // Execute package
                    TextBox3.Text = TextBox3.Text+logtime + "Executing package...\r\n"; 
                    DTSExecResult myResult = myPackage.Execute();
                    // Show the execution result
                    TextBox3.Text = TextBox3.Text+logtime + "Package executed result: " + myResult.ToString() + " \r\n"; 
                }
                catch (Exception ee)
                {
                    TextBox3.Text = logtime + "Package executed fail and Erros is: " + ee.Message + " \r\n"; 
                }
            
            }

         }
            
       else
         {
                ClientScript.RegisterStartupScript(this.GetType(), "SystemMessage", "alert('" + "Please select a SSIS package file !" + "');", true);
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

