<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidateCCImportOriginalTimesheetReferenceRpt.aspx.cs" Inherits="Tool_ValidateCCImportOriginalTimesheetReferenceRpt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 1135px;
            height: 377px;
        }
        .GridStyle
        {
            font-size: small;
        }
        .auto-style4
        {
            width: 1135px;
            height: 31px;
        }
        .auto-style5
        {
            height: 31px;
        }
        .auto-style6
        {
            width: 1135px;
            color: #FF0000;
            font-size: small;
            height: 9px;
        }
        .auto-style7
        {
            height: 377px;
        }
        .auto-style10
        {
            height: 9px;
        }
        .auto-style11 {
            color: #003366;
            font-size: large;
        }
        .auto-style14 {
            width: 235px;
        }
        .auto-style15 {
            width: 109px;
            color: #003366;
            font-size: medium;
        }
        .auto-style16 {
            font-size: medium;
        }
        .auto-style17 {
            width: 109px;
            color: #003366;
            font-size: medium;
            height: 42px;
        }
        .auto-style18 {
            width: 235px;
            height: 42px;
        }
        .auto-style19 {
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; height: 473px;">
            <tr>
                <td class="auto-style4"><span class="auto-style11"><strong>This report will give you the information direct from ComCare for your reference to fix issues existing in timesheet exported files&nbsp;&nbsp;</strong>&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6"> &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table style="width:100%;">
                        <tr>
                            <td class="auto-style15"><strong>Pay Period:</strong></td>
                            <td class="auto-style14">
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="300px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style17"><strong>Provider ID:</strong></td>
                            <td class="auto-style18">
                                <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="298px"></asp:TextBox>
                            </td>
                            <td class="auto-style19">
                                <asp:Button ID="Button1" runat="server" style="color: #003366; font-weight: 700" Text="Query" Width="89px" Height="32px" OnClick="Button1_Click1" />
                            </td>
                        </tr>
                        </table>
                    <hr style="width: 1404px" />
                    <span class="auto-style16"><strong>1. Actual shifts from activity_work_table:<br />
                    </strong>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="Provider_ID" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1407px" OnRowUpdated="GridView1_RowUpdated" PageSize="1000">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Provider_ID">
                                <ItemTemplate>
                                    <asp:Label ID="Provider_ID" runat="server"><%# Eval("Provider_ID") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Activity_Date">
                                <ItemTemplate>
                                    <asp:Label ID="Activity_Date" runat="server"><%# Eval("Activity_Date") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="Activity_Start_Time">
                                <ItemTemplate>
                                    <asp:Label ID="Activity_Start_Time" runat="server"><%# Eval("Activity_Start_Time") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                <asp:TemplateField HeaderText="Activity_End_Time">
                                <ItemTemplate>
                                    <asp:Label ID="Activity_End_Time" runat="server"><%# Eval("Activity_End_Time") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Activity_Duration">
                                <ItemTemplate>
                                    <asp:Label ID="Activity_Duration" runat="server"><%# Eval("Activity_Duration") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Travel_Km">
                                <ItemTemplate>
                                    <asp:Label ID="Travel_Km" runat="server"><%# Eval("Travel_Km") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Task_Type_Code">
                                <ItemTemplate>
                                    <asp:Label ID="Task_Type_Code" runat="server"><%# Eval("Task_Type_Code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>


                                      <asp:TemplateField HeaderText="Indirect_Activity_Type_code">
                                <ItemTemplate>
                                    <asp:Label ID="Indirect_Activity_Type_code" runat="server"><%# Eval("Indirect_Activity_Type_code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                               <asp:TemplateField HeaderText="Funding_Prog_Code">
                                <ItemTemplate>
                                    <asp:Label ID="Funding_Prog_Code" runat="server"><%# Eval("Funding_Prog_Code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="Classn_Shift_Centre">
                                <ItemTemplate>
                                    <asp:Label ID="Classn_Shift_Centre" runat="server"><%# Eval("Classn_Shift_Centre") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>


                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#003366" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <strong>
                    <br />
                    2.Schedule shifts from Wi_Activity table:</strong><br />
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="Provider_ID" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1407px" OnRowUpdated="GridView1_RowUpdated" PageSize="1000">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="provider_id">
                                <ItemTemplate>
                                    <asp:Label ID="provider_id" runat="server"><%# Eval("provider_id") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Activity_Date">
                                <ItemTemplate>
                                    <asp:Label ID="Activity_Date" runat="server"><%# Eval("Activity_Date") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="Schedule_time">
                                <ItemTemplate>
                                    <asp:Label ID="Schedule_time" runat="server"><%# Eval("Schedule_time") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                <asp:TemplateField HeaderText="schedule_duration">
                                <ItemTemplate>
                                    <asp:Label ID="schedule_duration" runat="server"><%# Eval("schedule_duration") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                  <asp:TemplateField HeaderText="generated_provider_code">
                                <ItemTemplate>
                                    <asp:Label ID="generated_provider_code" runat="server"><%# Eval("generated_provider_code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                            


                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#003366" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <strong>
                    <br />
                    3.Natural account from Payroll_funding_Code table:</strong><br />
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="payroll_funding_code" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1407px" OnRowUpdated="GridView1_RowUpdated" PageSize="1000">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Natural account">
                                <ItemTemplate>
                                    <asp:Label ID="payroll_funding_code" runat="server"><%# Eval("payroll_funding_code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="provider_class_code">
                                <ItemTemplate>
                                    <asp:Label ID="provider_class_code" runat="server"><%# Eval("provider_class_code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="task_type_code">
                                <ItemTemplate>
                                    <asp:Label ID="task_type_code" runat="server"><%# Eval("task_type_code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                                <asp:TemplateField HeaderText="indirect_activity_type_code">
                                <ItemTemplate>
                                    <asp:Label ID="indirect_activity_type_code" runat="server"><%# Eval("indirect_activity_type_code") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                            
                            


                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#003366" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    </span><br />
                </td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <br />
                </td>
                <td class="auto-style7"></td>
            </tr>
        </table>
    
    </div>
        <p>
                    &nbsp;</p>
    </form>
</body>
</html>
