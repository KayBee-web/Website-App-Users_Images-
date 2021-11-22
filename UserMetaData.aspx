<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserMetaData.aspx.cs" Inherits="UserMetaData" %>

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
        <asp:SqlDataSource ID="SqlDataSourceMD" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [ImageData] WHERE ([UserName] = @UserName)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="Username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Image properties"></asp:Label>
        <div>
            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ImageID" DataSourceID="SqlDataSourceMD">
                <Columns>
                    <asp:BoundField DataField="ImageID" HeaderText="ImageID" InsertVisible="False" ReadOnly="True" SortExpression="ImageID" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="ImageName" HeaderText="ImageName" SortExpression="ImageName" />
                    <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                    <asp:BoundField DataField="Date&amp;Time" HeaderText="Date&amp;Time" SortExpression="Date&amp;Time" />
                    <asp:BoundField DataField="SharedImage" HeaderText="SharedImage" SortExpression="SharedImage" />
                </Columns>
            </asp:GridView>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Update Image Name  :"></asp:Label>
                        <asp:TextBox ID="Txtusername" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Select ImageID :"></asp:Label>
                        <asp:TextBox ID="ImageIdtxt" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" PostBackUrl="~/UserMetaData.aspx" Text="Upadate" />
        </p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MainPage.aspx">Back</asp:HyperLink>
        </p>
    </form>
</body>
</html>
