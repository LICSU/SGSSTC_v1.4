using System;
using Capa_Datos;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Registro
{
    public partial class index : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phUsuario.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }
        private void CargarListas()
        {
            DateTime fechaActual = DateTime.Now;
            ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
            ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");
            txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
            txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

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
                Listas.Usuario_Sucursal(ddlUsuario, ObjUsuario.Id_sucursal);
            }
            Model_Bitacora.CargarListado_TipoEvento(ddlTipoEvento);
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Model_Bitacora.CargarGrid(
                GridView1,
                ObjUsuario.Id_usuario,
                IdSucursal,
                IdEmpresa,
                string.Empty + ViewState["tipoEvento"],
                string.Empty + ViewState["FechaInicio"],
                string.Empty + ViewState["FechaFin"]);
        }
        #endregion

        #region  eventos del grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        #endregion

        #region filtros
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
                Listas.Usuario_Sucursal(ddlUsuario, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
            else
            {
                ViewState["sucursal"] = "0";
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

        protected void ddlTipoEvento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoEvento.SelectedValue != string.Empty)
            {
                ViewState["tipoEvento"] = ddlTipoEvento.SelectedValue;
            }
            else
            {
                ViewState["tipoEvento"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlUsuario.SelectedValue != string.Empty)
            {
                ViewState["usuario"] = ddlUsuario.SelectedValue;
            }
            else
            {
                ViewState["usuario"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}