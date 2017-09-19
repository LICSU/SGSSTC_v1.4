using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class View_GestionLaboral : System.Web.UI.Page
	{
		private  Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private int idGestion = 0;

		#region acciones index
		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			idGestion = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			CargarGestion();
		}

		private void CargarGestion()
		{
			List<gestion_laboral> ListaGestionLaboral = new List<gestion_laboral>();
			ListaGestionLaboral = Getter.GestionLaboral(Convert.ToInt32(idGestion));

			foreach (var itemGestionLaboral in ListaGestionLaboral)
			{
				int ContadorTrabajadores = 0;

				#region 1erbloque consulta
				lbEmpresa.Text = Convert.ToString(itemGestionLaboral.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre);

				lbFecha.Text = Convert.ToString(itemGestionLaboral.fecha);

				lbDesc.Text = itemGestionLaboral.descripcion;

				if (itemGestionLaboral.tipo_gestion == 2)
				{
					phCapacitacion.Visible = true;
				}

				lbHoras.Text = Convert.ToString(itemGestionLaboral.cant_horas);

				lbResponsable.Text = Convert.ToString(itemGestionLaboral.usuario.login);

				hpSoporte.NavigateUrl = itemGestionLaboral.soporte;

				#endregion

				#region 2do bloque consulta
				List<trabajador_gestion> ListaTrabajadorGestion = Getter.TrabajadorInGestion(0, Convert.ToInt32(idGestion));

				ControlesDinamicos.CrearLiteral("<div class='row'>", pListaTrab);
				foreach (var item in ListaTrabajadorGestion)
				{
					string ruta = item.trabajador.foto;
					ruta = ruta.Replace("~/source", "../..");

					ContadorTrabajadores++;
					ControlesDinamicos.CrearLiteral("" +
					   "<div class='col-md-2'>" +
					   "<img class='img-circle' src='" + ruta + "' width='128' height='128'/>" +
						   "<h4 class='text-info text-left'>Trabajador " + ContadorTrabajadores + "</h4>" +
						   "<div class='col-md-12 text'>" +
							   "<h4>Nombre: </h4>" +
						   "</div>" +
						   "<div class='col-md-10 text'>" +
							   "" + item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido + "" +
						   "</div>" +
					   "</div>", pListaTrab);
				}
				ControlesDinamicos.CrearLiteral("</div>", pListaTrab);
				#endregion
			}

		}		
		#endregion
	}
}