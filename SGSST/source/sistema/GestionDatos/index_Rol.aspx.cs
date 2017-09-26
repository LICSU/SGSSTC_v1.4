using Capa_Datos;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Rol : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregarRol.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;
            ddlEmpresaEdit.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }

        private void CargarListas()
        {
            Listas.Empresa(ddlEmpresa);
            Listas.Empresa(ddlEmpresaAdd);
            Listas.Empresa(ddlEmpresaEdit);
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));

            Tabla.Rol(GridView1, IdEmpresa, string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region registro de los modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            //Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);
        }
        #endregion

        #region  aciones de editar insertar y eliminar
        protected void Guardar(object sender, EventArgs e)
        {
            int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);
            int _id_rol = GetterMax.Roles() + 1;

            rol nuevo = new rol()
            {
                id_rol = _id_rol,
                nombre = txtNombre.Text,
                id_empresa = IdEmpresa
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            Modal.CerrarModal("addModal", "AddModalScript", this);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idRol = Convert.ToInt32(hdfEditID.Value);
            rol Edit = contexto.rol.SingleOrDefault(b => b.id_rol == idRol);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_empresa = IdEmpresa;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);
            Modal.CerrarModal("editModal", "EditModalScript", this);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            rol tabla = new rol();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);

            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region  eventos del grid
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
                hdfEditID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                var _Rol = Getter.Rol(Convert.ToInt32(hdfEditID.Value));

                txtNombreEdit.Text = _Rol.nombre;
                ddlEmpresaEdit.SelectedValue = Convert.ToString(_Rol.id_empresa);

                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);                
            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario != null)
            {
                if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isResponsable())
                {
                    #region codigo
                    GridView1.Columns[3].Visible = false;
                    GridView1.Columns[4].Visible = false;
                    #endregion
                }
            }
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