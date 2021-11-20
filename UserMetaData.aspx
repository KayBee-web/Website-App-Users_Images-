<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserMetaData.aspx.cs" Inherits="UserMetaData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSourceMD" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [ImageData]"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Image properties"></asp:Label>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ImageID" DataSourceID="SqlDataSourceMD">
                <Columns>
                    <asp:BoundField DataField="ImageID" HeaderText="ImageID" InsertVisible="False" ReadOnly="True" SortExpression="ImageID" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="ImageName" HeaderText="ImageName" SortExpression="ImageName" />
                    <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                    
                    <asp:BoundField DataField="Date&amp;Time" HeaderText="Date&amp;Time" SortExpression="Date&amp;Time" />
                    
                    <asp:BoundField DataField="SharedImage" HeaderText="SharedImage" SortExpression="SharedImage" />
                    
                </Columns>
            </asp:GridView>
        </div>
        <p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="User Photos" Width="94px" />
    </form>
</body>
</html>
