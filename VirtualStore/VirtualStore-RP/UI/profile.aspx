<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="VirtualStore_RP.UI.profile" %>

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
            <h1>PERFIL</h1>
        </section>

        <div>
            <asp:GridView
                ID="ClientGrid"
                OnRowEditing="ClientGrid_RowEditing"
                OnRowCancelingEdit="ClientGrid_RowCancelingEdit"
                OnRowUpdating="ClientGrid_RowUpdating"
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
                        <EditItemTemplate>
                            <asp:TextBox ID="textName" Text='<%# Bind("name")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tipo">
                        <ItemTemplate>
                            <asp:Label ID="labelType" runat="server" Text='<%# Eval("type")%>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CPF">
                        <ItemTemplate>
                            <asp:Label ID="labelCPF" runat="server" Text='<%# Eval("cpf")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textCPF" Text='<%# Bind("cpf")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Telefone">
                        <ItemTemplate>
                            <asp:Label ID="labelTelefone" runat="server" Text='<%# Eval("phone")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textTelefone" Text='<%# Bind("phone")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="labelEmail" runat="server" Text='<%# Eval("email")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textEmail" Text='<%# Bind("email")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Pass">
                        <ItemTemplate>
                            <asp:Label ID="labelPass" runat="server" Text='<%# Eval("password")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textPass" Text='<%# Bind("password")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="true" ButtonType="Link" HeaderText="Editar" runat="server"></asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>

        <section class="text-center">
            <h1>ENDEREÇO</h1>
        </section>

        <div class="mb-3">
            <asp:GridView
                ID="AddressGrid"
                OnRowEditing="AddressGrid_RowEditing"
                OnRowCancelingEdit="AddressGrid_RowCancelingEdit"
                OnRowUpdating="AddressGrid_RowUpdating"
                OnRowDeleting="AddressGrid_RowDeleting"
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

                    <asp:TemplateField HeaderText="Rua">
                        <ItemTemplate>
                            <asp:Label ID="labelStreet" runat="server" Text='<%# Eval("street")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textStreet" Text='<%# Bind("street")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Número">
                        <ItemTemplate>
                            <asp:Label ID="labelNumber" runat="server" Text='<%# Eval("number")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textNumber" Text='<%# Bind("number")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Bairro">
                        <ItemTemplate>
                            <asp:Label ID="labelNeighborhood" runat="server" Text='<%# Eval("neighborhood")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textNeighborhood" Text='<%# Bind("neighborhood")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cidade">
                        <ItemTemplate>
                            <asp:Label ID="labelCity" runat="server" Text='<%# Eval("city")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textCity" Text='<%# Bind("city")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CEP">
                        <ItemTemplate>
                            <asp:Label ID="labelCep" runat="server" Text='<%# Eval("cep")%>'>
                            </asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textCep" Text='<%# Bind("cep")%>' runat="server">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="true" ButtonType="Link" HeaderText="Editar" runat="server"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Link" HeaderText="Excluir" runat="server"></asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="d-flex align-items-center flex-column w-25">
            <asp:Button ID="BtnRegisterAddress" Class="btn btn-primary w-100 mb-3 " runat="server" Text="Novo Endereço" OnClick="BtnRegisterAddress_Click" />
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
