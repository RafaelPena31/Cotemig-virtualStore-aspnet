using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VirtualStore_RP.BLL;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.UI
{
    public partial class providerRegister : System.Web.UI.Page
    {
        private void ErrorMessage(string error)
        {
            snackbarError.Text = string.Format($@"Erro no sistema: '{error}'");
            snackbarError.Visible = true;
            snackbarOK.Visible = false;
        }
        private void SuccessMessage(string message)
        {
            snackbarOK.Text = message;
            snackbarOK.Visible = true;
            snackbarError.Visible = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserId"] == null || Session["UserType"] == null || Session["UserEmail"].ToString().Length == 0 || Session["UserId"].ToString().Length == 0 ||
                Session["UserType"].ToString().Length == 0)
            {
                Response.Redirect("index.aspx");
            }
            if (Session["UserType"].ToString() != "admin")
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnRegisterClient_Click(object sender, EventArgs e)
        {
            try
            {
                ProviderDTO providerDTO = new ProviderDTO();
                ProviderBLL providerBLL = new ProviderBLL();
                providerDTO.Name = txtRegisterName.Text;
                providerDTO.Cnpj = txtRegisterCnpj.Text;
                providerDTO.Email = txtRegisterEmail.Text;
                providerDTO.Phone = txtRegisterPhone.Text;
                providerDTO.RepresentativeName = txtRegisterRepresentativeName.Text;
                providerDTO.RepresentativePhone = txtRegisterRepresentativePhone.Text;
                string clientId = providerBLL.ReturnID(providerDTO.Email);
                if (clientId == "NOT_FOUND")
                {
                    providerBLL.Insert(providerDTO);
                    clientId = providerBLL.ReturnID(providerDTO.Email);
                    string msg = string.Format($@"Seja bem vindo ao nosso sistema '{providerDTO.Name}'");
                    SuccessMessage(msg);
                    Response.Redirect("adminProvider.aspx");
                }
                else
                {
                    string msg = string.Format($@"Não foi possível finalizar o cadastro. Já existe um usuário com o e-mail: '{providerDTO.Email}'");
                    ErrorMessage(msg);
                }
            }
            catch (Exception error)
            {
                ErrorMessage(error.Message);
            }
        }
    }
}