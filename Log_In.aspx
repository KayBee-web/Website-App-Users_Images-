<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Log_In.aspx.cs" Inherits="Log_In" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 231px;
        }
        .auto-style3 {
            width: 231px;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="35pt" Text="SA DIGITICAL MARKETING LOG_IN"></asp:Label>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="User_Name(Student_no) :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="usernametxt" runat="server" Width="202px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernametxt" ErrorMessage="Enter your username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Password :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="passwordtxt" runat="server" TextMode="Password" Width="203px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordtxt" ErrorMessage="Enter your password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0066FF" NavigateUrl="~/Registration.aspx">Click To Register as new member</asp:HyperLink>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Log_In" Width="172px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
