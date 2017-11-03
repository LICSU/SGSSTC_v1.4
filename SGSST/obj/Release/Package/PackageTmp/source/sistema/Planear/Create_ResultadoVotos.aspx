<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ResultadoVotos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ResultadoVotos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:Panel runat="server" ID="panel1">

		<ol class="breadcrumb">
			<li><a href="#">Fase: Planear</a></li>
			<li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
			<li><a href="#">Crear Resultados Votos</a></li>
		</ol>

		<div class="page-header">
			<h1 class="text-center">Resultados obtenidos del conteo de votos</h1>
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
		<br />

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table class="table table-condensed">
					<tbody>
						<tr class="bg-aqua color-palette">
							<th class="col-md-8 text-center">PERSONA</th>
							<th class="col-md-4 text-center">N° DE VOTOS</th>
						</tr>

						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox1" placeholder="Candidato 1"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox2" type="number" step="0.01" min="0"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox3" placeholder="Candidato 2"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" type="number" step="0.01" min="0" ID="Textbox4"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox5" placeholder="Candidato 3"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" type="number" step="0.01" min="0" ID="Textbox6"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox7" placeholder="Candidato 4"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" type="number" step="0.01" min="0" ID="Textbox8"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<h4>VOTOS EN BLANCO:</h4>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" type="number" step="0.01" min="0" ID="Textbox9"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<h4>VOTOS ANULADOS:</h4>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" type="number" step="0.01" min="0" ID="Textbox10"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<h4>RESULTADOS DE LOS VOTOS:</h4>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" type="number" step="0.01" min="0" ID="Textbox61"></asp:TextBox>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<br />

		<h3>Resultaron elegidos en ésta votación las siguientes personas:</h3>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table table-condensed">
					<tbody>
						<tr class="bg-aqua color-palette">
							<th class="col-md-3 text-center">NOMBRE</th>
							<th class="col-md-3 text-center">OFICIO</th>
							<th class="col-md-3 text-center">SECCIÓN</th>
							<th class="col-md-3 text-center">CATEGORÍA<br />
								<div class="col-md-6 bg-green color-palette">PRINCIPAL</div>
								<div class="col-md-6 bg-yellow color-palette">SUPLENTE</div>
							</th>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox11"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox12"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox13"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox14"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox15"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox16"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox17"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox18"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox19"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox20"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox21"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox22"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox23"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox24"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox25"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox26"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox27"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox28"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox29"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox30"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox31"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox32"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox33"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox34"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox35"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox36"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox37"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox38"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox39"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox40"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox41"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox42"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox43"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox44"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox45"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox46"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox47"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox48"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox49"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox50"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox51"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox52"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox53"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox54"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox55"></asp:TextBox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox56"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox57"></asp:TextBox>
							</td>
							<td>
								<asp:TextBox CssClass="form-control" runat="server" ID="Textbox58"></asp:TextBox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox59"></asp:TextBox>
								</div>

								<div class="col-md-6">
									<asp:TextBox CssClass="form-control" runat="server" ID="Textbox60"></asp:TextBox>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
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
	</asp:Panel>
</asp:Content>
