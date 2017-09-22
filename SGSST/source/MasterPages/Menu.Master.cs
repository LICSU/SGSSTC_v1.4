using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web.Security;

namespace SGSSTC.source.MasterPages
{
    public partial class Menu1 : System.Web.UI.MasterPage
    {
        Model_UsuarioSistema ObjUsuario;
        FormsIdentity fIdentity = System.Web.HttpContext.Current.User.Identity as FormsIdentity;

        protected void Page_Load(object sender, EventArgs e)
        {
            Model_UsuarioAutenticado _autenticado = new Model_UsuarioAutenticado(fIdentity);

            System.Web.HttpBrowserCapabilities browser = Request.Browser;
            string Navegador = browser.Type.Substring(0, 6);
            if (Navegador != "Chrome")
            {
                Response.Redirect("../Mensajes/Error.aspx");
            }

            ObjUsuario = Model_UsuarioAutenticado.ValidarObjUsuario(_autenticado);

            List<usuario> objUsuario = new List<usuario>();
            objUsuario = Getter.Usuario(ObjUsuario.Id_usuario);
            foreach (var itemUsuario in objUsuario)
            {
                lbNombreUsuario.Text = itemUsuario.login;

                if (itemUsuario.trabajador != null && itemUsuario.trabajador.foto != "")
                {
                    imgLogo.ImageUrl = itemUsuario.trabajador.foto;
                }
                else
                {
                    imgLogo.ImageUrl = "~/source/archivos/foto_perfil/usuario.png";
                }
            }
            if (ObjUsuario.isRolDiferente())
            {
                menuPrin.Visible = false;
                if (Utilidades.VerificarUsuario(ObjUsuario.Rol, Request.Url.AbsoluteUri))
                {
                    Response.Redirect("~/source/sistema/MenuPrincipal/index.aspx");
                }
            }
            
        }
    }
}