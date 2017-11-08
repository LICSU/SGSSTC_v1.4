<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_DescGeneralEmpresa.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_DescGeneralEmpresa" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	
	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="#">Descripción General De La Empresa</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Descripción General De La Empresa</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row text-center">
		<div class="box">

			<table class="table table-condensed" style="overflow: scroll;">
				<tbody>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label1" runat="server" Text="Nombre de la Empresa:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:Label ID="label2" runat="server" Text="---"></asp:Label>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label3" runat="server" Text="Representante Legal:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox1" MaxLength="100" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label4" runat="server" Text="Dirección:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox2" MaxLength="100" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label5" runat="server" Text="Municipio:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:Label ID="label6" runat="server" Text="---"></asp:Label>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label7" runat="server" Text="Teléfono:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox3" MaxLength="50" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label8" runat="server" Text="Teléfono Celular:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox4" MaxLength="50" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label9" runat="server" Text="Correo Electrónico:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox5" MaxLength="100" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label10" runat="server" Text="Nº de Trabajadores del área Administrativa:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<div class="col-md-6">Nº de Trabajadores</div>
							<div class="col-md-6">Puesto de Trabajo</div>
							<br />
							<br />
							<asp:Panel ID="pAreaAdm" runat="server"></asp:Panel>
							<br />

						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label11" runat="server" Text="Nº de Trabajadores del área Operativa:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<div class="col-md-6">Nº de Trabajadores</div>
							<div class="col-md-6">Puesto de Trabajo</div>
							<br />
							<br />
							<asp:Panel ID="pAreaOpe" runat="server"></asp:Panel>
							<br />
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label12" runat="server" Text="Clase de Riesgo DEC. 1607" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:DropDownList runat="server" ID="ddlNivelClase" CssClass="form-control">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="CLASE I - Riesgo mínimo" Value="1"></asp:ListItem>
								<asp:ListItem Text="CLASE II - Riesgo bajo" Value="2"></asp:ListItem>
								<asp:ListItem Text="CLASE III - Riesgo medio" Value="3"></asp:ListItem>
								<asp:ListItem Text="CLASE IV - Riesgo alto" Value="4"></asp:ListItem>
								<asp:ListItem Text="CLASE V - Riesgo máximo" Value="5"></asp:ListItem>
							</asp:DropDownList>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label13" runat="server" Text="Actividad Económica:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:Panel ID="pCodigoCiiu" runat="server"></asp:Panel>
							<br />
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label15" runat="server" Text="ARL a la que están afiliados los Trabajadores:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:DropDownList runat="server" ID="ddlArp" CssClass="form-control"></asp:DropDownList>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label16" runat="server" Text="Horario de Trabajo:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:Panel ID="pHorario" runat="server"></asp:Panel>
							<br />
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label18" runat="server" Text="Nº de Trabajadores:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:Label ID="label19" runat="server" Text="----"></asp:Label>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label21" runat="server" Text="Tipo de Material Usado En La Construcción de las Instalaciones:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox8" MaxLength="500" runat="server" class="form-control" placeholder="(indicar según aplique: ladrillo-cemento, piedra, madera, construcciones tipo invernadero, estructuras metálicas y tejados de zinc)"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label22" runat="server" Text="Número Y Tipo De Dependencias Administrativas Y Productivas de La Empresa:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox9" MaxLength="500" runat="server" class="form-control" placeholder="(Debe indicar según aplique: oficina, talleres, departamentos, servicios, unidades, secciones, etc.)"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label23" runat="server" Text="Número Y Tipo De Dependencias de Uso No Administrativo o Productivas:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox10" MaxLength="500" runat="server" class="form-control" placeholder="(Debe indicar según aplique: áreas de descanso, recreación, almacenamiento de materiales peligrosos, almacenamiento de herramientas o de suministros, depósitos etc.)"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label24" runat="server" Text="Nº de Personas en Tránsito:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox11" runat="server" class="form-control" type="number" placeholder="(El tipo y el número de personas en tránsito diario como visitantes, usuarios o clientes de algún servicio, personal vinculado a término fijo)"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label25" runat="server" Text="Las vías de acceso y evacuación por áreas y la general de la Empresa:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox12" MaxLength="500" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label26" runat="server" Text="Las salidas de Emergencia señaladas, conocidas y demarcadas:" Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox13" MaxLength="500" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
					<tr>
						<th class="col-md-4  text-left">
							<asp:Label ID="label27" runat="server" Text="La existencia o no de señalización en escaleras, ascensores, corredores, oficinas, talleres: " Font-Size="Smaller"></asp:Label>
						</th>
						<th class="col-md-8  text-left">
							<asp:TextBox ID="Textbox14" MaxLength="500" runat="server" class="form-control"></asp:TextBox>
						</th>
					</tr>
				</tbody>
			</table>


		</div>
	</div>

	<div class="row text-center">
		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnSave" runat="server" ImageUrl="~\ico\agregar.png"
				OnClick="AgregarRegistro" />
			<h4>Guardar y/o Actualizar</h4>
		</div>
	</div>

</asp:Content>
