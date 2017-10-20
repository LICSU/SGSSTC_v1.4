using System;
using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class create_AnalisisVulnerabilidad : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

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
            if (BoolEmpSuc.Item2)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                PrintFile.GetRadioValue(RadioButtonList1),
                PrintFile.GetRadioValue(RadioButtonList2),
                PrintFile.GetRadioValue(RadioButtonList3),
                PrintFile.GetRadioValue(RadioButtonList4),
                PrintFile.GetRadioValue(RadioButtonList5),
                PrintFile.GetRadioValue(RadioButtonList6),
                PrintFile.GetRadioValue(RadioButtonList7),
                PrintFile.GetRadioValue(RadioButtonList8),
                PrintFile.GetRadioValue(RadioButtonList9),
                PrintFile.GetRadioValue(RadioButtonList10),
                PrintFile.GetRadioValue(RadioButtonList11),
                PrintFile.GetRadioValue(RadioButtonList12),
                PrintFile.GetRadioValue(RadioButtonList13),
                PrintFile.GetRadioValue(RadioButtonList14),
                PrintFile.GetRadioValue(RadioButtonList15),
                PrintFile.GetRadioValue(RadioButtonList16),
                PrintFile.GetRadioValue(RadioButtonList17),
                PrintFile.GetRadioValue(RadioButtonList18),
                PrintFile.GetRadioValue(RadioButtonList19),
                PrintFile.GetRadioValue(RadioButtonList20),
                PrintFile.GetRadioValue(RadioButtonList21),
                PrintFile.GetRadioValue(RadioButtonList22),
                PrintFile.GetRadioValue(RadioButtonList23),
                PrintFile.GetRadioValue(RadioButtonList24),
                PrintFile.GetRadioValue(RadioButtonList25),
                PrintFile.GetRadioValue(RadioButtonList26),
                PrintFile.GetRadioValue(RadioButtonList27),
                PrintFile.GetRadioValue(RadioButtonList28),
                PrintFile.GetRadioValue(RadioButtonList29),
                PrintFile.GetRadioValue(RadioButtonList30),
                PrintFile.GetRadioValue(RadioButtonList31),
                PrintFile.GetRadioValue(RadioButtonList32),
                PrintFile.GetRadioValue(RadioButtonList33),
                PrintFile.GetRadioValue(RadioButtonList34),
                PrintFile.GetRadioValue(RadioButtonList35),
                PrintFile.GetRadioValue(RadioButtonList36),
                PrintFile.GetRadioValue(RadioButtonList37),
                PrintFile.GetRadioValue(RadioButtonList38),
                PrintFile.GetRadioValue(RadioButtonList39),
                PrintFile.GetRadioValue(RadioButtonList40),
                PrintFile.GetRadioValue(RadioButtonList41),
                PrintFile.GetRadioValue(RadioButtonList42),
                PrintFile.GetRadioValue(RadioButtonList43),
                PrintFile.GetRadioValue(RadioButtonList44),
                PrintFile.GetRadioValue(RadioButtonList45),
                PrintFile.GetRadioValue(RadioButtonList46),
                PrintFile.GetRadioValue(RadioButtonList47),
                PrintFile.GetRadioValue(RadioButtonList48),
                PrintFile.GetRadioValue(RadioButtonList49),
                PrintFile.GetRadioValue(RadioButtonList50),
                PrintFile.GetRadioValue(RadioButtonList51),
                PrintFile.GetRadioValue(RadioButtonList52),
                PrintFile.GetRadioValue(RadioButtonList53),
                PrintFile.GetRadioValue(RadioButtonList54),
                PrintFile.GetRadioValue(RadioButtonList55),
                PrintFile.GetRadioValue(RadioButtonList56),
                PrintFile.GetRadioValue(RadioButtonList57),
                PrintFile.GetRadioValue(RadioButtonList58),
                PrintFile.GetRadioValue(RadioButtonList59),
                PrintFile.GetRadioValue(RadioButtonList60),
                PrintFile.GetRadioValue(RadioButtonList61),
                PrintFile.GetRadioValue(RadioButtonList62),
                PrintFile.GetRadioValue(RadioButtonList63),
                PrintFile.GetRadioValue(RadioButtonList64),
                PrintFile.GetRadioValue(RadioButtonList65),
                PrintFile.GetRadioValue(RadioButtonList66),
                PrintFile.GetRadioValue(RadioButtonList67),
                PrintFile.GetRadioValue(RadioButtonList68),
                PrintFile.GetRadioValue(RadioButtonList69),
            };

            String[] valoresText = {
                    PuntajeF1.Text,
                    PuntajeF2.Text,
                    PuntajeF3.Text,
                    PuntajeF4.Text,
                    PuntajeF5.Text,
                    PuntajeF6.Text,
                    PuntajeF7.Text,
                    PuntajeF8.Text,
                    PuntajeF9.Text,
                    PuntajeF10.Text,
                    PuntajeF11.Text,
                    PuntajeF12.Text,
                    PuntajeF13.Text,
                    PuntajeF14.Text,
                    PuntajeF15.Text,
                    PuntajeF16.Text,
                    PuntajeF17.Text,
                    PuntajeF18.Text,
                    PuntajeF19.Text,
                    PuntajeF20.Text,
                    PuntajeF21.Text,
                    PuntajeF22.Text,
                    PuntajeF23.Text,
                    PuntajeF24.Text,
                    PuntajeF25.Text,
                    PuntajeF26.Text,
                    PuntajeF27.Text,
                    PuntajeF28.Text,
                    PuntajeF29.Text,
                    PuntajeF30.Text,
                    PuntajeF31.Text,
                    PuntajeF32.Text,
                    PuntajeF33.Text,
                    PuntajeF34.Text,
                    PuntajeF35.Text,
                    PuntajeF36.Text,
                    PuntajeF37.Text,
                    PuntajeF38.Text,
                    PuntajeF39.Text,
                    PuntajeF40.Text,
                    PuntajeF41.Text,
                    PuntajeF42.Text,
                    PuntajeF43.Text,
                    PuntajeF44.Text,
                    PuntajeF45.Text,
                    PuntajeF46.Text,
                    PuntajeF47.Text,
                    PuntajeF48.Text,
                    PuntajeF49.Text,
                    PuntajeF50.Text,
                    PuntajeF51.Text,
                    PuntajeF52.Text,
                    PuntajeF53.Text,
                    PuntajeF54.Text,
                    PuntajeF55.Text,
                    PuntajeF56.Text,
                    PuntajeF57.Text,
                    PuntajeF58.Text,
                    PuntajeF59.Text,
                    PuntajeF60.Text,
                    PuntajeF61.Text,
                    PuntajeF62.Text,
                    PuntajeF63.Text,
                    PuntajeF64.Text,
                    PuntajeF65.Text,
                    PuntajeF66.Text,
                    PuntajeF67.Text,
                    PuntajeF68.Text,
                    PuntajeF69.Text,
            };

            PrintFile.PrintAnalisisVulnerabilidad(valores, valoresText, this, txtArea, txtObjetivo, txtAlcance, puntajeABC.Text, txtConclusiones.InnerText,
                txtFortalezas.InnerText, txtDebilidades.InnerText);

        }

        protected void Riesgos_SelectedIndexChanged(object sender, EventArgs e)
        {
            double contadorA = 0;
            double contadorB = 0;
            double contadorC = 0;
            double puntaje = 0;

            RadioButtonList miRadio = sender as RadioButtonList;

            #region validar radio buttons
            for (int i = 1; i < 70; i = i + 3)
            {
                if (miRadio.ID == "RadioButtonList" + i)
                {
                    #region codigo
                    if (i == 1) { RadioButtonList2.SelectedIndex = -1; RadioButtonList3.SelectedIndex = -1; }
                    if (i == 4) { RadioButtonList5.SelectedIndex = -1; RadioButtonList6.SelectedIndex = -1; }
                    if (i == 7) { RadioButtonList8.SelectedIndex = -1; RadioButtonList9.SelectedIndex = -1; }
                    if (i == 10) { RadioButtonList11.SelectedIndex = -1; RadioButtonList12.SelectedIndex = -1; }
                    if (i == 13) { RadioButtonList14.SelectedIndex = -1; RadioButtonList15.SelectedIndex = -1; }
                    if (i == 16) { RadioButtonList17.SelectedIndex = -1; RadioButtonList18.SelectedIndex = -1; }
                    if (i == 19) { RadioButtonList20.SelectedIndex = -1; RadioButtonList21.SelectedIndex = -1; }
                    if (i == 22) { RadioButtonList23.SelectedIndex = -1; RadioButtonList24.SelectedIndex = -1; }
                    if (i == 25) { RadioButtonList26.SelectedIndex = -1; RadioButtonList27.SelectedIndex = -1; }
                    if (i == 28) { RadioButtonList29.SelectedIndex = -1; RadioButtonList30.SelectedIndex = -1; }
                    if (i == 31) { RadioButtonList32.SelectedIndex = -1; RadioButtonList33.SelectedIndex = -1; }
                    if (i == 34) { RadioButtonList35.SelectedIndex = -1; RadioButtonList36.SelectedIndex = -1; }
                    if (i == 37) { RadioButtonList38.SelectedIndex = -1; RadioButtonList39.SelectedIndex = -1; }
                    if (i == 40) { RadioButtonList41.SelectedIndex = -1; RadioButtonList42.SelectedIndex = -1; }
                    if (i == 43) { RadioButtonList44.SelectedIndex = -1; RadioButtonList45.SelectedIndex = -1; }
                    if (i == 46) { RadioButtonList47.SelectedIndex = -1; RadioButtonList48.SelectedIndex = -1; }
                    if (i == 49) { RadioButtonList50.SelectedIndex = -1; RadioButtonList51.SelectedIndex = -1; }
                    if (i == 52) { RadioButtonList53.SelectedIndex = -1; RadioButtonList54.SelectedIndex = -1; }
                    if (i == 55) { RadioButtonList56.SelectedIndex = -1; RadioButtonList57.SelectedIndex = -1; }
                    if (i == 58) { RadioButtonList59.SelectedIndex = -1; RadioButtonList60.SelectedIndex = -1; }
                    if (i == 61) { RadioButtonList62.SelectedIndex = -1; RadioButtonList63.SelectedIndex = -1; }
                    if (i == 64) { RadioButtonList65.SelectedIndex = -1; RadioButtonList66.SelectedIndex = -1; }
                    if (i == 67) { RadioButtonList68.SelectedIndex = -1; RadioButtonList69.SelectedIndex = -1; }
                    #endregion
                }
                else if (miRadio.ID == "RadioButtonList" + (i + 1))
                {
                    #region codigo
                    if (i == 1) { RadioButtonList1.SelectedIndex = -1; RadioButtonList3.SelectedIndex = -1; }
                    if (i == 4) { RadioButtonList4.SelectedIndex = -1; RadioButtonList6.SelectedIndex = -1; }
                    if (i == 7) { RadioButtonList7.SelectedIndex = -1; RadioButtonList9.SelectedIndex = -1; }
                    if (i == 10) { RadioButtonList10.SelectedIndex = -1; RadioButtonList12.SelectedIndex = -1; }
                    if (i == 13) { RadioButtonList13.SelectedIndex = -1; RadioButtonList15.SelectedIndex = -1; }
                    if (i == 16) { RadioButtonList16.SelectedIndex = -1; RadioButtonList18.SelectedIndex = -1; }
                    if (i == 19) { RadioButtonList19.SelectedIndex = -1; RadioButtonList21.SelectedIndex = -1; }
                    if (i == 22) { RadioButtonList22.SelectedIndex = -1; RadioButtonList24.SelectedIndex = -1; }
                    if (i == 25) { RadioButtonList25.SelectedIndex = -1; RadioButtonList27.SelectedIndex = -1; }
                    if (i == 28) { RadioButtonList28.SelectedIndex = -1; RadioButtonList30.SelectedIndex = -1; }
                    if (i == 31) { RadioButtonList31.SelectedIndex = -1; RadioButtonList33.SelectedIndex = -1; }
                    if (i == 34) { RadioButtonList34.SelectedIndex = -1; RadioButtonList36.SelectedIndex = -1; }
                    if (i == 37) { RadioButtonList37.SelectedIndex = -1; RadioButtonList39.SelectedIndex = -1; }
                    if (i == 40) { RadioButtonList40.SelectedIndex = -1; RadioButtonList42.SelectedIndex = -1; }
                    if (i == 43) { RadioButtonList43.SelectedIndex = -1; RadioButtonList45.SelectedIndex = -1; }
                    if (i == 46) { RadioButtonList46.SelectedIndex = -1; RadioButtonList48.SelectedIndex = -1; }
                    if (i == 49) { RadioButtonList49.SelectedIndex = -1; RadioButtonList51.SelectedIndex = -1; }
                    if (i == 52) { RadioButtonList52.SelectedIndex = -1; RadioButtonList54.SelectedIndex = -1; }
                    if (i == 55) { RadioButtonList55.SelectedIndex = -1; RadioButtonList57.SelectedIndex = -1; }
                    if (i == 58) { RadioButtonList58.SelectedIndex = -1; RadioButtonList60.SelectedIndex = -1; }
                    if (i == 61) { RadioButtonList61.SelectedIndex = -1; RadioButtonList63.SelectedIndex = -1; }
                    if (i == 64) { RadioButtonList64.SelectedIndex = -1; RadioButtonList66.SelectedIndex = -1; }
                    if (i == 67) { RadioButtonList67.SelectedIndex = -1; RadioButtonList69.SelectedIndex = -1; }
                    #endregion
                }
                else if (miRadio.ID == "RadioButtonList" + (i + 2))
                {
                    #region codigo
                    if (i == 1) { RadioButtonList1.SelectedIndex = -1; RadioButtonList2.SelectedIndex = -1; }
                    if (i == 4) { RadioButtonList4.SelectedIndex = -1; RadioButtonList5.SelectedIndex = -1; }
                    if (i == 7) { RadioButtonList7.SelectedIndex = -1; RadioButtonList8.SelectedIndex = -1; }
                    if (i == 10) { RadioButtonList10.SelectedIndex = -1; RadioButtonList11.SelectedIndex = -1; }
                    if (i == 13) { RadioButtonList13.SelectedIndex = -1; RadioButtonList14.SelectedIndex = -1; }
                    if (i == 16) { RadioButtonList16.SelectedIndex = -1; RadioButtonList17.SelectedIndex = -1; }
                    if (i == 19) { RadioButtonList19.SelectedIndex = -1; RadioButtonList20.SelectedIndex = -1; }
                    if (i == 22) { RadioButtonList22.SelectedIndex = -1; RadioButtonList23.SelectedIndex = -1; }
                    if (i == 25) { RadioButtonList25.SelectedIndex = -1; RadioButtonList26.SelectedIndex = -1; }
                    if (i == 28) { RadioButtonList28.SelectedIndex = -1; RadioButtonList29.SelectedIndex = -1; }
                    if (i == 31) { RadioButtonList31.SelectedIndex = -1; RadioButtonList32.SelectedIndex = -1; }
                    if (i == 34) { RadioButtonList34.SelectedIndex = -1; RadioButtonList35.SelectedIndex = -1; }
                    if (i == 37) { RadioButtonList37.SelectedIndex = -1; RadioButtonList38.SelectedIndex = -1; }
                    if (i == 40) { RadioButtonList40.SelectedIndex = -1; RadioButtonList41.SelectedIndex = -1; }
                    if (i == 43) { RadioButtonList43.SelectedIndex = -1; RadioButtonList44.SelectedIndex = -1; }
                    if (i == 46) { RadioButtonList46.SelectedIndex = -1; RadioButtonList47.SelectedIndex = -1; }
                    if (i == 49) { RadioButtonList49.SelectedIndex = -1; RadioButtonList50.SelectedIndex = -1; }
                    if (i == 52) { RadioButtonList52.SelectedIndex = -1; RadioButtonList53.SelectedIndex = -1; }
                    if (i == 55) { RadioButtonList55.SelectedIndex = -1; RadioButtonList56.SelectedIndex = -1; }
                    if (i == 58) { RadioButtonList58.SelectedIndex = -1; RadioButtonList59.SelectedIndex = -1; }
                    if (i == 61) { RadioButtonList61.SelectedIndex = -1; RadioButtonList62.SelectedIndex = -1; }
                    if (i == 64) { RadioButtonList64.SelectedIndex = -1; RadioButtonList65.SelectedIndex = -1; }
                    if (i == 67) { RadioButtonList67.SelectedIndex = -1; RadioButtonList68.SelectedIndex = -1; }
                    #endregion
                }
            }
            #endregion

            foreach (Control cComponente in MyUpdatePanel.Controls)
            {
                foreach (Control item in cComponente.Controls)
                {
                    RadioButtonList miRadio1;

                    if (item is RadioButtonList)
                    {
                        miRadio1 = (RadioButtonList)item;
                        if (miRadio1.SelectedValue == "4")
                        {
                            contadorA++;
                        }
                        else if (miRadio1.SelectedValue == "2")
                        {
                            contadorB++;
                        }
                        else if (miRadio1.SelectedValue == "0.4")
                        {
                            contadorC++;
                        }
                    }
                }
            }

            #region calculo

            puntajeA1.Text = string.Empty + contadorA;
            puntajeA2.Text = string.Empty + (contadorA * 4);

            puntajeB1.Text = string.Empty + contadorB;
            puntajeB2.Text = string.Empty + (contadorB * 2);

            puntajeC1.Text = string.Empty + contadorC;
            puntajeC2.Text = string.Empty + (contadorC * 0.4);

            puntaje = (contadorA * 4) + (contadorB * 2) + (contadorC * 0.4);
            puntajeABC.Text = string.Empty + puntaje;

            if (puntaje > 0 && puntaje <= 50)
            {
                txtAcciones.Text = "La edificacion presenta una alta vulnerabilidad funcional, se deben revisar todos los aspectos " +
                    "que puedan estar representando riesgo para las personas que permanecen en el edificio en un momento de emergencia";
            }
            else if (puntaje >= 51 && puntaje <= 70)
            {
                txtAcciones.Text = "La edificacion presenta vulnerabilidad media-alta y un plan para emergencia incompleto, que solo" +
                    " podria ser activado parcialmente en caso de emergencia";
            }
            else if (puntaje >= 71 && puntaje <= 90)
            {
                txtAcciones.Text = "La edificacion presenta vulnerabilidad baja y un plan de emergencia apenas funcional que debe optimizarse";
            }
            else if (puntaje >= 91 && puntaje <= 100)
            {
                txtAcciones.Text = "La vulnerabilidad es minima y el plan presenta un estado optimo de aplicaciòn";
            }
            #endregion

            #region bloque 1-10
            PuntajeF1.Text = RadioButtonList1.SelectedValue;
            PuntajeF2.Text = RadioButtonList2.SelectedValue;
            PuntajeF3.Text = RadioButtonList3.SelectedValue;
            PuntajeF4.Text = RadioButtonList4.SelectedValue;
            PuntajeF5.Text = RadioButtonList5.SelectedValue;
            PuntajeF6.Text = RadioButtonList6.SelectedValue;
            PuntajeF7.Text = RadioButtonList7.SelectedValue;
            PuntajeF8.Text = RadioButtonList8.SelectedValue;
            PuntajeF9.Text = RadioButtonList9.SelectedValue;
            PuntajeF10.Text = RadioButtonList10.SelectedValue;
            #endregion

            #region bloque 11-20
            PuntajeF11.Text = RadioButtonList11.SelectedValue;
            PuntajeF12.Text = RadioButtonList12.SelectedValue;
            PuntajeF13.Text = RadioButtonList13.SelectedValue;
            PuntajeF14.Text = RadioButtonList14.SelectedValue;
            PuntajeF15.Text = RadioButtonList15.SelectedValue;
            PuntajeF16.Text = RadioButtonList16.SelectedValue;
            PuntajeF17.Text = RadioButtonList17.SelectedValue;
            PuntajeF18.Text = RadioButtonList18.SelectedValue;
            PuntajeF19.Text = RadioButtonList19.SelectedValue;
            PuntajeF20.Text = RadioButtonList20.SelectedValue;
            #endregion

            #region bloque 21-30
            PuntajeF21.Text = RadioButtonList21.SelectedValue;
            PuntajeF22.Text = RadioButtonList22.SelectedValue;
            PuntajeF23.Text = RadioButtonList23.SelectedValue;
            PuntajeF24.Text = RadioButtonList24.SelectedValue;
            PuntajeF25.Text = RadioButtonList25.SelectedValue;
            PuntajeF26.Text = RadioButtonList26.SelectedValue;
            PuntajeF27.Text = RadioButtonList27.SelectedValue;
            PuntajeF28.Text = RadioButtonList28.SelectedValue;
            PuntajeF29.Text = RadioButtonList29.SelectedValue;
            PuntajeF30.Text = RadioButtonList30.SelectedValue;
            #endregion

            #region bloque 31-40
            PuntajeF31.Text = RadioButtonList31.SelectedValue;
            PuntajeF32.Text = RadioButtonList32.SelectedValue;
            PuntajeF33.Text = RadioButtonList33.SelectedValue;
            PuntajeF34.Text = RadioButtonList34.SelectedValue;
            PuntajeF35.Text = RadioButtonList35.SelectedValue;
            PuntajeF36.Text = RadioButtonList36.SelectedValue;
            PuntajeF37.Text = RadioButtonList37.SelectedValue;
            PuntajeF38.Text = RadioButtonList38.SelectedValue;
            PuntajeF39.Text = RadioButtonList39.SelectedValue;
            PuntajeF40.Text = RadioButtonList40.SelectedValue;
            #endregion

            #region bloque 41-50
            PuntajeF41.Text = RadioButtonList41.SelectedValue;
            PuntajeF42.Text = RadioButtonList42.SelectedValue;
            PuntajeF43.Text = RadioButtonList43.SelectedValue;
            PuntajeF44.Text = RadioButtonList44.SelectedValue;
            PuntajeF45.Text = RadioButtonList45.SelectedValue;
            PuntajeF46.Text = RadioButtonList46.SelectedValue;
            PuntajeF47.Text = RadioButtonList47.SelectedValue;
            PuntajeF48.Text = RadioButtonList48.SelectedValue;
            PuntajeF49.Text = RadioButtonList49.SelectedValue;
            PuntajeF50.Text = RadioButtonList50.SelectedValue;
            #endregion

            #region bloque 51-60
            PuntajeF51.Text = RadioButtonList51.SelectedValue;
            PuntajeF52.Text = RadioButtonList52.SelectedValue;
            PuntajeF53.Text = RadioButtonList53.SelectedValue;
            PuntajeF54.Text = RadioButtonList54.SelectedValue;
            PuntajeF55.Text = RadioButtonList55.SelectedValue;
            PuntajeF56.Text = RadioButtonList56.SelectedValue;
            PuntajeF57.Text = RadioButtonList57.SelectedValue;
            PuntajeF58.Text = RadioButtonList58.SelectedValue;
            PuntajeF59.Text = RadioButtonList59.SelectedValue;
            PuntajeF60.Text = RadioButtonList60.SelectedValue;
            #endregion

            #region bloque 61-69
            PuntajeF61.Text = RadioButtonList61.SelectedValue;
            PuntajeF62.Text = RadioButtonList62.SelectedValue;
            PuntajeF63.Text = RadioButtonList63.SelectedValue;
            PuntajeF64.Text = RadioButtonList64.SelectedValue;
            PuntajeF65.Text = RadioButtonList65.SelectedValue;
            PuntajeF66.Text = RadioButtonList66.SelectedValue;
            PuntajeF67.Text = RadioButtonList67.SelectedValue;
            PuntajeF68.Text = RadioButtonList68.SelectedValue;
            PuntajeF69.Text = RadioButtonList69.SelectedValue;
            #endregion

        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}