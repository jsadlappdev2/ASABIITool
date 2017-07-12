<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CC_ImportTimesheetForTechOneAutoPay.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 825px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <strong><span style="font-size: large; color: #0000FF">ComCare &amp; TechOne integration for AutoPay Mileage<br />
                </span><span style="font-size: small; color: #0000FF">-- Please note: autopay timesheet for mileage is extracted from ComCare database table<br />
                -- Don&#39;t need to export into file and load<br />
                </span></strong><br style="font-size: large; color: #0000FF; font-weight: 700" />

      

                <asp:Panel ID="Panel1" runat="server" Height="447px" Width="1260px">
                    &nbsp;<asp:Label ID="Label10" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Select pay period</span>:&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="26px" Width="529px" AutoPostBack="True">
                    </asp:DropDownList>
                    <span style="text-decoration: underline"><i><b> &nbsp;</b></i></span>&nbsp;<b><i>&nbsp; 
                    <br style="text-decoration: underline" />
                    <br style="text-decoration: underline" />
                    </i><span style="text-decoration: underline; font-style: italic; color: #0000FF">[1] Data Process: </span><i>&nbsp;&nbsp;&nbsp;&nbsp; </i>
                    <asp:Button ID="Button4" runat="server" style="font-weight: 700; font-style: italic; " Text="Step1: Data  Extraction and Process" Width="250px" OnClick="Button4_Click" Height="30px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <i><span><span style="color: #0000FF; text-decoration: underline;">[2] Export csv files:</span>&nbsp;&nbsp; </span>
                    <asp:Button ID="Button9" runat="server" Height="22px" OnClick="Button9_Click" Text="Export into one file" Width="251px" style="font-style: italic; font-weight: 700" />
                    </i><span style="text-decoration: underline">
                    <br />
                    </span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lines/File </span><span style="text-decoration: underline">
                    <asp:TextBox ID="TextBox4" runat="server" Height="22px" Width="67px">2000</asp:TextBox>
                    &nbsp;<asp:Button ID="Button8" runat="server" Height="31px" style="font-weight: 700; font-style: italic" Text="Step2: Export into several csv files" Width="248px" OnClick="Button8_Click" />
                    &nbsp;</span></b><span style="font-size: x-small; color: #0000FF;">--Please input how many lines in a file and then click Export button</span><b><br />
                    </b>
                 
                    </b>
                 
                    <span style="color: #FF0000"><i>&nbsp; &nbsp;<br />
                    <asp:Panel ID="Panel2" runat="server" Height="251px" style="text-decoration: underline" Width="730px">
                        <br />
                        <asp:Label ID="Label8" runat="server" style="color: #0000CC" Text="Timesheet import and process logs:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="font-style: italic; font-weight: 700; color: #000000" Text="ClearLogs" Width="120px" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="168px" TextMode="MultiLine" Width="963px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" Height="80px" PageSize="4" style="font-size: x-small; color: #000000;" Width="1278px">
                            <Columns>
                                <asp:BoundField DataField="Lno" HeaderText="Lno" InsertVisible="False" ReadOnly="True" SortExpression="Lno" />
                                <asp:BoundField DataField="PR_StartDay" HeaderText="PR_StartDay" SortExpression="PR_StartDay" />
                                <asp:BoundField DataField="PR_EndDay" HeaderText="PR_EndDay" SortExpression="PR_EndDay" />
                                <asp:BoundField DataField="DP_Log" HeaderText="DP_Log" SortExpression="DP_Log" />
                                <asp:BoundField DataField="InsertTime" HeaderText="InsertTime" SortExpression="InsertTime" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString %>" SelectCommand="SELECT [Lno], [PR_StartDay], [PR_EndDay], [DP_Log], [InsertTime] FROM  CC_T1_Timesheet_DataProcess_Log_AP ORDER BY [Lno], [InsertTime]"></asp:SqlDataSource>
                        <br />
                    </asp:Panel>
                    </i></span>
                 
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

