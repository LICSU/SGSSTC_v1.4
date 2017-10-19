using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_InspeccionExtintores : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
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

            if (!BoolEmpSuc.Item2)
            {
                Mgr_Area.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }

        }
        #endregion

        #region acciones
        private void cargarInformacion()
        {
            List<extintor> extintor = Getter.Extintor(Convert.ToInt32(ddlExtintor.SelectedValue));
            lblArea.Text = ddlArea.SelectedItem.Text;
            lblPeso.Text = extintor.ElementAt(0).peso;
            lblPresion.Text = extintor.ElementAt(0).presion;
            lblAgenteExt.Text = extintor.ElementAt(0).tipo_extintor;
            lblNroExtintor.Text = extintor.ElementAt(0).serial_extintor;
            DateTime fecha_ultima = extintor.ElementAt(0).fecha_ultima_recarga.Value;
            lblFechaUltimaRecarga.Text = fecha_ultima.Date.ToString("yyyy-MM-dd");
            DateTime fecha_proxima = extintor.ElementAt(0).fecha_proxima_recarga.Value;
            lblFechaProximaRecarga.Text = fecha_proxima.Date.ToString("yyyy-MM-dd");
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };

            String[] especificacion = {
                 "ESPECIFICACIONES DEL EXTINTOR",
                 "Área de ubicación: "+ddlArea.SelectedItem.Text,
                 "Peso: "+lblPeso.Text,
                 "Agente extintor: "+lblAgenteExt.Text,
                 "Presión: "+lblPresion.Text,
                 "N° de Extintor",
                 lblNroExtintor.Text,
                 "Fecha de Ultima Recarga",
                 lblFechaUltimaRecarga.Text,
                 "Fecha de Próxima Recarga",
                 lblFechaProximaRecarga.Text,
                 "Accesibilidad",
                 txtAccesibilidad.Text
            };

            String[] condiciones = {
                rblCondiciones.SelectedValue,
                rblSoporteExt.SelectedValue,
                rblSoporteMan.SelectedValue,
                rblMarcacion.SelectedValue,
                rblPrecintos.SelectedValue,
                rblManometro.SelectedValue,
                rblConjuntoMan.SelectedValue,
                rblAsaAcarreo.SelectedValue,
                rblValbulaAcc.SelectedValue,
                rblValvulaPre.SelectedValue,
                rblValvulaDis.SelectedValue,
                rblMecanismoPun.SelectedValue,
                rblTapaCil.SelectedValue,
                rblSenalizacion.SelectedValue
            };

            String[] titulos = {
                "Condiciones del Cilindro ",
                "Soporte del extintor ",
                "Soporte de la manguera ",
                "Marcación ",
                "Precintos y sellos de seguridad ",
                "Manómetro ",
                "Conjunto manguera ",
                "Asa de acarreo ",
                "Válvula de acción instantánea ",
                "Válvula de presurización ",
                "Válvula de dispersión ",
                "Mecanismo de punzado ",
                "Tapa del cilindro ",
                "Señalización y Demarcación "
            };

            String[] color = {
                PrintFile.GetTextValue(rblCondiciones),
                PrintFile.GetTextValue(rblSoporteExt),
                PrintFile.GetTextValue(rblSoporteMan),
                PrintFile.GetTextValue(rblMarcacion),
                PrintFile.GetTextValue(rblPrecintos),
                PrintFile.GetTextValue(rblManometro),
                PrintFile.GetTextValue(rblConjuntoMan),
                PrintFile.GetTextValue(rblAsaAcarreo),
                PrintFile.GetTextValue(rblValbulaAcc),
                PrintFile.GetTextValue(rblValvulaPre),
                PrintFile.GetTextValue(rblValvulaDis),
                PrintFile.GetTextValue(rblMecanismoPun),
                PrintFile.GetTextValue(rblTapaCil),
                PrintFile.GetTextValue(rblSenalizacion)
            };

            PrintFile.PrintInspeccionExtintores(valores, especificacion, condiciones, titulos, color, this);
        }

        protected void btnDescargar_Onclick(object sender, EventArgs e)
        {

            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };

            String[] especificacion = {
                 "ESPECIFICACIONES DEL EXTINTOR",
                 "Área de ubicación: ",
                 "Peso: ",
                 "Agente extintor: ",
                 "Presión: ",
                 "N° de Extintor",
                 " ",
                 "Fecha de Ultima Recarga",
                 " ",
                 "Fecha de Próxima Recarga",
                 " ",
                 "Accesibilidad",
                 " ",
            };

            String[] condiciones = {
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " "
            };

            String[] titulos = {
                "Condiciones del Cilindro ",
                "Soporte del extintor ",
                "Soporte de la manguera ",
                "Marcación ",
                "Precintos y sellos de seguridad ",
                "Manómetro ",
                "Conjunto manguera ",
                "Asa de acarreo ",
                "Válvula de acción instantánea ",
                "Válvula de presurización ",
                "Válvula de dispersión ",
                "Mecanismo de punzado ",
                "Tapa del cilindro ",
                "Señalización y Demarcación "
            };

            String[] color = {
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " ",
                " "
            };

            PrintFile.PrintInspeccionExtintores(valores, especificacion, condiciones, titulos, color, this);
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
                Mgr_Area.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
                ViewState["area"] = "";
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                ViewState["area"] = ddlArea.SelectedValue;
                Listas.Extintor_Area(ddlExtintor, Convert.ToInt32(ddlArea.SelectedValue));
                ViewState["extintor"] = "";
            }
            else
            {
                ViewState["area"] = "0";
            }
        }

        protected void ddlExtintor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlExtintor.SelectedValue != string.Empty)
            {
                cargarInformacion();
                phInformacion.Visible = true;
                phNoRegistros.Visible = false;
                phBotones.Visible = true;
            }
            else
            {
                phInformacion.Visible = false;
                phNoRegistros.Visible = true;
                phBotones.Visible = false;
            }

        }
        #endregion
        
    }
}