<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientHome.aspx.cs" Inherits="VirtualStore_RP.UI.clientHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>VirtualStore - Tela inicial</title>
</head>
<body>
    <form id="form1" runat="server" class="vh-100 d-flex align-items-center flex-column">
        <nav class="navbar navbar-expand-lg navbar-dark bg-light w-100 bg-dark">
            <div class="container-fluid">
                <asp:HyperLink CssClass="navbar-brand" ID="logo" NavigateUrl="~/UI/index.aspx" Text="VirtualStore" runat="server"></asp:HyperLink>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link active" NavigateUrl="~/UI/home.aspx" Text="Início" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink2" CssClass="nav-link" NavigateUrl="~/UI/profile.aspx" Text="Perfil" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink5" CssClass="nav-link" NavigateUrl="~/UI/searchProvider.aspx" Text="Fornecedores" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink6" CssClass="nav-link" NavigateUrl="~/UI/searchProduct.aspx" Text="Produtos" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink4" CssClass="nav-link" NavigateUrl="~/UI/index.aspx" Text="Sair" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="d-flex justify-content-center align-items-center h-100 w-50 flex-column text-center">
            <h1 class="text-dark">Seja bem vindo ao nosso sistema</h1>
            <p class="text-secondary">Escolha qual ação gostaria de realizar em nosso dashboard através do nosso menu superior de opções</p>
        </div>

        <nav class="position-fixed bottom-0">
            <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.</p>
        </nav>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
