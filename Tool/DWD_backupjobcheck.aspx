<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DWD_backupjobcheck.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="860px">
           

                           <span style="font-size: large; color: #0000FF"><strong>Backup job check</strong></span> -- job runs&nbsp; at DWDASA db daily and automaticlly to backup tables from destination databases<br />
           

                           <div class="BoxSearchBar">           
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </div>
                                        
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="backuptables_jobstatus" EnableModelValidation="True" Width="1077px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="JobID" HeaderText="JobID" ReadOnly="True" SortExpression="JobID" />
                        <asp:BoundField DataField="JobName" HeaderText="JobName" SortExpression="JobName" />
                        <asp:BoundField DataField="LastRunDateTime" HeaderText="LastRunDateTime" ReadOnly="True" SortExpression="LastRunDateTime" />
                        <asp:BoundField DataField="LastRunStatus" HeaderText="LastRunStatus" ReadOnly="True" SortExpression="LastRunStatus" />
                        <asp:BoundField DataField="LastRunDuration (HH:MM:SS)" HeaderText="LastRunDuration (HH:MM:SS)" ReadOnly="True" SortExpression="LastRunDuration (HH:MM:SS)" />
                        <asp:BoundField DataField="LastRunStatusMessage" HeaderText="LastRunStatusMessage" SortExpression="LastRunStatusMessage" />
                        <asp:BoundField DataField="NextRunDateTime" HeaderText="NextRunDateTime" ReadOnly="True" SortExpression="NextRunDateTime" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                          <asp:SqlDataSource ID="backuptables_jobstatus" runat="server" ConnectionString="<%$ ConnectionStrings:IntegrationToolDBConnectionString %>" SelectCommand="SELECT 
    [sJOB].[job_id] AS [JobID]
    , [sJOB].[name] AS [JobName]
    , CASE 
        WHEN [sJOBH].[run_date] IS NULL OR [sJOBH].[run_time] IS NULL THEN NULL
        ELSE CAST(
                CAST([sJOBH].[run_date] AS CHAR(8))
                + ' ' 
                + STUFF(
                    STUFF(RIGHT('000000' + CAST([sJOBH].[run_time] AS VARCHAR(6)),  6)
                        , 3, 0, ':')
                    , 6, 0, ':')
                AS DATETIME)
      END AS [LastRunDateTime]
    , CASE [sJOBH].[run_status]
        WHEN 0 THEN 'Failed'
        WHEN 1 THEN 'Succeeded'
        WHEN 2 THEN 'Retry'
        WHEN 3 THEN 'Canceled'
        WHEN 4 THEN 'Running' -- In Progress
      END AS [LastRunStatus]
    , STUFF(
            STUFF(RIGHT('000000' + CAST([sJOBH].[run_duration] AS VARCHAR(6)),  6)
                , 3, 0, ':')
            , 6, 0, ':') 
        AS [LastRunDuration (HH:MM:SS)]
    , [sJOBH].[message] AS [LastRunStatusMessage]
    , CASE [sJOBSCH].[NextRunDate]
        WHEN 0 THEN NULL
        ELSE CAST(
                CAST([sJOBSCH].[NextRunDate] AS CHAR(8))
                + ' ' 
                + STUFF(
                    STUFF(RIGHT('000000' + CAST([sJOBSCH].[NextRunTime] AS VARCHAR(6)),  6)
                        , 3, 0, ':')
                    , 6, 0, ':')
                AS DATETIME)
      END AS [NextRunDateTime]
FROM 
    [msdb].[dbo].[sysjobs] AS [sJOB]
    LEFT JOIN (
                SELECT
                    [job_id]
                    , MIN([next_run_date]) AS [NextRunDate]
                    , MIN([next_run_time]) AS [NextRunTime]
                FROM [msdb].[dbo].[sysjobschedules]
                GROUP BY [job_id]
            ) AS [sJOBSCH]
        ON [sJOB].[job_id] = [sJOBSCH].[job_id]
    LEFT JOIN (
                SELECT 
                    [job_id]
                    , [run_date]
                    , [run_time]
                    , [run_status]
                    , [run_duration]
                    , [message]
                    , ROW_NUMBER() OVER (
                                            PARTITION BY [job_id] 
                                            ORDER BY [run_date] DESC, [run_time] DESC
                      ) AS RowNumber
                FROM [msdb].[dbo].[sysjobhistory]
                WHERE [step_id] = 0
            ) AS [sJOBH]
        ON [sJOB].[job_id] = [sJOBH].[job_id]
        AND [sJOBH].[RowNumber] = 1
where [sJOB].[name] ='SP_BackupTables';"></asp:SqlDataSource>

                          <div class="BoxToolBar" style="color: #0000FF; width: 1066px;">
                              <strong><span style="font-size: large">If job ran fail , you can run the job manunally:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <br />
                              <br />
                              </strong>
                          </div>
                <asp:Panel ID="Panel1" runat="server" Height="134px" Width="1073px" BackColor="White">
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Run Backup Tables Job" BackColor="#FFCC00" />
                    &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Tick to select a special day(default day is yesterday):" />
                    &nbsp;<asp:TextBox ID="jobday" runat="server" Visible="False" Width="151px"></asp:TextBox>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    <br />
                    <br />
                   <asp:Table ID="Table1" runat="server" CellPadding="5"
GridLines="horizontal" HorizontalAlign="left" Width="1072px" Height="60px" BorderStyle="Solid">
   <asp:TableRow>
     <asp:TableCell>Job Name:</asp:TableCell>
     <asp:TableCell>SP_BackupTables</asp:TableCell>
       <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
        <asp:TableCell></asp:TableCell>
          <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
        <asp:TableCell></asp:TableCell>
   </asp:TableRow>
   <asp:TableRow>
     <asp:TableCell>    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" BackColor="Yellow" ForeColor="Red"></asp:Label>
      </asp:TableCell>
     <asp:TableCell>
     </asp:TableCell>
       <asp:TableCell> </asp:TableCell>
       <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
        <asp:TableCell></asp:TableCell>
          <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
       <asp:TableCell></asp:TableCell>
        <asp:TableCell></asp:TableCell>
   </asp:TableRow>
</asp:Table>
             
                          <br />
             
                          </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Width="1069px">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="backlogs" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="1067px" Height="342px" PageSize="8">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Logno" HeaderText="Logno" InsertVisible="False" ReadOnly="True" SortExpression="Logno" />
                            <asp:BoundField DataField="Jobname" HeaderText="Jobname" SortExpression="Jobname" />
                            <asp:BoundField DataField="Tablename" HeaderText="Tablename" SortExpression="Tablename" />
                            <asp:BoundField DataField="Logs" HeaderText="Logs" SortExpression="Logs" />
                            <asp:BoundField DataField="Ltime" HeaderText="Ltime" SortExpression="Ltime" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="backlogs" runat="server" ConnectionString="<%$ ConnectionStrings:IntegrationToolDBConnectionString %>" SelectCommand="select * from [dbo].[BK_Logs] order by ltime desc"></asp:SqlDataSource>
                          </asp:Panel>
            </td>
        </tr>
       
    </table>  
</asp:Content>
