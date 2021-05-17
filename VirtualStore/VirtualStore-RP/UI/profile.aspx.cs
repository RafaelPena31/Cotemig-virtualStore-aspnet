using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VirtualStore_RP.BLL;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.UI
{
    public partial class profile : System.Web.UI.Page
    {
        ClientDTO clientDTO = new ClientDTO();
        ClientBLL clientBLL = new ClientBLL();
        AddressDTO addressDTO = new AddressDTO();
        AddressBLL addressBLL = new AddressBLL();
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
        public void GridViewLoadDataByUser()
        {
            string profileConditional = string.Format($@"c.email like '%{Session["UserEmail"].ToString()}%'");
            ClientGrid.DataSource = clientBLL.SearchClient(profileConditional);
            ClientGrid.DataBind();
        }
        public void GridViewLoadAddressDataByUser()
        {
            DataTable dtResult = addressBLL.GetUserAddress(int.Parse(Session["UserId"].ToString()));
            AddressGrid.DataSource = dtResult;
            if (dtResult.Rows.Count == 0)
            {
                string msg = "Você ainda não possui endereço cadastrado, clique no botão para cadastrar";
                snackbarError.Text = msg;
                snackbarError.Visible = true;
            }
            AddressGrid.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserId"] == null || Session["UserType"] == null || Session["UserEmail"].ToString().Length == 0 || Session["UserId"].ToString().Length == 0 ||
                Session["UserType"].ToString().Length == 0)
            {
                Response.Redirect("index.aspx");
            }
            GridViewLoadDataByUser();
            GridViewLoadAddressDataByUser();
            if (!Page.IsPostBack)
            {
                ClientGrid.DataBind();
                AddressGrid.DataBind();
            }
        }
        protected void ClientGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ClientGrid.PageIndex = e.NewEditIndex;
            GridViewLoadDataByUser();
        }
        protected void ClientGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ClientGrid.EditIndex = -1;
            GridViewLoadDataByUser();
        }
        protected void ClientGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string defaultType = clientBLL.ConsultID(Convert.ToInt32(ClientGrid.DataKeys[e.RowIndex].Value.ToString())).Rows[0]["type"].ToString();
                clientDTO.Id = Convert.ToInt32(ClientGrid.DataKeys[e.RowIndex].Value.ToString());
                clientDTO.Name = e.NewValues[0]?.ToString().Length > 0 ? e.NewValues[0].ToString() : "";
                clientDTO.Type = defaultType;
                clientDTO.Cpf = e.NewValues[1]?.ToString().Length > 0 ? e.NewValues[1].ToString() : "";
                clientDTO.Phone = e.NewValues[2]?.ToString().Length > 0 ? e.NewValues[2].ToString() : "";
                clientDTO.Email = e.NewValues[3]?.ToString().Length > 0 ? e.NewValues[3].ToString() : "";
                clientDTO.Password = e.NewValues[4]?.ToString().Length > 0 ? e.NewValues[4].ToString() : "";

                clientBLL.Update(clientDTO);
                ClientGrid.EditIndex = -1;
                string successMsg = "Atualização cadastrada com sucesso!";
                SuccessMessage(successMsg);
                GridViewLoadDataByUser();
            }
            catch (Exception error)
            {
                ErrorMessage(error.Message);
            }
        }
        protected void AddressGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            AddressGrid.PageIndex = e.NewEditIndex;
            GridViewLoadAddressDataByUser();
        }
        protected void AddressGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            AddressGrid.EditIndex = -1;
            GridViewLoadAddressDataByUser();
        }
        protected void AddressGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                addressDTO.Id = Convert.ToInt32(ClientGrid.DataKeys[e.RowIndex].Value.ToString());
                addressDTO.Street = e.NewValues[0]?.ToString().Length > 0 ? e.NewValues[0].ToString() : "";
                addressDTO.Number = e.NewValues[1]?.ToString().Length > 0 ? e.NewValues[1].ToString() : "";
                addressDTO.Neighborhood = e.NewValues[2]?.ToString().Length > 0 ? e.NewValues[2].ToString() : "";
                addressDTO.City = e.NewValues[3]?.ToString().Length > 0 ? e.NewValues[3].ToString() : "";
                addressDTO.Cep = e.NewValues[4]?.ToString().Length > 0 ? e.NewValues[4].ToString() : "";

                addressBLL.Update(addressDTO);
                AddressGrid.EditIndex = -1;
                string successMsg = "Atualização cadastrada com sucesso!";
                SuccessMessage(successMsg);
                GridViewLoadAddressDataByUser();
            }
            catch (Exception error)
            {
                ErrorMessage(error.Message);
            }
        }
        protected void AddressGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            addressDTO.Id = Convert.ToInt32(AddressGrid.DataKeys[e.RowIndex].Value.ToString());
            addressBLL.Delete(addressDTO.Id);
            GridViewLoadAddressDataByUser();
        }

        protected void BtnRegisterAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("addressRegister.aspx");
        }
    }
}