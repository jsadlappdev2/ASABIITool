<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="Web_UserAdd"   MasterPageFile="~/Tool/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">


          <tr>
   
            <td  valign="top" align="left" width="960px">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
               <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left" style="font-size: large; color: #0000FF"><strong>Add user system user</strong></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">UserID£º</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtUserID"  runat="server" MaxLength="20"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID" ErrorMessage="Cannot NULL£¡"></asp:RequiredFieldValidator>
                  </div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">Name£º</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtUserName" runat="server" MaxLength="20"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="Cannot NULL£¡"></asp:RequiredFieldValidator></div></td>
                </tr>
                <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">Password£º</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtUserPwd"  runat="server" MaxLength="20" TextMode=password Width="149px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserPwd"
                            ErrorMessage="Cannot NULL£¡"></asp:RequiredFieldValidator></div></td>
                </tr>
                 <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">Department£º</td>
                    <td >&nbsp;<div align="left"><asp:DropDownList id="ddlDepartment" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentId" Width="83px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource></div></td>
                </tr>
                 <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">Role£º</td>
                    <td >&nbsp;<div align="left"><asp:DropDownList id="ddlRole" runat="server" DataSourceID="SqlDataSource2" DataTextField="RoleName" DataValueField="RoleId"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource></div></td>
                </tr>
                <tr>
                    <td></td>
                    <td >&nbsp; <asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
                       <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="css/Images/SAVE2.GIF" OnClick="imgBtnSave_Click" />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					   <asp:ImageButton ID="imgBtnReturn" runat="server" CausesValidation="false" ImageUrl="~/Tool/CSS/Images/BtnBack.gif" OnClick="imgBtnReturn_Click" /></td>
                </tr>
            </table>         
              
            </td>
        </tr>
    </table>  
</asp:Content>
