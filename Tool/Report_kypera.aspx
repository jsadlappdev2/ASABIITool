<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_kypera.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" style="height: 519px; width: 101%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px">
           
                          <h4>Kypera Reports</h4>  
                       
                                        
                          <div style="height: 558px; width: 771px">
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="reportmenu" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="748px" AllowPaging="True" Height="136px" PageSize="8">
                                  <AlternatingRowStyle BackColor="White" />
                                  <Columns>
                                      <asp:BoundField DataField="Report_Name" HeaderText="Report_Name" SortExpression="Report_Name" />
                                      <asp:HyperLinkField DataNavigateUrlFields="Report_URL" DataTextField="Report_URL" Target="_blank" HeaderText="Report URL(Click to View Report)" />
                                  </Columns>
                                  <EditRowStyle BackColor="#2461BF" />
                                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="#EFF3FB" />
                                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="reportmenu" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="reportmenu_Selecting" SelectCommand="select sText as Report_Name, sURL as Report_URL from dbo.Report_MenuTree order by noteid, parentid;"></asp:SqlDataSource>
                          </div>
                          <br />
                       
                                        
            </td>
        </tr>
       
       
    </table>  
</asp:Content>
