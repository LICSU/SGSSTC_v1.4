using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_PlanillaEntregaEpp : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ViewState["sWhere"] = string.Empty;
                LlenarGridView();
                CargarListas();
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaAdd);
            }
            else
            {
                Mgr_Sucursal.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
            if (!BoolEmpSuc.Item2)
            {
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, ObjUsuario.Id_sucursal);
            }
        }
        private void LlenarGridView()
        {
            Tabla.entrega_epp(GridView1, string.Empty + ViewState["empresa"], string.Empty + ViewState["sucursal"], string.Empty + ViewState["sWhere"], IdTrabajador);
        }
        #endregion

        #region registrar modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);
        }
        protected void MostrarModalCrear(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_PlanillaEntregaEpp.Value);
        }
        #endregion

        #region acciones
        protected void Guardar(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + txtNombre.Text, "~/archivos/entregasepp/");

            documento nuevo = new documento()
            {
                nombre = txtNombre.Text,
                fecha_subida = DateTime.Today.Date,
                id_tabla = Convert.ToInt32(ddlTrabajadorAdd.SelectedValue),
                ruta = ruta,
                tipo = "EntregaEpp"
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                string valor = (GridView1.Rows[RowIndex].FindControl("id") as Label).Text;
                hdfIDDel.Value = valor;

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion

        #region filtro
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajadorAdd, Convert.ToInt32(ddlSucursalAdd.SelectedValue));
            }
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlSucursal.SelectedValue;
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
            else
            {
                ViewState["empresa"] = "0";
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
            }
            else
            {
                ViewState["sucursal"] = "0";

            }
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["sWhere"] = txtBuscar.Text;
            }
            else
            {
                ViewState["sWhere"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion

        #region AutoCompletar
        protected void btnGenerar_OnClick(object sender, EventArgs e)
        {
            if (ddlTrabajador.SelectedValue != string.Empty)
            {
                ViewState["trabajador"] = ddlTrabajador.SelectedValue;
                LlenarGridView();
            }
            else
            {
                ViewState["trabajador"] = string.Empty;

            }
        }
        #endregion
    }
}