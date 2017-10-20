using System;
using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.HistoriaClinica
{
    public partial class create : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        string sSelectSQL = string.Empty;

        #region accion index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            if (!IsPostBack)
            {
                CargarListas();
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
            }
        }
        private void CargarListas()
        {
            // ObjUsuario.objModeloBD.CargarListado(ddlTrabajador, "Trabajador", ObjUsuario.Id_empresa);
            // ObjUsuario.objModeloBD.CargarListado(ddlTrabajador, "TipoExamen", ObjUsuario.Id_empresa);
        }
        #endregion

        #region eventos tab
        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }
        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
            MainView.ActiveViewIndex = 1;
        }
        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Clicked";
            MainView.ActiveViewIndex = 2;
        }
        #endregion

        #region acciones
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            string recomendaciones = txtRecomendaciones.Text;
            string diagnostico = txtDiagnostico.Text;
            string id_trabajador = ddlTrabajador.SelectedValue;
            string id_tipo_exa = ddlTipo.SelectedValue;
            string fecha = txtFecha.Text;
            string doc_esc_paciente = string.Empty;
            string doc_esc_medico = string.Empty;

            /*ObjUsuario.Error = ObjUsuario.objModeloBD.Add_HistoriaClinica(ObjUsuario.Id_empresa, id_trabajador, id_tipo_exa,
                fecha, doc_esc_paciente, doc_esc_medico, diagnostico, recomendaciones);*/
            //Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);

        }
        #endregion
    }
}