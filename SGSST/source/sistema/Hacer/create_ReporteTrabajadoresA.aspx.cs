using System;
using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System.Web;
using System.Web.UI;
using System.Web.Security;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_ReporteTrabajadoresA : Page
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

        protected void Guardar(object sender, EventArgs e)
        {

            phBtnPrint.Visible = true;

            Double[] totales = ControlesDinamicos.Calcular_ReporteTrabajadores_A_B(panel1, "A"); 
            
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
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                lbTotalSi.Text,
                lbTotalNo.Text,
                lbObservaciones.Text
            };

            string[] headers = {
                "JORNADA LABORAL",
                "INFORMACIÓN GENERAL",
                "SUPERFICIE DE TRABAJO / ESPACIO",
                "SUPERFICIE DEL ASIENTO",
                "MONITOR",
                "ESPALDAR DE LA SILLA",
                "CONDICIONES ERGONÓMICAS PARA LOS BRAZOS",
                "CONDICIONES ERGONÓMICAS PARA PIERNAS Y PIES",
                "SOPORTE PARA LOS BRAZOS Y MANOS",
                "TECLADO",
                "MOUSE",
                "ILUMINACIÓN",
                "TEMPERATURA",
                "VIBRACIÓN",
                "RUIDO (en caso de que no exista ruido significativo abstenerse de responder)",
                "VENTILACIÓN",
                "FATIGA FÍSICA",
                "VISIÓN",
                "CAPACITACIÓN E INFORMACIÓN	",
                "DAÑOS A LA SALUD",
                "ASPECTOS PSICOSOCIALES",
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
                "¿Esta constituido el COPASST en la empresa?",
                "¿El COPASST conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?",
                "¿Se reúnen de acuerdo a lo establecido en las normas?",
                "¿Se realizan exámenes médicos pre empleo, periódicos y post empleo?",
                "¿Se informa al trabajador de los resultados de los exámenes médicos?",
                txtInfGral.Text,
                "¿La disposición del puesto de trabajo le permite trabajar sentado y alternar posturas?",
                "¿ Es el ancho de la superficie de trabajo apropiada, de manera que los accesorios o herramientas puedan ser ubicados a un fácil alcance y visualización?",
                "¿ La profundidad de la Superficie de Trabajo es la apropiada, de forma tal que el monitor y el teclado se ubican frente a usted?",
                "¿ La superficie de trabajo es confortable con respecto a sus dimensiones?",
                "¿ debajo de su escritorio el área es suficientemente amplia para acomodar sus piernas?",
                "¿El puesto de trabajo cuenta con suficiente espacio para realizar movimientos libremente?",
                "¿Existen corredores libres entre los puestos de trabajo?",
                "¿Hay objetos, muebles, equipos que dificulten la utilización del espacio libre del puesto de trabajo?",
                "¿Las piezas, documentos, objetos, herramientas, equipos u otros están dispuestos en forma organizada que facilita su utilización?",
                "¿ La Superficie de Trabajo es de material mate, para prevenir reflejos?",
                txtSupTrab.Text,
                "¿ la altura del asiento es ajustable, de tal manera que permite graduar una altura confortable de trabajo?",
                "¿ la altura superficie del asiento es apropiada, de tal manera que el ancho y la profundidad le permiten alojarse confortablemente?",
                "¿ la inclinación del asiento es ajustable?, ¿ le permite inclinarse hacia adelante o hacia atrás según su conveniencia?",
                "¿ El borde frontal del asiento es redondeado?, De manera que evite la presión sobre la parte posterior de la rodilla ? ",
                "¿ Es el asiento confortable en su totalidad?",
                txtSupAsi.Text,
                "¿ Puede ajustar fácilmente la altura del monitor?",
                "¿ Puede ajustar fácilmente la distancia horizontal de ubicación del monitor?",
                "¿ Puede ajustar fácilmente la inclinación de la pantalla del Monitor?",
                "¿ Puede ajustar fácilmente la rotación a izquierda o derecha del monitor?",
                txtMonitor.Text,
                "¿ Puede ajustar fácilmente el espaldar para obtener un apoyo lumbar apropiado?",
                "¿ Puede ajustar la profundidad del asiento?",
                "¿ Es el espaldar de la silla confortable en su totalidad?",
                txtEspSilla.Text,
                "¿ Puede trabajar con una postura adecuada de la cabeza, de tal manera que no produzca estrés en el cuello o en los hombros?",
                "¿ Usted puede trabajar con la cabeza orientada hacia el frente del plano del pecho, de tal manera que la rotación del cuello sea mínima?",
                "¿ Puede trabajar con una posición confortable de sus brazos?",
                "¿ Puede trabajar con una posición cómoda de los codos?",
                "¿ Puede trabajar con una postura neutral de los hombros?",
                "¿ Puede trabajar con una postura neutral de las muñecas?",
                "¿ Son mínimas las actividades que requieren extensión del tronco y brazos?",
                txtCondErgBrazos.Text,
                "¿ Puede apoyar los pies de manera confortable?",
                "¿ Al estar en posición sedente siente las rodillas en una posición confortable?",
                "¿ Esta libre de obstrucciones o puntos de presión molestos en sus piernas?",
                "¿Usted tiene un apoya pies disponible?",
                "¿Puede ajustar fácilmente la altura del apoya pies?",
                "¿Puede ajustar la inclinación del apoya pies?",
                txtcondErgPiernas.Text,
                "¿ Usted dispone de algún tipo de apoyabrazos en la silla ?",
                "¿ Usted dispone de algún tipo de apoyabrazos en la silla ?",
                "¿ La persona tiene disponible algún tipo de soporte para sus manos al momento de hacer uso del teclado?, (apoya muñecas)",
                "¿ Tiene disponible un mouse pad o almohadilla para el mouse?",
                txtsoporte.Text,
                "¿ Es posible ajustar el ángulo de inclinación?",
                "¿ Es posible ajustar la altura del teclado?",
                "¿ Es confortable la presión del teclado?",
                txtTeclado.Text,
                "¿ Es confortable la Forma y la activación de los botones del dispositivo?",
                "¿ El Mouse es operativo sin necesidad de extender el brazo hacia adelante o hacia el costado del cuerpo de la persona?",
                txtMouse.Text,
                "¿La iluminación en el área del monitor es suficiente?",
                "¿Está el monitor ubicado de tal manera que la iluminación de ventanas o lámparas no crean reflejos en la pantalla?",
                "¿Existe deslumbramiento por visión directa a la fuente de luz?",
                "¿ Se emplea algún método para evitar la luz directa de las ventanas?",
                "¿Las lámparas fundidas son sustituidas rápidamente?",
                txtIluminacion.Text,
                "¿ Se siente confortable con la temperatura del ambiente de trabajo?",
                "¿ Se siente en confort con el frío que genera el aire acondicionado?",
                "¿ Se siente cómodo con la temperatura cuando el aire no está operativo?",
                "¿ Se siente bien con la temperatura de la superficie de objetos con los que debe tener contacto durante la jornada?",
                "¿ Existen altos niveles de humedad?",
                txtTemperatura.Text,
                "¿ El equipo de trabajo está libre de vibraciones generadas por el uso del mismo?",
                "¿ ha sido eliminada cualquier fuente de vibración en el área de trabajo?",
                txtVibracion.Text,
                "¿El nivel de sonido que se genera habitualmente, permite la conversación entre sus compañeros de trabajo sin un esfuerzo significativo o molestia?",
                "¿Existe un ruido constante procedente del exterior, y sin embargo esto le permite concentrarse?",
                "¿Existe un ruido molesto y constante generado por los compañeros de trabajo, y sin embargo esto le permite concentrarse?",
                txtRuido.Text,
                "¿ La circulación de aire fresco es adecuada?",
                txtVentilacion.Text,
                "¿ Se le permite tomar descansos frecuentes?",
                "¿ Usted realiza pausas activas durante la jornada laboral?",
                "¿ los esfuerzos realizados están de acuerdo a su capacidad física?",
                "¿ los esfuerzos realizados están de acuerdo a su entrenamiento?",
                "¿ Le es posible manipular aquellos objetos que requieran ser levantados cerca del cuerpo, de manera que evite la extensión de los brazos, doblarse o girar el torso para su manipulación?",
                txtFatigaFisica.Text,
                "¿ Usted puede ver el texto en el monitor sin necesidad de inclinar la cabeza hacia atrás?",
                "¿ Los colores y el tamaño de las letras e imágenes del monitor, son fáciles de ver o leer?",
                txtVision.Text,
                "¿ Se le ha capacitado respecto a temas de Seguridad y Salud en el Trabajo?",
                "¿Se realizan simulacros de evacuación?",
                "¿La empresa cumple son las señalizaciones de rutas de evacuación?",
                "¿Conoce el plan de evacuación?",
                "¿Tiene conocimiento de cuales son los puntos de reunión después de una evacuación?",
                "¿Se capacita al personal sobre el uso correcto de los equipos?",
                "¿Conoce donde están ubicados los extintores?",
                "¿Conoce donde están ubicadas las tomas de manguera para incendio?",
                "¿Hay botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?",
                "¿Se ha conformado la brigada de emergencia?",
                txtCapInf.Text,
                "¿Se le ha informado sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?",
                "¿Está enterado de los accidentes de trabajo ocurridos en el último año?",
                "¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?",
                "¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?",
                "Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?",
                "Ante los Accidentes Laborales ¿Se realiza la investigación del evento?",
                txtDañosSalud.Text,
                "¿ Usted tiene algún tipo de control sobre el proceso de trabajo?",
                "¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?",
                "¿Se le ha entrenado para utilizar el software?",
                "¿ Existe buena comunicación con su supervisor?",
                txtAspPsico.Text,
                "¿Las instalaciones usadas para la alimentación son apropiadas?",
                "¿Se encuentran en estado óptimo de limpieza?",
                "¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?",
                "¿Los espacios sanitarios son adecuados?",
                "¿Existen filtros de agua potable en la empresa?",
                "¿Posee la empresa áreas para el descanso y la recreación?",
                "¿Existe señalización?",
                "¿En las instalaciones sanitarias se mantiene el orden y limpieza?",
                txtOtraCond.Text,
                "Sumatoria del total de respuestas"
            };

            PrintFile.PrintReporteTrabajadoresA(valores, headers, columna1, panel1, this);

            //chart
           // string base64 = rutaImg.Value;
           // byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
           // iTextSharp.text.Image grafica = iTextSharp.text.Image.GetInstance(bytes);

        }

        protected void GenerarDocumentoGeneral(object sender, EventArgs e)
        { 

            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                lbTotalSi.Text,
                lbTotalNo.Text,
                lbObservaciones.Text
            };

            string[] headers = {
                "JORNADA LABORAL",
                "INFORMACIÓN GENERAL",
                "SUPERFICIE DE TRABAJO / ESPACIO",
                "SUPERFICIE DEL ASIENTO",
                "MONITOR",
                "ESPALDAR DE LA SILLA",
                "CONDICIONES ERGONÓMICAS PARA LOS BRAZOS",
                "CONDICIONES ERGONÓMICAS PARA PIERNAS Y PIES",
                "SOPORTE PARA LOS BRAZOS Y MANOS",
                "TECLADO",
                "MOUSE",
                "ILUMINACIÓN",
                "TEMPERATURA",
                "VIBRACIÓN",
                "RUIDO (en caso de que no exista ruido significativo abstenerse de responder)",
                "VENTILACIÓN",
                "FATIGA FÍSICA",
                "VISIÓN",
                "CAPACITACIÓN E INFORMACIÓN	",
                "DAÑOS A LA SALUD",
                "ASPECTOS PSICOSOCIALES",
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
                "¿Esta constituido el COPASST en la empresa?",
                "¿El COPASST conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?",
                "¿Se reúnen de acuerdo a lo establecido en las normas?",
                "¿Se realizan exámenes médicos pre empleo, periódicos y post empleo?",
                "¿Se informa al trabajador de los resultados de los exámenes médicos?",
                " ",
                "¿La disposición del puesto de trabajo le permite trabajar sentado y alternar posturas?",
                "¿ Es el ancho de la superficie de trabajo apropiada, de manera que los accesorios o herramientas puedan ser ubicados a un fácil alcance y visualización?",
                "¿ La profundidad de la Superficie de Trabajo es la apropiada, de forma tal que el monitor y el teclado se ubican frente a usted?",
                "¿ La superficie de trabajo es confortable con respecto a sus dimensiones?",
                "¿ debajo de su escritorio el área es suficientemente amplia para acomodar sus piernas?",
                "¿El puesto de trabajo cuenta con suficiente espacio para realizar movimientos libremente?",
                "¿Existen corredores libres entre los puestos de trabajo?",
                "¿Hay objetos, muebles, equipos que dificulten la utilización del espacio libre del puesto de trabajo?",
                "¿Las piezas, documentos, objetos, herramientas, equipos u otros están dispuestos en forma organizada que facilita su utilización?",
                "¿ La Superficie de Trabajo es de material mate, para prevenir reflejos?",
                " ",
                "¿ la altura del asiento es ajustable, de tal manera que permite graduar una altura confortable de trabajo?",
                "¿ la altura superficie del asiento es apropiada, de tal manera que el ancho y la profundidad le permiten alojarse confortablemente?",
                "¿ la inclinación del asiento es ajustable?, ¿ le permite inclinarse hacia adelante o hacia atrás según su conveniencia?",
                "¿ El borde frontal del asiento es redondeado?, De manera que evite la presión sobre la parte posterior de la rodilla ? ",
                "¿ Es el asiento confortable en su totalidad?",
                " ",
                "¿ Puede ajustar fácilmente la altura del monitor?",
                "¿ Puede ajustar fácilmente la distancia horizontal de ubicación del monitor?",
                "¿ Puede ajustar fácilmente la inclinación de la pantalla del Monitor?",
                "¿ Puede ajustar fácilmente la rotación a izquierda o derecha del monitor?",
                " ",
                "¿ Puede ajustar fácilmente el espaldar para obtener un apoyo lumbar apropiado?",
                "¿ Puede ajustar la profundidad del asiento?",
                "¿ Es el espaldar de la silla confortable en su totalidad?",
                " ",
                "¿ Puede trabajar con una postura adecuada de la cabeza, de tal manera que no produzca estrés en el cuello o en los hombros?",
                "¿ Usted puede trabajar con la cabeza orientada hacia el frente del plano del pecho, de tal manera que la rotación del cuello sea mínima?",
                "¿ Puede trabajar con una posición confortable de sus brazos?",
                "¿ Puede trabajar con una posición cómoda de los codos?",
                "¿ Puede trabajar con una postura neutral de los hombros?",
                "¿ Puede trabajar con una postura neutral de las muñecas?",
                "¿ Son mínimas las actividades que requieren extensión del tronco y brazos?",
                " ",
                "¿ Puede apoyar los pies de manera confortable?",
                "¿ Al estar en posición sedente siente las rodillas en una posición confortable?",
                "¿ Esta libre de obstrucciones o puntos de presión molestos en sus piernas?",
                "¿Usted tiene un apoya pies disponible?",
                "¿Puede ajustar fácilmente la altura del apoya pies?",
                "¿Puede ajustar la inclinación del apoya pies?",
                " ",
                "¿ Usted dispone de algún tipo de apoyabrazos en la silla ?",
                "¿ Usted dispone de algún tipo de apoyabrazos en la silla ?",
                "¿ La persona tiene disponible algún tipo de soporte para sus manos al momento de hacer uso del teclado?, (apoya muñecas)",
                "¿ Tiene disponible un mouse pad o almohadilla para el mouse?",
                " ",
                "¿ Es posible ajustar el ángulo de inclinación?",
                "¿ Es posible ajustar la altura del teclado?",
                "¿ Es confortable la presión del teclado?",
                " ",
                "¿ Es confortable la Forma y la activación de los botones del dispositivo?",
                "¿ El Mouse es operativo sin necesidad de extender el brazo hacia adelante o hacia el costado del cuerpo de la persona?",
                " ",
                "¿La iluminación en el área del monitor es suficiente?",
                "¿Está el monitor ubicado de tal manera que la iluminación de ventanas o lámparas no crean reflejos en la pantalla?",
                "¿Existe deslumbramiento por visión directa a la fuente de luz?",
                "¿ Se emplea algún método para evitar la luz directa de las ventanas?",
                "¿Las lámparas fundidas son sustituidas rápidamente?",
                " ",
                "¿ Se siente confortable con la temperatura del ambiente de trabajo?",
                "¿ Se siente en confort con el frío que genera el aire acondicionado?",
                "¿ Se siente cómodo con la temperatura cuando el aire no está operativo?",
                "¿ Se siente bien con la temperatura de la superficie de objetos con los que debe tener contacto durante la jornada?",
                "¿ Existen altos niveles de humedad?",
                " ",
                "¿ El equipo de trabajo está libre de vibraciones generadas por el uso del mismo?",
                "¿ ha sido eliminada cualquier fuente de vibración en el área de trabajo?",
                " ",
                "¿El nivel de sonido que se genera habitualmente, permite la conversación entre sus compañeros de trabajo sin un esfuerzo significativo o molestia?",
                "¿Existe un ruido constante procedente del exterior, y sin embargo esto le permite concentrarse?",
                "¿Existe un ruido molesto y constante generado por los compañeros de trabajo, y sin embargo esto le permite concentrarse?",
                " ",
                "¿ La circulación de aire fresco es adecuada?",
                " ",
                "¿ Se le permite tomar descansos frecuentes?",
                "¿ Usted realiza pausas activas durante la jornada laboral?",
                "¿ los esfuerzos realizados están de acuerdo a su capacidad física?",
                "¿ los esfuerzos realizados están de acuerdo a su entrenamiento?",
                "¿ Le es posible manipular aquellos objetos que requieran ser levantados cerca del cuerpo, de manera que evite la extensión de los brazos, doblarse o girar el torso para su manipulación?",
                " ",
                "¿ Usted puede ver el texto en el monitor sin necesidad de inclinar la cabeza hacia atrás?",
                "¿ Los colores y el tamaño de las letras e imágenes del monitor, son fáciles de ver o leer?",
                " ",
                "¿ Se le ha capacitado respecto a temas de Seguridad y Salud en el Trabajo?",
                "¿Se realizan simulacros de evacuación?",
                "¿La empresa cumple son las señalizaciones de rutas de evacuación?",
                "¿Conoce el plan de evacuación?",
                "¿Tiene conocimiento de cuales son los puntos de reunión después de una evacuación?",
                "¿Se capacita al personal sobre el uso correcto de los equipos?",
                "¿Conoce donde están ubicados los extintores?",
                "¿Conoce donde están ubicadas las tomas de manguera para incendio?",
                "¿Hay botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?",
                "¿Se ha conformado la brigada de emergencia?",
                " ",
                "¿Se le ha informado sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?",
                "¿Está enterado de los accidentes de trabajo ocurridos en el último año?",
                "¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?",
                "¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?",
                "Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?",
                "Ante los Accidentes Laborales ¿Se realiza la investigación del evento?",
                " ",
                "¿ Usted tiene algún tipo de control sobre el proceso de trabajo?",
                "¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?",
                "¿Se le ha entrenado para utilizar el software?",
                "¿ Existe buena comunicación con su supervisor?",
                " ",
                "¿Las instalaciones usadas para la alimentación son apropiadas?",
                "¿Se encuentran en estado óptimo de limpieza?",
                "¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?",
                "¿Los espacios sanitarios son adecuados?",
                "¿Existen filtros de agua potable en la empresa?",
                "¿Posee la empresa áreas para el descanso y la recreación?",
                "¿Existe señalización?",
                "¿En las instalaciones sanitarias se mantiene el orden y limpieza?",
                " ",
                "Sumatoria del total de respuestas"
            };

            PrintFile.PrintReporteTrabajadoresAGeneral(valores, headers, columna1, panel1, this);
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