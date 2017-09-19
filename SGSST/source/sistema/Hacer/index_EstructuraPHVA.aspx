<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_EstructuraPHVA.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_EstructuraPHVA" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="#">Estructura PHVA</a></li>
	</ol>

	<div class="panel-group" id="accordion">

		<div class="panel panel-default">

			<!-- Evaluacion inicial-->
			<div class="panel-heading bg-teal color-palette">
				<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">EVALUACION INICIAL</a></h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">

				<div class="panel-body">
					<div class="row text-center">
						<div class="box">
							<div class="box-body no-padding">
								<table class="table table-condensed" style="overflow: scroll;">

									<tbody>

										<tr class="bg-green color-palette">
											<th class="col-md-1 text-center">N°</th>
											<th class="col-md-11  text-left">MODULO</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label1" runat="server" Text="1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label2" runat="server" Text="Documento de Autoevaluación" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label3" runat="server" Text="2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label4" runat="server" Text="Análisis de vulnerabilidad" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label5" runat="server" Text="3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label6" runat="server" Text="Descripción Sociodemográfica" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label7" runat="server" Text="4" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label8" runat="server" Text="Indicadores de la Empresa" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label9" runat="server" Text="5" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label10" runat="server" Text="Inspecciones de seguridad" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label11" runat="server" Text="6" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label12" runat="server" Text="Matriz Legal" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label13" runat="server" Text="7" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label14" runat="server" Text="Matriz de Riesgos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label15" runat="server" Text="8" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label16" runat="server" Text="Plan de Emergencias" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label17" runat="server" Text="9" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label18" runat="server" Text="Plan de trabajo anual" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label19" runat="server" Text="10" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label20" runat="server" Text="Porcentaje de cumplimiento de Capacitaciones" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label21" runat="server" Text="11" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label22" runat="server" Text="Reportes de Accidentes" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label23" runat="server" Text="12" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label24" runat="server" Text="Reportes de los trabajadores" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label25" runat="server" Text="13" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label26" runat="server" Text="Vigilancia Epidemiológica" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Planear-->
			<div class="panel-heading bg-teal color-palette">
				<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">PLANEAR</a></h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse">

				<div class="panel-body">
					<div class="row text-center">
						<div class="box">
							<div class="box-body no-padding">
								<table class="table table-condensed" style="overflow: scroll;">

									<tbody>

										<tr class="bg-green color-palette">
											<th class="col-md-1 text-center">N°</th>
											<th class="col-md-11  text-left">MODULO</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label27" runat="server" Text="1"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label28" runat="server" Text="Liderazgo y compromiso"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label29" runat="server" Text="1.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label30" runat="server" Text="Política SST" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label31" runat="server" Text="1.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label32" runat="server" Text="Encuesta de Conocimiento de la Política de SST" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label33" runat="server" Text="1.3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label34" runat="server" Text="Encuesta de Conocimiento de los Objetivos de SST" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label35" runat="server" Text="1.4" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label36" runat="server" Text="Indicadores definidos por la Empresa" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label37" runat="server" Text="1.5" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label38" runat="server" Text="Recursos Económicos aprobados por la Gerencia" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label39" runat="server" Text="1.6" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label40" runat="server" Text="Acta de Reunión de Copasst" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label41" runat="server" Text="2"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label42" runat="server" Text="Administración de la Documentación"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label43" runat="server" Text="2.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label44" runat="server" Text="Control de Documentos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label45" runat="server" Text="2.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label46" runat="server" Text="Mecanismos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label47" runat="server" Text="3"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label48" runat="server" Text="Funciones, responsabilidades y competencias"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label49" runat="server" Text="3.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label50" runat="server" Text="Matriz de Responsabilidades y competencias" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label51" runat="server" Text="3.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label52" runat="server" Text="Evaluación del desempeño" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label53" runat="server" Text="4"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label54" runat="server" Text="Capacitación y entrenamiento"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label55" runat="server" Text="4.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label56" runat="server" Text="Plan de Capacitación, Matriz de Capacitación" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label57" runat="server" Text="4.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label58" runat="server" Text="Programa de Inducción y reinducción" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label59" runat="server" Text="5"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label60" runat="server" Text="Identificación de peligros"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label61" runat="server" Text="5.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label62" runat="server" Text="Metodología para la identificación de riesgos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label63" runat="server" Text="5.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label64" runat="server" Text="Matriz de Riesgos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label65" runat="server" Text="6"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label66" runat="server" Text="Requisitos Legales"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label67" runat="server" Text="6.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label68" runat="server" Text="Matriz Legal" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label69" runat="server" Text="6.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label70" runat="server" Text="Reglamento Higiene y Salud" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>



									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Hacer-->
			<div class="panel-heading bg-teal color-palette">
				<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">HACER</a></h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">

				<div class="panel-body">
					<div class="row text-center">
						<div class="box">
							<div class="box-body no-padding">
								<table class="table table-condensed" style="overflow: scroll;">

									<tbody>

										<tr class="bg-green color-palette">
											<th class="col-md-1 text-center">N°</th>
											<th class="col-md-11  text-left">MODULO</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label71" runat="server" Text="1"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label72" runat="server" Text="Control Operacional"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label73" runat="server" Text="1.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label74" runat="server" Text="Procedimientos operativos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label75" runat="server" Text="2"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label76" runat="server" Text="Seguridad y Salud en el Trabajo"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label77" runat="server" Text="2.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label78" runat="server" Text="Plan Anual de Trabajo" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label79" runat="server" Text="2.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label80" runat="server" Text="Programa de Inspecciones" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label81" runat="server" Text="2.3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label82" runat="server" Text="Programa EPP" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label83" runat="server" Text="2.4" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label84" runat="server" Text="Inventario EPP" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label85" runat="server" Text="2.5" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label86" runat="server" Text="Planilla Entrega de Epp" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label87" runat="server" Text="2.6" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label88" runat="server" Text="Inspección para el Control y uso de EPP" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label89" runat="server" Text="2.7" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label90" runat="server" Text="Señalización" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label91" runat="server" Text="2.8" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label92" runat="server" Text="Programa de Vigilancia Epidemiológica" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label93" runat="server" Text="2.9" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label94" runat="server" Text="Vigilancia Epidemiológica" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label95" runat="server" Text="2.10" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label96" runat="server" Text="Riesgos" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label97" runat="server" Text="3"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label98" runat="server" Text="Comunicación, Participación y Consulta"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label99" runat="server" Text="3.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label100" runat="server" Text="Plan de Comunicaciones" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label101" runat="server" Text="3.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label102" runat="server" Text="Programa de motivación en SST" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label103" runat="server" Text="4"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label104" runat="server" Text="Prevención y respuesta ante emergencias"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label105" runat="server" Text="4.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label106" runat="server" Text="Plan de prevención" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label107" runat="server" Text="4.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label108" runat="server" Text="Plan de ayuda mutua" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label109" runat="server" Text="4.3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label110" runat="server" Text="Programa de simulacros" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label111" runat="server" Text="4.4" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label112" runat="server" Text="Brigadas de emergencia" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label113" runat="server" Text="5"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label114" runat="server" Text="Gestión del cambio"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label115" runat="server" Text="5.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label116" runat="server" Text="Programa del gestión del cambio" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label117" runat="server" Text="6"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label118" runat="server" Text="Adquisiciones"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label119" runat="server" Text="6.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label120" runat="server" Text="Programa de selección y evaluación de proveedores" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label121" runat="server" Text="7"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label122" runat="server" Text="Administración de contratistas"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label123" runat="server" Text="7.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label124" runat="server" Text="Manual de contratistas y proveedores" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label125" runat="server" Text="8"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label126" runat="server" Text="Obligaciones"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label127" runat="server" Text="9"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label128" runat="server" Text="Alarmas"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label129" runat="server" Text="10"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label130" runat="server" Text="Exámenes Laborales"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label131" runat="server" Text="11"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label132" runat="server" Text="Gestiones Laborales"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label133" runat="server" Text="12"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label134" runat="server" Text="Mapa de Riesgos"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label135" runat="server" Text="13"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label136" runat="server" Text="Gestión de Datos"></asp:Label>
											</th>
										</tr>



									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Verificar-->
			<div class="panel-heading bg-teal color-palette">
				<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">VERIFICAR</a></h4>
			</div>
			<div id="collapse4" class="panel-collapse collapse">

				<div class="panel-body">
					<div class="row text-center">
						<div class="box">
							<div class="box-body no-padding">
								<table class="table table-condensed" style="overflow: scroll;">

									<tbody>

										<tr class="bg-green color-palette">
											<th class="col-md-1 text-center">N°</th>
											<th class="col-md-11  text-left">MODULO</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label137" runat="server" Text="1"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label138" runat="server" Text="Auditoria de cumplimiento del SGSST"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label139" runat="server" Text="1.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label140" runat="server" Text="Programa de auditoria" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label141" runat="server" Text="1.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label142" runat="server" Text="Planificación" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label143" runat="server" Text="2"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label144" runat="server" Text="Revisión por la alta dirección"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label145" runat="server" Text="2.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label146" runat="server" Text="Comité de la alta dirección" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label147" runat="server" Text="3"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label148" runat="server" Text="Investigación de Incidentes Accidentes y Enfermedades Laborales"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label149" runat="server" Text="3.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label150" runat="server" Text="Procedimiento de investigación de Accidentes e Incidentes" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label151" runat="server" Text="3.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label152" runat="server" Text="Accidentes Laborales" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label153" runat="server" Text="3.3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label154" runat="server" Text="Incidentes Laborales" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label155" runat="server" Text="3.4" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label156" runat="server" Text="Lecciones aprendidas" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label157" runat="server" Text="4"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label158" runat="server" Text="Registro de Transacciones"></asp:Label>
											</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Actuar-->
			<div class="panel-heading bg-teal color-palette">
				<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">ACTUAR</a></h4>
			</div>
			<div id="collapse5" class="panel-collapse collapse">

				<div class="panel-body">
					<div class="row text-center">
						<div class="box">
							<div class="box-body no-padding">
								<table class="table table-condensed" style="overflow: scroll;">

									<tbody>

										<tr class="bg-green color-palette">
											<th class="col-md-1 text-center">N°</th>
											<th class="col-md-11  text-left">MODULO</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label159" runat="server" Text="1"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label160" runat="server" Text="Acciones correctivas y preventivas"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label161" runat="server" Text="1.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label162" runat="server" Text="Instructivo para las acciones preventivas y correctivas" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>

										<tr>
											<th class="text-center">
												<asp:Label ID="label163" runat="server" Text="1.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label164" runat="server" Text="Análisis de causalidad" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label165" runat="server" Text="1.3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label166" runat="server" Text="Formato de acciones preventivas y acciones correctivas" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label167" runat="server" Text="2"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label168" runat="server" Text="Mejora continua"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label169" runat="server" Text="2.1" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label170" runat="server" Text="Revisión de las acciones correctivas o preventivas" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label171" runat="server" Text="2.2" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label172" runat="server" Text="Comunicación de resultados de las acciones preventivas" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
										<tr>
											<th class="text-center">
												<asp:Label ID="label173" runat="server" Text="2.3" Font-Size="Smaller"></asp:Label>
											</th>
											<th class="text-left">
												<asp:Label ID="label174" runat="server" Text="omunicación de resultados de las acciones correctivas" Font-Size="Smaller"></asp:Label>
											</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<div class="row text-center">
		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
				OnClick="GenerarDocumento" />
			<h4>Generar Documento</h4>
		</div>
	</div>

</asp:Content>
