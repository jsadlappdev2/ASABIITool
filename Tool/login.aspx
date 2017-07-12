<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Web_Login" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Integration Assistant Tool</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="JS/menu/menu.css" rel="stylesheet" />
    <script src="JS/jquery.1.4.2-min.js"></script>

</head>
<body>
    <table width="100%" height="600px" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="100%" align="center" valign="middle">

                <form id="form1" runat="server" defaultbutton="imgBtnLogin" defaultfocus="txtUserID">
                    <table class="BoxLogin" cellspacing="0" cellpadding="1" width="350" align="center" border="0">
                        <tr height="30">
                            <td colspan="3" align="center">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Tool/CSS/Images/LoginTitle2.JPG" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30" colspan="3" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="30" align="center" width="157">UserId &nbsp;：</td>
                            <td width="168" height="30">
                                <div align="left">
                                    <asp:TextBox ID="txtUserID" runat="server" MaxLength="20" Width="150px"></asp:TextBox>
                                </div>
                            </td>
                            <td width="124">
                      
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID"
                                        ErrorMessage="NULL！"></asp:RequiredFieldValidator>
                               
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="center" width="157">&nbsp;</td>
                            <td width="168" height="30">
                                <asp:CheckBox ID="cbxRemeberUser" runat="server" Text="Remember me" Checked="true" />
                            </td>
                            <td width="124">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" height="30">Password &nbsp;：</td>
                            <td height="30">
                                <div align="left">
                                    <asp:TextBox ID="txtPwd" runat="server" MaxLength="20" TextMode="Password" Width="150px"></asp:TextBox>
                                </div>
                            </td>
                            <td align="left">
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                        ErrorMessage="NULL！"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="center" height="30">Validation Code：</td>
                            <td height="30">
                                <div align="left">
                                    <asp:TextBox ID="Validator" runat="server" Width="150px"></asp:TextBox>
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:ImageButton ID="ChangeCode" runat="server" Width="55px" ToolTip="Not Clear？Click again" ImageUrl="~/Tool/ValidateImage.aspx" CausesValidation="false" OnClick="ChangeCode_Click" />
                                </div>
                            </td>
                        </tr>
                        <tr height="50">
                            <td align="center" colspan="3">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="red"></asp:Label>
                                <br />
                                <asp:ImageButton ID="imgBtnLogin" runat="server" ImageUrl="~/Tool/css/Images/Login.GIF" OnClick="imgBtnLogin_Click" /></td>
                        </tr>
                        <tr height="50">
                            <td align="center" colspan="3">&nbsp;</td>
                        </tr>
                    </table>
                </form>

            </td>
        </tr>
    </table>
</body>
</html>
