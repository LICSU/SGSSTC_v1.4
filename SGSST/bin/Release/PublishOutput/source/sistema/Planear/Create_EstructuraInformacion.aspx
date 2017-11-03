<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EstructuraInformacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_EstructuraInformacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EstructuraRiesgos.aspx">Formato para la identificación de riesgos</a></li>
		<li><a href="#">Información</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para la identificación de riesgos durante el recorrido en las instalaciones</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row">
		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4 col-md-offset-2">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
				</asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
			<div class="col-md-4 ">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>
	<br />
    <div class="row form-group">
		<div class="col-md-4 col-md-offset-2">
			<h4 class="text-center">Área</h4>
			<asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true"
				OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
			</asp:DropDownList>
		</div>

		<div class="col-md-4">
			<h4 class="text-center">Puesto de Trabajo</h4>
			<asp:DropDownList runat="server" ID="ddlPuesto" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Puesto de Trabajo" class="form-control" AutoPostBack="true"
				OnSelectedIndexChanged="ddlPuesto_SelectedIndexChanged"></asp:DropDownList>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>



	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<h3>Trabajador: </h3>
			<asp:DropDownList runat="server" ID="ddlTrabajador" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Trabajador" class="form-control"></asp:DropDownList>

		</div>
	</div>

	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Materia Prima/ Maquinas/ Equipos/Herramientas: </h3>
			<asp:TextBox ID="txtMateriaPrima" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtMateriaPrima"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Procedimientos Existentes (secuencia de operaciones): </h3>
			<asp:TextBox ID="txtProcedimientos" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtProcedimientos"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Productos Elaborados: </h3>
			<asp:TextBox ID="txtProductos" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtProductos"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Emisiones atmosféricas/Desechos Líquidos/ sólidos: </h3>
			<asp:TextBox ID="txtEmisiones" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtEmisiones"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Sustancias Empleadas: </h3>
			<asp:TextBox ID="txtSustancias" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtSustancias"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Accidentes ocurridos en el puesto de trabajo: </h3>
			<asp:TextBox ID="txtAccidentes" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtAccidentes"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Enfermedades o molestias de posible origen laboral: </h3>
			<asp:TextBox ID="txtEnfermedades" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtEnfermedades"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row text-center">

		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
				OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
			<h4>Generar Documento</h4>
		</div>

	</div>





</asp:Content>
