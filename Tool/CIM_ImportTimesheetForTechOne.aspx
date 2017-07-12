<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CIM_ImportTimesheetForTechOne.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 825px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <strong><span style="font-size: large; color: #0000FF">Load CIM Timesheet file and Process for TechOne<br />
                </span></strong>

      

                <asp:Panel ID="Panel1" runat="server" Height="447px" Width="1260px">
                    &nbsp;*Please upload CIM timesheet files (named as: CIMT1_XX) to -- 
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    <a href="file://clank/comcaretest/Payrol*">*</a>
                    <br />
                    &nbsp;*Note: put the new data in Excel and save as csv on the same folder<br />
                    <br />
                    <span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Plesase select the pay period</span>:&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="26px" Width="529px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <span style="color: #0000FF"><span style="text-decoration: underline"><i><b>First step: check all the timesheet files for the selected pay period on the server folder&nbsp;&nbsp;&nbsp;<br /> :</b><asp:Button ID="Button6" runat="server" Height="30px" OnClick="Button6_Click" style="font-style: italic; font-weight: 700" Text="Step1: check all the files" Width="240px" />
                    </i></span></span><i><b>
                    <br style="text-decoration: underline" />
                    </b></i>&nbsp;<i><b><br style="text-decoration: underline" /> </b></i><span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Second step:</span><span style="text-decoration: underline"><i><b> &nbsp; </b></i></span>
                    <asp:Button ID="Button1" runat="server" Height="30px" OnClick="Button1_Click1" style="font-weight: bold; font-style: italic; " Text="Step2: Import Timesheet Files" Width="250px" />
                    &nbsp;<b><i>&nbsp;
                    <br style="text-decoration: underline" />
                    <br style="text-decoration: underline" />
                    </i><span style="text-decoration: underline; font-style: italic; color: #0000FF">Third Step: </span><i>&nbsp;&nbsp;&nbsp;&nbsp; </i>
                    <asp:Button ID="Button4" runat="server" style="font-weight: 700; font-style: italic; " Text="Step3: Data Process" Width="250px" OnClick="Button4_Click" Height="30px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <span style="text-decoration: underline"><i><span style="color: #0000FF">Fourth step:</span>&nbsp;&nbsp; </i>
                    <asp:Button ID="Button7" runat="server" style="font-weight: 700; font-style: italic; margin-bottom: 0px" Text="Step4: Export timesheet for TechOne" Width="401px" Height="30px" OnClick="Button7_Click" />
                    </span>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lines/File:
                    </b>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <span style="color: #FF0000"><b><i>&nbsp;<asp:Button ID="Button8" runat="server" OnClick="Button8_Click" style="font-weight: 700; font-style: italic" Text="Export into Serveral files" Width="210px" />
                    &nbsp;<span style="text-decoration: underline">&nbsp;</span><span style="font-size: x-small; color: #0000FF;">--Please input how many lines in a file and then click Export button</span><br />
                    <asp:Panel ID="Panel2" runat="server" Height="251px" style="text-decoration: underline" Width="730px">
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Timesheet import and process logs:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="font-style: italic; font-weight: 700; color: #000000" Text="ClearLogs" Width="120px" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="186px" TextMode="MultiLine" Width="963px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" Height="128px" PageSize="4" style="font-size: small; color: #000000;" Width="1278px">
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
                    </i></b></span>
                 
                    </b>
                 
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

