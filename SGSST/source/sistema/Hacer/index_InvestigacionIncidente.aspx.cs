using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
    public partial class index_InvestigacionIncidente : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;


            DateTime fechaActual = DateTime.Now;
            ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
            ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

            if (!IsPostBack)
            {
                ViewState["area"] = "0";
                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");
                LlenarGridView();
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
        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Incidente_General(
                GridView1,
                IdEmpresa,
                IdSucursal,
                string.Empty + ViewState["area"],
                string.Empty + ViewState["search"],
                string.Empty + ViewState["FechaInicio"],
                string.Empty + ViewState["FechaFin"]);

        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            investigacion_ac_in tabla = new investigacion_ac_in();

            List<investigacion_ac_in> consulta = new List<investigacion_ac_in>();
            consulta = Getter.InvestigacionAccidente(Convert.ToInt32(hdfIDDel.Value));

            foreach (var item in consulta)
            {
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(item.id_inv_ac_in));
            }

            LlenarGridView();
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
        }
        protected void btPrint_Click(object sender, EventArgs e)
        {
            //List<investigacion_ac_in> ListaInvestigacionAccidente = new List<investigacion_ac_in>();
            //ListaInvestigacionAccidente = Getter.InvestigacionAccidente(Convert.ToInt32(ViewState["Imprimir"]));

            //foreach (var itemInvestigacionAccidente in ListaInvestigacionAccidente)
            //{
            //    List<at_it_el_pa> ListaAccidente = new List<at_it_el_pa>();
            //    ListaAccidente = Getter.Accidente(Convert.ToInt32(itemInvestigacionAccidente.id_at_it_el_pa));

            //    foreach (var itemAccidente in ListaAccidente)
            //    {
            //        int IdSucursal = Convert.ToInt32(itemAccidente.trabajador.puesto_trabajo.area.id_sucursal);

            //        Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //            IdSucursal,
            //            "InvestigacionIncidente_",
            //            "INVESTIGACION DE INCIDENTE",
            //            this);

            //        #region datos del evento
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "DATOS DEL EVENTO"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Fecha:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Hora:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Dia de la Semana"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", Convert.ToDateTime(itemInvestigacionAccidente.fecha_evento).ToString("yyyy-MM-dd")));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", Convert.ToDateTime(itemInvestigacionAccidente.hora_evento).ToString("HH:mm:ss tt")));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.dia_semana));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Lugar donde ocurrió:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Tipo de suceso:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemAccidente.sitio));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.tipo));
            //        #endregion

            //        #region datos del incidentado
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "DATOS DEL INCIDENTADO"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 8, 1, "azul", "Nombre Completo:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Cédula de Ciudadanía:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 8, 1, "", itemAccidente.trabajador.primer_nombre + " " + itemAccidente.trabajador.primer_apellido));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemAccidente.trabajador.cedula));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Mano dominante:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Antigüedad en el puesto de trabajo:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemAccidente.trabajador.mano_dominante));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.antiguedad.ToString()));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Cargo:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Supervisor inmediato:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemAccidente.trabajador.cno.ocupacion));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.supervisor));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Fecha de ingreso:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Tiempo en el cargo:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Salario devengado:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", Convert.ToDateTime(itemAccidente.trabajador.fecha_ingreso).ToString("yyyy-MM-dd")));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.tiempo_cargo));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemAccidente.trabajador.salario.ToString()));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "Actividad que realizaba:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", itemInvestigacionAccidente.actividad_realizaba));

            //        #endregion

            //        #region DESCRIPCIÓN DEL INCIDENTE
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "DESCRIPCIÓN DEL INCIDENTE"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", itemAccidente.descripcion));
            //        #endregion

            //        #region ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", itemInvestigacionAccidente.adiestramiento));
            //        #endregion

            //        #region COSTOS
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "COSTOS"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Transporte:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Reemplazo:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_transporte));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_reemplazo));


            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Atención médica:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Reposo médico "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_atencion));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_reposo));


            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Tratamiento"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Daños materiales:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_tratamiento));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_materiales));


            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Indemnización:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Producción diferida"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_indemizacion));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.costo_produccion));


            //        #endregion

            //        #region ANÁLISIS DEL INCIDENTE

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "ANÁLISIS DEL INCIDENTE"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", itemInvestigacionAccidente.actividad));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "IDENTIFICACIÓN DE POSIBLES CAUSAS DEL INCIDENTE:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.porque1));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta1));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.porque2));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta2));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.porque3));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta3));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.porque4));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta4));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.porque5));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta5));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "RECONOCER CAUSAS GENERADORAS DEL INCIDENTE:"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.que));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_que));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.porque));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_porque));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.quien));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_quien));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.donde));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_donde));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.cuando));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_cuando));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.como));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_como));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.cuanto));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.respuesta_cuanto));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "Tipo de Incidente:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", itemInvestigacionAccidente.tipo_accidente));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "MEDIDAS A ADOPTAR"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Acción"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Responsable"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Fecha"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.medida1));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.responsable1));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida1).ToString("yyyy-MM-dd")));

            //        if (itemInvestigacionAccidente.medida2 != string.Empty)
            //        {
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.medida2));
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.responsable2));
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida2).ToString("yyyy-MM-dd")));
            //        }
            //        if (itemInvestigacionAccidente.medida3 != string.Empty)
            //        {
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.medida3));
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemInvestigacionAccidente.responsable3));
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida3).ToString("yyyy-MM-dd")));
            //        }
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Nota"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemInvestigacionAccidente.nota));
            //        #endregion

            //        #region FIRMA DE LOS INVOLUCRADOS

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "FIRMA DE LOS INVOLUCRADOS"));


            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Persona"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Nombre"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Cédula"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Firma"));


            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 2, "", "Incidentado:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 2, "", "Sup. Inmediato:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 2, "", "Responsable de la Investigación:"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 3, 1, "", " "));
            //        #endregion

            //        #region SOPORTES
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "SOPORTES"));

            //        foreach (var itemSoporte in itemAccidente.soporte)
            //        {
            //            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, "C", "1|1|1|1", 12, 1, itemSoporte.url));
            //        }
            //        #endregion

            //        ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
            //    }
            //}
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("crear"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string idAccidente = (gvrow.FindControl("id_at_it_el_pa") as Label).Text;
                idAccidente = objUtilidades.cifrarCadena(Convert.ToString(idAccidente));

                Response.Redirect(Paginas.Create_InvestigacionIncidente.Value+"?id=" + idAccidente);
            }
            else if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string idAccidente = (gvrow.FindControl("id_at_it_el_pa") as Label).Text;
                idAccidente = objUtilidades.cifrarCadena(Convert.ToString(idAccidente));

                Response.Redirect(Paginas.View_InvestigacionIncidente.Value + "?id=" + idAccidente);
            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIDDel.Value = (gvrow.FindControl("id_at_it_el_pa") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("print"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hImprimir.Value = (gvrow.FindControl("id_at_it_el_pa") as Label).Text;

                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);

            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();

        }
        #endregion

        #region filtros
        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int _id = 0;
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                _id = Convert.ToInt32(ddlSucursal.SelectedValue);
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                Mgr_Area.Area_Sucursal(ddlArea, _id);
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                ViewState["area"] = ddlArea.SelectedValue;
            }
            else
            {
                ViewState["area"] = "0";
            }
            LlenarGridView();
        }
        protected void txtFechaInicio_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaInicio.Text != string.Empty)
            {
                ViewState["FechaInicio"] = txtFechaInicio.Text;
            }
            else
            {
                ViewState["FechaInicio"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void txtFechaFin_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaFin.Text != string.Empty)
            {
                ViewState["FechaFin"] = txtFechaFin.Text;
            }
            else
            {
                ViewState["FechaFin"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["search"] = txtBuscar.Text;
            }
            else
            {
                ViewState["search"] = string.Empty;
            }

            LlenarGridView();
        }
        #endregion
    }
}