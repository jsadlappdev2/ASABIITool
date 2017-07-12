<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SQL_findtablesbykeywords.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" style="height: 689px; width: 99%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px">
           

                           <span style="font-size: large; color: #0000FF"><strong>Search SQl Server tables using key words</strong></span><br />
           

                           <div class="BoxSearchBar">           
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </div>
                                        
                <asp:Panel ID="Panel1" runat="server" Height="193px" Width="1078px" BackColor="White">
                    <span style="color: #0000FF">
                    <br />
                    <br />
                    Key Words:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtKeywords" runat="server" Width="179px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Database Link:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="dblink" runat="server" Height="16px" Width="174px">
                        <asp:ListItem>NONE</asp:ListItem>
                        <asp:ListItem>APPSQL-3</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp; </span>
                    <br style="color: #0000FF" />
                    <br style="color: #0000FF" />
                    <span style="color: #0000FF">Database Name:&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="dbname" runat="server" Height="17px" Width="174px">
                        <asp:ListItem>IntegrationToolDB</asp:ListItem>
                        <asp:ListItem>DWDASA</asp:ListItem>
                        <asp:ListItem>KH_Test</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Using like:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="Using like for searching (like '%Key words%'); otherwise using ='key words'" />
                    &nbsp;</span>&nbsp;
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" BackColor="#FFCC00" OnClick="Button2_Click" Text="Begin Search" Width="183px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Hints" runat="server" BackColor="#FFFF99" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />
             
                          </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Width="1076px" Height="425px">
         
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="keywords" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="1061px" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="table_name" HeaderText="table_name" SortExpression="table_name" />
                            <asp:BoundField DataField="column_name" HeaderText="column_name" SortExpression="column_name" />
                            <asp:BoundField DataField="column_search_value" HeaderText="column_search_value" SortExpression="column_search_value" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
         
                    <asp:SqlDataSource ID="keywords" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [table_name]
      ,[column_name]
      ,[column_search_value]
  FROM [dbo].[MSSQL_search_table] order by table_name,column_name;"></asp:SqlDataSource>
                          </asp:Panel>
            </td>
        </tr>
       
    </table>  
</asp:Content>
