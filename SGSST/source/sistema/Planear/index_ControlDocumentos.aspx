<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ControlDocumentos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ControlDocumentos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="//www.google.com/jsapi"></script>

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="#">Control De Documentos</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Control De Documentos</h1>
	</div>

	<br />

	<div class="box">
		<div class="box-body no-padding">
			<table class="table table-condensed" style="overflow: scroll;">
				<tbody>

					<tr class="bg-aqua color-palette">
						<th class="col-md-1 text-center">N°</th>
						<th class="col-md-5 text-center">TIPO DE DOCUMENTO</th>
						<th class="col-md-2 text-center">RESPONSABLE</th>
						<th class="col-md-2 text-center">REVISADO POR</th>
						<th class="col-md-2 text-center">APROBADO</th>
						<th class="col-md-2 text-center"></th>
					</tr>

					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="1" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Política de SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox1" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox2" runat="server"></asp:TextBox>
						</t>
									<th class="text-center">
										<asp:CheckBox ID="Checkbox1" runat="server"></asp:CheckBox>
									</th>
						<th class="text-center"><a href="../Hacer/index_Politica_SST.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="2" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Documentos para la divulgación de la Política ( Trípticos, Publicaciones en Carteleras o cualquier otro medio informativo)" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox3" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox4" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox2" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_ComunicacionPoliticaSST.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="3" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Encuestas para validar que el personal haya conocido y comprendido la Política del SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox5" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox6" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox3" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_Encuesta_PoliticaSST.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="4" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Evaluación Inicial del SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox7" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox8" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox4" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../EvaluacionInicial/index_AutoEvaluacion.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="5" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Descripción del Alcance del SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox9" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox10" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox5" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_Politica_SST.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="6" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Objetivos de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox11" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox12" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox6" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_Politica_SST.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="7" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Descripción de la Estructura PHVA del SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox13" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox14" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox7" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_EstructuraPHVA.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="8" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Caracterización de Procesos del SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox15" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox16" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox8" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="9" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Inspecciones de Seguridad" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox17" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox18" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox9" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../EvaluacionInicial/index_Inspecciones.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="10" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Acciones preventivas, correctivas y de mejoras generadas en las inspecciones de seguridad." Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox19" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox20" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox10" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="11" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Establecimiento de Indicadores de Medición del SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox21" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox22" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox11" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="12" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Normas y Reglamentos Internos de la Organización" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox23" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox24" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox12" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="13" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Plan de Trabajo Anual" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox25" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox26" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox13" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="14" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="No conformidades detectadas en el seguimiento al plan de trabajo anual en Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox27" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox28" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox14" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="15" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Matriz Legal Actualizada en relación a toda la normatividad legal vigente aplicable en materia de SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox29" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox30" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox15" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_MatrizLegal.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="16" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Documentar los Requisitos concretos que hay que cumplir ( Generales y Específicos)" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox31" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox32" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox16" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="17" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Actualización de la Normativa que Sustituye, Reemplaza o Corrige la Existente" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox33" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox34" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox17" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="18" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Matriz de Peligros, Evaluación y Valoración de los riesgos Actualizada acorde a los peligros y priorización de riesgos de la organización" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox35" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox36" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox18" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_MatrizRiesgos.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="19" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Resultados de las Evaluaciones de Riesgo " Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox37" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox38" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox19" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="20" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Medidas de Seguimiento y Control de Riesgos" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox39" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox40" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox20" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="21" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Reportes de las Condiciones de Trabajo peligrosas realizadas por los trabajadores" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox41" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox42" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox21" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="22" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Plan de Acción ( Recursos y Plazos para alcanzar los objetivos planteados)" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox43" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox44" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox22" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="23" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Manual y Programas de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox45" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox46" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox23" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="24" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Plan de Inducción" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox47" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox48" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox24" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="25" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Constancia de Registro de la Inducción ( información de de las condiciones inseguras o insalubres y riesgos a los que estará expuesto el trabajador  y los daños que puede causar a la salud" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox49" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox50" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox25" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="26" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Plan para la Prevención y Atención de Emergencias en la organización" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox51" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox52" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox26" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="27" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Mapas de Riesgo Actualizados" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox53" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox54" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox27" runat="server"></asp:CheckBox>
						</th>
						<th class="text-center"><a href="../Hacer/index_MapaRiesgos.aspx">Enlace</a></th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="28" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Registro de Mapas de Ubicación de Extintores, Lámparas de Emergencia  y Sistemas de Alarma contra Incendio, Planos de Evacuación" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox55" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox56" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox28" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="29" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Plan de Capacitación en Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox57" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox58" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox29" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="30" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Registro de Capacitaciones" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox59" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox60" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox30" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="31" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Reporte e investigación de los incidentes, accidentes de trabajo " Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox61" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox62" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox31" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="32" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Registro estadístico de  accidentes e incidentes de trabajo" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox63" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox64" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox32" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="33" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Investigación de Accidentes e Incidentes" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox65" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox66" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox33" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="34" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Acciones preventivas, correctivas y de mejora, generadas en las investigaciones de los incidentes, accidentes y enfermedades laborales" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox67" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox68" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox34" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="35" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Actas de reunión mensual  del Comité Paritario de Seguridad y Salud en el Trabajo acorde al tamaño de la organización" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox69" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox70" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox35" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="36" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Programas de Vigilancia Epidemiológica de acuerdo con el análisis de las condiciones de salud y de trabajo y a los riesgos priorizados" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox71" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox72" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox36" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="37" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Plan de Equipos de Protección Personal ( Selección y Dotación de Epp)" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox73" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox74" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox37" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="38" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Evidencias del Registro de Entrega de Equipos de Protección Personal" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox75" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox76" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox38" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="39" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Programación de Selección y Evaluador de Proveedores" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox77" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox78" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox39" runat="server"></asp:CheckBox>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<asp:Label runat="server" Text="40" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-left">
							<asp:Label runat="server" Text="Auditoria y Revisión por la Alta Dirección al SG-SST" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox79" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:TextBox ID="Textbox80" runat="server"></asp:TextBox>
						</th>
						<th class="text-center">
							<asp:CheckBox ID="Checkbox40" runat="server"></asp:CheckBox>
						</th>
					</tr>

				</tbody>
			</table>
		</div>

	</div>

	<div class="row text-center">
		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" />
			<h4>Generar Documento</h4>
		</div>
	</div>

</asp:Content>
