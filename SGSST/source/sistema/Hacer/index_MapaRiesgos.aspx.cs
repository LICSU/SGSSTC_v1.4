using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_MapaRiesgos : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;

            phAgregar.Visible = BoolEmpSuc.Item2;

            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            if (!IsPostBack)
            {
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
                Mgr_Empresa.Lista_Empresa(ddlEmpresaEdit);
            }
            else
            {
                Mgr_Sucursal.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);
            }
        }
        private void LlenarGridView()
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.MapaRiesgos(GridView1, IdSucursal, string.Empty + ViewState["buscar"]);
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfPlanID.Value = (gvrow.FindControl("id_plan_mapa") as Label).Text;
                txtNombreEdit.Text = (gvrow.FindControl("nombre") as Label).Text;
                int id_empresa = Convert.ToInt32((gvrow.FindControl("id_empresa") as Label).Text);
                int id_sucursal = Convert.ToInt32((gvrow.FindControl("id_sucursal") as Label).Text);
                ddlEmpresaEdit.SelectedValue = id_empresa.ToString();
                Mgr_Sucursal.Sucursal(ddlSucursalEdit, id_empresa);
                ddlSucursalEdit.SelectedValue = id_sucursal.ToString();

                Modal.registrarModal("editModal", "EditModalScript", this);
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfPlanIDDel.Value = (gvrow.FindControl("id_plan_mapa") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            if (ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isAdmEmp_DptoSalud()
                || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[5].Visible = false;
                    e.Row.Cells[6].Visible = false;
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[5].Visible = false;
                    e.Row.Cells[6].Visible = false;
                }
            }
        }
        #endregion

        #region registrar modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            //Modal.registrarModal("addModal", "AddModalScript", this);
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            //Modal.registrarModal("printModal", "printModalScript", this);
        }
        #endregion

        #region acciones 
        protected void Guardar(object sender, EventArgs e)
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + txtNombre.Text, "~/archivos/mapas/");

            documento nuevo = new documento()
            {
                nombre = txtNombre.Text,
                ruta = ruta,
                id_tabla = IdSucursal,
                tipo = "MapaRiesgos"
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);


            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalEdit);

            string ruta = Utilidades.GuardarArchivo(flpArchivoEdit, IdEmpresa + txtNombreEdit.Text, "~/archivos/mapas/");

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idPlan = Convert.ToInt32(hdfPlanID.Value);

            documento Edit = contexto.documento.SingleOrDefault(b => b.id_documento == idPlan);
            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.ruta = ruta;
                Edit.id_tabla = IdSucursal;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);


            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfPlanIDDel.Value));
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region exportar
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void incializarExports()
        {
            LlenarGridView();
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "Planes", "Lista de Planes");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "Planes", "Lista de Planes");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "Planes", "Lista de Planes");
        }
        #endregion

        #region filtro
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }
        protected void ddlEmpresaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaEdit.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursalEdit, Convert.ToInt32(ddlEmpresaEdit.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";

            }
            LlenarGridView();
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["buscar"] = txtBuscar.Text;
            }
            else
            {
                ViewState["buscar"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}