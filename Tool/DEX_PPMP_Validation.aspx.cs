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
  
        try
            {
                logtxt.Text = "";
                // Instantiate SSIS application object
                Microsoft.SqlServer.Dts.Runtime.Application myApplication = new Microsoft.SqlServer.Dts.Runtime.Application();
                string fileName = Path.Combine(Server.MapPath("~/Upload"), "PPMP_ImportClientLists.dtsx");
                logtxt.Text = logtxt.Text + logtime + "Loading PPMP_ImportClientLists from AH.dtsx from server...\r\n";               
                string fileName2 = fileName.Replace(@"\", @"\\");            
                Package myPackage = myApplication.LoadPackage(fileName2, null); 
               // Execute package
                logtxt.Text = logtxt.Text + logtime + "Executing package...\r\n";
                DTSExecResult myResult = myPackage.Execute();
                // Show the execution result
                logtxt.Text = logtxt.Text + logtime + "Package executed result: " + myResult.ToString() + " \r\n";

            //check records in table
            int r_no = 0;
            string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            try
            {
               
                if (connsql.State.ToString() == "Closed") connsql.Open();
                //check financil transaction data  (most types)         
                string sqlstr = "SELECT count(*) from  DEX_PPMP_clientlist ";

                SqlCommand Cmd = new SqlCommand(sqlstr, connsql);
                r_no = (int)Cmd.ExecuteScalar();
                logtxt.Text = logtxt.Text + logtime + "Total records in table PPMP_ImportClientLists is  :" + r_no.ToString() + " \r\n";
             


            }

            catch (Exception eee)
            {

                logtxt.Text = logtxt.Text + logtime + "#Query From Database ERROR# " + eee.Message + " .Please try again!";
            }
            finally
            {
                connsql.Close();
            }


        }
            catch (Exception ee)
            {
            logtxt.Text = logtime + "Package executed fail and Erros is: " + ee.Message + " \r\n";
            }
         

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";
    }

   
    protected void Button4_Click1(object sender, EventArgs e)
    {
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";

        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        connsql.Open();

        string sqlstr = " select *  from DEX_PPMP_clientlist  ";
        sqlstr += "  where fullname not in (select surname+', '+firstname  from  [PPMP1].PMPdata.dbo.Patients union select surname+', '+Salutation from [PPMP1].PMPdata.dbo.Patients)   ";
        SqlCommand Cmd2 = new SqlCommand(sqlstr, connsql);
        Cmd2.CommandTimeout = 3600000;
        SqlDataReader reader;
        reader = Cmd2.ExecuteReader();



        while (reader.Read())
        {

            logtxt.Text += Convert.ToString(reader.GetValue(0)) + "\r\n";
        }

        connsql.Close();
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        string userProvidedText = logtxt.Text;
        byte[] userProvidedTextAsBytes = null;

        if (!string.IsNullOrEmpty(userProvidedText))
        {
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            userProvidedTextAsBytes = encoding.GetBytes(userProvidedText);
        }

        Response.AppendHeader("Content-Disposition", "attachment; filename=ppmp_temp.csv");
        Response.ContentType = "text/HTML";
        Response.BinaryWrite(userProvidedTextAsBytes);
        Response.End();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";

        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        connsql.Open();


        string sqlstr = " select 'AH'+convert(varchar,t1.[Client No]),   ";
               sqlstr += "  'TRUE', ";
               sqlstr += "   'TRUE', ";
               sqlstr += "     t1.Firstname, ";
               sqlstr += "     t1.Surname, ";
               sqlstr += "   'N', ";
               sqlstr += "    convert(date, t1.DOB,103) as DOB,  ";
               sqlstr += "    'N',  ";
               sqlstr += "    case  t1.Sex ";
               sqlstr += "   when 1 then 'MALE' ";
               sqlstr += "   WHEN 0 THEN 'FEMALE' ";
               sqlstr += "    ELSE 'N/A' END AS GENDER, ";
               sqlstr += "    Occupation AS CountryOfBirthCode, ";
               sqlstr += "   NULL AS LanguageSpokenAtHomeCode, ";
               sqlstr += "    case t2.[Entry No] ";
               sqlstr += "    when 1 THEN 'ABORIGIN' ";
               sqlstr += "   ELSE 'NO' END AS  AboriginalOrTorresStraitIslanderOriginCode, ";
               sqlstr += "    'N' as HasDisabilities, ";
               sqlstr += "     null, ";
               sqlstr += "    null, ";
               sqlstr += "    null as AccomodationTypeCode, ";
               sqlstr += "    null as DVACardStatusCode, ";
               sqlstr += "    case t3.[Entry No] ";
               sqlstr += "    when 4 THEN 'YES' ";
               sqlstr += "    ELSE 'NO' END as HasCarer, ";
               sqlstr += "    'YES' as ResidentialAddress, ";
               sqlstr += "    replace(replace(t1.Address, char(10),' '),CHAR(13),' ') as AddressLine1, ";
               sqlstr += "    NULL, ";
               sqlstr += "    Suburb as Suburb, ";
               sqlstr += "    'SA', ";
               sqlstr += "    t1.[Post Code] as Postcode, ";
               sqlstr += "    'FALSE' as IsHomeless ";
        sqlstr += "   from[PPMP1].PMPdata.dbo.Patients AS T1 ";
        sqlstr += "   left join[PPMP1].PMPdata.dbo.[Client User List 1] as t2 ";
        sqlstr += "   on t1.[Client No]=t2.[Client No] and t2.[Entry No]=1 ";
        sqlstr += "   left join[PPMP1].PMPdata.dbo.[Client User List 1] as t3 ";
        sqlstr += "   on t1.[Client No]=t3.[Client No] and t2.[Entry No]=4 ";
        sqlstr += "   where(surname+', '+firstname in (select fullname from[DEX_PPMP_clientlist]) ";
        sqlstr += "   or surname+', '+Salutation in (select fullname from[DEX_PPMP_clientlist])) ";
        sqlstr += "   and t1.[Client No] in  ";
        sqlstr += "   (select distinct [Client No] as client_no ";
        sqlstr += "   from [PPMP1].PMPdata.dbo.Accounts ";
        sqlstr += "   where date >='"+startdate.Text+"' and date<='"+enddate.Text+"' ) ";
        sqlstr += "   and ";
        sqlstr += "   t1.[Client No] in  ";
        sqlstr += "   (select distinct [Client No] as client_no ";
        sqlstr += "   from [PPMP1].PMPdata.dbo.Episodes  ) ";

        SqlCommand Cmd2 = new SqlCommand(sqlstr, connsql);
        Cmd2.CommandTimeout = 3600000;
        SqlDataReader reader;
        reader = Cmd2.ExecuteReader();



        while (reader.Read())
        {

            logtxt.Text += Convert.ToString(reader.GetValue(0)) +","+ Convert.ToString(reader.GetValue(1))+","+ Convert.ToString(reader.GetValue(2))+ "," + Convert.ToString(reader.GetValue(3)) + "," +Convert.ToString(reader.GetValue(4)) + ","+ Convert.ToString(reader.GetValue(5)) + ","+ Convert.ToString(reader.GetValue(6)) + ","+ Convert.ToString(reader.GetValue(7)) + ","+ Convert.ToString(reader.GetValue(8)) + ","+ Convert.ToString(reader.GetValue(9)) + ","+ Convert.ToString(reader.GetValue(10)) + ","+ Convert.ToString(reader.GetValue(11)) + ","+ Convert.ToString(reader.GetValue(12)) + "," + Convert.ToString(reader.GetValue(13)) + "," + Convert.ToString(reader.GetValue(14)) + "," + Convert.ToString(reader.GetValue(15)) + "," + Convert.ToString(reader.GetValue(16)) + "," + Convert.ToString(reader.GetValue(17)) + "," + Convert.ToString(reader.GetValue(18)) + "," + Convert.ToString(reader.GetValue(19)) + "," + Convert.ToString(reader.GetValue(20)) + "," + Convert.ToString(reader.GetValue(21)) + "," + Convert.ToString(reader.GetValue(22)) + "," + Convert.ToString(reader.GetValue(23)) + "," + Convert.ToString(reader.GetValue(24))+  "\r\n";
        }

        connsql.Close();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";

        //step1: insert new client lists for filter
        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("p_dex_ppmp_clientlistforfilter", connsql);
        Cmd.CommandTimeout = 0;
        Cmd.CommandType = CommandType.StoredProcedure;

        Cmd.Parameters.Add("@StartDay", SqlDbType.VarChar, 30).Value = startdate.Text;
        Cmd.Parameters.Add("@EndDay", SqlDbType.VarChar, 30).Value = enddate.Text;
        // Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar, 10).Value = "2015-08-16".ToString();
        try
        {

            Cmd.ExecuteNonQuery();
          
        }
        catch (Exception eee)
        {
            logtxt.Text = logtxt.Text  + " == p_dex_clientlistforfilter fail! [ERROR: " + eee.Message + "] == \r\n";
          
        }
        finally
        {
            connsql.Close();
        }


        //step2: query case data

      
        SqlConnection connsql1 = new SqlConnection(connStr);
        connsql1.Open();


        string sqlstr = " select convert(varchar,[Episode No])+'-AH'+convert(varchar,[Client No]) as CaseId, [Treatment Location], 0 as TotalNumberOfUnidentifiedClients,'AH'+convert(varchar,[Client No]),[Episode No],[Present Prob 1 Name],[Present Prob 2 Name],[Present Prob 3 Name],[Discharge Reason] ";
        sqlstr += "  from[PPMP1].PMPdata.dbo.Episodes ";
        sqlstr += "  where title in ('Physiotherapy', 'Occupational Therapy', 'Podiatry', 'Groups', 'Massage', 'Exercise Physiology')  ";
        sqlstr += "  and [Treatment Location] in (1,5,4)  ";
        sqlstr += "  and [Client No] in (select[Client No] from tmp_dex_clientlist_forfilter)  ";
       sqlstr += "   and [Date Started] <= '" + enddate.Text + "'  ";
        sqlstr += "  and ([Discharge Date] >= '" + startdate.Text + "' or [Discharge Date] = '1899-12-30 00:00:00.000')  ";


        SqlCommand Cmd2 = new SqlCommand(sqlstr, connsql1);
        Cmd2.CommandTimeout = 3600000;
        SqlDataReader reader;
        reader = Cmd2.ExecuteReader();



        while (reader.Read())
        {

            logtxt.Text += Convert.ToString(reader.GetValue(0)) + "," + Convert.ToString(reader.GetValue(1)) + "," + Convert.ToString(reader.GetValue(2)) + "," + Convert.ToString(reader.GetValue(3)) + "," + Convert.ToString(reader.GetValue(4)) + "," + Convert.ToString(reader.GetValue(5)) + "," + Convert.ToString(reader.GetValue(6)) + "," + Convert.ToString(reader.GetValue(7)) + "," + Convert.ToString(reader.GetValue(8))  + "\r\n";
        }

        connsql1.Close();
    }

    protected void Button9_Click(object sender, EventArgs e)
    {

        logtxt.Text = "";

        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        connsql.Open();


        string sqlstr = " select 'AH'+convert(varchar,[Transaction No]),'AH'+convert(varchar,[Client No]),[Episode No], convert(varchar,[Episode No])+'-AH'+convert(varchar,[Client No]) as CaseId,convert(date, date,103) as SessionDate,code,Amount,[Description]  ";
        sqlstr += "  from[PPMP1].PMPdata.dbo.Accounts  ";
        sqlstr += "  where date >= '" + startdate.Text + "' and date<= '" + enddate.Text + "' ";
        sqlstr += "  and amount > 0  ";
        sqlstr += "  and[Client No] in (select[Client No] from tmp_dex_clientlist_forfilter)  ";
        sqlstr += "  and[Episode No] in   ";
        sqlstr += "  (  ";
        sqlstr += "  select[Episode No]  ";
        sqlstr += "  from[PPMP1].PMPdata.dbo.Episodes  ";
        sqlstr += "  where title in ('Physiotherapy', 'Occupational Therapy', 'Podiatry', 'Groups', 'Massage', 'Exercise Physiology')  ";
        sqlstr += "   and[Treatment Location] in (1,5,4)  ";
        sqlstr += "   and[Client No] in (select[Client No] from tmp_dex_clientlist_forfilter)  ";
        sqlstr += "   and[Date Started] <= '" + enddate.Text + "'  ";
        sqlstr += "  and([Discharge Date] >= '" + startdate.Text + "' or[Discharge Date] = '1899-12-30 00:00:00.000')  ";
        sqlstr += "   )  and [rx location] in (1,5,4) ";
        sqlstr += "  order by[Client No]  ";


        SqlCommand Cmd2 = new SqlCommand(sqlstr, connsql);
        Cmd2.CommandTimeout = 3600000;
        SqlDataReader reader;
        reader = Cmd2.ExecuteReader();



        while (reader.Read())
        {

            logtxt.Text += Convert.ToString(reader.GetValue(0)) + "," + Convert.ToString(reader.GetValue(1)) + "," + Convert.ToString(reader.GetValue(2)) + "," + Convert.ToString(reader.GetValue(3)) + "," + Convert.ToString(reader.GetValue(4)) + "," + Convert.ToString(reader.GetValue(5)) + "," + Convert.ToString(reader.GetValue(6)) + "," + Convert.ToString(reader.GetValue(7))  + "\r\n";
        }

        connsql.Close();
    }
}

