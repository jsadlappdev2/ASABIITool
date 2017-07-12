<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DEX_PPMP_Validation.aspx.cs" Inherits="Web_DepartmentManage" MasterPageFile="~/Tool/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="height: 619px; width: 101%">

        <tr>

            <td valign="top" align="left">

                
                <p style="color: #0000FF; font-size: x-large"><strong>#Part1#PPMP data process and validation for DEX</strong></p>
                <p style="font-size: medium; color: #006600"><strong><span style="color: #FF0066">Step1: Import all client lists -- provided by Allied Health</span> </strong> </p>
                <p style="font-size: medium; color: #006600"><span style="font-size: small">Please update data in \\10.10.1.186\c$\inetpub\sites\DEX\Import_Data_#ConvertToCSV#\1 - PPMP-AllClientList - From Allied Health.xlsx and save as csv file : 1 - PPMP-AllClientList - From Allied Health.csv</span></p>
                <p>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Import Client Lists" Width="207px" Height="36px" />
                    &nbsp;&nbsp;&nbsp; </p>
                <p style="font-size: medium; color: #FF0066; width: 1083px"><strong>Step2: Data Validation -- check fullname for clients ( if find some issue data, please return them to AH to fix and redo step1</strong></p>
                <p>
                    <asp:Button ID="Button2" runat="server" Height="40px" Text="Query issue fullname" Width="208px" OnClick="Button2_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <p style="font-size: medium; color: #FF0066"><strong>Step3: Query data and send back to AH for double check</strong></p>
                <p style="font-size: medium; color: #006666"><strong>Start date: <asp:TextBox ID="startdate" runat="server" Height="31px" Width="299px">2017-01-01 00:00:00.000</asp:TextBox>
&nbsp; End Date:
                    <asp:TextBox ID="enddate" runat="server" Height="31px" Width="299px">2017-06-30 23:59:59.000</asp:TextBox>
                    </strong></p>
                <p style="font-size: medium; color: #006666">&nbsp;<asp:Button ID="Button8" runat="server" Text="Client Data" Width="115px" Height="36px" OnClick="Button8_Click"  />
&nbsp;&nbsp;
                    <asp:Button ID="Button5" runat="server" Text="Case Data" Width="112px"  Height="36px" OnClick="Button5_Click" />
&nbsp;
                    <asp:Button ID="Button9" runat="server" Text="Session Data" Width="189px" Height="36px" OnClick="Button9_Click"  />
                &nbsp;<span style="font-size: small"> please get data in orders of Client-&gt;Case-&gt;Session</span></p>
                <p style="font-size: small; color: #006666">Copy data into \\10.10.1.186\c$\inetpub\sites\DEX\Import_Data_#ConvertToCSV#\2 - PPMP DEX For XML Files.xlsx send back to AH for double check</p>
                <p style="font-size: medium; color: #006666"><strong>------------------------------------------Logs and data:</strong>  -------------------------------------------------------------------------------------------------------</p>
                <p style="font-size: medium; color: #006666">
                    <asp:Button ID="Button6" runat="server" Text="Clear Logs" Width="158px" Height="36px" OnClick="Button6_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="Button7" runat="server" Text="Save Data to CSV" Width="144px" Height="36px" OnClick="Button7_Click" />
                    <span style="font-size: small">&nbsp;(You can open it directly with Excel format)</span></p>
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

