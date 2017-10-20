using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
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

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class index_Indicadores : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private int K = 240000;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                cargarDatos();
                CargarListas();
            }

        }
        private void cargarDatos()
        {
            List<trabajador> ListaTrabajador = new List<trabajador>();
            if (!BoolEmpSuc.Item2)
            {
                ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, ObjUsuario.Id_sucursal);

                Label1.Text = string.Empty + ListaTrabajador.Count;
                Label2.Text = string.Empty + ListaTrabajador.Count;
                Label3.Text = string.Empty + ListaTrabajador.Count;
                Label5.Text = string.Empty + ListaTrabajador.Count;

                List<area> ListaArea = new List<area>();
                ListaArea = Mgr_Area.Area(ObjUsuario.Id_empresa, 0, "");
                Label4.Text = string.Empty + ListaArea.Count;
            }
            else
            {
                ListaTrabajador = Mgr_Trabajador.Trabajador(0, ObjUsuario.Id_empresa);

                Label1.Text = string.Empty + ListaTrabajador.Count;
                Label2.Text = string.Empty + ListaTrabajador.Count;
                Label3.Text = string.Empty + ListaTrabajador.Count;
                Label5.Text = string.Empty + ListaTrabajador.Count;

                List<area> ListaArea = new List<area>();
                ListaArea = Mgr_Area.Area(ObjUsuario.Id_empresa, 0, "");
                Label4.Text = string.Empty + ListaArea.Count;
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaAdd);
            }
            if (BoolEmpSuc.Item2)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
            }
        }
        #endregion

        #region acciones

        protected void Guardar(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresaAdd, ddlSucursalAdd);

            String[] valores = {
                txtNombre.Text,
                "Indicadores"
            };

            ObjUsuario.Error = CRUD.AddIndicadores(IdEmpSuc,  valores, flpArchivo);

            Modal.CerrarModal("printModal", "printModalScript", this);
            TextBox txtBuscar = new TextBox();
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
        }

        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2
            };

            #region cuerpo
            string[] definicion = {
                "Política de Seguridad y Salud en el Trabajo",
                "Compromiso de la Organización",
                "Política de  SST, comunicada.",
                "Objetivos y metas, divulgados",
                "Evaluación Inicial del SGSST",
                "Plan de trabajo anual",
                "Responsabilidades",
                "Identificación de peligros y riesgos",
                "Reporte de las condiciones inseguras",
                "Copasst",
                "Funcionamiento del Copasst",
                "Recursos Humanos",
                "Recursos Financieros",
                "Documentos de Soporte",
                "Diagnóstico de las Condiciones de Seguridad y Salud en el Trabajo",
                "Plan de emergencias",
                "Capacitación en SST",
                "Autoevaluación",
                "Ejecución del pan de trabajo anual",
                "Intervención de peligros y riesgos",
                "Ejecución del plan de capacitación en SST",
                "Cultura de Prevención",
                "Reducir accidentalidad",
                "Inspecciones",
                "Plan de accidentalidad",
                "Investigación de accidentes e incidentes",
                "Reducción de Casos Médicos Musculo Esqueléticos",
                "Simulacros",
                "Frecuencia de los accidentes laborales.",
                "Severidad de los accidentes laborales.",
                "Mortalidad de los accidentes laborales.",
                "Tasa Accidentalidad",
                "Índice de Ausentismo Laboral",
                "Gestión de Riesgos",
                "% Cubrimiento EPP ",
                "% uso EPP",
                "Eficiencia del SGSST",
                "Acciones correctivas",
                "% Condiciones mejoradas",
                "% de Cumplimiento del Decreto 1072",
                "Ausentismo."
            };
            string[] interpretacion = {
                "Existe el documento de la Política de SST y está firmada, divulgada y fechada.",
                "Evidenciar el compromiso de la Empresa con la Seguridad y Salud en el Trabajo a través de la declaración de la Política",
                "La Política de SST ha sido difundida al __% de los trabajadores.",
                "Los objetivos y metas de seguridad  se encuentran escritos y divulgados.",
                "Existe un Formato para la Evaluación Inicial del SGSST con los criterios contemplados en el Decreto 1072 en su Artículo 2.2.4.6.16",
                "Establecer un Plan Anual de Trabajo en Seguridad y Salud en el Trabajo que evidencie el compromiso gerencial.",
                "Asignación de responsabilidades a los distintos niveles de la empresa frente al desarrollo del Sistema de Gestión de la Seguridad y Salud en el Trabajo",
                "Método definido para la identificación de peligros",
                "instrumento para que los trabajadores reporten las condiciones de trabajo peligrosas",
                "Existencia del COPASST",
                "Número de reuniones anuales del Copasst",
                "Asignación de Recursos Humanos requeridos para la implementación del Sistema de Gestión de la Seguridad y Salud en el Trabajo. ( Número de Comités en funcionamiento y número de encargados del SGSST)",
                "La asignación de recursos financieros y físicos  requeridos para la implementación del Sistema de Gestión de la Seguridad y Salud en el Trabajo.",
                "Existen Documentos de Soporte de la Gestión de Seguridad y Salud en el Trabajo",
                "La existencia de un procedimiento para efectuar el diagnóstico de las condiciones de salud de los trabajadores, para la definición de las prioridades de control e intervención",
                "Existencia de un plan para prevención y atención de emergencias en la organización ( y en sus sedes si aplica)",
                "Existe un Plan de Capacitación anual en SST (y en sus sedes si aplica)",
                "Evaluación inicial del SG-SST",
                "% de actividades cumplidas del plan de trabajo  en el SGSST",
                "Intervención de los peligros identificados",
                "% de Capacitaciones Desarrolladas en el Período",
                "Generar comportamientos seguros y de autocuidado en los trabajadores de la empresa",
                "Reducir la accidentalidad en general",
                "% de Inspecciones Realizadas",
                "Ejecución del plan de intervención de la accidentalidad, actividades cumplidas del Plan",
                "Porcentaje de accidentes e incidentes investigados",
                "Reducir las enfermedades Musculo esqueléticas a través del Programa de Vigilancia Epidemiológica",
                "Porcentaje de simulacros ejecutados",
                "Número de veces que ocurre un accidente laboral, en un período de tiempo",
                "Número de días perdidos y/o cargados por accidentes laborales en un período de tiempo.",
                "Número de accidentes laborales mortales en un período de tiempo.",
                "Relación del número de casos de accidentes de trabajo ocurridos durante el período respecto al  número de trabajadores en el mismo período ",
                "Incluye Falta al trabajo por Enfermedad Común, enfermedad profesional, accidente de trabajo y consultas de salud.",
                "% de Disminución de Riesgos ",
                "Proporción de trabajadores que reciben los Equipos de Protección Personal",
                "Muestra el % de personas que usan los EPP",
                "% de eficiencia del SGSST respecto a los reportes de los Trabajadores",
                "Indicador de las acciones correctivas realizadas",
                "Muestra el porcentaje de condiciones mejoradas",
                "% de Implementación del SGSST en cumplimiento de todos los requisitos del Decreto 1072",
                "Ausentismo es la no asistencia al trabajo, con incapacidad médica."
            };
            string[] metodoCalculo = {
                "Documento de la Política de SST firmada y fechada.",
                "La política incluya objetivos específicos en materia de SST de acuerdo a los riesgos, cumpliendo con la normatividad y garantizando la mejora continua",
                "(Número de trabajadores que conocen la Política de SST / Número total de Trabajadores ) X 100",
                "(Número de Trabajadores que conocen los Objetivos y metas de seguridad informados por escrito /Número total de Trabajadores ) X 100",
                "Formato para la Evaluación Inicial del SGSST",
                "Existencia del documento de plan de trabajo firmado por el Representante Legal.",
                "(N° total de Jefes con delegación de responsabilidad en SST/Total de Jefes de la estructura) x100",
                "Existe un Método definido para la identificación de peligros.",
                "Existe un instrumento o formato para que los trabajadores reporten las condiciones de trabajo inseguras",
                "La empresa cuenta con un COPASST en funcionamiento y con delegación de funciones.",
                "(Nº de Reuniones ordinarias realizadas del Copasst/ 12) x 100",
                "N° de recursos humanos disponibles según el tamaño de la empresa, y especialistas requeridos en materia de SST",
                "(Asignación de recursos aprobados para las necesidades contempladas por el SGSST / Recursos Necesarios para cubrir el total de necesidades del SGSST) X 100",
                "Documentos en físico o en digital del respaldo en materia de Seguridad y Salud en el Trabajo",
                "existencia del procedimiento de las inspecciones",
                "(N° de sedes con plan de emergencia/Nro. total de trabajadores) x 100",
                "(N° de Áreas con plan de capacitación anual en SST/Total de áreas) x 100",
                "(Nº de Criterios contemplados e implementados en el Formato de Evaluación Inicial / Número de Criterios mínimos establecidos para la evaluación inicial en el decreto 1072) x 100",
                "(N° de Actividades Ejecutadas del Plan de Trabajo / Nº de Actividades programadas en el Plan de Trabajo) X 100",
                "(N° Total De Riesgos Intervenidos en el Período/Total De Riesgos Identificados en el Período) x 100",
                "(N° Total de Capacitaciones Ejecutadas en el período  / Nº de Capacitaciones programadas en el Plan de Capacitación para ese período) X 100",
                "(Nº de Capacitaciones ejecutadas de autocuidado/ Nº de Capacitaciones programadas en autocuidado) X 100",
                "(Acciones de Mejora implementadas en base a los Siniestros / Acciones de Mejora Identificadas en dicho Siniestro) x 100",
                "Promedio((Nº de Inspecciones realizadas por área / Total de tipo de inspecciones del área) x 100)",
                "(N° De Actividades Desarrolladas En La Intervención De Los Riesgos Prioritarios/Actividades Propuestas Para La Intervención  De Los Riesgos Prioritarios) x 100",
                "(N° De Accidentes e Incidentes investigados/Nro. De Accidentes e Incidentes Reportados) x 100%",
                "(Nº de Casos Musculo Esqueléticos reportados en la Vigilancia Epidemiológica / N° Investigación realizada al Puesto de trabajo respecto a los casos ) x 100",
                "(N° De Simulacros Realizados / Nro. De Simulacros Programados) x 100",
                "(Número de accidentes de trabajo que se presentaron en el período “Z” / Total de horas hombre trabajadas en el período “Z”) * 240.000.	",
                "(Número de días de trabajo perdidos por accidente de trabajo en el período “Z” + número de días cargados en el período “Z” / Horas hombre trabajadas en el período “Z”) * 240.000",
                "(Número de accidentes de trabajo mortales que se presentaron en el período “Z” / Total de accidentes de trabajo que se presentaron en el período “Z”) * 100.",
                "TA = (N° de Accidente de Trabajo Ocurridos en el Período / N° De Trabajadores ) X 100",
                "IAL= ( N° Total de Horas de Ausentismo Justificado Medicamente en el Período / Horas Hombre en el Período ) x 100",
                "GR= (Riesgos críticos gestionados / Riesgos críticos identificados) x 100",
                "EPP= (Número de EPP entregados / Número de EPP requeridos) x  100",
                "(Nº de Trabajadores que usan EPP en el período Laboral / Número de EPP entregados)  x 100",
                "(Deficiencias del SG-SST identificadas efectivamente gestionadas/ Deficiencias del SG-SST identificadas por los trabajadores) x 100",
                "(Nº de Acciones correctivas implementadas / Nº de inconformidades encontradas) x 100",
                "CM = ( Nº de condiciones mejoradas/ Nº de no conformidades encontradas) x  100",
                "(Requisitos cumplidos del decreto 1072 / Totalidad de requisitos establecidos en el Decreto 1072) x 100",
                "(Número de días de ausencia por incapacidad laboral y común / Número de días de trabajo programados) * 100."
            };
            string[] fuenteCalculo = {
                "SG-SST",
                "Inspeccionar la inclusión de los requerimientos en el documento de la política",
                "Encuesta realizada a una muestra de trabajadores en donde se evalúan los conocimientos respecto a la política de SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "Coordinador SST",
                "SG-SST",
                "SG-SST",
                "SG-SST",
                "Instrumento de evaluación inicial del SG-SST diligenciado por el Coordinador del SST",
                "Plan Anual de Trabajo",
                "Inspecciones de Seguridad,Matriz de Riesgos,Investigaciones de AT,Reportes Del COPASST",
                "Documento de Registro de Capacitaciones ",
                "Plan de Capacitación y Registro de Capacitaciones ejecutadas",
                "Reporte de Accidentes/ Incidentes",
                "Control de Inspecciones",
                "Análisis De Causalidad,Investigación De Accidente de Trabajo,Reporte De Incidentes",
                "Reporte de Accidentes e incidentes",
                "Vigilancia Epidemiológica,Inspecciones,Reporte de los Trabajadores",
                "Plan Anual De Trabajo En SST",
                "Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos",
                "Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos",
                "Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos",
                "Cálculos Índices de Accidentalidad",
                "Cálculos Índices de Accidentalidad",
                "Matriz de Riesgos",
                "Registro de Control de entregas de EPP,Inspecciones de Seguridad",
                "Inspecciones de Seguridad",
                "Reporte de los Trabajadores",
                "SG-SST,Inspecciones,COPASST",
                "SG-SST,inspecciones de Seguridad",
                "Matriz Legal",
                "Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos"
            };
            string[] responsable = {
                "Coordinador de SST",
                "Coordinador de SST,Copasst",
                "Coordinador de SST",
                "Coordinador de SST,Gerencia",
                "Coordinador de SST,Gerencia",
                "Coordinador de SST,Gerencia",
                "Coordinador de SST",
                "Coordinador de SST",
                "Coordinador de SST",
                "Copasst",
                "Copasst",
                "Gerente,COPASST,Coordinador SST",
                "Empleador,Gerente,COPASST,Coordinador SST",
                "Coordinador SST",
                "Coordinador SST",
                "Coordinador de SST,Comité de emergencias",
                "Coordinador de SST",
                "Coordinador de SST,Copasst,Otras áreas",
                "Coordinador de SST",
                "Coordinador de SST",
                "Coordinador de SST",
                "Coordinador de SST",
                "Coordinador de SST",
                "Coordinador de SST",
                "Jefes de Área,COPASST,Área de Gestión de la SST",
                "Gerente,Jefes de Área,COPASST,Área de Gestión de la SST",
                "Gerente,Jefes de Área,COPASST,Área de Gestión de la SST",
                "Gerente,Jefes de Área,COPASST,Área de Gestión de la SST",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "COPASST",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos",
                "Coordinador de SST, Jefe Recursos Humanos"
            };
            string[] frecMedicion = {
                "Anual",
                "Anual",
                "Semestral",
                "Mensual",
                "Anual",
                "Semestral",
                "Anual",
                "Anual",
                "Trimestral",
                "Semestral",
                "Anual",
                "Anual",
                "Anual",
                "Semestral",
                "Trimestral",
                "Anual",
                "Anual",
                "Semestral",
                "Semestral",
                "Semestral",
                "Trimestral",
                "Semestral",
                "Trimestral",
                "Trimestral",
                "Semestral",
                "Semestral",
                "Semestral",
                "Semestral",
                "Anual",
                "Anual",
                "Anual",
                "Mensual",
                "Anual",
                "Trimestral",
                "Trimestral",
                "Mensual",
                "Semestral",
                "Anual",
                "Semestral",
                "Anual",
                "Anual"
            };
            string[] unidad = {
                "Cumplimiento",
                "Cumplimiento",
                "%",
                "%",
                "Cumplimiento",
                "Cumplimiento",
                "%",
                "Cumplimiento",
                "Cumplimiento",
                "Cumplimiento",
                "%",
                "Valor Numérico",
                "%",
                "Cumplimiento",
                "%",
                "Valor Numérico",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "Valor Numérico",
                "días",
                "Valor Numérico",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "%",
                "Valor Numérico"
            };
            string[] meta = {
                "Existencia",
                "Cumplimiento total",
                "100% de los Trabajadores",
                "100% de los Trabajadores",
                "Existencia",
                "Existencia",
                "100 % de Compromiso en todos los Niveles",
                "Identificación de peligros realizado",
                "Existencia del Reporte",
                "Existencia",
                "Número de reuniones anuales del Copasst",
                "Equipo de Trabajo Interdisciplinario",
                "100% de Recursos Aprobados",
                "Existencia",
                "100 % de Cobertura de las áreas",
                "Existencia del Plan de Prevención",
                "Existencia del Plan de Capacitación",
                "100%, de los aspectos contemplados en la evaluación inicial del SG-SST deben estar implementados en la empresa.",
                "100 % de las actividades programadas",
                "100% de los Peligros intervenidos",
                "Ejecución del 100% de las Capacitaciones programadas en el Plan ",
                "Ejecución del 100% de las Capacitaciones programadas en materia de auto cuidado personal",
                "100% de Mejoras Implementadas",
                "100 % de cobertura de las áreas",
                "Cumplimiento del 100% de las actividades propuestas en el Plan de Prevención",
                "100% de reportes realizados",
                "100% de investigaciones realizadas",
                "100% de Simulacros Realizados en cuanto a la Programación",
                "Valor Numérico menor en comparación al resultado del Período anterior",
                "Valor Numérico menor en comparación al resultado del Período anterior",
                "Valor Numérico menor en comparación al resultado del Período anterior",
                "% menor en comparación al resultado del Período anterior",
                "% menor en comparación al resultado del Período anterior",
                "100% de Riesgos críticos gestionados",
                "100% de EPP entregados al personal",
                "100% de Trabajadores Cumpliendo con el uso de EPP",
                "100% de Deficiencias Gestionadas",
                "100% de acciones correctivas implementadas",
                "100% de condiciones mejoradas",
                "100% de los lineamientos del Decreto 1072 cumplidos",
                "Valor Numérico menor en comparación al resultado del Período anterior"
            };
            string[] resultados = {
                resultado1.SelectedValue,
                resultado2.SelectedValue,
                resultado3.Text,
                resultado4.Text,
                resultado5.Text,
                resultado6.Text,
                resultado7.Text,
                resultado8.Text,
                resultado9.Text,
                resultado10.Text,
                resultado11.Text,
                resultado12.Text,
                resultado13.Text,
                resultado14.Text,
                resultado15.Text,
                resultado16.Text,
                resultado17.Text,
                resultado18.Text,
                resultado19.Text,
                resultado20.Text,
                resultado21.Text,
                resultado22.Text,
                resultado23.Text,
                resultado24.Text,
                resultado25.Text,
                resultado26.Text,
                resultado27.Text,
                resultado28.Text,
                resultado29.Text,
                resultado30.Text,
                resultado31.Text,
                resultado32.Text,
                resultado33.Text,
                resultado34.Text,
                resultado35.Text,
                resultado36.Text,
                resultado37.Text,
                resultado38.Text,
                resultado39.Text,
                resultado40.Text,
                resultado41.Text
            };
            PrintFile.PrintIndicadores(valores, definicion, interpretacion, metodoCalculo, fuenteCalculo, 
                                       responsable, frecMedicion, unidad, meta, resultados, this);
            #endregion
        }

        private bool validacion(TextBox txt1, Label txt2, string msj1)
        {
            bool resultado = true;

            if (txt1.Text == string.Empty)
            {
                txt1.Text = "0";
            }
            if (txt2.Text == string.Empty)
            {
                txt2.Text = "0";
            }

            if (Convert.ToDouble(txt1.Text) < 0 || Convert.ToDouble(txt2.Text) < 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                "alertMessage1", @"alert('Ningun valor debe ser menor a 0')", true);
                resultado = false;
            }
            else if (Convert.ToDouble(txt1.Text) > Convert.ToDouble(txt2.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                "alertMessage2", @"alert('" + msj1 + "')", true);
                resultado = false;
            }
            return resultado;
        }

        private bool validacion(TextBox txt1, TextBox txt2, string msj1)
        {
            bool resultado = true;
            if (txt1.Text == string.Empty)
            {
                txt1.Text = "0";
            }
            if (txt2.Text == string.Empty)
            {
                txt2.Text = "0";
            }

            if (Convert.ToDouble(txt1.Text) < 0 || Convert.ToDouble(txt2.Text) < 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                "alertMessage1", @"alert('Ningun valor debe ser menor a 0')", true);
                resultado = false;
            }
            else if (Convert.ToDouble(txt1.Text) > Convert.ToDouble(txt2.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                "alertMessage2", @"alert('" + msj1 + "')", true);
                resultado = false;
            }
            return resultado;
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

        private void CollapseAcordeon(int acordeon)
        {
            if (acordeon == 1) {
                collapse1.Attributes.Add("class", "panel-collapse collapse in");
                collapse2.Attributes.Add("class", "panel-collapse collapse");
                collapse3.Attributes.Add("class", "panel-collapse collapse");
            }
            else if (acordeon == 2)
            {
                collapse1.Attributes.Add("class", "panel-collapse collapse");
                collapse2.Attributes.Add("class", "panel-collapse collapse in");
                collapse3.Attributes.Add("class", "panel-collapse collapse");
            }
            else if (acordeon == 3)
            {
                collapse1.Attributes.Add("class", "panel-collapse collapse");
                collapse2.Attributes.Add("class", "panel-collapse collapse");
                collapse3.Attributes.Add("class", "panel-collapse collapse in");
            }
        }

        //panel 1
        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {
            if (validacion(Textbox1, Label1, "El Número de trabajadores que conocen la Política SST debe ser menor al número total de trabajadores"))
            {
                double resultado = ((Convert.ToDouble(Textbox1.Text) / Convert.ToDouble(Label1.Text)) * 100);
                resultado3.Text = resultado.ToString("#.##") + " %";
            }

            CollapseAcordeon(1);
        }
        protected void Textbox2_TextChanged(object sender, EventArgs e)
        {
            if (validacion(Textbox2, Label2, "Número de Trabajadores que conocen los Objetivos y Metas de seguridad informados por escrito debe ser menor al número total de trabajadores"))
            {
                double resultado = ((Convert.ToDouble(Textbox2.Text) / Convert.ToDouble(Label2.Text)) * 100);
                resultado4.Text = resultado.ToString("#.##") + " %";
            }

            CollapseAcordeon(1);
        }
        protected void Textbox3_TextChanged(object sender, EventArgs e)
        {
            if (validacion(Textbox3, Textbox4, "N° total de Jefes con delegación de responsabilidad en SST debe ser menor que el Total de Jefes de la estructura"))
            {
                double resultado = ((Convert.ToDouble(Textbox3.Text) / Convert.ToDouble(Textbox4.Text)) * 100);
                resultado7.Text = resultado.ToString("#.##") + " %";
            }

            CollapseAcordeon(1);
        }
        protected void Textbox5_TextChanged(object sender, EventArgs e)
        {
            double resultado = ((Convert.ToDouble(Textbox5.Text) / 12) * 100);
            resultado11.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(1);
        }
        protected void Textbox6_TextChanged(object sender, EventArgs e)
        {
            if (Textbox6.Text == string.Empty)
            {
                Textbox6.Text = "0";
            }
            if (Textbox7.Text == string.Empty)
            {
                Textbox7.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox6.Text) / Convert.ToDouble(Textbox7.Text)) * 100);
            resultado13.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(1);
        }
        protected void Textbox8_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDouble(Textbox8.Text) < 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                "alertMessage1", @"alert('Ningun valor debe ser menor a 0')", true);
            }
            else
            {
                double resultado = ((Convert.ToDouble(Textbox8.Text) / Convert.ToDouble(Label3.Text)) * 100);
                resultado16.Text = resultado.ToString("#.##") + " %";
            }

            CollapseAcordeon(1);
        }
        protected void Textbox9_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDouble(Textbox9.Text) < 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                "alertMessage1", @"alert('Ningun valor debe ser menor a 0')", true);
            }
            else
            {
                double resultado = ((Convert.ToDouble(Textbox9.Text) / Convert.ToDouble(Label4.Text)) * 100);
                resultado17.Text = resultado.ToString("#.##") + " %";
            }

            CollapseAcordeon(1);
        }

        //panel 2
        protected void Textbox10_TextChanged(object sender, EventArgs e)
        {
            if (Textbox10.Text == string.Empty)
            {
                Textbox10.Text = "0";
            }
            if (Textbox11.Text == string.Empty)
            {
                Textbox11.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox10.Text) / Convert.ToDouble(Textbox11.Text)) * 100);
            resultado18.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox12_TextChanged(object sender, EventArgs e)
        {
            if (Textbox12.Text == string.Empty)
            {
                Textbox12.Text = "0";
            }
            if (Textbox13.Text == string.Empty)
            {
                Textbox13.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox12.Text) / Convert.ToDouble(Textbox13.Text)) * 100);
            resultado19.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox14_TextChanged(object sender, EventArgs e)
        {
            if (Textbox14.Text == string.Empty)
            {
                Textbox14.Text = "0";
            }
            if (Textbox15.Text == string.Empty)
            {
                Textbox15.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox14.Text) / Convert.ToDouble(Textbox15.Text)) * 100);
            resultado20.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox16_TextChanged(object sender, EventArgs e)
        {
            if (Textbox16.Text == string.Empty)
            {
                Textbox16.Text = "0";
            }
            if (Textbox17.Text == string.Empty)
            {
                Textbox17.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox16.Text) / Convert.ToDouble(Textbox17.Text)) * 100);
            resultado21.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox18_TextChanged(object sender, EventArgs e)
        {
            if (Textbox18.Text == string.Empty)
            {
                Textbox18.Text = "0";
            }
            if (Textbox19.Text == string.Empty)
            {
                Textbox19.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox18.Text) / Convert.ToDouble(Textbox19.Text)) * 100);
            resultado22.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox20_TextChanged(object sender, EventArgs e)
        {
            if (Textbox20.Text == string.Empty)
            {
                Textbox20.Text = "0";
            }
            if (Textbox21.Text == string.Empty)
            {
                Textbox21.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox20.Text) / Convert.ToDouble(Textbox21.Text)) * 100);
            resultado23.Text = resultado.ToString("#.##") + " %";
            CollapseAcordeon(2);
        }
        protected void Textbox22_TextChanged(object sender, EventArgs e)
        {
            if (Textbox22.Text == string.Empty)
            {
                Textbox22.Text = "0";
            }
            if (Textbox23.Text == string.Empty)
            {
                Textbox23.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox22.Text) / Convert.ToDouble(Textbox23.Text)) * 100);
            resultado24.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox24_TextChanged(object sender, EventArgs e)
        {
            if (Textbox24.Text == string.Empty)
            {
                Textbox24.Text = "0";
            }
            if (Textbox25.Text == string.Empty)
            {
                Textbox25.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox24.Text) / Convert.ToDouble(Textbox25.Text)) * 100);
            resultado25.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }
        protected void Textbox26_TextChanged(object sender, EventArgs e)
        {
            if (Textbox26.Text == string.Empty)
            {
                Textbox26.Text = "0";
            }
            if (Textbox27.Text == string.Empty)
            {
                Textbox27.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox26.Text) / Convert.ToDouble(Textbox27.Text)) * 100);
            resultado26.Text = resultado.ToString("#.##") + " %";
            CollapseAcordeon(2);
        }
        protected void Textbox28_TextChanged(object sender, EventArgs e)
        {
            if (Textbox28.Text == string.Empty)
            {
                Textbox28.Text = "0";
            }
            if (Textbox29.Text == string.Empty)
            {
                Textbox29.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox28.Text) / Convert.ToDouble(Textbox29.Text)) * 100);
            resultado27.Text = resultado.ToString("#.##") + " %";
            CollapseAcordeon(2);
        }
        protected void Textbox30_TextChanged(object sender, EventArgs e)
        {
            if (Textbox30.Text == string.Empty)
            {
                Textbox30.Text = "0";
            }
            if (Textbox31.Text == string.Empty)
            {
                Textbox31.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox30.Text) / Convert.ToDouble(Textbox31.Text)) * 100);
            resultado28.Text = resultado.ToString("#.##") + " %";

            CollapseAcordeon(2);
        }

        //panel 3
        protected void Textbox32_TextChanged(object sender, EventArgs e)
        {
            if (Textbox32.Text == string.Empty)
            {
                Textbox32.Text = "0";
            }
            if (Textbox33.Text == string.Empty)
            {
                Textbox33.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox32.Text) / Convert.ToDouble(Textbox33.Text)) * K);
            resultado29.Text = resultado.ToString("#.##");
            CollapseAcordeon(3);
        }
        protected void Textbox34_TextChanged(object sender, EventArgs e)
        {
            if (Textbox34.Text == string.Empty)
            {
                Textbox34.Text = "0";
            }
            if (Textbox35.Text == string.Empty)
            {
                Textbox35.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox34.Text) / Convert.ToDouble(Textbox35.Text)) * K);
            resultado30.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox36_TextChanged(object sender, EventArgs e)
        {
            if (Textbox36.Text == string.Empty)
            {
                Textbox36.Text = "0";
            }
            if (Textbox37.Text == string.Empty)
            {
                Textbox37.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox36.Text) / Convert.ToDouble(Textbox37.Text)) * 100);
            resultado31.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox38_TextChanged(object sender, EventArgs e)
        {
            if (Textbox38.Text == string.Empty)
            {
                Textbox38.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox38.Text) / Convert.ToDouble(Label5.Text)) * 100);
            resultado32.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox39_TextChanged(object sender, EventArgs e)
        {
            if (Textbox39.Text == string.Empty)
            {
                Textbox39.Text = "0";
            }
            if (Textbox40.Text == string.Empty)
            {
                Textbox40.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox39.Text) / Convert.ToDouble(Textbox40.Text)) * 100);
            resultado33.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox41_TextChanged(object sender, EventArgs e)
        {
            if (Textbox41.Text == string.Empty)
            {
                Textbox41.Text = "0";
            }
            if (Textbox42.Text == string.Empty)
            {
                Textbox42.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox41.Text) / Convert.ToDouble(Textbox42.Text)) * 100);
            resultado34.Text = resultado.ToString("#.##");
            CollapseAcordeon(3);
        }
        protected void Textbox43_TextChanged(object sender, EventArgs e)
        {
            if (Textbox43.Text == string.Empty)
            {
                Textbox43.Text = "0";
            }
            if (Textbox44.Text == string.Empty)
            {
                Textbox44.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox43.Text) / Convert.ToDouble(Textbox44.Text)) * 100);
            resultado35.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox45_TextChanged(object sender, EventArgs e)
        {
            if (Textbox45.Text == string.Empty)
            {
                Textbox45.Text = "0";
            }
            if (Textbox46.Text == string.Empty)
            {
                Textbox46.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox45.Text) / Convert.ToDouble(Textbox46.Text)) * 100);
            resultado36.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox47_TextChanged(object sender, EventArgs e)
        {
            if (Textbox47.Text == string.Empty)
            {
                Textbox47.Text = "0";
            }
            if (Textbox48.Text == string.Empty)
            {
                Textbox48.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox47.Text) / Convert.ToDouble(Textbox48.Text)) * 100);
            resultado37.Text = resultado.ToString("#.##");
            CollapseAcordeon(3);
        }
        protected void Textbox49_TextChanged(object sender, EventArgs e)
        {
            if (Textbox49.Text == string.Empty)
            {
                Textbox49.Text = "0";
            }
            if (Textbox50.Text == string.Empty)
            {
                Textbox50.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox49.Text) / Convert.ToDouble(Textbox50.Text)) * 100);
            resultado38.Text = resultado.ToString("#.##");
            CollapseAcordeon(3);
        }
        protected void Textbox51_TextChanged(object sender, EventArgs e)
        {
            if (Textbox51.Text == string.Empty)
            {
                Textbox51.Text = "0";
            }
            if (Textbox52.Text == string.Empty)
            {
                Textbox52.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox51.Text) / Convert.ToDouble(Textbox52.Text)) * 100);
            resultado39.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox53_TextChanged(object sender, EventArgs e)
        {
            if (Textbox53.Text == string.Empty)
            {
                Textbox53.Text = "0";
            }
            if (Textbox54.Text == string.Empty)
            {
                Textbox54.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox53.Text) / Convert.ToDouble(Textbox54.Text)) * 100);
            resultado40.Text = resultado.ToString("#.##");

            CollapseAcordeon(3);
        }
        protected void Textbox55_TextChanged(object sender, EventArgs e)
        {
            if (Textbox55.Text == string.Empty)
            {
                Textbox55.Text = "0";
            }
            if (Textbox56.Text == string.Empty)
            {
                Textbox56.Text = "0";
            }

            double resultado = ((Convert.ToDouble(Textbox55.Text) / Convert.ToDouble(Textbox56.Text)) * 100);
            resultado41.Text = resultado.ToString("#.##");
            CollapseAcordeon(3);
        }
        #endregion

    }
}