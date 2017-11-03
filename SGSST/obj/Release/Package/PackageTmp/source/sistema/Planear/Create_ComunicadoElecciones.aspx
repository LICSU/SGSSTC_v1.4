<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ComunicadoElecciones.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ComunicadoElecciones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral,  PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
		<li><a href="#">Crear Comunicado de Elecciones</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Comunicado de Elecciones</h1>
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

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>Fecha:</h4>
		</div>
		<div class="col-md-3">
			<asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" type="date"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFecha"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row  col-md-offset-2">
		<div class="col-md-2">
			<h4>Dirigido a:</h4>
		</div>
		<div class="col-md-6">
			<asp:TextBox ID="txtDirigido" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtDirigido"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>De:</h4>
		</div>
		<div class="col-md-6">
			<asp:TextBox ID="txtDe" runat="server" ClientIDMode="Static" CssClass="form-control"
				placeholder="(Gerencia General, Dirección de RRHH, etc.)"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtDe"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>Asunto:</h4>
		</div>
		<div class="col-md-6">
			<p>
				Elección de candidatos en representación de los trabajadores para la conformación del Comité Paritario de Seguridad y Salud en el Trabajo con vigencia del año
			</p>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>Del Año:</h4>
		</div>
		<div class="col-md-2">
			<asp:TextBox ID="txtAnho1" placeholder="2000" min="2000" max="2100" runat="server" ClientIDMode="Static"
				CssClass="form-control" type="number" step="0.01" Width="100"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtAnho1"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>

		<div class="col-md-2">
			<h4>Al Año:</h4>
		</div>
		<div class="col-md-2">
			<asp:TextBox ID="txtAnho2" placeholder="2001" min="2000" max="2100" runat="server" ClientIDMode="Static"
				CssClass="form-control" type="number" step="0.01" Width="100"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtAnho2"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-8 text-justify">
			<h4>
				<asp:Label runat="server" ID="txtEmpresa" CssClass="control-label" Text="Nombre Empresa"></asp:Label>
				Dando cumplimiento a la legislación laboral relacionada con la conformación del Comité Paritario de Seguridad y Salud en el Trabajo, convoca a la inscripción de los:
			</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-3">
			<h4>N° de Trabajadores:</h4>
		</div>
		<div class="col-md-5">
			<h4>
				<asp:TextBox ID="txtNumTrab" runat="server" ClientIDMode="Static" CssClass="form-control"
					type="number" step="0.01" min="0" placeholder="(N° de trabajadores según resolución 2013 de 1986)"></asp:TextBox>
				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNumTrab"
					runat="server" ValidationGroup="ValidationAdd" />

			</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-8">
			<h4>candidatos con sus respectivos suplentes en representación de los trabajadores.
				<br />
				La hoja de inscripción de candidatos debe reclamarse en la oficina de:
			</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-4">
			<h4>Contacto de salud ocupacional:</h4>
		</div>
		<div class="col-md-4">
			<h4>
				<asp:TextBox ID="txtContacto" runat="server" ClientIDMode="Static" CssClass="form-control"
					placeholder="(contacto de salud ocupacional)"></asp:TextBox>
				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtContacto"
					runat="server" ValidationGroup="ValidationAdd" />

			</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-5">
			<h4>hasta el día
				<br />
				Máximo dos días hábiles:
			</h4>
		</div>
		<div class="col-md-3">
			<h4>
				<asp:TextBox ID="txtMaxDiasHabiles" runat="server" ClientIDMode="Static" CssClass="form-control"
					type="date"></asp:TextBox>
				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtMaxDiasHabiles"
					runat="server" ValidationGroup="ValidationAdd" />

			</h4>
		</div>	   
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-8">
			<h4>y  deberá ser diligenciada y entregada nuevamente como fecha límite el día .</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-4">
			<h4>Máximo tres días hábiles:</h4>
		</div>
		<div class="col-md-3">
			<asp:TextBox ID="Textbox1" runat="server" ClientIDMode="Static" CssClass="form-control"
				type="date"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox1"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />    

	<div class="row col-md-offset-2">
		<div class="col-md-8">
			<h4>Las planchas presentadas serán publicadas en cartelera para conocimiento de todos los trabajadores por </h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-4">
			<h4>Máximo dos días hábiles:</h4>
		</div>
		<div class="col-md-3">
			<h4>
				<asp:TextBox ID="Textbox2" runat="server" ClientIDMode="Static" CssClass="form-control"
					type="date"></asp:TextBox>
				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox2"
					runat="server" ValidationGroup="ValidationAdd" />

			</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-8">
			<h4>La votación de las diferentes planchas que se presenten se realizará el día</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-4">
			<h4>Máximo 4 días de entregadas las hojas de inscripción:</h4>
		</div>
		<div class="col-md-4">
			<asp:TextBox ID="Textbox3" runat="server" ClientIDMode="Static" CssClass="form-control"
				type="date"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox3"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-1">
			<h4>En:</h4>
		</div>
		<div class="col-md-7">
			<asp:TextBox ID="Textbox4" runat="server" ClientIDMode="Static" CssClass="form-control"
				placeholder="(lugar de votación: la portería, la entrada al restaurante, la entrada al vestuario, la entrada al salón de producción o área de servicio)"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox4"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>A las:</h4>
		</div>
		<div class="col-md-3">
			<asp:TextBox ID="Textbox5" runat="server" ClientIDMode="Static" CssClass="form-control" type="time"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox5"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-8">
			<h4>El conteo de votos se realizará el día </h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>Día:</h4>
		</div>
		<div class="col-md-3">
			<asp:TextBox ID="Textbox6" runat="server" ClientIDMode="Static" CssClass="form-control"
				type="date"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox6"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>A las:</h4>
		</div>
		<div class="col-md-3">
			<asp:TextBox ID="Textbox7" runat="server" ClientIDMode="Static" CssClass="form-control"
				type="time"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox7"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-8">
			<h4>en presencia de un representante de cada una de las planchas presentadas y el jurado de votación.</h4>
		</div>
	</div>
	<br />

	<div class="row col-md-offset-2">
		<div class="col-md-2">
			<h4>Cordialmente:</h4>
		</div>
		<div class="col-md-6">
			<asp:TextBox ID="Textbox8" runat="server" ClientIDMode="Static" CssClass="form-control"
				placeholder="Gerente/ Director RRHH/ Jefe de Personal"></asp:TextBox>
			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox8"
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
