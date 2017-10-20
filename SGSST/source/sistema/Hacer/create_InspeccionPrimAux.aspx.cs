using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_InspeccionPrimAux : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

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
            else
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

        }
        #endregion

        #region Imprimir
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            if (phInformacionTipoA.Visible)
            {
                genereDocumento("a");
            }
            else if (phInformacionTipoB.Visible)
            {
                genereDocumento("b");
            }
            else if (phInformacionTipoC.Visible)
            {
                genereDocumento("c");
            }
        }

        protected void genereDocumento(string datos)
        {
            #region inicializacion
            int cantidad = 0;
            string columna1 = string.Empty;
            string columna2 = string.Empty;
            string columna3 = string.Empty;
            string columna4 = string.Empty;
            string columna5 = string.Empty;
            string columna6 = string.Empty;
            string columna7 = string.Empty;
            string observacion = string.Empty;
            string tipo = string.Empty;
            Panel _panel = new Panel();
            if (datos == "a")
            {
                tipo = "(Tipo A)";
                cantidad = 13;
                columna1 = "lblAIns";
                columna2 = "lblACant";
                columna3 = "lblAUni";
                columna4 = "txtAExi";
                columna5 = "txtADif";
                columna6 = "txtAMot";
                columna7 = "ddlARemp";
                observacion = txtObsA.Text;
                _panel = pnDatosA;
            }
            else if (datos == "b")
            {
                tipo = "(Tipo B)";
                cantidad = 26;
                columna1 = "lblBIns";
                columna2 = "lblBCant";
                columna3 = "lblBUni";
                columna4 = "txtBExi";
                columna5 = "txtBDif";
                columna6 = "txtBMot";
                columna7 = "ddlBRemp";
                observacion = txtBObse.Text;
                _panel = pnDatosA;
            }
            else if (datos == "c")
            {
                tipo = "(Tipo C)";
                cantidad = 28;
                columna1 = "lblCIns";
                columna2 = "lblCCant";
                columna3 = "lblCUni";
                columna4 = "txtCExi";
                columna5 = "txtCDif";
                columna6 = "txtCMot";
                columna7 = "ddlCRemp";
                observacion = txtObsC.Text;
                _panel = pnDatosA;
            }

            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                tipo,
                cantidad.ToString(),
                columna1,
                columna2,
                columna3,
                columna4,
                columna5,
                columna6,
                columna7,
                observacion
            };

            PrintFile.PrintInspeccionBotiquin(valores, _panel, this);
            #endregion
        }
        #endregion

        #region filtro
        protected void calcularDif(object sender, EventArgs e)
        {
            WebControl myControl = sender as WebControl;
            ControlesDinamicos.calcularDif(myControl,pnDatosA,pnDatosB,pnDatosC);
        }

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
                phInformacionTipoA.Visible = true;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipo.SelectedValue != string.Empty)
            {
                ViewState["tipo"] = ddlSucursal.SelectedValue;
                phInformacionTipoA.Visible = false;
                phInformacionTipoB.Visible = false;
                phInformacionTipoC.Visible = false;
                if (ddlTipo.SelectedValue == "a")
                {
                    phInformacionTipoA.Visible = true;
                }
                else if (ddlTipo.SelectedValue == "b")
                {
                    phInformacionTipoB.Visible = true;
                }
                else
                {
                    phInformacionTipoC.Visible = true;
                }

            }
            else
            {
                ViewState["tipo"] = string.Empty;
            }
        }
        #endregion
        
    }
}