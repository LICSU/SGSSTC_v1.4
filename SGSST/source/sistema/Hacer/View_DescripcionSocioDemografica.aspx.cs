using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;


namespace SGSSTC.source.sistema.Hacer
{
	public partial class View_DescripcionSocioDemografica : System.Web.UI.Page
	{
		#region variables
		private  Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private int idPerfil;
		#endregion

		#region acciones index
		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			idPerfil = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			if (!IsPostBack)
			{
				CargarUsuario();
			}
		}

		private void CargarUsuario()
		{
			List<desc_socio> ListaDescSocio = new List<desc_socio>();
			ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(idPerfil));

			foreach (var itemDescSocio in ListaDescSocio)
			{
				ddlTrabajador.Text = itemDescSocio.trabajador.primer_nombre + " " + itemDescSocio.trabajador.primer_apellido;
				txtLugar.Text = itemDescSocio.lugar_nac;
				txtNivel.Text = itemDescSocio.nivel_escolaridad;
				txtAnhosApro.Text = itemDescSocio.años_aprob;
				lblCabeza.Text = itemDescSocio.cabeza_fam;
				lblHijos.Text = itemDescSocio.num_hijos;
				lblResponsabilidad.Text = itemDescSocio.repart_resp;
				lblMenores.Text = itemDescSocio.menores_dep;
				lblCondicion.Text = itemDescSocio.cond_social;
				lblMotivo.Text = itemDescSocio.mot_despl;
				lblVivienda.Text = itemDescSocio.tipo_vivienda;
				lblServicios.Text = itemDescSocio.serv_pub;
				lblVivienda2.Text = itemDescSocio.vivienda;
				lblIndustrias.Text = itemDescSocio.industria;
				lblRuido.Text = itemDescSocio.ruido;
				lblContaminacion.Text = itemDescSocio.contaminacion;
				lblDescripcion.Text = itemDescSocio.descripcion;
				lblSistema.Text = itemDescSocio.sist_seg_soc;
				lblRegimen.Text = itemDescSocio.reg_afiliacion;
				lblNivel.Text = itemDescSocio.nivel_sisben;
				if (itemDescSocio.id_eps != 0)
					txtEps.Text = itemDescSocio.eps.nombre;
				else
					txtEps.Text = "Ninguna";
				lblPensiones.Text = itemDescSocio.afi_sssp;
				if (itemDescSocio.id_afp != 0)
					txtFondo.Text = itemDescSocio.afp.nombre;
				else
					txtFondo.Text = "Ninguno";

				lblEstrato.Text = itemDescSocio.estrato;

				if (txtEps.Text != string.Empty)
					phEps.Visible = true;
				if (lblRegimen.Text != string.Empty)
					phRegimen.Visible = true;
				if (lblMotivo.Text != string.Empty)
					phMotivoD.Visible = true;
				if (txtAnhosApro.Text != string.Empty)
					phAñosApr.Visible = true;
				if (lblNivel.Text != string.Empty)
					phNivel.Visible = true;
				if (txtFondo.Text != string.Empty)
					phFondo.Visible = true;


				//CONSULTAR LOS EMPLEOS ANTERIORES... //
				int contador = 1;
				foreach (var item in itemDescSocio.empleo_anterior)
				{
					string empresa = item.empresa;
					if (empresa != string.Empty)
					{
						phEmpleos.Visible = true;
						if (contador == 1)
						{
							TableRow1.Visible = true;
							txtEmpresa1.Text = empresa;
							txtArea1.Text = item.area;
							txtCargo1.Text = item.cargo;
							txtAños1.Text = item.años;
							txtMeses1.Text = item.meses;
							txtEnfermadades1.Text = item.enfermedades;
						}
						else if (contador == 2)
						{
							TableRow2.Visible = true;
							txtEmpresa2.Text = empresa;
							txtArea2.Text = item.area;
							txtCargo2.Text = item.cargo;
							txtAños2.Text = item.años;
							txtMeses2.Text = item.meses;
							txtEnfermadades2.Text = item.enfermedades;
						}
						else if (contador == 3)
						{
							TableRow3.Visible = true;
							txtEmpresa3.Text = empresa;
							txtArea3.Text = item.area;
							txtCargo3.Text = item.cargo;
							txtAños3.Text = item.años;
							txtMeses3.Text = item.meses;
							txtEnfermadades3.Text = item.enfermedades;
						}
						contador++;

					}
				}
			}
		}		
		#endregion
	}
}