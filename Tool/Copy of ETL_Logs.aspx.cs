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
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.Data;



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
       
           

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      
    }

   
    protected void Button4_Click1(object sender, EventArgs e)
    {
       
    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //get the yyyymmdd format date from canlendar
        string rundate = Calendar1.SelectedDate.ToShortDateString();
        string sdate = "";
        string smonth = "";
        string syear = "";
        string newrundate = "";
        if (rundate.Length == 9)
        {
            sdate = "0" + rundate.Substring(0, 1);
            smonth = rundate.Substring(2, 2);
            syear = rundate.Substring(5, 4);
            newrundate = syear + smonth + sdate;
        }

        else
        {
            sdate = rundate.Substring(0, 2);
            smonth = rundate.Substring(3, 2);
            syear = rundate.Substring(6, 4);
            newrundate = syear + smonth + sdate;
        }
       
        if(newrundate == "00010101")
        {
        
          // ClientScript.RegisterStartupScript(this.GetType(), "SystemMessage", "alert('You didn't selete a date & Please click the Calendar's date. Thanks!');", true);
           TextBox2.Text = "[ALERT]You didn't selete a date & Please click the Calendar to select a runing date. Thanks!";
       }
        else 
        {

        //check csv files
        int ft_csv = 0;
        int wk_csv = 0;
        int ls_csv = 0;
        int cl_csv = 0;

        //手工指定 csv文件所在路径，需要修改
        string strConn = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='\\\\huey\\T1\\fin1\\data\\fintest\\import';Extended Properties='text;HDR=Yes;FMT=Delimited'");  //连接数据。  Data Source为CSV文件存在的目录
        OleDbConnection conn = new OleDbConnection(strConn);
        OleDbCommand comm1 = new OleDbCommand("select count(*) from [Kypera_Financial_Transaction_day.csv]", conn);
        OleDbCommand comm2 = new OleDbCommand("select count(*) from [Leasehold_transaction data -20150820.csv]", conn);
        OleDbCommand comm3 = new OleDbCommand("select count(*) from [Rent Payments Centrelink.csv]", conn);
        OleDbCommand comm4 = new OleDbCommand("select count(*) from [PurchaseRequisitionImport - day - livedb - Lookup.csv]", conn);

        try
        {
            conn.Open();
            ft_csv = (int)comm1.ExecuteScalar();
            ls_csv = (int)comm2.ExecuteScalar();
            cl_csv = (int)comm3.ExecuteScalar();
            wk_csv = (int)comm4.ExecuteScalar() - 1;
            TextBox2.Text = "";
            TextBox2.Text = " == Your are checking the data happened at : " + newrundate + " ==\r\n";
            TextBox2.Text = TextBox2.Text + "\r\n";
            TextBox2.Text = TextBox2.Text +" == Begin to check results from CSV files == \r\n";
            TextBox2.Text = TextBox2.Text + "   Total records in Kypera_Financial_Transaction_day.csv (most types) is :" + ft_csv.ToString() + " \r\n";
            TextBox2.Text = TextBox2.Text + "   Total records in Leasehold_transaction data -20150820.csv is :" + ls_csv.ToString() + " \r\n";
            TextBox2.Text = TextBox2.Text + "   Total records in Rent Payments Centrelink.csv is :" + cl_csv.ToString() + " \r\n";
            TextBox2.Text = TextBox2.Text + "   Total records in PurchaseRequisitionImport - day - livedb - Lookup.csv is :" + wk_csv.ToString() + " \r\n";
            TextBox2.Text = TextBox2.Text+ " == Check CSV files finished == \r\n";
        }
        catch (Exception ee)
        {
            TextBox2.Text = "#Read CSV File ERROR# "+ee.Message +" .Please try again!\r\n";
        }
        finally
        {
            conn.Close();
        }

        //check records in database querey
        int ft_db = 0;
        int ls_db = 0;
        int cl_db = 0;
        int wk_db = 0;
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connsql = new SqlConnection(connStr);
        try
        {
            TextBox2.Text = TextBox2.Text + "\r\n";
            TextBox2.Text = TextBox2.Text + " == Begin to check records using database query == \r\n";
          
            if (connsql.State.ToString() == "Closed") connsql.Open();
            //check financil transaction data  (most types)         
            string sqlstr = "SELECT count(*)   "
                       + " FROM [APPSQL-3].[Anglicare].dbo.Occupancies_TransactionHeaders AS OTH "
                       + " LEFT JOIN [APPSQL-3].[Anglicare].dbo.PropertyStructure_BlockUnit AS B ON B.Unit=OTH.Unit "
                       + " Left JOIN  [APPSQL-3].[Anglicare].dbo.PropertyStructure_Block AS PSB ON PSB.Code=B.Block "
                       + " LEFT JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_Batches AS OB ON OTH.Batch = OB.ID "
                       + " INNER JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_TransactionHeaderTypes AS DTHT ON OTH.Type=DTHT.ID "
                       + " LEFT JOIN (SELECT a.Landlord,a.Occupancy, b.Name,C.Unit FROM [APPSQL-3].[Anglicare].dbo.Leasehold_Agreement as a   LEFT JOIN [APPSQL-3].[Anglicare].dbo.Leasehold_Landlord AS B ON landlord=b.id "
                       + " INNER JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_occupancy AS C ON C.ID=A.OCCUPANCY and c.unit not in ('no','870','300064') ) AS ll ON OTH.Unit =LL.Unit "
                       + " LEFT JOIN [APPSQL-3].[Anglicare].dbo.PropertyStructure_Unit as PSU  ON PSU.ID=OTH.UNIT "
                       + " LEFT JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_Occupancy as OO on OO.id = OTH.Occupancy "
                       + " where OTH.id NOT IN (select id from [APPSQL-3].[Anglicare].dbo.Occupancies_TransactionHeaders where (type =56 or (type =7 and source =15))) "
                       +" and  CAST(YEAR(OTH.timestamp) AS VARCHAR(4)) "
                       +" +(CASE LEN(MONTH(OTH.timestamp)) "
                       +"   WHEN 1 THEN '0'+ CAST(MONTH(OTH.timestamp) AS VARCHAR(2)) "
                       +" ELSE CAST(MONTH(OTH.timestamp) AS VARCHAR(2)) "
                       +" END) "
                       +" +(CASE LEN(DAY(OTH.timestamp)) "
                       +" WHEN 1 THEN '0'+ CAST(DAY(OTH.timestamp) AS VARCHAR(2)) "
                       +" ELSE CAST(DAY(OTH.timestamp) AS VARCHAR(2)) "
                       +" END)"    
                       +" ='"+newrundate+"'";
            SqlCommand Cmd = new SqlCommand(sqlstr, connsql);
            ft_db = (int)Cmd.ExecuteScalar();
            TextBox2.Text = TextBox2.Text + "   Total records for Financial Transaction data (most types) is  :" + ft_db.ToString() +" \r\n";


            //check  Finance Transcation _Leaseholder Debit data       
            string sqlstr3 = "SELECT count(*)   "
                       + " FROM [APPSQL-3].anglicare.dbo.Occupancies_TransactionHeaders AS OTH "
                       + " INNER JOIN [APPSQL-3].anglicare.dbo.Occupancies_TransactionHeaderTypes AS DTHT ON OTH.Type=DTHT.ID "
                       + " LEFT JOIN (SELECT a.Landlord,a.LandlordReference,a.Occupancy, b.Name,C.Unit  FROM [APPSQL-3].anglicare.dbo.Leasehold_Agreement as a  LEFT JOIN [APPSQL-3].anglicare.dbo.Leasehold_Landlord AS B ON landlord=b.id "
                       + " INNER JOIN [APPSQL-3].anglicare.dbo.Occupancies_occupancy AS C ON C.ID=A.OCCUPANCY and c.unit not in ('no','870','300064') ) AS ll ON OTH.Unit =LL.Unit "
                       + " LEFT JOIN [APPSQL-3].anglicare.dbo.PropertyStructure_Unit as PSU  ON PSU.ID=OTH.UNIT "
                       + " left join  [APPSQL-3].anglicare.dbo.PropertyStructure_BlockUnit as bb on psu.id = bb.Unit "
                       +" left join "
                       + " [APPSQL-3].anglicare.dbo.PropertyStructure_Block as cc on bb.block = cc.Code "
                       +" left join "
                       + " [APPSQL-3].anglicare.dbo.PropertyStructure_District as ee on cc.District = ee.Code "
                       +" left join "
                       + " [APPSQL-3].anglicare.dbo.PropertyStructure_scheme as dd on cc.Scheme = dd.Code "
                       + "  left join [APPSQL-3].anglicare.dbo.HomeTeam_LookupValues as nn on PSU.FinancialAnalysis2 = nn.id and nn.lookup ='414' "
                       + "  left join [APPSQL-3].anglicare.dbo.HomeTeam_LookupValues as na on PSU.FinancialAnalysis1 = na.id and na.lookup ='413' "
                       + " WHERE   oth.type in('42','79','78','82','80','81') and OTH.Reference1 not like '%Centrelink%' "
                       +" and nn.name  in ('P1','P2','P3') "
                       +"and   CAST(YEAR(OTH.timestamp) AS VARCHAR(4)) "
                       +"    +(CASE LEN(MONTH(OTH.timestamp)) "
                       +"       WHEN 1 THEN '0'+ CAST(MONTH(OTH.timestamp) AS VARCHAR(2)) "
                       +"      ELSE CAST(MONTH(OTH.timestamp) AS VARCHAR(2)) "
                       +"      END)+(CASE LEN(day(OTH.timestamp)) "
                       +"    WHEN 1 THEN '0'+ CAST(day(OTH.timestamp) AS VARCHAR(2)) "
                       +"    ELSE CAST(day(OTH.timestamp) AS VARCHAR(2)) "
                       +"    END) "
                       +" ='" + newrundate + "'"
                       +"and ll.landlord is not null "
                       +" --and ee.code in ('ASA','LAW')";
        
            SqlCommand Cmd3 = new SqlCommand(sqlstr3, connsql);
            ls_db = (int)Cmd3.ExecuteScalar();
            TextBox2.Text = TextBox2.Text + "   Total records for Leaseholder Debit data is  :" + ls_db.ToString() + " \r\n";



            //check  Rent Payments Centrelink data       
            string sqlstr4 = "SELECT count(*)   "
                          + " FROM [APPSQL-3].[Anglicare].dbo.Occupancies_TransactionHeaders AS OTH                                                                                                        "
                          + " LEFT JOIN [APPSQL-3].[Anglicare].dbo.PropertyStructure_BlockUnit AS B ON B.Unit=OTH.Unit                                                                               "
                          + " Left JOIN  [APPSQL-3].[Anglicare].dbo.PropertyStructure_Block AS PSB ON PSB.Code=B.Block                                                          "
                          + " LEFT JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_Batches AS OB ON OTH.Batch = OB.ID                                                                                     "
                          + " INNER JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_TransactionHeaderTypes AS DTHT ON OTH.Type=DTHT.ID                                                                    "
                          +"  LEFT JOIN (                                                                                                                                                  "
                          +"                SELECT a.Landlord,a.Occupancy, b.Name,C.Unit                                                                                                       "
                          + "                FROM [APPSQL-3].[Anglicare].dbo.Leasehold_Agreement as a                                                                                                      "
                          + "                LEFT JOIN [APPSQL-3].[Anglicare].dbo.Leasehold_Landlord AS B ON landlord=b.id                                                                                 "
                          + "                INNER JOIN [APPSQL-3].[Anglicare].dbo.Occupancies_occupancy AS C ON C.ID=A.OCCUPANCY and c.unit not in ('no','870','300064') ) AS ll ON OTH.Unit =LL.Unit     "
                          + "      LEFT JOIN [APPSQL-3].Anglicare.dbo.PropertyStructure_Unit as PSU  ON PSU.ID=OTH.UNIT                                                                                    "
                          + "      LEFT JOIN [APPSQL-3].Anglicare.dbo.Companies_BankAccounts as CBK ON OTH.BankAccount = CBK.ID                                                                            "                                                                                                                                                         
                          +" WHERE (oth.type =56 or (oth.type =7 and oth.source =15))                                                                                                          "
                          +" and CAST(YEAR(OTH.timestamp) AS VARCHAR(4))                                                                                                                       "
                          +"      +(CASE LEN(MONTH(OTH.timestamp))                                                                                                                             "
                          +"             WHEN 1 THEN '0'+ CAST(MONTH(OTH.timestamp) AS VARCHAR(2))                                                                                             "
                          +"             ELSE CAST(MONTH(OTH.timestamp) AS VARCHAR(2))                                                                                                         "
                          +"       END)                                                                                                                                                        "
                          +"      +(CASE LEN(DAY(OTH.timestamp))                                                                                                                               "
                          +"             WHEN 1 THEN '0'+ CAST(DAY(OTH.timestamp) AS VARCHAR(2))                                                                                               "
                          +"             ELSE CAST(DAY(OTH.timestamp) AS VARCHAR(2))                                                                                                           "
                          +"       END)                                                                                                                                                        "                                                                                                                                              
                          +" ='"+newrundate+"'";

           SqlCommand Cmd4 = new SqlCommand(sqlstr4, connsql);
           cl_db = (int)Cmd4.ExecuteScalar();
           TextBox2.Text = TextBox2.Text + "   Total records for Rent Payments Centrelink is  :" + cl_db.ToString() + " \r\n";

           


            //check work orders data
            
            string sqlstr2 = " SELECT                                                                                                                     "
                             +" count(*)                                                                                                                                                 "
                             + " FROM [APPSQL-3].[Anglicare].dbo.Repairs_WorksOrder AS WO                                                                                                            "
                             + " LEFT JOIN (SELECT worksorder, max(unit) as unit from [APPSQL-3].[Anglicare].dbo.Repairs_WorksOrder_UnitJoin GROUP BY  worksorder) AS A ON WO.ID=A.WorksOrder  "
                             + " INNER JOIN [APPSQL-3].[Anglicare].dbo.PropertyStructure_BlockUnit AS B ON B.Unit=A.Unit                                                             "
                             + "      INNER JOIN  [APPSQL-3].[Anglicare].dbo.PropertyStructure_Block AS PSB ON PSB.Code=B.Block                                                "
                             + "      LEFT JOIN [APPSQL-3].[Anglicare].dbo.Contractors_Contractor AS CC ON CC.ID=WO.Contractor                                                                       "
                             + "      LEFT JOIN [APPSQL-3].[Anglicare].dbo.Repairs_WorksOrder_Revenue_External AS RWORE ON RWORE.ID=WO.ExternalRevenue                                               "
                             + "      INNER JOIN [APPSQL-3].[Anglicare].dbo.Repairs_WorksOrder_InvoicesJoin AS RWI ON RWI.WorksOrder=WO.ID                                                           "
                             + "                 INNER JOIN  [APPSQL-3].[Anglicare].dbo.Invoice AS INV ON INV.ID =RWI.Invoice                                                                        "
                             +" WHERE CAST(YEAR(INV.DateRecived) AS VARCHAR(4))                                                                                                          "
                             +"      +(CASE LEN(MONTH(INV.DateRecived))                                                                                                                  "
                             +"             WHEN 1 THEN '0'+ CAST(MONTH(INV.DateRecived) AS VARCHAR(2))                                                                                  "
                             +"             ELSE CAST(MONTH(INV.DateRecived) AS VARCHAR(2))                                                                                              "
                             +"       END)                                                                                                                                               "
                             +"      +(CASE LEN(DAY(INV.DateRecived))                                                                                                                    "
                             +"             WHEN 1 THEN '0'+ CAST(DAY(INV.DateRecived) AS VARCHAR(2))                                                                                    "
                             +"             ELSE CAST(DAY(INV.DateRecived) AS VARCHAR(2))                                                                                                "
                             +"       END)                                                                                                                                               "
                             + " ='" + newrundate + "'";       

            SqlCommand Cmd2 = new SqlCommand(sqlstr2, connsql);
            wk_db = (int)Cmd2.ExecuteScalar();
          //  TextBox2.Text = TextBox2.Text + "   Total records for Work Order data is  :" + wk_db.ToString() +" \r\n";

            TextBox2.Text = TextBox2.Text + " == Check database querey finished == \r\n";
        }
        catch (Exception eee)
        {

            TextBox2.Text = "#Query From Database ERROR# " + eee.Message + " .Please try again!";
        }
        finally
        {
           connsql.Close();
        }
        //compare the records
        TextBox2.Text = TextBox2.Text + "\r\n";
        TextBox2.Text = TextBox2.Text + " ************************** ETL Check Conclusion ************************* \r\n";
        if (ft_db == ft_csv) 
        { 
           TextBox2.Text = TextBox2.Text + "   [GOOD]the Financial Transaction (most types) data records in CSV is the same with the ones got from database query \r\n";
        }
        else
        {
            TextBox2.Text = TextBox2.Text + "   [SORRY]the Financial Transaction (most types)  data records in CSV is not the same with the ones got from database query. Please check! \r\n";
        }

        if (ls_db == ls_csv)
        {
            TextBox2.Text = TextBox2.Text + "   [GOOD]the Leaseholder Debit data records in CSV is the same with the ones got from database query \r\n";
        }
        else
        {
            TextBox2.Text = TextBox2.Text + "   [SORRY]the Leaseholder Debit data records in CSV is not the same with the ones got from database query. Please check! \r\n";
        }

        if (cl_db == cl_csv)
        {
            TextBox2.Text = TextBox2.Text + "   [GOOD]the Rent Payments Centrelink data records in CSV is the same with the ones got from database query \r\n";
        }
        else
        {
            TextBox2.Text = TextBox2.Text + "   [SORRY]the Rent Payments Centrelink data records in CSV is not the same with the ones got from database query. Please check! \r\n";
        }

       // because the work orders use Lookupfile, cannot use SQL to get the daily numbers

       // if (wk_db == wk_csv) 
      //  { 
       //    TextBox2.Text = TextBox2.Text + "   [GOOD]the Work Orders data records in CSV is the same with the ones got from database query \r\n";
      //  }
       // else
       // {  
        //  TextBox2.Text = TextBox2.Text + "   [SORRY]the Work Orders data records in CSV is not the same with the ones got from database query. Please check! \r\n";
        //}
       TextBox2.Text = TextBox2.Text + " ************************************************************************* \r\n";

       }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {



    }


}

