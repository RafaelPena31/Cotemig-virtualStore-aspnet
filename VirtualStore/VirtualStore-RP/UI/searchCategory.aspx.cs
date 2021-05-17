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
    public partial class searchCategory : System.Web.UI.Page
    {
        CategoryBLL categoryBLL = new CategoryBLL();
        CategoryDTO categoryDTO = new CategoryDTO();

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowGridViewCategory();
        }

        public void ShowGridViewCategory()
        {
            string search = "c.nameCat like '%" + txtCategorySearch.Text + "%'";
            gridViewCategory.DataSource = categoryBLL.SearchCategory(search);
            if (!Page.IsPostBack)
            {
                gridViewCategory.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(txtCategorySearch.Text != "")
            {
                ShowGridViewCategory();
            }
        }
    }
}