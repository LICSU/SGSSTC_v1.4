using Capa_Datos;
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
	public partial class Create_EvaluacionRiesgos : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;
		private  Utilidades objUtilidades = new Utilidades();

		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
			phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			if (!IsPostBack)
			{
				CargarDatos();
			}
		}

		private void CargarDatos()
		{
			int id_Ide_Puesto;
			id_Ide_Puesto = objUtilidades.descifrarCadena(Request.QueryString["id"]);
			List<identificacion_puesto> Lista_Ide_Puesto = new List<identificacion_puesto>();
			Lista_Ide_Puesto = Getter.IdentificacionPuesto(id_Ide_Puesto);

			foreach (var item in Lista_Ide_Puesto)
			{
				txtSucursal.Text = item.puesto_trabajo.area.sucursal.nombre;
				txtPuestos.Text = item.puesto_trabajo.nombre;
				txtArea.Text = item.puesto_trabajo.area.nombre;
				txtDescripcionPuesto.Text = item.puesto_trabajo.descripcion;

				foreach (var itemFactor in item.identificacion_peligro.factor_identificacion)
				{
					txtTipoRiesgo.Text = itemFactor.factor_riesgo.tipo_riesgo.nombre;
					txtFactorRiesgo.Text = itemFactor.factor_riesgo.nombre;
					txtConsecuencias.Text = itemFactor.consecuencias;
					txtTiempoExposicion.Text = itemFactor.tiempo_exposicion;
				}

				int contadorEpp = 1;
				foreach (var itemEpp in item.puesto_trabajo.puesto_trabajo_epp)
				{
					txtEpp.Text = txtEpp.Text +
						"<div class='col-md-4'>" +
						"<strong>Epp N°</strong>  " + contadorEpp + "<br/>" +
						"<strong>Nombre:</strong>  " + itemEpp.epp.nombre + "<br/>" +
						"<strong>Tipo de Epp:</strong>  " + itemEpp.epp.tipo_epp.nombre +
						"</div>";
					contadorEpp++;
				}

			}
		}

		protected void btPrintSave_Click(object sender, EventArgs e)
		{
			GrupoLiEntities contexto = new GrupoLiEntities();
			int id_ide_puesto = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			evaluacion_riesgo nuevoEvaRiesgo = new evaluacion_riesgo()
			{
				id_ide_puesto = id_ide_puesto,
				control_fuente = txtControlFuente.Text,
				control_medio = txtControlMedio.Text,
				control_individuo = txtControlIndividuo.Text,
				fecha_evaluacion = Convert.ToDateTime(txtFechaEvaluacion.Text),
				nombre_responsable = txtResponsableSGSST.Text,
				estatus_med_fue = "0",
				estatus_med_amb = "0",
				estatus_med_trab = "0",
				porc_estatus = 0,
				nivel_deficiencia = ddlNivelDeficiencia.SelectedValue,
				interpretacion_deficiencia = txtInterpretacionNivelDeficiencia.Text,
				nivel_exposicion = ddlNivelExposicion.SelectedValue,
				interpretacion_exposicion = txtInterpretacionNivelExposicion.Text,
				nivel_probabilidad = txtNivelProbabilidad.Text,
				interpretacion_probabilidad = txtInterpretacionNivelProbabilidad.Text,
				nivel_consecuencia = ddlNivelConsecuencia.SelectedValue,
				nivel_riesgo = txtNivelRiesgo.Text,
				interpretacion_nivel_riesgo = txtInterpretacionNivelRiesgo.Text,
				aceptabilidad_riesgo = txtAceptabilidadRiesgo.Text,
				planta = Convert.ToInt32(txtPlanta.Text),
				contratistas = txtContratistas.Text == string.Empty ? 0: Convert.ToInt32(txtContratistas.Text),
				visitantes = txtVisitantes.Text == string.Empty ? 0 : Convert.ToInt32(txtVisitantes.Text),
				total = Convert.ToInt32(txtTotalPersonalExpuesto.Text),
				peor_consecuencia = txtPeorConsecuencia.Text,
				eliminación = txtEliminación.Text,
				sustitución = txtSustitución.Text,
				controles_ingenieria = txtIngenieria.Text,
				controles_administrativos = txtAdministrativos.Text,
				fecha_ejecucion = Convert.ToDateTime(txtFechaEjecucion.Text)
			};

			ObjUsuario.Error = CRUD.Add_Fila(nuevoEvaRiesgo);

			Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtResponsableSGSST);

		}
		
		protected void CalculoProbabilidad_SelectedIndexChanged(object sender, EventArgs e)
		{

			if (ddlNivelDeficiencia.SelectedValue != string.Empty)
			{
				if (ddlNivelDeficiencia.SelectedValue == "10")
				{
					txtInterpretacionNivelDeficiencia.Text = "Se ha(n) detectado peligro(s) que determina(n) como posible la generación de incidentes, o la eficacia del conjunto de medidas preventivas existentes respecto al riesgo es nula no existe, o ambos";
				}
				else if (ddlNivelDeficiencia.SelectedValue == "6")
				{
					txtInterpretacionNivelDeficiencia.Text = "Se ha(n) detectado algún(os) peligro(s) que puede(n) dar lugar a consecuencias significativa(s) o la eficacia del conjunto de medidas preventivas existentes es baja, o ambos";
				}
				else if (ddlNivelDeficiencia.SelectedValue == "2")
				{
					txtInterpretacionNivelDeficiencia.Text = "Se han detectado peligros que pueden dar lugar a consecuencias poco significativa(s) o de menor importancia, o la eficacia del conjunto de medidas preventivas existentes es moderada, o ambos.";
				}
				else if (ddlNivelDeficiencia.SelectedValue == "0")
				{
					txtInterpretacionNivelDeficiencia.Text = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado.";
				}
			}
			else
			{ txtInterpretacionNivelDeficiencia.Text = "Sin Calcular"; }

			if (ddlNivelExposicion.SelectedValue != string.Empty)
			{
				if (ddlNivelExposicion.SelectedValue == "4")
				{
					txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta sin interrupción o varias veces con tiempo prolongado durante la jornada laboral.";
				}
				else if (ddlNivelExposicion.SelectedValue == "3")
				{
					txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta varias veces durante la jornada laboral por tiempos cortos.";
				}
				else if (ddlNivelExposicion.SelectedValue == "2")
				{
					txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta alguna vez durante la jornada laboral y por un periodo de tiempo corto.";
				}
				else if (ddlNivelExposicion.SelectedValue == "1")
				{
					txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta de manera eventual.";
				}
			}
			else
			{ txtInterpretacionNivelExposicion.Text = "Sin Calcular"; }

			if (ddlNivelDeficiencia.SelectedValue != string.Empty && ddlNivelExposicion.SelectedValue != string.Empty)
			{
				int probabilidad = (Convert.ToInt32(ddlNivelDeficiencia.SelectedValue) * Convert.ToInt32(ddlNivelExposicion.SelectedValue));

				string Interpretación = string.Empty;
				if (probabilidad >= 24 && probabilidad <= 40) { Interpretación = "Situación deficiente con exposición continua.Normalmente la materialización del riesgo ocurre con frecuencia"; }
				else if (probabilidad >= 10 && probabilidad <= 20) { Interpretación = "Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional o esporádica.La materialización del riesgo es posible que suceda varias veces durante la vida laboral "; }
				else if (probabilidad >= 6 && probabilidad <= 8) { Interpretación = "Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. Es posible que suceda el daño alguna vez."; }
				else if (probabilidad >= 2 && probabilidad <= 4) { Interpretación = "Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier nivel de exposición.No es esperable que se materialice el riesgo, aunque puede ser concebible."; }
				else if (probabilidad == 0) { Interpretación = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado."; }

				txtNivelProbabilidad.Text = string.Empty + probabilidad;
				txtInterpretacionNivelProbabilidad.Text = Interpretación;

			}
			else
			{
				txtNivelProbabilidad.Text = "Sin Calcular";
				txtInterpretacionNivelProbabilidad.Text = "Sin Calcular";
			}


			txtNivelRiesgo.Text = "Sin Calcular";
			txtValorNivelRiesgo.Text = "Sin Calcular";
			txtInterpretacionNivelRiesgo.Text = "Sin Calcular";
			ddlNivelConsecuencia.SelectedValue = "";
		}

		protected void CalculoNivelRiesgo_SelectedIndexChanged(object sender, EventArgs e)
		{

			if (ddlNivelConsecuencia.SelectedValue != string.Empty)
			{
				if (ddlNivelConsecuencia.SelectedValue == "100")
				{
					txtInterpretacionNivelConsecuencia.Text = "Muerte(s)";
				}
				else if (ddlNivelConsecuencia.SelectedValue == "60")
				{
					txtInterpretacionNivelConsecuencia.Text = "Lesiones o enfermedades graves irreparables (incapacidad permanente, parcial o invalidez).";
				}
				else if (ddlNivelConsecuencia.SelectedValue == "25")
				{
					txtInterpretacionNivelConsecuencia.Text = "Lesiones o enfermedades con incapacidad laboral temporal (ILT).";
				}
				else if (ddlNivelConsecuencia.SelectedValue == "10")
				{
					txtInterpretacionNivelConsecuencia.Text = "Lesiones o enfermedades que no requieren incapacidad.";
				}
			}
			else
			{ txtInterpretacionNivelConsecuencia.Text = "Sin Calcular"; }

			if (ddlNivelConsecuencia.SelectedValue != string.Empty && txtNivelProbabilidad.Text != "Sin Calcular")
			{
				int ValorRiesgo = (Convert.ToInt32(txtNivelProbabilidad.Text) * Convert.ToInt32(ddlNivelConsecuencia.SelectedValue));
				string NivelRiesgo = string.Empty;
				string Interpretación = string.Empty;
				string AceptabilidadRiesgo = string.Empty;

				if (ValorRiesgo >= 600 && ValorRiesgo <= 4000)
				{
					NivelRiesgo = "I";
					Interpretación = "Situación crítica. Suspender actividades hasta que el riesgo este bajo control. Intervención Urgente.";
					AceptabilidadRiesgo = "No aceptable";
				}
				else if (ValorRiesgo >= 150 && ValorRiesgo <= 500)
				{
					NivelRiesgo = "II";
					Interpretación = "Corregir y adoptar medidas de control de inmediato. Sin embargo, suspenda actividades si el nivel de riesgo esta por encima o igual de 360.";
					AceptabilidadRiesgo = "No aceptable o aceptable con control  especifico";
				}
				else if (ValorRiesgo >= 40 && ValorRiesgo <= 120)
				{
					NivelRiesgo = "III";
					Interpretación = "Mejorar si es posible. Seria conveniente justificar la intervención y su rentabilidad.";
					AceptabilidadRiesgo = "Aceptable";
				}
				else if (ValorRiesgo == 20)
				{
					NivelRiesgo = "IV";
					Interpretación = "Mantener las medidas de control existentes, pero se deberían considerar soluciones o mejoras y se deben hacer comprobaciones periódicas para asegurar que el riesgo es aún aceptable.";
					AceptabilidadRiesgo = "Aceptable Controlado";
				}

				txtNivelRiesgo.Text = NivelRiesgo;
				txtValorNivelRiesgo.Text = string.Empty + ValorRiesgo;
				txtInterpretacionNivelRiesgo.Text = Interpretación;
				txtAceptabilidadRiesgo.Text = AceptabilidadRiesgo;
			}
		}

		protected void txtPersonalExpuesto_TextChanged(object sender, EventArgs e)
		{
			int valorPlanta = txtPlanta.Text == string.Empty ? 0 : Convert.ToInt32(txtPlanta.Text);
			int valorContratistas = txtContratistas.Text == string.Empty ? 0 : Convert.ToInt32(txtContratistas.Text);
			int valorVisitantes = txtVisitantes.Text == string.Empty ? 0 : Convert.ToInt32(txtVisitantes.Text);

			int calculo = valorPlanta + valorContratistas + valorVisitantes;
			txtTotalPersonalExpuesto.Text = string.Empty + calculo;
			
		}
	}
}