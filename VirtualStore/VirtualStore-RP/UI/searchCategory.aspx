<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchCategory.aspx.cs" Inherits="VirtualStore_RP.UI.searchCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title>Visualizar o produto</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-light w-100 bg-dark">
            <div class="container-fluid">
                <asp:HyperLink CssClass="navbar-brand" ID="logo" NavigateUrl="~/UI/index.aspx" Text="VirtualStore" runat="server"></asp:HyperLink>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link" NavigateUrl="~/UI/index.aspx" Text="Tela Inicial" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="LoginRedirect" CssClass="nav-link" NavigateUrl="~/UI/login.aspx" Text="Login de acesso" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="ProductRedirect" CssClass="nav-link active" NavigateUrl="~/UI/searchProduct.aspx" Text="Produtos" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="d-flex justify-content-center mt-3 mb-3">
            <div class="w-50 d-flex">
            <asp:TextBox ID="txtCategorySearch" class="form-control" placeholder="Pesquisar por parte do nome" runat="server"></asp:TextBox>
              <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Pesquisar" OnClick="btnSearch_Click"/>
         </div>
            </div>

        <div class="d-flex justify-content-center px-3">
        <div class="w-75">
            <asp:GridView ID="gridViewCategory" AutoGenerateColumns="false" DataKeyNames="id" runat="server" class="table table-hover">
                <Columns>

                    <asp:TemplateField HeaderText="Código">
                        <ItemTemplate>
                            <asp:Label ID="lblProductCode" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("nameCat") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Descrição">
                        <ItemTemplate>
                            <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
            </div>

        <nav class="position-fixed bottom-0 w-100 text-center">
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena</b> e <b>Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
    </form>
</body>
</html>
