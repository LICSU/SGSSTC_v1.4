using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class ViewMisPreguntas : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private  Utilidades objUtilidades = new Utilidades();
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones

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

            Tabla.MisPreguntas(GridView1, ObjUsuario.Id_usuario, string.Empty + ViewState["FechaInicio"], string.Empty + ViewState["FechaFin"]);
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idPregunta = Convert.ToInt32(hdfPreguntaEdit.Value);

            Pregunta Edit = contexto.Pregunta.SingleOrDefault(b => b.id_pregunta == idPregunta);
            if (Edit != null)
            {
                Edit.fecha = Convert.ToDateTime(txtFechaEdit.Text);
                Edit.titulo = txtTituloEdit.Text;
                Edit.cuerpo_pregunta = txtPreguntaEdit.Text;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFechaInicio);
            LlenarGridView();

        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            Pregunta tabla = new Pregunta();

            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfPreguntaIDDel.Value));

            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFechaInicio);
            LlenarGridView();
        }

        #endregion

        #region acciones grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfPreguntaEdit.Value = (gvrow.FindControl("id_pregunta") as Label).Text;

                List<Pregunta> ListaPregunta = new List<Pregunta>();
                ListaPregunta = Getter.Pregunta(Convert.ToInt32(hdfPreguntaEdit.Value));

                foreach (var item in ListaPregunta)
                {
                    txtTituloEdit.Text = item.titulo;
                    txtPreguntaEdit.Text = item.cuerpo_pregunta;
                    txtFechaEdit.Text = Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd");
                }

                Modal.registrarModal("editModal", "EditModalScript", this);
            }
            else if (e.CommandName.Equals("VerPre"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfVerPregunta.Value = (gvrow.FindControl("id_pregunta") as Label).Text;

                List<Pregunta> ListaPregunta = new List<Pregunta>();
                ListaPregunta = Getter.Pregunta(Convert.ToInt32(hdfVerPregunta.Value));

                foreach (var item in ListaPregunta)
                {
                    txtViewTitulo.Text = item.titulo;
                    txtViewPregunta.Text = item.cuerpo_pregunta;
                    txtViewFecha.Text = Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd");
                }

                Modal.registrarModal("viewModal", "viewModalScript", this);
            }
            else if (e.CommandName.Equals("VerRes"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfRespuestas.Value = (gvrow.FindControl("id_pregunta") as Label).Text;
                int idPregunta = Convert.ToInt32(hdfRespuestas.Value);

                List<Respuesta> consulta = new List<Respuesta>();

                GrupoLiEntities contexto = new GrupoLiEntities();
                consulta = contexto.Respuesta.Where(x => x.id_pregunta == idPregunta).OrderByDescending(x => x.calificacion).ToList();

                string Calificacion = string.Empty;

                foreach (var item in consulta)
                {
                    Calificacion = item.calificacion == 0 ? "Sin Calificar" :
                                    item.calificacion == 1 ? "Mala" :
                                    item.calificacion == 2 ? "Buena" :
                                    item.calificacion == 3 ? "Regular" : "Excelente";

                    string _Respuesta = item.usuario;
                    _Respuesta = _Respuesta.Length > 50 ? item.usuario.Substring(0, 47) + "..." : item.usuario;

                    ControlesDinamicos.CrearLiteral("<tr><td class='text-left'>", pVerRespuestas);

                    string idRespuesta = objUtilidades.cifrarCadena(Convert.ToString(item.id_respuesta));

                    ControlesDinamicos.CrearHyperLink("lk_VerRespuesta_" + item.id_respuesta, pVerRespuestas, "VerRespuesta.aspx?rs=" + idRespuesta, _Respuesta);

                    ControlesDinamicos.CrearLiteral("</td><td>" + Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd") + "</td>", pVerRespuestas);

                    ControlesDinamicos.CrearLiteral("<td class='text-center'>" + Calificacion + "</td></tr>", pVerRespuestas);
                }

                Modal.registrarModal("viewRespuestasModal", "viewRespuestasModalScript", this);
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfPreguntaIDDel.Value = (gvrow.FindControl("id_pregunta") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        #endregion

        #region filtros

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
        #endregion
    }
}