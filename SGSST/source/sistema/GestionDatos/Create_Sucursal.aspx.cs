using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Create_Sucursal : System.Web.UI.Page
    {
        private Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private int id_sucursal;
        private string strAct1;
        private string strAct2;
        private string strAct3;
        private string nombreSucursal, password, nom_usuario;
        private string IdSucursal ;
        private int act1 = 0, act2 = 0, act3 = 0, IdEmpresa = 0;

        #region acciones
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                CargarListas();
                CargarControles();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresaAdd);
            }
            else
            {
                Listas.Codciiu_Div_item(ddlItemDivision1, "claseCiiu_Empresa", ObjUsuario.Id_empresa);
                Listas.Codciiu_Div_item(ddlItemDivision2, "claseCiiu_Empresa", ObjUsuario.Id_empresa);
                Listas.Codciiu_Div_item(ddlItemDivision3, "claseCiiu_Empresa", ObjUsuario.Id_empresa);
            }
            Listas.Reg_Dpto_Mcpio(ddlRegionAdd, "Region");
        }

        private void CargarControles()
        {
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
        }

        protected void GuardarRegistro(object sender, EventArgs e)
        {

            if (BoolEmpSuc.Item1)
            {
                IdEmpresa = Convert.ToInt32(ddlEmpresaAdd.SelectedValue);
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
            }

            int idSucursal = Getter.SucursalByNombre(txtNombreAdd.Text, IdEmpresa);

            if (idSucursal == 0)
            {
                act1 = Convert.ToInt32(ddlItemDivision1.SelectedValue);
                act2 = ddlItemDivision2.SelectedValue == string.Empty ? 0 : Convert.ToInt32(ddlItemDivision2.SelectedValue);
                act3 = ddlItemDivision3.SelectedValue == string.Empty ? 0 : Convert.ToInt32(ddlItemDivision3.SelectedValue);
                IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);
                string strIdEmpresa = objUtilidades.cifrarCadena(Convert.ToString(IdEmpresa));

                String[] valores =
                    {
                    txtNombreAdd.Text,
                    ddlMcpioAdd.SelectedValue,
                    ""+IdEmpresa,
                    txtDireccionAdd.Text,
                    txtRepresentanteAdd.Text,
                    txtFijoAdd.Text,
                    txtMovilAdd.Text,
                    ""+act1,
                    ""+act2,
                    ""+act3
                };

                if (CRUD.Add_Sucursal(ObjUsuario, valores))
                {
                    id_sucursal = GetterMax.Sucursal();
                    strAct1 = Convert.ToString(act1);
                    strAct2 = Convert.ToString(act2);
                    strAct3 = Convert.ToString(act3);
                    nombreSucursal = txtNombreAdd.Text;
                    IdSucursal = Convert.ToString(id_sucursal);

                    if (add_Area_Default())
                    {
                        strAct1 = objUtilidades.cifrarCadena(Convert.ToString(act1));
                        strAct2 = objUtilidades.cifrarCadena(Convert.ToString(act2));
                        strAct3 = objUtilidades.cifrarCadena(Convert.ToString(act3));
                        nombreSucursal = objUtilidades.cifrarCadena(txtNombreAdd.Text);
                        IdSucursal = objUtilidades.cifrarCadena(Convert.ToString(id_sucursal));

                        Response.Redirect(Paginas.Enviando.Value +
                            "?id=" + IdSucursal +
                            "&suc=" + nombreSucursal +
                            "&act1=" + strAct1 +
                            "&act2=" + strAct2 +
                            "&act3=" + strAct3 +
                            "&emp=" + strIdEmpresa);
                    }
                }
            }
            else
            {
                txtNombreAdd.BorderColor = Color.Red;
                Modal.MostrarMsjModal(MensajeError.Error_Existe_Sucursal.Value, "ERR", this);
            }
        }
        #endregion

        private Boolean add_Area_Default()
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
                return false;
            }

        }

        private Boolean add_PuestoTrabajo_Default()
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
                return false;
            }
        }

        private Boolean add_Horario_Default()
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
                return false;
            }
        }

        private Boolean add_Trabajador_Default()
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
                return false;
            }
        }

        private Boolean add_Usuario_Default()
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
                return add_Tipo_Documento_Default();
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return false;
            }
        }

        private Boolean add_Tipo_Documento_Default()
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
                return false;
            }

        }

        private Boolean add_Lista_Actividad_Default()
        {
            if (CRUD.Add_Lista_Actividad(ObjUsuario, id_sucursal))
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
                return true;
            }
            else
            {
                CRUD.DeleteSucursal(ObjUsuario, id_sucursal);
                return false;
            }
        }


        #region filtros
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Listas.Codciiu_Div_item(ddlItemDivision1, "claseCiiu_Empresa", Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
                Listas.Codciiu_Div_item(ddlItemDivision2, "claseCiiu_Empresa", Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
                Listas.Codciiu_Div_item(ddlItemDivision3, "claseCiiu_Empresa", Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }

        protected void ddlRegionAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            Listas.Reg_Dpto_Mcpio(ddlDptoAdd, "RegionDpto", Convert.ToInt32(ddlRegionAdd.SelectedValue));
        }

        protected void ddlDptoAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            Listas.Reg_Dpto_Mcpio(ddlMcpioAdd, "McpioDpto", Convert.ToInt32(ddlDptoAdd.SelectedValue));
        }

        protected void ddlItemDivision1_SelectedIndexChanged(object sender, EventArgs e)
        {
            phActividad2.Visible = true;
        }

        protected void ddlItemDivision2_SelectedIndexChanged(object sender, EventArgs e)
        {
            phActividad3.Visible = true;
        }
        #endregion
    }
}