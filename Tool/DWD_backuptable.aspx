<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DWD_backuptable.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <span style="font-size: medium; color: #0000FF"><strong>Backup table lists </strong></span>-- these tables will be backup at DWDASA database automaticlly<br />
&nbsp;<div class="BoxSearchBar">           
                table_name£º
                <asp:TextBox ID="qtablename" runat="server" Width="264px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonQuery" runat="server" ImageUrl="css/Images/BtnQuery.gif" OnClick="ImageButtonQuery_Click"></asp:ImageButton>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="t_no" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None"  >
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

                      <asp:TemplateField HeaderText="table_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="tname" Width="70px" runat="server" Text='<%# Eval("table_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("table_name") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="where_conditions">
                            <EditItemTemplate>
                                <asp:TextBox ID="where" Width="70px" runat="server" Text='<%# Eval("bk_conditions") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("bk_conditions") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="server_link">
                            <EditItemTemplate>
                                <asp:TextBox ID="sl" Width="70px" runat="server" Text='<%# Eval("server_link") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("server_link") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="dbname">
                            <EditItemTemplate>
                                <asp:TextBox ID="dbname" Width="70px" runat="server" Text='<%# Eval("database_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("database_name") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="table_scheme">
                            <EditItemTemplate>
                                <asp:TextBox ID="scheme" Width="70px" runat="server" Text='<%# Eval("table_scheme") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"><%# Eval("table_scheme") %></asp:Label>
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
                              <strong>Add new backup tables below:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          Table_name:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                          <asp:TextBox ID="newtn" runat="server" Width="496px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    Where_conditions:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="newwhere" runat="server" Width="496px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    <asp:Label ID="Label17" runat="server" Text="Server_link:"></asp:Label>
                          &nbsp;&nbsp;&nbsp;&nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:DropDownList ID="newsl" runat="server" Height="16px" Width="137px">
                        <asp:ListItem>APPSQL-3</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          Database_name:&nbsp;&nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:DropDownList ID="newdb" runat="server" Height="16px" Width="141px">
                        <asp:ListItem>KH_Test</asp:ListItem>
                        <asp:ListItem>KH_Train</asp:ListItem>
                        <asp:ListItem>Anglicare</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    <asp:Label ID="Label18" runat="server" Text="Table_scheme:"></asp:Label>
                          &nbsp;&nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="newts" runat="server" Width="495px">dbo</asp:TextBox>
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
           
                    <asp:Button ID="Button1" runat="server" Text="Add new table" Width="178px" OnClick="Button1_Click" />
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
