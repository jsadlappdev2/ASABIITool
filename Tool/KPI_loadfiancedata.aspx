<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KPI_loadfiancedata.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 619px; width: 101%">

        <tr>

            <td valign="top" align="left">

                
                <p style="color: #0000FF; font-size: large"><b>Load</b><strong> Finance Strategic KPI from spreadsheet: </strong> </p>
                <p>Notes: the spreadsheet should be saved at the specific network folder / when data is updated</p>

                <asp:Panel ID="Panel1" runat="server" Height="479px" Width="744px">
                    &nbsp;&nbsp; &nbsp;&nbsp;<br />&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Click to Upload spreadsheet" Width="275px" BackColor="#66CCFF" />
                    &nbsp;&nbsp;<br /> <br />
                    <asp:Panel ID="Panel2" runat="server" Height="201px" Width="733px">
                        <asp:Label ID="Label8" runat="server" Text="Package execution logs:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ClearLogs" Width="120px" BackColor="#66CCFF" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="125px" TextMode="MultiLine" Width="713px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="asadwh_kpi" EnableModelValidation="True" Height="96px" PageSize="4" Width="1112px">
                            <Columns>
                                <asp:BoundField DataField="LogNo" HeaderText="LogNo" InsertVisible="False" ReadOnly="True" SortExpression="LogNo" />
                                <asp:BoundField DataField="JobName" HeaderText="JobName" SortExpression="JobName" />
                                <asp:BoundField DataField="JobLogs" HeaderText="JobLogs" SortExpression="JobLogs" />
                                <asp:BoundField DataField="InsertTime" HeaderText="InsertTime" SortExpression="InsertTime" />
                                <asp:BoundField DataField="ErrorsMsg" HeaderText="ErrorsMsg" SortExpression="ErrorsMsg" />
                                <asp:BoundField DataField="Note1" HeaderText="Note1" SortExpression="Note1" />
                                <asp:BoundField DataField="Note2" HeaderText="Note2" SortExpression="Note2" />
                                <asp:BoundField DataField="Note3" HeaderText="Note3" SortExpression="Note3" />
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="KPIfinance" EnableModelValidation="True" Height="353px" PageSize="4" Width="1239px">
                            <Columns>
                                <asp:BoundField DataField="ReportName" HeaderText="ReportName" SortExpression="ReportName" />
                                <asp:BoundField DataField="KPIName" HeaderText="KPIName" SortExpression="KPIName" />
                                <asp:BoundField DataField="column1" HeaderText="column1" SortExpression="column1" />
                                <asp:BoundField DataField="column2" HeaderText="column2" SortExpression="column2" />
                                <asp:BoundField DataField="column3" HeaderText="column3" SortExpression="column3" />
                                <asp:BoundField DataField="column4" HeaderText="column4" SortExpression="column4" />
                                <asp:BoundField DataField="column5" HeaderText="column5" SortExpression="column5" />
                                <asp:BoundField DataField="column6" HeaderText="column6" SortExpression="column6" />
                                <asp:BoundField DataField="column7" HeaderText="column7" SortExpression="column7" />
                                <asp:BoundField DataField="column8" HeaderText="column8" SortExpression="column8" />
                                <asp:BoundField DataField="column9" HeaderText="column9" SortExpression="column9" />
                                <asp:BoundField DataField="column10" HeaderText="column10" SortExpression="column10" />
                                <asp:BoundField DataField="column11" HeaderText="column11" SortExpression="column11" />
                                <asp:BoundField DataField="column12" HeaderText="column12" SortExpression="column12" />
                                <asp:BoundField DataField="KPI_ID" HeaderText="KPI_ID" SortExpression="KPI_ID" />
                                <asp:BoundField DataField="Load_date" HeaderText="Load_date" SortExpression="Load_date" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="KPIfinance" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString %>" SelectCommand="SELECT [ReportName], [KPIName], [Jul-15] AS column1, [Aug-15] AS column2, [Sep-15] AS column3, [Oct-15] AS column4, [Nov-15] AS column5, [Dec-15] AS column6, [Jan-16] AS column7, [Feb-16] AS column8, [Mar-16] AS column9, [Apr-16] AS column10, [May-16] AS column11, [Jun-16] AS column12, [KPI_ID], [Load_date] FROM [KPI_Finance_Original] ORDER BY [ReportName], [KPI_ID]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="asadwh_kpi" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString2 %>" SelectCommand="SELECT TOP(2) [LogNo], [JobName], [JobLogs], [InsertTime], [ErrorsMsg], [Note1], [Note2], [Note3] FROM [KPI_Jobs_Run_Logs] ORDER BY [InsertTime] DESC"></asp:SqlDataSource>
                    </asp:Panel>
                </asp:Panel>
                <br />

                <br />

            </td>
        </tr>
    </table>
</asp:Content>

