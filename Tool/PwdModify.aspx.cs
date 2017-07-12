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

public partial class Web_PwdModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            

           
        } 
    }
  
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        txtOldPwd.Text = txtNewPwd.Text = txtConfirmPwd.Text = "";
    }
    protected void imgBtnModifyPwd_Click1(object sender, ImageClickEventArgs e)
    {
        Users user = new Users();
        user.LoadData(Session["userID"].ToString());
        string txtOldPwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPwd.Text.Trim(), "MD5").ToString();
        if (user.UserPwd == txtOldPwdMD5)
        {
            string txtNewPwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPwd.Text.Trim(), "MD5").ToString();
            user.UserPwd = txtNewPwdMD5.ToString().Trim();
            if (user.ModifyPassword(this.Session["userID"].ToString()))
            {
                lblMessage.Text = "Change password successfully!";
            }
            else
            {
                lblMessage.Text = "Change fail!";
            }
        }
        else
        {
            lblMessage.Text = "Old password is wrong,please input again!";
        }
    }  
}
