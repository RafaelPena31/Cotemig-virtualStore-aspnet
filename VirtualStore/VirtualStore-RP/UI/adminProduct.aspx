<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminProduct.aspx.cs" Inherits="VirtualStore_RP.UI.adminProduct" EnableViewState="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Vizualizar o produto</title>
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

    <form id="form1" runat="server">
        <div class="d-flex justify-content-center mt-3 mb-3">
            <div class="w-50 d-flex ">
            <asp:TextBox ID="txtProductSearch" class="form-control" placeholder="Pesquisar por parte do nome" runat="server"></asp:TextBox>
              <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Pesquisar" OnClick="btnSearch_Click"/>
            <asp:Button ID="btnRegister" runat="server" class="btn btn-success mx-3" Text="Registrar Produto" OnClick="btnRegister_Click"/>
         </div>
            </div>
        
        <div class="w-100 px-3">
            <asp:GridView ID="gridViewProduct" class="table table-hover"
                AutoGenerateColumns="false" 
                OnRowDeleting="gridViewProduct_RowDeleting"
                OnRowCancelingEdit="gridViewProduct_RowCancelingEdit"
                OnRowEditing="gridViewProduct_RowEditing"
                OnRowUpdating="gridViewProduct_RowUpdating"
                DataKeyNames="id"
                runat="server">

                <Columns>

                    <asp:TemplateField HeaderText="Código">
                        <ItemTemplate>
                            <asp:Label class="form-label" ID="lblProductCode" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <asp:Label class="form-label" ID="lblProductName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox class="form-control" ID="txtProductName" Text='<%# Bind("name") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Descrição">
                        <ItemTemplate>
                            <asp:Label class="form-label" ID="lblProductDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox class="form-control" ID="txtProductDescription" Text='<%# Bind("description") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Valor">
                        <ItemTemplate>
                            <asp:Label class="form-label" ID="lblProductValue" runat="server" Text='<%# Eval("value") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox class="form-control" ID="txtProductValue" Text='<%# Bind("value") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Categoria">
                        <ItemTemplate>
                            <asp:Label class="form-label" ID="lblProductCategory" runat="server" Text='<%# Eval("nameCat") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fornecedor">
                        <ItemTemplate>
                            <asp:Label class="form-Label" ID="lblProductProvider" runat="server" Text='<%# Eval("namePro") %>' ></asp:Label>
                        </ItemTemplate
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Foto">
                        <ItemTemplate>
                            <asp:Image ID="lblProductPhoto" ImageUrl='<%# "~/IMG/Products/" + Eval("photo") %>' Width="80" Height="100" runat="server" ></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantidade">
                        <ItemTemplate>
                            <asp:Label class="form-label" ID="lblProductQuantity" runat="server" Text='<%# Eval("stockQuantity") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox class="form-control" ID="txtProductQuantity" Text='<%# Bind("stockQuantity") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/IMG/trash.png" DeleteText="Delete" runat="server"/>
                    
                    <asp:CommandField ShowEditButton="true" ButtonType="Image" EditImageUrl="~/IMG/edit.png" EditText="Editar" 
                        CancelImageUrl="~/IMG/cancel.png" UpdateImageUrl="~/IMG/update.png" runat="server"/>

                </Columns>
            </asp:GridView>
        </div>
    </form>

    <nav class="bottom-0 w-100 text-center">
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena</b> e <b>Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
</body>
</html>
