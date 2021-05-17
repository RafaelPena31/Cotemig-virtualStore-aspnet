<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="categoryRegister.aspx.cs" Inherits="VirtualStore_RP.UI.categoryRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrar Categoria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-dark bg-light w-100 bg-dark">
            <div class="container-fluid">
                <asp:HyperLink CssClass="navbar-brand" ID="logo" NavigateUrl="~/UI/index.aspx" Text="VirtualStore" runat="server"></asp:HyperLink>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link active" NavigateUrl="~/UI/index.aspx" Text="Tela Inicial" runat="server"></asp:HyperLink>
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

    <div class="d-flex justify-content-center">
    <form id="form1" runat="server" class="mt-3" style="width: 50vw">
        <div>
            <asp:HiddenField ID="id" runat="server"/>

            <div>
                <asp:Label class="form-label" for="txtName" Text="Nome" runat="server"></asp:Label>
                <asp:TextBox class="form-control" ID="txtName" runat="server"></asp:TextBox>
            </div>

            <div class="mt-3">
                <asp:Label class="form-label" for="txtDescription" Text="Descrição" runat="server"></asp:Label>
                <asp:TextBox class="form-control" ID="txtDescription" TextMode="MultiLine" Columns="30" Rows="3" runat="server" style="resize: none"></asp:TextBox>
            </div>

            <div class="mt-3">
                <asp:Button ID="register" Text="Registrar" runat="server" OnClick="register_Click" class="btn btn-primary"/>
                <asp:Button ID="cancel" Text="Cancelar" runat="server" OnClick="cancel_Click" class="btn btn-danger"/>
            </div>

            <div>
                 <asp:Label class="form-label" Text="" ID="msgErro" Visible="false" ForeColor="Red" runat="server"></asp:Label>
            </div>
        </div>
    </form>
        </div>

    <nav class="position-fixed bottom-0 w-100 text-center">
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena</b> e <b>Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
</body>
</html>
