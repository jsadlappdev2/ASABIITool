<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DWD_sqlbatch.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <span style="font-size: medium; color: #0000FF"><strong>&nbsp;SQL Batch lists </strong></span>-- these SQLs will be executed at DWDASA database automaticlly<br />
&nbsp;<div class="BoxSearchBar">           
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="t_no" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="960px"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                                                                                       
                     <asp:TemplateField HeaderText="t_no">                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("t_no") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="sqltext">
                            <EditItemTemplate>
                                <asp:TextBox ID="sqltext" Width="300px" Height="80px" runat="server" Text='<%# Eval("sqltext") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("sqltext") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      

                      <asp:TemplateField HeaderText="bk_frequency">
                            <EditItemTemplate>
                                <asp:TextBox ID="bkf" Width="70px" runat="server" Text='<%# Eval("bk_frequency") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server"><%# Eval("bk_frequency") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="start_date">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server"><%# Eval("start_date") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="notes">
                            <EditItemTemplate>
                                <asp:TextBox ID="notes" Width="70px" runat="server" Text='<%# Eval("notes") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server"><%# Eval("notes") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="valid_flag">
                            <EditItemTemplate>
                                <asp:TextBox ID="vflag" Width="70px" runat="server" Text='<%# Eval("valid_flag") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server"><%# Eval("valid_flag") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                    </Columns>

                           <EditRowStyle BackColor="#2461BF" />
                           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                           <RowStyle BackColor="#EFF3FB" />
                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                </asp:GridView>
                 <asp:Label ID="LabelPageInfo" runat="server"></asp:Label>

                          <div class="BoxToolBar" style="color: #0000FF; width: 1066px;">
                              <strong>Add new SQL batchs below:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 184px;">
           
                          SQLBatch:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 184px;">
           
                          <asp:TextBox ID="newtn" runat="server" Width="754px" Height="169px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          Backup_frequency:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:DropDownList ID="newbf" runat="server" Height="16px" Width="134px">
                        <asp:ListItem Value="d">Daily</asp:ListItem>
                        <asp:ListItem Value="m">Monthly</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 32px">
           
                          Notes:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="newnotes" runat="server" Width="493px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          Valid_flag:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:DropDownList ID="newflag" runat="server" Height="17px" Width="133px">
                        <asp:ListItem Value="y">Valid</asp:ListItem>
                        <asp:ListItem Value="n">Unvalid</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:Button ID="Button1" runat="server" Text="Add new SQLs" Width="178px" OnClick="Button1_Click" />
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                          &nbsp;</td>
        </tr>
       
    </table>  
</asp:Content>
