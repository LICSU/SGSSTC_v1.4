using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_ExamenLaboral : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            GridView1.Columns[4].Visible = BoolEmpSuc.Item2;

            DateTime fechaActual = DateTime.Now;
            ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
            ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

            if (!IsPostBack)
            {
                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

                CargarListas();
                LlenarGridView();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Listas.TipoExamen(ddlTipoExamen);
            }
            else
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Listas.TipoExamen(ddlTipoExamen);
            }

        }

        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));

            Tabla.HC_Trabajador(GridView1,
                string.Empty + ViewState["search"],
                IdEmpresa,
                string.Empty + ViewState["TipoExamen"],
                string.Empty + ViewState["FechaInicio"],
                string.Empty + ViewState["FechaFin"]);

        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            historia_clinica_ocupacional tabla = new historia_clinica_ocupacional();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region registro de los modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_ExamenLaboral.Value);
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        #endregion

        #region Exportar listas
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void incializarExports()
        {
            LlenarGridView();
            GridView1.Columns[3].Visible = false;
            GridView1.Columns[4].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "HistoriaClinicaOcupacional", "Lista de examenes");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "HistoriaClinicaOcupacional", "Lista de examenes");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "HistoriaClinicaOcupacional", "Lista de examenes");
        }
        #endregion

        #region eventos del grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                Modal.registrarModal("editModal", "EditModalScript", this);
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id_his_cli_ocu") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //Utilidades.Unir2Celdas(e, 3, 4);
        }
        #endregion

        #region filtros
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
        protected void ddlTipoExamen_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoExamen.SelectedValue != string.Empty)
            {
                ViewState["TipoExamen"] = ddlTipoExamen.SelectedValue;
            }
            else
            {
                ViewState["TipoExamen"] = string.Empty;
            }
            LlenarGridView();

        }
        protected void txtFechaInicio_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaInicio.Text != string.Empty)
            {
                ViewState["FechaInicio"] = txtFechaInicio.Text;
            }
            else
            {
                ViewState["FechaInicio"] = string.Empty;
            }
            LlenarGridView();

        }
        protected void txtFechaFin_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaFin.Text != string.Empty)
            {
                ViewState["FechaFin"] = txtFechaFin.Text;
            }
            else
            {
                ViewState["FechaFin"] = string.Empty;
            }
            LlenarGridView();

        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["search"] = txtBuscar.Text;
            }
            else
            {
                ViewState["search"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}