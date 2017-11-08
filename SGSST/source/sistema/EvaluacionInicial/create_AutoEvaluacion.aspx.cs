using System;
using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Text;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_AutoEvaluacion : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

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
            else if (BoolEmpSuc.Item2)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void btnGenerar_Onclick(object sender, EventArgs e)
        {
            phGuardar.Visible = true;

            double totalPlanear = 0;
            double totalHacer = 0;
            double totalVerificar = 0;
            double totalActuar = 0;
            Label miLabel;

            for (int i = 1; i <= 60; i++)
            {
                if (i <= 22)
                {
                    miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + i);
                    totalPlanear = totalPlanear + Convert.ToDouble(miLabel.Text);
                }
                else if (i >= 23 && i <= 52)
                {
                    miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + i);
                    totalHacer = totalHacer + Convert.ToDouble(miLabel.Text);
                }
                else if (i >= 53 && i <= 56)
                {
                    miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + i);
                    totalVerificar = totalVerificar + Convert.ToDouble(miLabel.Text);
                }
                else if (i >= 57 && i <= 60)
                {
                    miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + i);
                    totalActuar = totalActuar + Convert.ToDouble(miLabel.Text);
                }
            }


            Double[] valores = { totalPlanear, totalHacer, totalVerificar, totalActuar };


            StringBuilder str = new StringBuilder();
            str.Append(@"<script type=*text/javascript*> 
                google.load( *visualization*, *1*, {packages:[*corechart*]});
                google.setOnLoadCallback(drawChart);

                function drawChart() 
                {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Fases');
                data.addColumn('number', 'Esperado');
                data.addColumn('number', 'Actual');
                data.addRows(4);");

            str.Append("data.setValue( 0 , 0 ,'PLANEAR');");
            str.Append("data.setValue( 0 , 1 , 25);");
            str.Append("data.setValue( 0 , 2 , "+ totalPlanear + ") ;");

            str.Append("data.setValue( 1 , 0 ,'HACER');");
            str.Append("data.setValue( 1 , 1 , 60);");
            str.Append("data.setValue( 1 , 2 , " + totalHacer + ") ;");

            str.Append("data.setValue( 2 , 0 ,'VERIFICAR');");
            str.Append("data.setValue( 2 , 1 , 5);");
            str.Append("data.setValue( 2 , 2 , " + totalVerificar + ") ;");

            str.Append("data.setValue( 3 , 0 ,'ACTUAR');");
            str.Append("data.setValue( 3 , 1 , 10);");
            str.Append("data.setValue( 3 , 2 , " + totalActuar + ") ;");

            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));");
            str.Append(" chart.draw(data, {width: 1000, height: 300, title: 'Company Performance',");
            str.Append("hAxis: {title: 'Year', titleTextStyle: {color: 'green'}}");
            str.Append("}); }");
            str.Append("$('#ImgChart').attr('src', chart.getImageURI());$('#rutaImg').val(chart.getImageURI());</script>");


            string Myscript = str.ToString().Replace('*', '"');
            ltReporte.Text = Myscript;
            btnGenerar.Focus();
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores =
                {
                string.Empty + IdEmpSuc.Item2,
            };

            String[] titulos = {
                "ESTÁNDAR 1 RECURSOS (10%)<br /> E1.1 Estándar: Recursos financieros, técnicos humanos y de otra índole(4 %)",
                "E1.2 Estándar: Capacitación en el Sistema de Gestión de Seguridad y Salud en el Trabajo (6 %)",
                "ESTÁNDAR 2 – GESTIÓN INTEGRAL DEL SISTEMA DE LA SEGURIDAD Y SALUD EN EL TRABAJO (15%) <br /> E2.1 Estándar: Política de Seguridad y Salud en el Trabajo(1 %)",
                "E2.2 Estándar: Objetivos del Sistema de Gestión de Seguridad y Salud en el Trabajo SG-SST (1 %)",
                "E2.3 Estándar: Evaluación inicial del Sistema de Gestión – Seguridad y Salud en el Trabajo (1%)",
                "E2.4 Estándar: Plan Anual de Trabajo (2%)",
                "E2.5 Estándar: Conservación de la documentación (2%)",
                "E2.6 Estándar: Rendición de cuentas (1%)",
                "E2.7 Estándar: Normativa nacional vigente y aplicable en materia de Seguridad y Salud en el Trabajo. (2%)",
                "E2.8 Estándar: Mecanismos de Comunicación. (1%)",
                "E2.9 Estándar: Adquisiciones (1%)",
                "E2.10 Estándar: Contratación (2%)",
                "E2.11 Estándar: Gestión del cambio (1%)",
                "ESTÁNDAR 3 – GESTIÓN DE LA SALUD (20%) <br/> E3.1 Estándar: Condiciones de salud en el trabajo(9 %)",
                "E3.2 Estándar: Registro, reporte e investigación de las enfermedades laborales, incidentes y accidentes del trabajo (5%)",
                "E3.3 Estándar: Mecanismos de vigilancia de las condiciones de salud de los trabajadores (6%)",
                "ESTÁNDAR 4. GESTIÓN DE PELIGROS Y RIESGOS (30%) <br/> E4.1 Estándar: Identificación de peligros, evaluación y valoración de los riesgos(15 %)",
                "E4.2 Estándar: Medidas de prevención y control para intervenir los peligros/riesgos (15%)",
                "ESTÁNDAR 5. GESTIÓN DE AMENAZAS (10%)",
                "ESTÁNDAR 6. VERIFICACIÓN DEL SISTEMA DE GESTIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO (5%) < br/> E6.1 Estándar: Gestión y resultados del Sistema de Gestión de Seguridad y Salud en el Trabajo(5 %)",
                "ESTÁNDAR 7. MEJORAMIENTO (10%) <br/> E7.1 Estándar: Acciones preventivas y correctivas con base en los resultados del Sistema de Gestión de Seguridad y Salud en el Trabajo. (10 %)"
            };

            String[] ciclo = {
                "PLANEAR",
                "HACER",
                "VERIFICAR",
                "ACTUAR"
            };

            String[] item = {
                item1.Text,
                item2.Text,
                item3.Text,
                item4.Text,
                item5.Text,
                item6.Text,
                item7.Text,
                item8.Text,
                item9.Text,
                item10.Text,
                item11.Text,
                item12.Text,
                item13.Text,
                item14.Text,
                item15.Text,
                item16.Text,
                item17.Text,
                item18.Text,
                item19.Text,
                item20.Text,
                item21.Text,
                item22.Text,
                item23.Text,
                item24.Text,
                item25.Text,
                item26.Text,
                item27.Text,
                item28.Text,
                item29.Text,
                item30.Text,
                item31.Text,
                item32.Text,
                item33.Text,
                item34.Text,
                item35.Text,
                item36.Text,
                item37.Text,
                item38.Text,
                item39.Text,
                item40.Text,
                item41.Text,
                item42.Text,
                item43.Text,
                item44.Text,
                item45.Text,
                item46.Text,
                item47.Text,
                item48.Text,
                item49.Text,
                item50.Text,
                item51.Text,
                item52.Text,
                item53.Text,
                item54.Text,
                item55.Text,
                item56.Text,
                item57.Text,
                item58.Text,
                item59.Text,
                item60.Text
            };

            String[] cumplimiento = {
                ddlCumplimiento1.SelectedItem.Text,
                ddlCumplimiento2.SelectedItem.Text,
                ddlCumplimiento3.SelectedItem.Text,
                ddlCumplimiento4.SelectedItem.Text,
                ddlCumplimiento5.SelectedItem.Text,
                ddlCumplimiento6.SelectedItem.Text,
                ddlCumplimiento7.SelectedItem.Text,
                ddlCumplimiento8.SelectedItem.Text,
                ddlCumplimiento9.SelectedItem.Text,
                ddlCumplimiento10.SelectedItem.Text,
                ddlCumplimiento11.SelectedItem.Text,
                ddlCumplimiento12.SelectedItem.Text,
                ddlCumplimiento13.SelectedItem.Text,
                ddlCumplimiento14.SelectedItem.Text,
                ddlCumplimiento15.SelectedItem.Text,
                ddlCumplimiento16.SelectedItem.Text,
                ddlCumplimiento17.SelectedItem.Text,
                ddlCumplimiento18.SelectedItem.Text,
                ddlCumplimiento19.SelectedItem.Text,
                ddlCumplimiento20.SelectedItem.Text,
                ddlCumplimiento21.SelectedItem.Text,
                ddlCumplimiento22.SelectedItem.Text,
                ddlCumplimiento23.SelectedItem.Text,
                ddlCumplimiento24.SelectedItem.Text,
                ddlCumplimiento25.SelectedItem.Text,
                ddlCumplimiento26.SelectedItem.Text,
                ddlCumplimiento27.SelectedItem.Text,
                ddlCumplimiento28.SelectedItem.Text,
                ddlCumplimiento29.SelectedItem.Text,
                ddlCumplimiento30.SelectedItem.Text,
                ddlCumplimiento31.SelectedItem.Text,
                ddlCumplimiento32.SelectedItem.Text,
                ddlCumplimiento33.SelectedItem.Text,
                ddlCumplimiento34.SelectedItem.Text,
                ddlCumplimiento35.SelectedItem.Text,
                ddlCumplimiento36.SelectedItem.Text,
                ddlCumplimiento37.SelectedItem.Text,
                ddlCumplimiento38.SelectedItem.Text,
                ddlCumplimiento39.SelectedItem.Text,
                ddlCumplimiento40.SelectedItem.Text,
                ddlCumplimiento41.SelectedItem.Text,
                ddlCumplimiento42.SelectedItem.Text,
                ddlCumplimiento43.SelectedItem.Text,
                ddlCumplimiento44.SelectedItem.Text,
                ddlCumplimiento45.SelectedItem.Text,
                ddlCumplimiento46.SelectedItem.Text,
                ddlCumplimiento47.SelectedItem.Text,
                ddlCumplimiento48.SelectedItem.Text,
                ddlCumplimiento49.SelectedItem.Text,
                ddlCumplimiento50.SelectedItem.Text,
                ddlCumplimiento51.SelectedItem.Text,
                ddlCumplimiento52.SelectedItem.Text,
                ddlCumplimiento53.SelectedItem.Text,
                ddlCumplimiento54.SelectedItem.Text,
                ddlCumplimiento55.SelectedItem.Text,
                ddlCumplimiento56.SelectedItem.Text,
                ddlCumplimiento57.SelectedItem.Text,
                ddlCumplimiento58.SelectedItem.Text,
                ddlCumplimiento59.SelectedItem.Text,
                ddlCumplimiento60.SelectedItem.Text,
            };

            String[] calificacion = {
                lbCalificacion1.Text,
                lbCalificacion2.Text,
                lbCalificacion3.Text,
                lbCalificacion4.Text,
                lbCalificacion5.Text,
                lbCalificacion6.Text,
                lbCalificacion7.Text,
                lbCalificacion8.Text,
                lbCalificacion9.Text,
                lbCalificacion10.Text,
                lbCalificacion11.Text,
                lbCalificacion12.Text,
                lbCalificacion13.Text,
                lbCalificacion14.Text,
                lbCalificacion15.Text,
                lbCalificacion16.Text,
                lbCalificacion17.Text,
                lbCalificacion18.Text,
                lbCalificacion19.Text,
                lbCalificacion20.Text,
                lbCalificacion21.Text,
                lbCalificacion22.Text,
                lbCalificacion23.Text,
                lbCalificacion24.Text,
                lbCalificacion25.Text,
                lbCalificacion26.Text,
                lbCalificacion27.Text,
                lbCalificacion28.Text,
                lbCalificacion29.Text,
                lbCalificacion30.Text,
                lbCalificacion31.Text,
                lbCalificacion32.Text,
                lbCalificacion33.Text,
                lbCalificacion34.Text,
                lbCalificacion35.Text,
                lbCalificacion36.Text,
                lbCalificacion37.Text,
                lbCalificacion38.Text,
                lbCalificacion39.Text,
                lbCalificacion40.Text,
                lbCalificacion41.Text,
                lbCalificacion42.Text,
                lbCalificacion43.Text,
                lbCalificacion44.Text,
                lbCalificacion45.Text,
                lbCalificacion46.Text,
                lbCalificacion47.Text,
                lbCalificacion48.Text,
                lbCalificacion49.Text,
                lbCalificacion50.Text,
                lbCalificacion51.Text,
                lbCalificacion52.Text,
                lbCalificacion53.Text,
                lbCalificacion54.Text,
                lbCalificacion55.Text,
                lbCalificacion56.Text,
                lbCalificacion57.Text,
                lbCalificacion58.Text,
                lbCalificacion59.Text,
                lbCalificacion60.Text,
            };

            String[] evidencia = {
                evi1.Text,
                evi2.Text,
                evi3.Text,
                evi4.Text,
                evi5.Text,
                evi6.Text,
                evi7.Text,
                evi8.Text,
                evi9.Text,
                evi10.Text,
                evi11.Text,
                evi12.Text,
                evi13.Text,
                evi14.Text,
                evi15.Text,
                evi16.Text,
                evi17.Text,
                evi18.Text,
                evi19.Text,
                evi20.Text,
                evi21.Text,
                evi22.Text,
                evi23.Text,
                evi24.Text,
                evi25.Text,
                evi26.Text,
                evi27.Text,
                evi28.Text,
                evi29.Text,
                evi30.Text,
                evi31.Text,
                evi32.Text,
                evi33.Text,
                evi34.Text,
                evi35.Text,
                evi36.Text,
                evi37.Text,
                evi38.Text,
                evi39.Text,
                evi40.Text,
                evi41.Text,
                evi42.Text,
                evi43.Text,
                evi44.Text,
                evi45.Text,
                evi46.Text,
                evi47.Text,
                evi48.Text,
                evi49.Text,
                evi50.Text,
                evi51.Text,
                evi52.Text,
                evi53.Text,
                evi54.Text,
                evi55.Text,
                evi56.Text,
                evi57.Text,
                evi58.Text,
                evi59.Text,
                evi60.Text
            };

            PrintFile.PrintAutoevaluacion(valores, titulos, ciclo, item, cumplimiento, calificacion, evidencia, this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

        protected void ddlCumplimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDropDownList = sender as DropDownList;
            Label miLabel;
            Double _Calificacion = 0;

            if (miDropDownList == null) return;

            int _fila = Convert.ToInt32(miDropDownList.ID.ToString().Replace("ddlCumplimiento", ""));

            if (_fila <= 8)
            {
                //0.5
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 0.5;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila >= 12 && _fila <= 14) || (_fila == 17) || (_fila >= 19 && _fila <= 20) || (_fila >= 22 && _fila <= 31) || (_fila >= 34 && _fila <= 40))
            {
                //1
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 1;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila >= 53 && _fila <= 56))
            {
                //1.25
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 1.25;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila >= 9 && _fila <= 11) || (_fila >= 15 && _fila <= 16) || (_fila == 18) || (_fila == 21) || (_fila >= 32 && _fila <= 33))
            {
                //2
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 2;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila >= 45 && _fila <= 50) || (_fila >= 57 && _fila <= 60))
            {
                //2.5
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 2.5;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila == 43))
            {
                //3
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 3;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila >= 41 && _fila <= 42) || (_fila == 44))
            {
                //4
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 4;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
            else if ((_fila >= 51 && _fila <= 52))
            {
                //5
                if (miDropDownList.SelectedValue == "Cumple Totalmente" || miDropDownList.SelectedValue == "Justifica")
                {
                    _Calificacion = 5;
                }
                else
                {
                    _Calificacion = 0;
                }

                miLabel = (Label)MyUpdatePanel.FindControl("lbCalificacion" + _fila);
                miLabel.Text = string.Empty + _Calificacion;
            }
        }
    }
}