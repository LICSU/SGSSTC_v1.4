<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_Obligacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_Obligacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="../Hacer/index_Obligaciones.aspx">Obligaciones</a></li>
		<li><a href="#">Consultar Obligación</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Consultar Obligación</h1>
	</div>

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Fecha de Entrega</h4>
			<asp:Label runat="server" ID="txtFechaEntrega" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Responsable</h4>
			<asp:Label runat="server" ID="txtResponsable" CssClass="control-label"></asp:Label>
		</div>

	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Categoria</h4>
			<asp:Label runat="server" ID="txtCategoria" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Prioridad</h4>
			<asp:Label runat="server" ID="txtPrioridad" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Frecuencia de Control</h4>
			<asp:Label runat="server" ID="txtFrecuencia" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Estatus</h4>
			<asp:Label runat="server" ID="txtEstatus" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Actividad del Plan de Trabajo</h4>
			<asp:Label runat="server" ID="txtActividad" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Descripcion</h4>
			<asp:Label runat="server" ID="txtDescripcion" CssClass="control-label"></asp:Label>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<h4>Acciones</h4>
			<asp:Label runat="server" ID="txtAcciones" CssClass="control-label"></asp:Label>
		</div>
	</div>

</asp:Content>
