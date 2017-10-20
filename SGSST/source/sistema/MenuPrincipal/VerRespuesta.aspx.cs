using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class VerRespuesta : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private  Utilidades objUtilidades = new Utilidades();
        private int IdRespuesta = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            IdRespuesta = objUtilidades.descifrarCadena(Request.QueryString["rs"]);
            List<usuario> ListUsuario = new List<usuario>();
            ListUsuario = Getter.Usuario(ObjUsuario.Id_usuario);
            string nomUsuario = string.Empty;
            foreach (var item in ListUsuario)
            {
                nomUsuario = item.login;
            }
            
            List<Respuesta> ListRespuesta = new List<Respuesta>();
            ListRespuesta = Getter.Respuesta(IdRespuesta);

            foreach (var item in ListRespuesta)
            {
                lbUsuario.Text = item.usuario;
                lbPregunta.Text = item.Pregunta.titulo;
                lbRespuesta.Text = item.cuerpo_respuesta;
                ddlCalificacion.SelectedIndex = Convert.ToInt32(item.calificacion);

                if (item.usuario.Equals(nomUsuario))
                {
                    phCalificar.Visible = true;
                }
                else
                {
                    phCalificar.Visible = false;
                }
            }
        }

        protected void CalificarRespuesta(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            Respuesta Edit = contexto.Respuesta.SingleOrDefault(b => b.id_respuesta == IdRespuesta);

            if (Edit != null)
            {
                Edit.calificacion = Convert.ToInt32(ddlCalificacion.SelectedValue);
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            TextBox txtBuscar = new TextBox();
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            CargarDatos();
        }

    }
}