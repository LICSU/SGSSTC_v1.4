using System;
using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Acc_Inc;
using Capa_Datos.Manager.Salud;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_VigilanciaEpidemiologica : Page
    {
        #region variables
        public static string strTitulo = "- N° = ";
        private Model_UsuarioSistema ObjUsuario;

        //Variables grafica principal
        private int cantAccTrab = 0, cantAccCom = 0, cantEnfCom = 0, cantEnfPOO, cantEnfOcu = 0, cantTrabDis = 0, cantTrab = 0, cantResEvaCli = 0, cantTrabRef = 0;

        //Variables grafica resultados de evaluaciones clinicas
        private int cantEvPreEm = 0, cantEvaPreVac = 0, cantEvaPosVac = 0, cantEvaPer = 0, cantEvaEsp = 0, cantEvaPosEmp = 0, cantEvaAsi = 0;

        //Variables grafica Monitoreo Reposos medicos
        private int cantRep = 0, cantDiasRep = 0, cantRepEnfCom = 0, cantRepEnfOcu = 0, cantRepAccCom = 0;

        private int id_sucursal = 0, id_empresa = 0;

        private Tuple<bool, bool> BoolEmpSuc;
        #endregion

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ddlYear = ListaAnho(ddlYear);
                CargarListas();
            }
            else
            {
                foreach (var ctlID in Page.Request.Form.AllKeys)
                {
                    if (ctlID != null)
                    {
                        Control c = Page.FindControl(ctlID) as Control;
                        if (c is DropDownList)
                        {
                            if (c.ClientID.Contains("btnGenerar"))
                            {
                                cargarInformacion();
                            }
                        }
                    }
                }
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

        protected void btnGenerarClic(object sender, EventArgs e)
        {
            if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdm_Sucursal())
            {
                if (ddlSucursal.SelectedValue != string.Empty)
                {
                    id_empresa = ObjUsuario.Id_empresa;
                    ViewState["empresa"] = id_empresa;
                    cargarInformacion();
                }
            }

            if (BoolEmpSuc.Item1)
            {
                if (ddlEmpresa.SelectedValue != string.Empty && ddlSucursal.SelectedValue != string.Empty)
                {
                    id_empresa = Convert.ToInt32(ddlEmpresa.SelectedValue);
                    ViewState["empresa"] = id_empresa;
                    cargarInformacion();
                }
            }

            if (!BoolEmpSuc.Item2)
            {
                id_empresa = ObjUsuario.Id_empresa;
                ViewState["empresa"] = id_empresa;
                cargarInformacion();

            }

        }

        private DropDownList ListaAnho(DropDownList DropDownList1)
        {
            DateTime anho = DateTime.Now;
            int anhoActual = Convert.ToInt32(anho.Year);

            ViewState["anho"] = string.Empty + anhoActual;

            for (int i = anhoActual; i >= 1950; i--)
            {
                DropDownList1.Items.Add(new System.Web.UI.WebControls.ListItem(string.Empty + i, string.Empty + i));
            }

            return DropDownList1;
        }
        #endregion

        #region servicios
        [WebMethod]
        public static List<Model_Data> GetDataVigilancia()
        {

            GridView grid = new GridView();
            List<Model_Data> dataList = new List<Model_Data>();

            string cat = string.Empty;
            int val = 0;

            foreach (GridViewRow row in grid.Rows)
            {
                cat = row.Cells[0].Text;
                val = Convert.ToInt32(row.Cells[1].Text);
                dataList.Add(new Model_Data(cat + strTitulo + val, val));
            }
            return dataList;
        }

        [WebMethod]
        public static List<Model_Data> GetDataEnfComun()
        {
            GridView gridEnfComun = new GridView();
            List<Model_Data> dataList = new List<Model_Data>();

            string cat = string.Empty;
            int val = 0;

            foreach (GridViewRow row in gridEnfComun.Rows)
            {
                cat = row.Cells[0].Text;
                val = Convert.ToInt32(row.Cells[1].Text);
                dataList.Add(new Model_Data(cat + strTitulo + val, val));
            }
            return dataList;
        }

        [WebMethod]
        public static List<Model_Data> GetDataEnfLab()
        {
            GridView gridEnfLab = new GridView();
            List<Model_Data> dataList = new List<Model_Data>();

            string cat = string.Empty;
            int val = 0;

            foreach (GridViewRow row in gridEnfLab.Rows)
            {
                cat = row.Cells[0].Text;
                val = Convert.ToInt32(row.Cells[1].Text);
                dataList.Add(new Model_Data(cat + strTitulo + val, val));
            }
            return dataList;
        }

        [WebMethod]
        public static List<Model_Data> GetDataSist()
        {
            GridView gridSist = new GridView();
            List<Model_Data> dataList = new List<Model_Data>();

            string cat = string.Empty;
            int val = 0;

            foreach (GridViewRow row in gridSist.Rows)
            {
                cat = row.Cells[0].Text;
                val = Convert.ToInt32(row.Cells[1].Text);
                dataList.Add(new Model_Data(cat + strTitulo + val, val));
            }
            return dataList;
        }
        #endregion

        #region Cargar Informacion
        private void cargarInformacion()
        {
            //Cantidad de trabajadores con reposos de enfermedades
            if (id_empresa > 0)
            {
                if (ObjUsuario.isAdm_Grupoli())
                {
                    id_empresa = Convert.ToInt32(ddlEmpresa.SelectedValue);
                    ViewState["empresa"] = id_empresa.ToString();
                    ViewState["sucursal"] = "0";
                }

                if (ddlSucursal.SelectedValue != string.Empty)
                {
                    id_sucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                    ViewState["sucursal"] = id_empresa.ToString();
                    id_empresa = 0;
                    ViewState["empresa"] = "0";
                }

                if (!BoolEmpSuc.Item2)
                {
                    id_empresa = ObjUsuario.Id_empresa;
                    ViewState["empresa"] = id_empresa;

                    id_sucursal = ObjUsuario.Id_sucursal;
                    ViewState["sucursal"] = id_empresa.ToString();
                }

                cantTrab = Mgr_Trabajador.Trabajadores(id_empresa, id_sucursal);

                if (cantTrab > 0)
                {
                    cantRep = Mgr_Trabajador.Reposos(Convert.ToInt32(ViewState["anho"].ToString()), id_empresa, id_sucursal);
                    ViewState["cantRep"] = cantRep;

                    if (cantRep > 0)
                    {
                        lblTotalTrab.Text = "<strong>Fuerza Laboral: " + cantTrab.ToString() + " </strong>";

                        cantAccTrab = Mgr_Acc_Inc.AccidentesLaboral(Convert.ToInt32(ViewState["anho"].ToString()), id_empresa, id_sucursal);
                        nroAccTrab.Text = cantAccTrab.ToString();

                        nroAccCom.Text = Mgr_Salud.Enfermedades(Convert.ToInt32(ViewState["anho"].ToString()), "ACCIDENTE COMUN", id_empresa, id_sucursal).ToString();

                        cantEnfCom = Mgr_Salud.Enfermedades(Convert.ToInt32(ViewState["anho"].ToString()), "ENFERMEDAD COMUN", id_empresa, id_sucursal);
                        nroEnfCom.Text = cantEnfCom.ToString();

                        cantAccCom = Mgr_Salud.Enfermedades(Convert.ToInt32(ViewState["anho"].ToString()), "ACCIDENTE COMUN", id_empresa, id_sucursal);
                        nroAccCom.Text = cantAccCom.ToString();
                        cantEnfOcu = Mgr_Salud.Enfermedades(Convert.ToInt32(ViewState["anho"].ToString()), "ENFERMEDAD LABORAL", id_empresa, id_sucursal);
                        nroEnfOcu.Text = cantEnfOcu.ToString();
                        cantEnfPOO = Mgr_Salud.Enfermedades(Convert.ToInt32(ViewState["anho"].ToString()), "POSIBLE ENFERMEDAD LABORAL", id_empresa, id_sucursal);
                        nroEnfPOO.Text = cantEnfPOO.ToString();
                        cantTrabRef = Mgr_Trabajador.Constancias(Convert.ToInt32(ViewState["anho"].ToString()), id_empresa, id_sucursal);
                        nroTrabRef.Text = cantTrabRef.ToString();

                        cantResEvaCli = Mgr_Salud.EvaluacionesCli(Convert.ToInt32(ViewState["anho"].ToString()), id_empresa, id_sucursal);
                        nroResEvaCli.Text = cantResEvaCli.ToString();

                        cantTrabDis = Mgr_Trabajador.TrabajadoresDiscapacitados(Convert.ToInt32(ViewState["anho"].ToString()), id_empresa, id_sucursal);
                        nroTrabDis.Text = cantTrabDis.ToString();

                        monRepMed.Text = cantRep.ToString();
                        cargarGraficaPrincipal();


                        //Informacion grafica Evaluacion Clinica
                        cantEvPreEm = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN PRE EMPLEO", id_empresa, id_sucursal);
                        cellEvaPreEmpV.Text = cantEvPreEm.ToString();
                        cantEvaPreVac = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN PRE VACACIONAL", id_empresa, id_sucursal);
                        cellEvaPreVacV.Text = cantEvaPreVac.ToString();
                        cantEvaPosVac = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN POST VACACIONAL", id_empresa, id_sucursal);
                        cellEvaPosVacV.Text = cantEvaPosVac.ToString();
                        cantEvaPer = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN PERIÓDICA", id_empresa, id_sucursal);
                        cellEvaPerV.Text = cantEvaPer.ToString();
                        cantEvaEsp = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN ESPECIAL", id_empresa, id_sucursal);
                        cellEvaEspV.Text = cantEvaEsp.ToString();
                        cantEvaPosEmp = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN POST EMPLEO", id_empresa, id_sucursal);
                        cellEvaPosEmpV.Text = cantEvaPosEmp.ToString();
                        cantEvaAsi = Mgr_Salud.EvaluacionesPorTipo(Convert.ToInt32(ViewState["anho"].ToString()), "EVALUACIÓN ASISTENCIAL O CURATIVA", id_empresa, id_sucursal);
                        cellEvaAsiV.Text = cantEvaAsi.ToString();
                        cargarGraficaEvaClinica();

                        //Informacion grafica Monitoreo de Reposos Medicos..                
                        cellNroRepV.Text = cantRep.ToString();
                        cantDiasRep = Mgr_Trabajador.DiasReposo(Convert.ToInt32(ViewState["anho"].ToString()), id_empresa, id_sucursal);
                        cellDiaRepV.Text = cantDiasRep.ToString();
                        cantRepEnfCom = Mgr_Trabajador.RepososPorNombre(Convert.ToInt32(ViewState["anho"].ToString()), "ENFERMEDAD COMUN", id_empresa, id_sucursal);
                        cellNroRepEnfComV.Text = cantRepEnfCom.ToString();
                        cantRepEnfOcu = Mgr_Trabajador.RepososPorNombre(Convert.ToInt32(ViewState["anho"].ToString()), "ENFERMEDAD LABORAL", id_empresa, id_sucursal);
                        cellRepEnfOcuV.Text = cantRepEnfOcu.ToString();
                        cantRepAccCom = Mgr_Trabajador.RepososPorNombre(Convert.ToInt32(ViewState["anho"].ToString()), "ACCIDENTE COMUN", id_empresa, id_sucursal);
                        cellRepAccComV.Text = cantRepAccCom.ToString();
                        cargarGraficaMonReposos();

                        //Informacion grafica de diagnosticos..               
                        cargarGraficaDiagnosticos();

                        //Informacion grafica de sistemas..
                        cargarGraficaSistemas();

                        phNoRegistros.Visible = false;
                        phInformacion.Visible = true;
                    }
                    else
                    {
                        phInformacion.Visible = false;
                        phNoRegistros.Visible = true;
                    }
                }
            }
        }

        private void cargarGraficaPrincipal()
        {
            Double[] yAsistencias = { cantAccTrab, cantAccCom, cantEnfCom, cantEnfPOO, cantEnfOcu, cantTrabRef, cantTrabDis, cantResEvaCli, cantRep };
            String[] xCadenas = { lb1.Text, lb2.Text, lb3.Text, lb4.Text, lb5.Text, lb6.Text, lb7.Text, lb8.Text, lb9.Text };
            graficoFuerzaLab.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            graficoFuerzaLab.Series["fuerzaLaboral"].Points.DataBindXY(xCadenas, yAsistencias);
        }

        private void cargarGraficaEvaClinica()
        {
            Double[] yAsistencias = { cantEvPreEm, cantEvaPreVac, cantEvaPosVac, cantEvaPer, cantEvaEsp, cantEvaPosEmp, cantEvaAsi };
            String[] xCadenas = { cellEvaPreEmp.Text, cellEvaPreVac.Text, cellEvaPosVac.Text, cellEvaPer.Text, cellEvaEsp.Text, cellEvaPosEmp.Text, cellEvaAsi.Text };
            graficaEvaCli.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            graficaEvaCli.Series["serieEvaCli"].Points.DataBindXY(xCadenas, yAsistencias);
        }

        private void cargarGraficaMonReposos()
        {
            Double[] yAsistencias = { cantRep, cantDiasRep, cantRepEnfCom, cantRepEnfOcu, cantRepAccCom };
            String[] xCadenas = { cellNroRep.Text, cellDiaRep.Text, cellNroRepEnfCom.Text, cellRepEnfOcu.Text, cellRepAccCom.Text };
            graficaRepMed.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            graficaRepMed.Series["serieRepMed"].Points.DataBindXY(xCadenas, yAsistencias);
        }

        private void cargarGraficaDiagnosticos()
        {
            TableCell _tablecell;
            TableRow _tablerow;
            Table _table;
            Double[] yAsistencias = null;
            Double[] yAsistencias1 = null;
            String[] xCadenas = null;
            int i = 0;

            List<Model_Enfermedad_Sistema> diagnosticos = Mgr_Salud.CantDiagnosticos(Convert.ToInt32(ViewState["anho"].ToString()), Convert.ToInt32(ViewState["empresa"].ToString()), Convert.ToInt32(ViewState["sucursal"].ToString()));
            _table = new Table();
            _table.CssClass = "table";
            _table.ID = "tb_diagnostico";
            TableHeaderRow _tablerow1 = new TableHeaderRow();

            TableHeaderCell _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "Diagnostico";
            _tablerow1.Controls.Add(_tablecell1);

            _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "N° de trabajadores Atendidos";
            _tablerow1.Controls.Add(_tablecell1);

            _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "N° de trabajadores Reposo";
            _tablerow1.Controls.Add(_tablecell1);

            _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "N° días de Reposo";
            _tablerow1.Controls.Add(_tablecell1);

            _table.Controls.Add(_tablerow1);
            xCadenas = new String[diagnosticos.Count];
            yAsistencias = new Double[diagnosticos.Count];
            yAsistencias1 = new Double[diagnosticos.Count];
            foreach (var diagnostico in diagnosticos)
            {
                _tablerow = new TableRow();

                _tablecell = new TableCell();
                _tablecell.Text = diagnostico.nombre;
                _tablerow.Controls.Add(_tablecell);
                xCadenas[i] = diagnostico.nombre;
                int cantTrab = Mgr_Trabajador.TrabEnfermedad(Convert.ToInt32(ViewState["anho"].ToString()), diagnostico.nombre, Convert.ToInt32(ViewState["empresa"].ToString()), Convert.ToInt32(ViewState["sucursal"].ToString()));

                _tablecell = new TableCell();
                _tablecell.Text = diagnostico.cantidad.ToString();
                _tablerow.Controls.Add(_tablecell);
                yAsistencias[i] = Convert.ToDouble(diagnostico.cantidad);

                _tablecell = new TableCell();
                _tablecell.Text = cantTrab.ToString();
                _tablerow.Controls.Add(_tablecell);
                yAsistencias1[i] = Convert.ToDouble(cantTrab);

                _tablecell = new TableCell();
                _tablecell.Text = diagnostico.suma;
                _tablerow.Controls.Add(_tablecell);

                _table.Controls.Add(_tablerow);
                i++;
            }

            pnGraficaEnf.Controls.Add(_table);
            graficaDiagnostico.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            graficaDiagnostico.Series["serieDiag1"].Points.DataBindXY(xCadenas, yAsistencias);
            graficaDiagnostico.Series["serieDiag2"].Points.DataBindXY(xCadenas, yAsistencias1);
        }

        private void cargarGraficaSistemas()
        {
            TableCell _tablecell;
            TableRow _tablerow;
            Table _table;
            Double[] yAsistencias = null;
            Double[] yAsistencias1 = null;
            String[] xCadenas = null;
            int i = 0;

            List<Model_Enfermedad_Sistema> diagnosticos = Mgr_Salud.CantSistemas(Convert.ToInt32(ViewState["anho"].ToString()), Convert.ToInt32(ViewState["empresa"].ToString()), Convert.ToInt32(ViewState["sucursal"].ToString()));
            _table = new Table();
            _table.CssClass = "table";
            TableHeaderRow _tablerow1 = new TableHeaderRow();

            TableHeaderCell _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "Sistema";
            _tablerow1.Controls.Add(_tablecell1);

            _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "N° de trabajadores atendidos";
            _tablerow1.Controls.Add(_tablecell1);

            _tablecell1 = new TableHeaderCell();
            _tablecell1.Text = "N° de trabajadores con reposo";
            _tablerow1.Controls.Add(_tablecell1);

            _table.Controls.Add(_tablerow1);
            xCadenas = new String[diagnosticos.Count];
            yAsistencias = new Double[diagnosticos.Count];
            yAsistencias1 = new Double[diagnosticos.Count];
            foreach (var diagnostico in diagnosticos)
            {
                _tablerow = new TableRow();

                _tablecell = new TableCell();
                _tablecell.Text = diagnostico.nombre;
                _tablerow.Controls.Add(_tablecell);
                xCadenas[i] = diagnostico.nombre;

                yAsistencias[i] = Convert.ToDouble(diagnostico.cantidad);
                _tablecell = new TableCell();
                _tablecell.Text = diagnostico.cantidad.ToString();
                _tablerow.Controls.Add(_tablecell);

                int cantTrab = Mgr_Trabajador.TrabSistemas(Convert.ToInt32(ViewState["anho"].ToString()), diagnostico.nombre, Convert.ToInt32(ViewState["empresa"].ToString()), Convert.ToInt32(ViewState["sucursal"].ToString()));
                yAsistencias1[i] = Convert.ToDouble(cantTrab);
                _tablecell = new TableCell();
                _tablecell.Text = cantTrab.ToString();
                _tablerow.Controls.Add(_tablecell);

                _table.Controls.Add(_tablerow);
                i++;
            }

            pnGraficaSis.Controls.Add(_table);
            graficaSistema.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            graficaSistema.Series["serieSist1"].Points.DataBindXY(xCadenas, yAsistencias);
            graficaSistema.Series["serieSist2"].Points.DataBindXY(xCadenas, yAsistencias1);
        }

        #endregion

        #region filtro
        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ViewState["empresa"] == null) { ViewState["empresa"] = ""; }
            if (ViewState["sucursal"] == null) { ViewState["sucursal"] = "0"; }
            if (ddlYear.SelectedValue != string.Empty)
            {
                ViewState["anho"] = ddlYear.SelectedValue;
                if (ViewState["empresa"].ToString() != string.Empty || ViewState["sucursal"].ToString() != string.Empty)
                {
                    id_empresa = Convert.ToInt32(ViewState["empresa"].ToString());
                    if (ViewState["sucursal"].ToString() != string.Empty)
                    {
                        id_sucursal = Convert.ToInt32(ViewState["sucursal"].ToString()); ;
                    }
                    cargarInformacion();
                }
            }

        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["sucursal"] = "0";
                phInformacion.Visible = false;
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
                phInformacion.Visible = false;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }
        #endregion

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            #region grafica principal
            cantAccTrab = Convert.ToInt32(nroAccTrab.Text);
            cantAccCom = Convert.ToInt32(nroAccCom.Text);
            cantEnfCom = Convert.ToInt32(nroEnfCom.Text);
            cantEnfPOO = Convert.ToInt32(nroEnfPOO.Text);
            cantEnfOcu = Convert.ToInt32(nroEnfOcu.Text);
            cantTrabRef = Convert.ToInt32(nroTrabRef.Text);
            cantTrabDis = Convert.ToInt32(nroTrabDis.Text);
            cantResEvaCli = Convert.ToInt32(nroResEvaCli.Text);
            cantRep = Convert.ToInt32(monRepMed.Text);
            cargarGraficaPrincipal();
            graficoFuerzaLab.SaveImage(HttpContext.Current.Server.MapPath("~/archivos/images_graf/graficoFuerzaLab.jpg"));
            #endregion

            #region evaluacion clinica
            cantEvPreEm = Convert.ToInt32(cellEvaPreEmpV.Text);
            cantEvaPreVac = Convert.ToInt32(cellEvaPreVacV.Text);
            cantEvaPosVac = Convert.ToInt32(cellEvaPosVacV.Text);
            cantEvaPer = Convert.ToInt32(cellEvaPerV.Text);
            cantEvaEsp = Convert.ToInt32(cellEvaEspV.Text);
            cantEvaPosEmp = Convert.ToInt32(cellEvaPosEmpV.Text);
            cantEvaAsi = Convert.ToInt32(cellEvaAsiV.Text);
            cargarGraficaEvaClinica();
            graficaEvaCli.SaveImage(HttpContext.Current.Server.MapPath("~/archivos/images_graf/graficaEvaCli.jpg"));
            #endregion

            #region reposos
            cantRep = Convert.ToInt32(cellNroRepV.Text);
            cantDiasRep = Convert.ToInt32(cellDiaRepV.Text);
            cantRepEnfCom = Convert.ToInt32(cellNroRepEnfComV.Text);
            cantRepEnfOcu = Convert.ToInt32(cellRepEnfOcuV.Text);
            cantRepAccCom = Convert.ToInt32(cellRepAccComV.Text);
            cargarGraficaMonReposos();
            graficaRepMed.SaveImage(HttpContext.Current.Server.MapPath("~/archivos/images_graf/graficaRepMed.jpg"));
            #endregion

            graficaDiagnostico.SaveImage(HttpContext.Current.Server.MapPath("~/archivos/images_graf/graficaDiagnostico.jpg"));
            graficaSistema.SaveImage(HttpContext.Current.Server.MapPath("~/archivos/images_graf/graficaSistema.jpg"));


            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                nroAccTrab.Text,
                nroAccCom.Text,
                nroEnfCom.Text,
                nroEnfPOO.Text,
                nroEnfOcu.Text,
                nroTrabRef.Text,
                nroTrabDis.Text,
                nroResEvaCli.Text,
                monRepMed.Text,
                cellEvaPreEmpV.Text,
                cellEvaPreVacV.Text,
                cellEvaPosVacV.Text,
                cellEvaPerV.Text,
                cellEvaEspV.Text,
                cellEvaPosEmpV.Text,
                cellEvaAsiV.Text,
                cellNroRepV.Text,
                cellDiaRepV.Text,
                cellNroRepEnfComV.Text,
                cellRepEnfOcuV.Text,
                cellRepAccComV.Text
            };
            PrintFile.PrintVigilanciaEpidemiologica(valores, this);
        }

        }
        
}