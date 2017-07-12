<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PwdModify.aspx.cs" Inherits="Web_PwdModify"   MasterPageFile="~/Tool/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width ="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      


          <tr>
 
            <td  valign="top" align="left">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
               <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left" style="font-size: large; color: #0000FF"><strong>Change Login Password</strong></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">Old password</td>
                    <td ><asp:TextBox id="txtOldPwd" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd" ErrorMessage="Cannot NULL£¡"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">New password</td>
                    <td ><asp:TextBox id="txtNewPwd" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd"
                                ErrorMessage="cannot NULL£¡"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td bgcolor="#eeeeee" style="text-align:right;">New Pass again</td>
                    <td ><asp:TextBox id="txtConfirmPwd"  runat="server" MaxLength="20" TextMode=password Width="168px"></asp:TextBox>
                       <asp:CompareValidator id="cpv_newpassword" runat="server" ErrorMessage="not the same" ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPwd"></asp:CompareValidator></td>
                </tr>
                
                <tr>
                    <td colspan="2" ><asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
                       <asp:ImageButton ID="imgBtnModifyPwd" runat="server" ImageUrl="~/Tool/CSS/Images/Update.GIF" OnClick="imgBtnModifyPwd_Click1"/>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					   <asp:ImageButton ID="imgBtnReset" runat="server" CausesValidation="false" ImageUrl="~/Tool/CSS/Images/RESET.GIF" OnClick="imgBtnReset_Click"  /></td>
                </tr>
            </table>         
              
            </td>
        </tr>
    </table>  
</asp:Content>
