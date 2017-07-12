using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnLineExam.BusinessLogicLayer;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RedirectPage();
    }
    private void RedirectPage()
    {
        if (Session["userID"] == null)
            Response.Redirect("/Tool/Login.aspx");

        Users user = new Users();
        string userid = Session["userID"].ToString();
        user.LoadData(userid);
        switch (user.RoleName)
        {
            case "管理员":
                Response.Redirect("/Tool/default.aspx");
                break;
            case "教师":
                Response.Redirect("/Tool/default.aspx");
                break;
            case "学生":
                Response.Redirect("/Tool/default.aspx");
                break;
            default:
                break;
        }
    }
}