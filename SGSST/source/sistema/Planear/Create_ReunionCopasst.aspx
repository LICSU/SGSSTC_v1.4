<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ReunionCopasst.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ReunionCopasst" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
		<li><a href="#">Crear Reunión Copasst</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato de Reunión del Comité Paritario de Seguridad y Salud en el Trabajo</h1>
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
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
					SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
					Font-Bold="true" ControlToValidate="ddlSucursal" runat="server"
					ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>

	<br />

	<div class="row">
		<div class="col-md-2 col-md-offset-3">
			N° de Acta
							<asp:TextBox ID="txtActa" type="number" step="0.01" runat="server" class="form-control"></asp:TextBox>
		</div>
		<div class="col-md-2">
			Hora de Inicio
							<asp:TextBox ID="txtHoraInicio" type="time" runat="server" class="form-control"></asp:TextBox>
		</div>
		<div class="col-md-2">
			Hora de Finalización
							<asp:TextBox ID="txtHoraFin" type="time" runat="server" class="form-control"></asp:TextBox>
		</div>
	</div>

	<br />

	<div class="row text-center">
		<div class="box">
			
			<div class="panel-group" id="accordion">

				<div class="panel panel-default">
					<div class="panel-heading bg-aqua color-palette">
						<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">MIEMBROS PRINCIPALES DEL COMITÉ</a></h4>
					</div>

					<div id="collapse1" class="panel-collapse collapse">
						<div class="panel-body">
							<CKEditor:CKEditorControl ID="txtMiembrosPrincipales" BasePath="/ckeditor/" runat="server">
										<table border="0" cellpadding="0" cellspacing="0" width="780" style="border-collapse:collapse;width:585pt" class="cke_show_border">
											<tbody>
												<tr height="20" style="height:15.0pt">
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;">
														<strong>Nombre Completo</strong>
													</td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;">
														<strong>Cargo</strong>
													</td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right:0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;">&nbsp;<br></td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;">&nbsp;<br></td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;">&nbsp;<br></td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;">&nbsp;<br></td>
												</tr>
											</tbody>
										</table>
							</CKEditor:CKEditorControl>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading bg-aqua color-palette">
						<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">INVITADOS</a></h4>
					</div>

					<div id="collapse2" class="panel-collapse collapse">
						<div class="panel-body">
							<CKEditor:CKEditorControl ID="txtInvitados" BasePath="/ckeditor/" runat="server">
										<table border="0" cellpadding="0" cellspacing="0" width="780" style="border-collapse:collapse;width:585pt" class="cke_show_border">
											<tbody>
												<tr height="20" style="height:15.0pt">
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;">
														<strong>Nombre Completo</strong>
													</td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;">
														<strong>Cargo</strong>
													</td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right:0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;"><br></td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;"><br></td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;"><br></td>
												</tr>
												<tr>
													<td colspan="5" height="20" class="xl63" width="451" style="border-right: 0.5pt solid black; height: 15pt; width: 338pt; text-align: center;"><br></td>
													<td colspan="3" class="xl64" width="329" style="border-right: 1pt solid black; width: 247pt; text-align: center;"><br></td>
												</tr>
											</tbody>
										</table>
							</CKEditor:CKEditorControl>
						</div>

					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading bg-aqua color-palette">
						<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">SOLICITUDES DEL DÍA</a></h4>
					</div>

					<div id="collapse3" class="panel-collapse collapse">
						<div class="panel-body">
							<CKEditor:CKEditorControl ID="txtSolicitudes" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
						</div>

					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading bg-aqua color-palette">
						<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">ESTATUS DE LAS SOLICITUDES</a></h4>
					</div>

					<div id="collapse4" class="panel-collapse collapse">
						<div class="panel-body">
							<CKEditor:CKEditorControl ID="txtEstatus" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
						</div>

					</div>
				</div>

			</div>

			<div class="row text-center">

				<div class="col-md-4 col-md-offset-2">
					<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
						OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
					<h4>Imprimir Informe</h4>
				</div>

			</div>

		</div>
	</div>

</asp:Content>
