using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Epp;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Epp : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);
            
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
                Mgr_Epp.List_TipoEpp(ddlTipoEppAdd);
                Mgr_Epp.List_TipoEpp(ddlTipoEppEdit);
            }
            Mgr_Epp.List_TipoEpp(ddlTipoEpp);
        }

        private void LlenarGridView()
        {
            int Idempresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));

            Mgr_Epp.Grid_Epp(GridView1,string.Empty + ViewState["tipo_epp"],string.Empty + ViewState["sWhere"]);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            epp nuevo = new epp()
            {
                nombre = txtNombreAdd.Text,
                id_tipo_epp = Convert.ToInt32(ddlTipoEppAdd.SelectedValue)
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();

        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idEpp = Convert.ToInt32(hdfIdEppEdit.Value);
            epp Edit = contexto.epp.SingleOrDefault(b => b.id_epp == idEpp);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_tipo_epp = Convert.ToInt32(ddlTipoEppEdit.SelectedValue);
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();

        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            epp tabla = new epp();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDEppDel.Value));
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region metodos Grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIDEppDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
            else if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIdEppEdit.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                txtNombreEdit.Text = (gvrow.FindControl("nombre") as Label).Text;

                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
        }
        #endregion

        #region filtros
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
        protected void ddlTipoEpp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoEpp.SelectedValue != string.Empty)
            {
                ViewState["tipo_epp"] = ddlTipoEpp.SelectedValue;
            }
            else
            {
                ViewState["tipo_epp"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}