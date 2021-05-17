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
            if(txtProductSearch.Text != "")
            {
                ShowGridViewProduct();
            }
        }
    }
}