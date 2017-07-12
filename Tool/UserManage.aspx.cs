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
            GridViewBind();
        }
        ImageButtonResetPassword.Attributes.Add("onClick", "javascript:return confirm('Are you sure to reset password?');");
        ImageButtonDelete.Attributes.Add("onclick", "javascript:return confirm('Are you sure to delete?');");
    }
    private void GridViewBind()
    {
        Users user = new Users();//����Users�����user
        DataSet ds = user.QueryUsers();//ʹ��Users��QueryUsers������ѯ�����û���Ϣ
        GridView1.DataSource = ds;//ΪGridView�ؼ�ָ������Դ
        GridView1.DataBind();//GridView�ؼ�������
        LabelPageInfo.Text = "Now��No" + (GridView1.PageIndex + 1).ToString() + "page Total" + GridView1.PageCount.ToString() + "pages��";
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (((DropDownList)e.Row.FindControl("ddlRole")) != null)
        {
            DropDownList ddlrole = (DropDownList)e.Row.FindControl("ddlRole");

            //  ���� DropDownList ��ֵ��������
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("Proc_RoleList", conn);
            da.Fill(ds);
            if (conn.State.ToString() == "Open") conn.Close();

            ddlrole.DataSource = ds.Tables[0].DefaultView;
            ddlrole.DataTextField = "RoleName";
            ddlrole.DataValueField = "RoleId";
            ddlrole.DataBind();
        }
        if (((DropDownList)e.Row.FindControl("ddlDepartment")) != null)
        {
            DropDownList ddldepartment = (DropDownList)e.Row.FindControl("ddlDepartment");

            //  ���� DropDownList ��ֵ��������
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("Proc_DepartmentList", conn);
            da.Fill(ds);
            if (conn.State.ToString() == "Open") conn.Close();

            ddldepartment.DataSource = ds.Tables[0].DefaultView;
            ddldepartment.DataTextField = "DepartmentName";
            ddldepartment.DataValueField = "DepartmentId";
            ddldepartment.DataBind();
        }
        int i;
        //ִ��ѭ������֤ÿ�����ݶ����Ը���
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //�����ж��Ƿ���������
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //�����ͣ��ʱ���ı���ɫ
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //������ƿ�ʱ��ԭ����ɫ
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    //GridView�ؼ�RowDeleting�¼�
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ��Ҫɾ����¼������ֵ
        Users user = new Users();//����Users�����user
        if (user.DeleteByProc(userID))//��������ʹ��DeleteByProc����ɾ���û�
        {
            Response.Write("<script language=javascript>alert('Delete successfully!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('Delete fail!')</script>");
        }
        GridView1.EditIndex = -1;
        GridViewBind();//���°�����

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView�༭���������ڵ����е�����
        GridViewBind();
    }

    //GridView�ؼ�RowUpdating�¼�
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ����¼������ֵ
        Users user = new Users();
        user.UserName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tbxName")).Text;
        user.RoleId = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlRole")).SelectedValue);   //ȡ���޸ĺ��ֵ
        user.DepartmentId = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlDepartment")).SelectedValue);   //ȡ���޸ĺ��ֵ
        if (user.UpdateByProc(userID))//ʹ��Users��UpdateByProc�����޸��û���Ϣ
        {
            GridViewBind();
            Response.Write("<script language=javascript>alert('Update successfully!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('Update fail!')</script>");
        }
        GridView1.EditIndex = -1;
        GridViewBind();
    }

    protected void ImageButtonQuery_Click(object sender, ImageClickEventArgs e)
    {       
        Hashtable queryItems = new Hashtable();
        queryItems.Add("UserID", tbxUserID.Text.Trim());
        queryItems.Add("UserName", tbxUserName.Text.Trim());
        DataTable dt = OnLineExam.BusinessLogicLayer.Users.QueryUsers(queryItems);
        if (dt.Rows.Count >= 1)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {          
           Response.Write("<script language=javascript>alert('No this User!')</script>");
        }
    }
   
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
            if (isChecked)
            {
                string userID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                Users user = new Users();//����Users�����user
                if (user.DeleteByProc(userID))//��������ʹ��DeleteByProc����ɾ���û�
                {
                    Response.Write("<script language=javascript>alert('Delete successfully!')</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('" + userID + "Delete fail!')</script>");
                }

            }
        }
        GridViewBind();
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked = this.chkSelectAll.Checked;
        }
    }
    protected void ImageButtonResetPassword_Click(object sender, ImageClickEventArgs e)
    {
        int numOfChecked = 0;
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
            if (isChecked)
            {
                numOfChecked++;
            }     
        }               
      if (numOfChecked == 1)
      {
          for (int i = 0; i < this.GridView1.Rows.Count; i++)
          {
               bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
               if (isChecked)
               {
                   string UserID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;

                   Random ran = new Random();
                   string newPassword = (ran.Next(999999).ToString().PadLeft(6, '8'));	//�������һ������

                   Users user = new Users();//����Users����user
                   string pwdMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword, "MD5").ToString();
                   user.UserPwd = pwdMd5.ToString().Trim();
                   if (user.ModifyPassword(UserID))//�����û�����
                   {
                       Response.Write("<Script language=JavaScript>alert('" + UserID + "password has been reseted��new password is��" + newPassword + "����');</Script>");
                   }
                   else//�޸�����ʧ��
                   {
                       Response.Write("<Script language=JavaScript>alert('" + UserID + "reset password fail!');</Script>");
                   }
               }
          }   
              
       }
        else 
            {
                Response.Write("<Script language=JavaScript>alert('You only can choose one user!');</Script>");
                return;
            }
        }
    protected void ImageButtonBack_Click(object sender, ImageClickEventArgs e)
    {       
        GridViewBind();
    }
}
       
  

