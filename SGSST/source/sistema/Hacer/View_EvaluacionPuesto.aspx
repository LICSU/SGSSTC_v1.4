<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_EvaluacionPuesto.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_EvaluacionPuesto" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="../Hacer/index_EvaluacionRiesgo.aspx">Evaluación de Riesgo Laboral</a></li>
				<li><a href="#">Crear Evaluación</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Nueva Evaluación de Riesgo Laboral</h1>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Sucursal</h4>
					<asp:Label runat="server" ID="txtSucursal"></asp:Label>
				</div>

				<div class="col-md-4">
					<h4>Área</h4>
					<asp:Label runat="server" ID="txtArea"></asp:Label>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Puesto de Trabajo</h4>
					<asp:Label runat="server" ID="txtPuestos"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Descripción Puesto de Trabajo</h4>
					<asp:Label runat="server" ID="txtDescripcionPuesto"></asp:Label>
				</div>
			</div>
			<br />

			<hr />
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">Identificación del Peligro</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Tipo de Riesgo</h4>
					<asp:Label ID="txtTipoRiesgo" runat="server"></asp:Label>

				</div>
				<div class="col-md-4">
					<h4>Factor de Riesgo</h4>
					<asp:Label ID="txtFactorRiesgo" type="date" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Posibles Consecuencias</h4>
					<asp:Label ID="txtConsecuencias" runat="server"></asp:Label>
				</div>
				<div class="col-md-4">
					<h4>Tiempo de Exposición</h4>
					<asp:Label ID="txtTiempoExposicion" runat="server"></asp:Label>

				</div>
			</div>

			<hr />
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">Evaluación del Riesgo</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<h4>Medidas en la Fuente</h4>
					<asp:Label ID="txtControlFuente" runat="server"></asp:Label>
				</div>
				<div class="col-md-4">
					<h4>Medidas en el Medio</h4>
					<asp:Label ID="txtControlMedio" runat="server"></asp:Label>
				</div>
				<div class="col-md-4">
					<h4>Medidas en el Individuo</h4>
					<asp:Label ID="txtControlIndividuo" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Responsable del SGSST</h4>
					<asp:Label ID="txtResponsableSGSST" runat="server"></asp:Label>
				</div>
				<div class="col-md-4">
					<h4>Fecha de Evaluación</h4>
					<asp:Label ID="txtFechaEvaluacion" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-3 col-md-offset-2">
					<h4>Nivel de Deficiencia</h4>
					<asp:Label ID="txtNivelDeficiencia" runat="server"></asp:Label>
				</div>
				<div class="col-md-5">
					<h4 class="text-justify">Interpretación del Nivel de Deficiencia</h4>
					<asp:Label ID="txtInterpretacionNivelDeficiencia" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-3 col-md-offset-2">
					<h4>Nivel de Exposición</h4>
					<asp:Label ID="txtNivelExposicion" runat="server"></asp:Label>
				</div>
				<div class="col-md-5">
					<h4 class="text-justify">Interpretación del Nivel de Exposición</h4>
					<asp:Label ID="txtInterpretacionNivelExposicion" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-3 col-md-offset-2">
					<h4>Nivel de Probabilidad</h4>
					<asp:Label ID="txtNivelProbabilidad" runat="server"></asp:Label>
				</div>
				<div class="col-md-5">
					<h4 class="text-justify">Interpretación del Nivel de Probabilidad</h4>
					<asp:Label ID="txtInterpretacionNivelProbabilidad" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-3 col-md-offset-2">
					<h4>Nivel de Consecuencia</h4>
					<asp:Label ID="txtNivelConsecuencia" runat="server"></asp:Label>
				</div>
				<div class="col-md-5">
					<h4 class="text-justify">Interpretación del Nivel de Consecuencia</h4>
					<asp:Label ID="txtInterpretacionNivelConsecuencia" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-3 col-md-offset-2">
					<h4>Nivel de Riesgo</h4>

					<asp:Label ID="txtNivelRiesgo" runat="server"></asp:Label>
				</div>
				<div class="col-md-5">
					<h4 class="text-justify">Interpretación del Nivel de Riesgo</h4>
					<asp:Label ID="txtInterpretacionNivelRiesgo" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Aceptabilidad de Riesgo</h4>

					<asp:Label ID="txtAceptabilidadRiesgo" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<hr />
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">Criterios para Establecer Controles</h3>
				</div>
			</div>
			<br />

			<div class="row">
				<h3 class="text-center">N° Personal Expuesto</h3>
				<div class="col-md-4 col-md-offset-2">
					<h4>Planta</h4>
					<asp:Label ID="txtPlanta" runat="server"></asp:Label>
				</div>
				<div class="col-md-4">
					<h4>Contratistas</h4>
					<asp:Label ID="txtContratistas" runat="server"></asp:Label>
				</div>

			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Visitantes</h4>
					<asp:Label ID="txtVisitantes" runat="server"></asp:Label>
				</div>
				<div class="col-md-4">
					<h4>Total</h4>
					<asp:Label ID="txtTotalPersonalExpuesto" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Peor Consecuencia</h4>
					<asp:Label ID="txtPeorConsecuencia" runat="server"></asp:Label>
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">Medidas de Intervención</h3>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Eliminación</h4>
					<asp:Label ID="txtEliminación" runat="server"></asp:Label>
				</div>

				<div class="col-md-4">
					<h4>Sustitución</h4>
					<asp:Label ID="txtSustitución" runat="server"></asp:Label>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Controles de Ingeniería</h4>
					<asp:Label ID="txtIngenieria" runat="server"></asp:Label>
				</div>

				<div class="col-md-4">
					<h4>Controles Administrativos</h4>
					<asp:Label ID="txtAdministrativos" runat="server"></asp:Label>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<h4 class="text-center">Fecha de Ejecución</h4>
					<asp:Label ID="txtFechaEjecucion" runat="server"></asp:Label>
				</div>
			</div>
			<br />
			<hr />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h3 class="text-center">Equipos de Proteccion Personal del Puesto de Trabajo</h3>
				</div>

				<asp:Label ID="txtEpp" runat="server"></asp:Label>
			</div>
			<br />
			<hr />

			<!-- Boton-->
			<div class="row">
				<div class="col-md-2 col-md-offset-5">
					<asp:Button runat="server" ID="Button2" Text="Volver" class="btn btn-block btn-primary"
						OnClick="Volver"></asp:Button>
				</div>
			</div>
			<br />
			
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
