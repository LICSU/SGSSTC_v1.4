using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Create_Empresa : Page
    {
        private Utilidades objUtilidades = new Utilidades();
        private int IdEmpresa;
        private Model_UsuarioSistema ObjUsuario;
        private string nombreEmpresa;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            if (!IsPostBack)
            {
                Listas.Codciiu_Div_item(ddlSeccion1, "SeccionCiiu");
                Listas.Reg_Dpto_Mcpio(ddlRegion, "Region");
                Listas.Arl(ddlArp);
            }
        }

        #region  Guardar informacion
        protected void GuardarRegistro(object sender, EventArgs e)
        {

            String[] valores = {
                txtNomEmpresa.Text,
                txtCodigoEmpresa.Text,
                txtNit.Text,
                txtEmail.Text,
                txtRepresentante.Text,
                txtTelMovil.Text,
                txtTelFijo.Text,
                ddlArp.SelectedValue,
                ddlJornada.SelectedValue
            };

            if (Mgr_Empresa.AddEmpresa(valores, fuLogoEmpresa))
            {
                nombreEmpresa = Utilidades.FormatearPalabra(valores[0]);
                nombreEmpresa = nombreEmpresa.Replace(" ", "");
                IdEmpresa = Mgr_Empresa.get_max_Empresas();
                add_CodigoCiiu();
            }
            else
            {
                Modal.MostrarMsjModal(MensajeError.Error_Add_Empresa.Value, "ERR", this);
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

            if (CRUD.AddCodigoCiiu_Empresa( valores))
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

            if (CRUD.Add_Categoria_Empresa( valores))
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

            if (CRUD.Add_Estatus_Empresa( valores))
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
                ddlMunicipio.SelectedValue,
                ""+IdEmpresa,
                txtDireccion.Text,
                txtRepresentante.Text,
                txtTelFijo.Text,
                txtTelMovil.Text,
                ddlClase1.SelectedValue,
                ddlClase2.SelectedValue,
                ddlClase3.SelectedValue
            };

            if (Mgr_Sucursal.Add_Sucursal_Empresa( valores))
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

            if (Mgr_Area.Add_Area_Sucursal( valores))
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

            if (CRUD.Add_PuestoTrabajo_Sucursal( valores))
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

            if (CRUD.Add_Horario_Sucursal( valores))
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

            if (CRUD.Add_Usuario_Sucursal( valores))
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

            if (CRUD.Add_TipoDocumento_Sucursal( valores))
            {
                //Si llega aqui enviar el email.....
                string clave = objUtilidades.descifrarCadena2(Convert.ToString(ViewState["clave"].ToString()));
                Utilidades.enviarEmpresa(txtEmail.Text, txtNomEmpresa.Text, ViewState["login"].ToString(), clave);

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
        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRegion.SelectedValue != string.Empty)
            {
                Listas.Reg_Dpto_Mcpio(ddlDepartamento, "RegionDpto", Convert.ToInt32(ddlRegion.SelectedValue));
            }
        }

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartamento.SelectedValue != string.Empty)
            {
                Listas.Reg_Dpto_Mcpio(ddlMunicipio, "McpioDpto", Convert.ToInt32(ddlDepartamento.SelectedValue));
            }
        }

        protected void ddlCodigoCiuu_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDDl = (DropDownList)sender;

            if (miDDl.SelectedValue != string.Empty)
            {
                #region actividad prinicipal
                if (miDDl.ClientID.Contains("ddlSeccion1"))
                {
                    Listas.Codciiu_Div_item(ddlDivision1, "DivisionCiiu", Convert.ToInt32(ddlSeccion1.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlDivision1"))
                {
                    Listas.Codciiu_Div_item(ddlGrupo1, "GrupoCiiu", Convert.ToInt32(ddlDivision1.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlGrupo1"))
                {
                    Listas.Codciiu_Div_item(ddlClase1, "ClaseCiiu", Convert.ToInt32(ddlGrupo1.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlClase1"))
                {
                    Listas.Codciiu_Div_item(ddlSeccion2, "SeccionCiiu");
                    phActividad2.Visible = true;
                }
                #endregion

                #region actividad secundaria
                if (miDDl.ClientID.Contains("ddlSeccion2"))
                {
                    Listas.Codciiu_Div_item(ddlDivision2, "DivisionCiiu", Convert.ToInt32(ddlSeccion2.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlDivision2"))
                {
                    Listas.Codciiu_Div_item(ddlGrupo2, "GrupoCiiu", Convert.ToInt32(ddlDivision2.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlGrupo2"))
                {
                    Listas.Codciiu_Div_item(ddlClase2, "ClaseCiiu", Convert.ToInt32(ddlGrupo2.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlClase2"))
                {
                    Listas.Codciiu_Div_item(ddlSeccion3, "SeccionCiiu");
                    phActividad3.Visible = true;
                }
                #endregion

                #region otras actividades
                if (miDDl.ClientID.Contains("ddlSeccion3"))
                {
                    Listas.Codciiu_Div_item(ddlDivision3, "DivisionCiiu", Convert.ToInt32(ddlSeccion3.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlDivision3"))
                {
                    Listas.Codciiu_Div_item(ddlGrupo3, "GrupoCiiu", Convert.ToInt32(ddlDivision3.SelectedValue));
                }
                else if (miDDl.ClientID.Contains("ddlGrupo3"))
                {
                    Listas.Codciiu_Div_item(ddlClase3, "ClaseCiiu", Convert.ToInt32(ddlGrupo3.SelectedValue));
                }
                #endregion
            }
        }
        #endregion
    }
}