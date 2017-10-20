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
    public partial class Index_Tipo_EPP :Page
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
            ddlEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phempresaEdit.Visible = BoolEmpSuc.Item1;
            ddlEmpresaEdit.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
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
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            Tabla.TipoEpp(GridView1, string.Empty + ViewState["sWhere"]);
        }

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            
            Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            string ruta = Utilidades.GuardarArchivo(flpArchivo, txtNombreEdit.Text, "~/archivos/ico_tipo_epp/");
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);

            tipo_epp nuevo = new tipo_epp()
            {
                nombre = txtNombreAdd.Text,
                nombre_senal = txtNombreSenalAdd.Text,
                url_senal = ruta
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            string ruta = string.Empty;
            if (flpArchivoEdit.HasFile)
                ruta = Utilidades.GuardarArchivo(flpArchivoEdit, txtNombreEdit.Text, "~/archivos/ico_tipo_epp/");

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idTipoEpp = Convert.ToInt32(hdfIdEppEdit.Value);
            tipo_epp Edit = contexto.tipo_epp.SingleOrDefault(b => b.id_tipo_epp == idTipoEpp);

            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.nombre_senal = txtNombreSenalEdit.Text;
                if (ruta.Length > 0)
                    Edit.url_senal = ruta;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            tipo_epp tabla = new tipo_epp();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDEppDel.Value));
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
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

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlEmpresaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {

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
                txtNombreSenalEdit.Text = (gvrow.FindControl("nombre_senal") as Label).Text;
                imgSenal.ImageUrl = (gvrow.FindControl("url_senal") as Label).Text;
                ddlEmpresaEdit.SelectedValue = (gvrow.FindControl("id_empresa") as Label).Text;
                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
            else if (e.CommandName.Equals("verImagen"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                imgVer.ImageUrl = (gvrow.FindControl("url_senal") as Label).Text;
                Modal.registrarModal("verImagen", "ViewModalScript", this);
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            
        }
        #endregion
    }
}