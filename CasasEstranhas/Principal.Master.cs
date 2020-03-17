using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasasEstranhas
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //este evento ocorre a cada item renderizado pelo ListView lvCategorias
        protected void lvCategorias_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //captura o ListView que está dentro do ItemTemplate
            ListView lvCasas = (ListView)e.Item.FindControl("lvCasas");
            //captura o campo oculto que contém o IdCategoria que está
            //sendo renderizado no momento
            string idCategoria = ((HiddenField)e.Item.FindControl("hdfIdCategoria")).Value;
            //preenche o parâmetro do DataSource com o IdCategoria capturado
            sqldsCasasPorCategoria.SelectParameters["IdCategoria"].DefaultValue = idCategoria;
            //associa o DataSource parametrizado ao ListView lvCasas
            lvCasas.DataSource = sqldsCasasPorCategoria.Select(DataSourceSelectArguments.Empty);
            lvCasas.DataBind();
        }

        public void AtualizarCategorias()
        {
            lvCategorias.DataBind();
        }
    }
}