using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Trabajador;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSST.source.sistema.Planear
{
    public partial class index_DocumentoCorrespondencia : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                ViewState["sWhere"] = string.Empty;
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
            }
            
            if (!BoolEmpSuc.Item2)
            {
                Mgr_Trabajador.PerfilCargo(ddlCargo, ObjUsuario.Id_empresa);
                Mgr_Trabajador.PerfilCargo(ddlCargoAdd, ObjUsuario.Id_empresa);
            }
        }
        private void LlenarGridView()
        {
            Mgr_Trabajador.PerfilMedico(GridView1, Convert.ToInt32(ViewState["empresa"]), Convert.ToInt32(ViewState["cargo"]), string.Empty + ViewState["sWhere"]);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Trabajador.PerfilCargo(ddlCargo, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = 0;
            }
            LlenarGridView();
        }

        protected void MostrarModalCrear(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_DocumentoCorrespondencia.Value);
        }

        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void Guardar(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;
            if (BoolEmpSuc.Item1)
                IdEmpresa = Convert.ToInt32(ddlEmpresaAdd.SelectedValue);

            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + "_PerfilMedico_" + IdEmpresa, "~/archivos/perfilmedico/");

            perfil_medico nuevo = new perfil_medico()
            {
                nombre = txtNombre.Text,
                id_empresa = IdEmpresa,
                ruta = _ruta,
                descripcion = txtDescripcion.Text,
                id_cargo = Convert.ToInt32(ddlCargoAdd.SelectedValue)
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
            Modal.CerrarModal("addModal", "AddModalScript", this);
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }

        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Mgr_Trabajador.PerfilCargo(ddlCargoAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            perfil_medico tabla = new perfil_medico();

            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        protected void ddlCargo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCargo.SelectedValue != string.Empty)
            {
                ViewState["cargo"] = ddlCargo.SelectedValue;
            }
            else
            {
                ViewState["cargo"] = 0;
            }
            LlenarGridView();
        }
    }
}