<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExecuteSSISPackage.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 519px; width: 101%">

        <tr>

            <td valign="top" align="left">

      

                <span style="font-size: large; color: #0000FF"><strong>Execute local SSIS Pacage:</strong></span><br style="font-size: large; color: #0000FF; font-weight: 700" />

      

                <asp:Panel ID="Panel1" runat="server" Height="479px" Width="744px">
                    <asp:Label ID="Label3" runat="server" Text="Please select / execute Local SSIS Package:"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="435px"  />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Execute" Width="115px" OnClick="Button1_Click1" />
                    &nbsp;<br /> &nbsp;<br /> <asp:CheckBox ID="CheckBox1" runat="server" Text="Package with parameter" />
                    <br />
                    <br />
                    &nbsp;<asp:Label ID="Label4" runat="server" Text="Parameter Name:"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Width="230px"></asp:TextBox>
                    <asp:Label ID="Label6" runat="server" Text="Example: RunDate"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Parameter Value:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" Width="228px"></asp:TextBox>
                    <asp:Label ID="Label7" runat="server" Text=" Example: 20150710"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="Panel2" runat="server" Height="251px" Width="730px">
                        <asp:Label ID="Label8" runat="server" Text="Package execution logs:"></asp:Label>
                        <br />
                        <br />
                        &nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ClearLogs" Width="120px" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" Height="151px" TextMode="MultiLine" Width="713px"></asp:TextBox>
                    </asp:Panel>
                </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

