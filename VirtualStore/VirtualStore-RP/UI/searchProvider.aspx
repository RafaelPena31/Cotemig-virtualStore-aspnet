<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchProvider.aspx.cs" Inherits="VirtualStore_RP.UI.searchProvider" %>

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
                            <asp:HyperLink ID="IndexRedirect" CssClass="nav-link" NavigateUrl="~/UI/clientHome.aspx" Text="Voltar para a tela principal" runat="server"></asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="text-center">
            <h1>LISTA DE FORNECEDORES</h1>
        </section>

        <div class="d-flex align-items-center flex-column w-50">
            <asp:TextBox ID="TxtSearchBox" placeholder="Pesquisar por parte do nome" runat="server" OnTextChanged="TxtSearchBox_TextChanged" CssClass="w-100 mb-4"></asp:TextBox>
            <asp:Button ID="BtnSearchProvider" Class="btn btn-primary w-100 mb-3 " runat="server" Text="Pesquisar" OnClick="BtnSearchProvider_Click" />
        </div>

        <div>
            <asp:GridView
                ID="ProviderGrid"
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
                            <asp:Label ID="labelName" runat="server" Text='<%# Eval("name")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CNPJ">
                        <ItemTemplate>
                            <asp:Label ID="labelCNPJ" runat="server" Text='<%# Eval("cnpj")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="labelEmail" runat="server" Text='<%# Eval("email")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Telefone">
                        <ItemTemplate>
                            <asp:Label ID="labelTelefone" runat="server" Text='<%# Eval("phone")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nome do representante">
                        <ItemTemplate>
                            <asp:Label ID="labelRepresentativeName" runat="server" Text='<%# Eval("representativeName")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Telefone do representante">
                        <ItemTemplate>
                            <asp:Label ID="labelRepresentativePhone" runat="server" Text='<%# Eval("representativePhone")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <nav class="position-fixed bottom-0">
            <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena e Arthur Santiago</b>. Todos os direitos reservados.</p>
        </nav>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
