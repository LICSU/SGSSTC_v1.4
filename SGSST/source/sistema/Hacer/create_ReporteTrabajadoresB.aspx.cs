using System;
using Capa_Datos;
using System.Web;
using System.Web.UI;
using System.Web.Security;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_ReporteTrabajadoresB : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

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
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void Guardar(object sender, EventArgs e)
        {
            phBtnPrint.Visible = true;

            Double[] totales = ControlesDinamicos.Calcular_ReporteTrabajadores_A_B(panel1, "B");

            Double[] valores = { totales[0], totales[1] };

            lbTotalSi.Text = "" + totales[0];
            lbTotalNo.Text = "" + totales[1];
            
            lbObservaciones.Text = 
                "El porcentaje de riesgo indican condiciones de trabajo que pueden estar asociadas a " +
                "alto riesgo de lesión o enfermedad es de: " + totales[2] + "%";

            ltReporte.Text = Graficos.AddGraficoTorta_ReporteTrabajadores_A_B(totales[0], totales[1]);

            btnGuardar.Focus();
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            #region cuerpo
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                lbTotalSi.Text,
                lbTotalNo.Text,
                lbObservaciones.Text
            };

            string[] headers = {
            "JORNADA LABORAL",
            "INFORMACIÓN GENERAL",
            "MÁQUINAS Y EQUIPOS",
            "HERRAMIENTAS",
            "ESPACIOS, SEÑALIZACIÓN",
            "MANIPULACIÓN Y TRANSPORTE",
            "VIBRACIONES",
            "ILUMINACIÓN",
            "CONDICIONES TERMOHIGROMÉTRICAS",
            "RADIACIONES",
            "CONTAMINANTES QUÍMICOS (Si no se emplean productos químicos abstenerse de responder estas preguntas)",
            "CONTAMINANTES BIOLÓGICOS",
            "FATIGA FÍSICA",
            "DAÑOS A LA SALUD",
            "EQUIPOS DE PROTECCIÓN PERSONAL",
            "CAPACITACIÓN E INFORMACIÓN",
            "OTRAS CONDICIONES",
            "TOTAL DE CONDICIONES"
        };

            string[] columna1 = {
            "¿Consideras adecuada la distribución de:",
            "¿El Horario de trabajo?",
            "¿De los turnos?",
            "¿De las horas de descanso?",
            "¿De las horas extra?",
            "¿El número y la duración total de las pausas dentro de la jornada laboral son suficientes?",
            "¿De las pausas?",
            txtJornada.Text,
            "¿Esta constituido el COPASST en la empresa?",
            "¿El COPASST conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?",
            "¿Se reúnen de acuerdo a lo establecido en las normas?",
            "¿Se realizan exámenes médicos pre empleo, periódicos y post empleo?",
            "¿Se informa al trabajador de los resultados de los exámenes médicos?",
            "¿Se investigan los accidentes de trabajo?",
            "¿La empresa tiene servicio medico?",
            "¿Hay botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?",
            "¿Se ha conformado la brigada de emergencia?",
            txtInfGral.Text,
            "¿Los elementos de transmisión de las máquinas están protegidos?",
            "¿Las máquinas están provistas de resguardo en sus partes móviles para disminuir posibilidades de corte, atrapamientos o amputaciones?",
            "¿Las guardas de Protección poseen un color que contrasta con las bases estacionarias de la máquina, para alertar al personal?",
            "¿Las máquinas tienen aislamiento térmico en caso de ser necesario?",
            "¿Disponen las máquinas de interruptores u otros sistemas de parada de emergencia?",
            "¿ El cableado de la Maquinaria está en condiciones óptimas ( sin defectos de aislamiento 'rupturas en la capa externa')",
            "¿los Tomacorrientes son de tres espigas planas ( Polo vivo, neutro y tierra)?",
            txtMaqEqui.Text,
            "¿Las herramientas que utiliza están fabricadas del material adecuado?",
            "¿Están bien pulimentadas? (no tienen rebordes)",
            "¿Están bien afiladas?",
            "¿Dispone de una caja o sitio fijo para guardar y ordenar sus herramientas?",
            "¿Si las Herramientas son eléctricas, tienen doble aislamiento o tensión de seguridad?",
            "¿Dispone de todas las Herramientas necesarias para efectuar la operación?",
            txtHerr.Text,
            "¿La distancia entre las maquinas es la adecuada?, ¿no obstaculiza el proceso de trabajo de la maquinaria adjunta?",
            "¿El espacio de trabajo no le permite libre movimiento?",
            "¿Existe un lugar destinado para el almacenamiento de los materiales?",
            "¿Están los suelos limpios de grasa y son antideslizantes?",
            "¿Las condiciones del suelo son óptimas? ¿no presentan irregularidades que puedan ocasionar caídas o representen mayor esfuerzo para movilizar una carga?",
            "¿Existen Señales de uso de Equipos de Protección Personal ?",
            "¿Existen Señales de Indicaciones para una correcta manipulación de carga?",
            "¿Existen señalizaciones sobre los diferentes riesgos existentes en la áreas? (Riesgo físico, Eléctrico, Químico, Biológico, Mecánico)",
            "¿Existe una ruta señalizada para el transporte del Montacargas y/o los Operarios?",
            "¿ Existe a su alcance equipos para combatir incendios?",
            "¿Los sectores de cada máquina están delimitadas por zonas de riesgo? (alrededor de cada máquina está demarcado con pintura amarilla en el piso)",
            "¿Existen salidas de emergencia señalizadas?",
            txtEspSen.Text,
            "¿Si existen aparatos de elevación, están dotados de interruptores o señales visuales o acústicas contra exceso de carga?",
            "¿Tienen los ganchos pestillos de seguridad?",
            "¿El sistema de frenado impide el deslizamiento vertical de la carga?",
            "¿Se realizan revisiones y pruebas periódicas de los cables?",
            "Hay normas dictadas por la empresa sobre:",
            "¿Situación bajo carga suspendida?",
            "¿Carga y descarga de materiales?",
            "¿Están claramente marcados los pesos máximos que pueden ser transportados?",
            "¿Si hay Montacargas, lo conduce únicamente el personal autorizado y capacitado?",
            "¿El Conductor del Montacargas lo conduce a la velocidad permitida y con la alarma indicadora de movimiento?",
            "¿Sus frenos funcionan bien y son potentes?",
            "¿El asiento del conductor es cómodo y tiene buena visibilidad?",
            "¿Si usted emplea Carretillas para el traslado de cargas, la misma se encuentra en optimas condiciones?",
            "¿Se realiza un mantenimiento paródico a las carretillas?",
            "¿Se sustituyen las ruedas de la carretilla que se encuentran desgastadas?",
            "¿En el caso de que haya cintas transportadoras, tienen resguardo el motor, rodillo, etc.?",
            txtManTrans.Text,
            "¿Si usted utiliza herramientas que produzcan vibraciones (martillo neumático, buril, pulidora, etc.), están dotados de sistemas de amortiguación?",
            "¿Están aisladas las maquinas que producen vibraciones?",
            "¿Si usted opera en una máquina que genera vibraciones, tiene su puesto de trabajo una alfombra anti fatiga?",
            txtVibraciones.Text,
            "¿Dispone el local de trabajo de la iluminación general suficiente?",
            "¿Esta situada la luz de forma que impida deslumbramiento y reflejos?",
            "¿Usted Considera que la iluminación del puesto de trabajo es correcta?",
            "¿Se mantienen limpias las lámparas y ventanas?",
            "¿Se realizan mediciones del nivel de luz?",
            "¿Las lámparas fundidas son sustituidas rápidamente?",
            "¿Disponen los distintos lugares del centro de trabajo de los niveles de iluminación mínimos establecidos?",
            txtIluminacion.Text,
            "¿Los focos de calor (hornos, calderas, etc.) están aislados convenientemente?",
            "¿Dispone el local de ventilación general?",
            "¿Cuándo se genera vapor de agua, hay un sistema de extracción localizada u otros que eviten el exceso de humedad?",
            "¿La temperatura del local de trabajo es la adecuada al tipo de actividad?",
            "¿La ropa de trabajo utilizada es adecuada al tipo de trabajo y a la temperatura ambiental?",
            "¿se realiza un mantenimiento a los sistemas de ventilación?",
            txtTermohigro.Text,
            "¿Están señalizados los locales en que hay radiaciones ionizantes, de ser el caso?",
            "¿Si Usted está en un puesto de trabajo con radiaciones ionizantes ¿Le han informado de los riesgos a que esta sometido y las medidas preventivas a tomar?",
            "¿Le hacen revisiones médicas periódicas?",
            txtRadiaciones.Text,
            "¿Se utilizan productos químicos en su área de trabajo, sabe que productos son?.",
            "¿Están los productos claramente etiquetados?",
            "En el local de trabajo, ¿Conoce la existencia de algún contaminante químico?",
            "¿Existen normas establecidas para la utilización de productos químicos peligrosos?",
            "¿Se realizan mediciones periódicas de la concentración del contaminante?",
            "¿Se realizan revisiones periódicas a los trabajadores?",
            "¿ Si usted emplea productos tóxicos, ¿Mantiene condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)",
            "¿ Antes de incorporar al proceso productivo una sustancia química, ¿le informan sobre la hoja de datos de seguridad del producto? ( donde el proveedor detalla los datos del producto, niveles de toxicidad y acciones a seguir en casos de emergencia)",
            txtContQui.Text,
            "Solo si usted trabaja en: cría y cuidado de animales, manipulación de productos origen animal, laboratorios biológicos y clínicos, hospitales, sanitarios, etc.: ¿Están los aseos, los comedores etc., aislados de la zona de trabajo?",
            "¿Se mantienen los lugares de trabajo, vestuarios, baños, comedores, etc., en perfectas condiciones de limpieza y desinfección?",
            "¿Mantiene condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)",
            txtContBio.Text,
            "Los esfuerzos realizados en el desarrollo de la labor están adecuados a:",
            "¿Su capacidad física?",
            "¿ A la temperatura ambiental?",
            "¿ A su edad?",
            "¿ A su entrenamiento?",
            "Si usted realiza un trabajo muy pesado ¿Le hacen revisiones para controlar la frecuencia cardiaca?",
            "¿Se ha realizado alguna evaluación de consumo metabólico con respecto a la actividad que realiza?",
            txtFatFis.Text,
            "¿Se le ha informado sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?",
            "¿Está enterado de los accidentes de trabajo ocurridos en el último año?",
            "¿Conoce las causas?",
            "¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?",
            "¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?",
            "Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?",
            "Ante los Accidentes Laborales ¿Se realiza la investigación del evento?",
            txtDanSalud.Text,
            "¿Se dota al personal de Equipos de Protección Personal?",
            "¿Son adecuados al riesgo que deben proteger?",
            "¿Son de uso personal?",
            "¿Se revisan periódicamente?",
            "¿Se exige su uso obligatorio?",
            txtEPP.Text,
            "¿Se realizan simulacros de evacuación?",
            "¿La empresa cumple son las señalizaciones de rutas de evacuación?",
            "¿Conoce el plan de evacuación?",
            "¿Tiene conocimiento de cuales son los puntos de reunión ante una evacuación?",
            "¿Se capacita al personal sobre el manejo correcto de maquinaria?",
            "¿Se capacita al personal sobre el uso correcto de herramientas?",
            "¿Conoce donde están ubicados los extintores?",
            "¿Conoce donde están ubicadas las tomas de manguera para incendio?",
            txtCapInf.Text,
            "¿Las instalaciones usadas para la alimentación son apropiadas?",
            "¿Se encuentran en estado óptimo de limpieza?",
            "¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?",
            "¿Los espacios sanitarios son adecuados?",
            "¿Existen filtros de agua potable en la empresa?",
            "¿Posee la empresa áreas para el descanso y recreación?",
            "¿Existe señalización por medio de rayados?",
            "¿Las áreas de deposito de materiales peligrosos están señalizadas?",
            "¿Las áreas de desecho están alejadas de donde se realizan las actividades laborales?",
            txtOtrasCond.Text,
            "Sumatoria del total de respuestas"
        };

            //chart
            //string base64 = rutaImg.Value;
            //byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
            //iTextSharp.text.Image grafica = iTextSharp.text.Image.GetInstance(bytes);
            #endregion

            PrintFile.PrintReporteTrabajadoresB(valores, headers, columna1, panel1, this);
        }

        protected void GenerarDocumentoGeneral(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                lbTotalSi.Text,
                lbTotalNo.Text,
                lbObservaciones.Text
            };

            string[] headers = {
                "JORNADA LABORAL",
                "INFORMACIÓN GENERAL",
                "MÁQUINAS Y EQUIPOS",
                "HERRAMIENTAS",
                "ESPACIOS, SEÑALIZACIÓN",
                "MANIPULACIÓN Y TRANSPORTE",
                "VIBRACIONES",
                "ILUMINACIÓN",
                "CONDICIONES TERMOHIGROMÉTRICAS",
                "RADIACIONES",
                "CONTAMINANTES QUÍMICOS (Si no se emplean productos químicos abstenerse de responder estas preguntas)",
                "CONTAMINANTES BIOLÓGICOS",
                "FATIGA FÍSICA",
                "DAÑOS A LA SALUD",
                "EQUIPOS DE PROTECCIÓN PERSONAL",
                "CAPACITACIÓN E INFORMACIÓN",
                "OTRAS CONDICIONES",
                "TOTAL DE CONDICIONES"
            };

            string[] columna1 = {
                "¿Consideras adecuada la distribución de:",
                "¿El Horario de trabajo?",
                "¿De los turnos?",
                "¿De las horas de descanso?",
                "¿De las horas extra?",
                "¿El número y la duración total de las pausas dentro de la jornada laboral son suficientes?",
                "¿De las pausas?",
                " ",
                "¿Esta constituido el COPASST en la empresa?",
                "¿El COPASST conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?",
                "¿Se reúnen de acuerdo a lo establecido en las normas?",
                "¿Se realizan exámenes médicos pre empleo, periódicos y post empleo?",
                "¿Se informa al trabajador de los resultados de los exámenes médicos?",
                "¿Se investigan los accidentes de trabajo?",
                "¿La empresa tiene servicio medico?",
                "¿Hay botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?",
                "¿Se ha conformado la brigada de emergencia?",
                " ",
                "¿Los elementos de transmisión de las máquinas están protegidos?",
                "¿Las máquinas están provistas de resguardo en sus partes móviles para disminuir posibilidades de corte, atrapamientos o amputaciones?",
                "¿Las guardas de Protección poseen un color que contrasta con las bases estacionarias de la máquina, para alertar al personal?",
                "¿Las máquinas tienen aislamiento térmico en caso de ser necesario?",
                "¿Disponen las máquinas de interruptores u otros sistemas de parada de emergencia?",
                "¿ El cableado de la Maquinaria está en condiciones óptimas ( sin defectos de aislamiento 'rupturas en la capa externa')",
                "¿los Tomacorrientes son de tres espigas planas ( Polo vivo, neutro y tierra)?",
                " ",
                "¿Las herramientas que utiliza están fabricadas del material adecuado?",
                "¿Están bien pulimentadas? (no tienen rebordes)",
                "¿Están bien afiladas?",
                "¿Dispone de una caja o sitio fijo para guardar y ordenar sus herramientas?",
                "¿Si las Herramientas son eléctricas, tienen doble aislamiento o tensión de seguridad?",
                "¿Dispone de todas las Herramientas necesarias para efectuar la operación?",
                " ",
                "¿La distancia entre las maquinas es la adecuada?, ¿no obstaculiza el proceso de trabajo de la maquinaria adjunta?",
                "¿El espacio de trabajo no le permite libre movimiento?",
                "¿Existe un lugar destinado para el almacenamiento de los materiales?",
                "¿Están los suelos limpios de grasa y son antideslizantes?",
                "¿Las condiciones del suelo son óptimas? ¿no presentan irregularidades que puedan ocasionar caídas o representen mayor esfuerzo para movilizar una carga?",
                "¿Existen Señales de uso de Equipos de Protección Personal ?",
                "¿Existen Señales de Indicaciones para una correcta manipulación de carga?",
                "¿Existen señalizaciones sobre los diferentes riesgos existentes en la áreas? (Riesgo físico, Eléctrico, Químico, Biológico, Mecánico)",
                "¿Existe una ruta señalizada para el transporte del Montacargas y/o los Operarios?",
                "¿ Existe a su alcance equipos para combatir incendios?",
                "¿Los sectores de cada máquina están delimitadas por zonas de riesgo? (alrededor de cada máquina está demarcado con pintura amarilla en el piso)",
                "¿Existen salidas de emergencia señalizadas?",
                " ",
                "¿Si existen aparatos de elevación, están dotados de interruptores o señales visuales o acústicas contra exceso de carga?",
                "¿Tienen los ganchos pestillos de seguridad?",
                "¿El sistema de frenado impide el deslizamiento vertical de la carga?",
                "¿Se realizan revisiones y pruebas periódicas de los cables?",
                "Hay normas dictadas por la empresa sobre:",
                "¿Situación bajo carga suspendida?",
                "¿Carga y descarga de materiales?",
                "¿Están claramente marcados los pesos máximos que pueden ser transportados?",
                "¿Si hay Montacargas, lo conduce únicamente el personal autorizado y capacitado?",
                "¿El Conductor del Montacargas lo conduce a la velocidad permitida y con la alarma indicadora de movimiento?",
                "¿Sus frenos funcionan bien y son potentes?",
                "¿El asiento del conductor es cómodo y tiene buena visibilidad?",
                "¿Si usted emplea Carretillas para el traslado de cargas, la misma se encuentra en optimas condiciones?",
                "¿Se realiza un mantenimiento paródico a las carretillas?",
                "¿Se sustituyen las ruedas de la carretilla que se encuentran desgastadas?",
                "¿En el caso de que haya cintas transportadoras, tienen resguardo el motor, rodillo, etc.?",
                " ",
                "¿Si usted utiliza herramientas que produzcan vibraciones (martillo neumático, buril, pulidora, etc.), están dotados de sistemas de amortiguación?",
                "¿Están aisladas las maquinas que producen vibraciones?",
                "¿Si usted opera en una máquina que genera vibraciones, tiene su puesto de trabajo una alfombra anti fatiga?",
                " ",
                "¿Dispone el local de trabajo de la iluminación general suficiente?",
                "¿Esta situada la luz de forma que impida deslumbramiento y reflejos?",
                "¿Usted Considera que la iluminación del puesto de trabajo es correcta?",
                "¿Se mantienen limpias las lámparas y ventanas?",
                "¿Se realizan mediciones del nivel de luz?",
                "¿Las lámparas fundidas son sustituidas rápidamente?",
                "¿Disponen los distintos lugares del centro de trabajo de los niveles de iluminación mínimos establecidos?",
                " ",
                "¿Los focos de calor (hornos, calderas, etc.) están aislados convenientemente?",
                "¿Dispone el local de ventilación general?",
                "¿Cuándo se genera vapor de agua, hay un sistema de extracción localizada u otros que eviten el exceso de humedad?",
                "¿La temperatura del local de trabajo es la adecuada al tipo de actividad?",
                "¿La ropa de trabajo utilizada es adecuada al tipo de trabajo y a la temperatura ambiental?",
                "¿se realiza un mantenimiento a los sistemas de ventilación?",
                " ",
                "¿Están señalizados los locales en que hay radiaciones ionizantes, de ser el caso?",
                "¿Si Usted está en un puesto de trabajo con radiaciones ionizantes ¿Le han informado de los riesgos a que esta sometido y las medidas preventivas a tomar?",
                "¿Le hacen revisiones médicas periódicas?",
                " ",
                "¿Se utilizan productos químicos en su área de trabajo, sabe que productos son?.",
                "¿Están los productos claramente etiquetados?",
                "En el local de trabajo, ¿Conoce la existencia de algún contaminante químico?",
                "¿Existen normas establecidas para la utilización de productos químicos peligrosos?",
                "¿Se realizan mediciones periódicas de la concentración del contaminante?",
                "¿Se realizan revisiones periódicas a los trabajadores?",
                "¿ Si usted emplea productos tóxicos, ¿Mantiene condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)",
                "¿ Antes de incorporar al proceso productivo una sustancia química, ¿le informan sobre la hoja de datos de seguridad del producto? ( donde el proveedor detalla los datos del producto, niveles de toxicidad y acciones a seguir en casos de emergencia)",
                " ",
                "Solo si usted trabaja en: cría y cuidado de animales, manipulación de productos origen animal, laboratorios biológicos y clínicos, hospitales, sanitarios, etc.: ¿Están los aseos, los comedores etc., aislados de la zona de trabajo?",
                "¿Se mantienen los lugares de trabajo, vestuarios, baños, comedores, etc., en perfectas condiciones de limpieza y desinfección?",
                "¿Mantiene condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)",
                " ",
                "Los esfuerzos realizados en el desarrollo de la labor están adecuados a:",
                "¿Su capacidad física?",
                "¿ A la temperatura ambiental?",
                "¿ A su edad?",
                "¿ A su entrenamiento?",
                "Si usted realiza un trabajo muy pesado ¿Le hacen revisiones para controlar la frecuencia cardiaca?",
                "¿Se ha realizado alguna evaluación de consumo metabólico con respecto a la actividad que realiza?",
                " ",
                "¿Se le ha informado sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?",
                "¿Está enterado de los accidentes de trabajo ocurridos en el último año?",
                "¿Conoce las causas?",
                "¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?",
                "¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?",
                "Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?",
                "Ante los Accidentes Laborales ¿Se realiza la investigación del evento?",
                " ",
                "¿Se dota al personal de Equipos de Protección Personal?",
                "¿Son adecuados al riesgo que deben proteger?",
                "¿Son de uso personal?",
                "¿Se revisan periódicamente?",
                "¿Se exige su uso obligatorio?",
                " ",
                "¿Se realizan simulacros de evacuación?",
                "¿La empresa cumple son las señalizaciones de rutas de evacuación?",
                "¿Conoce el plan de evacuación?",
                "¿Tiene conocimiento de cuales son los puntos de reunión ante una evacuación?",
                "¿Se capacita al personal sobre el manejo correcto de maquinaria?",
                "¿Se capacita al personal sobre el uso correcto de herramientas?",
                "¿Conoce donde están ubicados los extintores?",
                "¿Conoce donde están ubicadas las tomas de manguera para incendio?",
                " ",
                "¿Las instalaciones usadas para la alimentación son apropiadas?",
                "¿Se encuentran en estado óptimo de limpieza?",
                "¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?",
                "¿Los espacios sanitarios son adecuados?",
                "¿Existen filtros de agua potable en la empresa?",
                "¿Posee la empresa áreas para el descanso y recreación?",
                "¿Existe señalización por medio de rayados?",
                "¿Las áreas de deposito de materiales peligrosos están señalizadas?",
                "¿Las áreas de desecho están alejadas de donde se realizan las actividades laborales?",
                " ",
                "Sumatoria del total de respuestas"
            };


            PrintFile.PrintReporteTrabajadoresBGeneral(valores, headers, columna1, panel1, this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}