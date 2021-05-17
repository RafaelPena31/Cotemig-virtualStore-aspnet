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
    public partial class searchProvider : System.Web.UI.Page
    {
        ProviderDTO providerDTO = new ProviderDTO();
        ProviderBLL providerBLL = new ProviderBLL();
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
            if (!Page.IsPostBack)
            {
                ProviderGrid.DataBind();
            }
        }
        protected void TxtSearchBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSearchProvider_Click(object sender, EventArgs e)
        {
            GridViewLoadDataBySearch();
        }
    }
}