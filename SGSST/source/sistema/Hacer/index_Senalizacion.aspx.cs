using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Senalizacion : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                phEmpresa1.Visible = BoolEmpSuc.Item1;
                if (BoolEmpSuc.Item1)
                {
                    LlenarGridView();
                }
            }
        }
        
        private void LlenarGridView()
        {
            Tabla.Senalizacion(GridView1);
        }
        #endregion

        #region metodos grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfVerID.Value = (gvrow.FindControl("id") as Label).Text;
                List<senalizacion> senal = new List<senalizacion>();
                senal = Getter.Senalizacion(Convert.ToInt32(hdfVerID.Value));

                foreach (var item in senal)
                {
                    lblNombre.Text = item.nombre;
                    lblDescripcion.Text = item.descripcion;
                    imgSenal.ImageUrl = item.url_imagen;
                }
                Modal.registrarModal("viewModal", "ViewModalScript", this);
            }
            else if (e.CommandName.Equals("Editar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfEditID.Value = (gvrow.FindControl("id") as Label).Text;
                List<senalizacion> senal = new List<senalizacion>();
                senal = Getter.Senalizacion(Convert.ToInt32(hdfEditID.Value));

                foreach (var item in senal)
                {
                    txtNombreEdit.Text = item.nombre;
                    txtDescripcionEdit.Text = item.descripcion;
                    imgFotoEdit.ImageUrl = item.url_imagen;
                }
                Modal.registrarModal("editModal", "EditModalScript", this);
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
            Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            senalizacion tabla = new senalizacion();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

            LlenarGridView();
        }
        #endregion

        protected void btnAgregarSenal_Click(object sender, EventArgs e)
        {
            String[] valores = {
                txtNombreAdd.Text,
                txtDescripcionAdd.Text
            };
            
            ObjUsuario.Error = CRUD.AddSenalizacion(valores, fuImagenAdd);            
            Modal.CerrarModal("addModal", "AddModalScript", this);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            limpiarCampos();
            LlenarGridView();
        }

        protected void limpiarCampos()
        {
            txtNombreAdd.Text = string.Empty;
            txtDescripcionAdd.Text = string.Empty;
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int id = Convert.ToInt32(hdfEditID.Value);
            List<senalizacion> senal = new List<senalizacion>();
            string ruta = string.Empty;
            if(fuImagenEdit.HasFile)
                ruta = Utilidades.GuardarImagen(fuImagenEdit, txtNombreEdit.Text, Paginas.Archivos_Senalizacion.Value);
            senalizacion Edit = contexto.senalizacion.SingleOrDefault(b => b.id_senalizacion == id);
            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.descripcion = txtDescripcionEdit.Text;
                if (fuImagenEdit.HasFile) Edit.url_imagen = ruta;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.CerrarModal("editModal", "EditModalScript", this);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

            LlenarGridView();
        }
    }
}