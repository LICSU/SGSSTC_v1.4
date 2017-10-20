using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Capa_Datos.Manager.Riesgos;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class View_IdentificacionPeligros : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;
		private Utilidades objUtilidades = new Utilidades();

		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;

			if (!IsPostBack)
			{
				CargarDatos();
			}
		}

		private void CargarDatos()
		{
			int id_IdentificacionPeligro = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			List<identificacion_peligro> List_IdePel = new List<identificacion_peligro>();

			List_IdePel = Mgr_Riesgos.IdentificacionPeligro(id_IdentificacionPeligro);

			foreach (var item_IdePel in List_IdePel)
			{
				int contadorPuesto = 1;
				foreach (var item_IdePue in item_IdePel.identificacion_puesto)
				{
					txtEmpresa.Text = Convert.ToString(item_IdePue.puesto_trabajo.area.sucursal.empresa.nombre);


					txtPuestos.Text = txtPuestos.Text +
						"<strong>Puesto N°</strong>  " + contadorPuesto + "<br/>" +
						"<strong>Sucursal:</strong>  " + item_IdePue.puesto_trabajo.area.sucursal.nombre + "<br/>" +
						"<strong>Puesto de Trabajo:</strong>  " + item_IdePue.puesto_trabajo.nombre + "<br/>" +
						"<hr/>";
					contadorPuesto++;
				}

				int contadorFactor = 1;
				foreach (var item_fac_ide in item_IdePel.factor_identificacion)
				{
					txtPeligros.Text = txtPeligros.Text +
						"<strong>Identificacón de Peligro N°</strong>  " + contadorFactor + "<br/>" +
						"<strong>Tipo de Riesgo:</strong>  " + item_fac_ide.factor_riesgo.tipo_riesgo.nombre + "<br/>" +
						"<strong>Factor de Riesgo:</strong>  " + item_fac_ide.factor_riesgo.nombre + "<br/>" +
						"<strong>Posibles Efectos:</strong>  " + item_fac_ide.consecuencias + "<br/>" +
						"<strong>Tiempo de Exposición:</strong>  " + item_fac_ide.tiempo_exposicion + "<br/>" +
						"<hr/>";

					contadorFactor++;
				}

				txtMedidas.Text = item_IdePel.medidas_control_existentes;
				txtObservaciones.Text = item_IdePel.observaciones;
			}
		}

	}
}