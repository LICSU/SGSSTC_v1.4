using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Update_Empresa : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != string.Empty)
                {
                    ObjUsuario.Id_empresa = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["id_empresa"] = ObjUsuario.Id_empresa;
                    cargarDatos();
                }
            }
        }

        private void cargarDatos()
        {
            int IdEmpresa = Convert.ToInt32(ViewState["id_empresa"]);

            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Getter.Empresa(IdEmpresa);

            foreach (var item in ListaEmpresa)
            {
                txtNombreEmpresa.Text = item.nombre;
                txtCodigoEmpresa.Text = item.CodEmpresa;
                txtNit.Text = item.nit;
                txtEmail.Text = item.email;
                txtRepresentante.Text = item.representante;
                txtTelFijo.Text = item.fijo;
                txtTelMovil.Text = item.movil;
                hfLogo.Value = item.logo_url;

                String ruta = hfLogo.Value;
                imgLogo.ImageUrl = ruta;
            }

        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
        }

    }
}