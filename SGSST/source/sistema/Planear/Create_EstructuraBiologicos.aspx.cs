using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_EstructuraBiologicos : System.Web.UI.Page
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
                "Microorganismos y parásitos infecciosos vivos ",
                txts1.Text,
                txtt1.Text,
                "Virus ",
                txts2.Text,
                txtt2.Text,
                "Hongos",
                txts3.Text,
                txtt3.Text,
                "Polvos orgánicos (algodón, lino, cañamo, sisal)",
                txts4.Text,
                txtt4.Text,
                "Contacto con sangre, orina, saliva, vómitos, mucosas",
                txts5.Text,
                txtt5.Text,
                "Insectos",
                txts6.Text,
                txtt6.Text,
                "Roedores",
                txts7.Text,
                txtt7.Text,
                "Otros  animales (serpientes, perros)",
                txts8.Text,
                txtt8.Text,
            };

            PrintFile.PrintEstructuraBiologicas(valores, tabla1,  this);
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