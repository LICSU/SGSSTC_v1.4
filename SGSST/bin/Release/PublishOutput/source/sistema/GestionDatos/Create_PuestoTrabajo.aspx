<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_PuestoTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Create_PuestoTrabajo" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Gestión de Datos</a></li>
				<li><a href="../GestionDatos/index_PuestoTrabajo.aspx">Puesto Trabajo</a></li>
				<li><a href="#">Crear Puesto Trabajo</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Agregar Puesto de Trabajo</h1>
			</div>
			
			<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
				<div id="divAlerta" runat="server">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
				</div>
			</asp:PlaceHolder>

			<div class="row">
				<asp:PlaceHolder runat="server" ID="phEmpresa1">
					<div class="col-md-4 col-md-offset-2">
						<h4>Empresa</h4>

						<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom"
							title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true"
							OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged">
						</asp:DropDownList>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
							ControlToValidate="ddlEmpresa" runat="server" ValidationGroup="ValidationAdd" />
					</div>
				</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" ID="phSucursal1" Visible="false">
					<div class="col-md-4 col-md-offset-2">
						<h4>Sucursal</h4>
						<asp:DropDownList runat="server" ID="ddlSucursal"
							data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"
							CssClass="form-control" AutoPostBack="true"
							OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
						</asp:DropDownList>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
							runat="server" ValidationGroup="ValidationAdd" />
					</div>
				</asp:PlaceHolder>
			</div>

			<br />

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Nombre del puesto de trabajo:</h4>
					<asp:TextBox ID="txtNombre" runat="server" class="form-control"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre del Puesto de Trabajo"></asp:TextBox>
				</div>

				<div class="col-md-4">
					<h4>Area</h4>

					<asp:DropDownList runat="server" ID="ddlArea"
						data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área"
						CssClass="form-control">
					</asp:DropDownList>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlArea"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-8 col-sm-8 col-md-offset-2">
					<h4>Descripción del Proceso:</h4>
					<asp:TextBox ID="txtDescripcion" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese una breve descripción de lo que se realiza en este Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Recurso Humano: </h4>
					<asp:TextBox ID="txtRecursoHumano" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique el personal humano que hace uso del Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Objeto de Trabajo:</h4>
					<asp:TextBox ID="txtObjetoTrabajo" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique el objeto de trabajo relacionado al Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Insumos:</h4>
					<asp:TextBox ID="txtInsumos" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique los insumos que consume el Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Máquinas/Equipos:</h4>
					<asp:TextBox ID="txtMaquinas" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique la maquinaria y/o equipos que se utilizan en este Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Herramientas: </h4>
					<asp:TextBox ID="txtHerramientas" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique las herramientas que se usan en el Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Emisiones: </h4>
					<asp:TextBox ID="txtEmisiones" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique las emisiones producidas por el Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Desechos Sólidos/ Líquidos: </h4>
					<asp:TextBox ID="txtDesechos" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique los desechos generados solidos y liquidos por el Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Productos o servicios:</h4>
					<asp:TextBox ID="txtProductos" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
						data-toggle="tooltip" data-placement="bottom" title="Especifique los Productos o servicios generados por el Puesto de Trabajo"></asp:TextBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Equipos de Protección Personal</h4>
					<asp:ListBox ID="ddlEpp" runat="server" SelectionMode="Multiple" ClientIDMode="Static"
						CssClass="form-control" Rows="10"
						data-toggle="tooltip" data-placement="bottom" title="Seleccione de la lista los Equipos de Protección Personal usados por el Puesto de Trabajo"></asp:ListBox>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Soporte fotográfico</h4>
					<asp:FileUpload runat="server" ID="fuAnexo"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese imagenes y/o fotos relacionadas al Puesto de Trabajo" />
				</div>
			</div>

			<!-- aceptar -->
			<br />
			<div class="row">
				<div class="col-md-2 col-md-offset-5">
					<asp:Button runat="server" ID="btnAceptar" Text="Aceptar" OnClick="btnAceptar_Click"
						class="btn btn-block btn-info" ValidationGroup="ValidationAdd"
						data-toggle="tooltip" data-placement="bottom" title="Presione para registrar Puesto de Trabajo"></asp:Button>
				</div>
			</div>

		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger ControlID="btnAceptar" />
		</Triggers>
	</asp:UpdatePanel>
	
</asp:Content>