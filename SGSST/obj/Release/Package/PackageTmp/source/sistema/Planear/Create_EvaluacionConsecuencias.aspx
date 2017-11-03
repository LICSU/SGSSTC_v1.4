<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionConsecuencias.aspx.cs" Inherits="SGSST.source.sistema.Planear.Create_EvaluacionConsecuencias" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EvaluacionRiesgos.aspx">Formato para modelo de procesos</a></li>
		<li><a href="#">Consecuencias</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para el Nivel de Consecuencias</h1>
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
             <CKEditor:CKEditorControl ID="txtConsecuencias" BasePath="/ckeditor/" runat="server">
                 <table border="1">
					<thead>
						<tr>
							<th colspan="4" style="background-color:#538DD5; color:#000; text-align:center;">TABLA VI. DETERMINACIÓN DEL NIVEL DE CONSECUENCIAS</th>
						</tr>
						<tr>
							<th rowspan="2" style="background-color:#538DD5; color:#000; text-align:center;">Nivel de consecuencia</th>
							<th rowspan="2" style="background-color:#538DD5; color:#000; text-align:center;">NC</th>
							<th colspan="2" style="background-color:#538DD5; color:#000; text-align:center;">SIGNIFICADO</th>
						</tr>
						<tr>
							<th style="background-color:#538DD5; color:#000; text-align:center;">Daños personales</th>
							<th style="background-color:#538DD5; color:#000; text-align:center;">Enfermedades</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Mortal o catastrófico (M)</td>
							<td>100</td>
							<td>Muerte(s)</td>
							<td>Patología irreversible a largo plazo (Cáncer,  esterilidad…)</td>
						</tr>
						<tr>
							<td>Muy grave (MG)</td>
							<td>60</td>
							<td>Lesiones o enfermedades graves irreparables (incapacidad permanente, parcial o invalidez).</td>
							<td>Patología no mejorable con cese de la exposición  al riesgo</td>
						</tr>
						<tr>
							<td>Grave (G) </td>
							<td>25</td>
							<td>Lesiones o enfermedades con incapacidad laboral temporal (ILT).</td>
							<td>Patologías tratables Ceden con tratamiento médico </td>
						</tr>
						<tr>
							<td>Leve (L) </td>
							<td>10</td>
							<td>Lesiones o enfermedades que no requieren incapacidad.</td>
							<td>Molestias</td>
						</tr>
					</tbody>
				</table>
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
