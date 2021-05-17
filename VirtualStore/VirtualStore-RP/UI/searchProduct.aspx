<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchProduct.aspx.cs" Inherits="VirtualStore_RP.UI.searchProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" class="d-flex align-items-center flex-column">
        <nav class="navbar navbar-expand-lg navbar-dark bg-light w-100 bg-dark">
            <div class="container-fluid">
                <asp:HyperLink CssClass="navbar-brand" ID="logo" NavigateUrl="~/UI/index.aspx" Text="VirtualStore" runat="server"></asp:HyperLink>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link" NavigateUrl="~/UI/clientHome.aspx" Text="Voltar para a tela principal" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <nav class="position-fixed bottom-0">
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
    </form>
</body>
</html>
