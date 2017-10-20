using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Sucursal;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Estatus;
using Capa_Datos.Manager.Categoria;
using Capa_Datos.Manager.Usuario;
using Capa_Datos.Manager.CodigoCiiu;
using Capa_Datos.Manager.Documento;
using Capa_Datos.Manager.Horario;

namespace SGSST
{
    public partial class _Default : System.Web.UI.Page
    {
        private Utilidades objUtilidades = new Utilidades();
        private int IdEmpresa;
        private string nombreEmpresa;
        string sErr = string.Empty;
        Model_UsuarioSistema ObjUsuario = new Model_UsuarioSistema();
        FormsIdentity fIdentity = HttpContext.Current.User.Identity as FormsIdentity;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            if (Mgr_Usuario.ExisteUsuario(fIdentity))
            {
                Response.Redirect("~/source/sistema/MenuPrincipal/index");
            }
            if (!IsPostBack)
            {
                Mgr_CodigoCiiu.Codciiu_Div_item(ddlSeccion1, "SeccionCiiu");
            }
        }

        protected void bAceptar_Click(object sender, EventArgs e)
        {
            string CodigoUsuario = Usuario.Text.Trim();
            string ClaveEncriptada = Clave.Text.Trim();

            if (CodigoUsuario != "" && ClaveEncriptada != "")
            {
                string ResUsuario = Mgr_Usuario.ValidarUsuario(CodigoUsuario, ClaveEncriptada);
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

        #region  Guardar informacion
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            String[] valores = {
                txtNomEmpresa.Text,
                "-",
                txtNitEmpresa.Text,
                txtemailEmpresa.Text,
                txtRepresentante.Text,
                "",
                txtTelFijo.Text,
                "0",
                "0",
                ""
            };

            if (Mgr_Empresa.AddEmpresaSimple(valores))
            {
                nombreEmpresa = Utilidades.FormatearPalabra(valores[0]);
                nombreEmpresa = nombreEmpresa.Replace(" ", "");
                IdEmpresa = Mgr_Empresa.get_max_Empresas();
                add_CodigoCiiu();

                string mensaje = "Se agregó la empresa exitosamente a las " + DateTime.Now.ToString("HH:mm:ss") +" se enviará al correo ingresado, el usuario y la contraseña de acceso al sistema";
                Modal.MostrarMensajeAlerta(phAlerta, divAlerta, lbAlerta, true, txtNomEmpresa, mensaje);
                
            }
            else
            {
                string mensaje = "No se pudo crear la Empresa";
                Modal.MostrarMensajeAlerta(phAlerta, divAlerta, lbAlerta, true, txtNomEmpresa, mensaje);
            }

        }

        #region tablas default al agregar empresa

        private void add_CodigoCiiu()
        {
            String[] valores = {
                ""+IdEmpresa,
                ddlClase1.SelectedValue,
                ddlClase2.SelectedValue,
                ddlClase3.SelectedValue
            };

            if (Mgr_CodigoCiiu.AddCodigoCiiu_Empresa(valores))
            {
                add_Categorias();
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Ciiu.Value, "ERR", this);
            }
        }

