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
                string fileName = Path.Combine(Server.MapPath("~/Upload"), "PPMP_ImportExceldataforXML-All.dtsx");
                logtxt.Text = logtxt.Text + logtime + "Loading PPMP_ImportExceldataforXML-All.dtsx from server...\r\n";               
                string fileName2 = fileName.Replace(@"\", @"\\");            
                Package myPackage = myApplication.LoadPackage(fileName2, null); 
               // Execute package
                logtxt.Text = logtxt.Text + logtime + "Executing package...\r\n";
                DTSExecResult myResult = myPackage.Execute();
                // Show the execution result
                logtxt.Text = logtxt.Text + logtime + "Package executed result: " + myResult.ToString() + " \r\n";

            //check records in table PPMP_DEX_Client
            int r_no = 0;
            string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            try
            {
               
                if (connsql.State.ToString() == "Closed") connsql.Open();
                //check financil transaction data  (most types)         
                string sqlstr = "SELECT count(*) from  PPMP_DEX_Client ";

                SqlCommand Cmd = new SqlCommand(sqlstr, connsql);
                r_no = (int)Cmd.ExecuteScalar();
                logtxt.Text = logtxt.Text + logtime + "Total records in PPMP_DEX_Client  is  :" + r_no.ToString() + " \r\n";            


            }

            catch (Exception eee)
            {

                logtxt.Text = logtxt.Text + logtime + "#Query From Database ERROR# " + eee.Message + " .Please try again!";
            }
            finally
            {
                connsql.Close();
            }


            //check records in table PPMP_cases
            int l_no = 0;

            SqlConnection connsql1 = new SqlConnection(connStr);
            try
            {

                if (connsql1.State.ToString() == "Closed") connsql1.Open();
                //check financil transaction data  (most types)         
                string sqlstr = "SELECT count(*) from  PPMP_cases ";

                SqlCommand Cmd = new SqlCommand(sqlstr, connsql1);
                l_no = (int)Cmd.ExecuteScalar();
                logtxt.Text = logtxt.Text + logtime + "Total records in PPMP_cases  is  :" + l_no.ToString() + " \r\n";


            }

            catch (Exception eee)
            {

                logtxt.Text = logtxt.Text + logtime + "#Query From Database ERROR# " + eee.Message + " .Please try again!";
            }
            finally
            {
                connsql1.Close();
            }




            //check records in table PPMP_session
            int g_no = 0;

            SqlConnection connsql2 = new SqlConnection(connStr);
            try
            {

                if (connsql2.State.ToString() == "Closed") connsql2.Open();
                //check financil transaction data  (most types)         
                string sqlstr = "SELECT count(*) from  PPMP_session ";

                SqlCommand Cmd = new SqlCommand(sqlstr, connsql2);
                g_no = (int)Cmd.ExecuteScalar();
                logtxt.Text = logtxt.Text + logtime + "Total records in PPMP_session  is  :" + g_no.ToString() + " \r\n";


            }

            catch (Exception eee)
            {

                logtxt.Text = logtxt.Text + logtime + "#Query From Database ERROR# " + eee.Message + " .Please try again!";
            }
            finally
            {
                connsql2.Close();
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

        string sqlstr = "   select [Client No],count(*) from PPMP_DEX_Client group by [Client No] having count(*)>1 ";
     
        SqlCommand Cmd2 = new SqlCommand(sqlstr, connsql);
        Cmd2.CommandTimeout = 3600000;
        SqlDataReader reader;
        reader = Cmd2.ExecuteReader();



        while (reader.Read())
        {

            logtxt.Text += Convert.ToString(reader.GetValue(0)) +"," + Convert.ToString(reader.GetValue(1)) + "\r\n";
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

        Response.AppendHeader("Content-Disposition", "attachment; filename=ppmp_temp.xml");
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
      
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
    }

    protected void Button9_Click(object sender, EventArgs e)
    {

       
    }

    protected void Button10_Click(object sender, EventArgs e)
    {

        logtxt.Text = "";
        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        connsql.Open();

        string sqlstr = "    select len(SLK),count(*) from PPMP_DEX_Client	         group by len(SLK) ";

        SqlCommand Cmd2 = new SqlCommand(sqlstr, connsql);
        Cmd2.CommandTimeout = 3600000;
        SqlDataReader reader;
        reader = Cmd2.ExecuteReader();



        while (reader.Read())
        {

            logtxt.Text += Convert.ToString(reader.GetValue(0)) + "," + Convert.ToString(reader.GetValue(1)) + "\r\n";
        }

        connsql.Close();
    }

    protected void Button11_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";

        //step1: insert new client lists for filter
        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("p_dex_ppmp_client", connsql);
        Cmd.CommandTimeout = 0;
        Cmd.CommandType = CommandType.StoredProcedure;

        // Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar, 10).Value = "2015-08-16".ToString();
        try
        {

            Cmd.ExecuteNonQuery();
            logtxt.Text = "You can generate XML file now!";


        }
        catch (Exception eee)
        {
            logtxt.Text = logtxt.Text + " == Execute store procedure p_dex_ppmp_client fail! [ERROR: " + eee.Message + "] == \r\n";

        }
        finally
        {
            connsql.Close();
        }
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";
        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        connsql.Open();

        string sqlstr = "   select Client.ClientId, ";
        sqlstr += "  Client.Slk, ";
        sqlstr += "  Client.ConsentToProvideDetails, ";
        sqlstr += "  Client.ConsentedForFutureContacts, ";
        sqlstr += "  Client.IsUsingPsuedonym, ";
        sqlstr += "  Client.BirthDate, ";
        sqlstr += "  Client.IsBirthDateAnEstimate, ";
        sqlstr += "  Client.GenderCode, ";
        sqlstr += "  Client.CountryOfBirthCode, ";
        sqlstr += "   '0002' as LanguageSpokenAtHomeCode, ";
        sqlstr += "   Client.AboriginalOrTorresStraitIslanderOriginCode, ";
        sqlstr += "   Client.HasDisabilities, ";
        sqlstr += "  'NOTSTATED' as AccommodationTypeCode, ";

        sqlstr += "   'NODVA' as DVACardStatusCode, ";

        sqlstr += "  'false' as HasCarer, ";
           
        sqlstr += "  (select ";
        sqlstr += "  ResidentialAddress.Suburb, ResidentialAddress.StateCode, ResidentialAddress.Postcode ";
        sqlstr += "   from PPMP_ClientData AS ResidentialAddress ";
        sqlstr += "   where ResidentialAddress.Clientid = Client.Clientid ";
        sqlstr += "   FOR XML AUTO, TYPE, ELEMENTS),     ";
        sqlstr += "   Client.IsHomeless, ";

        sqlstr += "  'NOTSTATED' as HouseholdCompositionCode ";
        sqlstr += " from PPMP_ClientData AS Client ";
        sqlstr += " FOR XML AUTO, ROOT('Clients'), ELEMENTS XSINIL; ";

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

    protected void Button13_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";

        //step1: insert new client lists for filter
        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("p_dex_ppmp_case", connsql);
        Cmd.CommandTimeout = 0;
        Cmd.CommandType = CommandType.StoredProcedure;

        // Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar, 10).Value = "2015-08-16".ToString();
        try
        {

            Cmd.ExecuteNonQuery();
            logtxt.Text = "You can generate XML file now!";


        }
        catch (Exception eee)
        {
            logtxt.Text = logtxt.Text + " == Execute store procedure p_dex_ppmp_client fail! [ERROR: " + eee.Message + "] == \r\n";

        }
        finally
        {
            connsql.Close();
        }
    }

    protected void Button14_Click(object sender, EventArgs e)
    {
        logtxt.Text = "";

        //step1: insert new client lists for filter
        string connStr = ConfigurationManager.ConnectionStrings["DEX"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        if (connsql.State.ToString() == "Closed") connsql.Open();
        SqlCommand Cmd = new SqlCommand("p_dex_ppmp_session", connsql);
        Cmd.CommandTimeout = 0;
        Cmd.CommandType = CommandType.StoredProcedure;

        // Cmd.Parameters.Add("@P_EndDay", SqlDbType.VarChar, 10).Value = "2015-08-16".ToString();
        try
        {

            Cmd.ExecuteNonQuery();
            logtxt.Text = "You can generate XML file now!";


        }
        catch (Exception eee)
        {
            logtxt.Text = logtxt.Text + " == Execute store procedure p_dex_ppmp_client fail! [ERROR: " + eee.Message + "] == \r\n";

        }
        finally
        {
            connsql.Close();
        }
    }
}

