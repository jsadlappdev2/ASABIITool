<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sys_MaintainTreeNode.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <span style="font-size: medium; color: #003366"><strong>&nbsp;====Maintain Sytem TreeMenu==== </strong></span>&nbsp;<div class="BoxSearchBar">           
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="NodeId" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="960px" PageSize="30"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                   
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                                                                                       
                     <asp:TemplateField HeaderText="NodeId">                           
                            <ItemTemplate>
                                <asp:Label ID="NodeId" runat="server" Text='<%# Eval("NodeId") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                         <asp:TemplateField HeaderText="ParentId">                           
                            <ItemTemplate>
                                <asp:Label ID="ParentId" runat="server" Text='<%# Eval("ParentId") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                          <asp:TemplateField HeaderText="Text">                           
                            <ItemTemplate>
                                <asp:Label ID="Text" runat="server" Text='<%# Eval("Text") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                         <asp:TemplateField HeaderText="Url">                           
                            <ItemTemplate>
                                <asp:Label ID="Url" runat="server" Text='<%# Eval("Url") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                         <asp:TemplateField HeaderText="Duty">                           
                            <ItemTemplate>
                                <asp:Label ID="Duty" runat="server" Text='<%# Eval("Duty") %>'></asp:Label>
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
                 <asp:Label ID="LabelPageInfo" runat="server"></asp:Label>

                          <div class="BoxToolBar" style="color: #0000FF; width: 1066px;">
                              <strong><span style="color: #003366; font-size: large">====Add new tree menu====&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <strong>NodeId:</strong></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:TextBox ID="nodeid" runat="server" Height="29px" Width="163px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <strong>ParentId:</strong></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:TextBox ID="parentid" runat="server" Height="32px" Width="166px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <strong>Text:</strong></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:TextBox ID="text" runat="server" Height="28px" Width="163px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <strong>URL:</strong></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:TextBox ID="url" runat="server" Height="31px" Width="666px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="height: 32px; color: #003366;">
           
                          <b>Duty:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="duty" runat="server" Height="28px" Width="174px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:Button ID="Button1" runat="server" Text="Add new tree menu" Width="178px" OnClick="Button1_Click" style="font-weight: 700; color: #003366" />
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                          &nbsp;</td>
        </tr>
       
    </table>  
</asp:Content>
