using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Trabajador;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_DescripcionSocioDemografica : System.Web.UI.Page
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

            phAgregar.Visible = true;
            GridView1.Columns[5].Visible = BoolEmpSuc.Item2;
            GridView1.Columns[6].Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            Mgr_Trabajador.DescSocio(GridView1, string.Empty + ViewState["sWhere"]);
        }

        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_DescripcionSocioDemografica.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            desc_socio tabla = new desc_socio();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfPerfilIDDel.Value));
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void crearPDF(string id_desc_socio)
        {
        }
        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            string Hora = DateTime.Now.ToString("dd_MM_yyy_HH_mm");
            GridView grid = new GridView();
            Mgr_Trabajador.DescSocio(grid, string.Empty + ViewState["sWhere"]);

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            System.IO.StringWriter sw = new System.IO.StringWriter(sb);
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page page = new Page();
            System.Web.UI.HtmlControls.HtmlForm form = new System.Web.UI.HtmlControls.HtmlForm();
            GridView Grid = new GridView();
            grid.AllowPaging = false;
            grid.DataBind();
            grid.EnableViewState = false;
            page.EnableEventValidation = false;
            page.DesignerInitialize();
            page.Controls.Add(form);
            form.Controls.Add(grid);
            page.RenderControl(htw);
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=perfil_socio_lista_" + Hora + ".xls");
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.Write(sb.ToString());
            Response.End();
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                
                string id_trabajador = Utilidades_GridView.DevolverIdRow(e, GridView1);

                id_trabajador = objUtilidades.cifrarCadena(Convert.ToString(id_trabajador));
                Response.Redirect(Paginas.Update_DescripcionSocioDemografica.Value+"?id=" + id_trabajador);
            }
            if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                
                string id_trabajador = Utilidades_GridView.DevolverIdRow(e, GridView1);
                id_trabajador = objUtilidades.cifrarCadena(Convert.ToString(id_trabajador));
                
                Response.Redirect(Paginas.View_DescripcionSocioDemografica.Value+"?id=" + id_trabajador);
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfPerfilIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
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
        #endregion
    }
}