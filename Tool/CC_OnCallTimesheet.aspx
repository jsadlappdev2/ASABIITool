<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CC_OnCallTimesheet.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 825px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <strong><span style="font-size: large; color: #0000FF">ComCare OnCall Timesheet data Process<br />
                </span><span style="font-size: small; color: #0000FF">-- Please make sure that you have finished the timesheet has been authorised in ComCare for OnCall Providers<br />
                </span></strong><br style="font-size: large; color: #0000FF; font-weight: 700" />

      

                <asp:Panel ID="Panel1" runat="server" Height="447px" Width="1260px">
                    <span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Plesase select the pay period</span>:&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="26px" Width="529px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                    <b><i>
                    <br style="text-decoration: underline" />
                    </i><span style="text-decoration: underline; font-style: italic; color: #0000FF">Second Step: </span><i>&nbsp;&nbsp;&nbsp;&nbsp; </i>
                    <asp:Button ID="Button4" runat="server" style="font-weight: 700; font-style: italic; " Text="Data Process" Width="110px" OnClick="Button4_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <span style="color: #FF0000"><i>Reports:&nbsp;&nbsp; &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://10.100.0.141:90/ASAReportServer/CC_OncallTimesheet.aspx" Target="_Blank">Report_OnCallTimesheet</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></span></b><asp:Panel ID="Panel2" runat="server" Height="251px" Width="730px" style="text-decoration: underline">
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Timesheet import and process logs:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ClearLogs" Width="120px" style="font-style: italic; font-weight: 700; color: #000000" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="159px" TextMode="MultiLine" Width="723px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" PageSize="6" Width="1284px">
                            <Columns>
                                <asp:BoundField DataField="Provider_ID" HeaderText="Provider_ID" SortExpression="Provider_ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Payroll_Number" HeaderText="Payroll_Number" SortExpression="Payroll_Number" />
                                <asp:BoundField DataField="Activity_Start_Date" HeaderText="Activity_Start_Date" SortExpression="Activity_Start_Date" />
                                <asp:BoundField DataField="Activity_Start_Time" HeaderText="Activity_Start_Time" SortExpression="Activity_Start_Time" />
                                <asp:BoundField DataField="Activity_End_Date" HeaderText="Activity_End_Date" SortExpression="Activity_End_Date" />
                                <asp:BoundField DataField="Activity_End_Time" HeaderText="Activity_End_Time" SortExpression="Activity_End_Time" />
                                <asp:BoundField DataField="Scheduled_Duration" HeaderText="Scheduled_Duration" SortExpression="Scheduled_Duration" />
                                <asp:BoundField DataField="Km_Travelled" HeaderText="Km_Travelled" SortExpression="Km_Travelled" />
                                <asp:BoundField DataField="Travel_Duration_in_minutes" HeaderText="Travel_Duration_in_minutes" SortExpression="Travel_Duration_in_minutes" />
                                <asp:BoundField DataField="Authorised_by" HeaderText="Authorised_by" SortExpression="Authorised_by" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString2 %>" SelectCommand="SELECT [Provider ID] AS Provider_ID, [Name], [Payroll Number] AS Payroll_Number, [Activity Start Date] AS Activity_Start_Date, [Activity Start Time] AS Activity_Start_Time, [Activity End Date] AS Activity_End_Date, [Activity End Time] AS Activity_End_Time, [Scheduled Duration] AS Scheduled_Duration, [Km Travelled] AS Km_Travelled, [Travel Duration in minutes] AS Travel_Duration_in_minutes, [Authorised by] AS Authorised_by FROM [CC_Oncall_Import] ORDER BY [Provider ID], [Shift Start Date], [Shift Start Time]"></asp:SqlDataSource>
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" Height="226px" PageSize="4" style="font-size: small" Width="1278px">
                            <Columns>
                                <asp:BoundField DataField="Lno" HeaderText="Lno" InsertVisible="False" ReadOnly="True" SortExpression="Lno" />
                                <asp:BoundField DataField="PR_StartDay" HeaderText="PR_StartDay" SortExpression="PR_StartDay" />
                                <asp:BoundField DataField="PR_EndDay" HeaderText="PR_EndDay" SortExpression="PR_EndDay" />
                                <asp:BoundField DataField="DP_Log" HeaderText="DP_Log" SortExpression="DP_Log" />
                                <asp:BoundField DataField="InsertTime" HeaderText="InsertTime" SortExpression="InsertTime" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString %>" SelectCommand="SELECT [Lno], [PR_StartDay], [PR_EndDay], [DP_Log], [InsertTime] FROM [CC_Oncall_DataProcess_Log] ORDER BY [Lno], [InsertTime]"></asp:SqlDataSource>
                        <br />
                    </asp:Panel>
                 
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

