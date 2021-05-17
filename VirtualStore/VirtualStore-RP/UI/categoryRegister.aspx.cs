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
    public partial class categoryRegister : System.Web.UI.Page
    {
        CategoryBLL categoryBLL = new CategoryBLL();
        CategoryDTO categoryDTO = new CategoryDTO();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ClearFields()
        {
            txtName.Text = "";
            txtDescription.Text = "";
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void register_Click(object sender, EventArgs e)
        {
            try
            {
                categoryDTO.Name = txtName.Text;
                categoryDTO.Description = txtDescription.Text;

                categoryBLL.Insert(categoryDTO);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Categoria registrado com sucesso!!!')", true);
                ClearFields();

            }
            catch (Exception ex)
            {
                msgErro.Visible = true;
                msgErro.Text = ex.Message;
            }
        }
    }
}