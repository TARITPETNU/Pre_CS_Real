<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="test1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title>ThaiCreate.Com</title>
    <style type="text/css">
        .style1
        {
            width: 400px;
        }
        .style2
        {
            width: 251px;
        }
        .style3
        {
            width: 138px;
        }
    </style>
</head>
<body>
    <div>
        <asp:Label ID="Cart" runat="server" Font-Size="X-Large" Text="Your Cart"></asp:Label>
        <br />
    
        <asp:GridView ID="myGridView" runat="server" AutoGenerateColumns="False" 
            onrowcommand="myGridView_RowCommand" onrowdatabound="myGridView_RowDataBound">
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
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:Label ID="lblSumTotal" runat="server"></asp:Label>
        <br />
    
    <asp:HyperLink ID="hplViewProduct" runat="server" NavigateUrl="Product.aspx">View Product</asp:HyperLink>
&nbsp;
        <asp:LinkButton ID="lnkClearCart" runat="server" onclick="lnkClearCart_Click">Clear Cart</asp:LinkButton>
    
    &nbsp;
        <asp:LinkButton ID="lnkCheckOut" runat="server" onclick="lnkCheckOut_Click">CheckOut</asp:LinkButton>
        <asp:Panel ID="pnlCheckOut" runat="server" Visible="False">
            <table class="style1">
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtName" runat="server" Width="149px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtAddress" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblTel" runat="server" Text="Tel"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtTel" runat="server" Width="149px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtEmail" runat="server" Width="148px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
        </asp:Panel>
    
    </div>
</body>
</html>
</asp:Content>
