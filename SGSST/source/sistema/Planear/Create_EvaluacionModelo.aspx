<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionModelo.aspx.cs" Inherits="SGSST.source.sistema.Planear.Create_EvaluacionModelo" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EvaluacionRiesgos.aspx">Formato para modelo de procesos</a></li>
		<li><a href="#">Modelo de Proceso</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para la descripción del proceso del trabajo</h1>
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
   <div class="row">
		<div class="col-md-4 col-md-offset-2">
			<h4 class="text-center">Área</h4>
			<asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un área" class="form-control" AutoPostBack="true"
				OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
			</asp:DropDownList>

            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlArea"
					runat="server" ValidationGroup="ValidationAdd" />
		</div>
		<div class="col-md-4 ">
			<h4 class="text-center">Puesto de Trabajo</h4>
			<asp:DropDownList runat="server" ID="ddlPuesto" data-toggle="tooltip" data-placement="bottom" title="Seleccione un puesto de trabajo" class="form-control"></asp:DropDownList>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlPuesto"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>


    <div class="row">
		<div class="col-md-8 col-md-offset-2">
             <CKEditor:CKEditorControl ID="txtModelo" BasePath="/ckeditor/" runat="server">
                 <label><strong>Descripción del Proceso: </strong></label>
                 <ul>
                     <li>1. </li>
                     <li>2. </li>
                     <li>3. </li>
                     <li>4. </li>
                     <li>5. </li>
                 </ul>
                 <label><strong>Recurso Humano: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Objeto de Trabajo: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Insumos: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Máquinas/ Equipos: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Herramientas: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Emisiones Atmosféricas: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Desechos Sólidos/ Líquidos: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <label><strong>Productos: </strong></label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
             </CKEditor:CKEditorControl>
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
