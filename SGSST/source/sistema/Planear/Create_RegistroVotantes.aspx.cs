using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Create_RegistroVotantes : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;

		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			List<empresa> ListaEmpresa = new List<empresa>();
			ListaEmpresa = Getter.Empresa(ObjUsuario.Id_empresa);

			foreach (var item in ListaEmpresa)
			{
				//txtEmpresa.Text = item.nombre;
			}

			if (!IsPostBack)
			{
				CargarListas();
			}
		}

		private void CargarListas()
		{
			if (BoolEmpSuc.Item1)
			{
				Listas.Empresa(ddlEmpresa);
			}
			else
			{
				Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
			}
            if (!BoolEmpSuc.Item2)
            {
                List<trabajador> LisTrabajador = new List<trabajador>();
                LisTrabajador = Getter.Trabajador(0, 0, Convert.ToInt32(ObjUsuario.Id_sucursal));
                int contTrabajadortes = 0;

                foreach (var item in LisTrabajador)
                {
                    contTrabajadortes++;

                    ControlesDinamicos.CrearLiteral("" +
                       "<tr>" +
                           "<td>" + contTrabajadortes + "</td>" +
                           "<td>" + item.primer_nombre + " " + item.primer_apellido + "</td>" +
                           "<td>" + item.cedula + "</td>" +
                           "<td> </td>" +
                       "</tr> ", pDatos);
                }
            }
		}

		protected void GenerarDocumento(object sender, EventArgs e)
		{
			int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
			String[] valores = {
				string.Empty + IdSucursal,
				ddlSucursal.SelectedValue
			};
			PrintFile.PrintRegistroVotantes(valores, this);
		}
		
		protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlEmpresa.SelectedValue != string.Empty)
			{
				Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
			}
		}

		protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlSucursal.SelectedValue != string.Empty)
			{
				List<trabajador> LisTrabajador = new List<trabajador>();
				LisTrabajador = Getter.Trabajador(0, 0, Convert.ToInt32(ddlSucursal.SelectedValue));
				int contTrabajadortes = 0;

				foreach (var item in LisTrabajador)
				{
					contTrabajadortes++;

					ControlesDinamicos.CrearLiteral("" +
					   "<tr>" +
						   "<td>" + contTrabajadortes + "</td>" +
						   "<td>" + item.primer_nombre + " " + item.primer_apellido + "</td>" +
						   "<td>" + item.cedula + "</td>" +
						   "<td> </td>" +
					   "</tr> ", pDatos);
				}
			}
		}
	}
}