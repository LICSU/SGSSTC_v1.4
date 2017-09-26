using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Create_PuestoTrabajo : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa1.Visible = BoolEmpSuc.Item1;
            phSucursal1.Visible = BoolEmpSuc.Item2;

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
                Listas.Epp(ddlEpp);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Epp(ddlEpp);
                Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int IdSucursal = 0;

            if (BoolEmpSuc.Item1)
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else
            {
                IdSucursal = ObjUsuario.Id_sucursal;
            }

            List<puesto_trabajo> puesto = Getter.PuestoTrabajo_Nom_Suc(txtNombre.Text, IdSucursal);

            if (puesto.Count == 0)
            {
                IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

                String[] valores = {
                    txtNombre.Text,
                    txtDescripcion.Text,
                    txtRecursoHumano.Text,
                    txtObjetoTrabajo.Text,
                    txtInsumos.Text,
                    txtMaquinas.Text,
                    txtHerramientas.Text,
                    txtEmisiones.Text,
                    txtProductos.Text,
                    txtDesechos.Text,
                    ddlArea.SelectedValue,

                };

                ObjUsuario.Error = CRUD.Add_PuestoTrabajo(ObjUsuario , valores, fuAnexo, ddlEpp);

            }
            else
            {
                txtNombre.BorderColor = Color.Red;
                Modal.MostrarMsjModal(MensajeError.Error_Existe_Puesto_Nombre.Value, "ERR", this);
            }

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtNombre);
        }

        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                Listas.Epp(ddlEpp);
            }
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                Listas.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
        }
    }
}