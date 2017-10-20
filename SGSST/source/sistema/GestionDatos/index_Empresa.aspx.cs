using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Empresa : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private Utilidades objUtilidades = new Utilidades();

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                phEmpresa1.Visible = BoolEmpSuc.Item1;
                phEmpresa.Visible = !BoolEmpSuc.Item1;

                if (BoolEmpSuc.Item1)
                {
                    LlenarGridView();
                }
                else
                {
                    ConsultarEmpresa(ObjUsuario.Id_empresa);
                }
            }
        }

        protected void ConsultarEmpresa(int id_empresa)
        {
            List<empresa> ListaEmpresa = new List<empresa>();
            int IdEmpresa = Convert.ToInt32(id_empresa);
            ListaEmpresa = Mgr_Empresa.Empresa(IdEmpresa);

            foreach (var item in ListaEmpresa)
            {
                txtNombreEmpresa.Text = item.nombre;
                txtNit.Text = item.nit;
                txtEmail.Text = item.email;
                txtRepresentante.Text = item.representante;
                txtTelFijo.Text = item.fijo;
                txtTelMovil.Text = item.movil;
                string ruta = item.logo_url;

                lblNombreEmpresa.Text = item.nombre;
                lblNIT.Text = item.nit;
                lblEmail.Text = item.email;
                lblRepresentante.Text = item.representante;
                lblFijo.Text = item.fijo;
                lblMovil.Text = item.movil;
                imgLogo.ImageUrl = item.logo_url;
            }
        }

        private void LlenarGridView()
        {
            Mgr_Empresa.tabla_Empresa(GridView1);
        }
        #endregion

        #region metodos grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                Response.Redirect(Paginas.Update_Empresa.Value + "?id=" + (gvrow.FindControl("id_empresa") as Label).Text);
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfEmpresaIDDel.Value = (gvrow.FindControl("id") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfEmpresaID.Value = (gvrow.FindControl("id") as Label).Text;
                ConsultarEmpresa(Convert.ToInt32(hdfEmpresaID.Value));
                Modal.registrarModal("viewModal", "ViewModalScript", this);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_Empresa.Value);
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
        }
        #endregion

        protected void btnActualizar_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            int IdEmpresa = Convert.ToInt32(ObjUsuario.Id_empresa);
            string idEmpresa = objUtilidades.cifrarCadena(Convert.ToString(IdEmpresa));
            Response.Redirect(Paginas.Update_Empresa.Value + "?id=" + idEmpresa);
        }
    }
}