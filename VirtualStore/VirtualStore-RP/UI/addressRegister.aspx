<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addressRegister.aspx.cs" Inherits="VirtualStore_RP.UI.addressRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>VirtualStore - Registro de endereço</title>
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
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link" NavigateUrl="~/UI/profile.aspx" Text="Voltar para a tela de perfil" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="form-group w-25 mb-3">
            <div class="mb-3">
                <h1>Registro de endereço</h1>
            </div>

            <div class="mb-3">
                <asp:Label for="txtRegisterStreet" class="form-label" runat="server" Text="Rua:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterStreet" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterNumber" class="form-label" runat="server" Text="Número:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterNumber" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterNeighborhood" class="form-label" runat="server" Text="Bairro:"></asp:Label>
                <asp:TextBox type="phone" class="form-control" ID="txtRegisterNeighborhood" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Label for="txtRegisterCity" class="form-label" runat="server" Text="Cidade:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterCity" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterCep" class="form-label" runat="server" Text="CEP:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterCep" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Button type="button" ID="btnRegisterAddress" CssClass="btn btn-primary w-100" Text="Cadastrar endereço" runat="server" OnClick="btnRegisterAddress_Click"></asp:Button>
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
</body>
</html>
