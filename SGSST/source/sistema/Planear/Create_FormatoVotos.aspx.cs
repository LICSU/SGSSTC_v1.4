using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Create_FormatoVotos : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;

        protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			List<empresa> ListaEmpresa = new List<empresa>();
			ListaEmpresa = Getter.Empresa(ObjUsuario.Id_empresa);

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
                IdSucursal = Convert.ToInt32(ObjUsuario.Id_sucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador2, IdSucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador3, IdSucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador4, IdSucursal);
            }
		}

		protected void GenerarDocumento(object sender, EventArgs e)
		{
			int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
			String[] valores = {
				string.Empty + IdSucursal,
                ddlTrabajador.SelectedValue.ToString(),
                ddlTrabajador2.SelectedValue.ToString(),
                ddlTrabajador3.SelectedValue.ToString(),
                ddlTrabajador4.SelectedValue.ToString(),
                Image1.ImageUrl,
				Image2.ImageUrl,
				Image3.ImageUrl,
				Image4.ImageUrl,
				ddlTrabajador.SelectedItem.Text,
				ddlTrabajador2.SelectedItem.Text,
				ddlTrabajador3.SelectedItem.Text,
				ddlTrabajador4.SelectedItem.Text
            };
			PrintFile.PrintFormatoVotos(valores, this);
		   
		}
		

		#region filtros

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
				IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);

                Listas.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador2, IdSucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador3, IdSucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador4, IdSucursal);

                Image1.ImageUrl = "";
				Image2.ImageUrl = "";
				Image3.ImageUrl = "";
				Image4.ImageUrl = "";
			}
		}
		
		public string TraerFoto(int Id_trabajador)
		{
			string foto = "";
			List<trabajador> ListTrab = new List<trabajador>();
			ListTrab = Getter.Trabajador(Id_trabajador);

			foreach (var item in ListTrab)
			{
				if (item.foto != string.Empty)
				{
					foto = item.foto;
				}
				else
				{
					foto = "~/archivos/foto_perfil/usuario.png";
				}
			}

			return foto;
		}
        #endregion

        protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = TraerFoto(Convert.ToInt32(ddlTrabajador.SelectedValue));
        }

        protected void ddlTrabajador2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image2.ImageUrl = TraerFoto(Convert.ToInt32(ddlTrabajador2.SelectedValue));
        }

        protected void ddlTrabajador3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image3.ImageUrl = TraerFoto(Convert.ToInt32(ddlTrabajador3.SelectedValue));
        }

        protected void ddlTrabajador4_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image4.ImageUrl = TraerFoto(Convert.ToInt32(ddlTrabajador4.SelectedValue));

        }
    }
}