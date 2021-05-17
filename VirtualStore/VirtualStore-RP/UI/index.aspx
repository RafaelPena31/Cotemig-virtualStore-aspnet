<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs"
    Inherits="VirtualStore_RP.UI.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
        crossorigin="anonymous" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>VirtualStore - Sistemas AS e RP</title>
</head>
<body>
    <form
        id="form1"
        runat="server"
        class="vh-100 d-flex align-items-center flex-column">
        <nav class="navbar navbar-expand-lg navbar-dark bg-light w-100 bg-dark">
            <div class="container-fluid">
                <asp:HyperLink
                    CssClass="navbar-brand"
                    ID="logo"
                    NavigateUrl="~/UI/index.aspx"
                    Text="VirtualStore"
                    runat="server"></asp:HyperLink>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink
                                ID="IndexRedirect"
                                CssClass="nav-link active"
                                NavigateUrl="~/UI/index.aspx"
                                Text="Tela Inicial"
                                runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink
                                ID="LoginRedirect"
                                CssClass="nav-link"
                                NavigateUrl="~/UI/login.aspx"
                                Text="Login de acesso"
                                runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="d-flex justify-content-center align-items-center h-100">
            <h1>Seja bem vindo ao nosso sistema!</h1>
        </div>

        <nav class="position-fixed bottom-0">
            <div class="container-fluid">
                <p class="navbar-brand">
                    Copyright &copy; Desenvolvido por
            <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.
                </p>
            </div>
        </nav>
    </form>
</body>
</html>
