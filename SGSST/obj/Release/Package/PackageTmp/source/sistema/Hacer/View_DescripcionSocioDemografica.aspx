<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_DescripcionSocioDemografica.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_DescripcionSocioDemografica" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35"	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="../Hacer/index_DescripcionSocioDemografica.aspx">Descripción SocioDemografica</a></li>
		<li><a href="#">Consultar Descripción SocioDemografica</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Consultar Descripción SocioDemografica</h1>
	</div>

	<div class="row">

		<div class="col-md-12">
			<div class="col-md-6">
				<h4>Trabajador</h4>
				<asp:Label runat="server" ID="ddlTrabajador" CssClass="control-label"></asp:Label>
				<hr />
			</div>
			<div class="col-md-6">
				<h4>Lugar de Nacimiento</h4>
				<asp:Label runat="server" ID="txtLugar" CssClass="form-label" placeholder="Lugar de Nacimiento"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6">
				<h4>Nivel de escolaridad</h4>
				<asp:Label runat="server" placeholder="Nivel Escolar" ID="txtNivel" CssClass="form-label"></asp:Label>
				<hr />
			</div>
			<asp:PlaceHolder runat="server" ID="phAñosApr" Visible="false">
				<div class="col-md-6 text-left">
					<h4>Años aprobados en ese último nivel</h4>
					<asp:Label runat="server" ID="txtAnhosApro" CssClass="form-label" placeholder="Años Aprobados"></asp:Label>
					<hr />
				</div>
			</asp:PlaceHolder>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>¡Es cabeza de familia!</h4>
				<asp:Label runat="server" ID="lblCabeza" CssClass="control-label"></asp:Label>
				<hr />
			</div>
			<div class="col-md-6 text-left">
				<h4>Cantidad de hijos</h4>
				<asp:Label runat="server" ID="lblHijos" CssClass="control-label"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>¿Reparte la responsabilidad económica de su familia?</h4>
				<asp:Label runat="server" ID="lblResponsabilidad" CssClass="control-label"></asp:Label>
				<hr />
			</div>

			<div class="col-md-6 text-left">
				<h4>¿Cuantos menores dependen económicamente de ud?</h4>
				<asp:Label runat="server" ID="lblMenores" CssClass="control-label"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>¿Socialmente en que condición se encuentra usted?</h4>
				<asp:Label runat="server" ID="lblCondicion" CssClass="control-label"></asp:Label>
				<hr />
			</div>

			<asp:PlaceHolder runat="server" ID="phMotivoD" Visible="false">
				<div class="col-md-6 text-left">
					<h4>En caso de ser desplazado, ¿Cual fue el motivo del desplazamiento?</h4>
					<asp:Label runat="server" ID="lblMotivo" CssClass="control-label"></asp:Label><hr />
				</div>
			</asp:PlaceHolder>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>La vivienda donde habita es:</h4>
				<asp:Label runat="server" ID="lblVivienda" CssClass="control-label"></asp:Label>
				<hr />
			</div>

			<div class="col-md-6 text-left">
				<h4>Servicios públicos cuenta su vivienda</h4>
				<asp:Label runat="server" ID="lblServicios" CssClass="control-label"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>Su vivienda es:</h4>
				<asp:Label runat="server" ID="lblVivienda2" CssClass="control-label"></asp:Label>
				<hr />
			</div>
			<div class="col-md-6 text-left">
				<h4>Esta Cerca de Industrias</h4>
				<asp:Label runat="server" ID="lblIndustrias" CssClass="control-label"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>Hay mucho ruido:</h4>
				<asp:Label runat="server" ID="lblRuido" CssClass="control-label"></asp:Label>
				<hr />
			</div>

			<div class="col-md-6 text-left">
				<h4>Hay Mucha Contaminación</h4>
				<asp:Label runat="server" ID="lblContaminacion" CssClass="control-label"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>Describa el techo, paredes y piso:</h4>
				<asp:Label runat="server" ID="lblDescripcion" CssClass="control-label"></asp:Label>
				<hr />
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>Se encuentra afiliado al sistema de seguridad social en salud</h4>
				<asp:Label runat="server" ID="lblSistema" CssClass="control-label"></asp:Label>
				<hr />
			</div>

			<asp:PlaceHolder runat="server" ID="phRegimen" Visible="false">
				<div class="col-md-6 text-left">
					<h4>Régimen de Afiliación</h4>
					<asp:Label runat="server" ID="lblRegimen" CssClass="control-label"></asp:Label><hr />
				</div>
			</asp:PlaceHolder>
		</div>

		<div class="col-md-12">
			<asp:PlaceHolder runat="server" ID="phNivel" Visible="false">
				<div class="col-md-6 text-left">
					<h4>Nivel de SISBEN
					</h4>
					<asp:Label runat="server" ID="lblNivel" CssClass="control-label"></asp:Label><hr />
				</div>
			</asp:PlaceHolder>

			<asp:PlaceHolder runat="server" ID="phEps" Visible="false">
				<div class="col-md-6 text-left">
					<h4>EPS</h4>
					<asp:Label runat="server" ID="txtEps" CssClass="control-label" placeholder="EPS"></asp:Label><hr />
				</div>
			</asp:PlaceHolder>
		</div>

		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>Se encuentra afiliado al sistema de seguridad social en pensiones</h4>
				<asp:Label runat="server" ID="lblPensiones" CssClass="control-label" placeholder="EPS"></asp:Label>
				<hr />
			</div>

			<asp:PlaceHolder runat="server" ID="phFondo" Visible="false">
				<div class="col-md-6 text-left">
					<h4>Fondo</h4>
					<asp:Label runat="server" ID="txtFondo" CssClass="control-label" placeholder="Fondo"></asp:Label><hr />
				</div>
			</asp:PlaceHolder>
		</div>


		<div class="col-md-12">
			<div class="col-md-6 text-left">
				<h4>Estrato que registran sus facturas de los servicios públicos de la vivienda donde reside</h4>
				<asp:Label runat="server" ID="lblEstrato" CssClass="control-label" placeholder="EPS"></asp:Label>
				<hr />
			</div>
		</div>

		<asp:PlaceHolder runat="server" ID="phEmpleos" Visible="false">
			<div class="col-md-12 text-left">
				<h4>18) Empleos Anteriores</h4>
			</div>
			<div class="col-md-12">
				<asp:Table runat="server" ID="tblEmpleos" CssClass="table">
					<asp:TableRow runat="server" ID="row1">
						<asp:TableCell Text="Empresa"></asp:TableCell>
						<asp:TableCell Text="Área"></asp:TableCell>
						<asp:TableCell Text="Cargo u Oficio"></asp:TableCell>
						<asp:TableCell Text="Años"></asp:TableCell>
						<asp:TableCell Text="Meses"></asp:TableCell>
						<asp:TableCell Text="Enfermedades adquiridas en el cargo Ninguna/Nombre Enfermedad"></asp:TableCell>
					</asp:TableRow>
					<asp:TableRow runat="server" ID="TableRow1" Visible="false">
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtEmpresa1" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtArea1" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtCargo1" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtAños1" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtMeses1" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtEnfermadades1" CssClass="form-control"></asp:TextBox></asp:TableCell>
					</asp:TableRow>
					<asp:TableRow runat="server" ID="TableRow2" Visible="false">
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtEmpresa2" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtArea2" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtCargo2" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtAños2" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtMeses2" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtEnfermadades2" CssClass="form-control"></asp:TextBox></asp:TableCell>
					</asp:TableRow>
					<asp:TableRow runat="server" ID="TableRow3" Visible="false">
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtEmpresa3" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtArea3" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtCargo3" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtAños3" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtMeses3" CssClass="form-control"></asp:TextBox></asp:TableCell>
						<asp:TableCell>
							<asp:TextBox runat="server" ID="txtEnfermadades3" CssClass="form-control"></asp:TextBox></asp:TableCell>
					</asp:TableRow>
				</asp:Table>
			</div>
		</asp:PlaceHolder>

	</div>

</asp:Content>
