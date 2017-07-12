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

public partial class Web_UserAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
          
        } 
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            Users user = new Users();       
            user.UserID = txtUserID.Text.Trim();
            if (!user.CheckUser(user.UserID))
            {
                user.UserName = txtUserName.Text;

            string PwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtUserPwd.Text.Trim(), "MD5").ToString();
                user.UserPwd = PwdMD5;
                user.DepartmentId = Convert.ToInt16(ddlDepartment.SelectedValue);
                user.RoleId = Convert.ToInt16(ddlRole.SelectedValue);
               
                    if (user.InsertByProc())
                    {
                        lblMessage.Text = "Add user successfully£¡";
                        Server.Transfer("UserManage.aspx");
                    }
              else
               {
                   lblMessage.Text = "Addd user Fail£¡";
               }
            }
            else
            {
                lblMessage.Text = "User exists£¬please use another UserID£¡";
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("UserManage.aspx");       
    }
}
