using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_ActaCierre : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Mgr_Empresa.Empresa(ObjUsuario.Id_empresa);

            foreach (var item in ListaEmpresa)
            {
                txtEmpresa.Text = item.nombre;
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
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            else
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                txtEmpresa.Text,
                txtPeriodo.Text,
                Textbox1.Text,
                Textbox2.Text,
                Textbox3.Text,
                Textbox4.Text,
                Textbox5.Text,
                Textbox6.Text,
                Textbox7.Text,
                Textbox8.Text,
                Textbox9.Text
            };
            PrintFile.PrintActaCierre(valores, this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}