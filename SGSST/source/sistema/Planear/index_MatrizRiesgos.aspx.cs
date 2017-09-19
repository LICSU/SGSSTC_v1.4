using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_MatrizRiesgos : Page
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

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!BoolEmpSuc.Item1 && BoolEmpSuc.Item2)
            {
                estatus = Convert.ToString(Getter.AvgPorcEstRieEmp(ObjUsuario.Id_empresa));
            }

            if (!IsPostBack)
            {
                ViewState["buscar"] = string.Empty;
                CargarListas();
                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            string tipoRiesgo = string.Empty + ViewState["tipoRiesgo"];

            Tabla.MatrizRiesgo(GridView1, IdSucursal, IdEmpresa, tipoRiesgo, string.Empty + ViewState["buscar"]);

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

            Listas.Riesgos(ddlTipoRiesgo, "TipoRiesgo");

        }
        protected string CalcularEstatus()
        {
            if (!BoolEmpSuc.Item2)
            {
                estatus = Convert.ToString(Getter.AvgPorcEstRieSuc(ObjUsuario.Id_sucursal));
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

                string idRiesgos = objUtilidades.cifrarCadena((gvrow.FindControl("id_identificacion_peligro") as Label).Text);
                string IdSucursal = objUtilidades.cifrarCadena((gvrow.FindControl("id_sucursal") as Label).Text);

                Response.Redirect(Paginas.Update_MedidasMatrizRiesgos.Value + "?id=" + idRiesgos + "&suc=" + IdSucursal);
            }
            else if (e.CommandName.Equals("asignar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string id_ide_puesto = (gvrow.FindControl("id_ide_puesto") as Label).Text;

                string idCifrado = objUtilidades.cifrarCadena(id_ide_puesto);
                Response.Redirect(Paginas.Create_EvaluacionRiesgos.Value + "?id=" + idCifrado);
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario != null)
            {
                if (ObjUsuario.isAdmEmp_DptoSalud() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
                {
                    //GridView1.Columns[6].Visible = false;
                }
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Evaluacion = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Evaluacion"));

                if (Evaluacion == "Sin Evaluación")
                {
                    e.Row.Cells[9].Controls.Clear();
                }
                else if (Evaluacion == "Con Evaluación")
                {
                    e.Row.Cells[8].Controls.Clear();
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
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                estatus = Convert.ToString(Getter.AvgPorcEstRieEmp(Convert.ToInt32(ddlEmpresa.SelectedValue)));
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
                estatus = Convert.ToString(Getter.AvgPorcEstRieSuc(Convert.ToInt32(ddlSucursal.SelectedValue)));
            }
            else
            {
                ViewState["sucursal"] = "0";
                if (BoolEmpSuc.Item1)
                {
                    estatus = Convert.ToString(Getter.AvgPorcEstRieEmp(Convert.ToInt32(ddlEmpresa.SelectedValue)));
                }
                else
                {
                    estatus = Convert.ToString(Getter.AvgPorcEstRieEmp(ObjUsuario.Id_empresa));
                }
            }
            LlenarGridView();
        }
        protected void ddlTipoRiesgo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoRiesgo.SelectedValue != string.Empty)
            {
                ViewState["tipoRiesgo"] = string.Empty + ddlTipoRiesgo.SelectedItem;
            }
            else
            {
                ViewState["tipoRiesgo"] = string.Empty;
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