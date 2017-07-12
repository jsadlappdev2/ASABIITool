<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidateCCImportTimesheet.aspx.cs" Inherits="Tool_ValidateCCImportTimesheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 1135px;
            height: 377px;
        }
        .auto-style2
        {
            color: #003366;
            font-weight: bold;
        }
        .auto-style3
        {
            color: #FF0000;
            font-weight: bold;
        }
        .GridStyle
        {
            font-size: small;
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
            height: 377px;
        }
        .auto-style8
        {
            color: #003366;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; height: 473px;">
            <tr>
                <td class="auto-style4"><span class="auto-style2">Please validate and update the </span><span class="auto-style3">Error</span><span class="auto-style2"> inforamtion in timesheet processed data in below table&nbsp;before you export into CSV files&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" style="color: #003366; font-weight: 700" Text="Refresh" OnClick="Button1_Click" />
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6"><span class="auto-style8">Normal errors: missing EmployeeId / Activity not right / PostionCode error / PayComponentCode error / EntryType error&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;<br />
                    <br />
                    &nbsp;
                    <asp:Label ID="changestatus" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="lno" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1407px" OnRowUpdated="GridView1_RowUpdated" PageSize="10000">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" />
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:CommandField ShowEditButton="True" HeaderText="Edit" />


                              <asp:TemplateField HeaderText="lno">
                                <ItemTemplate>
                                    <asp:Label ID="lno" runat="server"><%# Eval("lno") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                           <asp:TemplateField HeaderText="EmployeeId">
                            <EditItemTemplate>
                                <asp:TextBox ID="EmployeeId" Width="70px" runat="server" Text='<%# Eval("EmployeeId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EmployeeId" runat="server"  Text='<%# Eval("EmployeeId") %>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                               <asp:TemplateField HeaderText="EntryDate">
                                <ItemTemplate>
                                    <asp:Label ID="EntryDate" runat="server"><%# Eval("EntryDate") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="260px" />
                            </asp:TemplateField>


                             <asp:TemplateField HeaderText="EntryType">
                            <EditItemTemplate>
                                <asp:TextBox ID="EntryType" Width="70px" runat="server" Text='<%# Eval("EntryType") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EntryType" runat="server"><%# Eval("EntryType") %></asp:Label>                                 
                            </ItemTemplate>
                                   <HeaderStyle Width="160px" />
                          </asp:TemplateField>


                               <asp:TemplateField HeaderText="Activity">
                            <EditItemTemplate>
                                <asp:TextBox ID="Activity" Width="70px" runat="server" Text='<%# Eval("Activity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Activity" runat="server" Text='<%# Eval("Activity") %>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                               <asp:TemplateField HeaderText="units">
                           
                            <ItemTemplate>
                                <asp:Label ID="units" runat="server"><%# Eval("units") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                                <asp:TemplateField HeaderText="ClockIn">
                            
                            <ItemTemplate>
                                <asp:Label ID="ClockIn" runat="server"><%# Eval("ClockIn") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                                     <asp:TemplateField HeaderText="clockout">
                           
                            <ItemTemplate>
                                <asp:Label ID="clockout" runat="server"><%# Eval("clockout") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                               <asp:TemplateField HeaderText="AuthorisedInd">
                                <ItemTemplate>
                                    <asp:Label ID="AuthorisedInd" runat="server"><%# Eval("AuthorisedInd") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>


                            
                                     <asp:TemplateField HeaderText="PositionCode">
                            <EditItemTemplate>
                                <asp:TextBox ID="PositionCode" Width="70px" runat="server" Text='<%# Eval("PositionCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="PositionCode" runat="server" Text='<%# Eval("PositionCode") %>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                            
                            
                                     <asp:TemplateField HeaderText="PayComponentCode">
                            <EditItemTemplate>
                                <asp:TextBox ID="PayComponentCode" Width="70px" runat="server" Text='<%# Eval("PayComponentCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="PayComponentCode" runat="server"><%# Eval("PayComponentCode") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                                         <asp:TemplateField HeaderText="SelectionCode1">
                            <EditItemTemplate>
                                <asp:TextBox ID="SelectionCode1" Width="70px" runat="server" Text='<%# Eval("SelectionCode1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="SelectionCode1" runat="server"><%# Eval("SelectionCode1") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                                              <asp:TemplateField HeaderText="SelectionCode2">
                            
                            <ItemTemplate>
                                <asp:Label ID="SelectionCode2" runat="server"><%# Eval("SelectionCode2") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                    

                          <asp:TemplateField HeaderText="Provider_Id">
                            
                            <ItemTemplate>
                                <asp:Label ID="provider_id" runat="server"><%# Eval("provider_id") %></asp:Label>
                            </ItemTemplate>
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
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style7"></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
