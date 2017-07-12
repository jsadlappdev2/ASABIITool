<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of CC_ImportTimesheet-bak.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 825px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <strong><span style="font-size: large; color: #0000FF">Load ComCare Timesheet file and Process for CIM<br />
                </span><span style="font-size: small; color: #0000FF">-- Please generate timesheet file using ComCare front end before loading:<br />
                </span></strong><br style="font-size: large; color: #0000FF; font-weight: 700" />

      

                <asp:Panel ID="Panel1" runat="server" Height="507px" Width="759px">
                    &nbsp;*ComCare timesheet files default network folder-- <a href="file://clank/comcaretest/Payrol*">\\clank\comcaretest\Payroll\*</a>
                    <br />
                    <br />
                    <span style="color: #0000FF"><span style="text-decoration: underline"><i><b>First step: select timesheet file</b></i></span></span><i><b><br style="text-decoration: underline" /> </b></i>
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" style="font-weight: bold; font-style: italic; " Width="720px" />
&nbsp;<i><b><br style="text-decoration: underline" /> </b></i><span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Second step:</span><span style="text-decoration: underline"><i><b> &nbsp; </b></i></span>
                    <asp:Button ID="Button1" runat="server" Height="26px" OnClick="Button1_Click1" style="font-weight: bold; font-style: italic; " Text="Import Timesheet File" Width="115px" />
                    &nbsp;<b><i><br style="text-decoration: underline" />
                    <br style="text-decoration: underline" />
                    </i><span style="text-decoration: underline; font-style: italic; color: #0000FF">Third Step: </span><i>&nbsp;&nbsp;&nbsp;&nbsp; </i>
                    <asp:Button ID="Button4" runat="server" style="font-weight: 700; font-style: italic; " Text="Data Process" Width="110px" />
                    <br />
                    <br />
                    <span style="color: #FF0000"><i>Reports:&nbsp;&nbsp; <span style="text-decoration: underline">TimeSheets for CIM;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="text-decoration: underline">&nbsp;Statistics reports</span></i></span></b><asp:Panel ID="Panel2" runat="server" Height="251px" Width="730px" style="text-decoration: underline">
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Timesheet import and process logs:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ClearLogs" Width="120px" style="font-style: italic; font-weight: 700; color: #000000" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="237px" TextMode="MultiLine" Width="730px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" Height="170px" PageSize="4" style="font-size: 8pt" Width="872px">
                            <Columns>
                                <asp:BoundField DataField="Provider_ID" HeaderText="Provider_ID" SortExpression="Provider_ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Payroll_Number" HeaderText="Payroll_Number" SortExpression="Payroll_Number" />
                                <asp:BoundField DataField="Activity_Start_Date" HeaderText="Activity_Start_Date" SortExpression="Activity_Start_Date" />
                                <asp:BoundField DataField="Activity_Start_Time" HeaderText="Activity_Start_Time" SortExpression="Activity_Start_Time" />
                                <asp:BoundField DataField="Activity_End_Date" HeaderText="Activity_End_Date" SortExpression="Activity_End_Date" />
                                <asp:BoundField DataField="Activity_End_Time" HeaderText="Activity_End_Time" SortExpression="Activity_End_Time" />
                                <asp:BoundField DataField="column1" HeaderText="column1" SortExpression="column1" />
                                <asp:BoundField DataField="Travel_Duration_in_minutes" HeaderText="Travel_Duration_in_minutes" SortExpression="Travel_Duration_in_minutes" />
                                <asp:BoundField DataField="Activity_Duration_in_minutes" HeaderText="Activity_Duration_in_minutes" SortExpression="Activity_Duration_in_minutes" />
                                <asp:BoundField DataField="Km_Travelled" HeaderText="Km_Travelled" SortExpression="Km_Travelled" />
                                <asp:BoundField DataField="Funding_Code" HeaderText="Funding_Code" SortExpression="Funding_Code" />
                                <asp:BoundField DataField="Authorised_by" HeaderText="Authorised_by" SortExpression="Authorised_by" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASADWHConnectionString %>" SelectCommand="SELECT [Provider ID] AS Provider_ID, [Name], [Payroll Number] AS Payroll_Number, [Activity Start Date] AS Activity_Start_Date, [Activity Start Time] AS Activity_Start_Time, [Activity End Date] AS Activity_End_Date, [Activity End Time] AS Activity_End_Time, [Classification-Centre from Round] AS column1, [Travel Duration in minutes] AS Travel_Duration_in_minutes, [Activity Duration in minutes] AS Activity_Duration_in_minutes, [Km Travelled] AS Km_Travelled, [Funding Code] AS Funding_Code, [Authorised by] AS Authorised_by FROM [CC_Timesheetfile_import] ORDER BY [Provider ID], [Shift Start Date], [Shift Start Time]"></asp:SqlDataSource>
                        <br />
                        <br />
                    </asp:Panel>
                 
                </asp:Panel>

            </td>
        </tr>
    </table>
</asp:Content>

