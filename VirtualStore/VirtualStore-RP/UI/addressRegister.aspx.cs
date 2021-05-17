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
    public partial class addressRegister : System.Web.UI.Page
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
        }

        protected void btnRegisterAddress_Click(object sender, EventArgs e)
        {
            try
            {
                AddressDTO addressDTO = new AddressDTO();
                AddressBLL addressBLL = new AddressBLL();
                addressDTO.Street = txtRegisterStreet.Text;
                addressDTO.Number = txtRegisterNumber.Text;
                addressDTO.Neighborhood = txtRegisterNeighborhood.Text;
                addressDTO.City = txtRegisterCity.Text;
                addressDTO.Cep = txtRegisterCep.Text;
                addressDTO.ClientID = int.Parse(Session["UserId"].ToString());
                string addressId = addressBLL.ReturnID(addressDTO.Cep);
                if (addressId == "NOT_FOUND")
                {
                    addressBLL.Insert(addressDTO);
                    string msg = string.Format($@"Endereço cadastrado com sucess!");
                    SuccessMessage(msg);
                    Response.Redirect("profile.aspx");
                }
                else
                {
                    string msg = string.Format($@"Não foi possível finalizar o cadastro. Já existe um endereço com o cep: '{addressDTO.Cep}'");
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