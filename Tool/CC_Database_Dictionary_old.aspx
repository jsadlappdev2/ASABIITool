<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CC_Database_Dictionary_old.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <strong>
           
                         
                <span style="font-size: medium; color: #0000FF">ComCare Datatabase Dictionary Query and Maintain -- </span></strong>
           
                         
                <span style="font-size: small; color: #0000FF">query by key words: table name, column name or front end information<br />
                </span>
           
                         
                <span style="font-size: large; color: #CC0000; font-weight: bold;">---------------------developing--------------------------------------------------------------------------------</span><br />
&nbsp;<div class="BoxSearchBar">           
                    <span style="color: #FF0000; font-size: large; font-weight: bold">key Words:</span>
                <asp:TextBox ID="qtablename" runat="server" Width="337px" Height="26px">%%</asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonQuery" runat="server" ImageUrl="css/Images/BtnQuery.gif" OnClick="ImageButtonQuery_Click" Height="27px" Width="63px"></asp:ImageButton>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              
                          <asp:Label ID="changestatus" runat="server" Text="Label" style="color: #FF0000"></asp:Label>
                              
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="t_no" CssClass="GridStyle" CellPadding="10" EnableModelValidation="True" ForeColor="#333333" GridLines="None"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" />

                       <asp:TemplateField HeaderText="t_no">                           
                            <ItemTemplate>
                                <asp:Label ID="Label01" runat="server" Text='<%# Eval("t_no") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                                                                                                                              
                     <asp:TemplateField HeaderText="Tablename">                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Tablename") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Tablename_desc">
                            <EditItemTemplate>
                                <asp:TextBox ID="tdsc" Width="70px" runat="server" Text='<%# Eval("Tablename_desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("Tablename_desc") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="ComCare Front End Desc">
                            <EditItemTemplate>
                                <asp:TextBox ID="ccfed" Width="70px" runat="server" Text='<%# Eval("CC_FE_Desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("CC_FE_Desc") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                        <asp:TemplateField HeaderText="Columnsno">                           
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("Columnsno") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                          <asp:TemplateField HeaderText="Columnsname">                           
                            <ItemTemplate>
                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("Columnsname") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                        
                      <asp:TemplateField HeaderText="Columnsdesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="clmd" Width="70px" runat="server" Text='<%# Eval("Columnsdesc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("Columnsdesc") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                         <asp:TemplateField HeaderText="Isidentity">                           
                            <ItemTemplate>
                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("Isidentity") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                          <asp:TemplateField HeaderText="Kind">                           
                            <ItemTemplate>
                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("Kind") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Length">                           
                            <ItemTemplate>
                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("Length") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Percision">                           
                            <ItemTemplate>
                                <asp:Label ID="Label26" runat="server" Text='<%# Eval("Percision") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="Scale">                           
                            <ItemTemplate>
                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("Scale") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="AllowNULL">                           
                            <ItemTemplate>
                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("AllowNULL") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                    

                      <asp:TemplateField HeaderText="PK_table">                           
                            <ItemTemplate>
                                <asp:Label ID="Label30" runat="server" Text='<%# Eval("PK_table") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="PK_Column">                           
                            <ItemTemplate>
                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("PK_Column") %>'></asp:Label>
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

                <br />
                <br />
                <br />
                <br />

            </td>
        </tr>
       


         
       
    </table>  
</asp:Content>
