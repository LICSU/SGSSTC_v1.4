using Capa_Datos;
using Capa_Datos.Manager.Acc_Inc;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
	public partial class View_Incidente : Page
	{
		private  Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private int idAccidente;

		#region acciones index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			idAccidente = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			CargarData();
		}

		private void CargarData()
		{
			idAccidente = objUtilidades.descifrarCadena(Request.QueryString["id"]);
			List<at_it_el_pa> ListAccidentes = new List<at_it_el_pa>();
			ListAccidentes = Mgr_Acc_Inc.Accidente(idAccidente);

			foreach (var item in ListAccidentes)
			{
				lbSucursal.Text = item.trabajador.puesto_trabajo.area.sucursal.nombre;
				lbEmpresa.Text = item.trabajador.puesto_trabajo.area.sucursal.empresa.nombre;
				txtFechaAcc.Text = item.fecha_accidente.Value.ToString("yyyy-MM-dd");
				txtHoraAcc.Text = item.hora_accidente.Value.ToString("hh:mm:ss");
				lbTrabajador.Text = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;

				if (item.id_area == 0)
				{
					lbArea.Text = "Ninguno";
				}
				else
				{
					lbArea.Text = item.area.nombre;
				}

				if (item.id_puesto == 0)
				{
					lbPuestoTrabajo.Text = "Ninguno";
				}
				else
				{
					lbPuestoTrabajo.Text = item.puesto_trabajo.nombre;
				}

				txtSitioIncidente.Text = item.sitio;
				txtDescTarea.Text = item.descripcion;
				txtCondIns.Text = item.condiciones_inseguras;
				txtActos.Text = item.actos_inseguros;
				txtFacTrab.Text = item.factores_inseguros;
				txtFactPersonales.Text = item.factores_personales;


				txtDiasIncapacidad.Text = Convert.ToString(item.dias_incapacidad);
				txtDiasCargados.Text = Convert.ToString(item.dias_cargados);
				txtDiasPerdidosAusTrab.Text = Convert.ToString(item.dias_perdidos_ausencia);
				txtDiasPerdidosctRest.Text = Convert.ToString(item.dias_perdidos_restingido);

				if (Convert.ToString(item.tipo_enfermedad) == "A") { lbTipoEnfermedad.Text = "Enfermedades en la piel"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "B") { lbTipoEnfermedad.Text = "Enfermedades respiratorias"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "C") { lbTipoEnfermedad.Text = "Envenenamiento"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "D") { lbTipoEnfermedad.Text = "Enfermedades debidas a agentes físicos"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "E") { lbTipoEnfermedad.Text = "Enfermedades producidas por traumas repetitivos"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "F") { lbTipoEnfermedad.Text = "Otras enfermedades osteomusculares"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "G") { lbTipoEnfermedad.Text = "Demás enfermedades profesionales"; }

				if (Convert.ToString(item.dias_no_perdidos) == "true")
				{
					chkSinDias.Text = "Si";
				}
				else
				{
					chkSinDias.Text = "No";
				}

				int contadorArchivos = 0;
				ControlesDinamicos.CrearLiteral("<ul>", pSoportes);

				HyperLink HyperLink1;
				foreach (var item1 in item.soporte)
				{
					contadorArchivos++;
					ControlesDinamicos.CrearLiteral("<li>", pSoportes);
					HyperLink1 = new HyperLink();
					HyperLink1.NavigateUrl = item1.url;
					HyperLink1.Target = "_blank";
					HyperLink1.Text = "Archivo " + contadorArchivos;
					pSoportes.Controls.Add(HyperLink1);
					ControlesDinamicos.CrearLiteral("</ li >", pSoportes);
				}
				ControlesDinamicos.CrearLiteral("</ ul > ", pSoportes);
			}

		}		
		#endregion
	}
}