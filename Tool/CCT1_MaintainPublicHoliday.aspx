<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CCT1_MaintainPublicHoliday.aspx.cs" Inherits="Web_UserManage"  MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      


          <tr>
   
            <td  valign="top" align="left" width="960px" colspan="2">
           
                         
                <span style="font-size: medium; color: #003366"><strong>&nbsp;====Maintain Public Holiday==== </strong></span>&nbsp;<div class="BoxSearchBar">           
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="changestatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
                                           
                          <br />
                                           
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Pno" CssClass="GridStyle" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="960px"  >
                           <AlternatingRowStyle BackColor="White" />
                    <Columns>    
                    <asp:TemplateField>
                           <ItemTemplate>
                              <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" /></ItemTemplate>
                    </asp:TemplateField>

                   
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                                                                                       
                     <asp:TemplateField HeaderText="Pno">                           
                            <ItemTemplate>
                                <asp:Label ID="Pno" runat="server" Text='<%# Eval("Pno") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="P_Date">
                            <ItemTemplate>
                                <asp:Label ID="P_Date" runat="server"><%# Eval("P_Date") %></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>

                         <asp:TemplateField HeaderText="Holiday">
                            <ItemTemplate>
                                <asp:Label ID="Holiday" runat="server"><%# Eval("Holiday") %></asp:Label>
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
                              <strong><span style="color: #003366; font-size: large">====Add new public holiday====&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                              <asp:Label ID="addstatus" runat="server" BackColor="Yellow" ForeColor="Red" Visible="False"></asp:Label>
                          </div>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="color: #003366">
           
                          <b>Day:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; ">
           
                          <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="49px" NextPrevFormat="FullMonth" Width="256px">
                              <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                              <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                              <OtherMonthDayStyle ForeColor="#999999" />
                              <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                              <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                              <TodayDayStyle BackColor="#CCCCCC" />
                          </asp:Calendar>
            </td>
        </tr>
       


          <tr>
   
            <td  valign="top" align="left" style="height: 32px; color: #003366;">
           
                          <b>Notes:</b></td>
   
            <td  valign="top" align="left" width="960px" style="width: 480px; height: 32px">
           
                    <asp:TextBox ID="newnotes" runat="server" Width="493px" Height="75px" TextMode="MultiLine"></asp:TextBox>
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
           
                    <asp:Button ID="Button1" runat="server" Text="Add new public holiday" Width="178px" OnClick="Button1_Click" style="font-weight: 700; color: #003366" />
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
