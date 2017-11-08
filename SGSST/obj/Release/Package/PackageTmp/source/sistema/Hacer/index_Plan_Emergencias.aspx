<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Plan_Emergencias.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Plan_Emergencias" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="#">Plan De Emergencias</a></li>
	</ol>

	<div class="page-header">
		<h3 class="text-center">Plan De Contingencias Y Atención De Emergencias</h3>
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

	<asp:PlaceHolder runat="server" ID="phCkeditor" Visible="false">
		<div class="row">

			<CKEditor:CKEditorControl Height="1000" ID="txtPlanEmergencia" BasePath="~/ckeditor/" runat="server">
						<h3>Plan de Contingencias y Atención de Emergencias </h3>

						<h3>Objetivo. </h3>
					
						Establecer las acciones orientadas a la prevención y mitigación de riesgos, brindando la adecuada 
						protección ante la eventualidad de un desastre provocado por agentes naturales, humanos o de terceros,
						administrando los medios necesarios para atenuar cualquier eventualidad, salvaguardando vidas, 
						garantizando la seguridad del personal involucrado en el control de la emergencia, proteger las 
						instalaciones y bienes materiales y proteger el ambiente.
					
						<h3>Metas. </h3>
					
						<ul>
							<li>Entrenar a todo el personal de la empresa, en lo referente a simulacros para dar respuestas en 
								caso de emergencia. </li>
							<li>Vigilar constantemente los procedimientos, no solo para prevenir accidentes, sino
								para evitar pérdidas futuras o sistemas de contingencias. </li>
							<li>Crear un plan que salvaguarde la vida de todo el personal de la empresa, de terceros y de los 
								visitantes. </li>
							<li>Garantizar seguridad a las personas, protección a las instalaciones, bienes materiales y al 
								ambiente. </li>
						</ul>

						<h3> Alcance. </h3>
						Se aplica a todos los empleados, visitantes o terceros que se encuentren dentro de las instalaciones de 
						la empresa
						<a style="opacity:0;">#NOBORRAR#</a>
						<h3>1. Frecuencia. </h3>
						Este plan de emergencias debe ser enriquecido semestralmente a través de ejercicios de simulación de 
						desalojo, rescate y salvamento. 
						<h3>2. Responsabilidad. </h3>
						<ul>
							<li>Es responsabilidad de gerencia, disponer los recursos necesarios para llevar a cabo el plan. </li>
							<li>Es responsabilidad del supervisor de planta, avisar cualquier irregularidad (emergencia) al SSST. </li>
							<li>Es responsabilidad de las brigadas de emergencia reportar al Coordinador de Seguridad y Salud en 
								el Trabajo cualquier anomalía que se presenta, así mismo es responsable de actuar (si está 
								capacitado) ante cualquier condición de emergencia. </li>
							<li>Es responsabilidad de los trabajadores, mantenerse alerta ante cualquier situación de emergencia 
								y avisar de inmediato al supervisor o a las brigadas</li>
							<li>Es responsabilidad de los grupos de emergencias, brindar el apoyo a todo el personal de la empresa
								, así mismo debe, contribuir en la prevención y cuidado de algún caso no deseado. </li>
						</ul>
					
						<h3>3.Explicación del plan. </h3>
						En toda actividad en la que puedan presentarse emergencias deberá existir un plan general para el control,
						escrito, divulgado, entendido y practicado por todas aquellas personas que puedan o podrían estar 
						involucradas en ella, el plan deberá ser estrictamente detallado con el fin de cubrir todos los aspectos 
						que puedan estar involucrados en una emergencia para reducir las incertidumbres propias de situaciones de 
						tensión y pánico. 
						Ante cualquier circunstancia irregular que se produzca súbita e imprevistamente, que pueda generar daños 
						a las personas o al ambiente; y que demanden acción inmediata, se requiere contar con un plan de 
						actuación, que consiste en un procedimiento de respuesta, basado en criterios de seguridad, eficiencia y 
						rapidez, mediante la acción colectiva y coordinada de un grupo de personas, orientada a minimizar las 
						posibles pérdidas. 
						Un plan de emergencia debe ser revisado y actualizado periódicamente, así mismo debe ser enriquecido a 
						través de ejercicios de simulación. 
					
						<h3>Brigadas de Emergencia</h3>
						Son las personas debidamente organizadas y capacitadas para enfrentar las emergencias, la implantación 
						del Plan de Control de emergencias requiere de la conformación y entrenamiento de un grupo de trabajadores
						que demuestren interés y compromiso para actuar por la seguridad y salud de las personas involucradas en 
						cualquier situación de emergencia, contando con la debida capacitación y las habilidades físicas y 
						mentales que les permitan mantener el control y actuar rápida y efectivamente, ya que son los encargados 
						de divulgar, dirigir y supervisar la evacuación. 
					
						Otra de sus funciones es la comunicación e instrucción del personal sobre los procedimientos a seguir en 
						casos de emergencia, vigilar los sistemas de seguridad y requerir la acción de organismos públicos. 
						También son los responsables de garantizar el suministro de medicamentos y equipos necesarios para el 
						control de la situación de emergencia. 
					
						Los integrantes de este grupo deben recibir adiestramiento y capacitación para la atención de primeros 
						auxilios de manera de controlar a la(s) víctima(s) hasta que reciban atención médica. Deben disponer de 
						una lista de teléfonos necesarios en caso de emergencias entre estos: Bomberos, Protección Civil, 
						Ambulancia, Servicio Médico y Policía. Es el grupo encargado de ejecutar la logística de transporte, 
						coordinando los medios necesarios para movilizar personal, búsqueda de suministros y equipos de seguridad,
						transporte de lesionados, entre otros. 
					
						<h3>Sistemas de seguridad</h3>
						Los sistemas de seguridad requeridos de acuerdo al tipo de emergencias que se pueden presentar en las 
						instalaciones de una empresa son: 
						<ul>
							<li>Sistema de alarma y detección de incendios, </li>
							<li>Equipos portátiles de extinción de incendios, </li>
							<li>Botiquín de primeros auxilios, </li>
							<li>Lámparas de iluminación de emergencia, </li>
							<li>Mangueras contra incendios. </li>
						</ul>
						Todos los sistemas e instalaciones de Seguridad asociados con las emergencias a controlar deberán tener 
						un mantenimiento estricto para garantizar su operatividad. Considerando la naturaleza súbita de las 
						situaciones de emergencia, el mantenimiento realizado de los sistemas de seguridad debe ser preventivo, 
						en cuanto estos deben estar en condiciones de operatividad en cualquier momento, también deben ser 
						probados periódicamente. 
					
						<h3>Vías de acceso y salida</h3>
						Se entiende por medio de escape, la vía libre y continua que desde cualquier punto de una edificación 
						conduce a un lugar seguro, todas las edificaciones deben poseer los medios de escape apropiados con la 
						capacidad suficiente para desalojar o llevar a un lugar seguro al número máximo de personas que puedan 
						ocupar la edificación en el tiempo de desalojo, estas vías deben estar provistas de señalización que 
						indique la dirección a seguir para llegar a un lugar seguro.
						<h3>Señalización</h3>
						Señalización de evacuación y salvamento:, todos los medios de escape deben estar señalizados adecuadamente
						mediante letreros, señales luminosas colocadas a una altura no mayor de 2,10 m. y otra a 0,50 m. medidos 
						desde el suelo como se indica en la figura. 
					
						Las señales de emergencia, evacuación y salvamento, deben indicar las salidas de emergencia y vías de 
						escape, consisten de un aviso en forma de panel con pictograma blanco sobre fondo verde. 
					
						<h3>Señalización de medios de extinción de incendio: </h3> 
						Las señales de equipos contra incendios, deben facilitar la localización de los mismos, su forma debe ser 
						rectangular con pictograma blanco sobre fondo rojo. Para cada extintor portátil se debe colocar un aviso 
						que indique la localización del equipo. 
					
						<h3>Señalización de advertencia o precaución: </h3> 
						Estas señales previenen sobre la existencia de algún peligro para la integridad física del individuo, 
						tienen forma triangular, con pictograma negro sobre fondo amarillo y bordes negros. Se debe colocar un
						(1) aviso de riesgo eléctrico en cada uno de los sitios donde haya tableros de alimentación eléctrica, 
						donde halla cables o controles de equipos, en general donde haya medios de conducción de corriente 
						eléctrica. 
					
						<h3>Contacto con órganos o autoridades competentes</h3>
						El contacto con organismos competentes en la atención y control de emergencias debe realizarse tan pronto 
						como sea declarada la situación de emergencia, a tal efecto, los integrantes del grupo de control de 
						emergencias deberán disponer de una lista telefónica para el contacto con dichos órganos que les permita 
						actuar rápidamente para solicitar su intervención cuando la situación lo amerite. 
					
						Así mismo deberán tener información detallada concerniente al funcionamiento de los servicios más 
						importantes tales como ubicación y operación de interruptores de energía eléctrica, sistema de suministro
						de agua e iluminación de emergencia para poder suministrar información pertinente a los funcionarios que 
						acudan. 
					
						Además deben dar a conocer a estos funcionarios el tipo de lesiones que podrían sufrir los trabajadores y 
						trabajadoras en caso de un siniestro, bien sea por la naturaleza de los materiales que se usan o el tipo 
						de actividades que se realizan. 
					
						<h3>Procedimiento de alerta</h3>
						Una vez instalado el sistema de detección y alarma contra incendios, se debe explicar a los integrantes 
						del grupo de control de emergencias  la forma de activar la alarma en caso de presentarse alguna 
						emergencia de otra naturaleza. 
					
						El grupo de intervención y primeros auxilios debe dirigirse a la zona donde se presume se presenta una
						situación de emergencia para hacer una comprobación de la alerta. 
					
						<h3>Procedimiento de desalojo</h3>
						Una vez que se haya declarado la situación de emergencia, el grupo de intervención y primeros auxilios 
						debe dar la orden de evacuación de la zona de peligro y debe asistir a las personas durante el proceso 
						de evacuación, dando las indicaciones necesarias para acceder al sitio seguro en el menor tiempo posible 
						y sin poner en riesgo su integridad física o la de terceros. 
					
						Durante el proceso de evacuación, deben verificar que no hayan quedado personas en el sitio para ayudar 
						los a salir, en caso de que estas personas no se encuentren en condiciones de abandonar la zona de
						peligro, deben realizar transporte de lesionados para trasladarlos al sitio donde recibirán atención de 
						primeros auxilios. 
					
						<h3>Procedimiento de rescate y salvamento</h3>
						La intención del procedimiento de rescate y salvamento es establecer una serie de pasos a seguir en 
						la atención de una emergencia para prestar la mejor atención a los lesionados con el mínimo riesgo 
						para la integridad física del socorrista. 
					
						Este procedimiento es responsabilidad del grupo de intervención y del grupo de primeros auxilios, 
						estos son los encargados de desalojar la zona de peligro, llevar a las personas a un lugar seguro y
						brindar los primeros auxilios que requieran hasta que sean atendidos por un médico. 
					
						<h3>Evaluación de la escena</h3>
						El socorrista debe salvaguardar y proteger su integridad física, por ello debe determinar los posibles 
						peligros en el lugar del accidente y ubicar a la(s) víctima(s) en un lugar seguro, es preciso que 
						determine el número y condiciones de los lesionados, organice los primeros auxilios según sus capacidades 
						físicas y juicio personal. Debe actuar con serenidad y rapidez, esto da confianza al lesionado. 
					
						<h3>Transporte de lesionados</h3>
						Su transporte debe ser seguro de manera que no se empeoren las lesiones, dependiendo de la situación se 
						pueden aplicar varios métodos para realizar el transporte de lesionados: 
					
						<strong>Arrastre: </strong> Se deben colocar los brazos cruzados sobre el tórax del lesionado, el 
						socorrista se debe situar detrás de la cabeza del lesionado y colocar sus brazos por debajo de los 
						hombros, sosteniendo con ellos el cuello y la cabeza, luego arrástrelo por el suelo, si el  lesionado 
						usa una chaqueta, puede desabrocharla y halarla hacia atrás de modo que la cabeza descanse sobre la 
						prenda. Si el lesionado está consciente pero no puede movilizarse, el socorrista debe arrodillarse y 
						pedirle que pase los brazos alrededor de su cuello entrelazando las manos, luego podrá arrastrarlo. 
						Si el lesionado es muy grande utilice el arrastre por los pies, siempre y cuando el lesionado no corra 
						peligro por irregularidades en el terreno.
					
						<strong>Cargar de brazos: </strong>Si el lesionado es de bajo peso, se debe pasar un brazo por debajo 
						de los muslos, colocar el otro brazo alrededor del tronco y levantar al lesionado, si el peso del 
						lesionado es mayor, el levantamiento puede ser efectuado por dos o tres personas.
					
						<strong>Transporte en camilla: </strong> 
						Las camillas pueden ser improvisadas con chaquetas o abrigos y con dos trozos de madera fuertes, se
						debe colocar al lesionado sobre la camilla y se transporta con el número de personas que sea necesario.
					
					
						<h3>Evaluación primaria</h3>
						El socorrista debe hacer una valoración del lesionado, para ello debe verificar si está respirando, 
						verificar si tiene pulso, verificar si está consciente, preguntar si siente dolor y dónde, verificar 
						si presenta heridas o hemorragias. 
					
						<h3>Solicitar asistencia médica</h3>
						Se debe contactar organismos competentes, como son los bomberos, protección civil, servicios médicos, se 
						debe indicar cuál es la situación de emergencia, cantidad y condiciones de las víctimas y el tipo de 
						ayuda que se está prestando.
					
						<h3>Evaluación secundaria</h3>
						Se debe valorar otros problemas que no constituyen una amenaza inmediata contra la vida, pero que 
						pudieran causar problemas si no se corrigen a tiempo, se realiza en tres etapas: Entrevista, en esta 
						etapa se trata de obtener información sobre el historial médico del lesionado como enfermedades previas, 
						alergias, medicamentos que toma actualmente; Signos vitales, se debe medir, respiración, pulso, reflejo 
						pupilar, temperatura y presión arterial; Examen físico de cabeza a pies, consiste en la evaluación de 
						todo el cuerpo, debe hacerse en el siguiente orden: cuello, cráneo, cara, clavícula, hombros, tórax,
						abdomen, pelvis, genitales, extremidades inferiores, extremidades superiores y dorso.
					
						<h3>Aplicar primeros auxilios</h3>
						El grupo de primeros auxilios no debe permitir que otras personas se acerquen mucho a los lesionados, se
						debe prestar atención inmediata en el siguiente orden: los que sangran abundantemente, no presenten 
						señales de vida, presenten quemaduras graves, presenten síntomas de fracturas, presenten heridas leves.
					
						En todo procedimiento de primeros auxilios se debe hacer lo siguiente:
						<ul>
							<li>Comprobar que las vías respiratorias se encuentran libres de obstáculos. </li>
							<li>Si el lesionado está consciente, pedirle que mueva sus cuatro extremidades para determinar 
								sensibilidad y movimiento. </li>
							<li>Cubrir al lesionado para mantener la temperatura corporal. </li>
							<li>Proporcionar seguridad emocional y física. </li>
							<li>No permita que el lesionado se levante, si hay sospecha de fractura es necesario inmovilizarlo. </li>

						</ul>
					
						<strong>En caso de hemorragia: </strong>
						Toda pérdida de sangre debe ser controlada cuanto antes, se debe acostar al lesionado, descubrir el sitio 
						de la lesión, aplicar una compresa limpia haciendo presión o realice un vendaje, la elevación de la parte 
						lesionada disminuye la presión de la sangre y reduce la hemorragia.
					
						Si el lesionado presenta el abdomen muy sensible o rígido, hematomas en diferentes partes del cuerpo, 
						vomito con sangre o fracturas cerradas es porque presenta una hemorragia interna, en este caso se debe 
						controlar la respiración y pulso cada cinco minutos, mantener abrigado al lesionado y no se le debe dar a 
						tomar nada.
					
						<strong>En caso de heridas: </strong> 
						Se debe lavar completamente la herida con agua y 
						jabón antiséptico o jabón azul y aplicar un vendaje. Si hay algún objeto incrustado este no debe sacarse, 
						solo debe inmovilizarse. Las heridas en la cara y en el cráneo deben ser limpiadas suavemente con una 
						gasa húmeda y se deben cubrir con un apósito sin hacer presión, manteniendo al lesionado inmóvil. 
						Las heridas en el tórax se deben secar con una gasa limpia y se debe cubrir tratando de que no entre
						aire, dejando al lesionado semi sentado para facilitar su respiración. En caso de presentar una herida 
						en el abdomen, se debe acostar al paciente y cubrir la herida con gasa húmeda con solución o agua 
						limpia.
					
						<strong>En caso de Shock: </strong> 
						Es una condición grave que se produce cuando el sistema cardiovascular no puede suministrar suficiente 
						sangre al cuerpo, sus síntomas son manos frías y húmedas, con gotas de transpiración en la frente y 
						palma de las manos, palidez, escalofríos, nauseas, respiración muy superficial y rápida, alteración de 
						los signos vitales, nerviosismo, mareos, desmayos, adormecimientos. Se debe mantener recostado al 
						lesionado, mantener las vías respiratorias abiertas, y tratar de calmarlo.
					
						<strong>En caso de fracturas y luxaciones: </strong>
						Se debe inmovilizar la parte lesionada mientras la víctima es trasladada al centro asistencial, para esto
						se puede emplear, férulas rígidas, tablas, férulas blandas, mantas almohadas, vendas triangulares o 
						elementos para amarrar y sostener. Si hay fractura abierta, controle la hemorragia, cubra la herida sin 
						hacer presión y luego haga la inmovilización.
					
						<strong>En caso de quemaduras: </strong>
						Se debe enfriar la quemadura colocando la zona afectada 
						bajo un chorro de agua fría (siempre y cuando no sean quemaduras de tercer grado o con amplia superficie 
						de extensión), posteriormente se debe cubrir la zona afectada con apósitos estériles, no se debe aplicar 
						ningún medicamento se debe retirar anillos, relojes o cualquier otro objeto con cuidado y rápidamente. 
					
					
						Si las quemaduras son producidas por contacto eléctrico el lesionado puede sufrir graves lesiones en el 
						corazón y el sistema nervioso, para brindar primeros auxilios se debe separar al lesionado de la 
						corriente o utilizar materiales aislantes para no tocar directamente al lesionado y se debe cubrir la 
						zona afectada con material esterilizado. 
					
						<h3>Traslado a la EPS</h3>
						Los primeros auxilios son la atención, socorro o ayuda inmediata, rápida y efectiva que se debe prestar a 
						toda persona lesionada hasta que esta sea trasladada al centro asistencial, una vez que hayan llegado los 
						funcionarios del servicio médico y la ambulancia, para efectuar el traslado de los lesionados a la 
						respectiva EPS
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
					OnClick="GuardarRegistro" Text="Guardar y/o Actualizar Datos" ValidationGroup="ValidationAdd" />
			</div>

		</div>

	</asp:PlaceHolder>

	<asp:PlaceHolder runat="server" ID="phCkeditorNo">
		<div class="row">
			<h3 class="text-center">Debe seleccionar la sucursal para editar el plan de emergencias.
			</h3>
		</div>
	</asp:PlaceHolder>

</asp:Content>
