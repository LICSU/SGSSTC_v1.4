<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_Accidente.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.View_Accidente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="../Hacer/index_AccidenteLaboral.aspx">Accidentes Laborales</a></li>
				<li><a href="#">Consultar Accidente Laboral</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Consultar Accidente Laboral</h1>
			</div>

			<div class="row">

				<div class="col-md-10 col-md-offset-1">
					<div class="row">
						<asp:PlaceHolder runat="server" ID="phEmpresa">
							<div class="col-md-4">
								<h4>Empresa</h4>
								<asp:Label ID="lbEmpresa" runat="server" Text="Label"></asp:Label>
							</div>
						</asp:PlaceHolder>

						<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
							<h3>Sucursal</h3>
							<div class="col-md-4">
								<asp:Label ID="lbSucursal" runat="server" Text="Label"></asp:Label>
							</div>
						</asp:PlaceHolder>
					</div>

					<br />

					<!-- Información del Accidente -->
					<div class="row">
						<h3>Información del Accidente</h3>

						<div class="col-md-4">
							<h4>Fecha del Accidente</h4>
							<asp:Label ID="txtFechaAcc" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-4">
							<h4>Hora del Accidente</h4>
							<asp:Label ID="txtHoraAcc" runat="server" Text="Label"></asp:Label>
						</div>

					</div>
					<br />

					<!-- Información de la Persona Afectada-->
					<div class="row">
						<h3>Información de la Persona Afectada</h3>

						<div class="col-md-4">
							<h4>Trabajador</h4>
							<asp:Label ID="lbTrabajador" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-4">
							<h4>Area</h4>
							<asp:Label ID="lbArea" runat="server" Text="Label"></asp:Label>

						</div>

						<div class="col-md-4">
							<h4>Puesto de Trabajo</h4>
							<asp:Label ID="lbPuestoTrabajo" runat="server" Text="Label"></asp:Label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<h4>Sitio donde se presentó el caso.</h4>
							<asp:Label ID="txtSitioAccidente" runat="server" Text="Label"></asp:Label>
						</div>
						<div class="col-md-6">
							<h4>Breve descripción de los hechos</h4>
							<asp:Label ID="txtDescTarea" runat="server" Text="Label"></asp:Label>
						</div>
					</div>
					<br />

					<!-- CondicionesInseguras-->
					<div class="row">
						<h3>CAUSAS INMEDIATAS - Condiciones Inseguras</h3>
						<div class="col-md-12">
							<asp:Label ID="txtCondIns" runat="server" Text="Label"></asp:Label>
						</div>
					</div>

					<!-- Actos Inseguros-->
					<div class="row">
						<h3>CAUSAS INMEDIATAS - Actos Inseguros</h3>
						<div class="col-md-12">
							<asp:Label ID="txtActos" runat="server" Text="Label"></asp:Label>
						</div>
					</div>

					<!-- Factores del Trabajo -->
					<div class="row">
						<h3>CAUSAS BÁSICAS - Factores del Trabajo</h3>
						<div class="col-md-12">
							<asp:Label ID="txtFacTrab" runat="server" Text="Label"></asp:Label>
						</div>
					</div>

					<!-- Factores Personales -->
					<div class="row">
						<h3>CAUSAS BÁSICAS - Factores Personales</h3>
						<div class="col-md-12">
							<asp:Label ID="txtFactPersonales" runat="server" Text="Label"></asp:Label>
						</div>
					</div>
					<br />


					<!-- Magnitud del evento -->
					<div class="row">
						<h3>Magnitud del Evento</h3>

						<div class="col-md-3">
							<h5>Fecha de Muerte (Si la Hubiere)</h5>
							<asp:Label ID="txtFechaMuerte" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-3">
							<h5>Días de incapacidad.</h5>
							<asp:Label ID="txtDiasIncapacidad" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-3">
							<h5>Días cargados.</h5>
							<asp:Label ID="txtDiasCargados" runat="server" Text="Label"></asp:Label>
						</div>
					</div>
					<br />

					<div class="row">
						<div class="col-md-3">
							<h5>Días perdidos por ausencia del trabajo.</h5>
							<asp:Label ID="txtDiasPerdidosAusTrab" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-3">
							<h5>Días perdidos por actividad restringida.</h5>
							<asp:Label ID="txtDiasPerdidosctRest" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-3">
							<h5>Sin Tiempo Perdido.</h5>
							<asp:Label ID="chkSinDias" runat="server" Text="Label"></asp:Label>
						</div>

						<div class="col-md-3">
							<h5>Tipo de enfermedad </h5>
							<asp:Label ID="lbTipoEnfermedad" runat="server" Text="Label"></asp:Label>
						</div>

					</div>
					<br />

					<!-- Anexos-->
					<div class="row">
						<h3>Soportes fotográficos</h3>
						<div class="col-md-6">
							<asp:Panel ID="pSoportes" runat="server"></asp:Panel>
						</div>
					</div>
				</div>
			</div>

		</ContentTemplate>
		<Triggers></Triggers>
	</asp:UpdatePanel>

</asp:Content>
