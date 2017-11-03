<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ConformacionCopasst.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ConformacionCopasst" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
		<li><a href="#">Crear Conformación Copasst</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Acta de conformación del comité paritario de seguridad y salud en el trabajo o vigía de seguridad y salud en el trabajo</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row">
		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
				</asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
			<div class="col-md-4 col-md-offset-4">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>
	<br />

	<br />

	<div class="row col-md-offset-2">

		<div class="row">
			<div class="col-md-4">
				<h3>Empresa: </h3>
				<asp:Label runat="server" ID="txtEmpresa" CssClass="control-label" Text="Nombre Empresa"></asp:Label>

			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<h3>Período: </h3>
				<asp:TextBox ID="txtPeriodo" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox1"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-9">
			<table>
				<tr>
					<td class="col-md-8">
						<h3>El día :</h3>
					</td>
					<td class="col-md-4">
						<asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" type="date"></asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
							ControlToValidate="txtFecha" runat="server" ValidationGroup="ValidationAdd" />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<h3>Se eligió el Comité Paritario de Seguridad y Salud en el Trabajo o el vigía de seguridad y 
								salud en el trabajo dando así cumplimiento a las exigencias de la Resolución  2013 de 1986, 
								al Decreto 1295 de 1994 y a la División de Salud Ocupacional del Ministerio de Protección 
								Social.
						</h3>
					</td>
				</tr>
				<tr>
					<td class="col-md-8">
						<h3>La modalidad utilizada para su elección fue </h3>
					</td>
					<td class="col-md-4">
						<h3>
							<asp:TextBox ID="txtModalidad" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="txtModalidad" runat="server" ValidationGroup="ValidationAdd" />
						</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<h3>Resultaron elegidos:</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<asp:TextBox ID="Textbox1" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<asp:TextBox ID="Textbox2" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<asp:TextBox ID="Textbox3" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<asp:TextBox ID="Textbox4" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<asp:TextBox ID="Textbox5" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td class="col-md-8">
						<h3>El número de votos obtenidos fue:</h3>
					</td>
					<td class="col-md-4">
						<asp:TextBox ID="Textbox6" runat="server" ClientIDMode="Static" CssClass="form-control"
							type="number" step="0.01" min="0"></asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
							ControlToValidate="Textbox6" runat="server" ValidationGroup="ValidationAdd" />
					</td>
				</tr>
				<tr>
					<td class="col-md-8">
						<h3>El representante legal de la empresa designa a </h3>
					</td>
					<td class="col-md-4">
						<asp:TextBox ID="Textbox7" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
							ControlToValidate="Textbox7" runat="server" ValidationGroup="ValidationAdd" />
					</td>
				</tr>
				<tr>
					<td class="col-md-8">
						<h3>Como presidente del comité y por votación del comité se nombra a:</h3>
					</td>
					<td class="col-md-4">
						<asp:TextBox ID="Textbox8" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
							ControlToValidate="Textbox8" runat="server" ValidationGroup="ValidationAdd" />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="col-md-11">
						<h3>Como secretario (a) del mismo.</h3>
					</td>
				</tr>
			</table>
		</div>
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
