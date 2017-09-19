using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Index_Extintor : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);


            if (!IsPostBack)
            {
                ViewState["area"] = "0";
                CargarListas();
                CargarControles();
                LlenarGridView();
            }
        }

        private void CargarControles()
        {
            phAgregar.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;

            if (ObjUsuario.isAdm_Sucursal())
            {
                phAgregar.Visible = true;
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpresaAdd);
                Listas.Empresa(ddlEmpresaEdit);
            }
            else
            {
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);
            }


            if (!BoolEmpSuc.Item2)
            {
                Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
                Listas.Area_Sucursal(ddlAreaAdd, ObjUsuario.Id_sucursal);
                Listas.Area_Sucursal(ddlAreasEdit, ObjUsuario.Id_sucursal);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            string IdArea = string.Empty + ViewState["area"];

            Tabla.Extintores(GridView1, IdEmpresa, IdSucursal, IdArea, string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);

        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);

        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            extintor nuevo = new extintor()
            {
                serial_extintor = txtSerial.Text,
                fecha_ultima_recarga = Convert.ToDateTime(txtFechaUltRec.Text).Date,
                fecha_proxima_recarga = Convert.ToDateTime(txtFechaProxRec.Text).Date,
                peso = txtPeso.Text,
                presion = txtPresion.Text,
                tipo_extintor = ddlTipoExt.SelectedValue,
                nombre_empresa = txtNombreEmpresa.Text,
                id_area = Convert.ToInt32(ddlAreaAdd.SelectedValue)
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                alarma nueva_alarma = new alarma()
                {
                    descripcion = "Proxima fecha de recarga para el extintor: " + txtSerial.Text,
                    fecha = Convert.ToDateTime(txtFechaProxRec.Text).Date,
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = ObjUsuario.Id_usuario
                };
                ObjUsuario.Error = CRUD.Add_Fila(nueva_alarma, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                if (ObjUsuario.Error)
                {
                    Modal.CerrarModal("addModal", "AddModalScript", this);
                    Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
                    LlenarGridView();
                }
            }
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idExtintor = Convert.ToInt32(hdfExtintorIDEdit.Value);
            extintor Edit = contexto.extintor.SingleOrDefault(b => b.id_extintor == idExtintor);

            if (Edit != null)
            {
                Edit.serial_extintor = txtSerialEdit.Text;
                Edit.fecha_ultima_recarga = Convert.ToDateTime(txtFechaUltRecEdit.Text).Date;
                Edit.fecha_proxima_recarga = Convert.ToDateTime(txtFechaProxRecEdit.Text).Date;
                Edit.peso = txtPesoEdit.Text;
                Edit.presion = txtPresionEdit.Text;
                Edit.tipo_extintor = ddlTipoExtEdit.SelectedValue;
                Edit.nombre_empresa = txtNombreEmpresaEdit.Text;
                Edit.id_area = Convert.ToInt32(ddlAreasEdit.SelectedValue);
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
            CargarListas();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            extintor tabla = new extintor();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfExtintorIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
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
        }

        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "ListadeExtintores", "Lista de Extintores");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "ListadeExtintores", "Lista de Extintores");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "ListadeExtintores", "Lista de Extintores");
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfExtintorIDEdit.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);


                List<extintor> ListaExtintor = new List<extintor>();
                ListaExtintor = Getter.Extintor(Convert.ToInt32(hdfExtintorIDEdit.Value));

                foreach (var item in ListaExtintor)
                {
                    int IdEmpresa = Convert.ToInt32(item.area.sucursal.id_empresa);
                    int IdSucursal = Convert.ToInt32(item.area.sucursal.id_sucursal);

                    Listas.Empresa(ddlEmpresaEdit);
                    ddlEmpresaEdit.SelectedValue = string.Empty + IdEmpresa;

                    Listas.Sucursal(ddlSucursalEdit, IdEmpresa);
                    ddlSucursalEdit.SelectedValue = string.Empty + IdSucursal;

                    Listas.Area_Sucursal(ddlAreasEdit, IdSucursal);
                    ddlAreasEdit.SelectedValue = string.Empty + item.id_area;

                    txtSerialEdit.Text = item.serial_extintor.ToString();

                    string fecha1 = item.fecha_ultima_recarga.ToString();
                    DateTime date1 = Convert.ToDateTime(fecha1).Date;
                    txtFechaUltRecEdit.Text = date1.ToString("yyyy-MM-dd");

                    fecha1 = item.fecha_proxima_recarga.ToString();
                    date1 = Convert.ToDateTime(fecha1).Date;
                    txtFechaProxRecEdit.Text = date1.ToString("yyyy-MM-dd");

                    txtPesoEdit.Text = item.peso;
                    txtPresionEdit.Text = item.presion;
                    txtNombreEmpresaEdit.Text = item.nombre_empresa;

                    ddlTipoExtEdit.SelectedValue = item.tipo_extintor;

                }

                Modal.registrarModal("editModal", "EditModalScript", this);


            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfExtintorIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

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
        }
        #endregion

        #region filtros
        protected void ddlEmpresaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaEdit.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(ddlEmpresaEdit.SelectedValue));
            }
            LlenarGridView();
        }
        protected void ddlSucursalEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalEdit.SelectedValue != string.Empty)
            {
                Listas.Area_Sucursal(ddlAreasEdit, Convert.ToInt32(ddlSucursalEdit.SelectedValue));
            }
        }
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
            LlenarGridView();
        }
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                Listas.Area_Sucursal(ddlAreaAdd, Convert.ToInt32(ddlSucursalAdd.SelectedValue));
            }
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                Listas.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
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