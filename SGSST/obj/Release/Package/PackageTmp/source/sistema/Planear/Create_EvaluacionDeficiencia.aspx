<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionDeficiencia.aspx.cs" Inherits="SGSST.source.sistema.Planear.Create_EvaluacionDeficiencia" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EvaluacionRiesgos.aspx">Formato para modelo de procesos</a></li>
		<li><a href="#">Deficiencia</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para el Nivel de Deficiencia</h1>
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
             <CKEditor:CKEditorControl ID="txtDeficiencia" BasePath="/ckeditor/" runat="server">
                 <table border="1">
					<thead>
						<tr>
							<th colspan="3" style="background-color:#538DD5; color:#000000; text-align:center;">TABLA II. DETERMINACIÓN DEL NIVEL DE DEFICIENCIA</th>
						</tr>
						<tr>
							<th style="background-color:#538DD5; color:#000000; text-align:center;">Nivel de deficiencia ND</th>
							<th style="background-color:#538DD5; color:#000000; text-align:center;">Valor de ND</th>
							<th style="background-color:#538DD5; color:#000000; text-align:center;">SIGNIFICADO</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Muy alto (MA) </td>
							<td>10</td>
							<td>Se ha(n) detectado peligro(s) que determina(n) como posible la generación de incidentes, 
								o la eficacia del conjunto de medidas preventivas existentes 
								respecto al riesgo es nula no existe, o ambos
							</td>
						</tr>
						<tr>
							<td>Alto (A) </td>
							<td>6</td>
							<td>Se ha(n) detectado algún(os) peligro(s) que puede(n) dar lugar a consecuencias significativa(s) 
								o la eficacia del conjunto de medidas preventivas existentes es baja, o ambos
							</td>
						</tr>
						<tr>
							<td>Medio (M) </td>
							<td>2</td>
							<td>Se han detectado peligros que pueden dar lugar a consecuencias poco significativas o de menor importancia, 
								o la eficacia del conjunto de medidas preventivas existentes es moderada, o ambos.
							</td>
						</tr>
						<tr>
							<td>Bajo (B) </td>
							<td>No se asigna valor</td>
							<td>No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, 
								o ambos. El riesgo está controlado.
							</td>
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
