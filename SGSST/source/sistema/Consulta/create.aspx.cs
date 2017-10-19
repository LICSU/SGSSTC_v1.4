using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Consulta
{
    public partial class create : Page
    {
        #region variables
        private Model_UsuarioSistema ObjUsuario;
        string id = string.Empty;
        #endregion

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            if (!IsPostBack)
            {
                //ObjUsuario.objModeloBD.CargarListado(ddlEmpresas, "Empresa", ObjUsuario.Id_empresa);
            }
            if (Request.QueryString["id"] == null)
            {
                Modal.MostrarMsjModal("No se ha recibido ningun identificador válido", "ERR", this);
            }
            else
            {
                id = Request.QueryString["id"];
                cargardatos(id);
            }
            if (ObjUsuario.isAdm_Grupoli())
            {
                phEmpresa.Visible = true;
            }
            else
            {
                phEmpresa.Visible = false;
            }
        }
        private void cargardatos(string id)
        {
            trabajador ListaTrabajador = new trabajador();
            // ListaTrabajador = ObjUsuario.objModeloBD.Get_Trabajador(Convert.ToInt32(id));

            lblNombre.Text = ListaTrabajador.primer_nombre + " " + ListaTrabajador.primer_apellido;
            lblEdad.Text = Convert.ToString(ListaTrabajador.fecha_nacimiento);
            lblCedula.Text = ListaTrabajador.cedula;
        }
        #endregion

        #region acciones
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            if (validar())
            {
                if (ObjUsuario.isAdm_Grupoli())
                    ObjUsuario.Id_empresa = Convert.ToInt32(ddlEmpresas.SelectedValue);

                /*  ObjUsuario.Error = ObjUsuario.objModeloBD.Add_Consultas(id, chkTipoConsulta.SelectedValue, txtServicioMedico.Text,
                      txtFecha.Text, txtMedico.Text, txtDiagnostico.Text, txtSugerencias.Text, ObjUsuario.Id_empresa);*/

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtDiagnostico);

                if (ObjUsuario.Error)
                {
                    Response.Redirect("../Hacer/index_AccidenteLaboral.aspx");
                }
            }
        }
        private bool validar()
        {
            bool band = false;
            if (chkTipoConsulta.SelectedValue != string.Empty && txtServicioMedico.Text != string.Empty && txtFecha.Text != string.Empty
                && txtMedico.Text != string.Empty && txtDiagnostico.Text != string.Empty && txtSugerencias.Text != string.Empty)
                band = true;
            return band;
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            if (validar())
            {
                /* ObjUsuario.Error = ObjUsuario.objModeloBD.Add_Consultas(id, chkTipoConsulta.SelectedValue, txtServicioMedico.Text,
                     txtFecha.Text, txtMedico.Text, txtDiagnostico.Text, txtSugerencias.Text, ObjUsuario.Id_empresa);*/

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtDiagnostico);

                if (ObjUsuario.Error)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "imprimir();", true);
                    Response.Redirect("../Hacer/index_AccidenteLaboral.aspx");
                }
            }
        }
        #endregion
    }
}