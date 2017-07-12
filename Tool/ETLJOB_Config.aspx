<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ETLJOB_Config.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2" style="height: 353px">
           
                         
                <span style="font-size: medium; color: #0000FF"><strong>ETL Job Configuration </strong></span><br />
&nbsp;<div class="BoxSearchBar">           
                    Job Name£º
                <asp:TextBox ID="qtablename" runat="server" Width="264px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonQuery" runat="server" ImageUrl="css/Images/BtnQuery.gif" OnClick="ImageButtonQuery_Click"></asp:ImageButton>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="jobid" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                                                                                       
                     <asp:TemplateField HeaderText="JobID">                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("jobid") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="JobName">
                            <EditItemTemplate>
                                <asp:TextBox ID="JobName" Width="70px" runat="server" Text='<%# Eval("JobName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("JobName") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="SourceSystem">
                            <EditItemTemplate>
                                <asp:TextBox ID="SourceSystem" Width="70px" runat="server" Text='<%# Eval("SourceSystem") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("SourceSystem") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="DestinationSystem">
                            <EditItemTemplate>
                                <asp:TextBox ID="DestinationSystem" Width="70px" runat="server" Text='<%# Eval("DestinationSystem") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("DestinationSystem") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="JobNotes">
                            <EditItemTemplate>
                                <asp:TextBox ID="JobNotes" Width="70px" runat="server" Text='<%# Eval("JobNotes") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("JobNotes") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="JobType">
                            <EditItemTemplate>
                                <asp:TextBox ID="JobType" Width="70px" runat="server" Text='<%# Eval("JobType") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"><%# Eval("JobType") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="SSISPackageName">
                            <EditItemTemplate>
                                <asp:TextBox ID="SSISPackageName" Width="70px" runat="server" Text='<%# Eval("SSISPackageName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server"><%# Eval("SSISPackageName") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                        <asp:TemplateField HeaderText="dbjob">
                            <EditItemTemplate>
                                <asp:TextBox ID="dbjob" Width="70px" runat="server" Text='<%# Eval("dbjob") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server"><%# Eval("dbjob") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                          <asp:TemplateField HeaderText="dbjob_runtime">
                            <EditItemTemplate>
                                <asp:TextBox ID="dbjob_runtime" Width="70px" runat="server" Text='<%# Eval("dbjob_runtime") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server"><%# Eval("dbjob_runtime") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>


                          <asp:TemplateField HeaderText="dbjob_frequency">
                            <EditItemTemplate>
                                <asp:TextBox ID="dbjob_frequency" Width="70px" runat="server" Text='<%# Eval("dbjob_frequency") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Labe114" runat="server"><%# Eval("dbjob_frequency") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="CreateDate">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server"><%# Eval("CreateDate") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="CreateBy">
                                 <ItemTemplate>
                                <asp:Label ID="Label9" runat="server"><%# Eval("CreateBy") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Notes1">
                            <EditItemTemplate>
                                <asp:TextBox ID="Notes1" Width="70px" runat="server" Text='<%# Eval("Notes1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server"><%# Eval("Notes1") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                        <asp:TemplateField HeaderText="Notes2">
                            <EditItemTemplate>
                                <asp:TextBox ID="Notes2" Width="70px" runat="server" Text='<%# Eval("Notes2") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server"><%# Eval("Notes2") %></asp:Label>
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
                              <strong>Add new ETL job below:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          JobName:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                          <asp:TextBox ID="TextBox1" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    SourceSystem:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="TextBox2" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 29px;">
           
                    <asp:Label ID="Label17" runat="server" Text="DestinationSystem:"></asp:Label>
                          &nbsp;&nbsp;&nbsp;&nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 29px;">
           
                    <asp:TextBox ID="TextBox3" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          JobNotes:&nbsp;&nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="TextBox4" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                    JobType:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="TextBox5" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          SSISPackageName:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="TextBox6" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 32px">
           
                          Database_JobName:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="TextBox10" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 32px">
           
                          Job_runtime:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="TextBox11" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 32px">
           
                          Job_frequency:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="TextBox12" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px; height: 32px">
           
                          CreateBy:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="TextBox7" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          Notes1:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="TextBox8" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          Notes2:</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:TextBox ID="TextBox9" runat="server" Width="492px"></asp:TextBox>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="width: 40px">
           
                          &nbsp;</td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px">
           
                    <asp:Button ID="Button1" runat="server" Text="Add new Job" Width="178px" OnClick="Button1_Click" />
              </td>
        </tr>
       
    </table>  
</asp:Content>
