using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Capa_Datos.Manager.Acc_Inc;

namespace SGSSTC.source.sistema.Verificar
{
    public partial class View_InvestigacionIncidente : Page
	{
		private Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;

		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

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
			ListaAccidente = Mgr_Acc_Inc.Get_Accidente(idAccidente);

			foreach (var item in ListaAccidente)
			{
				txtSucursal.Text = item.trabajador.puesto_trabajo.area.sucursal.nombre;
				txtLugarEvento.Text = item.sitio;
				txtTrabajador.Text = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
				txtCedula.Text = item.trabajador.cedula;
				txtFechaIngreso.Text = Convert.ToDateTime(item.trabajador.fecha_ingreso).ToString("yyyy-MM-dd");
				txtDescAccidente.Text = item.descripcion;

				txtTipoVinculacion.Text = item.trabajador.tipo_vinculacion;
				txtCargo.Text = item.trabajador.perfil_cargo.cno.ocupacion;
				ddlMano.Text = Convert.ToString(item.trabajador.mano_dominante);
				txtSalario.Text = Convert.ToString(item.trabajador.salario);

				foreach (var item2 in item.investigacion_ac_in)
				{
					txtFechaEvento.Text = Convert.ToDateTime(item2.fecha_evento).ToString("yyyy-MM-dd");
					txtHoraEvento.Text = Convert.ToDateTime(item2.hora_evento).ToString("HH:mm:ss");
					ddlDiaSemana.Text = item2.dia_semana;
					txtAntiguedad.Text = Convert.ToString(item2.antiguedad);
					txtActRealizaba.Text = item2.actividad_realizaba;
					txtAdiestramiento.Text = item2.adiestramiento;
					txtCostoTransporte.Text = item2.costo_transporte;
					txtCostoAtencionMedica.Text = item2.costo_atencion;
					txtCostoTratamiento.Text = item2.costo_tratamiento;
					txtCostoIndemnización.Text = item2.costo_indemizacion;
					txtCostoReemplazo.Text = item2.costo_reemplazo;
					txtCostoReposoMedico.Text = item2.costo_reposo;
					txtCostoDanhosMateriales.Text = item2.costo_materiales;
					txtCostoProdDiferida.Text = item2.costo_produccion;
					txtPorque1.Text = item2.porque1;
					txtRespuesta1.Text = item2.respuesta1;
					txtPorque2.Text = item2.porque2;
					txtRespuesta2.Text = item2.respuesta2;
					txtPorque3.Text = item2.porque3;
					txtRespuesta3.Text = item2.respuesta3;
					txtPorque4.Text = item2.porque4;
					txtRespuesta4.Text = item2.respuesta4;
					txtPorque5.Text = item2.porque5;
					txtRespuesta5.Text = item2.respuesta5;
					txtQue.Text = item2.que;
					txtRespuestaQue.Text = item2.respuesta_que;
					txtQuien.Text = item2.quien;
					txtrespuestaQuien.Text = item2.respuesta_quien;
					txtDonde.Text = item2.donde;
					txtrespuestaDonde.Text = item2.respuesta_donde;
					txtCuando.Text = item2.cuando;
					txtrespuestaCuando.Text = item2.respuesta_cuando;
					txtComo.Text = item2.como;
					txtrespuestaComo.Text = item2.respuesta_como;
					txtCuanto.Text = item2.cuanto;
					txtrespuestaCuanto.Text = item2.respuesta_cuanto;
					txtPorque.Text = item2.porque;
					txtRespuestaPorque.Text = item2.respuesta_porque;
					ddlTipoAccidente.Text = item2.tipo_accidente;
					txtAccion1.Text = item2.medida1;
					txtResponsable1.Text = item2.responsable1;
					txtfecha1.Text = Convert.ToDateTime(item2.fecha_medida1).ToString("yyyy-MM-dd");
					txtAccion2.Text = item2.medida2;
					txtResponsable2.Text = item2.responsable2;
					txtFecha2.Text = Convert.ToDateTime(item2.fecha_medida2).ToString("yyyy-MM-dd");
					txtAccion3.Text = item2.medida3;
					txtResponsable3.Text = item2.responsable3;
					txtFecha3.Text = Convert.ToDateTime(item2.fecha_medida3).ToString("yyyy-MM-dd");
					txtNota.Text = item2.nota;
					txtSupervisor.Text = item2.supervisor;
					txtTiempoCargo.Text = item2.tiempo_cargo;
					txtActividad.Text = item2.actividad;

				}
			}
		}

	}
}