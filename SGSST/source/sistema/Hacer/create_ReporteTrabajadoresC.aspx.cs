using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_ReporteTrabajadoresC : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;
        private static int IdPuesto = 0;

        #region index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

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
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
            if (!BoolEmpSuc.Item2)
            {
                Listas.Trabajadores_Sucursal(ddlTrabajador, ObjUsuario.Id_sucursal);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                lbPrimerApellido.Text,
                lbSegundoApellido.Text,
                lbNombres.Text,
                lbCedula.Text,
                lbSexo.Text,
                lbEdad.Text,
                lbEdoCivil.Text,
                lbCCF.Text,
                lbArea.Text,
                lbPuesto.Text,
                Textbox1.Text,
                Textbox2.Text,
                Textbox3.Text,
                Textbox4.Text,
                Textbox5.Text,
                Textbox6.Text,
                PrintFile.GetRadioValue(radio1),
                PrintFile.GetRadioValue(radio2),
                Textbox9.Text,
                Textbox7.Text,
                PrintFile.GetRadioValue(radio3),
                PrintFile.GetRadioValue(radio4),
                Textbox8.Text,
                Textbox10.Text,
                Textbox11.Text,
                Textbox12.Text
            };

            PrintFile.PrintReporteTrabajadoresC(valores, this);
        }

        protected void GenerarDocumentoGeneral(object sender, EventArgs e)
        {

            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };

            PrintFile.PrintReporteTrabajadoresCGeneral(valores, this);
        }

        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                Listas.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
            }
        }

        protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<trabajador> ListaTrabajador = new List<trabajador>();
            int idTrabajador = Convert.ToInt32(ddlTrabajador.SelectedValue);
            ListaTrabajador = Getter.Trabajador(idTrabajador);

            foreach (var itemTrabajador in ListaTrabajador)
            {
                lbPrimerApellido.Text = itemTrabajador.primer_apellido;
                lbSegundoApellido.Text = itemTrabajador.segundo_apellido;
                lbNombres.Text = itemTrabajador.primer_nombre + " " + itemTrabajador.segundo_nombre;
                lbCedula.Text = itemTrabajador.cedula;

                lbSexo.Text = itemTrabajador.sexo;

                DateTime nacimiento = Convert.ToDateTime(string.Empty + itemTrabajador.fecha_nacimiento);
                int edad = DateTime.Today.AddTicks(-nacimiento.Ticks).Year - 1;
                lbEdad.Text = string.Empty + edad;
                lbEdoCivil.Text = itemTrabajador.edo_civil;
                lbCCF.Text = itemTrabajador.ccf.nombre;

                lbArea.Text = itemTrabajador.puesto_trabajo.area.nombre;
                lbPuesto.Text = itemTrabajador.puesto_trabajo.nombre;
            }
        }
        #endregion



    }
}