<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ETL_Kyperatotechone.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 619px; width: 101%">

        <tr>

            <td valign="top" align="left">

                
                <p style="color: #0000FF; font-size: large"><strong>Execute KyperaToTechone ETL job manually: </strong> </p>
                <p>Extract Financial Transaction data and Work Orders data, generate csv files and upload to Techone network folder for ETL jobs </p>

                <asp:Panel ID="Panel1" runat="server" Height="479px" Width="744px">
                    <asp:Label ID="Label3" runat="server" Text="Please select job date:" style="color: #CC3300"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="78px" Width="97px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    &nbsp;<br />&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Execute" Width="115px" />
                    &nbsp;&nbsp;<br />
                    <asp:Panel ID="Panel2" runat="server" Height="251px" Width="730px">
                        <asp:Label ID="Label8" runat="server" Text="Package execution logs:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ClearLogs" Width="120px" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="125px" TextMode="MultiLine" Width="713px"></asp:TextBox>
                    </asp:Panel>
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

