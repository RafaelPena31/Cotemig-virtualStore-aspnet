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
            if (Session["UserEmail"] == null || Session["UserId"] == null || Session["UserType"] == null || Session["UserEmail"].ToString().Length == 0 || Session["UserId"].ToString().Length == 0 ||
                Session["UserType"].ToString().Length == 0)
            {
                Response.Redirect("index.aspx");
            }
            if (Session["UserType"].ToString() != "admin")
            {
                Response.Redirect("index.aspx");
            }
            if (!Page.IsPostBack)
            {
                ShowGridViewProduct();
            }
        }

        public void ShowGridViewProduct()
        {
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
            string defaultCategory = productBLL.ConsultId(Convert.ToInt32(gridViewProduct.DataKeys[e.RowIndex].Value.ToString())).Rows[0]["category_id"].ToString();
            string defaultProvider = productBLL.ConsultId(Convert.ToInt32(gridViewProduct.DataKeys[e.RowIndex].Value.ToString())).Rows[0]["provider_id"].ToString();
            productDTO.Id = Convert.ToInt32(gridViewProduct.DataKeys[e.RowIndex].Value.ToString());
            productDTO.Name = e.NewValues[0].ToString();
            productDTO.Description = e.NewValues[1].ToString();
            productDTO.ProductValue = Convert.ToDouble(e.NewValues[2].ToString());
            productDTO.CategoryID = int.Parse(defaultCategory);
            productDTO.ProviderID = int.Parse(defaultProvider);

            FileUpload productPhoto = (FileUpload)gridViewProduct.Rows[e.RowIndex].FindControl("fileUpPhoto");

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