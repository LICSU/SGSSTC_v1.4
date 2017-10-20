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

namespace SGSSTC.source.sistema.Verificar
{
	public partial class Create_InvestigacionAccidente : Page
	{
		private  Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;

		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			if (!IsPostBack)
			{
				cargarDatos();
			}
		}

		private void cargarDatos()
		{
			int idAccidente = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			List<at_it_el_pa> ListaAccidente = new List<at_it_el_pa>();
			ListaAccidente = Getter.Accidente(idAccidente);

			foreach (var item in ListaAccidente)
			{
				txtSucursal.Text = item.trabajador.puesto_trabajo.area.sucursal.nombre;
				txtLugarEvento.Text = item.sitio;
				txtTrabajador.Text = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
				txtCedula.Text = item.trabajador.cedula;
				txtFechaIngreso.Text = Convert.ToDateTime(item.trabajador.fecha_ingreso).ToString("yyyy-MM-dd");
				txtDescAccidente.Text = item.descripcion;

				txtTipoVinculacion.Text = item.trabajador.tipo_vinculacion;
				//txtCargo.Text = item.trabajador.perfil_cargo.cno.ocupacion;
				ddlMano.Text = Convert.ToString(item.trabajador.mano_dominante);
				txtSalario.Text = Convert.ToString(item.trabajador.salario);
			}
		}

		protected void btPrintSave_Click(object sender, EventArgs e)
		{
			int idAccidente = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			#region delete investigacion existente
			investigacion_ac_in tabla = new investigacion_ac_in();
			List<investigacion_ac_in> consulta = new List<investigacion_ac_in>();
			consulta = Getter.InvestigacionAccidente(idAccidente);

			foreach (var item in consulta)
			{
				ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(item.id_inv_ac_in));
			}
			#endregion

			DateTime? fecha1 = null;
			fecha1 = txtfecha1.Text == string.Empty ? fecha1 : Convert.ToDateTime(txtfecha1.Text);

			DateTime? fecha2 = null;
			fecha2 = txtFecha2.Text == string.Empty ? fecha2 : Convert.ToDateTime(txtFecha2.Text);

			DateTime? fecha3 = null;
			fecha3 = txtFecha3.Text == string.Empty ? fecha3 : Convert.ToDateTime(txtFecha3.Text);

			investigacion_ac_in nuevo = new investigacion_ac_in
			{
				id_at_it_el_pa = idAccidente,
				tipo = "Accidente",
				fecha_evento = Convert.ToDateTime(txtFechaEvento.Text),
				hora_evento = Convert.ToDateTime(txtHoraEvento.Text),
				dia_semana = ddlDiaSemana.SelectedValue,
				antiguedad = Convert.ToInt32(txtAntiguedad.Text),
				actividad_realizaba = txtActRealizaba.Text,
				naturaleza_lesion = txtNaturalezaLesion.Text,
				gravedad_lesion = txtGravedad.Text,
				descripcion_lesion = txtDescLesion.Text,
				reposo = txtReposo.Text,
				dias_reposo = Convert.ToInt32(txtNumDias.Text),
				fecha_reintegro = Convert.ToDateTime(txtFechaReintegro.Text),
				adiestramiento = txtAdiestramiento.Text,
				costo_transporte = txtCostoTransporte.Text,
				costo_atencion = txtCostoAtencionMedica.Text,
				costo_tratamiento = txtCostoTratamiento.Text,
				costo_indemizacion = txtCostoIndemnización.Text,
				costo_reemplazo = txtCostoReemplazo.Text,
				costo_reposo = txtCostoReposoMedico.Text,
				costo_materiales = txtCostoDanhosMateriales.Text,
				costo_produccion = txtCostoProdDiferida.Text,
				porque1 = txtPorque1.Text,
				respuesta1 = txtRespuesta1.Text,
				porque2 = txtPorque2.Text,
				respuesta2 = txtRespuesta2.Text,
				porque3 = txtPorque3.Text,
				respuesta3 = txtRespuesta3.Text,
				porque4 = txtPorque4.Text,
				respuesta4 = txtRespuesta4.Text,
				porque5 = txtPorque5.Text,
				respuesta5 = txtRespuesta5.Text,
				que = txtQue.Text,
				respuesta_que = txtRespuestaQue.Text,
				quien = txtQuien.Text,
				respuesta_quien = txtrespuestaQuien.Text,
				donde = txtDonde.Text,
				respuesta_donde = txtrespuestaDonde.Text,
				cuando = txtCuando.Text,
				respuesta_cuando = txtrespuestaCuando.Text,
				como = txtComo.Text,
				respuesta_como = txtrespuestaComo.Text,
				cuanto = txtCuanto.Text,
				respuesta_cuanto = txtrespuestaCuanto.Text,
				porque = txtPorque.Text,
				respuesta_porque = txtRespuestaPorque.Text,
				tipo_accidente = ddlTipoAccidente.SelectedValue,
				tipo_lesion = ddlTipoLesión.SelectedValue,
				agente_lesion = ddlAgenteLesion.SelectedValue,
				parte_cuerpo = ddlParteCuerpo.SelectedValue,
				medida1 = txtAccion1.Text,
				responsable1 = txtResponsable1.Text,
				fecha_medida1 = fecha1,
				medida2 = txtAccion2.Text,
				responsable2 = txtResponsable2.Text,
				fecha_medida2 = fecha2,
				medida3 = txtAccion3.Text,
				responsable3 = txtResponsable3.Text,
				fecha_medida3 = fecha3,
				nota = txtNota.Text,
				supervisor = txtSupervisor.Text,
				tiempo_cargo = txtTiempoCargo.Text,
				actividad = txtActividad.Text
			};

			ObjUsuario.Error = CRUD.Add_Fila(nuevo);

			Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFechaEvento);

			if (ObjUsuario.Error)
			{
				if (fuAnexo.HasFile)
				{
					int i = 0;
					foreach (var archivo in fuAnexo.PostedFiles)
					{
						i++;
						string ruta = Utilidades.GuardarArchivo(archivo, "InvAccidente_" + idAccidente + "_" + i, "~/archivos/accidentes/");

						soporte nuevoFA = new soporte()
						{
							url = ruta,
							id_tabla = idAccidente
						};
						ObjUsuario.Error = CRUD.Add_Fila(nuevoFA);

					}
				}
			}

		}

        protected void Volver_Click(object sender, EventArgs e)
        {

        }
    }
}