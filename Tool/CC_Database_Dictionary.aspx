<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CC_Database_Dictionary.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <strong>
           
                         
                <span style="font-size: x-large; color: #0000FF">ComCare Database Dictionary Query and Maintain</span><span style="font-size: medium; color: #0000FF">
                <br />
                </span> </strong><span style="color: #FF0000; font-size: small">-- Please input table_name or column name or ComCare front end key informaton</span><br />
&nbsp;<div class="BoxSearchBar">           
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" Width="212px">
                        <asp:ListItem Value="TN">Table Name</asp:ListItem>
                        <asp:ListItem Value="CN">Column Name</asp:ListItem>
                        <asp:ListItem Value="CCFE">ComCare Front End Key Word</asp:ListItem>
                    </asp:DropDownList>
&nbsp;<asp:TextBox ID="qtablename" runat="server" Width="291px" Height="28px">%%</asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Height="28px" OnClick="Button2_Click" Text="Query" Width="66px" />
                    &nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          <br />
                    <br />
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="30" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="t_no" CssClass="GridStyle" CellPadding="15" EnableModelValidation="True" ForeColor="#333333" GridLines="None"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
               
                                                                                                       
                     <asp:TemplateField HeaderText="t_no">                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("t_no") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="tablename">                           
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("tablename") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="table_desc">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbdesc" Width="70px" runat="server" Text='<%# Eval("tablename_desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("tablename_desc") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                       <asp:TemplateField HeaderText="ComCare">
                            <EditItemTemplate>
                                <asp:TextBox ID="comcare" Width="70px" runat="server" Text='<%# Eval("CC_FE_Desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label33" runat="server"><%# Eval("CC_FE_Desc") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                       <asp:TemplateField HeaderText="columnsno">                           
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("columnsno") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>



                      <asp:TemplateField HeaderText="columnsname">                           
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("columnsname") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="columnsdesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="columnsdesc" Width="70px" runat="server" Text='<%# Eval("columnsdesc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"><%# Eval("columnsdesc") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="IsIdentity">                           
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("IsIdentity") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                        <asp:TemplateField HeaderText="ISPrimarykey">                           
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("ISPrimarykey") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Kind">                           
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Kind") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Length">                           
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Length") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                       <asp:TemplateField HeaderText="Percision">                           
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Percision") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="Scale">                           
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Scale") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="AllowNULL">                           
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("AllowNULL") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="DefaultValue">                           
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("DefaultValue") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                      <asp:TemplateField HeaderText="PK_table">                           
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("PK_table") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                     <asp:TemplateField HeaderText="PK_Column">                           
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("PK_Column") %>'></asp:Label>
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

                        
            </td>
        </tr>
       


          
    </table>  
</asp:Content>
