<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DEX_PPMP_XMLGen.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 619px; width: 101%">

        <tr>

            <td valign="top" align="left">

                
                <p style="color: #0000FF; font-size: x-large"><strong>#Part2#PPMP DEX XML Files Generation</strong></p>
                <p style="font-size: medium; color: #006600"><strong><span style="color: #FF0066">Step1: Import all ready-to-go data (client /case /session) -- After validation by Allied Health</span> </strong> </p>
                <p style="font-size: medium; color: #006600"><span style="font-size: small">Please save&nbsp; \\10.10.1.186\c$\inetpub\sites\DEX\Import_Data_#ConvertToCSV#\2 - PPMP DEX For XML Files.xlsx to 3 csv files for client / case / session</span></p>
                <p>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Import Client / Case / Session Data" Width="350px" Height="36px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
                <p style="font-size: medium; color: #FF0066; width: 1083px"><strong>Step2: Data Check </strong></p>
                <p>
                    <asp:Button ID="Button2" runat="server" Height="40px" Text="Client: duplicate records" Width="152px" OnClick="Button2_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Client: Issue SLK" Width="170px"   Height="40px"/>
                </p>
                <p style="font-size: medium; color: #FF0066"><strong>Step3: Client XML File Generation</strong></p>
                <p style="font-size: medium; color: #FF0066">
                    <asp:Button ID="Button11" runat="server" Text="Generate Data" Width="142px" Height="40px" OnClick="Button11_Click"/>
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button12" runat="server" Text="Generate XML File" Width="191px" Height="40px" OnClick="Button12_Click"/>
                </p>
                <p style="font-size: medium; color: #FF0066"><strong>Step4: Case XML File Generation</strong></p>
                <p style="font-size: medium; color: #FF0066">
                    <asp:Button ID="Button13" runat="server" Height="39px" OnClick="Button13_Click" Text="Generate Data" Width="137px" />
                    &nbsp;</p>
                <p style="font-size: medium; color: #FF0066"><strong>Step5: Session XML File Generation</strong></p>
                <p style="font-size: medium; color: #FF0066">&nbsp;<asp:Button ID="Button14" runat="server" Height="39px" OnClick="Button14_Click" Text="Generate Data" Width="129px" />
                </p>
                <p style="font-size: medium; color: #006666"><strong>------------------------------------------Logs and data:</strong>  -------------------------------------------------------------------------------------------------------</p>
                <p style="font-size: medium; color: #006666">
                    <asp:Button ID="Button6" runat="server" Text="Clear Logs" Width="158px" Height="36px" OnClick="Button6_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="Button7" runat="server" Text="Save Data to XML" Width="144px" Height="36px" OnClick="Button7_Click" />
                    </p>
                <p style="font-size: medium; color: #006666">
                    <asp:TextBox ID="logtxt" runat="server" Height="233px" TextMode="MultiLine" Width="1158px"></asp:TextBox>
                </p>

                <asp:Panel ID="Panel1" runat="server" Height="16px" Width="744px">
                    <br />
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />&nbsp; &nbsp;&nbsp;<br />
                    </asp:Panel>
                <br />

            </td>
        </tr>
    </table>
</asp:Content>

