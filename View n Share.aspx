<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View n Share.aspx.cs" Inherits="View_n_Share" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <h1>Display images</h1>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="296px">
                                        <Columns>
                                            <asp:BoundField HeaderText="ImageName" DataField="ImageName" />
                                            <asp:ImageField HeaderText="Image" DataImageUrlField="ImagePath" ControlStyle-Height="160" ControlStyle-Width="170" >

                                            </asp:ImageField>
                                        </Columns>
                                    </asp:GridView>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="View " Width="105px" OnClick="Button1_Click" Height="41px" />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
