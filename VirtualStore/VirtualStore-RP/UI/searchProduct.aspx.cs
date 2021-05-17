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
    public partial class searchProduct : System.Web.UI.Page
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
            ShowGridViewProduct();
        }

        public void ShowGridViewProduct()
        {
            string search = "pt.name like '%" + txtProductSearch.Text + "%'";
            gridViewProduct.DataSource = productBLL.SearchProducts(search);
            gridViewProduct.DataBind();
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