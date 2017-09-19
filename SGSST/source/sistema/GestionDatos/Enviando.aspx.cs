using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Enviando : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        protected static Utilidades objUtilidades = new Utilidades();
        protected static int act1, act2, act3, IdEmpresa;
        protected static string nombreSucursal, password, nom_usuario;
        protected static int id_sucursal;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            if (!IsPostBack)
            {
                id_sucursal = Convert.ToInt32(objUtilidades.descifrarCadena(Request.QueryString["id"]));
                nombreSucursal = objUtilidades.descifrarCadena2(Request.QueryString["suc"]);
                act1 = Convert.ToInt32(objUtilidades.descifrarCadena(Request.QueryString["act1"]));
                act2 = Convert.ToInt32(objUtilidades.descifrarCadena(Request.QueryString["act2"]));
                act3 = Convert.ToInt32(objUtilidades.descifrarCadena(Request.QueryString["act3"]));
                IdEmpresa = Convert.ToInt32(objUtilidades.descifrarCadena(Request.QueryString["emp"]));
            }
        }

        [WebMethod]
        public static string SaveData()
        {
            return add_Area_Default();
        }

        #region tablas default al agregar sucursal
        protected static string add_Area_Default()
        {
            nombreSucursal = Utilidades.FormatearPalabra(nombreSucursal);
            nombreSucursal = nombreSucursal.Replace(" ", "");

            String[] valores = {
                nombreSucursal,
                ""+id_sucursal
            };

            if (CRUD.Add_Area_Sucursal(ObjUsuario, valores))
            {
                return add_PuestoTrabajo_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_Area.Value;
            }

        }

        protected static string add_PuestoTrabajo_Default()
        {
            String[] valores = {
                nombreSucursal
            };

            if (CRUD.Add_PuestoTrabajo_Sucursal(ObjUsuario, valores))
            {
                return add_Horario_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_PuestoTrabajo.Value;
            }
        }

        protected static string add_Horario_Default()
        {
            String[] valores = {
                nombreSucursal
            };

            if (CRUD.Add_Horario_Sucursal(ObjUsuario, valores))
            {
                return add_Trabajador_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_Horario.Value;
            }
        }

        protected static string add_Trabajador_Default()
        {
            String[] valores = {
                nombreSucursal
            };

            if (CRUD.Add_Trabajador_Sucursal(ObjUsuario, valores))
            {
                return add_Usuario_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_Trabajador.Value;
            }
        }

        protected static string add_Usuario_Default()
        {
            password = Membership.GeneratePassword(16, 1);
            password = objUtilidades.cifrarCadena(password);
            nom_usuario = "Admin_" + nombreSucursal;

            String[] valores = {
                nom_usuario ,
                string.Empty + password,
                "3"
            };

            if (CRUD.Add_Usuario_Sucursal(ObjUsuario, valores))
            {
                return add_Riesgos_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_Usuario.Value;
            }
        }

        protected static string add_Riesgos_Default()
        {
            String[] valores = {
                ""+act1,
                ""+act2,
                ""+act3,
                ""+id_sucursal
            };

            if (CRUD.Add_Riesgos_Sucursal(ObjUsuario,valores))
            {
                return add_NormasSucursal();
            }
            else
            {
                return MensajeError.Error_Add_Default_Riesgos.Value;
            }

        }

        protected static string add_NormasSucursal()
        {
            String[] valores = {
                ""+act1,
                ""+act2,
                ""+act3,
                ""+id_sucursal
            };

            if (CRUD.Add_Normas_Sucursal(ObjUsuario, valores))
            {
                return add_MedidasSucursal();
            }
            else
            {
                return MensajeError.Error_Add_Normas_Sucursal.Value;
            }
        }

        protected static string add_MedidasSucursal()
        {
            if (CRUD.Add_Medidas_Sucursal(ObjUsuario, id_sucursal))
            {
                return add_Tipo_Documento_Default();
            }
            else
            {
                return MensajeError.Error_Add_Medidas_Sucursal.Value;
            }

        }

        protected static string add_Tipo_Documento_Default()
        {
            String[] valores = {
                ""+id_sucursal
            };

            if (CRUD.Add_TipoDocumento_Sucursal(ObjUsuario, valores))
            {
                return add_Lista_Actividad_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_TipoDocumento.Value;
            }

        }

        protected static string add_Lista_Actividad_Default()
        {
            if (CRUD.Add_Lista_Actividad(ObjUsuario,id_sucursal))
            {
                string empresa = "", correo = "";
                List<empresa> data_empresa = Getter.EmpresaEmail(IdEmpresa);
                foreach (var datos in data_empresa)
                {
                    empresa = datos.nombre;
                    correo = datos.email;
                }
                
                password = objUtilidades.descifrarCadena2(Convert.ToString(password));
                Utilidades.enviarSucursal(correo, empresa, nombreSucursal, nom_usuario, password);
                return MensajeError.Exito_Add_Sucursal.Value;
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return MensajeError.Error_Add_Default_Lista_Actividades.Value;
            }
        }
        #endregion
    }
}