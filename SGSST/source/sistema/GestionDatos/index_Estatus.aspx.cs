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

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Estatus : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);


            if (!IsPostBack)
            {
                CargarListas();
                CargarControles();
            }
            LlenarGridView();

        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaAdd);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaEdit);
            }
        }

        private void CargarControles()
        {
            phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;

        }

        private void LlenarGridView()
        {
            int Idempresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));

            Tabla.Estatus(GridView1, Idempresa, string.Empty + ViewState["sWhere"]);

        }
        #endregion

        #region Metodos Grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfEstatusID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                var _Estatus = Getter.Estatus(Convert.ToInt32(hdfEstatusID.Value));

                txtNombreEdit.Text = _Estatus.nombre;
                txtDescripcionEdit.Text = _Estatus.descripcion;
                ddlEmpresaEdit.SelectedValue = Convert.ToString(_Estatus.id_empresa);

                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfEstatusIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

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
            if (ObjUsuario != null)
            {
                if (ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
                {
                    GridView1.Columns[4].Visible = false;
                    GridView1.Columns[5].Visible = false;
                }
                if (ObjUsuario.isAdm_SucSeg() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
                {
                    GridView1.Columns[4].Visible = false;
                    GridView1.Columns[5].Visible = false;
                }
            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int IdEmpresa = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id_empresa"));

                if (IdEmpresa == 1)
                {
                    e.Row.Cells[4].Controls.Clear();
                    e.Row.Cells[5].Controls.Clear();
                }
            }
        }
        #endregion

        #region acciones
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);

            estatus nuevo = new estatus()
            {
                nombre = txtNombreAdd.Text,
                descripcion = txtDescripcionAdd.Text,
                id_empresa = IdEmpresa
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            Modal.CerrarModal("addModal", "AddModalScript", this);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);

            LlenarGridView();
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idEstatus = Convert.ToInt32(hdfEstatusID.Value);
            estatus Edit = contexto.estatus.SingleOrDefault(b => b.id_estatus == idEstatus);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.descripcion = txtDescripcionEdit.Text;
                Edit.id_empresa = IdEmpresa;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);
            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            estatus tabla = new estatus();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfEstatusIDDel.Value));
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
        #endregion
    }
}