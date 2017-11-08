<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_BrigadaEmergencias.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_BrigadaEmergencias" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35"	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="#">Brigadas de Emergencia</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Brigadas de Emergencia</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>
     <asp:TextBox ID="txtBuscar" runat="server" Visible="false"></asp:TextBox>
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

	<asp:PlaceHolder runat="server" ID="chEditor" Visible="false">
		<div class="panel-group" id="accordion">

			<!-- Primer Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">ESTRUCTURA INTERNA DE LA BRIGADA DE EMERGENCIAS</a></h4>
				</div>

				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<h3 class="box-title">Perfil del Jefe de Brigada y Perfil de Los Brigadistas</h3>
						<CKEditor:CKEditorControl ID="txtPerfiles" BasePath="/ckeditor/" runat="server">
									<h3>Perfil del Jefe de Brigada</h3>
									<ul>
										<li><h3>Capacidad técnica en los campos de la prevención , protección y atención de emergencias</h3></li>
										<li><h3>Pericia como entrenador</h3></li>
										<li><h3>Habilidad para dirigir actividades</h3></li>
										<li><h3>Liderazgo y don de mando</h3></li>
										<li><h3>Planear la organización de la brigada</h3></li>
										<li><h3>Trazar planes de acción</h3></li>
										<li><h3>Proveer lo conveniente para el entrenamiento y capacitación</h3></li>
										<li><h3>Asignar tareas y responsabilidades a los miembros de la brigada</h3></li>
										<li><h3>Coordinar las operaciones durante las emergencias</h3></li>
										<li><h3>Motivar y mantener en alto la moral de la brigada</h3></li>
									</ul>                                    
									<h3>Perfil de Los Brigadistas</h3>
									<a style="opacity:1;">#NOBORRAR#</a>
									<ul>
										<li><h3>Manifestar condiciones mentales, emocionales y físicas aptas para servir en las brigadas</h3></li>
										<li><h3>Poseer o adquirir conocimientos en emergencias</h3></li>
										<li><h3>Tener o recibir entrenamiento practico</h3></li>
										<li><h3>Contar con voluntad de servicio y compromiso</h3></li>
										<li><h3>Tomar la iniciativa en situaciones difíciles</h3></li>
										<li><h3>Ser capaz de dar ordenes claras, precisas y oportunas</h3></li>
										<li><h3>Ser ágil, ordenado , responsable y con criterio</h3></li>
										<li><h3>Tener autodominio, ingenio, persistencia, serenidad y prudencia</h3></li>
									</ul>
								   
						</CKEditor:CKEditorControl>
					</div>
				</div>
			</div>

			<!-- Segundo Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">FUNCIONES DE LOS BRIGADISTAS</a></h4>
				</div>

				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">

						<h3 class="box-title">Antes,Durante y Despues de la Emergencia</h3>
						<CKEditor:CKEditorControl ID="txtFuncBrig" BasePath="/ckeditor/" runat="server">
									<h3 class="box-title">Antes de la Emergencia</h3>
									<ul>
										<li><h3>Entrenamiento permanente y/o periódico</h3></li>
										<li><h3>Planificación previa a las emergencias</h3></li>
										<li><h3>Inspección rutinaria de equipos y riesgos</h3></li>
										<li><h3>Entrenamiento del personal en el uso de equipos para emergencias</h3></li>
										<li><h3>Entrenamiento y prácticas en la evacuación del establecimiento</h3></li>
										<li><h3>Mantenimiento del equipo de la brigada</h3></li>
										<li><h3>Poseer los conocimientos de la teoría básica y entrenamiento en maniobras de prevención y control de emergencias.</h3></li>
										<li><h3>Definir los elementos y equipos necesarios para cumplir con su labor</h3></li>
										<li><h3>Inspección de áreas para reconocer las condiciones de riesgo en el trabajo que puedan generar lesiones o hacer peligrar la vida de los trabadores y el proceso productivo de la empresa</h3></li>
										<li><h3>Con base en los hallazgos de las inspecciones tomar las medidas correctivas y preventivas para controlar y minimizar la ocurrencia de emergencias o disminuir la vulnerabilidad frente a ellas.</h3></li>
										<li><h3>Conocer los riesgos generales y particulares que se presentan en los diferentes sitios y actividades que se desarrollan en el área que labora</h3></li>
									</ul>
									<a style="opacity:1;">#NOBORRAR#</a>
									<h3>Durante de la Emergencia</h3>
									<ul>
										<li><h3>Actuar prontamente cuando se informe de una emergencia en su área (o si es requerido por otra área), usar el equipo que tenga a disposición según el evento</h3></li>
										<li><h3>Actuar coordinadamente con los demás miembros del grupo operativo</h3></li>
										<li><h3>Brindar apoyo a los grupos de socorro que se hagan presentes en la empresa para controlar la emergencia.</h3></li>
									</ul>
									<h3>Despues de la Emergencia</h3>
									<ul>
										<li><h3>Efectuar los reajustes o modificaciones necesarias a las acciones realizadas</h3></li>
										<li><h3>Reponer e material utilizado, verificación del post-uso, y hacer el mantenimiento respectivo si lo amerita</h3></li>
										<li><h3>Ayudar a restaurar lo más pronto posible el funcionamiento norma de las actividades dentro de la empresa</h3></li>
									</ul>
						</CKEditor:CKEditorControl>
					</div>
				</div>

			</div>

			<!-- Tercer Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">BRIGADA DE COMUNICACIÓN</a></h4>
				</div>

				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">

						<h3 class="box-title">FUNCIONES, ACTIVIDADES Y PROCEDIMIENTO DE COMUNICACIÓN</h3>
						<CKEditor:CKEditorControl ID="txtBrigCom" BasePath="/ckeditor/" runat="server">
									<h3>Las funciones y Actividades de la Brigada son:</h3>
									<ul>
										<li><h3>Contar con un listado de números telefónicos de los cuerpos de auxilio en la zona, los cuales se deben dar a conocer a todo el personal.</h3></li>
										<li><h3>Contar con radio trasmisores disponibles  dentro del inmueble, sintonizados en frecuencias locales  y en la frecuencia establecida.</h3></li>
										<li><h3>Hacer las llamadas a los cuerpos de auxilio, según el alto riesgo, emergencia, siniestro o desastre que se presente.</h3></li>
										<li><h3>Emitir mensajes claros, precisos y sin excesos de palabra para no generar falsas alarmas</h3></li>
										<li><h3>En coordinación con la brigada de primeros auxilios, tomará nota del número de la ambulancia o ambulancias, el nombre o nombres de los responsables de éstas, el nombre, denominación o razón social y dirección o direcciones de las instituciones hospitalarias a donde será remitido el paciente o pacientes, y realizará la llamada a los parientes del o los lesionado</h3></li>
										<li><h3>Recibir la información de cada brigada, de acuerdo al alto riesgo, emergencia, siniestro o desastre que se presente, para informarles al Coordinador General y cuerpos de emergencia. </h3></li>
										<li><h3>Contar con el formato de amenaza de bomba en caso de presentarse una amenaza</h3></li>
										<li><h3>Permanecer en el puesto de comunicación e instalarse previo acuerdo del Comité hasta el último momento, o bien, si cuenta con aparatos de comunicación portátiles, lo instalará en el punto de reunión  </h3></li>
										<li><h3>Realizar campañas de difusión para el personal con el fin de que conozca cuáles son las actividades del Comité, sus integrantes, funciones, actitudes y normas de conducta ante emergencias,</h3></li>
										<li><h3>Emitir después de cada simulacro un reporte de los resultados para toda la empresa, a fin de mantenerlos actualizados e informados en los avances de la empresa en materia de Protección Civil</h3></li>
									</ul>
									<a style="opacity:1;">#NOBORRAR#</a>
									<h3>Cadena de Llamadas<br />
									Establece el procedimiento para contactar tanto al responsable directo de cada área, como a cada uno de los integrantes de los equipos de trabajo ante la voz de alerta o alarma. Esto con el fin de permitir alertar en un corto tiempo a las personas responsables de activar los procedimientos de respuesta en relación con situaciones críticas al interior o exterior de la empresa.<br />
									La estructura para la cadena de llamadas será la siguiente:<br /></h3> 
									<ul>
										<li><h3>El coordinador  de SST efectúa llamadas simultáneas  a los jefes de brigada para garantizar el inicio de la cadena, la cual continúa expandiéndose.</h3></li>
										<li><h3>Siempre a través de máximo dos llamadas efectuadas por cada una de las personas integradas; de forma similar algunos integrantes de la cadena, efectúan llamadas cruzadas de verificación para asegurar que la información se haya transmitido a todas las personas requeridas</h3></li>
									</ul>
						</CKEditor:CKEditorControl>

						<h3 class="box-title">DIRECTORIO DE EMERGENCIAS INTERNO</h3>
						<CKEditor:CKEditorControl ID="txtDirEmeInt" BasePath="/ckeditor/" runat="server">
									<ul>
										<li><h3>Coordinador de SST</h3></li>
										<li><h3>Supervisor de Cada área</h3></li>
										<li><h3>Jefe de Brigada</h3></li>
										<li><h3>Integrantes del Copasst</h3></li>
										<li><h3>Vigía de Seguridad y Salud en el Trabajo</h3></li>
									</ul>
						</CKEditor:CKEditorControl>

						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<h3 class="box-title">LISTADO PARA EL PROCEDIMIENTO DE COMUNICACIÓN</h3>
								<table class="table table-condensed">
									<tbody>
										<tr class="bg-aqua color-palette">
											<th class="col-md-1 text-center">N°</th>
											<th class="col-md-4 text-center">NOMBRE</th>
											<th class="col-md-2 text-center">CARGO</th>
											<th class="col-md-2 text-center">N° TELEFONO</th>
											<th class="col-md-3 text-center">LLAMAR A</th>
										</tr>

										<asp:Panel ID="pTrabajador" runat="server">
											<tr>
												<td>1</td>
												<td>
													<asp:DropDownList ID="ddlTrabjador1" CssClass="form-control" runat="server"></asp:DropDownList>
													<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
														SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
														Font-Bold="true" ControlToValidate="ddlTrabjador1" runat="server"
														ValidationGroup="ValidationArbol" />
												</td>
												<td>
													<asp:TextBox ID="txtCargo1" CssClass="form-control" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
														SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
														Font-Bold="true" ControlToValidate="txtCargo1" runat="server"
														ValidationGroup="ValidationArbol" />
												</td>
												<td>
													<asp:TextBox ID="txtTelefono1" CssClass="form-control" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
														SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
														Font-Bold="true" ControlToValidate="txtTelefono1" runat="server"
														ValidationGroup="ValidationArbol" />
												</td>
												<td>
													<asp:DropDownList ID="ddlTrabjador2" CssClass="form-control" runat="server"></asp:DropDownList>
													<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
														SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
														Font-Bold="true" ControlToValidate="ddlTrabjador2" runat="server"
														ValidationGroup="ValidationArbol" />
												</td>
											</tr>

										</asp:Panel>

									</tbody>
								</table>

								<asp:Button ID="btnAgregarFila" runat="server" CssClass="btn btn-primary"
									OnClick="btnAgregarFila_Onclick" Text="Agregar Otra Fila" ValidationGroup="ValidationArbol" />

								<asp:Button ID="btnCalculate" runat="server" CssClass="btn btn-success"
									OnClick="btnCalculate_Onclick" Text="Generar Arbol" ValidationGroup="ValidationArbol" />


								<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
								<div class="row">
									<div class="col-md-10 col-md-offset-1" style="width: 100%;">
										<asp:Literal ID="ltReporte" runat="server"></asp:Literal>
										<div id="TreeChart" runat="server"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Cuarto Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">BRIGADA DE PRIMEROS AUXILIOS</a></h4>
				</div>

				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body">

						<h3 class="box-title">FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE PRIMEROS AUXILIOS</h3>
						<CKEditor:CKEditorControl ID="txtBrigPriAux" BasePath="/ckeditor/" runat="server">
									<h3>Las funciones y Actividades de la Brigada de Primeros Auxilios son:</h3><br/>
									<ul>
										<li><h3>Contar con un listado de personal que presenten enfermedades crónicas y tener los medicamentos específicos para tales casos</h3></li>
										<li><h3>Reunir a la brigada en un punto predeterminado en caso de emergencia, e instalar el puesto de socorro necesario para atender el alto riego, emergencia, siniestro o desastre</h3></li>
										<li><h3>Proporcionar los cuidados inmediatos y temporales a las víctimas de un alto riesgo, emergencia, siniestro o desastre a fin de mantenerlas con vida y evitarles un daño mayor, en tanto se recibe la ayuda médica especializada</h3></li>
										<li><h3>Entregar al lesionado a los cuerpos de auxilio</h3></li>
										<li><h3>Realizar, una vez controlada la emergencia, el inventario de los equipos que requerirán mantenimiento y de los medicamentos utilizados Así como reponer estos últimos, notificando al jefe de piso</h3></li>
										<li><h3>Mantener actualizado, vigente y en buen estado los botiquines y medicamentos</h3></li>
									</ul>
						</CKEditor:CKEditorControl>


					</div>
				</div>
			</div>

			<!-- Quinto Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">BRIGADA CONTRA INCENDIOS</a></h4>
				</div>

				<div id="collapse5" class="panel-collapse collapse">
					<div class="panel-body">

						<h3 class="box-title">FUNCIONES, ACTIVIDADES Y REQUISITOS DE LA BRIGADA CONTRA INCENDIOS</h3>
						<CKEditor:CKEditorControl ID="txtBrigIncendio" BasePath="/ckeditor/" runat="server">
									<h3>Funciones y actividades de la Brigada</h3>
									<ul>
										<li><h3>Intervenir con los medios disponibles para tratar de evitar que se produzcan daños y pérdidas en las instalaciones como consecuencia de una amenaza de incendio</h3></li>
										<li><h3>Vigilar el mantenimiento del equipo contra incendio</h3></li>
										<li><h3>Vigilar que no haya sobrecarga de líneas eléctricas, ni que exista acumulación de material inflamable</h3></li>
										<li><h3>Vigilar que el equipo contra incendio sea de fácil localización y no se encuentre obstruido</h3></li>
										<li><h3>Verificar que las instalaciones eléctricas  y de gas, reciban el mantenimiento preventivo y correctivo de manera permanente, para que las mismas ofrezcan seguridad</h3></li>
										<li><h3>Conocer el uso de los equipos de extinción de fuego, de acuerdo a cada tipo de fuego</h3></li>
									</ul>
									<h3>Los integrantes de la brigada contra incendio deben ser capaces de:</h3>
									<ul>
										<li><h3>Detectar los riesgos de las situaciones de emergencia por incendio, de acuerdo con los procedimientos establecidos por la empresa</h3></li>
										<li><h3>Operar los equipos contra incendio, de acuerdo con los procedimientos establecidos por la empresa o instrucciones del fabricante</h3></li>
										<li><h3>Proporcionar servicios de rescate de personas y salvamento de bienes, de acuerdo con los procedimientos establecidos por la empresa</h3></li>
										<li><h3>Reconocer si los equipo y herramientas contra incendio están en condiciones de operación</h3></li>
										<li><h3>El coordinador de la brigada debe contar con certificado de competencia laboral, expedido de acuerdo a los establecido en la Norma Técnica de Competencia Laboral de Servicios contra incendio, del Consejo de Normalización para la Certificación de Competencia Laboral.</h3></li>
									</ul>
						</CKEditor:CKEditorControl>
					</div>
				</div>
			</div>

			<!-- Sexto Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse6">BRIGADA DE EVACUACIÓN</a></h4>
				</div>

				<div id="collapse6" class="panel-collapse collapse">
					<div class="panel-body">

						<h3 class="box-title">FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE EVACUACIÓN</h3>
						<CKEditor:CKEditorControl ID="txtBrigEvacuacion" BasePath="/ckeditor/" runat="server">
									<h3>Las funciones y Actividades de la Brigada de Evacuación son:</h3>
									<ul>
										<li><h3>Implementar, colocar y mantener en buen estado la señalización del inmueble, lo mismo que los planos guía. Dicha señalización incluirá a los extintores, botiquines e hidrantes</h3></li>
										<li><h3>Contar con un censo actualizado y permanente del personal</h3></li>
										<li><h3>Dar la señal de evacuación de las instalaciones, conforme las instrucciones del coordinador general</h3></li>
										<li><h3>Participar tanto en los ejercicios de desalojo, como en situaciones reales</h3></li>
										<li><h3>Ser guías y retaguardias en ejercicios de desalojo y eventos reales, llevando a los grupos de personas hacia las zonas de menor riesgo y revisando que nadie se quede en su área de competencia </h3></li>
										<li><h3>Determinar los puntos de reunión</h3></li>
										<li><h3>Conducir a las personas durante un alto riego, emergencia, siniestro o desastre hasta un lugar seguro a través de rutas libres de peligro</h3></li>
										<li><h3>verificar de manera constante y permanente que las rutas de evacuación estén libres de obstáculos</h3></li>
										<li><h3>En caso de que una situación  amerite la evacuación del inmueble y la ruta de evacuación determinada previamente se encuentre obstruida o represente algún peligro, indicar al personal las rutas alternas de evacuación</h3></li>
										<li><h3>Realizar un censo de las personas al llegar al puntos de reunión</h3></li>
										<li><h3>Coordinar el regreso del personal a las instalaciones en caso de simulacro o en caso de una situación diferente a la normal, cuando ya no exista peligro</h3></li>
									</ul>
						</CKEditor:CKEditorControl>

					</div>
				</div>
			</div>

			<!-- Septimo Panel -->
			<div class="panel panel-default">
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse7">DIRECTORIO DE EMERGENCIAS EXTERNO</a></h4>
				</div>

				<div id="collapse7" class="panel-collapse collapse">
					<div class="panel-body">

						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<h4 class="box-title">Directorio de Emergencias Externo</h4>
								<table class="table table-condensed">
									<tbody>
										<tr class="bg-aqua color-palette">
											<th class="col-md-8 text-center">INSTITUCION</th>
											<th class="col-md-4 text-center">NUMERO</th>
										</tr>

										<tr>
											<td align="left">
												<asp:Image alt="-" runat="server" ImageUrl="~/ico/eme1.png" />
												EMERGENCIAS MÉDICAS</td>
											<td>112</td>
										</tr>

										<tr>
											<td align="left">
												<asp:Image alt="-" runat="server" ImageUrl="~/ico/eme2.png" />
												BOMBEROS</td>
											<td>119</td>
										</tr>

										<tr>
											<td align="left">
												<asp:Image alt="-" runat="server" ImageUrl="~/ico/eme3.png" />
												DEFENSA CIVIL</td>
											<td>144</td>
										</tr>

										<tr>
											<td align="left">
												<asp:Image alt="-" runat="server" ImageUrl="~/ico/eme4.png" />
												LÍNEA NACIONAL DE TOXICOLOGÍA</td>
											<td>018000-916012</td>
										</tr>

										<tr>
											<td align="left">
												<asp:Image alt="-" runat="server" ImageUrl="~/ico/eme5.png" />
												CRUZ ROJA</td>
											<td>132</td>
										</tr>

										<tr>
											<td align="left">
												<asp:Image alt="-" runat="server" ImageUrl="~/ico/eme6.png" />
												POLICÍA NACIONAL</td>
											<td>123</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-2">
				<asp:Button ID="btnPrint" runat="server" CssClass="btn btn-success"
					OnClick="GenerarDocumento" Text="Generar Documento" ValidationGroup="ValidationAdd" />
			</div>

			<div class="col-md-4">
				<asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary"
					OnClick="GuardarRegistro" Text="Guardar y/o Actualizar Datos" ValidationGroup="ValidationAdd" />
			</div>

		</div>
	</asp:PlaceHolder>
	<asp:PlaceHolder runat="server" ID="chEditorNo">
		<div class="row">
			<h4 class="text-center">Debe seleccionar la empresa y sucursal.</h4>
		</div>
	</asp:PlaceHolder>

</asp:Content>
