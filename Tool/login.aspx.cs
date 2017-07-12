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

public partial class Web_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["act"] != null && Request.QueryString["act"].ToString().ToLower() == "logout")
        {
            Session["userID"] = Session["PaperID"] = Session["PaperName"] = "";
            Session.Clear();
            Session.Abandon();
        }

        if (!IsPostBack)
        {
            if (!Object.Equals(Request.Cookies["UserID"], null))
            {
                HttpCookie readcookie = Request.Cookies["UserID"];
                this.txtUserID.Text = readcookie.Value;
                if (this.txtUserID.Text != "")
                {
                    this.txtPwd.Focus();
                }
            }
        }

    }
    //登录按钮事件
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        Users user = new Users();//创建Users对象user
        string pwdMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtPwd.Text.Trim(), "MD5").ToString();
        if (String.Compare(Request.Cookies["yzmcode"].Value, Validator.Text, true) != 0)
        {
            lblMessage.Text = "Validation code error！";
        }
        else
        {
            if (user.CheckPassword(txtUserID.Text.Trim()))//根据用户编号查询用户密码
            {
                if (user.UserPwd == pwdMd5)//输入密码与用户密码相同
                {
                    if (object.Equals(Request.Cookies["UserID"], null))
                    {
                        CreateCookie();
                    }
                    else
                    {
                        CreateCookie();
                    }
                    Session["userID"] = txtUserID.Text.Trim();//存储用户编号
                    Response.Redirect("Default.aspx");//转向管理员操作界面                      
                }
                else//密码错误，给出提示
                {
                    lblMessage.Text = "Password error！";
                }
            }
            else//用户不存在，给出提示
            {
                lblMessage.Text = "User not exist！";
            }
        }
    }
    protected void ChangeCode_Click(object sender, EventArgs e)
    {

    }
    private void CreateCookie()
    {
        HttpCookie cookie = new HttpCookie("UserID");
        if (this.cbxRemeberUser.Checked)
        {
            cookie.Value = this.txtUserID.Text;
        }
        cookie.Expires = DateTime.MaxValue;
        Response.AppendCookie(cookie);
    }

}

