using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Sucursal : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;
            phSucursal1.Visible = BoolEmpSuc.Item2;
            phSucursal2.Visible = !BoolEmpSuc.Item2;
            if (!IsPostBack)
            {
                if (ObjUsuario.isAdm_Sucursal())
                {
                    phAgregar.Visible = true;
                    CargarListas();
                    LlenarGridView();
                    ConsultarSucursal(ObjUsuario.Id_sucursal);
                }
                else if (!BoolEmpSuc.Item2)
                {
                    ConsultarSucursal(ObjUsuario.Id_sucursal);
                }
                else
                {
                    CargarListas();
                    LlenarGridView();
                }
            }
        }

        private void ConsultarSucursal(int id_sucursal)
        {
            List<sucursal> ListaSucursal = new List<sucursal>();
            int IdSucursal = Convert.ToInt32(id_sucursal);
            ListaSucursal = Getter.Sucursal(IdSucursal);

            foreach (var item in ListaSucursal)
            {
                txtNombreSucursal.Text = item.nombre;
                txtDirección.Text = item.direccion;
                txtRepresentante.Text = item.representante;
                txtTelFijo.Text = item.fijo;
                txtTelMovil.Text = item.movil;
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpresaEdit);
            }
            Listas.Reg_Dpto_Mcpio(ddlRegionEdit, "Region");
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Sucursal(GridView1, ObjUsuario.Id_sucursal, IdEmpresa, IdSucursal, string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfSucursalEditID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);


                List<sucursal> ListaSucursal = new List<sucursal>();
                ListaSucursal = Getter.Sucursal(Convert.ToInt32(hdfSucursalEditID.Value));

                foreach (var item in ListaSucursal)
                {
                    txtNombreEdit.Text = item.nombre;
                    txtDireccionEdit.Text = item.direccion;
                    txtFijoEdit.Text = item.fijo;
                    txtMovilEdit.Text = item.movil;
                    txtRepresentanteEdit.Text = item.representante;
                    ddlEmpresaEdit.SelectedValue = Convert.ToString(item.id_empresa);

                    ddlRegionEdit.SelectedValue = Convert.ToString(item.municipio.departamento.id_region);

                    Listas.Reg_Dpto_Mcpio(ddlDptoEdit, "RegionDpto", Convert.ToInt32(item.municipio.departamento.id_region));
                    ddlDptoEdit.SelectedValue = Convert.ToString(item.municipio.id_departamento);

                    Listas.Reg_Dpto_Mcpio(ddlMcpioEdit, "McpioDpto", Convert.ToInt32(item.municipio.id_departamento));
                    ddlMcpioEdit.SelectedValue = Convert.ToString(item.id_municpio);
                }
                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfSucursalIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
            else if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfSucursalID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                List<sucursal> ListaSucursal = new List<sucursal>();
                ListaSucursal = Getter.Sucursal(Convert.ToInt32(hdfSucursalID.Value));
                foreach (var item in ListaSucursal)
                {
                    lblNombreView.Text = item.nombre;
                    lbRegionView.Text = item.municipio.departamento.Region.nombre;
                    lbDptoView.Text = item.municipio.departamento.nombre;
                    lbMcpioView.Text = item.municipio.nombre;
                    lbDireccionView.Text = item.direccion;
                    lblRepreView.Text = item.representante;
                    lblFijoView.Text = item.fijo;
                    lblMovilView.Text = item.movil;
                }
                Modal.registrarModal("viewModal", "ViewModalScript", this);
                
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario.isAdm_Sucursal())
            {
                #region codigo

                if (e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[5].Visible = false;
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[1].RowSpan = 3;
                    e.Row.Cells[5].Visible = false;
                }
                #endregion
            }
            if (ObjUsuario.isAdmEmp_DptoSalud() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdm_SucSalud() ||
                ObjUsuario.isAdm_SucSeg() || ObjUsuario.isResponsable())
            {
                #region codigo
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[4].Visible = false;
                    e.Row.Cells[5].Visible = false;
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[4].Visible = false;
                    e.Row.Cells[5].Visible = false;
                }
                #endregion
            }

        }
        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_Sucursal.Value);
        }

        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            //Modal.registrarModal("printModal", "printModalScript", this);
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int IdSucursal = Convert.ToInt32(hdfSucursalEditID.Value);
            sucursal Edit = contexto.sucursal.SingleOrDefault(b => b.id_sucursal == IdSucursal);
            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_municpio = Convert.ToInt32(ddlMcpioEdit.SelectedValue);
                Edit.id_empresa = IdEmpresa;
                Edit.direccion = txtDireccionEdit.Text;
                Edit.sede_principal = 0;
                Edit.representante = txtRepresentanteEdit.Text;
                Edit.movil = txtFijoEdit.Text;
                Edit.fijo = txtMovilEdit.Text;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
            CargarListas();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            string IdSucursal = hdfSucursalIDDel.Value;

            sucursal tabla = new sucursal();

            ObjUsuario.Error = CRUD.Delete_Fila(
                tabla,
                Convert.ToInt32(IdSucursal),
                ObjUsuario.Id_usuario,
                HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

            LlenarGridView();
        }

        #endregion

        #region filtro
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

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();

        }

        protected void ddlRegionEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            Listas.Reg_Dpto_Mcpio(ddlDptoEdit, "RegionDpto", Convert.ToInt32(ddlRegionEdit.SelectedValue));
        }

        protected void ddlDptoEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            Listas.Reg_Dpto_Mcpio(ddlMcpioEdit, "McpioDpto", Convert.ToInt32(ddlDptoEdit.SelectedValue));
        }
        #endregion
    }
}