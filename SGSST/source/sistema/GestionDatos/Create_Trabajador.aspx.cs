using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using Capa_Datos.Manager.Estatus;
using Capa_Datos.Manager.Horario;
using Capa_Datos.Manager.Gobierno;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Create_Trabajador : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
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
                Mgr_Empresa.Lista_Empresa(ddlEmpresas);
            }
            else
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Mgr_PuestoTrabajo.Lista_PuestoTrabajo(ddlPuestoTrabajo, "Empresa", ObjUsuario.Id_empresa);
                Mgr_Estatus.List_Estatus_Empresa(ddlEstatus, ObjUsuario.Id_empresa);
                Mgr_Horario.Lista_HorarioByEmpresa(ddlHorario, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Mgr_PuestoTrabajo.Lista_PuestoTrabajo(ddlPuestoTrabajo, "Sucursal", ObjUsuario.Id_sucursal);
                Mgr_Estatus.List_Estatus_Empresa(ddlEstatus, ObjUsuario.Id_empresa);
                Mgr_Horario.Lista_HorarioByEmpresa(ddlHorario, ObjUsuario.Id_empresa);
            }

            Mgr_Gobierno.Get_Reg_Dpto_Mcpio(ddlRegion, "Region");
            Mgr_Gobierno.Get_CCF(ddlCcf);
            Mgr_Trabajador.Lista_PerfilCargo(ddlCargo);
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Trabajador.aspx");
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("index_Trabajador.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            String NombreArchivo = string.Empty;

            int id_trab = Mgr_Trabajador.Get_TrabajadorByCedula(txtCedula.Text);
            if (id_trab == 0)
            {
                String[] valores = {
                     txtCedula.Text,
                     txtNombre1.Text,
                     txtNombre2.Text,
                     txtApellido1.Text,
                     txtApellido2.Text,
                     txtEmail.Text,
                     txtFechadeNacimiento.Text,
                     ddlEdoCivil.SelectedValue,
                     ddlSexo.SelectedValue,
                     txtTelCasa.Text,
                     txtTelCelular.Text,
                     ddlCcf.SelectedValue,
                     txtDireccion.Text,
                     ddlMunicipio.SelectedValue,
                     ddlPuestoTrabajo.SelectedValue,
                     ddlDiscapacitado.SelectedValue,
                     txtDiscapacidad.Text,
                     ddlHorario.SelectedValue,
                     ddlEstatus.SelectedValue,
                     txtFechaIngreso.Text,
                     ddlTipoVinculacion.SelectedValue,
                     ddlTipoHorario.SelectedValue,
                     ddlCargo.SelectedValue,
                     txtSalario.Text,
                     ddlManodominante.SelectedValue

                 };

                ObjUsuario.Error = Mgr_Trabajador.Add_Trabajador( valores, fuFoto);

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtNombre1);

            }
            else
            {
                txtCedula.BorderColor = System.Drawing.Color.Red;
                Modal.MostrarMsjModal(MensajeError.Error_Existe_Trabajador_Cedula.Value, "ERR", this);
            }

        }
        #endregion

        #region filtros
        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresas.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresas.SelectedValue));
                Mgr_Horario.Lista_HorarioByEmpresa(ddlHorario, Convert.ToInt32(ddlEmpresas.SelectedValue));
                Mgr_Estatus.List_Estatus_Empresa(ddlEstatus, Convert.ToInt32(ddlEmpresas.SelectedValue));
            }

        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                Mgr_PuestoTrabajo.Lista_PuestoTrabajo(ddlPuestoTrabajo, "Sucursal", Convert.ToInt32(ddlSucursal.SelectedValue));
            }
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRegion.SelectedValue != string.Empty)
            {
                Mgr_Gobierno.Get_Reg_Dpto_Mcpio(ddlDepartamento, "RegionDpto", Convert.ToInt32(ddlRegion.SelectedValue));
            }
        }

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartamento.SelectedValue != string.Empty)
            {
                Mgr_Gobierno.Get_Reg_Dpto_Mcpio(ddlMunicipio, "McpioDpto", Convert.ToInt32(ddlDepartamento.SelectedValue));
            }
        }

        protected void ddlDiscapacitado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDiscapacitado.SelectedValue == "No")
            {
                txtDiscapacidad.Visible = false;
            }
            else
            {
                txtDiscapacidad.Visible = true;
            }
        }
        #endregion

    }
}