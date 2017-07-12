<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CCT1_PayPeriodt.aspx.cs" Inherits="Tool_CCT1_PayPeriodt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 1135px;
            height: 243px;
        }
        .auto-style2
        {
            color: #003366;
            font-weight: bold;
        }
        .GridStyle
        {
            font-size: small;
            text-align: left;
        }
        .auto-style4
        {
            width: 1135px;
            height: 34px;
        }
        .auto-style5
        {
            height: 34px;
        }
        .auto-style6
        {
            width: 1135px;
            color: #FF0000;
            font-size: small;
        }
        .auto-style7
        {
            height: 243px;
        }
        .auto-style8
        {
            width: 1135px;
            height: 34px;
            color: #003366;
            font-weight: bold;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; height: 473px;">
            <tr>
                <td class="auto-style4"><span class="auto-style2">======Maintain pay period======&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" style="color: #003366; font-weight: 700" Text="Refresh" OnClick="Button1_Click" />
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;
                    <asp:Label ID="changestatus" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="Pno" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1407px" OnRowUpdated="GridView1_RowUpdated">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" />
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                             <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />


                              <asp:TemplateField HeaderText="Pno">
                                <ItemTemplate>
                                    <asp:Label ID="Pno" runat="server"><%# Eval("Pno") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                           <asp:TemplateField HeaderText="StartDay">
                            <EditItemTemplate>
                                <asp:TextBox ID="StartDay" Width="70px" runat="server" Text='<%# Eval("StartDay") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="StartDay" runat="server"><%# Eval("StartDay") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                            <asp:TemplateField HeaderText="EndDay">
                            <EditItemTemplate>
                                <asp:TextBox ID="EndDay" Width="70px" runat="server" Text='<%# Eval("EndDay") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EndDay" runat="server"><%# Eval("EndDay") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                              


                             <asp:TemplateField HeaderText="Note">
                            <EditItemTemplate>
                                <asp:TextBox ID="Note" Width="70px" runat="server" Text='<%# Eval("Note") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Note" runat="server"><%# Eval("Note") %></asp:Label>                                 
                            </ItemTemplate>
                                   <HeaderStyle Width="60px" />
                          </asp:TemplateField>



                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#003366" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <br />                    
                </td>
                <td class="auto-style7"></td>
            </tr>

            <tr>
                <td class="auto-style8">
                
                    Add new pay period:</td>
                <td class="auto-style5"></td>
            </tr>

            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
