using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasasEstranhas.admin
{
    public partial class FormCasa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                dvCasa.DefaultMode = FormViewMode.Insert;
            }
        }

        protected void dvCasa_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName=="Cancel")
            {
                Response.Redirect("~/admin/Admin.aspx");
            }
        }

        protected void dvCasa_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("~/admin/Admin.aspx");
        }

        protected void dvCasa_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            Response.Redirect("~/admin/Admin.aspx");
        }
    }
}