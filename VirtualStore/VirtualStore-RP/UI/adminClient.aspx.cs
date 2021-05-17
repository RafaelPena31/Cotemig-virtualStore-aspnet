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
    public partial class adminClient : System.Web.UI.Page
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
        public void GridViewLoadData()
        {
            ClientGrid.DataSource = clientBLL.GetClient();
            ClientGrid.DataBind();
        }
        public void GridViewLoadDataBySearch()
        {
            string search = string.Format($@"c.name like '%{TxtSearchBox.Text}%'");
            ClientGrid.DataSource = clientBLL.SearchClient(search);
            ClientGrid.DataBind();
            TxtSearchBox.Text = "";
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
            GridViewLoadData();
            if (!Page.IsPostBack)
            {
                ClientGrid.DataBind();
            }
        }
        protected void ClientGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            clientDTO.Id = Convert.ToInt32(ClientGrid.DataKeys[e.RowIndex].Value.ToString());
            clientBLL.Delete(clientDTO.Id);
            GridViewLoadData();
        }
        protected void ClientGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ClientGrid.PageIndex = e.NewEditIndex;
            GridViewLoadData();
        }
        protected void ClientGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ClientGrid.EditIndex = -1;
            GridViewLoadData();
        }
        protected void ClientGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                clientDTO.Id = Convert.ToInt32(ClientGrid.DataKeys[e.RowIndex].Value.ToString());
                clientDTO.Name = e.NewValues[0]?.ToString().Length > 0 ? e.NewValues[0].ToString() : "";
                clientDTO.Type = e.NewValues[1]?.ToString().Length > 0 ? e.NewValues[1].ToString() : "";
                clientDTO.Cpf = e.NewValues[2]?.ToString().Length > 0 ? e.NewValues[2].ToString() : "";
                clientDTO.Phone = e.NewValues[3]?.ToString().Length > 0 ? e.NewValues[3].ToString() : "";
                clientDTO.Email = e.NewValues[4]?.ToString().Length > 0 ? e.NewValues[4].ToString() : "";
                clientDTO.Password = e.NewValues[5]?.ToString().Length > 0 ? e.NewValues[5].ToString() : "";

                clientBLL.Update(clientDTO);
                ClientGrid.EditIndex = -1;
                string successMsg = "Atualização cadastrada com sucesso!";
                SuccessMessage(successMsg);
                GridViewLoadData();
            }
            catch (Exception error)
            {
                ErrorMessage(error.Message);
            }
        }

        protected void TxtSearchBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSearchProduct_Click(object sender, EventArgs e)
        {
            GridViewLoadDataBySearch();
        }
    }
}