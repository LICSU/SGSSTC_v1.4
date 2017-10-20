using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Create_IdentificacionPeligro : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;

		#region acciones index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			if (!IsPostBack)
			{
				ViewState["peligros"] = "1";
				ViewState["puestos"] = "1";
				CargarListas();
			}
		}
		private void CargarListas()
		{
			if (BoolEmpSuc.Item1)
			{
				Mgr_Empresa.Lista_Empresa(ddlEmpresa);
			}
			else
			{
				Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
			}

			if (!BoolEmpSuc.Item2)
			{
				Mgr_PuestoTrabajo.PuestoTrabajo(ddlPuestos, "Sucursal", ObjUsuario.Id_sucursal);
			}

			Listas.Riesgos(ddlTipoRiesgo1, "TipoRiesgo");
		}
		#endregion

		#region acciones
		protected void btPrintSave_Click(object sender, EventArgs e)
		{
			string[] puestos = txtPuestos.Text.Split('\n');
			string[] factores = txtPeligros.Text.Split('\n');

			int IdSucursal = 0;
			int IdFactor = 0;
			int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresa);
			string PosibleConsecuencia = string.Empty;

			List<int> Lista_IdPuestos = new List<int>();
			List<Tuple<int, string, string>> IdFactor_Consecuencia = new List<Tuple<int, string, string>>();

			List<sucursal> ListaSucursal;
			List<puesto_trabajo> ListaPuesto;
			List<factor_riesgo> ListaFactorRiesgo;

			for (int i = 0; i < puestos.Length; i++)
			{
				if (puestos[i].Contains("Sucursal:"))
				{
					ListaSucursal = new List<sucursal>();
					ListaSucursal = Mgr_Sucursal.Sucursal(0, IdEmpresa, puestos[i].Replace("Sucursal:", ""));

					foreach (var item in ListaSucursal)
					{
						IdSucursal = item.id_sucursal;
					}
				}

				if (puestos[i].Contains("Puesto de Trabajo:"))
				{
					ListaPuesto = new List<puesto_trabajo>();
					ListaPuesto = Getter.PuestoTrabajo_Nom_Suc(puestos[i].Replace("Puesto de Trabajo:", ""), IdSucursal);

					foreach (var item in ListaPuesto)
					{
						Lista_IdPuestos.Add(item.id_puesto_trabajo);
					}

				}
			}
			for (int i = 0; i < factores.Length; i++)
			{

				if (factores[i].Contains("Factor de Riesgo:"))
				{
					ListaFactorRiesgo = new List<factor_riesgo>();
					ListaFactorRiesgo = Getter.FactorRiesgo(0, factores[i].Replace("Factor de Riesgo:", ""));

					foreach (var item in ListaFactorRiesgo)
					{
						IdFactor = item.id_factor_riesgo;
					}
				}
				if (factores[i].Contains("Posibles Efectos:"))
				{
					PosibleConsecuencia = factores[i].Replace("Posibles Efectos:", "");
				}
				if (factores[i].Contains("Tiempo de Exposición:"))
				{
					IdFactor_Consecuencia.Add(Tuple.Create(IdFactor, PosibleConsecuencia, factores[i].Replace("Tiempo de Exposición:", "")));
				}
			}

			identificacion_peligro nuevoIdentificacionPeligro = new identificacion_peligro()
			{
				medidas_control_existentes = txtMedidas.Text,
				observaciones = txtObservaciones.Text,
				fecha_identificacion = DateTime.Now
			};

			ObjUsuario.Error = CRUD.Add_Fila(nuevoIdentificacionPeligro);

			if (ObjUsuario.Error)
			{
				int idIdentificacionRiesgo = GetterMax.IdentificacionPeligro();

				foreach (var IdPuestos in Lista_IdPuestos)
				{
					identificacion_puesto nuevoIdentificacionPuesto = new identificacion_puesto()
					{
						id_identificacion = idIdentificacionRiesgo,
						id_puesto = IdPuestos
					};
					ObjUsuario.Error = CRUD.Add_Fila(nuevoIdentificacionPuesto);
				}

				foreach (Tuple<int, string, string> item in IdFactor_Consecuencia)
				{
					factor_identificacion nuevoFactorIdentificacion = new factor_identificacion()
					{
						id_factor = item.Item1,
						id_identificacion = idIdentificacionRiesgo,
						consecuencias = item.Item2,
						tiempo_exposicion = item.Item3
					};
					ObjUsuario.Error = CRUD.Add_Fila(nuevoFactorIdentificacion);
				}

			}
			Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtPuestos);
		}
		protected void AddPeligro_Click(object sender, EventArgs e)
		{
			int contadorPeligros = Convert.ToInt32(string.Empty + ViewState["peligros"]);

			txtPeligros.Text = txtPeligros.Text +
				"Identificacón de Peligro N°" + contadorPeligros + "\n" +
				"Tipo de Riesgo:" + ddlTipoRiesgo1.SelectedItem + "\n" +
				"Factor de Riesgo:" + ddlFactorRiesgo1.SelectedItem + "\n" +
				"Posibles Efectos:" + txtconsecuencias1.Text + "\n" +
				"Tiempo de Exposición:" + txtTiempoExposicion.Text + "\n" +
				"-----------------------------------------------------------\n";

			txtPeligros.Rows = txtPeligros.Rows + 4;
			contadorPeligros++;
			ViewState["peligros"] = string.Empty + Convert.ToString(contadorPeligros);
		}
		protected void AddPuesto_Click(object sender, EventArgs e)
		{
			int contadorPuestos = Convert.ToInt32(string.Empty + ViewState["puestos"]);

			txtPuestos.Text = txtPuestos.Text +
				"Puesto N°" + contadorPuestos + "\n" +
				"Sucursal:" + ddlSucursal.SelectedItem + "\n" +
				"Puesto de Trabajo:" + ddlPuestos.SelectedItem + "\n" +
				"-----------------------------------------------------------\n";

			ddlPuestos.Items.RemoveAt(ddlPuestos.SelectedIndex);
			txtPuestos.Rows = txtPuestos.Rows + 3;
			contadorPuestos++;
			ViewState["puestos"] = string.Empty + Convert.ToString(contadorPuestos);
		}
		#endregion

		#region eventos
		protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlEmpresa.SelectedValue != string.Empty)
			{
				Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
				Listas.Riesgos(ddlTipoRiesgo1, "TipoRiesgo");
			}
		}
		protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlSucursal.SelectedValue != string.Empty)
			{
				Mgr_PuestoTrabajo.PuestoTrabajo(ddlPuestos, "Sucursal", Convert.ToInt32(ddlSucursal.SelectedValue));
			}
		}
		protected void ddlTipoRiesgo_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (BoolEmpSuc.Item1)
			{
				Listas.Riesgos(ddlFactorRiesgo1, "FactorRiesgo", ddlTipoRiesgo1.SelectedValue);
			}
			else
			{
				Listas.Riesgos(ddlFactorRiesgo1, "FactorRiesgo", ddlTipoRiesgo1.SelectedValue);
			}

		}
		protected void btnReset_Click(object sender, EventArgs e)
		{
			txtPeligros.Text = string.Empty;
			txtPeligros.Rows = 4;
		}
		protected void btnResetPuestos_Click(object sender, EventArgs e)
		{
			txtPuestos.Text = string.Empty;
			txtPuestos.Rows = 3;
		}
		#endregion

	}
}