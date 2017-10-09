using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Update_Empresa : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private Utilidades objUtilidades = new Utilidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != string.Empty)
                {
                    cargarDatos();
                    Listas.Arl(ddlArp);
                }
            }
        }

        private void cargarDatos()
        {
            int IdEmpresa = 0;
            IdEmpresa = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Getter.Empresa(IdEmpresa);

            foreach (var item in ListaEmpresa)
            {
                txtNombreEmpresa.Text = item.nombre;
                txtCodigoEmpresa.Text = item.CodEmpresa;
                txtNit.Text = item.nit;
                txtEmail.Text = item.email;
                txtRepresentante.Text = item.representante;
                txtTelFijo.Text = item.fijo;
                txtTelMovil.Text = item.movil;
                ddlArp.SelectedValue = item.id_arl.ToString();
                ddlJornada.SelectedValue = item.jornada.ToString();
                String ruta = item.logo_url;
                ViewState["url"] = ruta;
                imgLogo.ImageUrl = ruta;
            }

        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            int idEmpresa = 0;
            idEmpresa = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            string ruta = ViewState["url"].ToString();

            if (fuLogoEmpresa.HasFile)
                ruta = Utilidades.GuardarImagen(fuLogoEmpresa, txtNombreEmpresa.Text, "~/archivos/LogosEmpresas/");

            GrupoLiEntities contextoEdit = new GrupoLiEntities();
            empresa Edit = contextoEdit.empresa.SingleOrDefault(b => b.id_empresa == idEmpresa);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEmpresa.Text;
                Edit.CodEmpresa = txtCodigoEmpresa.Text;
                Edit.nit = txtNit.Text;
                Edit.email = txtEmail.Text;
                Edit.representante = txtRepresentante.Text;
                Edit.movil = txtTelMovil.Text;
                Edit.fijo = txtTelFijo.Text;
                Edit.logo_url = ruta;
                Edit.id_arl = Convert.ToInt32(ddlArp.SelectedValue);
                Edit.jornada = Convert.ToInt32(ddlJornada.SelectedValue);
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contextoEdit);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtNombreEmpresa);
        }

    }
}