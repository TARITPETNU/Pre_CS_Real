<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="test1.ViewOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title>ThaiCreate.Com</title>
    <style type="text/css">

        .style1
        {
            width: 400px;
        }
        .style3
        {
            width: 138px;
        }
        .style2
        {
            width: 251px;
        }
        </style>
</head>
<body>
    <div>
        <asp:Label ID="Cart" runat="server" Font-Size="X-Large" Text="Your Orders"></asp:Label>
            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblHeadOrderID" runat="server" Text="OrderID"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblOrderID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblHeadOrderDate" runat="server" Text="OrderDate"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                    </td>
                </tr>                
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblHeadName" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblHeadAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblHeadTel" runat="server" Text="Tel"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblTel" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblHeadEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        <br />
        <asp:GridView ID="myGridView" runat="server" AutoGenerateColumns="False" 
            onrowdatabound="myGridView_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="ProductID">
                    <ItemTemplate>
                        <asp:Label ID="lblProductID" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductName">
                    <ItemTemplate>
                        <asp:Label ID="lblProductName" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Qty">
                    <ItemTemplate>
                        <asp:Label ID="lblQty" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:Label ID="lblSumTotal" runat="server"></asp:Label>
        <br />
    
    </div>
</body>
</html>
</asp:Content>
