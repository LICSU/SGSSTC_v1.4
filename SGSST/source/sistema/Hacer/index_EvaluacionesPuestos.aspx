<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_EvaluacionesPuestos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_EvaluacionesPuestos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="#">Evaluaciones del Puesto</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Evaluaciones del Puesto</h1>
			</div>

			
			<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
				<div id="divAlerta" runat="server">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
				</div>
			</asp:PlaceHolder>
			
			<div class="row">
				<div class="col-md-4 col-md-offset-3">
					<asp:TextBox ID="txtBuscar" data-toggle="tooltip" TextMode="Date" data-placement="bottom" title="Ingrese Texto a Buscar"
						runat="server" class="form-control" PlaceHolder="Ingrese la fecha"></asp:TextBox>
				</div>

				<div class="col-md-2">
					<asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
						data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
				</div>
			</div>

			<div class="row" style="overflow: auto;">
				<div class="box-body">
					<div class="dataTables_wrapper form-inline dt-bootstrap">
					

						<asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
							AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand"
							OnPageIndexChanging="GridView1_PageIndexChanging"
							EmptyDataText="No existen Registros">
							<RowStyle HorizontalAlign="Center" />

							<Columns>
								<asp:TemplateField HeaderText="ID" Visible="false">
									<ItemTemplate>
										<asp:Label ID="id" runat="server" Text='<%# Eval("id_evaluacion_riesgo") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Fecha de Evaluación" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="fecha_evaluacion" runat="server" Text='<%# Eval("fecha_evaluacion", "{0:d}") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Nivel del Riesgo" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="nivel_riesgo" runat="server" Text='<%# Eval("nivel_riesgo") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Aceptabilidad del Riesgos" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="aceptabilidad_riesgo" runat="server" Text='<%# Eval("aceptabilidad_riesgo") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:ButtonField HeaderText="Imprimir" CommandName="Imprimir" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\print.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Consultar" CommandName="Consultar" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\view.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\delete.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>
							</Columns>

						</asp:GridView>
					</div>
				</div>
			</div>
			<br />

		</ContentTemplate>
		<Triggers></Triggers>
	</asp:UpdatePanel>

	<!-- print lista Modal-->
	<div id="PrintListaModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Imprimir Registro</h3>
				</div>

				<div class="modal-body form-group">
					<asp:HiddenField ID="hImprimir" runat="server" />

					<div class="row">
						<h4 class="text-center">¿Seguro desea imprimir este registro?</h4>
					</div>
				</div>

				<div class="modal-footer">
					<div class="row">

						<div class="col-md-4 col-md-offset-2">
							<asp:Button ID="btPrint" runat="server" Text="Imprimir" AutoPostBack="true"
								class="btn btn-block btn-info" OnClick="btPrint_Click" />
						</div>

						<div class="col-md-4">
							<button class="btn btn-block btn-default" data-dismiss="modal"
								aria-hidden="true">
								Cerrar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Delete Modal -->
	<div id="deleteModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Eliminar Registro</h3>
				</div>

				<asp:UpdatePanel ID="upDel" runat="server">
					<ContentTemplate>

						<div class="modal-body form-group">
							<asp:HiddenField ID="hdfIDDel" runat="server" />

							<div class="row">
								<h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
							</div>
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info"
										OnClick="EliminarRegistro" />
								</div>

								<div class="col-md-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
								</div>
							</div>
						</div>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>

</asp:Content>
