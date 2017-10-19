<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionProbabilidad.aspx.cs" Inherits="SGSST.source.sistema.Planear.Create_EvaluacionProbabilidad" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EvaluacionRiesgos.aspx">Formato para modelo de procesos</a></li>
		<li><a href="#">Probabilidad</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para el Nivel de Probabilidad</h1>
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
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>
	<br />
   
    <div class="row">
		<div class="col-md-8 col-md-offset-2">
             <CKEditor:CKEditorControl ID="txtProbabilidad" BasePath="/ckeditor/" runat="server">
                 <table border="1">
					<thead>
						<tr>
							<th colspan="6" style="background-color:#538DD5; color:#000; text-align:center;">DETERMINACIÓN DEL NIVEL DE PROBABILIDAD</th>
						</tr>
						<tr>
							<th colspan="2" rowspan="2" style="background-color:#538DD5; color:#000; text-align:center;">Niveles de probabilidad</th>
							<th colspan="4" style="text-align:center;">Nivel de exposición (NE)</th>
						</tr>
						<tr>
							<th>4</th>
							<th>3</th>
							<th>2</th>
							<th>1</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3">Nivel de deficiencia (ND)</td>
							<td>10</td>
							<td style="background-color:red;">MA - 40</td>
							<td style="background-color:red;">MA - 30</td>
							<td style="background-color:yellow;">A - 20</td>
							<td style="background-color:yellow;">A - 10</td>
						</tr>
						<tr>
							<td>6</td>
							<td style="background-color:red;">MA - 24</td>
							<td style="background-color:yellow;">A - 18</td>
							<td style="background-color:yellow;">A - 12</td>
							<td style="background-color:#92D050;">M - 6</td>
						</tr>
						<tr>
							<td>2</td>
							<td style="background-color:#92D050;">M - 8</td>
							<td style="background-color:#92D050;">M - 6</td>
							<td style="background-color:#00FF00;">B - 4</td>
							<td style="background-color:#00FF00;">B - 2</td>
						</tr>
					</tbody>
				</table><br />
				<table border="1">
					<thead>
						<tr>
							<th colspan="3" style="background-color:#538DD5; color:#000; text-align:center;">SIGNIFICADO DE LOS DIFERENTES NIVELES DE PROBABILIDAD</th>
						</tr>
						<tr>
							<th style="background-color:#538DD5; color:#000; text-align:center;">Nivel de probabilidad</th>
							<th style="background-color:#538DD5; color:#000; text-align:center;">Valor de NP </th>
							<th style="background-color:#538DD5; color:#000; text-align:center;">INTERPRETACIÓN</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="background-color:red;">Muy alto (MA) </td>
							<td>Entre 40 y 24</td>
							<td>
								Situación deficiente con exposición continua.
								Normalmente la materialización del riesgo ocurre con frecuencia
							</td>
						</tr>
						<tr>
							<td style="background-color:yellow;">Alto (A) </td>
							<td>Entre 20 y 10</td>
							<td>
								Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional 
								o esporádica.<br />
								La materialización del riesgo es posible que suceda varias veces durante la vida laboral 
							</td>
						</tr>
						<tr>
							<td style="background-color:#92D050;">Medio (M) </td>
							<td>Entre 8 y 6</td>
							<td>Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. 
								Es posible que suceda el daño alguna vez
							</td>
						</tr>
						<tr>
							<td style="background-color:#00FF00;">Bajo (B) </td>
							<td>Entre 4 y 2</td>
							<td>
								Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier 
								nivel de exposición.<br />
								No es esperable que se materialice el riesgo, aunque puede ser concebible.
							</td>
						</tr>
					</tbody>
				</table><br />
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
