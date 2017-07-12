using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnLineExam.BusinessLogicLayer;

public partial class Exam_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userID"] == null)
        {
            Response.Write("<script language=javascript>location='Login.aspx'</script>");
            Response.End();
        }
        if (!Page.IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Users user = new Users();
            user.LoadData(loginName);
            labUser.Text = user.UserName;

            //Get Client Ip Address
           // IPLabel.Text = Request.ServerVariables["REMOTE_HOST"];
            IPLabel.Text = GetIPAddress();
           //Get client username
           // string opl = System.Environment.UserName.ToString();
           // UsernameLabel.Text = opl.Substring(opl.IndexOf(@"\") + 1)+" ]";
            //get time
            TimeLabel.Text = DateTime.Now.ToString()+ " ]";
           

        } 
    }



    protected string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }

}