        private void add_Categorias()
        {
            String[] valores = { "" + IdEmpresa };

            if (Mgr_Categoria.Add_Categoria_Empresa(valores))
            {
                add_Estatus();
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Categoria.Value, "ERR", this);
            }
        }

        private void add_Estatus()
        {
            String[] valores = { "" + IdEmpresa };

            if (Mgr_Estatus.Add_Estatus_Empresa(valores))
            {
                add_SucursalPrincipal();
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Estatus.Value, "ERR", this);
            }
        }
        

        private void add_SucursalPrincipal()
        {
            String[] valores = {
                "Sede Principal - " + nombreEmpresa,
                ""+IdEmpresa,
                txtDireccion.Text,
                txtRepresentante.Text,
                txtTelFijo.Text,
                "",
                ddlClase1.SelectedValue,
                ddlClase2.SelectedValue,
                ddlClase3.SelectedValue
            };

            if (Mgr_Sucursal.Add_Sucursal_Empresa_2(valores))
            {
                add_Area_Default(Mgr_Sucursal.Sucursal());
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Sucursal.Value, "ERR", this);
            }

        }
        #endregion

        #region tablas default al agregar sucursal
        private void add_Area_Default(int id_sucursal)
        {
            String[] valores = {
                "Área Default " + nombreEmpresa,
                ""+id_sucursal
            };

            if (Mgr_Area.Add_Area_Sucursal(valores))
            {
                add_PuestoTrabajo_Default(id_sucursal);
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Area.Value, "ERR", this);
            }
        }

        private void add_PuestoTrabajo_Default(int id_sucursal)
        {
            String[] valores = {
                nombreEmpresa
            };

            if (Mgr_PuestoTrabajo.Add_PuestoTrabajo_Sucursal(valores))
            {
                add_Horario_Default(id_sucursal);
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_PuestoTrabajo.Value, "ERR", this);
            }
        }

        private void add_Horario_Default(int id_sucursal)
        {
            String[] valores = {
                nombreEmpresa
            };

            if (Mgr_Horario.Add_Horario_Sucursal(valores))
            {
                add_Trabajador_Default(id_sucursal);
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Horario.Value, "ERR", this);
            }
        }

        private void add_Trabajador_Default(int id_sucursal)
        {
            String[] valores = {
                nombreEmpresa
            };

            if (Mgr_Trabajador.Add_Trabajador_Sucursal( valores))
            {
                add_Usuario_Default(id_sucursal);
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Trabajador.Value, "ERR", this);
            }
        }

        private void add_Usuario_Default(int id_sucursal)
        {
            string password = Membership.GeneratePassword(16, 1);
            password = objUtilidades.cifrarCadena(password);

            ViewState["login"] = "Admin_" + nombreEmpresa;
            ViewState["clave"] = string.Empty + password;

            String[] valores = {
                ""+ ViewState["login"] ,
                ""+ ViewState["clave"],
                "2"
            };

            if (Mgr_Usuario.Add_Usuario_Sucursal( valores))
            {
                add_Tipo_Documento_Default(id_sucursal);
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_Usuario.Value, "ERR", this);
            }
        }

        private void add_Tipo_Documento_Default(int id_sucursal)
        {
            String[] valores = {
                ""+id_sucursal
            };

            if (Mgr_Documento.Add_TipoDocumento_Sucursal( valores))
            {
                //Si llega aqui enviar el email.....
                string clave = objUtilidades.descifrarCadena2(Convert.ToString(ViewState["clave"].ToString()));
                Utilidades.enviarEmpresa(txtemailEmpresa.Text, txtNomEmpresa.Text, ViewState["login"].ToString(), clave);

                Modal.MostrarMsjModal(MensajeError.Exito_Add_Empresa.Value, "EXI", this);
            }
            else
            {
                Mgr_Empresa.DeleteEmpresa(IdEmpresa);
                Modal.MostrarMsjModal(MensajeError.Error_Add_Default_TipoDocumento.Value, "ERR", this);
            }

        }
        #endregion

        #endregion

        #region eventos
        protected void ddlCodigoCiuu_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDDl = (DropDownList)sender;

            if (miDDl.SelectedValue != string.Empty)
            {
                #region actividad prinicipal
                if (miDDl.ClientID.Contains("ddlSeccion1"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlDivision1, "DivisionCiiu", Convert.ToInt32(ddlSeccion1.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlDivision1"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlGrupo1, "GrupoCiiu", Convert.ToInt32(ddlDivision1.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlGrupo1"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlClase1, "ClaseCiiu", Convert.ToInt32(ddlGrupo1.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlClase1"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlSeccion2, "SeccionCiiu");
                    phActividad2.Visible = true;
                }
                #endregion

                #region actividad secundaria
                if (miDDl.ClientID.Contains("ddlSeccion2"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlDivision2, "DivisionCiiu", Convert.ToInt32(ddlSeccion2.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlDivision2"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlGrupo2, "GrupoCiiu", Convert.ToInt32(ddlDivision2.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlGrupo2"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlClase2, "ClaseCiiu", Convert.ToInt32(ddlGrupo2.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlClase2"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlSeccion3, "SeccionCiiu");
                    phActividad3.Visible = true;
                }
                #endregion

                #region otras actividades
                if (miDDl.ClientID.Contains("ddlSeccion3"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlDivision3, "DivisionCiiu", Convert.ToInt32(ddlSeccion3.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlDivision3"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlGrupo3, "GrupoCiiu", Convert.ToInt32(ddlDivision3.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlGrupo3"))
                {
                    Mgr_CodigoCiiu.Codciiu_Div_item(ddlClase3, "ClaseCiiu", Convert.ToInt32(ddlGrupo3.SelectedValue));
                }
                #endregion
            }
        }
        #endregion

    }
}