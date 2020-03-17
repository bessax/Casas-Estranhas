using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CasasEstranhas
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["categoria"]))
            {
                lvCasasEmDestaque.DataSourceID = string.Empty;
                lvCasasEmDestaque.DataSource = sqldsCasasPorCategoria;
                div_casasemdestaque.Visible = false;
                div_casasporcategoria.Visible = true;

                SqlConnection conn = new SqlConnection(
                    sqldsCasasEmDestaque.ConnectionString);
                SqlCommand cmd = new SqlCommand(
                    "SELECT Descricao FROM Categoria WHERE IdCategoria = @id", conn);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["categoria"]);

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                h1_categoria.InnerText = "Casas da Categoria \"" +
                    rdr["Descricao"].ToString() + "\"";
                conn.Close();
            }
            else
            {
                lvCasasEmDestaque.DataSourceID = string.Empty;
                lvCasasEmDestaque.DataSource = sqldsCasasEmDestaque;
                div_casasemdestaque.Visible = true;
                div_casasporcategoria.Visible = false;
            }
        }
    }
}