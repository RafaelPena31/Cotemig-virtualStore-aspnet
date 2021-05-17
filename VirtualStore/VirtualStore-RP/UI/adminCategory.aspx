<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminCategory.aspx.cs" Inherits="VirtualStore_RP.UI.adminCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>VirtualStore - Visualizar Categoria</title>
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
                        <asp:HyperLink ID="IndexRedirect" CssClass="nav-link" NavigateUrl="~/UI/home.aspx" Text="Início" runat="server"></asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink2" CssClass="nav-link" NavigateUrl="~/UI/profile.aspx" Text="Perfil" runat="server"></asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink13" CssClass="nav-link" NavigateUrl="~/UI/adminClient.aspx" Text="Clientes" runat="server"></asp:HyperLink>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink ID="d" CssClass="nav-link dropdown-toggle active" NavigateUrl="#" data-bs-toggle="dropdown" aria-expanded="false" Text="Categoria" runat="server"></asp:HyperLink>
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
                        <asp:HyperLink ID="HyperLink7" CssClass="nav-link dropdown-toggle" NavigateUrl="#" data-bs-toggle="dropdown" aria-expanded="false" Text="Fornecedores" runat="server"></asp:HyperLink>
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

    <form id="form1" runat="server">
        <div class="d-flex justify-content-center mt-3 mb-3">
            <div class="w-50 d-flex ">
                <asp:TextBox ID="txtCategorySearch" class="form-control" placeholder="Pesquisar por parte do nome" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Pesquisar" OnClick="btnSearch_Click" />
                <asp:Button ID="btnRegister" runat="server" class="btn btn-success mx-3" Text="Registrar Categoria" OnClick="btnRegister_Click" />
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <div class="w-75 px-3">
                <asp:GridView ID="gridViewCategory" class="table table-hover"
                    AutoGenerateColumns="false"
                    OnRowDeleting="gridViewCategory_RowDeleting"
                    OnRowCancelingEdit="gridViewCategory_RowCancelingEdit"
                    OnRowEditing="gridViewCategory_RowEditing"
                    OnRowUpdating="gridViewCategory_RowUpdating"
                    DataKeyNames="id"
                    runat="server">

                    <Columns>

                        <asp:TemplateField HeaderText="Código">
                            <ItemTemplate>
                                <asp:Label class="form-label" ID="lblCategoryCode" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nome">
                            <ItemTemplate>
                                <asp:Label class="form-label" ID="lblCategoryName" runat="server" Text='<%# Eval("nameCat") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox class="form-control" ID="txtCategoryName" Text='<%# Bind("nameCat") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <asp:Label class="form-label" ID="lblcategoryDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox class="form-control" ID="txtCategoryDescription" Text='<%# Bind("description") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="true" ButtonType="Image" EditImageUrl="~/IMG/edit.png"
                            CancelImageUrl="~/IMG/cancel.png" UpdateImageUrl="~/IMG/update.png" runat="server" />

                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/IMG/trash.png" runat="server" />


                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <nav class="position-absolute bottom-0 text-center">
        <div class="container-fluid">
            <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena</b> e <b>Arthur Santiago</b>. Todos os direitos reservados.</p>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
