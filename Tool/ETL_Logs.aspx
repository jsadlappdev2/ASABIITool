<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ETL_Logs.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 519px; width: 101%">

        <tr>

            <td valign="top" align="left">

          
                <p><span style="font-size: large; color: #0000FF"><strong>Check ETL Jobs Execute Logs: </strong></span>
                </p>
                <p>Please select the job and date which you want to check:&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>KyperaToTechone</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Query" Width="89px" />
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </p>

                <asp:Panel ID="Panel1" runat="server" Height="478px" Width="910px">
                    <asp:Panel ID="Panel3" runat="server" Height="423px" Width="899px">
                        <asp:Label ID="Label5" runat="server" Text="Records Number Check Results:"></asp:Label>
                        &nbsp;if the records in CSV files are the same with the records in database query record, ETL josb are successfully. Otherwise you have to check the reason.<br />
                        <asp:TextBox ID="TextBox2" runat="server" Height="334px" TextMode="MultiLine" Width="880px"></asp:TextBox>
                    </asp:Panel>
                    <br />
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />&nbsp; &nbsp;&nbsp;<br />
                    </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

