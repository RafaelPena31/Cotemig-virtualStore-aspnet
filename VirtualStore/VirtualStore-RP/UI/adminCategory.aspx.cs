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
    public partial class adminCategory : System.Web.UI.Page
    {
        CategoryBLL categoryBLL = new CategoryBLL();
        CategoryDTO categoryDTO = new CategoryDTO();

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
                ShowGridViewCategory();
            }
        }

        public void ShowGridViewCategory()
        {
            string search = "c.nameCat like '%" + txtCategorySearch.Text + "%'";
            gridViewCategory.DataSource = categoryBLL.SearchCategory(search);
            gridViewCategory.DataBind();
        }

        protected void gridViewCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            categoryDTO.Id = Convert.ToInt32(gridViewCategory.DataKeys[e.RowIndex].Value.ToString());
            categoryBLL.Delete(categoryDTO);
            ShowGridViewCategory();
        }

        protected void gridViewCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridViewCategory.EditIndex = -1;
            ShowGridViewCategory();
        }

        protected void gridViewCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridViewCategory.PageIndex = e.NewEditIndex;
            ShowGridViewCategory();
        }

        protected void gridViewCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            categoryDTO.Id = Convert.ToInt32(gridViewCategory.DataKeys[e.RowIndex].Value.ToString());
            categoryDTO.Name = e.NewValues[0].ToString();
            categoryDTO.Description = e.NewValues[1].ToString();

            categoryBLL.Update(categoryDTO);

            gridViewCategory.EditIndex = -1;
            ShowGridViewCategory();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtCategorySearch.Text != "")
            {
                ShowGridViewCategory();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("categoryRegister.aspx");
        }
    }
}