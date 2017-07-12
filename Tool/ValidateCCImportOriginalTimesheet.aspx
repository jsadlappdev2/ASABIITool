<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidateCCImportOriginalTimesheet.aspx.cs" Inherits="Tool_ValidateCCImportOriginalTimesheet" %>
<%@ PreviousPageType VirtualPath="~/Tool/CC_ImportTimesheetForTechOne.aspx" %> 


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 1219px;
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
            width: 1219px;
            height: 34px;
        }
        .auto-style5
        {
            height: 34px;
        }
        .auto-style6
        {
            width: 1219px;
            color: #FF0000;
            font-size: small;
            height: 22px;
        }
        .auto-style7
        {
            height: 377px;
        }
        .auto-style9
        {
            color: #003366;
        }
        .auto-style10
        {
            height: 22px;
        }
        .auto-style11 {
            text-decoration: underline;
        }
        .auto-style12 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; height: 473px;">
            <tr>
                <td class="auto-style4"><span class="auto-style2">Please validate and update the </span><span class="auto-style3">Error</span><span class="auto-style2"> inforamtion in&nbsp; ComCare timesheet original import data in below table&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6"> &nbsp;<asp:CheckBox ID="CheckBox4" runat="server" CssClass="auto-style9" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Check all errors include Missing EmployeeID / Wrong Classification / Wrong GL Codes / Wrong KMs" Checked="True" />
&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:Button ID="Button1" runat="server" style="color: #003366; font-weight: 700" Text="Check" OnClick="Button1_Click" Height="35px" Width="162px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Tool/ValidateCCImportOriginalTimesheetReferenceRpt.aspx" style="font-size: medium; color: #003366" Target="_blank">Open reference report</asp:HyperLink>
                    <br />
                    -<span class="auto-style12">----Note: <span class="auto-style11"><strong>Classification</strong></span> issues must be fixed before next&nbsp; process.</span><br />
                    <br />
                    <asp:Label ID="changestatus" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="lno" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1407px" OnRowUpdated="GridView1_RowUpdated" PageSize="5000">
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

                              <asp:TemplateField HeaderText="ProviderID">
                                <ItemTemplate>
                                    <asp:Label ID="ProviderID" runat="server"><%# Eval("[Provider ID]") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="Name" runat="server"><%# Eval("Name") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="160px" />
                            </asp:TemplateField>

                           <asp:TemplateField HeaderText="EmployeeId">
                            <EditItemTemplate>
                                <asp:TextBox ID="EmployeeId" Width="70px" runat="server" Text='<%# Eval("[Payroll Number]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EmployeeId" runat="server" Text='<%# Eval("[Payroll Number]") %>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                               <asp:TemplateField HeaderText="StartDate">
                                <ItemTemplate>
                                    <asp:Label ID="StartDate" runat="server"><%# Eval("[Activity Start Date]") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="60px" />
                            </asp:TemplateField>

                                 <asp:TemplateField HeaderText="StartTime">
                                <ItemTemplate>
                                    <asp:Label ID="StartTime" runat="server"><%# Eval("[Activity Start Time]") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="60px" />
                            </asp:TemplateField>


                                 <asp:TemplateField HeaderText="EndTime">
                                <ItemTemplate>
                                    <asp:Label ID="EndTime" runat="server"><%# Eval("[Activity End Time]") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="60px" />
                            </asp:TemplateField>


                             <asp:TemplateField HeaderText="Classification">
                            <EditItemTemplate>
                                <asp:TextBox ID="Classification" Width="70px" runat="server" Text='<%# Eval("[Classification-Centre from Round]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Classification" runat="server" Text='<%# Eval("[Classification-Centre from Round]") %>'></asp:Label>                                 
                            </ItemTemplate>
                                   <HeaderStyle Width="200px" />
                          </asp:TemplateField>


                            <asp:TemplateField HeaderText="GLCodes">
                            <EditItemTemplate>
                                <asp:TextBox ID="GLCodes" Width="70px" runat="server" Text='<%# Eval("[Payroll GL Code]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="GLCodes" runat="server"  Text='<%# Eval("[Payroll GL Code]") %>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                             <asp:TemplateField HeaderText="KMS">
                            <EditItemTemplate>
                                <asp:TextBox ID="KMS" Width="70px" runat="server" Text='<%# Eval("[Km Travelled]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="KMS" runat="server" Text='<%# Eval("[Km Travelled]") %>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                               <asp:TemplateField HeaderText="AuthorisedBy">
                           
                            <ItemTemplate>
                                <asp:Label ID="AuthorisedBy" runat="server"><%# Eval("[Authorised by]") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>

                                  <asp:TemplateField HeaderText="TaskType">
                           
                            <ItemTemplate>
                                <asp:Label ID="TaskType" runat="server"><%# Eval("[Task Type]") %></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>


                                  <asp:TemplateField HeaderText="IndirectCode">
                           
                            <ItemTemplate>
                                <asp:Label ID="IndirectCode" runat="server"><%# Eval("[Indirect Activity Type]") %></asp:Label>
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
                </td>
                <td class="auto-style7"></td>
            </tr>
        </table>
    
    </div>
        <p>
                    &nbsp;</p>
    </form>
</body>
</html>
