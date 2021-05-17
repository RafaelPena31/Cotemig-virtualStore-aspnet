<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="providerRegister.aspx.cs" Inherits="VirtualStore_RP.UI.providerRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link" NavigateUrl="~/UI/home.aspx" Text="Início" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink2" CssClass="nav-link" NavigateUrl="~/UI/profile.aspx" Text="Perfil" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink13" CssClass="nav-link" NavigateUrl="~/UI/adminClient.aspx" Text="Clientes" runat="server"></asp:HyperLink>
                        </li>
                        <li class="nav-item dropdown">
                            <asp:HyperLink ID="d" CssClass="nav-link dropdown-toggle" NavigateUrl="#" data-bs-toggle="dropdown" aria-expanded="false" Text="Categoria" runat="server"></asp:HyperLink>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <asp:HyperLink ID="HyperLink5" CssClass="dropdown-item" NavigateUrl="~/UI/categoryRegister.aspx" Text="Cadastro de categoria" runat="server"></asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLink6" CssClass="dropdown-item" NavigateUrl="~/UI/adminCategory.aspx" Text="Gerenciador de categoria" runat="server"></asp:HyperLink>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <asp:HyperLink ID="HyperLink7" CssClass="nav-link active dropdown-toggle" NavigateUrl="#" data-bs-toggle="dropdown" aria-expanded="false" Text="Fornecedores" runat="server"></asp:HyperLink>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <asp:HyperLink ID="HyperLink8" CssClass="dropdown-item" NavigateUrl="~/UI/searchProvider.aspx" Text="Pesquisa de fornecedores" runat="server"></asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLink9" CssClass="dropdown-item" NavigateUrl="~/UI/providerRegister.aspx" Text="Cadastro de fornecedores" runat="server"></asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLink10" CssClass="dropdown-item" NavigateUrl="~/UI/adminProvider.aspx" Text="Gerenciador de fornecedores" runat="server"></asp:HyperLink>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <asp:HyperLink ID="HyperLink1" CssClass="nav-link dropdown-toggle" NavigateUrl="#" data-bs-toggle="dropdown" aria-expanded="false" Text="Produtos" runat="server"></asp:HyperLink>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <asp:HyperLink ID="HyperLink3" CssClass="dropdown-item" NavigateUrl="~/UI/searchProduct.aspx" Text="Pesquisa de produtos" runat="server"></asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLink11" CssClass="dropdown-item" NavigateUrl="~/UI/productRegister.aspx" Text="Cadastro de produtos" runat="server"></asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLink12" CssClass="dropdown-item" NavigateUrl="~/UI/adminProduct.aspx" Text="Gerenciador de produtos" runat="server"></asp:HyperLink>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink4" CssClass="nav-link" NavigateUrl="~/UI/index.aspx" Text="Sair" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="form-group w-25 mb-3">
            <div class="mb-3">
                <h1>Registro de dados de fornecedor</h1>
            </div>

            <div class="mb-3">
                <asp:Label for="txtRegisterName" class="form-label" runat="server" Text="Nome:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterName" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterCnpj" class="form-label" runat="server" Text="CNPJ:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterCnpj" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterPhone" class="form-label" runat="server" Text="Telefone:"></asp:Label>
                <asp:TextBox type="phone" class="form-control" ID="txtRegisterPhone" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterEmail" class="form-label" runat="server" Text="E-mail:"></asp:Label>
                <asp:TextBox type="email" class="form-control" ID="txtRegisterEmail" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterRepresentativeName" class="form-label" runat="server" Text="Nome do representante:"></asp:Label>
                <asp:TextBox type="representativeEmail" class="form-control" ID="txtRegisterRepresentativeName" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterRepresentativePhone" class="form-label" runat="server" Text="Telefone do representante:"></asp:Label>
                <asp:TextBox type="representativePhone" class="form-control" ID="txtRegisterRepresentativePhone" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Button type="button" ID="btnRegisterClient" CssClass="btn btn-primary w-100" Text="Cadastrar fornecedor" runat="server" OnClick="btnRegisterClient_Click"></asp:Button>
            </div>
        </div>

        <div class="form-group">
            <asp:Label Text="" ID="snackbarOK" ForeColor="Green" Visible="false" class="col-sm-2 col-form-label" runat="server"></asp:Label>
            <asp:Label Text="" ID="snackbarError" ForeColor="Red" Visible="false" class="col-sm-2 col-form-label" runat="server"></asp:Label>
        </div>

        <nav class="position-absolute bottom-0">
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
