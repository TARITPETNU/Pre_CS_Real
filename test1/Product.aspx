<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="test1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>
    <br/>
    <asp:GridView ID="GD" runat="server" AutoGenerateColumns="False" OnRowDataBound="GD_OnRowDataBound" OnRowCommand="GD_OnRowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Pic">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgPicture" Height="200px" Width="200px"></asp:Image>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="lblProductID" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cart">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkAddToCart" runat="server">Add</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
