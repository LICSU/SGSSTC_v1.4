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
            //PrintFile.GetInputValue(Number1)
            //    PrintFile.GetRadioValue(radio1)


            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores =
                {
                string.Empty + IdEmpSuc.Item2,
            };

            PrintFile.PrintAutoevaluacion(valores, this);
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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
                if (miDropDownList.SelectedValue == "Cumple" || miDropDownList.SelectedValue == "Justifica")
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