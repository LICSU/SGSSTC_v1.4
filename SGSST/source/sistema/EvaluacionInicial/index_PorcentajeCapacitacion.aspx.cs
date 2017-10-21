using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.GestionLaboral;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class index_PorcentajeCapacitacion : Page
    {
        #region variable
        private  Utilidades objUtilidades = new Utilidades();
        private Tuple<bool, bool> BoolEmpSuc;
        private Model_UsuarioSistema ObjUsuario;
        private DateTime fechaInicial;
        private DateTime fechaFinal;
        private int IdEmpresa = 0;
        private int IdSucursal = 0;
        #endregion

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            fechaInicial = Convert.ToDateTime("01/01/" + DateTime.Now.Year);
            fechaFinal = Convert.ToDateTime("31/12/" + DateTime.Now.Year);

            if (!IsPostBack)
            {
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
                            if (c.ClientID.Contains("ddlSucursal"))
                            {
                                int nroTrabajadores = 0;
                                int cantGestiones = 0;
                                //Buscar cantidad de trabajadores para la empresa seleccionada.(Cantidad de filas)
                                nroTrabajadores = Mgr_Trabajador.Trabajadores_CantidadesByCapacidad(Convert.ToInt32(ddlSucursal.SelectedValue), fechaInicial, fechaFinal);
                                //Cantidad de gestiones laborales de tipo capacitacion para el trimestre seleccionado (Cantidad de Columnas)

                                cantGestiones = Mgr_GestionLaboral.GestionLaboralByFecha(fechaInicial, fechaFinal);
                                if (nroTrabajadores > 0)
                                {
                                    crearTabla(nroTrabajadores, cantGestiones);
                                    phAsistenciasLeyenda.Visible = true;
                                }
                                else
                                {
                                    phAsistenciasLeyenda.Visible = false;

                                    Table _table;
                                    _table = new Table();
                                    _table.ID = "tbCapacitacion";
                                    _table.CssClass = "table";
                                    TableHeaderRow _header_fila = new TableHeaderRow();
                                    //Nro
                                    TableHeaderCell _header_celda = new TableHeaderCell();
                                    _header_celda.Text = "No Existen trabajadores asociados a ninguna gestion laboral.";
                                    _header_celda.CssClass = "text-center";
                                    _header_fila.Cells.Add(_header_celda);
                                    _table.Rows.Add(_header_fila);
                                    pnTablaCapacitacion.Controls.Add(_table);
                                }
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


            if (!BoolEmpSuc.Item2)
            {
                int nroTrabajadores = 0;
                int cantGestiones = 0;
                ViewState["sucursal"] = ObjUsuario.Id_sucursal;
                cargarDatos();

                //Buscar cantidad de trabajadores para la empresa seleccionada.(Cantidad de filas)

                nroTrabajadores = Mgr_Trabajador.Trabajadores_CantidadesByCapacidad(ObjUsuario.Id_sucursal, fechaInicial, fechaFinal);
                //Cantidad de gestiones laborales de tipo capacitacion para el trimestre seleccionado (Cantidad de Columnas)

                cantGestiones = Mgr_GestionLaboral.GestionLaboralByFecha(fechaInicial, fechaFinal);
                if (nroTrabajadores > 0)
                {
                    crearTabla(nroTrabajadores, cantGestiones);
                    phAsistenciasLeyenda.Visible = true;
                }
                else
                {
                    Table _table;
                    _table = new Table();
                    _table.ID = "tbCapacitacion";
                    _table.CssClass = "table";
                    TableHeaderRow _header_fila = new TableHeaderRow();
                    //Nro
                    TableHeaderCell _header_celda = new TableHeaderCell();
                    _header_celda.Text = "No Existen trabajadores asociados a ninguna gestion laboral.";
                    _header_celda.CssClass = "text-center";
                    _header_fila.Cells.Add(_header_celda);
                    _table.Rows.Add(_header_fila);
                    pnTablaCapacitacion.Controls.Add(_table);
                }

            }
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
                cargarDatos();
            }
        }
        #endregion

        #region CargarDatos
        private void cargarDatos()
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            IdEmpresa = IdEmpSuc.Item1;
            IdSucursal = IdEmpSuc.Item2;

            List<empresa> empresa_list = Mgr_Empresa.Empresa(Convert.ToInt32(IdEmpresa));
            List<sucursal> sucursal_list = Mgr_Sucursal.Sucursal(Convert.ToInt32(IdSucursal), 0, "");

            phEncabezado.Visible = true;
        }

        private void crearTabla(int cantTrab, int cantGest)
        {
            Table _table;
            #region variables
            _table = new Table();
            _table.ID = "tbCapacitacion";
            _table.CssClass = "table";
            TableHeaderRow _header_fila = new TableHeaderRow();
            #endregion

            #region cabecera tabla
            #region  Nro
            TableHeaderCell _header_celda = new TableHeaderCell();
            _header_celda.Text = "Nro";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            #region Trabajador
            _header_celda = new TableHeaderCell();
            _header_celda.Text = "NOMBRE";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            #region Cedula
            _header_celda = new TableHeaderCell();
            _header_celda.Text = "DOCUMENTO DE IDENTIDAD";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            #region cantidad Horas
            _header_celda = new TableHeaderCell();
            _header_celda.Text = "CANTIDAD HORAS ACUMULADAS";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            IdEmpresa = IdEmpSuc.Item1;
            IdSucursal = IdEmpSuc.Item2;

            List<gestion_laboral> gestion_lista = new List<gestion_laboral>();
            gestion_lista = Mgr_GestionLaboral.GesLabCap(fechaInicial, fechaFinal, IdEmpresa, IdSucursal);

            foreach (gestion_laboral gl in gestion_lista)
            {
                #region  Temas
                _header_celda = new TableHeaderCell();
                string titulo = gl.descripcion + " <br/> " + Convert.ToDateTime(gl.fecha).ToString("dd-MM-yyy") + " Horas:" + gl.cant_horas;
                _header_celda.Text = titulo.ToUpperInvariant();
                _header_celda.CssClass = "text-center";
                _header_fila.Cells.Add(_header_celda);
                _table.Rows.Add(_header_fila);
                #endregion

            }
            
            #endregion

            TableCell _fila = new TableCell();
            TableRow _columna = new TableRow();
            int NumTrab = 1, gestion = 1, HorasAsistio = 0, inaJust = 0, InaInjust = 0, Asistencias = 0;
            bool CantHoras = false;

            List<trabajador> List_Trab = Mgr_Trabajador.Trabajador(0, 0, Convert.ToInt32(IdSucursal), 0);

            foreach (var item1 in List_Trab)
            {
                HorasAsistio = 0;
                CantHoras = false;

                List<trabajador_gestion> trab_lista = Mgr_Trabajador.Trabajadores_Capacitacion(item1.id_trabajador, fechaInicial, fechaFinal);

                foreach (var item2 in trab_lista)
                {
                    if (HorasAsistio == 0)
                    {
                        #region datos trabajador
                        _columna = new TableRow();
                        _columna.ID = "columna" + NumTrab;
                        _fila = new TableCell();
                        _fila.Text = "" + (NumTrab);
                        _columna.Cells.Add(_fila);
                        _table.Rows.Add(_columna);

                        _fila = new TableCell();
                        _fila.Text = string.Empty + (item1.primer_nombre + ' ' + item1.primer_apellido);
                        _fila.Attributes.Add("style", "white-space: nowrap;");
                        _columna.Cells.Add(_fila);
                        _table.Rows.Add(_columna);

                        _fila = new TableCell();
                        _fila.Text = string.Empty + (item1.cedula);
                        _columna.Cells.Add(_fila);
                        _table.Rows.Add(_columna);
                        #endregion
                    }

                    #region asistencias
                    _fila = new TableCell();
                    _fila.ID = "fila" + gestion + "_" + NumTrab;
                    if (item2.asistencia.Contains("SI"))
                    {
                        _fila.Text = "Asistió";
                        HorasAsistio = HorasAsistio + Convert.ToInt32(item2.gestion_laboral.cant_horas);
                        _fila.BackColor = System.Drawing.Color.MediumPurple;
                        Asistencias++;
                    }
                    else if (item2.asistencia.Contains("-"))
                    {
                        _fila.Text = "Sin Asistencia";
                        _fila.BackColor = System.Drawing.Color.YellowGreen;
                    }
                    else
                    {
                        if (item2.asistencia.Contains("Justificada"))
                        {
                            _fila.Text = "No Asistió";
                            _fila.BackColor = System.Drawing.Color.SkyBlue;
                            inaJust++;
                        }
                        else if (item2.asistencia.Contains("Injustificada"))
                        {
                            _fila.Text = "No Asistió";
                            _fila.BackColor = System.Drawing.Color.Tomato;
                            InaInjust++;
                        }

                    }
                    #endregion

                    _fila.CssClass = "text-center";
                    _columna.Cells.Add(_fila);
                    gestion++;
                    CantHoras = true;
                }

                if (CantHoras)
                {
                    _table.Rows.Add(_columna);
                    _fila = new TableCell();
                    _fila.Text = "" + HorasAsistio;
                    _fila.CssClass = "text-center";
                    _fila.BackColor = System.Drawing.Color.DarkSeaGreen;
                    _columna.Cells.AddAt(3, _fila);
                    _table.Rows.Add(_columna);

                    NumTrab++;
                    pnTablaCapacitacion.Controls.Add(_table);
                }

            }
            
            #region  Generar la grafica
            int totalIna = inaJust + InaInjust;
            lblTotalInasistencias.Text = totalIna.ToString();
            lblTotalAsistencias.Text = "" + Asistencias;
            Double[] yAsistencias = { 0, 0 };
            yAsistencias[0] = totalIna;
            yAsistencias[1] = Asistencias;
            String[] xCadenas = { "Inasistencia", "Asistencia" };
            graficoAsistencia.Series["asistencias"].Label = "#PERCENT{P0}";
            graficoAsistencia.Series["asistencias"].Points.DataBindXY(xCadenas, yAsistencias);
            #endregion

        }
        #endregion
    }
}