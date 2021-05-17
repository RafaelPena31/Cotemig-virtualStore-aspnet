<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminCategory.aspx.cs" Inherits="VirtualStore_RP.UI.adminCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Visualizar Categoria</title>
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
            <asp:TextBox ID="txtCategorySearch" class="form-control" placeholder="Pesquisar por parte do nome" runat="server"></asp:TextBox>
              <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Pesquisar" OnClick="btnSearch_Click"/>
            <asp:Button ID="btnRegister" runat="server" class="btn btn-success mx-3" Text="Registrar Categoria" OnClick="btnRegister_Click"/>
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
                        CancelImageUrl="~/IMG/cancel.png" UpdateImageUrl="~/IMG/update.png" runat="server"/>

                     <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/IMG/trash.png" runat="server"/>
              

                </Columns>
            </asp:GridView>
        </div>
            </div>
    </form>

    <nav class="position-fixed bottom-0 w-100 text-center">
            <div class="container-fluid">
                <p class="navbar-brand">Copyright &copy; Desenvolvido por <b>Rafael Pena</b> e <b>Arthur Santiago</b>. Todos os direitos reservados.</p>
            </div>
        </nav>
</body>
</html>
