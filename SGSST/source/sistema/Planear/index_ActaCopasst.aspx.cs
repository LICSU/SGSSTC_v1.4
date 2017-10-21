using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.PoliticaSST;
using Capa_Datos.Manager.Documento;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_ActaCopasst : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

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
            Mgr_Documento.ReunionCopasst(GridView1, IdEmpresa, IdSucursal);
        }

        private void CargarListas()
        {
            Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);

            if (!BoolEmpSuc.Item1)
            {
                Mgr_Sucursal.Sucursal(ddlSucursalSubir, ObjUsuario.Id_empresa);
            }
        }
        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            switch (argument)
            {
                case "1":
                    Response.Redirect(Paginas.Create_ReunionCopasst.Value);
                    break;
                case "2":
                    Response.Redirect(Paginas.Create_DesignacionVigia.Value);
                    break;
                case "3":
                    Response.Redirect(Paginas.Create_ComunicadoElecciones.Value);
                    break;
                case "4":
                    Response.Redirect(Paginas.Create_InscripcionCandidatos.Value);
                    break;
                case "5":
                    Response.Redirect(Paginas.Create_FormatoVotos.Value);
                    break;
                case "6":
                    Response.Redirect(Paginas.Create_AperturaElecciones.Value);
                    break;
                case "7":
                    Response.Redirect(Paginas.Create_RegistroVotantes.Value); 
                    break;
                case "8":
                    Response.Redirect(Paginas.Create_ActaCierre.Value); 
                    break;
                case "9":
                    Response.Redirect(Paginas.Create_ResultadoVotos.Value); 
                    break;
                case "10":
                    Response.Redirect(Paginas.Create_ConformacionCopasst.Value); 
                    break;
            }
        }
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalSubir);

            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + "_ActaReunionCopasst_" + ddlSucursalSubir.SelectedValue, "~/archivos/encuesta_politicasst/");

            documento nuevo = new documento()
            {
                nombre = txtNombreSubir.Text,
                id_tabla = IdSucursal,
                ruta = _ruta,
                tipo = "ReunionCopasst"
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();

            ObjUsuario.Error = CRUD.Delete_Fila(
                tabla,
                Convert.ToInt32(hdfIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region acciones grid
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
        #endregion

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

    }
}