<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ETL_Jobs.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 619px; width: 101%">

        <tr>

            <td valign="top" align="left">

           
                <p style="height: 32px; color: #0000FF; font-size: large; width: 871px;"><strong>Check SQL Server Database ETL Jobs Execute Status:</strong></p>
                <p style="height: 64px">Notes: SSIS packages are deployed to SQL Server Integration Services and they run at a sheduled time invoked by SQL Server Agent Jobs.</p>
                <br />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="jobstatus" EnableModelValidation="True" Width="883px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                <asp:SqlDataSource ID="jobstatus" runat="server" ConnectionString="<%$ ConnectionStrings:IntegrationToolDBConnectionString %>" SelectCommand="SELECT 
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
    [APPSQL-3].[msdb].[dbo].[sysjobs] AS [sJOB]
    LEFT JOIN (
                SELECT
                    [job_id]
                    , MIN([next_run_date]) AS [NextRunDate]
                    , MIN([next_run_time]) AS [NextRunTime]
                FROM [APPSQL-3].[msdb].[dbo].[sysjobschedules]
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
                FROM [APPSQL-3].[msdb].[dbo].[sysjobhistory]
                WHERE [step_id] = 0
            ) AS [sJOBH]
        ON [sJOB].[job_id] = [sJOBH].[job_id]
        AND [sJOBH].[RowNumber] = 1
where [sJOB].[name]  in ('KyperaToTechoneFinance-LiveEnv');" OnSelecting="jobstatus_Selecting"></asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

