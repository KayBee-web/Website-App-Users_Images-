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
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ImageID" DataSourceID="SqlDataSource1" Width="371px">
                                        <Columns>
                                            <asp:BoundField DataField="ImageID" HeaderText="ImageID" InsertVisible="False" ReadOnly="True" SortExpression="ImageID" />
                                            <asp:BoundField DataField="ImageName" HeaderText="ImageName" SortExpression="ImageName" />
                                            <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                                            <asp:BoundField DataField="Date&amp;Time" HeaderText="Date&amp;Time" SortExpression="Date&amp;Time" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [ImageData]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="View " Width="105px" OnClick="Button1_Click" />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button2" runat="server" Height="22px" Text="Share" Width="99px" />
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
