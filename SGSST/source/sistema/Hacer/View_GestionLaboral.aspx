<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_GestionLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_GestionLaboral" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="zonaPrint">

		<script>
			function imprimir() {
				w = window.open();
				w.document.write($('#zonaPrint').html());
				w.print();
				w.close();
			}
		</script>

		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="../Hacer/index_GestionLaboral.aspx">Gestión Laboral</a></li>
			<li><a href="#">Consultar Gestión Laboral</a></li>
		</ol>

		<div class="page-header">
			<h1 class="text-center">Consultar Gestión Laboral</h1>
		</div>

		<div class="row">
			<div class="col-md-4">
				<h3>Empresa: </h3>
			</div>
			<div class="col-md-8 text-left">
				<br />
				<h4>
					<asp:Label runat="server" Text="lbEmpresa" ID="lbEmpresa"></asp:Label>
				</h4>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<h3>Fecha: </h3>
			</div>
			<div class="col-md-8 text-left">
				<br />
				<h4>
					<asp:Label runat="server" Text="lbEmpresa" ID="lbFecha"></asp:Label>
				</h4>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<h3>Descripción: </h3>
			</div>
			<div class="col-md-8 text-left">
				<br />
				<h4>
					<asp:Label runat="server" Text="lbEmpresa" ID="lbDesc"></asp:Label>
				</h4>
			</div>
		</div>

		<asp:PlaceHolder runat="server" ID="phCapacitacion" Visible="false">
			<div class="row">
				<div class="col-md-4 text-left">
					<h3>Objetivo de la Capacitación: </h3>
				</div>
				<div class="col-md-8 text-left">
					<br />
					<h4>
						<asp:Label runat="server" Text="lbEmpresa" ID="lbObj"></asp:Label></h4>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 text-left">
					<h3>Cantidad de Horas: </h3>
				</div>
				<div class="col-md-8 text-left">
					<br />
					<h4>
						<asp:Label runat="server" Text="lbEmpresa" ID="lbHoras"></asp:Label></h4>
				</div>
			</div>
		</asp:PlaceHolder>

		<div class="row">
			<div class="col-md-4">
				<h3>Responsable: </h3>
			</div>
			<div class="col-md-8 text-left">
				<br />
				<h4>
					<asp:Label runat="server" Text="lbEmpresa" ID="lbResponsable"></asp:Label>
				</h4>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<h3>Soporte: </h3>
			</div>
			<div class="col-md-8 text-left">
				<br />
				<h4>
					<asp:HyperLink runat="server" ID="hpSoporte">Soporte</asp:HyperLink>
				</h4>
			</div>
		</div>
		<hr />

		<div class="row">
			<h3 class="col-md-12 text-info text-center">Lista de Trabajadores que Asistiran a la Gestión</h3>
		</div>
		<br />

		<!-- campos lista -->
		<asp:Panel ID="pListaTrab" runat="server"></asp:Panel>
		<br />


	</div>
</asp:Content>
