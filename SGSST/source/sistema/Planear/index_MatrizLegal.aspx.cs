using System;
using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Norma;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_MatrizLegal : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private string estatus = "0";
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!BoolEmpSuc.Item1 && BoolEmpSuc.Item2)
            {
                estatus = Convert.ToString(Mgr_Norma.AvgEstNorEmp(ObjUsuario.Id_empresa));
            }

            if (!IsPostBack)
            {
                LlenarGridView();
                CargarListas();
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Mgr_Norma.MatrizLegal(
                GridView1,
                IdSucursal,
                string.Empty + ViewState["TipoNorma"],
                string.Empty + ViewState["AñoNorma"],
                string.Empty + ViewState["buscar"],
                IdEmpresa);
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
                Listas.AnhoNorma(ddlAñoNorma, ObjUsuario.Id_sucursal);
            }

        }
        protected string CalcularEstatus()
        {
            if (!BoolEmpSuc.Item2)
            {
                estatus = Convert.ToString(Mgr_Norma.AvgEstatusNorma(ObjUsuario.Id_sucursal));
            }
            return estatus;
        }
        #endregion

        #region acciones grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("seguimiento"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                string idNorma = objUtilidades.cifrarCadena((gvrow.FindControl("id_norma") as Label).Text);
                string IdSucursal = objUtilidades.cifrarCadena((gvrow.FindControl("id_sucursal") as Label).Text);
                
                Response.Redirect(Paginas.Update_MedidasMatrizLegal.Value+"?id=" + idNorma + "&suc=" + IdSucursal);
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario != null) {
                if (ObjUsuario.isAdmEmp_DptoSalud() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
                {
                    GridView1.Columns[7].Visible = false;
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
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                estatus = Convert.ToString(Mgr_Norma.AvgEstNorEmp(Convert.ToInt32(ddlEmpresa.SelectedValue)));
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
                Listas.AnhoNorma(ddlAñoNorma, Convert.ToInt32(ddlSucursal.SelectedValue));
                estatus = Convert.ToString(Mgr_Norma.AvgEstatusNorma(Convert.ToInt32(ddlSucursal.SelectedValue)));
            }
            else
            {
                ViewState["sucursal"] = "0";
                if (BoolEmpSuc.Item1)
                {
                    estatus = Convert.ToString(Mgr_Norma.AvgEstNorEmp(Convert.ToInt32(ddlEmpresa.SelectedValue)));
                }
                else
                {
                    estatus = Convert.ToString(Mgr_Norma.AvgEstNorEmp(ObjUsuario.Id_empresa));
                }
            }
            LlenarGridView();
        }

        protected void ddlTipoNorma_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoNorma.SelectedValue != string.Empty)
            {
                ViewState["TipoNorma"] = ddlTipoNorma.SelectedValue;
            }
            else
            {
                ViewState["TipoNorma"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlAñoNorma_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAñoNorma.SelectedValue != string.Empty)
            {
                ViewState["AñoNorma"] = ddlAñoNorma.SelectedValue;
            }
            else
            {
                ViewState["AñoNorma"] = string.Empty;
            }
            LlenarGridView();

        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["buscar"] = txtBuscar.Text;
            }
            else
            {
                ViewState["buscar"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}