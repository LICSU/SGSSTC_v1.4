using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Linq;

namespace SGSSTC.source.sistema.Hacer
{

    public partial class index_AsignacionResponsable : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            else
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
            if (!BoolEmpSuc.Item2)
            {
                Mgr_Trabajador.Lista_Trabajadores_Sucursal(ddlTrabajador, Convert.ToInt32(ObjUsuario.Id_sucursal));
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String texto =  " <p class='text-justify' style='padding-bottom:50px;'>" +
                           "     La gerencia de la empresa " + lblEmpresa.Text + ", en cumplimiento " +
                           "     con el artículo 8, numerales 2 y 10 del Decreto 1443 del 2012, delega para el " +
                           "     desarrollo del sistema de gestión de seguridad y salud en el trabajo al " +
                           "     empleado " + lblEmpleado.Text + " identificado con la CC N° " + lblCedula.Text + ", " +
                           "     asignando la responsabilidad ejecutiva de asegurar la implementación y el mantenimiento de dicho sistema, " +
                           "     para lo cual deberá planificar, organizar, dirigir, desarrollar y aplicar el SG-SST y como mínimo una vez " +
                           "     al año realizar su evaluación, informar a la alta dirección sobre el funcionamiento y los resultados del SG-SST " +
                           "     además será el responsable de coordinar con los jefes de las áreas la elaboración y actualización de la matriz " +
                           "     de identificación de peligros, evaluación y valoración de riesgos y hacer la priorización para focalizar la intervención." +
                           " </p>" ;

            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                "<p class='text-right' style='padding-bottom:30px;'><strong>" + lblFecha.Text + "</strong></p> ",
                " <h4 class='text-center' style='padding-bottom:30px;'>ASIGNACION DEL RESPONSABLE DEL SGSST</h4>",
                texto,
                " <p class='text-center' style='padding-bottom:50px;'> " +
                "     __________________________<br />" +
                "     Gerente<br />" +
                "    " + lblEmpresa.Text + " " +
                " </p>"
            };

            PrintFile.PrintAsignacionResponsable(valores, this);
        }

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
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                Mgr_Trabajador.Lista_Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
            }
        }
        protected void btnGenerarActa_OnClick(object sender, EventArgs e)
        {
            lblFecha.Text = "" + DateTime.Today.Date.ToString("yyyy-MM-dd");
            lblEmpresa.Text = ddlSucursal.SelectedItem.Text;
            lblEmpresaSel.Text = ddlSucursal.SelectedItem.Text;
            lblEmpleado.Text = ddlTrabajador.SelectedItem.Text;
            IdTrabajador = Convert.ToInt32(ddlTrabajador.SelectedValue);
            List<trabajador> listTrabajadores = Mgr_Trabajador.Get_Trabajador(IdTrabajador);
            lblCedula.Text = listTrabajadores.ElementAt(0).cedula;
            phActa.Visible = true;
        }
    }
}