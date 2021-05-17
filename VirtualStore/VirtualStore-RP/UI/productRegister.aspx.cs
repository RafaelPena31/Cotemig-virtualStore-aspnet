using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using VirtualStore_RP.BLL;
using VirtualStore_RP.DTO;

namespace VirtualStore_RP.UI
{
    public partial class productRegister : System.Web.UI.Page
    {
        ProductBLL productBLL = new ProductBLL();
        ProductDTO productDTO = new ProductDTO();

        ProviderBLL providerBLL = new ProviderBLL();

        CategoryBLL categoryBLL = new CategoryBLL();

        public void ShowProvider()
        {
            ddlProvider.DataSource = providerBLL.Consult();
            ddlProvider.DataValueField = "id";
            ddlProvider.DataTextField = "namePro";
        }

        public void ShowCategory()
        {
            ddlCategory.DataSource = categoryBLL.Consult();
            ddlCategory.DataValueField = "id";
            ddlCategory.DataTextField = "nameCat";
        }



        protected void Page_Load(object sender, EventArgs e)
        {

            ShowProvider();
            ShowCategory();

            if (!Page.IsPostBack)
            {
                ddlCategory.DataBind();
                ddlProvider.DataBind();
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlProvider_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            try
            {
                productDTO.Name = txtName.Text;
                productDTO.Description = txtDescription.Text;
                productDTO.ProductValue = Convert.ToDouble(txtValue.Text);
                productDTO.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
                productDTO.ProviderID = int.Parse(ddlProvider.SelectedValue);
                productDTO.StockQuantify = Convert.ToInt32(txtStockQuantity.Text);
                productDTO.Photo = uplPhoto.FileName.ToString();

                productBLL.Insert(productDTO);

                string locationPhoto = Server.MapPath("~/IMG/Products/" + productDTO.Photo);
                uplPhoto.SaveAs(locationPhoto);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Produto registrado com sucesso!!!')", true);
                ClearFields();
            }
            catch (Exception ex)
            {
                msgErro.Visible = true;
                msgErro.Text = ex.Message;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        public void ClearFields()
        {
            txtName.Text = "";
            txtDescription.Text = "";
            txtValue.Text = "";
            ddlCategory.SelectedIndex = -1;
            ddlProvider.SelectedIndex = -1;
            txtStockQuantity.Text = "";
            uplPhoto.Dispose();
        }
    }
}