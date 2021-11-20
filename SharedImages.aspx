<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SharedImages.aspx.cs" Inherits="SharedImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SharedImage" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:ImageField HeaderText="Image" DataImageUrlField="ImagePath" ControlStyle-Height="260" ControlStyle-Width="280" >
                </asp:ImageField>
                <asp:BoundField DataField="SharedImage" HeaderText="SharedImage" SortExpression="SharedImage" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [ImageData] WHERE ([SharedImage] IS NOT NULL)"></asp:SqlDataSource>
        <div>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MainPage.aspx">Back</asp:HyperLink>
    </form>
</body>
</html>
