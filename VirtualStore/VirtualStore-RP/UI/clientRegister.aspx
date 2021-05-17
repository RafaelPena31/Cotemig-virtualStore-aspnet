<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientRegister.aspx.cs" Inherits="VirtualStore_RP.UI.clientRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title>VirtualStore - Crie sua conta</title>
</head>
<body>
    <form id="form1" runat="server" class="d-flex align-items-center flex-column">
        <nav class="navbar navbar-expand-lg navbar-dark bg-light w-100 bg-dark mb-3">
            <div class="container-fluid">
                <asp:HyperLink CssClass="navbar-brand" ID="logo" NavigateUrl="~/UI/index.aspx" Text="VirtualStore - Cadastre-se agora" runat="server"></asp:HyperLink>
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
                            <asp:HyperLink ID="ProductRedirect" CssClass="nav-link" NavigateUrl="~/UI/searchProduct.aspx" Text="Produtos" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="form-group w-25 mb-3">
            <div class="mb-3">
                <h1>Seus dados</h1>
            </div>

            <div class="mb-3">
                <asp:Label for="txtRegisterName" class="form-label" runat="server" Text="Nome:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterName" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterCpf" class="form-label" runat="server" Text="CPF:"></asp:Label>
                <asp:TextBox type="text" class="form-control" ID="txtRegisterCpf" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterPhone" class="form-label" runat="server" Text="Telefone:"></asp:Label>
                <asp:TextBox type="phone" class="form-control" ID="txtRegisterPhone" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="dropRegisterType" class="form-label" runat="server" Text="Tipo de usuário:"></asp:Label>
                <asp:DropDownList type="phone" class="form-select" ID="dropRegisterType" runat="server">
                    <asp:ListItem Text="cliente" Value="client" />
                    <asp:ListItem Text="administrador" Value="admin" />
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <h1>Informações de registro</h1>
            </div>

            <div class="mb-3">
                <asp:Label for="txtRegisterEmail" class="form-label" runat="server" Text="E-mail:"></asp:Label>
                <asp:TextBox type="email" class="form-control" ID="txtRegisterEmail" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label for="txtRegisterPass" class="form-label" runat="server" Text="Senha:"></asp:Label>
                <asp:TextBox type="password" class="form-control" ID="txtRegisterPass" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Button type="button" ID="btnRegisterClient" CssClass="btn btn-primary w-100" Text="Quero me cadastrar" runat="server" OnClick="btnRegisterClient_Click"></asp:Button>
            </div>
        </div>

        <div class="form-group">
            <asp:Label Text="" ID="snackbarOK" ForeColor="Green" Visible="false" class="col-sm-2 col-form-label" runat="server"></asp:Label>
            <asp:Label Text="" ID="snackbarError" ForeColor="Red" Visible="false" class="col-sm-2 col-form-label" runat="server"></asp:Label>
        </div>

        <nav>
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
    </form>
</body>
</html>
