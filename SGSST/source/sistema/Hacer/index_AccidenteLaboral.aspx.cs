using Capa_Datos;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
    public partial class index_AccidenteLaboral : System.Web.UI.Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            //phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;


            DateTime fechaActual = DateTime.Now;
            ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
            ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

            if (!IsPostBack)
            {
                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");
                ViewState["area"] = "0";
                LlenarGridView();
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
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Accidente_General(
                GridView1,
                IdEmpresa,
                IdSucursal,
                string.Empty + ViewState["area"],
                string.Empty + ViewState["search"],
                string.Empty + ViewState["FechaInicio"],
                " " + ViewState["FechaFin"]);

        }
        #endregion

        #region acciones
        protected void btn_Agregar(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_AccidenteLaboral.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            at_it_el_pa tabla = new at_it_el_pa();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));

            LlenarGridView();
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            if (fuComunicado.FileName != string.Empty)
            {
                string ruta = Utilidades.GuardarArchivo(fuComunicado, hdfIDEsc.Value + "ArchivoAccidente", "~/archivos/accidentes/");

                GrupoLiEntities contexto = new GrupoLiEntities();
                int id_Acc = Convert.ToInt32(hdfIDEsc.Value);
                at_it_el_pa Edit = contexto.at_it_el_pa.SingleOrDefault(b => b.id_at_it_el_pa == id_Acc);

                if (Edit != null)
                {
                    Edit.documento_comunicado = ruta;
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            }

            if (fuReporte.FileName != string.Empty)
            {
                string ruta = Utilidades.GuardarArchivo(fuReporte, hdfIDEsc.Value + "ArchivoComunicado", "~/archivos/accidentes/");

                GrupoLiEntities contexto = new GrupoLiEntities();
                int idAcc = Convert.ToInt32(hdfIDEsc.Value);
                at_it_el_pa Edit = contexto.at_it_el_pa.SingleOrDefault(b => b.id_at_it_el_pa == idAcc);

                if (Edit != null)
                {
                    Edit.reporte_accidente = ruta;
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto);
            }

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }
        protected void btnAsigcon_Click(object sender, EventArgs e)
        {
            /*GrupoLiEntities contexto = new GrupoLiEntities();
            int id_Acc = Convert.ToInt32(hdfAsigCon.Value);
            acc_inc_lab Edit = contexto.acc_inc_lab.SingleOrDefault(b => b.id_acc_lab == id_Acc);

            if (Edit != null)
            {
                Edit.num_consultas = txtNumConsultas.Text;
                Edit.frecuencia_consulta = txtFeConsultas.Text;
            }

            ObjUsuario.Error = Modelo_CRUD.Edit_Fila(contexto);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();*/
        }
        private void cargarValoresIniciales()
        {/*
        List<acc_inc_lab> ListaAccidentesidente = new List<acc_inc_lab>();
        ListaAccidentesidente = Getter.Accidente(Convert.ToInt32(hdfAsigCon.Value));

        foreach (var item in ListaAccidentesidente)
        {
            lbTrabajadorEdit.Text = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
            lbFechaAccEdit.Text = Convert.ToString(item.fecha_acc);
            string feConsultas = item.frecuencia_consulta;

            if (Convert.ToInt32(feConsultas) > 0)
            {
                txtFeConsultas.Enabled = false;
                txtNumConsultas.Enabled = false;
                btnAsigcon.Visible = false;
            }
            else
            {
                txtFeConsultas.Enabled = true;
                txtNumConsultas.Enabled = true;
                btnAsigcon.Visible = true;
            }
            if (feConsultas != "-1")
            {
                txtFeConsultas.Text = feConsultas;
                txtNumConsultas.Text = item.num_consultas;
            }
        }
        */
        }
        protected void btPrint_Click(object sender, EventArgs e)
        {
            String[] valores = {
                string.Empty + ViewState["Imprimir"]
            };
            PrintFile.PrintAccidenteLaboral(valores, this);
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
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "Accidente_Laboral", "Lista de Accidentes Laborales");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "Accidente_Laboral", "Lista de Accidentes Laborales");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "Accidente_Laboral", "Lista de Accidentes Laborales");
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));
                
                Response.Redirect(Paginas.View_Accidente.Value +"?id=" + hdfIDDel.Value);
            }
            else if (e.CommandName.Equals(ComandosGrid.Imprimir.Value))
            {
                
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));
                Response.Redirect(Paginas.View_Accidente.Value + "?id=" + hdfIDDel.Value + "&Print=si");
            }
            else if (e.CommandName.Equals(ComandosGrid.Comunicado.Value))
            {
                
                hImprimir.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                ViewState["Imprimir"] = string.Empty + hImprimir.Value;
                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals(ComandosGrid.Upload.Value))
            {
                
                hdfIDEsc.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
            }
            else if (e.CommandName.Equals(ComandosGrid.Scan.Value))
            {
                
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                hplComunicado.NavigateUrl = (GridView1.Rows[RowIndex].FindControl("lbComunicado") as Label).Text;
                hplReporte.NavigateUrl = (GridView1.Rows[RowIndex].FindControl("lbreporte_accidente") as Label).Text;
           
                Modal.registrarModal("VerDocModal", "VerDocModalModalScript", this);
            }
            else if (e.CommandName.Equals(ComandosGrid.ConsultaMedica.Value))
            {
                
                hdfAsigCon.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                cargarValoresIniciales();
                Modal.registrarModal("AsigConModal", "AsigConModalModalScript", this);
            }
            else if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                
                string id = Utilidades_GridView.DevolverIdRow(e, GridView1);
                id = objUtilidades.cifrarCadena(id);                
                Response.Redirect(Paginas.Update_Accidentes.Value + "?id=" + id);
            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {/*
            if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_Empresa())//Adm Emp
            {
                GridView1.Columns[12].Visible = false;
            }
            if (ObjUsuario.isAdm_SucSeg() || ObjUsuario.isAdmEmp_DptoSeg())//Dpto Seg
            {
                GridView1.Columns[12].Visible = false;
            }*/
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();

        }
        #endregion

        #region filtros
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int _id = 0;
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                _id = Convert.ToInt32(ddlSucursal.SelectedValue);
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                Listas.Area_Sucursal(ddlArea, _id);
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
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