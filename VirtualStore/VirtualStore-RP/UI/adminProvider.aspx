<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminProvider.aspx.cs" Inherits="VirtualStore_RP.UI.adminProvider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>VirtualStore - Gerenciamento de fornecedores</title>
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

        <section class="text-center">
            <h1>GERENCIAMENTO DE FORNECEDORES</h1>
        </section>

        <div class="d-flex align-items-center flex-column w-50">
            <asp:TextBox ID="TxtSearchBox" placeholder="Pesquisar por parte do nome" runat="server" OnTextChanged="TxtSearchBox_TextChanged" CssClass="w-100 mb-4"></asp:TextBox>
            <asp:Button ID="BtnSearchProvider" Class="btn btn-primary w-100 mb-3 " runat="server" Text="Pesquisar" OnClick="BtnSearchProvider_Click" />
            <asp:Button ID="BtnRegisterProvider" Class="btn btn-primary w-100 mb-3 " runat="server" Text="Novo Fornecedor" OnClick="BtnRegisterProvider_Click" />
        </div>

        <div>
            <asp:GridView
                ID="ProviderGrid"
                class="table table-hover"
                OnRowEditing="ProviderGrid_RowEditing"
                OnRowCancelingEdit="ProviderGrid_RowCancelingEdit"
                OnRowUpdating="ProviderGrid_RowUpdating"
                OnRowDeleting="ProviderGrid_RowDeleting"
                AutoGenerateColumns="false"
                EnableViewState="False"
                DataKeyNames="id"
                runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="labelId" runat="server" Text='<%# Eval("id")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <asp:Label ID="labelName" runat="server" Text='<%# Eval("namePro")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textName" Text='<%# Bind("namePro")%>' class="form-control" runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CNPJ">
                        <ItemTemplate>
                            <asp:Label ID="labelCNPJ" runat="server" Text='<%# Eval("cnpj")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textCNPJ" Text='<%# Bind("cnpj")%>' class="form-control" runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="labelEmail" runat="server" Text='<%# Eval("email")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textEmail" Text='<%# Bind("email")%>' class="form-control" runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Telefone">
                        <ItemTemplate>
                            <asp:Label ID="labelTelefone" runat="server" Text='<%# Eval("phone")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textTelefone" Text='<%# Bind("phone")%>' class="form-control" runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nome do representante">
                        <ItemTemplate>
                            <asp:Label ID="labelRepresentativeName" runat="server" Text='<%# Eval("representativeName")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textRepresentativeName" Text='<%# Bind("representativeName")%>' class="form-control" runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Telefone do representante">
                        <ItemTemplate>
                            <asp:Label ID="labelRepresentativePhone" runat="server" Text='<%# Eval("representativePhone")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textRepresentativePhone" Text='<%# Bind("representativePhone")%>' class="form-control" runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="true" ButtonType="Link" HeaderText="Editar" runat="server"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Link" HeaderText="Excluir" runat="server"></asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="form-group w-100 d-flex align-items-center flex-column text-center">
            <asp:Label Text="" ID="snackbarOK" ForeColor="Green" Visible="false" class="col-sm-2 col-form-label w-50" runat="server"></asp:Label>
            <asp:Label Text="" ID="snackbarError" ForeColor="Red" Visible="false" class="col-sm-2 col-form-label w-50" runat="server"></asp:Label>
        </div>

        <nav class="position-fixed bottom-0">
            <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.</p>
        </nav>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
