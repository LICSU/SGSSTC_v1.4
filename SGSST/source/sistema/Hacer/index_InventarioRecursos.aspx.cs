using System;
using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_InventarioRecursos : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

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
        }

        protected void btnCalculate_Onclick(object sender, EventArgs e)
        {
            phBtnPrint.Visible = true;

            Double totalSI = 0;
            Double totalNO = 0;

            for (int i = 1; i <= 33; i = i + 2)
            {
                HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)panel1.FindControl("radio" + i);
                HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)panel1.FindControl("radio" + (i + 1));

                if (miradio1.Checked == true) { totalSI++; }
                if (miradio2.Checked == true) { totalNO++; }
            }

            lbTotalSI.Text = "" + totalSI;
            lbTotalNO.Text = "" + totalNO;

            Double[] valores = { totalSI, totalNO };

            StringBuilder str = new StringBuilder();
            str.Append(@"<script type = *text/javascript* >
                       google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChart);
                        function drawChart()
                        {
                            var data = google.visualization.arrayToDataTable([
                            ['Task', 'Hours per Day'],
                            ['SI', " + totalSI + "],");

            str.Append(@"['NO'," + totalNO + "]]); ");

            str.Append(@"var options = {
                          title: 'Existencia de Recursos',
                          is3D: true,
                          width: 1000, 
                          height: 350,
                        };

                        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                        chart.draw(data, options);
                        
                        $('#ImgChart').attr('src', chart.getImageURI());
                        $('#rutaImg').val(chart.getImageURI());

                    }
                    </script>");

            string Myscript = str.ToString().Replace('*', '"');
            ltReporte.Text = Myscript;
            btnCalculate.Focus();
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            string[] titulos = {
            "RECURSOS HUMANOS",
            "Coordinador del Plan de Emergencias",
            "Director del Comité Operativo de Emergencias",
            "Director de Seguridad Física",
            "Director de Logística",
            "Director de Comunicaciones",
            "Jefe de Brigada",
            "Coordinador de la Unidad de prevención y control de incendios",
            "Coordinador de la Unidad de evacuación",
            "Coordinador de Primeros Auxilios",
            "Coordinador de la Unidad Especial (si aplica)",
            "Brigadistas",
            "Entidades de Socorro Externas (personal de la Cruz Roja, Defensa Civil o Bomberos)",
            "RECURSOS FÍSICOS O TÉCNICOS",
            "Medios de primeros auxilios y salvamento (Botiquines, Camillas, Sillas de rueda, Equipos de rescate)",
            "Equipos de protección individual",
            "Señales de Alarma",
            "Sistemas de detección",
            "Sistemas de alerta",
            "Sistemas de comunicación",
            "Sistemas de Iluminación de Emergencia",
            "Sistemas Contra Incendios",
            "Extintores Contra Incendios",
            "Señalización adecuada de vías y salidas",
            "Salidas de Emergencia",
            "Salidas de Emergencia",
            "Vías de acceso suficientes y adecuadas para la evacuación",
            "Escaleras para incendios",
            "Diques, puertas, muros cortafuego",
            "Drenajes adecuados",
            "Materiales peligrosos (control, ubicación y almacenamiento)",
            "Sismo resistencia",
            "Regaderas automáticas",
            "Sistemas de iluminación autónoma",
            "RECURSOS FINANCIEROS",
            "Recursos financieros aprobados para la prevención o el control de Emergencias Empresariales"
        };
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };

            PrintFile.PrintInventarioRecursos(valores, titulos, panel1, this);

            //    //chart
            //    string base64 = rutaImg.Value;
            //    byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
            //    Image grafica = Image.GetInstance(bytes);
            
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