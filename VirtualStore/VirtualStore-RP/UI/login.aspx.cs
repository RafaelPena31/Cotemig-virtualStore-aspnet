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
                    string clientId = clientBLL.ReturnID(clientDTO.Email);
                    string clientType = clientBLL.ConsultID(int.Parse(clientId)).Rows[0]["type"].ToString();

                    Session["UserEmail"] = clientDTO.Email;
                    Session["UserId"] = clientId;
                    Session["UserType"] = clientType;
                    SuccessMessage("Seja bem-vindo");

                    switch (clientType)
                    {
                        case "client":
                            Response.Redirect("clientHome.aspx");
                            break;
                        case "admin":
                            Response.Redirect("home.aspx");
                            break;
                        default:
                            Response.Redirect("clientHome.aspx");
                            break;
                    }
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