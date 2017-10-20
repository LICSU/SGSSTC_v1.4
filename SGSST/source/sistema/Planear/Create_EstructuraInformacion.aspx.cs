using Capa_Datos;using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_EstructuraInformacion : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

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
                ddlEmpresa.SelectedItem.Text,
                ddlArea.SelectedItem.Text,
                ddlPuesto.SelectedItem.Text,
                ddlTrabajador.SelectedItem.Text,
                txtMateriaPrima.Text,
                txtProcedimientos.Text,
                txtProductos.Text,
                txtEmisiones.Text,
                txtSustancias.Text,
                txtAccidentes.Text,
                txtEnfermedades.Text
            };
            PrintFile.PrintEstructuraInformacion(valores, this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                Mgr_PuestoTrabajo.PuestoTrabajo(ddlPuesto, "idArea", Convert.ToInt32(ddlArea.SelectedValue));
            }
        }

        protected void ddlPuesto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPuesto.SelectedValue != string.Empty)
            {
                Mgr_Trabajador.Trabajadores_Puestos(ddlTrabajador, Convert.ToInt32(ddlPuesto.SelectedValue));
            }
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                Mgr_Area.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
        }
    }
}