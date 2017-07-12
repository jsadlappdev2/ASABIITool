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

using OnLineExam.DataAccessLayer;
using OnLineExam.DataAccessHelper;
using OnLineExam.BusinessLogicLayer;
using OnLineExam.CommonComponent;

public partial class Controls_lefttree : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InitData();
        }
    }
    private void InitData()
    {
       CheckUser();

       string loginName = Session["userID"].ToString();

       Users user = new Users();
        user.LoadData(loginName);
        //LabelTree.Text = "ฤ๚บร:" + user.UserName + "<hr>";

        string sql = "Select * from [TreeMenu] Where [Duty] in (";
        foreach (string duty in user.Duties)
        {
            sql += SQLString.GetQuotedString(duty) + ",";
        }
        sql += "'#')";
        sql += "order by  nodeid asc ";

        DataBase db = new DataBase();
        DataTable dt = db.GetDataTable(sql);

        Tree tree = new Tree("====== Menu ======");
        LabelTree.Text += tree.CreateTree(dt);
    }

   
  private void CheckUser()
  {
       if (Session["userID"]==null)
           Response.Redirect("Login.aspx");
  }
}
