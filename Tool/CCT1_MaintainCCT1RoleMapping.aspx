<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CCT1_MaintainCCT1RoleMapping.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <span style="font-size: medium; color: #003366"><strong>&nbsp;====Maintain Role/Position mapping table for ComCare &amp; TechOne==== </strong></span>&nbsp;<div class="BoxSearchBar">           
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="MapID" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="960px" PageSize="100"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                   
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                                                                                       
                     <asp:TemplateField HeaderText="MapID">                           
                            <ItemTemplate>
                                <asp:Label ID="MapID" runat="server" Text='<%# Eval("MapID") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                        <asp:TemplateField HeaderText="ComCareCode">                           
                            <ItemTemplate>
                                <asp:Label ID="ComCareCode" runat="server" Text='<%# Eval("ComCareCode") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                            <asp:TemplateField HeaderText="T1Code">                           
                            <ItemTemplate>
                                <asp:Label ID="T1Code" runat="server" Text='<%# Eval("T1Code") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                            <asp:TemplateField HeaderText="Create_date">                           
                            <ItemTemplate>
                                <asp:Label ID="create_date" runat="server" Text='<%# Eval("create_date") %>'></asp:Label>
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
                              <strong><span style="color: #003366; font-size: large">====Add new MAP into mapping table====&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          <span style="color: #003366; font-weight: bold">ComCare</span><b style="color: #003366"> Role (classification):</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:TextBox ID="CCTB" runat="server" Height="30px" Width="223px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="height: 32px; color: #003366;">
           
                          <b>TechOne Tradecode:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="T1TB" runat="server" Height="30px" Width="223px"></asp:TextBox>
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
           
                    <asp:Button ID="Button1" runat="server" Text="Add NEW" Width="126px" OnClick="Button1_Click" style="font-weight: 700; color: #003366" Height="26px" />
            &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                          &nbsp;</td>
        </tr>
       
    </table>  
</asp:Content>
