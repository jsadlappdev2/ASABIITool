<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" style="height: 65px">
           
                          <span style="font-size: large; color: #0000FF"><strong>System user management</strong></span><br />
&nbsp;<div class="BoxSearchBar">           
                UserID£º
                <asp:TextBox ID="tbxUserID" runat="server" Width="66px"></asp:TextBox>
                                         Name£º  <asp:TextBox ID="tbxUserName" runat="server" Width="66px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonQuery" runat="server" ImageUrl="css/Images/BtnQuery.gif" OnClick="ImageButtonQuery_Click"></asp:ImageButton>
                                         <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="css/Images/BtnBack.gif" OnClick="ImageButtonBack_Click"></asp:ImageButton>
                              <br />
                          </div>
                <div>
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="8" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="UserID" CssClass="GridStyle"  >
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                         </asp:TemplateField>
                    <asp:TemplateField HeaderText="No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>                                        
                        <asp:TemplateField HeaderText="UserID">                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxName" Width="70px" runat="server" Text='<%# Eval("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Dept">
                             <EditItemTemplate>                              
                                <asp:DropDownList ID="ddlDepartment" runat="server" Width="80px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("DepartmentName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="Role">
                            <EditItemTemplate>                                
                                <asp:DropDownList ID="ddlRole" runat="server" Width="80px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("RoleName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>   
                         
                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                    </Columns>

                </asp:GridView>
                    </div>
                 <asp:Label ID="LabelPageInfo" runat="server"></asp:Label>

                <div class="BoxToolBar">
                <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" Text="All" Width="54px" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                
                   <asp:ImageButton ID="ImageButtonResetPassword" runat="server" ImageUrl="~/Tool/CSS/Images/RESET.GIF" OnClick="ImageButtonResetPassword_Click">
                  
                 </asp:ImageButton>&nbsp;<asp:ImageButton ID="ImageButtonDelete" runat="server" ImageUrl="~/Tool/CSS/Images/Delete.GIF" OnClick="ImageButtonDelete_Click"></asp:ImageButton>
                                  </div>
              <asp:HyperLink ID="HyperLinkAdd" runat="server" ImageUrl="~/Tool/CSS/Images/Add.gif" NavigateUrl="UserAdd.aspx">HyperLink</asp:HyperLink>
            </td>
        </tr>
       
    </table>  
</asp:Content>
