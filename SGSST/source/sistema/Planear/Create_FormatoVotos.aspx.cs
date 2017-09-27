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
        private static int IdTrabajador = 0;
        private static int IdPuesto = 0;
        private static int IdSucursal2 = 0;
        private static int IdTrabajador2 = 0;
        private static int IdSucursal3 = 0;
        private static int IdTrabajador3 = 0;
        private static int IdSucursal4 = 0;
        private static int IdTrabajador4 = 0;


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
                IdSucursal2 = Convert.ToInt32(ObjUsuario.Id_sucursal);
                IdSucursal3 = Convert.ToInt32(ObjUsuario.Id_sucursal);
                IdSucursal4 = Convert.ToInt32(ObjUsuario.Id_sucursal);
			}
		}

		protected void GenerarDocumento(object sender, EventArgs e)
		{
			int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
			String[] valores = {
				string.Empty + IdSucursal,
				IdTrabajador.ToString(),
                IdTrabajador2.ToString(),
                IdTrabajador3.ToString(),
                IdTrabajador4.ToString(),
                Image1.ImageUrl,
				Image3.ImageUrl,
				Image2.ImageUrl,
				Image4.ImageUrl,
				txtTrabajador.Text,
                txtTrabajador2.Text,
                txtTrabajador3.Text,
                txtTrabajador4.Text
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
				IdSucursal2 = Convert.ToInt32(ddlSucursal.SelectedValue);
				IdSucursal3 = Convert.ToInt32(ddlSucursal.SelectedValue);
				IdSucursal4 = Convert.ToInt32(ddlSucursal.SelectedValue);

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

        protected void hdnValue_ValueChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = TraerFoto(IdTrabajador);
        }
        protected void hdnValue2_ValueChanged(object sender, EventArgs e)
        {
            Image2.ImageUrl = TraerFoto(IdTrabajador2);
        }
        protected void hdnValue3_ValueChanged(object sender, EventArgs e)
        {
            Image3.ImageUrl = TraerFoto(IdTrabajador3);
        }
        protected void hdnValue4_ValueChanged(object sender, EventArgs e)
        {
            Image4.ImageUrl = TraerFoto(IdTrabajador4);
        }

        #region AutoCompletar
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal, ref IdTrabajador, IdPuesto);
            return listTrabajadores;
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador2(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal2, ref IdTrabajador2, IdPuesto);
            return listTrabajadores;
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador3(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal2, ref IdTrabajador3, IdPuesto);
            return listTrabajadores;
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador4(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal4, ref IdTrabajador4, IdPuesto);
            return listTrabajadores;
        }
        #endregion
    }
}