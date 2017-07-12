<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ETLJOB_LogCheck2.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="860px">
           

                           <span style="font-size: large; color: #0000FF"><strong>&nbsp;ETL Job&#39;s Logs check</strong></span> <br />
           

                           <div class="BoxSearchBar">           
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </div>
                                        
                          <div class="BoxToolBar" style="color: #0000FF; width: 1066px;">
                              <strong>&nbsp;Please select a job:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <br />
                              <br />
                              <br />
                              <br />
                              </strong>
                          </div>
                <asp:Panel ID="Panel1" runat="server" Height="134px" Width="1073px" BackColor="White">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" Width="241px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Tick to select a special day(default day is yesterday):" />
                    &nbsp;<asp:TextBox ID="jobday" runat="server" Visible="False" Width="151px"></asp:TextBox>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Query" Width="151px" />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="logno" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" PageSize="10" Width="931px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                           
                           
                            <asp:TemplateField HeaderText="LogNo">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("LogNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="JobID">
                                    <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"><%# Eval("JobID") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="JobLogs">
                                     <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server"><%# Eval("JobLogs") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ErrorsMsg">
                                
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server"><%# Eval("ErrorsMsg") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="InsertTime">
                              
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server"><%# Eval("InsertTime") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Note1">
                               
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server"><%# Eval("Note1") %></asp:Label>
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
                    <br />
                    <br />
             
                          <br />
             
                          </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Width="1069px">
                    <asp:SqlDataSource ID="backlogs" runat="server" ConnectionString="<%$ ConnectionStrings:IntegrationToolDBConnectionString %>" SelectCommand="select * from [DWDASA].[dbo].[BK_Logs] order by ltime desc"></asp:SqlDataSource>
                          </asp:Panel>
            </td>
        </tr>
       
    </table>  
</asp:Content>
