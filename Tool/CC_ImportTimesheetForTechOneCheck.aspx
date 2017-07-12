<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CC_ImportTimesheetForTechOneCheck.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 825px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <strong><span style="font-size: x-large; color: #0000FF">ComCare &amp; T1 timesheet integration extract and import records number check:
                </span><span style="font-size: large; color: #0000FF">&nbsp;<span style="font-weight: normal"><br />
                </span>
                </span><span style="font-weight: normal"><span style="font-size: x-small; color: #CC0000">**Records number in ComCare database which have been authorised and extrated into files for the selected period (RN1)
                <br />
                **Records number in Data Warehouse table which have been imported through timesheet files (RN2)<br />
                **If RN1=RN2, then All GOOD!</span></span><span style="font-size: x-small; color: #0000FF"><br />
                -- Please first import ComCare timesheet files and do checking</span></strong><br style="font-size: x-small; color: #0000FF; font-weight: 700" />

      

                <asp:Panel ID="Panel1" runat="server" Height="447px" Width="1260px">
                    &nbsp;*ComCare timesheet files default network folder-- 
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    <a href="file://clank/comcaretest/Payrol*">*</a>
                    <br />
                    <span style="color: #0000FF; font-weight: bold; font-style: italic; text-decoration: underline">Select pay period</span>:&nbsp; &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="26px" Width="529px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <i><b><span style="color: #0000FF; text-decoration: underline">Select check target:</span>
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="27px" Width="529px">
                        <asp:ListItem Value="c1">-- Check Records for TechOne integration --</asp:ListItem>
                        <asp:ListItem Value="c2">-- Check Records for CIM report ----</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br style="text-decoration: underline" />
                    </b></i>
                    &nbsp;<b><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; </i>
                    <asp:Button ID="Button4" runat="server" style="font-weight: 700; font-style: italic; " Text="Check" Width="250px" OnClick="Button4_Click" Height="30px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <span style="color: #FF0000"><i>
                    <asp:Panel ID="Panel2" runat="server" Height="251px" style="text-decoration: underline" Width="730px">
                        <asp:TextBox ID="TextBox3" runat="server" Height="168px" TextMode="MultiLine" Width="963px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                    </asp:Panel>
                    </i></span></b>
                 
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

