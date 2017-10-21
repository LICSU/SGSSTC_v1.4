using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.CodigoCiiu;
using Capa_Datos.Manager.Comunicacion;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class ViewPreguntasPares : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                DateTime fechaActual = DateTime.Now;
                ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
                ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

                ViewState["Rol"] = "0";
                ViewState["Clase"] = "0";
                ViewState["Division"] = "0";
                ViewState["Seccion"] = "0";

                CargarListas();
                LlenarGridView();
            }
        }

        private void CargarListas()
        {
            if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdm_Grupoli())
            {
                Capa_Datos.Manager.Usuario.Mgr_Usuario.Lista_Rol(ddlRol);
            }
            else
            {
                Capa_Datos.Manager.Usuario.Mgr_Usuario.Lista_Rol(ddlRol, ObjUsuario.Rol);
            }


            Mgr_CodigoCiiu.List_Codciiu_Usuario(ddlClase, ObjUsuario.Id_empresa);
            Mgr_CodigoCiiu.List_Division_Usuario(ddlDivision, ObjUsuario.Id_empresa);
            Mgr_CodigoCiiu.List_Seccion_Usuario(ddlSeccion, ObjUsuario.Id_empresa);
        }

        private void LlenarGridView()
        {
            Mgr_Comunicacion.Grid_SusPreguntas(GridView1,
                ObjUsuario.Id_empresa,
                string.Empty + ViewState["FechaInicio"],
                string.Empty + ViewState["FechaFin"],
                Convert.ToInt32(string.Empty + ViewState["Rol"]),
                Convert.ToInt32(string.Empty + ViewState["Clase"]),
                Convert.ToInt32(string.Empty + ViewState["Division"]),
                Convert.ToInt32(string.Empty + ViewState["Seccion"])
                );
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

            ObjUsuario.Error = Mgr_Comunicacion.Add_Respuesta(valores);

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
                ListaPregunta = Mgr_Comunicacion.Get_Pregunta(Convert.ToInt32(hdfPreguntaID.Value));

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

        protected void ddlRol_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRol.SelectedValue != string.Empty)
            {
                ViewState["Rol"] = ddlRol.SelectedValue;
            }
            else
            {
                ViewState["Rol"] = "0";
            }
            LlenarGridView();
        }

        protected void ddlClase_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlClase.SelectedValue != string.Empty)
            {
                ViewState["Clase"] = ddlClase.SelectedValue;
            }
            else
            {
                ViewState["Clase"] = "0";
            }
            LlenarGridView();
        }

        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDivision.SelectedValue != string.Empty)
            {
                ViewState["Division"] = ddlDivision.SelectedValue;
            }
            else
            {
                ViewState["Division"] = "0";
            }
            LlenarGridView();
        }

        protected void ddlSeccion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSeccion.SelectedValue != string.Empty)
            {
                ViewState["Seccion"] = ddlSeccion.SelectedValue;
            }
            else
            {
                ViewState["Seccion"] = "0";
            }
            LlenarGridView();
        }
        #endregion

    }
}