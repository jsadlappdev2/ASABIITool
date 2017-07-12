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
using OnLineExam.DataAccessLayer;
using System.Data.SqlClient;

public partial class Web_UserManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
       
    }
 

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (txtKeywords.Text == "")
        {
            Hints.Visible = true;
            Hints.Text = " Please input Key Words for searching!";
            txtKeywords.Focus();
        }
        else
        {
            Hints.Visible = false;
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand("[dbo].[SP_FindTablesByColumnKeywords]", connsql);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@keywords", SqlDbType.VarChar, 100).Value = txtKeywords.Text.Trim();
            Cmd.Parameters.Add("@dbname", SqlDbType.VarChar, 100).Value = dbname.Text.Trim();
           
            if(dblink.Text != "NONE")
            {
             Cmd.Parameters.Add("@slink", SqlDbType.VarChar, 100).Value = dblink.Text.Trim();
            }

            if (CheckBox1.Checked)
            {
                Cmd.Parameters.Add("@islike", SqlDbType.VarChar, 1).Value = 'y';
            }
            else
            {
                Cmd.Parameters.Add("@islike", SqlDbType.VarChar, 1).Value = 'n';
            }


            try
            {
                Cmd.ExecuteNonQuery();
                Hints.Visible = true;
                Hints.Text = "Search successfully! ";
                GridView1.DataBind();
                
               
            }
            catch (Exception ee)
            {
                Hints.Visible = true;
                Hints.Text = "Search fail and #error# is: " + ee.Message;
                GridView1.DataBind();
            }



        }
       
    }

   
}
       
  

