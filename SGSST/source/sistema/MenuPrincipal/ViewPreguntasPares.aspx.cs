using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class ViewPreguntasPares : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                DateTime fechaActual = DateTime.Now;
                ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
                ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = Getter.CodigoCiiu_Empresa(ObjUsuario.Id_empresa);

            int act1 = 0, act2 = 0, act3 = 0, cont = 0;
            foreach (var item in consulta)
            {
                cont++;
                if (cont == 1) { act1 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 2) { act2 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 3) { act3 = Convert.ToInt32(item.id_clase_ciiu); }
            }


            Tabla.SusPreguntas(GridView1, act1, act2, act3, string.Empty + ViewState["FechaInicio"], string.Empty + ViewState["FechaFin"]);
        }

        //Agrega una respuesta a una pregunta
        protected void ResponderPregunta(object sender, EventArgs e)
        {
            int idPregunta = Convert.ToInt32(hdfResponderPregunta.Value);
            string nomUsuario = string.Empty;

            List<Pregunta> consulta = new List<Pregunta>();
            GrupoLiEntities contexto = new GrupoLiEntities();

            var consultaLista = (
                from PR in contexto.Pregunta
                where PR.id_pregunta == idPregunta
                select new
                {
                    nombreUsuario = PR.usuario.login
                }).ToList();

            foreach (var item in consultaLista)
            {
                nomUsuario = item.nombreUsuario;
            }

            String[] valores = {
                CKRespuesta.Text,
                nomUsuario,
                Convert.ToString(idPregunta)
                };

            ObjUsuario.Error = CRUD.Add_Respuesta(ObjUsuario, valores);

            Modal.CerrarModal("RespuestaModal", "RespuestaModalScript", this);

            LlenarGridView();
        }

        #region acciones grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("VerPre"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfPreguntaID.Value = (gvrow.FindControl("id_pregunta") as Label).Text;

                List<Pregunta> ListaPregunta = new List<Pregunta>();
                ListaPregunta = Getter.Pregunta(Convert.ToInt32(hdfPreguntaID.Value));

                foreach (var item in ListaPregunta)
                {
                    lbTitulo.Text = item.titulo;
                    lbPregunta.Text = item.cuerpo_pregunta;
                    txtViewFecha.Text = Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd");
                }

                Modal.registrarModal("viewModal", "viewModalScript", this);
            }
            else if (e.CommandName.Equals("Responder"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfResponderPregunta.Value = (gvrow.FindControl("id_pregunta") as Label).Text;

                int idPregunta = Convert.ToInt32(hdfResponderPregunta.Value);

                List<Pregunta> consulta = new List<Pregunta>();
                GrupoLiEntities contexto = new GrupoLiEntities();

                var consultaLista = (
                    from PR in contexto.Pregunta
                    where PR.id_pregunta == idPregunta
                    select new
                    {
                        PR.id_pregunta,
                        PR.titulo,
                        PR.cuerpo_pregunta,
                        PR.id_usuario,
                        PR.fecha,
                        TotalRespuestas = PR.Respuesta.Count
                    }).ToList();

                foreach (var item in consultaLista)
                {
                    lbTituloPregunta_Responder.Text = item.titulo;
                    lbPregunta_Responder.Text = item.cuerpo_pregunta;
                }

                Modal.registrarModal("RespuestaModal", "RespuestaModalScript", this);
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        #endregion

        protected void txtFechaInicio_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaInicio.Text != string.Empty)
            {
                ViewState["FechaInicio"] = txtFechaInicio.Text;
            }
            else
            {
                ViewState["FechaInicio"] = "";
            }
            LlenarGridView();
        }
        protected void txtFechaFin_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaFin.Text != string.Empty)
            {
                ViewState["FechaFin"] = txtFechaFin.Text;
            }
            else
            {
                ViewState["FechaFin"] = "";
            }
            LlenarGridView();
        }
    }
}