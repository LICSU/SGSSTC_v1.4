using Capa_Datos;
using Capa_Datos.Manager.Obligacion;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class View_Obligacion : System.Web.UI.Page
	{
		private Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;

		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			if (!IsPostBack)
			{
				CargarUsuario();
			}
		}

		private void CargarUsuario()
		{
			string valor = Request.QueryString["idO"];
			List<obligacion> ListaObligacion = new List<obligacion>();
			ListaObligacion = Mgr_Obligacion.Obligacion(Convert.ToInt32(objUtilidades.descifrarCadena(valor)));

			foreach (var item in ListaObligacion)
			{
				txtFechaEntrega.Text = Convert.ToDateTime(item.fecha_entrega).ToString("yyyy-MM-dd");
				txtResponsable.Text = item.usuario.login;
				txtCategoria.Text = item.categoria.nombre;
				txtPrioridad.Text = item.prioridad;
				txtFrecuencia.Text = item.frecuencia_control.nombre;
				txtDescripcion.Text = item.descripcion;
				txtAcciones.Text = item.acciones;
				txtEstatus.Text = item.estatus_obl;
				txtActividad.Text = item.plan_trabajo.nombre;
			}
		}
		
	}
}