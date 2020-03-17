using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasasEstranhas.admin
{
    public partial class FormCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                fvCategoria.DefaultMode = FormViewMode.Insert;
            }
        }

        protected void fvCategoria_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName=="Cancel")
            {
                Response.Redirect("~/admin/Admin.aspx");
            }
        }

        protected void fvCategoria_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/admin/Admin.aspx");
        }

        protected void fvCategoria_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("~/admin/Admin.aspx");
        }
    }
}