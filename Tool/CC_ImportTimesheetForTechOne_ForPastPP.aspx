<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CC_ImportTimesheetForTechOne_ForPastPP.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 825px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <strong><span style="font-size: large; color: #0000FF">Load ComCare Timesheet file and Process for TechOne for Past Periods<br />
                </span><span style="font-size: small; color: #0000FF">-- Please note: this process is just for Past Periods (re-extract missing timesheet from ComCare and re-import into T1)<br />
                -- You must finish all the below processes in the same day when you re-extract missing timesheet from ComCare<br />
                </span></strong><br style="font-size: large; color: #0000FF; font-weight: 700" />

      

                <asp:Panel ID="Panel1" runat="server" Height="447px" Width="1260px">
                    &nbsp;*ComCare timesheet files default network folder-- 
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    <a href="file://clank/comcaretest/Payrol*">*</a>
                    <br />
                    <span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Select pay period</span>:&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="26px" Width="529px" AutoPostBack="True">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <span style="color: #0000FF"><span style="text-decoration: underline"><i><b>[1]: check all timesheet files for the selected pay period on the server folder&nbsp;&nbsp;&nbsp;:</b><asp:Button ID="Button6" runat="server" Height="30px" OnClick="Button6_Click" style="font-style: italic; font-weight: 700" Text="Step1: check all the files" Width="240px" />
                    </i></span></span><i><b><br style="text-decoration: underline" /> </b></i>
                    &nbsp;<i><b><br style="text-decoration: underline" /> </b></i><span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">[2] Import files:</span><span style="text-decoration: underline"><i><b> &nbsp; </b></i></span>
                    <asp:Button ID="Button1" runat="server" Height="30px" OnClick="Button1_Click1" style="font-weight: bold; font-style: italic; " Text="Step2: Import Timesheet Files" Width="250px" />
                    &nbsp;<b><i>&nbsp; <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Tool/ValidateCCImportOriginalTimesheet.aspx" Target="_blank">##Validate import original data##</asp:HyperLink>
                    <br style="text-decoration: underline" />
                    <br style="text-decoration: underline" />
                    </i><span style="text-decoration: underline; font-style: italic; color: #0000FF">[3] Data Process: </span><i>&nbsp;&nbsp;&nbsp;&nbsp; </i>
                    <asp:Button ID="Button4" runat="server" style="font-weight: 700; font-style: italic; " Text="Step3: Data Process" Width="250px" OnClick="Button4_Click" Height="30px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Tool/ValidateCCImportTimesheet.aspx" Target="_blank">##Validate processed data##</asp:HyperLink>
                    <br />
                    <br />
                    <i><span><span style="color: #0000FF; text-decoration: underline;">[4] Export csv files:</span>&nbsp;&nbsp; </span></i><span style="text-decoration: underline">
                    <asp:Button ID="Button7" runat="server" Height="31px" OnClick="Button7_Click" style="font-weight: 700; font-style: italic; margin-bottom: 0px" Text="Step4: Export timesheet for TechOne (one file)" Width="319px" Enabled="False" />
                    &nbsp;<br />
                    <br />
                    </span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lines/File </span><span style="text-decoration: underline">
                    <asp:TextBox ID="TextBox4" runat="server" Height="22px" Width="67px">2000</asp:TextBox>
                    &nbsp;<asp:Button ID="Button8" runat="server" Height="31px" style="font-weight: 700; font-style: italic" Text="Step4: Export into several csv files" Width="248px" OnClick="Button8_Click" />
                    &nbsp;</span></b><span style="font-size: x-small; color: #0000FF;">--Please input how many lines in a file and then click Export button</span><b><br />
                    <br />
                    </b><span style="color: #FF0000"><i><b>&nbsp;&nbsp; &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://10.10.1.186:90/ASAReportServer/CC_Timesheet_ForTechOne.aspx" Target="_Blank">======Report: Employee Timesheet report for Checking (ComCare original timesheet, processed data and export csv file)===== </asp:HyperLink>
                    <br />
                  
                    <asp:Panel ID="Panel2" runat="server" Height="251px" style="text-decoration: underline" Width="730px">
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Timesheet import and process logs:" style="color: #0000CC"></asp:Label>
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString %>" SelectCommand="SELECT [Lno], [PR_StartDay], [PR_EndDay], [DP_Log], [InsertTime] FROM  CC_T1_Timesheet_DataProcess_Log ORDER BY [Lno], [InsertTime]"></asp:SqlDataSource>
                        <br />
                    </asp:Panel>
                    </i></span>
                 
                    </b>
                 
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

