using System;
using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
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
    public partial class index_InventarioRiesgos : Page
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

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            #region cuerpo
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };
            string[] titulos = {
            "INCENDIOS",
            "Incendios de Solidos Combustibles, implican madera, tejidos, goma, papel y algunos tipos de plástico o sintéticos",
            "Incendio de Liquidos Inflamables o Combustibles, que implican gasolina, aceites, pintura, gases y líquidos inflamables y lubricantes.",
            "Incendios en los vehículos o medios de transporte",
            "Por fallas Eléctricas, cortocircuitos",
            "Generados por metales alcalinos o por polvos metálicos",
            "incendios forestales en zonas exteriores al Galpón, oficina o Edificio",
            "Incendios en las zonas aledañas ",
            "EXPLOSIONES",
            "Explosión por polvos orgánicos",
            "Amenaza de Bomba",
            "Explosión por fugas gases y vapores inflamables",
            "Explosión por Derrames",
            "Explosión por recipientes sometidos a presión.",
            "Substancias detonantes ",
            "DERRAMES",
            "Desechos tóxicos",
            "Productos Químicos",
            "Hidrocarburos",
            "Materiales espontáneamente combustibles",
            "Materiales Tóxicos",
            "Sustancias oxidantes",
            "Sustancias Corrosivas",
            "FUGAS",
            "Líquidos Inflamables",
            "Gases Inflamables",
            "Gases Licuados",
            "Gases tóxicos por inhalación",
            "Gases corrosivos",
            "Sólidos que emiten gases inflamables al contacto con el agua",
            "EXPOSICIONES",
            "Contacto con Materiales Peligrosos",
            "Sustancias Infecciosas",
            "Sustancias Corrosivas",
            "Bacterias",
            "Virus",
            "Insectos y otros agentes biológicos",
            "Materiales Radioactivos",
            "FALLAS GEOLÓGICAS",
            "Terremotos",
            "Maremotos",
            "Erupciones volcánicas",
            "Deslizamientos de Tierra",
            "Deslizamientos de lodo",
            "Derrumbes o Desplome de Estructuras",
            "FALLAS METEOROLÓGICAS O CLIMÁTICAS",
            "Huracanes",
            "Tormentas ",
            "Granizadas",
            "Ciclones",
            "inundaciones",
            "Sequías",
            "Olas de calor",
            "Olas de frío",
            "SOCIALES",
            "conflictos sociales",
            "acciones vandálicas ",
            "Desastres civiles",
            "Protesta urbana",
            "accidentes en transporte",
            "Atentados terroristas",
            "OTROS RIESGOS PROPIOS DE LA ACTIVIDAD ECONÓMICA DE LA EMPRESA",
            "Caída de Objetos apilados o almacenados",
            "Obstrucción de las vías de Escape",
            "Atrapamiento de Personas",
            "Rotura de instalaciones"
        };

            PrintFile.PrintInventarioRiesgos(valores, titulos, panel1, this);

            //    //chart
            //    string base64 = rutaImg.Value;
            //    byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
            //    iTextSharp.text.Image grafica = iTextSharp.text.Image.GetInstance(bytes);
            //    #endregion

            //    ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdEmpSuc.Item2, this, grafica);
            #endregion
        }

        protected void btnCalculate_Onclick(object sender, EventArgs e)
        {
            phBtnPrint.Visible = true;

            Double totalAlta = 0;
            Double totalMedia = 0;
            Double totalBaja = 0;

            for (int i = 1; i <= 171; i = i + 3)
            {
                HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)panel1.FindControl("radio" + i);
                HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)panel1.FindControl("radio" + (i + 1));
                HtmlInputRadioButton miradio3 = (HtmlInputRadioButton)panel1.FindControl("radio" + (i + 2));

                if (miradio1.Checked == true) { totalAlta++; }
                if (miradio2.Checked == true) { totalMedia++; }
                if (miradio3.Checked == true) { totalBaja++; }
            }

            lbTotalAlta.Text = "" + totalAlta;
            lbTotalMedia.Text = "" + totalMedia;
            lbTotalBaja.Text = "" + totalBaja;

            Double[] valores = { totalAlta, totalMedia, totalBaja };

            StringBuilder str = new StringBuilder();
            str.Append(@"<script type = *text/javascript* >
                       google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChart);
                        function drawChart()
                        {
                            var data = google.visualization.arrayToDataTable([
                            ['Task', 'Hours per Day'],
                            ['ALTA', " + totalAlta + "],");

            str.Append(@"['MEDIA'," + totalMedia + "],");
            str.Append(@"['BAJA'," + totalBaja + "]]); ");

            str.Append(@"var options = {
                          title: 'Porcentaje de riesgo',
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

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}