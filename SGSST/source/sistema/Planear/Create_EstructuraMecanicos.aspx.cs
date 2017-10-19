using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_EstructuraMecanicos : System.Web.UI.Page
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
                "Contacto con material  cortopunzante o rugoso",
                txts1.Text,
                txtt1.Text,
                "Golpeado contra",
                txts2.Text,
                txtt2.Text,
                "Golpeado por ",
                txts3.Text,
                txtt3.Text,
                "Proyección de chispas o partículas",
                txts4.Text,
                txtt4.Text,
                "Proyección del objeto de trabajo",
                txts5.Text,
                txtt5.Text,
                "Caídas al mismo o distinto nivel/ pisar sobre",
                txts6.Text,
                txtt6.Text,
                "Caída de objetos",
                txts7.Text,
                txtt7.Text,
                "Atrapamiento/ Aplastamiento",
                txts8.Text,
                txtt8.Text,
                "Contacto con material cortante/ punzante ",
                txts9.Text,
                txtt9.Text,
            };

            PrintFile.PrintEstructuraMecanicas(valores, tabla1,  this);
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