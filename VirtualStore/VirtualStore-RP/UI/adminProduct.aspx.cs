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
    public partial class adminProduct : System.Web.UI.Page
    {

        ProductBLL productBLL = new ProductBLL();
        ProductDTO productDTO = new ProductDTO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowGridViewProduct();
            }
        }

        public void ShowGridViewProduct() {
            string search = "pt.name like '%" + txtProductSearch.Text + "%'";
            gridViewProduct.DataSource = productBLL.SearchProducts(search);
            gridViewProduct.DataBind();
        }
        
        protected void gridViewProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            productDTO.Id = Convert.ToInt32(gridViewProduct.DataKeys[e.RowIndex].Value.ToString());
            productBLL.Delete(productDTO);
            ShowGridViewProduct();
        }

        protected void gridViewProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridViewProduct.EditIndex = -1;
            ShowGridViewProduct();
        }

        protected void gridViewProduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridViewProduct.PageIndex = e.NewEditIndex;
            ShowGridViewProduct();
        }


        protected void gridViewProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            productDTO.Id = Convert.ToInt32(gridViewProduct.DataKeys[e.RowIndex].Value.ToString());
            productDTO.Name = e.NewValues[0].ToString();
            productDTO.Description = e.NewValues[1].ToString();
            productDTO.ProductValue = Convert.ToDouble(e.NewValues[2].ToString());

            FileUpload productPhoto = (FileUpload)gridViewProduct.Rows[e.RowIndex].FindControl("fileUpdPhoto");

            if (productPhoto.HasFile)
            {
                string photoLocation = Server.MapPath("~/IMG/Products/" + productPhoto.FileName);
                productPhoto.SaveAs(photoLocation);
                productDTO.Photo = productPhoto.FileName.ToString();
            }

            productDTO.StockQuantify = Convert.ToInt32(e.NewValues[3].ToString());

            productBLL.Update(productDTO);

            gridViewProduct.EditIndex = -1;
            ShowGridViewProduct();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("productRegister.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtProductSearch.Text != "")
            {
                ShowGridViewProduct();
            }
        }
    }
}