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
  
       
            //execute the package for kyperatotechone
            try
            {
                
                // Instantiate SSIS application object
                Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                string fileName = Path.Combine(Server.MapPath("~/Upload"), "ImportExcelForFinanceDashboard.dtsx");
                TextBox3.Text = "";
                TextBox3.Text = TextBox3.Text + logtime + "Loading KPI_Finance_Strategic_fromexcel.dtsx from server...\r\n";
                string fileName2 = fileName.Replace(@"\", @"\\");
                Package myPackage = myApplication.LoadPackage(@fileName2, null);
               // TextBox3.Text = TextBox3.Text + logtime + "Loading package paramter - rundate...\r\n";
               // myPackage.Variables["excelfolder"].Value = kpidatafolder;
                // Execute package
                TextBox3.Text = TextBox3.Text + logtime + "Executing package to load the Finance KPI data from spreadsheet...\r\n";
                DTSExecResult myResult = myPackage.Execute();
                // Show the execution result
                TextBox3.Text = TextBox3.Text + logtime + "Package executed result: " + myResult.ToString() + " \r\n";

                GridView1.DataBind();
                GridView2.DataBind();

            }
            catch (Exception ee)
            {
                TextBox3.Text = logtime + "Package executed fail and Erros is: " + ee.Message + " \r\n";
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

