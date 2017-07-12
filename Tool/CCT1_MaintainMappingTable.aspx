<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CCT1_MaintainMappingTable.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <span style="font-size: medium; color: #003366"><strong>&nbsp;====Maintain ComCare to T1 mapping table==== </strong></span>&nbsp;<div class="BoxSearchBar">           
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Step_No" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="960px"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                     <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                                                                                       
                     <asp:TemplateField HeaderText="Step_No">                           
                            <ItemTemplate>
                                <asp:Label ID="Step_No" runat="server" Text='<%# Eval("Step_No") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Step_Name">
                            <EditItemTemplate>
                             <asp:TextBox ID="Step_Name" Width="200px" Height="200px" runat="server" Text='<%# Eval("Step_Name") %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Step_Name" runat="server"><%# Eval("Step_Name") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      

                      <asp:TemplateField HeaderText="SQL_Text">
                            <EditItemTemplate>
                                <asp:TextBox ID="SQL_Text" Width="200px"  Height="200px" runat="server" Text='<%# Eval("SQL_Text") %>' TextMode="MultiLine"></asp:TextBox>
                                 
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="SQL_Text" runat="server"><%# Eval("SQL_Text") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                          <asp:TemplateField HeaderText="Notes">
                            <EditItemTemplate>
                                <asp:TextBox ID="Notes" Width="200px" Height="200px" runat="server" Text='<%# Eval("Notes") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Notes" runat="server"><%# Eval("Notes") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                         <asp:TemplateField HeaderText="Valid_Flag">
                            <EditItemTemplate>
                                <asp:TextBox ID="Valid_Flag" Width="30px" runat="server" Text='<%# Eval("Valid_Flag") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Valid_Flag" runat="server"><%# Eval("Valid_Flag") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                         <asp:TemplateField HeaderText="Create_Date">                           
                            <ItemTemplate>
                                <asp:Label ID="Create_Date" runat="server" Text='<%# Eval("Create_Date") %>'></asp:Label>
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
                              <strong><span style="color: #003366; font-size: large">====Add new step====&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          <b style="color: #003366">StepName:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:TextBox ID="StepName" runat="server" Height="26px" Width="301px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="height: 32px; color: #003366;">
           
                          <b>SQLText:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="SQL" runat="server" Width="817px" Height="177px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <b>Notes:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="Notes" runat="server" Width="815px" Height="75px" TextMode="MultiLine"></asp:TextBox>
              </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <b>ValidFlag:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:DropDownList ID="ValidFlag" runat="server" Height="30px" Width="97px">
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                        <asp:ListItem Value="N">No</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:Button ID="Button1" runat="server" Text="Add new step" Width="178px" OnClick="Button1_Click" style="font-weight: 700; color: #003366" />
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
