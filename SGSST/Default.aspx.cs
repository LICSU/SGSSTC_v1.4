using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSST
{
    public partial class _Default : System.Web.UI.Page
    {
        string sErr = string.Empty;
        Model_UsuarioSistema ObjUsuario = new Model_UsuarioSistema();
        FormsIdentity fIdentity = HttpContext.Current.User.Identity as FormsIdentity;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Getter.ExisteUsuario(fIdentity))
            {
                Response.Redirect("~/source/sistema/MenuPrincipal/index");
            }
        }

        protected void bAceptar_Click(object sender, EventArgs e)
        {
            string CodigoUsuario = Usuario.Text.Trim();
            string ClaveEncriptada = Clave.Text.Trim();

            if (CodigoUsuario != "" && ClaveEncriptada != "")
            {
                string ResUsuario = Getter.ValidarUsuario(CodigoUsuario, ClaveEncriptada);
                lblValidado.ForeColor = System.Drawing.Color.Red;

                if (sErr == string.Empty && ResUsuario != "-1")
                {
                    if (ResUsuario != string.Empty)
                    {
                        string[] aUsuario = ResUsuario.Split('|');

                        if (aUsuario.Length == 4)
                        {
                            //1: UsuarioID  2:RolID  3:EmpressaID 4:SucursalID
                            FormsAuthenticationTicket Tck = new FormsAuthenticationTicket(1, aUsuario[0] + "|" + aUsuario[1] + "|" + aUsuario[2] + "|" + aUsuario[3], DateTime.Now, DateTime.Now.AddHours(24), false, aUsuario[0], FormsAuthentication.FormsCookiePath);

                            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(Tck)));
                            Response.Redirect("~/source/sistema/MenuPrincipal/index");
                        }
                        else if (aUsuario.Length == 2)
                        {
                            //1: UsuarioID  2:RolID
                            FormsAuthenticationTicket Tck = new FormsAuthenticationTicket(1, aUsuario[0] + "|" + aUsuario[1], DateTime.Now, DateTime.Now.AddHours(24), false, aUsuario[0], FormsAuthentication.FormsCookiePath);
                            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(Tck)));
                            Response.Redirect("~/source/sistema/MenuPrincipal/index");
                        }
                        else
                        {
                            sErr = "Error en la sentencia de búsqueda a la base de datos";
                        }
                    }
                    else
                    {
                        sErr = "Usuario no existe o clave inválida";
                    }
                }
            }
        }

        protected void bEnviar_Click(object sender, EventArgs e)
        {
            string emailUsuario = txtEmail.Text;
            Utilidades objUtilidades = new Utilidades();
            List<usuario> objUsuario = new List<usuario>();
            objUsuario = Getter.Usuario(0, 0, emailUsuario);

            foreach (var itemUsuario in objUsuario)
            {
                if (objUsuario != null)
                {
                    string clave = objUtilidades.descifrarCadena2(Convert.ToString(itemUsuario.clave));
                    string usuario = itemUsuario.trabajador.primer_nombre + " " + itemUsuario.trabajador.primer_apellido;
                    bool envio = Utilidades.enviarRecuperacion(emailUsuario, usuario, itemUsuario.login, clave);

                    if (!envio)
                    {
                        Modal.MostrarMsjModal("Error! el correo no se pudo enviar", "ERR", this);
                    }
                    Modal.MostrarMsjModal("Contraseña Enviado al correo", "EXI", this);
                }
                else
                {
                    Modal.MostrarMsjModal("El email no esta asociado a ningun usuario", "ERR", this);
                }
            }
        }

    }
}