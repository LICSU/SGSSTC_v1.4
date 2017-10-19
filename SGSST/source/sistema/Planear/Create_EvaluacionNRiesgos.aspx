<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionNRiesgos.aspx.cs" Inherits="SGSST.source.sistema.Planear.Create_EvaluacionNRiesgos" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EvaluacionRiesgos.aspx">Formato para modelo de procesos</a></li>
		<li><a href="#">Riesgos</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para el Nivel de Riesgo</h1>
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
             <CKEditor:CKEditorControl ID="txtRiesgos" BasePath="/ckeditor/" runat="server">
                 <table border="1">
					<thead>
						<tr>
							<th colspan="6" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">TABLA VII. DETERMINACIÓN DEL NIVEL DE RIESGO</th>
						</tr>
						<tr>
							<th colspan="2" rowspan="2">Nivel de riesgo NR = NP X NC</th>
							<th colspan="4"  style="text-align:center;">Nivel de probabilidad (NP)</th>
						</tr>
						<tr>
							<th>40 - 24</th>
							<th>20 - 10</th>
							<th>8 - 6</th>
							<th>4 - 2</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="4">
								Nivel de Consecuencias (NC)
							</td>
							<td>100</td>
							<td style="background-color:red;">I<br />4000 - 2400</td>
							<td style="background-color:red;">I<br />2000 - 1000</td>
							<td style="background-color:red;">I<br />800 - 600</td>
							<td style="background-color:yellow;">II<br />400 - 200</td>
						</tr>
						<tr>
							<td>60</td>
							<td style="background-color:red;">I<br />2400 - 1440</td>
							<td style="background-color:red;">I<br />1200 - 600</td>
							<td style="background-color:yellow;">II<br />480 - 360</td>
							<td style="background-color:yellow;">II 240<br /><span style="background-color:#00FF00;">III 120</span></td>
						</tr>
						<tr>
							<td>25</td>
							<td style="background-color:red;">I<br />1000 - 600</td>
							<td style="background-color:yellow;">II<br />500 - 250</td>
							<td style="background-color:yellow;">II<br />200 - 150</td>
							<td style="background-color:#00FF00;">III<br />100 - 50</td>
						</tr>
						<tr>
							<td>10</td>
							<td style="background-color:yellow;">II<br />400 - 240</td>
							<td style="background-color:yellow;">II 200<br /><span style="background-color:#00FF00;">III 100</span></td>
							<td style="background-color:#00FF00;">III<br />80 - 60</td>
							<td style="background-color:#00FF00;">III 40<br />IV 20</td>
						</tr>
					</tbody>
				</table><br />
				<table border="1">
					<thead>
						<tr>
							<th colspan="3" style="background-color:#538DD5; color:#FFFFFF; text-align:center;">TABLA VIII. SIGNIFICADO DEL NIVEL DE RIESGO</th>
						</tr>
						<tr  style="text-align:center;">
							<th>Nivel de riesgo</th>
							<th>Valor de NR</th>
							<th>SIGNIFICADO</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>I</td>
							<td style="background-color:red;">4000 - 600</td>
							<td>Situación crítica. Suspender actividades hasta que el riesgo este bajo control. Intervención Urgente.</td>
						</tr>
						<tr>
							<td>II </td>
							<td style="background-color:yellow;">500 - 150</td>
							<td>Corregir y adoptar medidas de control de inmediato. Sin embargo, suspenda actividades si el nivel
								de riesgo esta por encima o igual de 360.</td>
						</tr>
						<tr>
							<td>III </td>
							<td style="background-color:#00FF00;">120 - 40</td>
							<td>Mejorar si es posible. Seria conveniente justificar la intervención y su rentabilidad.</td>
						</tr>
						<tr>
							<td>IV </td>
							<td>20</td>
							<td>Mantener las medidas de control existentes, pero se deberian considerar soluciones o mejoras y 
								se deben hacer comprobaciones periódicas para asegurar que el riesgo es aún aceptable.</td>
						</tr>
					</tbody>
				</table ><br />
				<table border="1">
					<thead>
						<tr>
							<th colspan="2"  style="background-color:#538DD5; color:#FFFFFF; text-align:center;">TABLA DE ACEPTABILIDAD DEL RIESGO</th>
						</tr>
						<tr style="text-align:center;">
							<th>NIVEL DE RIESGO</th>
							<th>SIGNIFICADO</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background-color:red;">
							<td>I</td>
							<td>No aceptable</td>
						</tr>
						<tr style="background-color:yellow;">
							<td>II </td>
							<td>No aceptable o aceptable con control  especifico</td>
						</tr>
						<tr style="background-color:#00FF00;">
							<td>III </td>
							<td>Aceptable</td>
						</tr>
						<tr>
							<td>IV </td>
							<td>Aceptable Controlado</td>
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
