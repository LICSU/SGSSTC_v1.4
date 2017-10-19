using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_PuestoTrabajo : Page
    {
        private Utilidades objUtilidades;
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            objUtilidades = new Utilidades();
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phArea.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ViewState["area"] = "0";
                LlenarGridView();
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

            if (!BoolEmpSuc.Item2)
            {
                Mgr_Area.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.PuestoTrabajo(GridView1,
                IdEmpresa, IdSucursal,
                string.Empty + ViewState["area"],
                string.Empty + ViewState["Num1"],
                string.Empty + ViewState["Num2"],
                string.Empty + ViewState["sWhere"]);
        }
        #endregion

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_PuestoTrabajo.Value);
            
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            puesto_trabajo tabla = new puesto_trabajo();
            List<usuario> usuarioData = Mgr_Area.AreaByUsuario(ObjUsuario.Id_usuario);
            int IdPuesto = 0;
            foreach (var user in usuarioData)
            {
                IdPuesto = user.trabajador.id_puesto_trabajo;
            }
            if (IdPuesto != Convert.ToInt32(hdfIDDel.Value))
            {
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
            }
            LlenarGridView();
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

        }

        #region  Exportar listas
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void incializarExports()
        {
            LlenarGridView();
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "Puesto_Trabajo", "Lista de Puestos de Trabajo");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "Puesto_Trabajo", "Lista de Puestos de Trabajo");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "Plan_Trabajo", "Lista de Puestos de Trabajo");
        }
        #endregion

        #region  Eventos del grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                

                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string idPuesto = Utilidades_GridView.DevolverIdRow(e, GridView1);

                idPuesto = objUtilidades.cifrarCadena(Convert.ToString(idPuesto));
                Response.Redirect(Paginas.Update_PuestoTrabajo.Value+"?id=" + idPuesto);
            }
            else if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string idPuesto = Utilidades_GridView.DevolverIdRow(e, GridView1);

                idPuesto = objUtilidades.cifrarCadena(Convert.ToString(idPuesto));
                Response.Redirect(Paginas.View_PuestoTrabajo.Value+"?id=" + idPuesto);
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario!=null)
            {
                if (ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdm_SucSeg())
                {
                    #region codigo
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        e.Row.Cells[8].Visible = false;
                    }
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        e.Row.Cells[8].Visible = false;
                    }
                    #endregion
                }
                else if (ObjUsuario.isAdm_SucSalud() || ObjUsuario.isAdmEmp_DptoSalud() || ObjUsuario.isResponsable())//Adm Emp
                {
                    #region codigo
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        e.Row.Cells[7].Visible = false;
                        e.Row.Cells[8].Visible = false;
                    }
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        e.Row.Cells[7].Visible = false;
                        e.Row.Cells[8].Visible = false;
                    }
                    #endregion
                }
            }
        }
        #endregion

        #region filtros
        protected void ddlTrabajadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTrabajadores.SelectedValue != string.Empty)
            {
                if (ddlTrabajadores.SelectedValue == "10")
                {
                    ViewState["Num1"] = "0";
                    ViewState["Num2"] = ddlTrabajadores.SelectedValue;
                }
                if (ddlTrabajadores.SelectedValue == "50")
                {
                    ViewState["Num1"] = "10";
                    ViewState["Num2"] = ddlTrabajadores.SelectedValue;
                }
                if (ddlTrabajadores.SelectedValue == "100")
                {
                    ViewState["Num1"] = "50";
                    ViewState["Num2"] = ddlTrabajadores.SelectedValue;
                }
                if (ddlTrabajadores.SelectedValue == "101")
                {
                    ViewState["Num1"] = "101";
                    ViewState["Num2"] = "10000";
                }
            }
            else
            {
                ViewState["Num1"] = string.Empty;
                ViewState["Num2"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                Mgr_Area.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));

                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                ViewState["area"] = ddlArea.SelectedValue;
            }
            else
            {
                ViewState["area"] = "0";
            }
            LlenarGridView();
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
    }
}