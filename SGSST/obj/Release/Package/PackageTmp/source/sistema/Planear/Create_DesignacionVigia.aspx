<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_DesignacionVigia.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_DesignacionVigia" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
		<li><a href="#">Crear Designación Vigia</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Acta de designación del Vigía en Seguridad y Salud en el Trabajo</h1>
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

	<hr />

	<div class="row">
		<div class="col-md-8 col-md-offset-2">

			<div class="col-md-12">
				<h3>En cumplimiento a lo establecido en el Decreto 1072 del 2015, se designa como Vigía en Seguridad y 
					Salud en el Trabajo a:</h3>
			</div>
			
			<div class="col-md-12">
				<asp:TextBox ID="txtVigia" runat="server" ClientIDMode="Static" CssClass="form-control" 
					placeholder="(indique nombre del vigía, y el cargo)"></asp:TextBox>
			</div>

			<div class="col-md-12">
				<h3>
				En virtud a lo anterior, el referido actuará como vigía en Seguridad y Salud en el Trabajo por el 
				término de 2 años de conformidad con el Decreto 1295 de 1994, período durante el cual el empleador 
				se obliga a facilitar el tiempo necesario dentro de la jornada laboral para que realice sus
				respectivas funciones.

				</h3>
			</div>

			<div class="col-md-5">
				<h3>La presente se firma el</h3>
			</div>
			<div class="col-md-3">
				<br />
				<asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" type="date"></asp:TextBox>
			</div>

			<div class="col-md-12">
				<h3>, con la aprobación de los trabajadores que integran la organización:</h3>
			</div>


			<div class="row">
				<div class="col-md-12">
					<asp:Panel runat="server" ID="pnDatos">
						<table class="table table-condensed">
							<tbody>
								<tr class="bg-aqua color-palette">
									<th class="col-md-1 text-center">N°</th>
									<th class="col-md-6 text-center">Nombre</th>
									<th class="col-md-5 text-center">Cargo</th>
								</tr>

								<tr>
									<td>1</td>
									<td>
										<asp:TextBox ID="Textbox1" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox2" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>
										<asp:TextBox ID="Textbox3" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox4" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>
										<asp:TextBox ID="Textbox5" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox6" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>
										<asp:TextBox ID="Textbox7" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox8" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>
										<asp:TextBox ID="Textbox9" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox10" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>
										<asp:TextBox ID="Textbox11" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox12" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>
										<asp:TextBox ID="Textbox13" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox14" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td>
										<asp:TextBox ID="Textbox15" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox16" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td>9</td>
									<td>
										<asp:TextBox ID="Textbox17" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
									<td>
										<asp:TextBox ID="Textbox18" CssClass="form-control" runat="server"></asp:TextBox>
									</td>
								</tr>

							</tbody>
						</table>

					</asp:Panel>
				</div>
			</div>
		</div>
	</div>

	<div class="row text-center">

		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
				OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
			<h4>Generar Documento</h4>
		</div>

	</div>

</asp:Content>
