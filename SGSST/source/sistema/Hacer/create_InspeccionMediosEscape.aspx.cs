using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_InspeccionMediosEscape : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

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
            else if (ObjUsuario.isAdm_Empresa())
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
            else
            {
                ViewState["sucursal"] = ObjUsuario.Id_sucursal;
                phInformacion.Visible = true;
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };

            String[] areaUbicacion = {
                "ÁREA DE UBICACIÓN",
                txtLamp1.Text,
                txtLamp2.Text,
                txtLamp3.Text,
                txtLamp4.Text,
                txtLamp5.Text
            };
            String[] edoConservacion = {
                "Estado de conservación",
                txtObsEstadoLamp1.Text,
                txtObsEstadoLamp2.Text,
                txtObsEstadoLamp3.Text,
                txtObsEstadoLamp4.Text,
                txtObsEstadoLamp5.Text
            };
            String[] fteIluminacion = {
                "Fuentes de iluminación",
                txtObsFuenteLamp1.Text,
                txtObsFuenteLamp2.Text,
                txtObsFuenteLamp3.Text,
                txtObsFuenteLamp4.Text,
                txtObsFuenteLamp5.Text
            };
            String[] marcaLampara = {
                "Marcación",
                txtObsMarcaLamp1.Text,
                txtObsMarcaLamp2.Text,
                txtObsMarcaLamp3.Text,
                txtObsMarcaLamp4.Text,
                txtObsMarcaLamp5.Text

            };
            String[] lucesLampara = {
                "Luces de Operación",
                txtObsLucesLamp1.Text,
                txtObsLucesLamp2.Text,
                txtObsLucesLamp3.Text,
                txtObsLucesLamp4.Text,
                txtObsLucesLamp5.Text,
            };
            String[] cajtaLampara = {
                "Cajetín",
                txtObsCajetLamp1.Text,
                txtObsCajetLamp2.Text,
                txtObsCajetLamp3.Text,
                txtObsCajetLamp4.Text,
                txtObsCajetLamp5.Text
            };
            String[] senas = {
                "ÁREA DE UBICACIÓN",
                txtSena1.Text,
                txtSena2.Text,
                txtSena3.Text,
                txtSena4.Text,
                txtSena5.Text
            };
            String[] exisSena = {
                "Existencia",
                txtObsExiSena1.Text,
                txtObsExiSena2.Text,
                txtObsExiSena3.Text,
                txtObsExiSena4.Text,
                txtObsExiSena5.Text
            };
            String[] obsEst = {
                "Estado de conservación",
                txtObsEstSena1.Text,
                txtObsEstSena2.Text,
                txtObsEstSena3.Text,
                txtObsEstSena4.Text,
                txtObsEstSena5.Text
            };
            String[] senaSena = {
                "Señal",
                txtObsSenaSena1.Text,
                txtObsSenaSena2.Text,
                txtObsSenaSena3.Text,
                txtObsSenaSena4.Text,
                txtObsSenaSena5.Text
            };
            String[] txtPas = {
                "ÁREA DE UBICACIÓN",
                txtPasi1.Text,
                txtPasi2.Text,
                txtPasi3.Text,
                txtPasi4.Text,
                txtPasi5.Text
            };
            String[] obsEstPasi = {
                "Estado de conservación",
                txtObsEstPasi1.Text,
                txtObsEstPasi2.Text,
                txtObsEstPasi3.Text,
                txtObsEstPasi4.Text,
                txtObsEstPasi5.Text
            };
            String[] obsAccPasi ={
                "Accesibilidad",
                txtObsAccPasi1.Text,
                txtObsAccPasi2.Text,
                txtObsAccPasi3.Text,
                txtObsAccPasi4.Text,
                txtObsAccPasi5.Text,
            };
            String[] obsAusPasi = {
                "Ausencia de obstáculos",
                txtObsAusPasi1.Text,
                txtObsAusPasi2.Text,
                txtObsAusPasi3.Text,
                txtObsAusPasi4.Text,
                txtObsAusPasi5.Text
            };
            PrintFile.PrintInspeccionMediosEscape(valores, areaUbicacion, edoConservacion, fteIluminacion, marcaLampara,
                                                  lucesLampara, cajtaLampara, senas, exisSena, obsEst, senaSena, txtPas,
                                                  obsEstPasi, obsAccPasi, obsAusPasi, this);
            
            
        }
        #endregion

        #region filtro
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["sucursal"] = "0";
            }
            else
            {
                ViewState["empresa"] = "0";
            }
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                phInformacion.Visible = true;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }
        #endregion
    }
}