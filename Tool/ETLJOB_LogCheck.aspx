<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ETLJOB_LogCheck.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2" style="height: 353px">
           
                         
                <span style="font-size: medium; color: #0000FF"><strong>ETL Job&#39;s Logs Check </strong></span><br />
&nbsp;<div class="BoxSearchBar">           
                    Job Name£º
                <asp:TextBox ID="qtablename" runat="server" Width="264px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonQuery" runat="server" ImageUrl="css/Images/BtnQuery.gif" OnClick="ImageButtonQuery_Click"></asp:ImageButton>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="jobid" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="1165px"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    
                                                                                                       
                     <asp:TemplateField HeaderText="LogNo">                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("LogNo") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="JobId">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("JobId") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="JobName">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("JobName") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="JobLogs">
                          
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("JobLogs") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="ErrorsMsg">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("ErrorsMsg") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="InsertTime">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"><%# Eval("InsertTime") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Note1">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server"><%# Eval("Note1") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Note2">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server"><%# Eval("Note2") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Note3">
                                 <ItemTemplate>
                                <asp:Label ID="Label9" runat="server"><%# Eval("Note3") %></asp:Label>
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
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                          &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 29px;">
           
                    &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 29px;">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 32px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    &nbsp;</td>
        </tr>
       
    </table>
</asp:Content>
