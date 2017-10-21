using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_RecursosEconomicos : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void btnGenerar_Onclick(object sender, EventArgs e)
        {
            phGuardar.Visible = true;
            int TotalCosto = 0;
            int TotalAprobado = 0;

            for (int i = 5; i <= 59; i = i + 6)
            {
                TextBox miTextbox1 = (TextBox)panel1.FindControl("Textbox" + (i));
                TextBox miTextbox2 = (TextBox)panel1.FindControl("Textbox" + (i + 1));

                if (miTextbox1.Text == string.Empty) { miTextbox1.Text = "0"; }
                if (miTextbox2.Text == string.Empty) { miTextbox2.Text = "0"; }

                TotalCosto = TotalCosto + Convert.ToInt32(miTextbox1.Text);
                TotalAprobado = TotalAprobado + Convert.ToInt32(miTextbox2.Text);
            }

            lbRequerido.Text = string.Empty + TotalCosto;
            lbAprobado.Text = string.Empty + TotalAprobado;

        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                lbRequerido.Text,
                lbAprobado.Text
            };
            PrintFile.PrintRecursosEconomicos(valores, panel1, this);
        }
    }
}