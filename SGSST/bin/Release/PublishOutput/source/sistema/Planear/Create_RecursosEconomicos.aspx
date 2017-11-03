<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_RecursosEconomicos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_RecursosEconomicos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:Panel runat="server" ID="panel1">

		<ol class="breadcrumb">
			<li><a href="#">Fase: Planear</a></li>
			<li><a href="../Planear/index_RecursosEconomicos.aspx">Recursos Económicos Aprobados</a></li>
			<li><a href="#">Crear Documento</a></li>
		</ol>

		<div class="page-header">
			<h3 class="text-center">Recursos Económicos Aprobados Por La Alta Gerencia</h3>
		</div>


		<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
			<div id="divAlerta" runat="server">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
			</div>
		</asp:PlaceHolder>


		<div class="row">

			<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
				<div class="col-md-4 col-md-offset-4">
					<h4 class="text-center">Sucursal</h4>
					<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" 
						title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
						SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
						Font-Bold="true" ControlToValidate="ddlSucursal" runat="server"
						ValidationGroup="ValidationAdd" />
				</div>

			</asp:PlaceHolder>
		</div>
		<br />

		<div class="box">

			<div class="box-body no-padding">
				<table class="table table-condensed">
					<tbody>

						<tr>
							<th class="bg-aqua color-palette text-center" colspan="5">FICHA DE SOLICITUDES</th>
							<th class="bg-teal color-palette text-center">CANTIDAD</th>
						</tr>

						<tr class="bg-aqua color-palette">
							<th class="col-md-3 text-center">DESCRIPCION DE LA SOLICITUD</th>
							<th class="col-md-2 text-center">CANTIDAD</th>
							<th class="col-md-1 text-center">UNIDAD</th>
							<th class="col-md-2 text-center">PROVEEDOR</th>
							<th class="col-md-1 text-center">COSTO</th>
							<th class="col-md-2 text-center bg-teal color-palette">CANTIDAD APROBADA</th>
						</tr>

						<tr>
							<td>
								<asp:Label runat="server" Text="1" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox1" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox2" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox3" runat="server" type="number" step="0.01" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox4" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox5" runat="server" type="number" step="0.01" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox6" runat="server" type="number" step="0.01" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="2" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox7" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox8" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox9" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox10" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox11" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox12" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="3" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox13" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox14" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox15" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox16" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox17" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox18" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="4" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox19" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox20" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox21" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox22" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox23" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox24" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="5" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox25" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox26" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox27" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox28" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox29" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox30" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="6" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox31" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox32" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox33" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox34" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox35" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox36" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="7" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox37" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox38" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox39" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox40" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox41" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox42" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="8" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox43" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox44" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox45" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox46" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox47" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox48" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="9" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox49" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox50" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox51" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox52" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox53" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox54" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label runat="server" Text="10" class="col-md-1"></asp:Label>
								<asp:TextBox ID="Textbox55" runat="server" class="col-md-10"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox56" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox57" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox58" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox59" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox ID="Textbox60" type="number" step="0.01" runat="server" class="col-md-12"></asp:TextBox>
							</td>
						</tr>

						<!-- resultados -->
						<tr>
							<th class="col-md-3 text-center"></th>
							<th class="col-md-2 text-center"></th>
							<th class="col-md-1 text-center"></th>
							<th class="col-md-2 text-center"></th>
							<th class="bg-aqua color-palette col-md-2 text-center">TOTAL REQUERIDO</th>
							<th class="bg-teal color-palette col-md-2 text-center">TOTAL APROBADO</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<asp:Label ID="lbRequerido" runat="server" Text="---"></asp:Label>
							</td>
							<td class="bg-teal color-palette">
								<asp:Label ID="lbAprobado" runat="server" Text="---"></asp:Label>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<br />

			<div class="row text-center">

				<div class="col-md-4">
					<asp:ImageButton alt="-" ID="btnGenerar" runat="server" ImageUrl="~\ico\view.png"
						OnClick="btnGenerar_Onclick" />
					<h4>Generar Resultados</h4>
				</div>

				<asp:PlaceHolder ID="phGuardar" runat="server" Visible="false">
					<div class="col-md-4">
						<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
							OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
						<h4>Imprimir Informe</h4>
					</div>
				</asp:PlaceHolder>


			</div>

		</div>

	</asp:Panel>
</asp:Content>
