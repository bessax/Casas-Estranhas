using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasasEstranhas
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvCategorias_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            ((Principal)this.Master).AtualizarCategorias();
        }
    }
}
