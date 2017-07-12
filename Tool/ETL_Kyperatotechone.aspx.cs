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
        //get the yyyymmdd format date from canlendar
        string rundate = Calendar1.SelectedDate.ToShortDateString();
        string sdate = "";
        string smonth = "";
        string syear = "";
        string newrundate = "";
        if (rundate.Length == 9)
        {
            sdate = "0"+rundate.Substring(0, 1);
            smonth = rundate.Substring(2, 2);
            syear = rundate.Substring(5, 4);
            newrundate = syear + smonth + sdate;
        }

        else 
        {
            sdate = rundate.Substring(0, 2);
            smonth = rundate.Substring(3, 2);
            syear = rundate.Substring(6, 4);
            newrundate = syear + smonth + sdate;
        }

        if (newrundate == "00010101")
        {

            // ClientScript.RegisterStartupScript(this.GetType(), "SystemMessage", "alert('You didn't selete a date & Please click the Calendar's date. Thanks!');", true);
            TextBox3.Text = "[ALERT]You didn't selete a date & Please click the Calendar to select a runing date. Thanks!";
        }
        else
        {

            //execute the package for kyperatotechone
            try
            {

                // Instantiate SSIS application object
                Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                string fileName = Path.Combine(Server.MapPath("~/Upload"), "JOB_KyperaToTechone_Inputdate.dtsx");
                TextBox3.Text = TextBox3.Text + logtime + "Loading JOB_KyperaToTechone_Inputdate.dtsx from server...\r\n";
                string fileName2 = fileName.Replace(@"\", @"\\");
                Package myPackage = myApplication.LoadPackage(@fileName2, null);
                TextBox3.Text = TextBox3.Text + logtime + "Loading package paramter - rundate...\r\n";
                myPackage.Variables["RunDate"].Value = newrundate;
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

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox3.Text = "";
    }

   
    protected void Button4_Click1(object sender, EventArgs e)
    {
       
    }
}

