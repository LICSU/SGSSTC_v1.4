<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_Sucursal.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Create_Sucursal" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Gestión de Datos</a></li>
				<li><a href="../GestionDatos/index_Sucursal.aspx">Sucursal</a></li>
				<li><a href="#">Crear Sucursal</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Registrar Sucursal</h1>
			</div>

			<asp:PlaceHolder runat="server" ID="phEmpresaAdd" Visible="false">
				<div class="row">
					<div class="col-md-4">
						<h4 class="text-center">Empresa</h4>
						<asp:DropDownList ID="ddlEmpresaAdd"
							data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"
							runat="server" ClientIDMode="Static" CssClass="form-control"
							OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged" AutoPostBack="true">
						</asp:DropDownList>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
							ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd" />
					</div>
				</div>
			</asp:PlaceHolder>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4 class="text-center">Sucursal</h4>

					<asp:TextBox ID="txtNombreAdd" runat="server" MaxLength="50" ClientIDMode="Static"
						CssClass="form-control" placeholder="Nombre de la sucursal"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre de la Sucursal"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNombreAdd"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>

				<div class="col-md-4">
					<h4 class="text-center">Actividad Principal</h4>

					<asp:DropDownList runat="server" ID="ddlItemDivision1" CssClass="form-control"
						OnSelectedIndexChanged="ddlItemDivision1_SelectedIndexChanged" AutoPostBack="true"
						data-toggle="tooltip" data-placement="bottom" title="Seleccione la Actividad Principal">
					</asp:DropDownList>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="ddlItemDivision1" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>

			<div class="row">

				<asp:PlaceHolder runat="server" ID="phActividad2" Visible="false">
					<div class="col-md-4 col-md-offset-2">
						<h4 class="text-center">Actividad Secundaria</h4>

						<asp:DropDownList runat="server" ID="ddlItemDivision2" CssClass="form-control"
							OnSelectedIndexChanged="ddlItemDivision2_SelectedIndexChanged" AutoPostBack="true"
							data-toggle="tooltip" data-placement="bottom" title="Seleccione la Actividad Secundaria">
						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" ID="phActividad3" Visible="false">
					<div class="col-md-4">
						<h4 class="text-center">Otras Actividades</h4>

						<asp:DropDownList runat="server" ID="ddlItemDivision3" CssClass="form-control"
							data-toggle="tooltip" data-placement="bottom" title="Seleccione la Tercera Actividad">
						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4 class="text-center">Región</h4>

					<asp:DropDownList ID="ddlRegionAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
						AutoPostBack="true" OnSelectedIndexChanged="ddlRegionAdd_SelectedIndexChanged"
						data-toggle="tooltip" data-placement="bottom" title="Seleccione la Región donde esta ubicado la Sucursal">
					</asp:DropDownList>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlRegionAdd"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>

				<div class="col-md-4">
					<h4 class="text-center">Departamento</h4>

					<asp:DropDownList ID="ddlDptoAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
						AutoPostBack="true" OnSelectedIndexChanged="ddlDptoAdd_SelectedIndexChanged"
						data-toggle="tooltip" data-placement="bottom" title="Seleccione el departamento donde esta ubicado la Sucursal">
					</asp:DropDownList>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlDptoAdd"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4 class="text-center">Municipio</h4>

					<asp:DropDownList ID="ddlMcpioAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
						data-toggle="tooltip" data-placement="bottom" title="Seleccione el municipio donde esta ubicado la Sucursal">
					</asp:DropDownList>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlMcpioAdd"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>

				<div class="col-md-4">
					<h4 class="text-center">Dirección</h4>

					<asp:TextBox ID="txtDireccionAdd" MaxLength="100" runat="server" ClientIDMode="Static"
						CssClass="form-control"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese la dirección de la Sucursal"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtDireccionAdd" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4 class="text-center">Representante</h4>

					<asp:TextBox ID="txtRepresentanteAdd" MaxLength="100" runat="server" ClientIDMode="Static"
						CssClass="form-control"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre del representante de la sucursal"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtRepresentanteAdd" runat="server" ValidationGroup="ValidationAdd" />
				</div>

				<div class="col-md-4">
					<h4 class="text-center">Télefono Fijo</h4>

					<asp:TextBox ID="txtFijoAdd" MaxLength="50" TextMode="Number" runat="server" ClientIDMode="Static"
						CssClass="form-control"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese el número de teléfono fijo"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFijoAdd"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4 class="text-center">Télefono Movil</h4>

					<asp:TextBox ID="txtMovilAdd" MaxLength="50" TextMode="Number" runat="server" ClientIDMode="Static"
						CssClass="form-control"
						data-toggle="tooltip" data-placement="bottom" title="Ingrese el numero de teléfono movil"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtMovilAdd"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>

			<br />

			<div class="row text-center">
				<div class="col-md-4 col-md-offset-4">
					<asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\save.png" OnClick="GuardarRegistro"
						ValidationGroup="ValidationAdd"
						data-toggle="tooltip" data-placement="bottom" title="Presione para registrar la sucursal" />
					<h4>Registrar</h4>
				</div>
			</div>

		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger ControlID="btnGuardar" />
		</Triggers>
	</asp:UpdatePanel>

	
	<script type="text/javascript">
		window.onload = window.history.forward(0);
	</script>
</asp:Content>
