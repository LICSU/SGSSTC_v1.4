<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ProgramaInspecciones.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ProgramaInspecciones" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="#">Programas de Inspecciones</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">PROGRAMA DE INSPECCIONES</h1>
	</div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
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

	<asp:PlaceHolder runat="server" ID="phCkeditor" Visible="false">
		<div class="row text-left">
			<div class="col-md-12">
				<h3>Objetivo.</h3>
				<br />
				Realizar inspecciones en cada una de las áreas de la Empresa, a fin de determinar las condiciones en las 
                que se encuentran los puestos de trabajo, los dispositivos de seguridad y el acatamiento de las normas y 
                procedimientos seguros de trabajo. 
                
                <h3>Metas. </h3>
				<br />
				<ul>
					<li>Realizar periódicamente seguimiento de los procesos de trabajo en cada una de las áreas productivas de la organización.</li>
					<li>Involucrar a los trabajadores y a los supervisores en el desarrollo de las inspecciones en cada uno de los elementos a evaluar.</li>
					<li>Según los resultados obtenidos realizar medidas preventivas, para minimizar el riesgo de ocurrencia de accidentes de trabajo y enfermedades ocupacionales.</li>
				</ul>

			</div>
		</div>

		<div class="row">

			<CKEditor:CKEditorControl Height="1000" ID="txtProgInspecciones" BasePath="/ckeditor/" runat="server">
						<h3>Alcance. </h3><br/>
							Aplica a inspecciones de los extintores portátiles, lámparas de emergencia, señalización, pasillos y vías de escape, botiquín de primeros auxilios, oficinas administrativas, 
							áreas de producción, almacenes, depósitos de material, servicio sanitario y áreas comunes. 

						<h3>Frecuencia. </h3><br/>
							Inspecciones mensuales, trimestrales, semestrales o especiales.

						<h3>Responsabilidad. </h3><br/>
						<ul>
							<li>Es responsabilidad y obligación de la alta dirección realizar inspecciones de trabajo a través del Sistema de Gestión de Seguridad y Salud en el Trabajo</li>
							<li>Es responsabilidad del Sistema de Gestión de Seguridad y Salud en el Trabajo velar por el cumplimiento del Plan de Inspecciones.</li>
							<li>Es responsabilidad de las Brigadas de Emergencia, de los Vigías de Seguridad, de los supervisores y de los trabajadores participar activamente en pro de la ejecución del plan.</li>
						</ul>

						<h3>Explicación del plan. </h3><br/>
						El mantenimiento de las condiciones seguras de trabajo requiere de un seguimiento constante que permita verificar el cumplimiento de las normas
						y procedimientos seguros por parte de cada uno de los integrantes de la organización. Una inspección es un examen minucioso que se hace a intervalos
						de tiempo, con el fin de determinar las condiciones de operatividad de dispositivos, instalaciones y el acatamiento de reglas, normas y procedimientos 
						seguros de trabajo. Para el Sistema de Gestión de Seguridad y Salud laboral, las inspecciones constituyen una herramienta fundamental para la detección 
						de condiciones y actos inseguros.<br/>
						La periodicidad de las inspecciones debe variar, realizando inspecciones sin previo aviso para determinar condiciones insatisfactorias del ambiente e incumplimiento de normas, 
						a tal efecto se realizarán tres tipos de inspecciones:<br/>

						<h3>1. Inspecciones periódicas. </h3><br/>
						Estas se realizan de forma programada y a intervalos regulares, con el objeto de efectuar una revisión sistemática y eficiente de una instalación 
						completa o de una actividad específica. Mediante estas inspecciones se verificará el funcionamiento de los sistemas de detección, alarma y 
						extinción de incendios, señalización y vías de escape.

						<h3>Inspección de extintores portátiles de incendio. </h3><br/>
						Se debe hacer una inspección periódica y minuciosa a los extintores con el fin de determinar y establecer sus condiciones de operatividad. 
						Las condiciones generales que se deben tomar en cuenta en la inspección de extintores portátiles son: <br />
						<ul>
							<li>El extintor debe estar ubicado en forma correcta y visible, en el lugar apropiado y libre de obstáculos para permitir su fácil identificación, acceso y uso.</li>
							<li>Todos los extintores se deben inspeccionar al instalarse, y realizar mantenimiento como mínimo una vez al año.</li>
							<li>A todo extintor del tipo de presión directa se le deben limpiar sus partes componentes y recargarlos en cualquiera de los siguientes casos: 
								Cuando haya sido usado; cuando el dispositivo indicador de presión esté por debajo de su límite de operación normal; 
								cada año a partir de la fecha de su adquisición o última fecha de mantenimiento</li>
							<li>A todo extintor de presión indirecta se le deben limpiar todas sus partes y componentes y recargar cada año cuando el peso del cartucho haya disminuido</li>
							<li>En la recarga debe asegurarse la introducción de la misma cantidad de polvo químico seco en peso y de igual densidad que indique el fabricante para cada caso</li>
						</ul>

						<h3>Inspección de medios de escape. </h3><br/>
						<strong>Lámparas de Emergencia: </strong>las lámparas de iluminación de emergencia  deben ser inspeccionadas trimestralmente para verificar su estado de funcionamiento, 
						en caso de presentar alguna avería se debe solicitar su revisión técnica de inmediato. Deben cumplir con los siguientes requisitos:<br />
						<ul>
							<li>Todos los componentes eléctricos y electrónicos de la lámpara deben estar encerrados, con la finalidad de evitar cualquier contacto manual, no intencional con sus partes metálicas energizadas no aisladas</li>
							<li>Todas las partes operacionales de la lámpara como relés y/o dispositivos similares, deben estar protegidos adecuadamente del polvo y de otros materiales y/o elementos, con el objeto de evitar que estos puedan afectar adversamente su funcionamiento</li>
							<li>Todas las partes de la lámpara deben estar montadas en posición y de forma segura para evitar su pérdida y/o que, cualquier movimiento pueda afectar su normal funcionamiento.</li>
							<li>Cada lámpara debe tener dos (2) fuentes luminosas.</li>
							<li>Debe poseer una señal luminosa independiente de color verde, la cual indique la presencia en la lámpara, de su alimentación externa, esta señal debe estar marcada clara y visiblemente con la inscripción: OPERACIÓN NORMAL.</li>
							<li>Debe poseer una señal luminosa independiente de color rojo, la cual indique cualquier falla que ocurra en la batería de la lámpara, esta señal debe estar marcada clara y visiblemente con la inscripción: CARGA BAJA.</li>
							<li>Toda lámpara debe contener en forma clara y legible la siguiente información: Tensión nominal de alimentación, tensión nominal de la batería, flujo luminoso nominal en lux, Potencia nominal de consumo, vida útil de la fuente luminosa, nombre del fabricante, país de origen, modelo o serial y fecha de fabricación</li>
						</ul><br />

						<strong>Señalización de seguridad: </strong><br />
						Las señales de seguridad son dispositivos que a través de la combinación de una forma geométrica, un color, un símbolo y/o un texto, 
						son dispuestas en ciertas áreas con el objeto de prevenir accidentes, riesgos a la salud y facilitar el control de emergencias.<br />
						La inspección periódica de los medios de escape debe comprender una inspección del estado en que se encuentran las señales de 
						seguridad dispuestas en las diferentes áreas.<br />

						<strong>Pasillos y escaleras de escape: </strong><br />
						Los pasillos y escaleras son las secciones que conforman el medio de escape o vía continua que desde cualquier lugar de una 
						edificación conduce a un lugar seguro<br />
						Los medios de escape y las puertas de acceso a los mismos deben permanecer libres de obstáculos. 
						Semestralmente se deben realizar inspecciones de los pasillos y medios de escape con la finalidad de verificar que se encuentren en correcto estado, 
						en caso de fallas estructurales del piso, escaleras, pasamanos, entre otros, se debe notificar al Comité Paritario de Seguridad y salud en el Trabajo.<br />
				
						<h3>Inspección del Botiquín de Primeros Auxilios. </h3><br/>
						Se deben disponer botiquines de primeros auxilios ubicados en sitios visibles y de fácil acceso. El personal debe estar familiarizado con su ubicación y contenido, 
						además deben estar capacitados para poder prestar asistencia inmediata a un accidentado, lesionado o enfermo con el propósito de estabilizar, atender, aliviar y/o 
						mejorar al afectado hasta tanto se pueda contar con la asistencia médica.<br />
						Con la finalidad de asegurar que los botiquines de primeros auxilios mantengan las condiciones necesarias para servir oportunamente ante cualquier contingencia, 
						se deben realizar inspecciones mensuales de los mismos para garantizar la reposición oportuna de los elementos consumidos, utilizados o vencidos y 
						la disponibilidad permanente, para lo cual se diligenciará un formato de control de inventarios que cumplan con el contenido mínimo del material que deben 
						incluir de acuerdo a lo especificado en la Resolución 0705 de 2007, el cual se señala en la siguiente hoja de inspección.<br />

						<h3>Inspecciones a Señalización y  Equipos de Protección personal. </h3><br/>
						Se debe dotar a los trabajadores de los implementos y equipos de protección personal que sean necesarios para la segura ejecución del trabajo, 
						además se le capacitará en el uso de los mismos, Se revisará constantemente el buen funcionamiento y el buen estado de los equipos de protección. 
						De la entrega del equipo quedará constancia archivada<br />

						<h3>1. Inspecciones intermitentes. </h3><br/>
						Estas se efectuarán sin previo aviso, con la finalidad de detectar el estado de las condiciones y medio ambiente de trabajo, el cumplimiento continuo de reglas, 
						normas y procedimientos exigidos de acuerdo a las actividades propias de cada área. Deben realizarse con frecuencia semanal, en horarios y días diferentes para 
						descubrir las condiciones o actos inseguros que se están presentando y poder diseñar, a la brevedad posible, medidas preventivas a aplicar para minimizar 
						el riesgo de ocurrencia de accidentes o enfermedades ocupacionales.<br />
						Las inspecciones pueden ser realizadas por el Coordinador de seguridad y salud laboral, por los supervisores, El Vigía de Seguridad y Salud en el Trabajo. 
						El inspector debe emplear un criterio de evaluación objetivo y notificar al órgano de seguridad sobre cualquier condición desfavorable que observe para su 
						pronta atención y constante observación hasta tanto se haya corregido las condiciones inseguras.<br />
						El responsable de la ejecución de las inspecciones intermitentes podrá calificar las condiciones de trabajo y la actuación de los trabajadores, 
						el cumplimiento de las condiciones de salud y seguridad,  así como el acatamiento de las normas y procedimientos, también podrá señalar observaciones 
						y oportunidades de mejora detectadas durante la inspección.<br />

						<h3>3. Inspecciones especiales. </h3><br/>
						Estas se realizarán con la finalidad de detectar y predecir fallas que pudiesen llegar a ser causas de accidentes de trabajo o enfermedades ocupacionales. 
						Consisten en examinar los equipos a intervalos predeterminados de tiempo, con el fin de establecer la necesidad de cambiar o reparar algún 
						componente o pieza dañada, acción que se denomina mantenimiento preventivo.<br />
						Estas inspecciones deben ser realizadas por el encargado del mantenimiento de la organización, que es quien conoce el funcionamiento de los equipos, 
						estando capacitado para detectar posibles fallas y así podrá solicitar las piezas adecuadas para mantener un stock apropiado de repuestos.<br />
						También se ameritará la ejecución de inspecciones especiales por parte del Comité Paritario de Seguridad y Salud en el Trabajo de la empresa en caso de instalación de nuevos equipos, 
						construcción o remodelación de instalaciones o aparición de nuevos riesgos. <br />
						Sobre cualquier inspección que se realice, se levantará un acta describiendo en detalle las condiciones y circunstancias verificadas, incluyendo las medidas correctivas de corto mediano y largo plazo según sea el caso. 
						Esta acta deberá estar firmada por los participantes en la inspección.
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

	<asp:PlaceHolder runat="server" ID="phCkeditorno">
		<div class="row">
			<h4 class="text-center">Debe seleccionar la empresa y sucursal.</h4>
		</div>
	</asp:PlaceHolder>

</asp:Content>
