﻿using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web;
using System.Web.Security;
using Capa_Datos.Manager.CodigoCiiu;
using Capa_Datos.Manager.Horario;
using Capa_Datos.Manager.Documento;
using Capa_Datos.Manager.PlanTrabajo;
using Capa_Datos.Manager.Gobierno;

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

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

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
                Mgr_Empresa.Lista_Empresa(ddlEmpresaAdd);
            }
            else
            {
                Mgr_CodigoCiiu.List_Codciiu_Div_item(ddlItemDivision1, "claseCiiu_Empresa", ObjUsuario.Id_empresa);
                Mgr_CodigoCiiu.List_Codciiu_Div_item(ddlItemDivision2, "claseCiiu_Empresa", ObjUsuario.Id_empresa);
                Mgr_CodigoCiiu.List_Codciiu_Div_item(ddlItemDivision3, "claseCiiu_Empresa", ObjUsuario.Id_empresa);
            }
            Mgr_Gobierno.Get_Reg_Dpto_Mcpio(ddlRegionAdd, "Region");
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

            int idSucursal = Mgr_Sucursal.Get_SucursalByNombre(txtNombreAdd.Text, IdEmpresa);

            if (idSucursal == 0)
            {
                act1 = Convert.ToInt32(ddlItemDivision1.SelectedValue);
                act2 = ddlItemDivision2.SelectedValue == string.Empty ? 0 : Convert.ToInt32(ddlItemDivision2.SelectedValue);
                act3 = ddlItemDivision3.SelectedValue == string.Empty ? 0 : Convert.ToInt32(ddlItemDivision3.SelectedValue);
                IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);
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

                if (Mgr_Sucursal.Add_Sucursal( valores))
                {
                    id_sucursal = Mgr_Sucursal.Get_Sucursal();
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

            if (Mgr_Area.Add_Area_Sucursal( valores))
            {
                return add_PuestoTrabajo_Default();
            }
            else
            {
                Mgr_Sucursal.Delete_Sucursal( id_sucursal);
                return false;
            }

        }

        private Boolean add_PuestoTrabajo_Default()
        {
            String[] valores = {
                nombreSucursal
            };

            if (Mgr_PuestoTrabajo.Add_PuestoTrabajo_Sucursal( valores))
            {
                return add_Horario_Default();
            }
            else
            {
                Mgr_Sucursal.Delete_Sucursal( id_sucursal);
                return false;
            }
        }

        private Boolean add_Horario_Default()
        {
            String[] valores = {
                nombreSucursal
            };

            if (Mgr_Horario.Add_Horario_Sucursal( valores))
            {
                return add_Trabajador_Default();
            }
            else
            {
                Mgr_Sucursal.Delete_Sucursal(id_sucursal);
                return false;
            }
        }

        private Boolean add_Trabajador_Default()
        {
            String[] valores = {
                nombreSucursal
            };

            if (Mgr_Trabajador.Add_Trabajador_Sucursal( valores))
            {
                return add_Usuario_Default();
            }
            else
            {
                Mgr_Sucursal.Delete_Sucursal( id_sucursal);
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

            if (Capa_Datos.Manager.Usuario.Mgr_Usuario.Add_Usuario_Sucursal( valores))
            {
                return add_Tipo_Documento_Default();
            }
            else
            {
                Mgr_Sucursal.Delete_Sucursal(id_sucursal);
                return false;
            }
        }

        private Boolean add_Tipo_Documento_Default()
        {
            String[] valores = {
                ""+id_sucursal
            };

            if (Mgr_Documento.Add_TipoDocumento_Sucursal( valores))
            {
                return add_Lista_Actividad_Default();
            }
            else
            {
                Mgr_Sucursal.Delete_Sucursal(id_sucursal);
                return false;
            }

        }

        private Boolean add_Lista_Actividad_Default()
        {
            if (Mgr_PlanTrabajo.Add_Lista_Actividad(id_sucursal))
            {
                string empresa = "", correo = "";
                List<empresa> data_empresa = Mgr_Empresa.Get_EmpresaEmail(IdEmpresa);
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
                Mgr_Sucursal.Delete_Sucursal(id_sucursal);
                return false;
            }
        }

        #region filtros
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Mgr_CodigoCiiu.List_Codciiu_Div_item(ddlItemDivision1, "claseCiiu_Empresa", Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
                Mgr_CodigoCiiu.List_Codciiu_Div_item(ddlItemDivision2, "claseCiiu_Empresa", Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
                Mgr_CodigoCiiu.List_Codciiu_Div_item(ddlItemDivision3, "claseCiiu_Empresa", Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }

        protected void ddlRegionAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            Mgr_Gobierno.Get_Reg_Dpto_Mcpio(ddlDptoAdd, "RegionDpto", Convert.ToInt32(ddlRegionAdd.SelectedValue));
        }

        protected void ddlDptoAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            Mgr_Gobierno.Get_Reg_Dpto_Mcpio(ddlMcpioAdd, "McpioDpto", Convert.ToInt32(ddlDptoAdd.SelectedValue));
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