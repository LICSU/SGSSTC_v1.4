using Capa_Datos;
using Capa_Datos.Manager.Usuario;
using System;
using System.Collections.Generic;

namespace SGSSTC
{
    public partial class Recuperar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void SendMailSinConfig(string emailUsuario)
        {
            Utilidades objUtilidades = new Utilidades();
            List<usuario> objUsuario = new List<usuario>();
            objUsuario = Mgr_Usuario.Usuario(0, 0, emailUsuario);

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

        protected void bAceptar_Click(object sender, EventArgs e)
        {
            SendMailSinConfig(txtEmail.Text);
        }
        protected void bVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}