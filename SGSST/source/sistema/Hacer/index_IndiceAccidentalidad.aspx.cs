using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class index_IndiceAccidentalidad : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ViewState["Año"] = string.Empty + DateTime.Now.Year;
                ViewState["MesActual"] = Convert.ToInt32(DateTime.Now.Month);
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
            ListaAnho(ddlAnho);
        }

        private void ListaAnho(DropDownList DropDownList1)
        {
            ControlesDinamicos.ListaUltimos10Anhos(DropDownList1);
        }

        #endregion

        private void CargaMensual()
        {
            phMensual.Visible = true;
            int anhoActual = Convert.ToInt32(ViewState["Año"]);
            int MesActual = Convert.ToInt32(ViewState["MesActual"]);
            int IdSucursal = Convert.ToInt32(ViewState["Sucursal"]);
            int IdEmpresa = ObjUsuario.Id_empresa;

            ControlesDinamicos.CargaMensual_ReporteAccidentalidad(GridView1, anhoActual, MesActual, IdSucursal, IdEmpresa);
        }

        private void CargaTrimestral()
        {
            phTrimestral.Visible = true;

            int anhoActual = Convert.ToInt32(ViewState["Año"]);
            int MesActual = Convert.ToInt32(ViewState["MesActual"]);
            int IdSucursal = Convert.ToInt32(ViewState["Sucursal"]);
            int IdEmpresa = ObjUsuario.Id_empresa;

            ControlesDinamicos.CargaMensual_ReporteAccidentalidad(GridView3, anhoActual, MesActual, IdSucursal, IdEmpresa);
        }

        private void CargarSemestral()
        {
            phSemestral.Visible = true;

            int anhoActual = Convert.ToInt32(ViewState["Año"]);
            int MesActual = Convert.ToInt32(ViewState["MesActual"]);
            int IdSucursal = Convert.ToInt32(ViewState["Sucursal"]);
            int IdEmpresa = ObjUsuario.Id_empresa;

            ControlesDinamicos.CargarSemestral_ReporteAccidentalidad(GridView3, anhoActual, MesActual, IdSucursal, IdEmpresa);

        }

        private void CargaAnual()
        {
            phAnual.Visible = true;
            int IdSucursal = Convert.ToInt32(ViewState["Sucursal"]);
            int IdEmpresa = ObjUsuario.Id_empresa;

            ControlesDinamicos.CargaAnual_ReporteAccidentalidad(GridView4, IdSucursal, IdEmpresa);
        }

        private void CargaTabla()
        {
            string valor = "" + ViewState["tipo"];
            if (valor == "Mes")
            {
                CargaMensual();
            }
            else if (valor == "Tri")
            {
                CargaTrimestral();
            }
            else if (valor == "Sem")
            {
                CargarSemestral();
            }
            else if (valor == "Anho")
            {
                CargaAnual();
            }
        }

        private void BindChart()
        {
            DataTable dt = new DataTable();

            StringBuilder str = new StringBuilder();

            GridView gridchart = new GridView();
            string titulo = "";

            if (string.Empty + ViewState["tipo"] == "Mes") { gridchart = GridView1; titulo = "Meses"; }
            else if (string.Empty + ViewState["tipo"] == "Tri") { gridchart = GridView3; titulo = "Trimestres"; }
            else if (string.Empty + ViewState["tipo"] == "Sem") { gridchart = GridView2; titulo = "Semestres"; }
            else if (string.Empty + ViewState["tipo"] == "Anho") { gridchart = GridView4; titulo = "Años"; }

            dt = (DataTable)(gridchart.DataSource);

            //IF
            try
            {

                str.Append(@"<script type=*text/javascript*> 
                       google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChartIF);
                       function drawChartIF() {
                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Periodo');
                        data.addColumn('number', 'IF'); 
                        data.addRows(" + dt.Rows.Count + ");");

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() + "');");
                    str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["IF: Indice General de Frecuencia"].ToString() + ") ;");
                }

                str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chartIF'));");
                str.Append(" chart.draw(data, {width: 1000, height: 350, title: 'Indice General de Frecuencia',");
                str.Append("hAxis: {title: '" + titulo + "', titleTextStyle: {color: 'green'}}");
                str.Append("}); }");
                str.Append("</script>");
                ltIF.Text = str.ToString().Replace('*', '"');
            }
            catch
            { }

            //IS
            try
            {
                str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChartIS);
                       function drawChartIS() {
                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Periodo');
                        data.addColumn('number', 'IS'); 
                        data.addRows(" + dt.Rows.Count + ");");

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() + "');");
                    str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["IS: Indice de Severidad Global"].ToString() + ") ;");
                }

                str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chartIS'));");
                str.Append(" chart.draw(data, {width: 1000, height: 350, title: 'Indice de Severidad Global',colors: ['#e0440e'],");
                str.Append("hAxis: {title: '" + titulo + "', titleTextStyle: {color: 'green'}}");
                str.Append("}); }");
                str.Append("</script>");
                ltIF.Text = str.ToString().Replace('*', '"');
            }
            catch
            { }

            //IDP
            try
            {

                str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChartIDP);
                       function drawChartIDP() {
                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Periodo');
                        data.addColumn('number', 'IDP'); 
                        data.addRows(" + dt.Rows.Count + ");");

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() + "');");
                    str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["IDP: Indice Medio de días perdidos por lesiones"].ToString() + ") ;");
                }

                str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chartIDP'));");
                str.Append(" chart.draw(data, {width: 1000, height: 350, title: 'Indice Medio de días perdidos por lesiones',colors: ['Yellow'],");
                str.Append("hAxis: {title: '" + titulo + "', titleTextStyle: {color: 'green'}}");
                str.Append("}); }");
                str.Append("</script>");
                ltIDP.Text = str.ToString().Replace('*', '"');
            }
            catch
            { }

            //ILI
            try
            {

                str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChartILI);
                       function drawChartILI() {
                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Periodo');
                        data.addColumn('number', 'ILI'); 
                        data.addRows(" + dt.Rows.Count + ");");

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() + "');");
                    str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["ILI: Indice de lesión incapacitante"].ToString() + ") ;");
                }

                str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chartILI'));");
                str.Append(" chart.draw(data, {width: 1000, height: 350, title: 'Indice de lesión incapacitante',colors: ['Green'],");
                str.Append("hAxis: {title: '" + titulo + "', titleTextStyle: {color: 'green'}}");
                str.Append("}); }");
                str.Append("</script>");
                ltILI.Text = str.ToString().Replace('*', '"');
            }
            catch
            { }
        }

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }

        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["Sucursal"] = Convert.ToInt32(ddlSucursal.SelectedValue);
                CargaTabla();
            }
        }

        protected void ddlAnho_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAnho.SelectedValue != string.Empty)
            {
                if (Convert.ToInt32(ddlAnho.SelectedValue) == DateTime.Now.Year)
                {
                    ViewState["Año"] = ddlAnho.SelectedValue;
                    ViewState["MesActual"] = string.Empty + DateTime.Now.Month;
                }
                else
                {
                    ViewState["Año"] = ddlAnho.SelectedValue;
                    ViewState["MesActual"] = "12";
                }

                CargaTabla();
                BindChart();
            }

        }

        protected void ddlPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPeriodo.SelectedValue != string.Empty)
            {
                phMensual.Visible = false;
                phTrimestral.Visible = false;
                phSemestral.Visible = false;
                phAnual.Visible = false;
                phAnho.Visible = true;

                if (ddlPeriodo.SelectedValue == "1")
                {
                    ViewState["tipo"] = "Mes";
                }
                else if (ddlPeriodo.SelectedValue == "2")
                {
                    ViewState["tipo"] = "Tri";
                }
                else if (ddlPeriodo.SelectedValue == "3")
                {
                    ViewState["tipo"] = "Sem";
                }
                else if (ddlPeriodo.SelectedValue == "4")
                {
                    ViewState["tipo"] = "Anho";
                    phAnho.Visible = false;
                }
                CargaTabla();
                BindChart();
            }
        }
        #endregion

    }
}