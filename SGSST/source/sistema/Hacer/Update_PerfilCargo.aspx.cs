using Capa_Datos;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Update_PerfilCargo : System.Web.UI.Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private int IDPerfil = 0;
        private Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            IDPerfil = Convert.ToInt32(objUtilidades.descifrarCadena(Request.QueryString["id"]));

            if (!IsPostBack)
            {
                Listas.Cno(ddlCargo);
                CargarPerfil();
            }
        }

        private void CargarPerfil()
        {
            var _PerfilCargo = new perfil_cargo();
            _PerfilCargo = Getter.PerfilCargo(IDPerfil);

            txtNombre.Text = _PerfilCargo.nombre;
            txtDescripcion.Text = _PerfilCargo.descripcion;
            ddlCargo.SelectedValue = Convert.ToString(_PerfilCargo.id_cno);

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Edit = contexto.perfil_cargo.SingleOrDefault(b => b.id_perfil_cargo == IDPerfil);
            
            if (Edit != null)
            {
                Edit.nombre = txtNombre.Text;
                Edit.descripcion = txtDescripcion.Text;
                Edit.id_cno = Convert.ToInt32(ddlCargo.SelectedValue);
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtNombre);
        }
    }
}