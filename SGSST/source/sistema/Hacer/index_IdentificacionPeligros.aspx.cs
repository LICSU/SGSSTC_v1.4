using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Riesgos;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_IdentificacionPeligros : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ViewState["sWhere"] = string.Empty;
                LlenarGridView();
                CargarListas();
            }
        }
        private void LlenarGridView()
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Mgr_Riesgos.Grid_IdentificacionPeligro(
                GridView1,
                IdSucursal,
                string.Empty + ViewState["sWhere"]);
        }
        private void CargarListas()
        {
            Mgr_Empresa.Lista_Empresa(ddlEmpresa);

            if (!BoolEmpSuc.Item1)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }
        protected void AgregarRegistro(object sender, EventArgs e)
        {            
            Response.Redirect(Paginas.Create_IdentificacionPeligro.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            identificacion_peligro tabla = new identificacion_peligro();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
            LlenarGridView();
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        protected void btPrint_Click(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                ViewState["Imprimir"].ToString()
            };
            Modal.CerrarModal("printModal", "printModalScript", this);
            PrintFile.PrintIdentificacionPeligro(valores, this);
            
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
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);

                
            }
            else if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                string idRiesgos = Utilidades_GridView.DevolverIdRow(e, GridView1);

                idRiesgos = objUtilidades.cifrarCadena(idRiesgos);

                Response.Redirect(Paginas.View_IdentificacionPeligros.Value+"?id=" + idRiesgos);
            }
            else if (e.CommandName.Equals(ComandosGrid.Imprimir.Value))
            {
                

                hImprimir.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);

            }

        }
        #endregion

        #region flitros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";
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