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
    public partial class login : System.Web.UI.Page
    {
        ClientDTO clientDTO = new ClientDTO();
        ClientBLL clientBLL = new ClientBLL();

        private void ErrorMessage(string error)
        {
            snackbarError.Text = string.Format($@"Erro no sistema: '{error}'");
            snackbarError.Visible = true;
        }

        private void SuccessMessage(string message)
        {
            snackbarError.Text = message;
            snackbarError.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnForgotPass_Click(object sender, EventArgs e)
        {
            try
            {
                clientDTO.Email = txtLoginEmail.Text;
                string pass = clientBLL.RecoverPass(clientDTO.Email);
                if (pass != "NOT_FOUND")
                {
                    string msg = string.Format($@"Sua senha é: '{pass}'");
                    SuccessMessage(msg);
                }
                else
                {
                    string msgError = string.Format($@"Nenhum usuário foi encontrado com o e-mail: '{clientDTO.Email}'");
                    ErrorMessage(msgError);
                }
                snackbarOK.Visible = true;
            }
            catch (Exception error)
            {
                ErrorMessage(error.Message);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                clientDTO.Email = txtLoginEmail.Text;
                clientDTO.Password = txtLoginPass.Text;
                if (clientBLL.Authenticator(clientDTO.Email, clientDTO.Password))
                {
                    Session["UserEmail"] = clientDTO.Email;
                    SuccessMessage("Seja bem-vindo");
                    Response.Redirect("profile.aspx");
                }
                else
                {
                    ErrorMessage("Cliente não encontrado");
                }
            }
            catch (Exception error)
            {
                ErrorMessage(error.Message);
            }
        }

        protected void btnRegisterClient_Click(object sender, EventArgs e)
        {
            Response.Redirect("clientRegister.aspx");
        }
    }
}