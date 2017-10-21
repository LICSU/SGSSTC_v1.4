using Capa_Datos;
using Capa_Datos.Manager.Riesgos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Update_MedidasMatrizRiesgos : Page
	{
		private Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private int idRiesgo;
		private int IdSucursal;

		#region metodos index
		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			idRiesgo = objUtilidades.descifrarCadena(Request.QueryString["id"]);
			IdSucursal = objUtilidades.descifrarCadena(Request.QueryString["suc"]);

			Page.Form.Attributes.Add("enctype", "multipart/form-data");
			if (!IsPostBack)
			{
				CargarDatos();
			}
		}

		private void CargarDatos()
		{
			List<identificacion_peligro> ListaRiesgos = new List<identificacion_peligro>();
			ListaRiesgos = Mgr_Riesgos.Get_IdentificacionPeligro(Convert.ToInt32(idRiesgo));

			foreach (var itemRiesgos in ListaRiesgos)
			{
				foreach (var itemFacIde in itemRiesgos.factor_identificacion)
				{
					lbTipoRiesgo.Text = itemFacIde.factor_riesgo.tipo_riesgo.nombre;
					lbFactorRiesgo.Text = itemFacIde.factor_riesgo.nombre;
				}
			}

			CargarMedidas();
		}

		private void CargarMedidas()
		{
			List<identificacion_peligro> ListaRiesgos = new List<identificacion_peligro>();
			ListaRiesgos = Mgr_Riesgos.Get_IdentificacionPeligro(Convert.ToInt32(idRiesgo));

			foreach (var itemRiesgos in ListaRiesgos)
			{
				string var1, var2, var3;
				var1 = objUtilidades.cifrarCadena(Convert.ToString(itemRiesgos.id_identificacion_peligro));
				var2 = objUtilidades.cifrarCadena(Convert.ToString(IdSucursal));

				foreach (var itemIdePuesto in itemRiesgos.identificacion_puesto)
				{
					foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
					{
						lbestatus.Text = string.Empty + Convert.ToString(itemEvaRiesgo.porc_estatus);

						if (itemEvaRiesgo.control_medio != string.Empty)
						{
							var3 = objUtilidades.cifrarCadena(Convert.ToString("Ambiente"));
							ListItem itemMedida1 = new ListItem();

							itemMedida1.Text =
								"<h4 class='text-muted text-left'>" +
									"<strong>Medidas en el Ambiente:<strong/>" +
								"<h4/>" +
								"<br/>" +
								itemEvaRiesgo.control_medio +
								" <a href='../Hacer/Create_ObligacionRiesgo.aspx?id=" + var1 + "&suc=" + var2 + "&med=" + var3 + "'>" +
								"<img src ='../../../ico/seguimiento.png'>Seguimiento" +
								"</a>" +
								"<hr/>";

							itemMedida1.Value = "A";
							if (itemEvaRiesgo.estatus_med_amb == "SI")
							{
								itemMedida1.Selected = true;
							}
							else
							{
								itemMedida1.Selected = false;
							}
							chkMedidas.Items.Add(itemMedida1);
						}

						if (itemEvaRiesgo.control_fuente != string.Empty)
						{
							var3 = objUtilidades.cifrarCadena(Convert.ToString("Fuente"));
							ListItem itemMedida2 = new ListItem();

							itemMedida2.Text =
								"<h4 class='text-muted text-left'>" +
								"<strong>Medidas en la Fuente:<strong/>" +
								"<h4/><br/> " +
								itemEvaRiesgo.control_fuente +
								"<a href='../Hacer/Create_ObligacionRiesgo.aspx?id=" + var1 + "&suc=" + var2 + "&med=" + var3 + "'>" +
								"<img src ='../../../ico/seguimiento.png'>Seguimiento" +
								"</a><hr/>";

							itemMedida2.Value = "F";
							if (itemEvaRiesgo.estatus_med_fue == "SI")
							{
								itemMedida2.Selected = true;
							}
							else
							{
								itemMedida2.Selected = false;
							}

							chkMedidas.Items.Add(itemMedida2);
						}

						if (itemEvaRiesgo.control_individuo != string.Empty)
						{
							var3 = objUtilidades.cifrarCadena(Convert.ToString("Trabajador"));
							ListItem itemMedida3 = new ListItem();

							itemMedida3.Text =
								"<h4 class='text-muted text-left'>" +
								"<strong>Medidas en el Trabajador<strong/>:" +
								"<h4/><br/> " + itemEvaRiesgo.control_individuo +
								"<a href='../Hacer/Create_ObligacionRiesgo.aspx?id=" + var1 + "&suc=" + var2 + "&med=" + var3 + "'>" +
								"<img src ='../../../ico/seguimiento.png'>Seguimiento </a>";

							itemMedida3.Value = "T";

							if (itemEvaRiesgo.estatus_med_trab == "SI")
							{
								itemMedida3.Selected = true;
							}
							else
							{
								itemMedida3.Selected = false;
							}

							chkMedidas.Items.Add(itemMedida3);
						}

					}
				}
			}

		}

		protected void GuardarRegistro(object sender, EventArgs e)
		{
			string estatusAmb = string.Empty;
			string estatusFue = string.Empty;
			string estatusTrab = string.Empty;

			#region actualizar estatus medida
			foreach (ListItem itemActual in chkMedidas.Items)
			{
				if (itemActual.Value == "A")
				{
					if (itemActual.Selected == true) { estatusAmb = "SI"; }
					if (itemActual.Selected == false) { estatusAmb = "NO"; }
				}
				else if (itemActual.Value == "F")
				{
					if (itemActual.Selected == true) { estatusFue = "SI"; }
					if (itemActual.Selected == false) { estatusFue = "NO"; }
				}
				else if (itemActual.Value == "T")
				{
					if (itemActual.Selected == true) { estatusTrab = "SI"; }
					if (itemActual.Selected == false) { estatusTrab = "NO"; }
				}
			}

			GrupoLiEntities contexto = new GrupoLiEntities();
			int _idRiesgo = Convert.ToInt32(idRiesgo);
			identificacion_peligro ListaIdePeligro = contexto.identificacion_peligro.SingleOrDefault(x => x.id_identificacion_peligro == _idRiesgo);

			foreach (var itemIdePuesto in ListaIdePeligro.identificacion_puesto)
			{
				foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
				{
					if (itemEvaRiesgo != null)
					{
						itemEvaRiesgo.estatus_med_amb = estatusAmb;
						itemEvaRiesgo.estatus_med_fue = estatusFue;
						itemEvaRiesgo.estatus_med_trab = estatusTrab;

						ObjUsuario.Error = CRUD.Edit_Fila(contexto);

					}
				}
			}

			#endregion

			#region  actualizar porcentaje estatus riesgo
			Double contMedidasTotal = 0;
			Double contMedidasSelec = 0;
			Double valor = 1.11;
			Double estatus = 0.0;

			contMedidasTotal = chkMedidas.Items.Count;

			foreach (ListItem itemActual in chkMedidas.Items)
			{
				if (itemActual.Selected == true)
				{
					contMedidasSelec++;
				}
			}

			valor = Math.Round(Convert.ToDouble((100 / (contMedidasTotal))), 2);
			estatus = (contMedidasSelec) * valor;
			estatus = Math.Round(Convert.ToDouble(estatus), 0);

			lbestatus.Text = string.Empty + estatus;

			GrupoLiEntities contexto1 = new GrupoLiEntities();
			identificacion_peligro Edit1 = contexto1.identificacion_peligro.SingleOrDefault(x => x.id_identificacion_peligro == _idRiesgo);

			foreach (var itemIdePuesto in Edit1.identificacion_puesto)
			{
				foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
				{
					if (itemEvaRiesgo != null)
					{
						itemEvaRiesgo.porc_estatus = Convert.ToInt32(estatus);
						ObjUsuario.Error = CRUD.Edit_Fila(contexto1);
					}
				}
			}

			#endregion
		}
		
		#endregion
	}
}