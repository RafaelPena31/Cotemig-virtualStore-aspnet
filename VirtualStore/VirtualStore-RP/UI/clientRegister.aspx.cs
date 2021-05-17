using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VirtualStore_RP.BLL;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.UI
{
    public partial class clientRegister : System.Web.UI.Page
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


        }

        protected void btnRegisterClient_Click(object sender, EventArgs e)
        {
            try
            {
                ClientDTO clientDTO = new ClientDTO();
                ClientBLL clientBLL = new ClientBLL();
                clientDTO.Name = txtRegisterName.Text;
                clientDTO.Type = dropRegisterType.SelectedValue;
                clientDTO.Cpf = txtRegisterCpf.Text;
                clientDTO.Phone = txtRegisterPhone.Text;
                clientDTO.Email = txtRegisterEmail.Text;
                clientDTO.Password = txtRegisterPass.Text;
                string clientId = clientBLL.ReturnID(clientDTO.Email);
                if (clientId == "NOT_FOUND")
                {
                    clientBLL.Insert(clientDTO);
                    clientId = clientBLL.ReturnID(clientDTO.Email);
                    string clientType = clientBLL.ConsultID(int.Parse(clientId)).Rows[0]["type"].ToString();
                    Session["UserEmail"] = clientDTO.Email;
                    Session["UserId"] = clientId;
                    Session["UserType"] = clientType;
                    string msg = string.Format($@"Seja bem vindo ao nosso sistema '{clientDTO.Name}'");
                    SuccessMessage(msg);

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
                    string msg = string.Format($@"Não foi possível finalizar o cadastro. Já existe um usuário com o e-mail: '{clientDTO.Email}'");
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