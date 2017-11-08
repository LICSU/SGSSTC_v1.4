using Capa_Datos;
using Capa_Datos.Manager.PoliticaSST;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_PreProteccion : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            String[] valores = {
                string.Empty + ObjUsuario.Id_sucursal,
                txtProcedimientos.Text
            };
            PrintFile.PrintProcedimientos(valores, this);
        }
    }
}