﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="View_n_Share" %>

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
                                    <h1>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                        </asp:DropDownList>
                                        <asp:Label ID="Label2" runat="server" Text="Image to delete(ImageId)    :"></asp:Label>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [ImageData]"></asp:SqlDataSource>
                                    </h1>
                                    <h1>Display images</h1>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ImagePath" Width="296px"  >
                                        <Columns>
                                            <asp:BoundField HeaderText="ImageName" DataField="ImageName" />
                                            <asp:ImageField HeaderText="Image" DataImageUrlField="ImagePath" ControlStyle-Height="160" ControlStyle-Width="170" >

<ControlStyle Height="160px" Width="170px"></ControlStyle>

                                            </asp:ImageField>
                                            <asp:TemplateField HeaderText="Download">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Download</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                        </Columns>
                                        <EmptyDataTemplate>
                                            ImageName
                                        </EmptyDataTemplate>
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
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UserImages.aspx">Upload</asp:HyperLink>
    </form>
</body>
</html>