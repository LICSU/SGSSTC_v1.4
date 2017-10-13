using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_EstructuraQuimicos : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

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
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                txtMedidas.Text,
                txtObservaciones.Text
            };

            String[] tabla1 = {
                "Material Particulado",
                txts1.Text,
                txtt1.Text,
                "Vapores",
                txts2.Text,
                txtt2.Text,
                "Gases",
                txts3.Text,
                txtt3.Text,
                "Humos",
                txts4.Text,
                txtt4.Text,
                "Polvos",
                txts5.Text,
                txtt5.Text,
                "Liquidos/ Disolventes",
                txts6.Text,
                txtt6.Text,
            };

            String[] tabla2Etiquetas = {
                "Asbesto",
                "Benceno",
                "Berilio",
                "Bromo",
                "Cadmio",
                "Carburo",
                "Cloro",
                "Cromo",
                "Flúor",
                "Fosforo",
                "Hidrocarburos",
                "Yodo",
                "Manganeso",
                "Plomo"
            };

            String[] tabla2Valores = {
                PrintFile.GetCheckValue(chkq1),
                PrintFile.GetCheckValue(chkq2),
                PrintFile.GetCheckValue(chkq3),
                PrintFile.GetCheckValue(chkq4),
                PrintFile.GetCheckValue(chkq5),
                PrintFile.GetCheckValue(chkq6),
                PrintFile.GetCheckValue(chkq7),
                PrintFile.GetCheckValue(chkq8),
                PrintFile.GetCheckValue(chkq9),
                PrintFile.GetCheckValue(chkq10),
                PrintFile.GetCheckValue(chkq11),
                PrintFile.GetCheckValue(chkq12),
                PrintFile.GetCheckValue(chkq13),
                PrintFile.GetCheckValue(chkq14),
            };

            String[] tabla3Etiquetas = {
                "Monóxido de Carbono",
                "Cianuro de Hidrógeno",
                "Sulfuro de Hidrógeno",
                "Silíce libre",
                "Sulfuro de Carbono",
            };

            String[] tabla3Valores = {
                PrintFile.GetCheckValue(chk1),
                PrintFile.GetCheckValue(chk2),
                PrintFile.GetCheckValue(chk3),
                PrintFile.GetCheckValue(chk4),
                PrintFile.GetCheckValue(chk5),
            };

            String[] tabla4Etiquetas = {
                "Alquitrán",
                "Brea",
                "Betún",
                "Parafina",
                "Hulla Mineral",
            };

            String[] tabla4Valores = {
                PrintFile.GetCheckValue(chko1),
                PrintFile.GetCheckValue(chko2),
                PrintFile.GetCheckValue(chko3),
                PrintFile.GetCheckValue(chko4),
                PrintFile.GetCheckValue(chko5),
            };

            PrintFile.PrintEstructuraQuimica(valores, tabla1, tabla2Etiquetas, tabla2Valores, tabla3Etiquetas, tabla3Valores, tabla4Etiquetas, tabla4Valores,  this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}