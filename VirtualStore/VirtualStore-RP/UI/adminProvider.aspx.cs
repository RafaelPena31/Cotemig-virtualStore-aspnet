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
    public partial class adminProvider : System.Web.UI.Page
    {
        ProviderDTO providerDTO = new ProviderDTO();
        ProviderBLL providerBLL = new ProviderBLL();
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
            ProviderGrid.DataSource = providerBLL.GetProvider();
            ProviderGrid.DataBind();
        }
        public void GridViewLoadDataBySearch()
        {
            string search = string.Format($@"p.name like '%{TxtSearchBox.Text}%'");
            ProviderGrid.DataSource = providerBLL.SearchProvider(search);
            ProviderGrid.DataBind();
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
                ProviderGrid.DataBind();
            }
        }
        protected void ProviderGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            providerDTO.Id = Convert.ToInt32(ProviderGrid.DataKeys[e.RowIndex].Value.ToString());
            providerBLL.Delete(providerDTO.Id);
            GridViewLoadData();
        }
        protected void ProviderGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProviderGrid.PageIndex = e.NewEditIndex;
            GridViewLoadData();
        }
        protected void ProviderGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProviderGrid.EditIndex = -1;
            GridViewLoadData();
        }
        protected void ProviderGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                providerDTO.Id = Convert.ToInt32(ProviderGrid.DataKeys[e.RowIndex].Value.ToString());
                providerDTO.Name = e.NewValues[0]?.ToString().Length > 0 ? e.NewValues[0].ToString() : "";
                providerDTO.Cnpj = e.NewValues[1]?.ToString().Length > 0 ? e.NewValues[1].ToString() : "";
                providerDTO.Email = e.NewValues[2]?.ToString().Length > 0 ? e.NewValues[2].ToString() : "";
                providerDTO.Phone = e.NewValues[3]?.ToString().Length > 0 ? e.NewValues[3].ToString() : "";
                providerDTO.RepresentativeName = e.NewValues[4]?.ToString().Length > 0 ? e.NewValues[4].ToString() : "";
                providerDTO.RepresentativePhone = e.NewValues[5]?.ToString().Length > 0 ? e.NewValues[5].ToString() : "";

                providerBLL.Update(providerDTO);
                ProviderGrid.EditIndex = -1;
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

        protected void BtnSearchProvider_Click(object sender, EventArgs e)
        {
            GridViewLoadDataBySearch();
        }

        protected void BtnRegisterProvider_Click(object sender, EventArgs e)
        {
            Response.Redirect("providerRegister.aspx");
        }
    }
}