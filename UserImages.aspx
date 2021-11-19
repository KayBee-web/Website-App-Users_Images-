<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserImages.aspx.cs" Inherits="UserImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 364px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="24pt" Text="Choose you want to save :"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="UpLoadImage" runat="server" Width="323px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" Width="135px" />
                </td>
            </tr>
        </table>
        <div>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="Blue" NavigateUrl="~/MainPage.aspx">Click to View and Share pictures</asp:HyperLink>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Log_In.aspx">Back</asp:HyperLink>
        </p>
    </form>
</body>
</html>
