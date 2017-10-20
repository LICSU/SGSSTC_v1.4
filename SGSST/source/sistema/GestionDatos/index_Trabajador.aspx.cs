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
using Capa_Datos.Manager.Estatus;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Trabajador : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Utilidades objUtilidades = new Utilidades();
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index    
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;

            if (ObjUsuario.isAdm_Sucursal())
            {
                phAgregar.Visible = true;
            }
            if (!IsPostBack)
            {
                ViewState["area"] = "0";
                CargarListas();
                LlenarGridView();
                if (Request.QueryString["eu"] == "1")
                {
                    Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
                }
            }

        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresasFiltro);
            }
            else
            {
                Mgr_Sucursal.Sucursal(ddlSucursalFiltro, ObjUsuario.Id_empresa);
                Mgr_Area.Area_Sucursal(ddlAreaFiltro, ObjUsuario.Id_empresa);
                Mgr_Estatus.Estatus_Empresa(ddlEstatusFiltro, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Mgr_Area.Area_Sucursal(ddlAreaFiltro, ObjUsuario.Id_sucursal);
                Mgr_Estatus.Estatus_Empresa(ddlEstatusFiltro, ObjUsuario.Id_empresa);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Mgr_Trabajador.Trabajador(GridView1, Capa_Datos.Manager.Usuario.Mgr_Usuario.UsuarioTrabajador(ObjUsuario.Id_usuario), IdEmpresa, string.Empty + base.ViewState["area"],
                string.Empty + base.ViewState["estatus"], string.Empty + base.ViewState["sWhere"], IdSucursal);
        }
        #endregion

        #region acciones Grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIdTrabajadorView.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                ConsultarTrabajador(hdfIdTrabajadorView.Value);
                Modal.registrarModal("viewModal", "ViewModalScript", this);

            }
            else if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {


                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string TrabajadorID = Utilidades_GridView.DevolverIdRow(e, GridView1);

                TrabajadorID = objUtilidades.cifrarCadena(Convert.ToString(TrabajadorID));
                Response.Redirect(Paginas.Update_Trabajador.Value + "?id=" + TrabajadorID);
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfTrabajadorIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);

            }
            else if (e.CommandName.Equals(ComandosGrid.AddReposo.Value))
            {

                hdfTrabajadorEstID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("agregarReposo", "EstatusModalScript", this);

            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario != null)
            {
                if (ObjUsuario.isAdmEmp_DptoSalud() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
                {
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        e.Row.Cells[6].Visible = false;
                        e.Row.Cells[8].Visible = false;
                        e.Row.Cells[9].Visible = false;
                        e.Row.Cells[10].Visible = false;
                    }
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        e.Row.Cells[6].Visible = false;
                        e.Row.Cells[8].Visible = false;
                        e.Row.Cells[9].Visible = false;
                        e.Row.Cells[10].Visible = false;
                    }
                }
            }
        }
        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_Trabajador.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            trabajador tabla = new trabajador();
            ObjUsuario.Error = Capa_Datos.CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfTrabajadorIDDel.Value));
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void btDescargar_Click(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        protected void ConsultarTrabajador(string ID)
        {
            List<trabajador> ListaTrabajador = new List<trabajador>();
            int idTrabajador = Convert.ToInt32(ID);
            ListaTrabajador = Mgr_Trabajador.Trabajador(idTrabajador);

            foreach (var itemTrabajador in ListaTrabajador)
            {
                txtNombres.Text = itemTrabajador.primer_nombre + " " + itemTrabajador.primer_apellido;
                txtCedula.Text = itemTrabajador.cedula;
                txtEmail.Text = itemTrabajador.email;
                txtFechaN.Text = Convert.ToDateTime(itemTrabajador.fecha_nacimiento).ToString("dd-MM-yyy");
                txtEdoCivil.Text = itemTrabajador.edo_civil;
                txtSexo.Text = itemTrabajador.sexo;
                txtTelefono.Text = itemTrabajador.telefono_casa;
                txtCelular.Text = itemTrabajador.telefono_movil;
                txtRegion.Text = itemTrabajador.municipio.departamento.Region.nombre;
                txtDireccion.Text = itemTrabajador.direccion;
                txtMunicipio.Text = itemTrabajador.municipio.nombre;
                txtDepartamento.Text = itemTrabajador.municipio.departamento.nombre;
                txtEmpresa.Text = itemTrabajador.puesto_trabajo.area.sucursal.empresa.nombre;
                txtPuesto.Text = itemTrabajador.puesto_trabajo.nombre;
                txtSucursal.Text = itemTrabajador.puesto_trabajo.area.sucursal.nombre;

                if (itemTrabajador.foto != string.Empty)
                {
                    imgLogo.ImageUrl = itemTrabajador.foto;
                }
                else
                {
                    imgLogo.ImageUrl = "~/archivos/foto_perfil/usuario.png";
                }
                imgLogo.Width = 200;
                imgLogo.Height = 200;

                if (itemTrabajador.id_ccf == 0)
                {
                    txtCcf.Text = "sin asignar";
                }
                else
                {
                    txtCcf.Text = itemTrabajador.ccf.nombre;
                }
            }
        }
        protected void btnGuardarReposo_Click(object sender, EventArgs e)
        {
            DateTime fechaActual = DateTime.Now;
            string id_trabajador = hdfTrabajadorEstID.Value;
            string fecha_constancia = txtFechaConstancia.Text;
            int diasReposo = Convert.ToInt32(txtDiasReposo.Text);
            fechaActual = DateTime.Today.Date;
            string tpo_enfermedad = "" + ViewState["tpo_enfermedad"];
            string url_constancia = "";
            int enfermedad_id = 0;
            int sistema_id = 0;

            if (fuConstancia.FileName != string.Empty)
            {
                url_constancia = fuConstancia.FileName;
            }

            if (ddlEnfermedadReposo.SelectedValue != string.Empty)
            {
                enfermedad_id = Convert.ToInt32(ddlEnfermedadReposo.SelectedValue);
            }
            if (ddlSistemaReposo.SelectedValue != string.Empty)
            {
                sistema_id = Convert.ToInt32(ddlSistemaReposo.SelectedValue);
            }

            if (ViewState["tpo_enfermedad"].ToString() != string.Empty)
            {
                tpo_enfermedad = ViewState["tpo_enfermedad"].ToString();
            }
            else
            {
                tpo_enfermedad = "OTRO";
            }

            string ruta = Utilidades.GuardarArchivo(fuConstancia, id_trabajador + "ConstanciaReposo", "~/archivos/constancias/");

            trabajador_estatus nuevo = new trabajador_estatus()
            {
                id_estatus = 1,
                id_trabajador = Convert.ToInt32(id_trabajador),
                fecha_registro = fechaActual,
                motivo = "REPOSO",
                id_enfermedad = Convert.ToInt32(enfermedad_id),
                id_sistema = Convert.ToInt32(sistema_id),
                url_constancia = ruta,
                fecha_constancia = Convert.ToDateTime(fecha_constancia),
                dias_reposo = diasReposo,
                tpo_enfermedad = tpo_enfermedad
            };

            ObjUsuario.Error = Capa_Datos.CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();

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
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
            GridView1.Columns[8].Visible = false;
            GridView1.Columns[9].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "ListadeTrabajadores", "Lista de Trabajadores", "rojo");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "ListadeTrabajadores", "Lista de Trabajadores", "azul");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            GridView1.Rows[1].ControlStyle.BackColor = System.Drawing.Color.Black;
            GridView1.Rows[1].ControlStyle.CssClass = "text-center";
            ManageFiles.ExportToPdf(this, GridView1, "ListadeTrabajadores", "Lista de Trabajadores", "azul");
        }
        #endregion

        #region filtros
        protected void ddlEmpresasFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresasFiltro.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursalFiltro, Convert.ToInt32(ddlEmpresasFiltro.SelectedValue));
                Mgr_Area.Area_Sucursal(ddlAreaFiltro, Convert.ToInt32(ddlEmpresasFiltro.SelectedValue));
                Mgr_Estatus.Estatus_Empresa(ddlEstatusFiltro, Convert.ToInt32(ddlEmpresasFiltro.SelectedValue));
                ViewState["empresa"] = ddlEmpresasFiltro.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlSucursalFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalFiltro.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursalFiltro.SelectedValue;
                Mgr_Area.Area_Sucursal(ddlAreaFiltro, Convert.ToInt32(ddlSucursalFiltro.SelectedValue));
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlAreaFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAreaFiltro.SelectedValue != string.Empty)
            {
                ViewState["area"] = ddlAreaFiltro.SelectedValue;
            }
            else
            {
                ViewState["area"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlEstatusFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEstatusFiltro.SelectedValue != string.Empty)
            {
                ViewState["estatus"] = ddlEstatusFiltro.SelectedValue;
            }
            else
            {
                ViewState["estatus"] = string.Empty;
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
        protected void rblReposo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblReposo.SelectedValue.Equals("Si"))
            {
                phDiasReposo.Visible = true;
            }
            else
            {
                phDiasReposo.Visible = false;
            }
        }
        protected void rblDiagnostico_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblDiagnostico.SelectedValue.Equals("O"))
            {
                phOtroDiagnostico.Visible = true;
                phEnfermedadLaboral.Visible = false;
                phAccidenteComun.Visible = false;
                phPEE.Visible = false;
            }
            else
            {
                phOtroDiagnostico.Visible = false;

                if (rblDiagnostico.SelectedValue.Equals("EL"))
                {
                    lblEnfermedad.Text = "Enfermedad Laboral";
                    Listas.EnfermedadLaboral(ddlEnfermedadReposo);
                    Listas.Sistema(ddlSistemaReposo);
                    ViewState["tpo_enfermedad"] = "ENFERMEDAD LABORAL";
                    phEnfermedadLaboral.Visible = true;
                    phAccidenteComun.Visible = false;
                    phPEE.Visible = false;
                }
                else if (rblDiagnostico.SelectedValue.Equals("EC"))
                {
                    lblEnfermedad.Text = "Enfermedad Común";
                    Listas.EnfermedadComun(ddlEnfermedadReposo);
                    Listas.Sistema(ddlSistemaReposo);
                    ViewState["tpo_enfermedad"] = "ENFERMEDAD COMUN";
                    phEnfermedadLaboral.Visible = true;
                    phAccidenteComun.Visible = false;
                    phPEE.Visible = false;
                }
                else if (rblDiagnostico.SelectedValue.Equals("AC"))
                {
                    ViewState["tpo_enfermedad"] = "ACCIDENTE COMUN";
                    lbAcc.Text = "Accidente Común";
                    phAccidenteComun.Visible = true;
                    phPEE.Visible = false;
                    phEnfermedadLaboral.Visible = false;
                }
                else if (rblDiagnostico.SelectedValue.Equals("AL"))
                {
                    ViewState["tpo_enfermedad"] = "ACCIDENTE LABORAL";
                    lbAcc.Text = "Accidente Laboral";
                    phAccidenteComun.Visible = true;
                    phPEE.Visible = false;
                    phEnfermedadLaboral.Visible = false;
                }
                else if (rblDiagnostico.SelectedValue.Equals("PEL"))
                {
                    Listas.EnfermedadComun(ddlEnfermedadLaboral);
                    ViewState["tpo_enfermedad"] = "POSIBLE ENFERMEDAD LABORAL";
                    phAccidenteComun.Visible = false;
                    phEnfermedadLaboral.Visible = false;
                    phPEE.Visible = true;
                }
            }
        }
        #endregion

    }
}