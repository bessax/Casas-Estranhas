using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CasasEstranhas
{
    public partial class EfetuarLance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Código para evitar q a atualização da página incremente indefinidamente a quantidade de visitas
                if (Session["visitadas"] != null)
                { 
                    List<int> casas = (List<int>)Session["visitadas"];
                    int idCasaAtual = Convert.ToInt32(Request.QueryString["id"]);
                    if (casas.Contains(idCasaAtual))
                    {
                        //Se a casa já foi visitada por esse usuario
                        // durante esta seção, abandona o resto da execução do método.
                        return;
                    }
                     else
                    {
                        // registra a visita do usuário à casa atual
                        casas.Add(idCasaAtual);
                    }
                }
                else
                {
                    //cria a variavel para guardar as casas visitadas,
                    //já inserindo a casa atual como visita
                    List<int> casas = new List<int>();
                    int idCasaAtual = Convert.ToInt32(Request.QueryString["id"]);
                    casas.Add(idCasaAtual);
                    Session["visitadas"] = casas;
                }
               
                        
                SqlConnection conn = new SqlConnection(
                    sqldsDetalhesCasa.ConnectionString);
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Casa SET visitas = visitas + 1 WHERE idcasa = @idcasa", conn);
                cmd.Parameters.AddWithValue("@idcasa", Request.QueryString["id"]);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void btnEfetuarLance_Click(object sender, EventArgs e)
        {
            string nome = txtNome.Text;
            decimal lance = Convert.ToDecimal(txtLance.Text);
            decimal maior_lance =
                Convert.ToDecimal(((HiddenField)fvDetalhesCasa.
                FindControl("hdfMaiorLance")).Value);

            if (lance > maior_lance)
            {
                SqlConnection conn =
                    new SqlConnection(sqldsDetalhesCasa.ConnectionString);
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Casa SET maiorlance = @maiorlance, " +
                    "executorlance = @executorlance, " +
                    "datalance = @datalance WHERE (idcasa = @idcasa);" +
                    "UPDATE Casa SET ofertas = ofertas + 1 WHERE (idcasa = @idcasa)",
                    conn);

                cmd.Parameters.AddWithValue("@maiorlance", lance);
                cmd.Parameters.AddWithValue("@executorlance", nome);
                cmd.Parameters.AddWithValue("@datalance", DateTime.Now);
                cmd.Parameters.AddWithValue("@idcasa", Request.QueryString["id"]);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                fvDetalhesCasa.DataBind();
                txtLance.Text = "";
                txtNome.Text = "";
            }
            else
            {
                this.ClientScript.RegisterClientScriptBlock(typeof(Page), "erro",
                    "setTimeout(\"alert('O valor de seu lance " +
                    "deve superar o valor do maior lance atual.');\", 100);", true);
            }
        }
    }
}