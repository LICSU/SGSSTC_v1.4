<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_MetIdentificacionRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_MetIdentificacionRiesgos" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="#">Metodología Para Evaluación De Riesgos</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Metodología Para La Evaluación De Riesgos</h1>
	</div>
    
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar"
                        runat="server" class="form-control" PlaceHolder="Ingrese el Area a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
                </div>
            </div>

            <br />
    </asp:PlaceHolder>

	<div class="row form-group">

		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal">
			<div class="col-md-4 col-md-offset-4">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
				</asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>

	<div class="row">

		<CKEditor:CKEditorControl Height="1000" ID="txtIdentificacionRiesgos" BasePath="~/ckeditor/" runat="server">
					<h3> Objetivo. </h3><br/>
					La valoración de los riesgos derivados de las actividades laborales es la base para el Sistema de Gestión de Seguridad y Salud en el Trabajo, 
					con la participación y compromiso de todos los niveles de la organización, es un proceso metódico donde el responsable del SG-SST debe identificar 
					los riesgos garantizando la intervención y comunicación por parte de los trabajadores acerca de los peligros asociados a su actividad laboral. 
					El objetivo es establecer una metodología que permita valorar los riesgos en las diferentes áreas de trabajo, en base a la Norma Técnica Colombiana
					NTC-45 de 2012
					<a style="opacity:1;">#NOBORRAR#</a>
					<h3>Alcance. </h3><br/>
					El presente procedimiento aplica para todas las áreas, procesos y servicios de la empresa.. 

					<h3>Procedimiento. </h3><br/>
					<ul>
						<li>Definir el instrumento para levantar la información. </li>
						<li>Clasificar los procesos y las actividades, especificando las tareas que se están realizando, su duración y frecuencia</li>
						<li>Indicar el número de personas que realizan el trabajo</li>
						<li>Identificar los procesos peligros</li>
						<li>Indicar las medidas de control existentes</li>
						<li>Evaluar el riesgo</li>
						<li>Definir los criterios para determinar la aceptabilidad del riesgo</li>
						<li>Estimar el riesgo</li>
						<li>Definir las medidas propuestas para el control de los riesgos</li>
						<li>Revisar la conveniencia del plan de acción</li>
					</ul>
					
					<ul>
						<li>
							<strong>1. Instrumento para recolectar información</strong><br />
							la siguiente matriz se empleará como herramienta para señalar de forma sistemática 
							la información proveniente del proceso de la identificación de los peligros.<br />
							<!--
							<table>
								<thead>
									<tr>
										<th colspan="31" style="background-color:aqua;" >INFORMACIÓN GENERAL DE LA EMPRESA</th>
									</tr>
									<tr>
										<th colspan="5">Nombre de la empresa: </th>
										<th colspan="9">&nbsp;</th>
										<th colspan="3">NIT: </th>
										<th colspan="10">Dirección: </th>
										<th colspan="2">Ciudad: </th>
										<th colspan="2">Departamento: </th>
									</tr>
									<tr>
										<th colspan="31" style="background-color:aqua;" >INFORMACIÓN DEL PANORAMA GENERAL DE RIESGOS</th>
									</tr>
									<tr>
										<th colspan="9">Nombre del área: </th>
										<th colspan="7">Responsable del SGSST: </th>
										<th colspan="6">Actividad Económica: </th>
										<th colspan="3">No Trabajadores</th>
										<th colspan="4">Fecha última evaluación: </th>
										<th colspan="2">Fecha: </th>
									</tr>
									<tr>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
										<th style="background-color:aqua;"><span>Proceso</span></th>
									</tr>
								</thead>
							</table>
							-->
							Se debe realizar una lista de los procesos de trabajo y de  las actividades  
							rutinarias y no rutinarias que lo componen;  reuniendo la información necesaria 
							para diligenciar  la matriz de evaluación de riesgo, tales como:
							<ul>
								<li>
									<strong>Proceso: </strong>Se entenderá como el proceso de la organización 
									al que pertenece las actividades descritas, es el conjunto de actividades 
									mutuamente relacionadas o que interactúan, Ejemplo: Proceso de Fundición.
								</li>
								<li>
									<strong>Zona/Lugar: </strong>Ubicación geográfica dentro de las instalaciones
								</li>
								<li>
									<strong>Actividad: </strong>Conjunto de tareas que se realizan para lograr un 
									resultado, la misma está asociada a la labor que realiza un cargo en un área específica, 
									ejemplo: actividades de cargar el horno de fundición.
								</li>
								<li>
									<strong>Tarea: </strong>Es una acción humana que consume tiempo y recursos, 
									y conduce a lograr un resultado concreto en un plazo determinado. 
									Un ejemplo de tarea en la actividad “transporte de escombros”
								</li>
								<li>
									<strong>Rutinaria (Si/No): </strong>Una actividad es rutinaria si forma parte 
									de la operación normal de la organización.
								</li>
								<li>
									<strong>Descripción y clasificación de los peligros: </strong>La identificación de los peligros 
									debe realizarse mediante observación directa en el área, con la participación de los trabajadores, 
									a continuación se definen los peligros más comunes en las diferentes actividades económicas, tomaremos 
									como base los peligros señalados en la tabla de peligros tomada como referencia la Norma Técnica Colombiana NTC-45 de 2012
									<br />
									<br />
									<table >
										<tr>
											<td colspan="8" style="text-align:center; background-color:#308194; color:#FFF;">CLASIFICACIÓN DE PELIGROS</td>
										</tr>
										<tr>
											<td rowspan="10" style="background-color:#308194; color:#FFF;" >DESCRIPCIÓN</td>
										</tr>
										<tr style="background-color:#308194; color:#FFF;">
											<td  style="text-align:center;">Biológico</td>
											<td  style="text-align:center;">Físico </td>
											<td  style="text-align:center;">Químico</td>
											<td  style="text-align:center;">Psicosocial</td>
											<td  style="text-align:center;">Biomecánicos</td>
											<td  style="text-align:center;">Condiciones de seguridad</td>
											<td  style="text-align:center;">Fenómenos naturales*</td>
										</tr>
										<tr>
											<td>Virus</td>
											<td>Ruido (de impacto, intermitente o continuo)</td>
											<td>Polvos orgánicos inorgánicos</td>
											<td>
												Gestión organizacional (estilo de mando, pago, contratación, participación, 
												inducción y capacitación, bienestar social, evaluación del desempeño, manejo de cambios).
											</td>
											<td>
												Postura (prolongada, mantenida, forzada, anti gravitacional).
											</td>
											<td>
												Mecánico (elementos o partes de máquinas, herramientas, equipos, piezas a trabajar, materiales proyectados solidos o fluidos).
											</td>
											<td>Sismo</td>
										</tr>
										<tr>
											<td>Bacterias</td>
											<td>Iluminación (luz visible por exceso o deficiencia)</td>
											<td>Fibras</td>
											<td>
												Características de la organización del trabajo (comunicación, tecnología, organización del trabajo, 
												demandas cualitativas y cuantitativas de la labor).
											</td>
											<td>
												Esfuerzo
											</td>
											<td>
												Eléctrico (alta y baja tensión, estática)
											</td>
											<td>Terremoto</td>
										</tr>
										<tr>
											<td>Hongos</td>
											<td>Vibración (cuerpo entero, segmentaria)</td>
											<td>Líquidos (nieblas y rocíos)</td>
											<td>
												Características del grupo social de trabajo (relaciones, cohesión, calidad de interacciones, 
												trabajo en equipo).
											</td>
											<td>
												Movimiento repetitivo
											</td>
											<td>
												Locativo (sistemas y medios de almacenamiento) superficies de trabajo (irregulares, deslizantes, 
												con diferencia del nivel) condiciones de orden y aseo (caídas de objeto)
											</td>
											<td>Vendaval</td>
										</tr>
										<tr>
											<td>Ricketsias</td>
											<td>Temperaturas extremas (calor y frio)</td>
											<td>Gases y vapores</td>
											<td>
												Condiciones de la tarea (carga mental, contenidos de la tarea, demandas emocionales, sistema de control, 
												definición de roles, monotonía, etc.).
											</td>
											<td>
												Manipulación manual de cargas
											</td>
											<td>
												Tecnológico (explosión, fuga, derrame, incendio).
											</td>
											<td>Inundación</td>
										</tr>
										<tr>
											<td>Parásitos</td>
											<td>Presión atmosférica (normal y ajustada)</td>
											<td>Humos metálicos no metálicos</td>
											<td>
												Interface persona-tarea (conocimientos, habilidades en relación con la demanda de la tarea, iniciativa, autonomía y reconocimiento, 
												identificación de la persona con la tarea y la organización).
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												Accidentes de tránsito
											</td>
											<td>Derrumbe</td>
										</tr>
										<tr>
											<td>Picaduras</td>
											<td>Radiaciones ionizantes (rayos X, gama, beta y alfa)</td>
											<td>Material particulado</td>
											<td>
												Jornada de trabajo (pausas, trabajo nocturno, rotación, horas extras, descansos)
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												Público (robos, asaltos, atracos, atentados, de orden público, etc.).
											</td>
											<td>Precipitaciones (lluvias, granizadas, heladas).</td>
										</tr>
										<tr>
											<td>Mordeduras</td>
											<td>Radiaciones no ionizantes (láser, ultravioleta, infrarroja, radiofrecuencia, microondas)</td>
											<td>&nbsp;</td>
											<td>
												&nbsp;
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												Trabajo en alturas
											</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Fluidos o excrementos</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												&nbsp;
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												Espacios confinados
											</td>
											<td>&nbsp;</td>
										</tr>
									</table>
									<br />
									<!-- TABLA Clasificacion de peligros -->
								</li>
								<li>
									<strong>Identificar los controles existentes: </strong><br />
									Mediante la comunicación entre la gerencia y los empleados es posible identificar, 
									evaluar e implementar los controles requeridos para mitigar o controlar los factores de riesgo, para el diligenciamiento de la matriz de 
									riesgos  se deben identificar los controles existentes para cada uno de los peligros, clasificándolos de la siguiente manera:
									<ul>
										<li>
											<strong>Control en la fuente:</strong> Consiste en la modificación física de las características del puesto de trabajo, 
											incluyendo acciones como modificar el puesto de trabajo, uso de diferentes equipos, corregir la falla o avería en el material 
											o estructura.
										</li>
										<li>
											<strong>Control en el medio: </strong>si no es posible controlar el factor de riesgo en la fuente, se debe impedir que el riesgo 
											se propague en el medio aplicando métodos como encerrar el área donde se genere el riesgo, aislando la fuente, variando las 
											condiciones ambientales (Ventilación, iluminación, temperatura, humedad).
										</li>
										<li>
											<strong>Control en el individuo: </strong>son las medidas de control que se aplican en las personas, como limitación del tiempo de 
											exposición al riesgo y uso de elementos de protección personal.
										</li>
									</ul>
								</li>
								<li>
									<strong>Evaluación de Riesgos</strong>
									La evaluación de los riesgos corresponde al proceso de determinar la probabilidad de que ocurran eventos específicos, considerando la eficacia
									de los controles implementados, la probabilidad de que ocurran eventos no deseados y la magnitud de su consecuencia
									Para realizar la evaluación de los riesgos se debe determinar el nivel de deficiencia (asociado a los controles existentes), el nivel de exposición, 
									el nivel de probabilidad y el nivel de consecuencia, como se muestra a continuación:<br />
									<ul>
										<li>
											<strong>8.1 Nivel de deficiencia (ND)</strong>
											Es la magnitud de la eficacia de las medidas preventivas existentes en el lugar de trabajo. Para determinar el nivel de deficiencia  se 
											tomarán las siguientes referencias:
											<br />
											<h3 class="text-center"> DETERMINACIÓN DEL  NIVEL DE DEFICIENCIA DE LOS PELIGROS HIGIÉNICOS </h3>
											<strong><u>ILUMINACIÓN</u></strong><br />
											<strong>Muy Alto: </strong>Ausencia de luz natural o artificial. <br />
											<strong>Alto: </strong>Deficiencia de luz natural o artificial con sombras evidentes y dificultad para leer.<br />
											<strong>Medio: </strong>Percepción de algunas sombras al ejecutar una actividad (escribir).<br />
											<strong>Bajo: </strong>Ausencia de sombras. <br /><br />

											<strong><u>RUIDO</u></strong><br />
											<strong>Muy Alto: </strong>No escuchar una conversación a tono normal a una distancia menos de 50 cm. <br />
											<strong>Alto: </strong>Escuchar la conversación a una distancia de 1 metro en tono normal. <br />
											<strong>Medio: </strong>Escuchar la conversación a una distancia de 2 metros  en tono normal.<br />
											<strong>Bajo: </strong>No hay dificultad para escuchar una conversación a tono normal a más de 2 metros. <br /><br />

											<strong><u>RADIACIONES IONIZANTES</u></strong><br />
											<strong>Muy Alto: </strong>Exposición frecuente (Una o más veces  por jornada o turno) <br />
											<strong>Alto: </strong>Exposición regular (una o más veces en la semana)<br />
											<strong>Medio: </strong>Ocasionalmente y/o vecindad. <br />
											<strong>Bajo: </strong>Rara vez, casi nunca sucede la exposición. <br /><br />

											<strong><u>RADIACIONES NO IONIZANTES</u></strong><br />
											<strong>Muy Alto: </strong>Ocho horas (8) o más de exposición por jornada o turno.<br />
											<strong>Alto: </strong>Entre seis (6) horas y ocho (8) horas  por jornada o turno.<br />
											<strong>Medio: </strong>Entre dos (2) y seis (6) horas por jornada o turno. <br />
											<strong>Bajo: </strong>Menos de dos (2) horas por jornada o turno.<br /><br />

											<strong><u>TEMPERATURAS EXTREMAS</u></strong><br />
											<strong>Muy alto: </strong>Percepción subjetiva de calor o frío en forma inmediata en el sitio<br />
											<strong>Alto: </strong>Percepción subjetiva de calor o frío luego de permanecer 5 minutos en el sitio. <br />
											<strong>Medio: </strong>Percepción de algún Disconfort con la temperatura luego de permanecer 15 minutos.<br />
											<strong>Bajo: </strong>Sensación de confort térmico. <br /><br />
  
											<strong><u>AGENTES BIOLÓGICOS  </u></strong><br />
											<strong>Muy Alto: </strong>Provocan una enfermedad grave y constituye un serio peligro para los trabajadores. Su riesgo de propagación es elevado y no se conoce tratamiento eficaz en la actualidad.<br />
											<strong>Alto: </strong>Pueden provocar una enfermedad grave y constituir un serio peligro para los trabajadores. Su riesgo de propagación es probable y generalmente existe tratamiento eficaz.<br />
											<strong>Medio: </strong>Pueden causar una enfermedad y constituir un peligro para los trabajadores. Su riesgo de propagación es poco probable y generalmente existe tratamiento eficaz.<br />
											<strong>Bajo: </strong>Poco probable que cause una enfermedad. No hay riesgo de propagación y no se necesita tratamiento.<br /><br />

											<strong><u>BIOMECÁNICO - POSTURA </u></strong><br />
											<strong>Muy Alto: </strong>Postura con un riesgo extremo de lesión musculo esquelética. Deben tomarse medidas correctivas inmediatamente.<br />
											<strong>Alto: </strong>Posturas de trabajo con riesgo probable de lesión. Se deben modificar las condiciones de trabajo tan pronto como sea posible. <br />
											<strong>Medio: </strong>Posturas con riesgo moderado de lesión musculo esquelética sobre las que se precisa una modificación, aunque no inmediata.<br />
											<strong>Bajo: </strong>Posturas que se consideran normales, sin riesgo de lesiones musculo esqueléticas, y en las que no es necesaria ninguna acción.<br /><br />

											<strong><u>BIOMECÁNICO – MOVIMIENTOS REPETITIVOS</u></strong><br />
											<strong>Muy Alto: </strong>Actividad que exige movimientos rápidos y continuos de los miembros superiores, a un ritmo difícil de mantener (ciclos de trabajo menores a 30s ó 1min, o concentración de movimientos que utiliza pocos músculos durante más del 50% del tiempo de trabajo).<br />
											<strong>Alto: </strong>Actividad que exige movimientos rápidos y continuos de los miembros superiores, con la posibilidad de realizar pausas ocasionales (ciclos de trabajo menores a 30s ó 1min, o concentración de movimientos que utiliza pocos músculos durante más del 50% del tiempo de trabajo).<br />
											<strong>Medio: </strong>Actividad que exige movimientos lentos y continuos de los miembros superiores, con la posibilidad de realizar pausas cortas.<br />
											<strong>Bajo: </strong>Actividad que no exige el uso de los miembros superiores, o es breve y entrecortada por largos periodos de pausa.<br /><br />

											<strong><u>BIOMECÁNICO- ESFUERZO</u></strong><br />
											<strong>Muy alto: </strong>Actividad intensa en donde el esfuerzo es visible en la expresión facial del trabajador y/o la contracción muscular es visible.<br />
											<strong>Alto: </strong>Actividad pesada, con resistencia. <br />
											<strong>Medio: </strong>Actividad con esfuerzo moderado. <br />
											<strong>Bajo: </strong>No hay esfuerzo aparente, ni resistencia y existe libertad de movimientos.<br /><br />

											<strong><u>BIOMECÁNICO- MANIPULACIÓN MANUAL DE CARGAS</u></strong>
											<strong>Muy alto: </strong>Manipulación manual de cargas con un riesgo extremo de lesión musculo esquelética. Deben tomarse medidas correctivas inmediatamente.<br />
											<strong>Alto: </strong>Manipulación manual de cargas con riesgo probable de lesión. Se deben modificar las condiciones de trabajo tan pronto como sea posible.<br />
											<strong>Medio: </strong>Manipulación manual de cargas con riesgo moderado de lesión musculo esquelética sobre las que se precisa una modificación, aunque no inmediata. <br />
											<strong>Bajo: </strong>No se manipulan cargas o si se realiza, no se evidencian riesgos de lesiones musculo esqueléticas. No es necesaria ninguna acción.<br /><br />

											<table>
												<thead>
													<tr>
														<th colspan="3" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">DETERMINACIÓN DEL NIVEL DE DEFICIENCIA</th>
													</tr>
													<tr>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Nivel de deficiencia ND</th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Valor de ND</th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">SIGNIFICADO</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Muy alto (MA) </td>
														<td>10</td>
														<td>Se ha(n) detectado peligro(s) que determina(n) como posible la generación de incidentes, 
															o la eficacia del conjunto de medidas preventivas existentes 
															respecto al riesgo es nula no existe, o ambos
														</td>
													</tr>
													<tr>
														<td>Alto (A) </td>
														<td>6</td>
														<td>Se ha(n) detectado algún(os) peligro(s) que puede(n) dar lugar a consecuencias significativa(s) 
															o la eficacia del conjunto de medidas preventivas existentes es baja, o ambos
														</td>
													</tr>
													<tr>
														<td>Medio (M) </td>
														<td>2</td>
														<td>Se han detectado peligros que pueden dar lugar a consecuencias poco significativas o de menor importancia, 
															o la eficacia del conjunto de medidas preventivas existentes es moderada, o ambos.
														</td>
													</tr>
													<tr>
														<td>Bajo (B) </td>
														<td>No se asigna valor</td>
														<td>No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, 
															o ambos. El riesgo está controlado.
														</td>
													</tr>
												</tbody>
											</table><br />
										</li>
										<li>
											<strong>8.2	Nivel de exposición (NE)</strong><br />
											Es una medida de la frecuencia con la que se presenta la exposición a un factor de riesgo determinado, el nivel de exposición se puede estimar en función del 
											tiempo de permanencia en el área de trabajo y se determina aplicando la siguiente tabla:<br />
											<table>
												<thead>
													<tr>
														<th colspan="3" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">TABLA III. DETERMINACIÓN DEL NIVEL DE EXPOSICIÓN</th>
													</tr>
													<tr>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Nivel de exposición</th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Valor de NE</th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">SIGNIFICADO</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Continua</td>
														<td>4</td>
														<td>La situación de exposición se presenta sin interrupción o varias veces con tiempo prolongado durante la jornada laboral.</td>
													</tr>
													<tr>
														<td>Frecuente </td>
														<td>3</td>
														<td>La situación de exposición se presenta varias veces durante la jornada laboral por tiempos cortos.</td>
													</tr>
													<tr>
														<td>Ocasional </td>
														<td>2</td>
														<td>La situación de exposición se presenta alguna vez durante la jornada laboral y por un periodo de tiempo corto.</td>
													</tr>
													<tr>
														<td>Esporádica </td>
														<td>1</td>
														<td>La situación de exposición se presenta de manera eventual.</td>
													</tr>
												</tbody>
											</table><br />
										</li>
										<li>
											<strong>8.3	Nivel de probabilidad (NP)</strong><br />
											Estimación de que realmente el factor de riesgo origine las consecuencias no deseadas, 
											para esto se debe multiplicar el nivel de deficiencia (ND) por el nivel de exposición (NE): NP= ND x NE.<br />
											<table>
												<thead>
													<tr>
														<th colspan="6" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">DETERMINACIÓN DEL NIVEL DE PROBABILIDAD</th>
													</tr>
													<tr>
														<th colspan="2" rowspan="2" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Niveles de probabilidad</th>
														<th colspan="4" style="text-align:center;">Nivel de exposición (NE)</th>
													</tr>
													<tr>
														<th>4</th>
														<th>3</th>
														<th>2</th>
														<th>1</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td rowspan="3">Nivel de deficiencia (ND)</td>
														<td>10</td>
														<td style="background-color:red;">MA - 40</td>
														<td style="background-color:red;">MA - 30</td>
														<td style="background-color:yellow;">A - 20</td>
														<td style="background-color:yellow;">A - 10</td>
													</tr>
													<tr>
														<td>6</td>
														<td style="background-color:red;">MA - 24</td>
														<td style="background-color:yellow;">A - 18</td>
														<td style="background-color:yellow;">A - 12</td>
														<td style="background-color:#92D050;">M - 6</td>
													</tr>
													<tr>
														<td>2</td>
														<td style="background-color:#92D050;">M - 8</td>
														<td style="background-color:#92D050;">M - 6</td>
														<td style="background-color:#00FF00;">B - 4</td>
														<td style="background-color:#00FF00;">B - 2</td>
													</tr>
												</tbody>
											</table><br />
											<table>
												<thead>
													<tr>
														<th colspan="3" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">SIGNIFICADO DE LOS DIFERENTES NIVELES DE PROBABILIDAD</th>
													</tr>
													<tr>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Nivel de probabilidad</th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Valor de NP </th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">INTERPRETACIÓN</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="background-color:red;">Muy alto (MA) </td>
														<td>Entre 40 y 24</td>
														<td>
															Situación deficiente con exposición continua.
															Normalmente la materialización del riesgo ocurre con frecuencia
														</td>
													</tr>
													<tr>
														<td style="background-color:yellow;">Alto (A) </td>
														<td>Entre 20 y 10</td>
														<td>
															Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional 
															o esporádica.<br />
															La materialización del riesgo es posible que suceda varias veces durante la vida laboral 
														</td>
													</tr>
													<tr>
														<td style="background-color:#92D050;">Medio (M) </td>
														<td>Entre 8 y 6</td>
														<td>Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. 
															Es posible que suceda el daño alguna vez
														</td>
													</tr>
													<tr>
														<td style="background-color:#00FF00;">Bajo (B) </td>
														<td>Entre 4 y 2</td>
														<td>
															Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier 
															nivel de exposición.<br />
															No es esperable que se materialice el riesgo, aunque puede ser concebible.
														</td>
													</tr>
												</tbody>
											</table><br />
										</li>
										 <li>
											<strong>8.4	Nivel de consecuencia (NC)</strong><br />
											Para evaluar el nivel de consecuencia se debe tener en cuenta el resultado directo más grave que se pueda presentar en la actividad  
											de acuerdo a las medidas de control implementadas. Finalmente, se debe clasificar la consecuencia determinada dentro de los cuatro  
											niveles propuestos:<br />
											<table>
												<thead>
													<tr>
														<th colspan="4" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">DETERMINACIÓN DEL NIVEL DE CONSECUENCIAS</th>
													</tr>
													<tr>
														<th rowspan="2" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Nivel de consecuencia</th>
														<th rowspan="2" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">NC</th>
														<th colspan="2" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">SIGNIFICADO</th>
													</tr>
													<tr>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Daños personales</th>
														<th style="background-color:#538DD5; color:#FFFFFF; text-align:center;">Enfermedades</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Mortal o catastrófico (M)</td>
														<td>100</td>
														<td>Muerte(s)</td>
														<td>Patología irreversible a largo plazo (Cáncer,  esterilidad…)</td>
													</tr>
													<tr>
														<td>Muy grave (MG)</td>
														<td>60</td>
														<td>Lesiones o enfermedades graves irreparables (incapacidad permanente, parcial o invalidez).</td>
														<td>Patología no mejorable con cese de la exposición  al riesgo</td>
													</tr>
													<tr>
														<td>Grave (G) </td>
														<td>25</td>
														<td>Lesiones o enfermedades con incapacidad laboral temporal (ILT).</td>
														<td>Patologías tratables Ceden con tratamiento médico </td>
													</tr>
													<tr>
														<td>Leve (L) </td>
														<td>10</td>
														<td>Lesiones o enfermedades que no requieren incapacidad.</td>
														<td>Molestias</td>
													</tr>
												</tbody>
											</table><br />
										</li>
										 <li>
											<strong>8.5	Nivel de riesgo (NR)</strong><br />
											El nivel de riesgo (NR) está en función del nivel de probabilidad (NP) y del nivel de consecuencias (NC) y se  expresa como: <strong>NR = NP x NC</strong>,  
											en las siguiente tabla se indican los valores del nivel de riesgo al combinar el Nivel de consecuencia con el Nivel de probabilidad.<br />
											<table>
												<thead>
													<tr>
														<th colspan="6" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">DETERMINACIÓN DEL NIVEL DE RIESGO</th>
													</tr>
													<tr>
														<th colspan="2" rowspan="2">Nivel de riesgo NR = NP X NC</th>
														<th colspan="4"  style="text-align:center;">Nivel de probabilidad (NP)</th>
													</tr>
													<tr>
														<th>40 - 24</th>
														<th>20 - 10</th>
														<th>8 - 6</th>
														<th>4 - 2</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td rowspan="4">
															Nivel de Consecuencias (NC)
														</td>
														<td>100</td>
														<td style="background-color:red;">I<br />4000 - 2400</td>
														<td style="background-color:red;">I<br />2000 - 1000</td>
														<td style="background-color:red;">I<br />800 - 600</td>
														<td style="background-color:yellow;">II<br />400 - 200</td>
													</tr>
													<tr>
														<td>60</td>
														<td style="background-color:red;">I<br />2400 - 1440</td>
														<td style="background-color:red;">I<br />1200 - 600</td>
														<td style="background-color:yellow;">II<br />480 - 360</td>
														<td style="background-color:yellow;">II 240<br /><span style="background-color:#00FF00;">III 120</span></td>
													</tr>
													<tr>
														<td>25</td>
														<td style="background-color:red;">I<br />1000 - 600</td>
														<td style="background-color:yellow;">II<br />500 - 250</td>
														<td style="background-color:yellow;">II<br />200 - 150</td>
														<td style="background-color:#00FF00;">III<br />100 - 50</td>
													</tr>
													<tr>
														<td>10</td>
														<td style="background-color:yellow;">II<br />400 - 240</td>
														<td style="background-color:yellow;">II 200<br /><span style="background-color:#00FF00;">III 100</span></td>
														<td style="background-color:#00FF00;">III<br />80 - 60</td>
														<td style="background-color:#00FF00;">III 40<br />IV 20</td>
													</tr>
												</tbody>
											</table><br />
											<table>
												<thead>
													<tr>
														<th colspan="3" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">SIGNIFICADO DEL NIVEL DE RIESGO</th>
													</tr>
													<tr  style="text-align:center;">
														<th>Nivel de riesgo</th>
														<th>Valor de NR</th>
														<th>SIGNIFICADO</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>I</td>
														<td style="background-color:red;">4000 - 600</td>
														<td>Situación crítica. Suspender actividades hasta que el riesgo este bajo control. Intervención Urgente.</td>
													</tr>
													<tr>
														<td>II </td>
														<td style="background-color:yellow;">500 - 150</td>
														<td>Corregir y adoptar medidas de control de inmediato. Sin embargo, suspenda actividades si el nivel
															de riesgo esta por encima o igual de 360.</td>
													</tr>
													<tr>
														<td>III </td>
														<td style="background-color:#00FF00;">120 - 40</td>
														<td>Mejorar si es posible. Seria conveniente justificar la intervención y su rentabilidad.</td>
													</tr>
													<tr>
														<td>IV </td>
														<td>20</td>
														<td>Mantener las medidas de control existentes, pero se deberian considerar soluciones o mejoras y 
															se deben hacer comprobaciones periódicas para asegurar que el riesgo es aún aceptable.</td>
													</tr>
												</tbody>
											</table><br />
											<table>
												<thead>
													<tr>
														<th colspan="2"  style="background-color:#538DD5; color:#FFFFFF; text-align:center;">TABLA DE ACEPTABILIDAD DEL RIESGO</th>
													</tr>
													<tr style="text-align:center;">
														<th>NIVEL DE RIESGO</th>
														<th>SIGNIFICADO</th>
													</tr>
												</thead>
												<tbody>
													<tr style="background-color:red;">
														<td>I</td>
														<td>No aceptable</td>
													</tr>
													<tr style="background-color:yellow;">
														<td>II </td>
														<td>No aceptable o aceptable con control  especifico</td>
													</tr>
													<tr style="background-color:#00FF00;">
														<td>III </td>
														<td>Aceptable</td>
													</tr>
													<tr>
														<td>IV </td>
														<td>Aceptable Controlado</td>
													</tr>
												</tbody>
											</table>
										</li>
									</ul>
								</li>
							</ul>   
						</li>
					</ul>
		</CKEditor:CKEditorControl>

	</div>

	<br />

	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<asp:Button ID="btnPrint" runat="server" CssClass="btn btn-success"
				OnClick="GenerarDocumento" Text="Generar Documento" ValidationGroup="ValidationAdd" />
		</div>

		<div class="col-md-4">
			<asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary"
				OnClick="btnGuardar_Click" Text="Guardar y/o Actualizar Datos" ValidationGroup="ValidationAdd" />
		</div>

	</div>


</asp:Content>
