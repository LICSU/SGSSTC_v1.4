<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_MedidasMatrizRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_MedidasMatrizRiesgos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_MatrizRiesgos.aspx">Matriz de Riesgos</a></li>
		<li><a href="#">Seguimiento de Medidas de la Norma</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Seguimiento de Medidas de los Riesgos</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row">
		<h2 class="text-info text-left">Tipo de Riesgo:
			<h3 class="text-left">
				<asp:Label runat="server" Text="estatus" ID="lbTipoRiesgo"></asp:Label>

			</h3>
		</h2>

		<h2 class="text-info text-left">Factor de Riesgo:
			<h3 class="text-left">
				<asp:Label runat="server" Text="estatus" ID="lbFactorRiesgo"></asp:Label>

			</h3>
		</h2>

	</div>
	<br />
	<hr />

	<div class="row">
		<div class="col-md-6">
			<h3 class="text-left">Medidas Asignadas al Riesgo</h3>
		</div>
	</div>
	<br />

	<div class="row">
		<div class="col-md-12">
			<asp:CheckBoxList ID="chkMedidas" runat="server"></asp:CheckBoxList>
		</div>
	</div>
	<br />
	<hr />

	<div class="row">
		<div class="col-md-10">
			<div class="box box-solid">
				<div class="box-header with-border">
					<h3 class="box-title">Estatus de cumplimiento del Riesgo =
							<asp:Label runat="server" Text="estatus" ID="lbestatus" />
						%</h3>
				</div>
				<div class="box-body">
					<div class="progress">
						<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <% =lbestatus.Text%>%">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />

	<div class="row">

		<div class="col-md-2 col-md-offset-5">
			<asp:Button Text="Guardar Cambios" ID="btnGuardar" runat="server" OnClick="GuardarRegistro"
				class="btn btn-block btn-info" />
		</div>

	</div>

	<br />

</asp:Content>
