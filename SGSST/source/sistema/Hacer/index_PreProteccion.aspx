<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PreProteccion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PreProteccion" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="#">Procedimientos de Investigación de accidentes e incidentes</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Procedimientos de Investigación de accidentes e incidentes</h1>
    </div>
    <br />

    <div class="row">
        <CKEditor:CKEditorControl ID="txtProcedimientos" BasePath="/ckeditor/" runat="server">
            <h3><strong>Meta</strong></h3>
            <br />
            Describir la metodología adoptada por la organización para llevar a cabo la investigación, análisis, medidas correctivas de los incidentes, 
            accidentes de trabajo y enfermedades laborales ocurridos en la Empresa, por medio del equipo investigador de accidentes.</p>
            <br />
            <h3><strong>Responsabilidad</strong></h3>
            <br />
            El empleador o contratante debe investigar todos los accidentes e incidentes de los trabajadores, incluyendo los vinculados a través de contrato de prestación de 
            servicio, dentro de los quince (15) días calendario siguientes a su ocurrencia, en caso de accidente grave o mortal se deberá remitir la investigación a la 
            Administradora de Riesgos Laborales dentro del mismo lapso de tiempo establecido.
            <br />
            Esta investigación debe realizarse a través del equipo investigador, el cual estará conformado por:
            <ul>
                <li>El jefe inmediato o supervisor del trabajador accidentado o del área donde ocurrió el accidente.</li>
                <li>Un representante del Comité Paritario o el Vigía de Seguridad y Salud en el Trabajo.</li>
                <li>El responsable del Sistema de Gestión de Seguridad y Salud en el Trabajo</li>
            </ul>

            <h3><strong>Funciones del Equipo Investigador</strong></h3>
            <br />
            <ul>
                <li>Investigar los incidentes y accidentes de trabajo, dentro de los 15 días siguientes a la ocurrencia del evento.</li>
                <li>Recopilar testimonios de quienes presenciaron el accidente, al igual que del accidentado, es importante tomar esta información incluyendo fotografías del lugar donde ocurrieron los hechos.</li>
                <li>Determinar las causas inmediatas (actos y condiciones sub estándar) y causas básicas (factores del trabajo y personales)</li>
                <li>Establecer medidas correctivas que prevengan la recurrencia del accidente, elaborar el plan de acción, coordinar su ejecución y realizar el seguimiento correspondiente.</li>
                <li>Preparar el informe de la investigación.</li>
            </ul>

            <br />
            Cuando el accidente se considere gravé o produzca la muerte, en la investigación deberá participar un profesional con Licencia en Seguridad y Salud en el Trabajo, propio o contratado.
            <br />
            Los resultados entregados por la investigación deben concretar medidas de intervención que apunten a los correctivos necesarios y a la mejora continua del Sistema de Gestión de Seguridad y Salud en el Trabajo, estas comprenden acciones de prevención y control de peligros y riesgos presentes en el evento del incidente, accidente de trabajo o de la  enfermedad laboral.
            <br />
            <h3><strong>Explicación del plan</strong></h3>
            <br />
            La investigación de accidentes, incidentes y enfermedades laborales permite obtener información útil en el establecimiento de medidas destinadas a la prevención de accidentes similares o de otra naturaleza ya sea en el lugar donde ocurrió el accidente o en otro puesto de trabajo con procesos afines. Esto se logra determinando las causas de los accidentes, buscando elementos y fuentes que originaron la ocurrencia del mismo; analizando los factores del accidente e implementando medidas correctivas; creando material educativo que oriente al personal para formar una cultura de conciencia de seguridad y aplicar métodos seguros de trabajo.
            <br />
            El equipo investigador deberá presentar un informe detallado, donde se describa la metodología de búsqueda de información; el desarrollo de los acontecimientos antes, durante y después del accidente, el análisis de la información, la evaluación de las causas que dieron origen al suceso y las medidas que se debe adoptar para evitar la reincidencia.
            <br />
            Considerando que no es posible predecir ni la ocurrencia ni el resultado de los accidentes, se parte del principio que todos pudieran potencialmente generar consecuencias graves,  por lo tanto se debe dar la misma importancia a cualquier accidente independientemente de la gravedad de la lesión, siendo necesario iniciar inmediatamente después de ocurrido el accidente, un proceso de investigación con la finalidad de estudiar las condiciones bajo las cuales se presentó para determinar las causas que intervinieron en la ocurrencia del mismo, durante el desarrollo de la investigación se debe tener en cuenta lo siguiente:
            <br />
            <ul>
                <li>El objetivo de la investigación es reunir datos y evidencias para reconstruir los hechos y determinar las causas que ocasionaron el accidente o incidente. </li>
                <li>En ningún caso se debe asignar la investigación para efectos de asignar culpables, esto trae como consecuencia resultados subjetivos por situaciones de encubrimiento.</li>
                <li>El investigador debe emplear un criterio objetivo al analizar la situación.</li>
                <li>Se deben realizar entrevistas individuales a los testigos con el fin de detectar alteraciones de la información.</li>
                <li>Las actividades de investigación se deben orientar a identificar y evaluar las condiciones en las que ocurrió el accidente y los daños que ocasionó</li>
                <li>El fin de la investigación de los accidentes e incidentes es encontrar medidas de corrección para evitar la reincidencia, tomando en cuenta que el costo de la medida no debe ser un factor que impida su implantación y que ésta debe garantizar la integridad física y psicológica del trabajador.</li>
            </ul>
            <br />
            <h3><strong>Diagrama de Flujo para la investigación de accidentes de trabajo</strong> </h3>
            <img src="../../../ico/diagrama_accidentes.png" />
            <br />
            <h3><strong>Metodología para el análisis de causas</strong> </h3>
            En la investigación de accidentes se registrarán las causas mediante la metodología de Ishikawa o espina de pescado, procedimiento mediante el cual se representa gráficamente las relaciones múltiples de causa–efecto, Esta clasificación es la más ampliamente difundida y se emplea preferiblemente para analizar problemas de procesos; identificando los cuatros aspectos que intervienen en el trabajo, como son: materiales, maquinaria, mano de obra, métodos y medio ambiente.<br />
            <h3><strong>Causas debidas a la materia prima</strong> </h3>
            Se tienen en cuenta las causas que generan el problema desde el punto de vista de las materias primas empleadas para la elaboración de un producto. Por ejemplo: causas debidas a la variación del contenido mineral, pH, tipo de materia prima, proveedor, empaque, transporte etc. Estos factores causales pueden hacer que se presente con mayor severidad una falla en un equipo.<br />
            <h3><strong>Causas debidas a los equipos</strong> </h3>
            En esta clase de causas se agrupan aquellas relacionadas con el proceso de transformación de las materias primas como las máquinas y herramientas empleadas, efecto de las acciones de mantenimiento, obsolescencia de los equipos, cantidad de herramientas, distribución física de estos, problemas de operación, eficiencia, etc.<br />
            <h3><strong>Causas debidas al método</strong> </h3>
            Se registran en esta espina las causas relacionadas con la forma de operar el equipo y el método de trabajo. Son numerosas las averías producidas por estrelladas de los equipos, deficiente operación e incumplimiento de los estándares de capacidades máximas.<br />
            <h3><strong>Causas debidas al factor humano</strong> </h3>
            En este grupo se incluyen los factores que pueden generar el problema desde el punto de vista del factor humano. Por ejemplo, falta de experiencia del personal, salario, grado de entrenamiento, creatividad, motivación, pericia, habilidad, estado de ánimo, etc.<br />
            <h3><strong>Causas debidas al medio ambiente.</strong> </h3>
            Se incluyen en este grupo aquellas causas que pueden venir de factores externos como contaminación, temperatura del medio ambiente, altura de la ciudad, humedad, ambiente laboral, etc.<br />
        </CKEditor:CKEditorControl>
    </div>

    <div class="row text-center">

        <div class="col-md-4 col-md-offset-2">
            <asp:ImageButton alt="-" ID="btnSave" runat="server" ImageUrl="~\ico\agregar.png" />
            <h4>Guardar y/o Actualizar</h4>
        </div>

        <div class="col-md-4">
            <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                OnClick="GenerarDocumento" />
            <h4>Generar Documento</h4>
        </div>
    </div>

</asp:Content>
