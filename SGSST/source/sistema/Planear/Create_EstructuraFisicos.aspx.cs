using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_EstructuraFisicos : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

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
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                txtMedidas.Text,
                txtObservaciones.Text
            };

            String[] tabla1 = {
                "Ruido",
                txts1.Text,
                txtt1.Text,
                "Radiaciones ionizantes",
                txts2.Text,
                txtt2.Text,
                "Radiaciones Ópticas ",
                txts3.Text,
                txtt3.Text,
                "Radiaciones térmicas",
                txts4.Text,
                txtt4.Text,
                "Temperatura Extrema",
                txts5.Text,
                txtt5.Text,
                "Vibraciones",
                txts6.Text,
                txtt6.Text,
                "Iluminación",
                txts7.Text,
                txtt7.Text,
                "Humedad",
                txts8.Text,
                txtt8.Text,
                "Presión ",
                txts9.Text,
                txtt9.Text,
            };

            PrintFile.PrintEstructuraFisicos(valores, tabla1,  this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}