<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ExamenLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ExamenLaboral" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="#">Examen Laboral</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Examenes Laborales</h1>
			</div>
			
			<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
				<div id="divAlerta" runat="server">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
				</div>
			</asp:PlaceHolder>

			<div class="row">
				<div class="col-md-6 col-md-offset-2">
					<asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el examen a buscar"></asp:TextBox>
				</div>

				<div class="col-md-2">
					<asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
				</div>
			</div>

			<br />

			<div class="row">
				<asp:PlaceHolder runat="server" ID="phEmpresa">
					<div class="col-md-3">
						<h4>Empresa</h4>
						<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
							OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<div class="col-md-3">
					<h4>Tipo de Examen</h4>
					<asp:DropDownList runat="server" ID="ddlTipoExamen" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoExamen_SelectedIndexChanged"></asp:DropDownList>
				</div>

				<div class="col-md-3">
					<h4>Fecha Inicio</h4>
					<asp:TextBox runat="server" ID="txtFechaInicio" TextMode="Date" AutoPostBack="true"
						class="form-control" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
				</div>

				<div class="col-md-3">
					<h4>Fecha Fin</h4>
					<asp:TextBox runat="server" ID="txtFechaFin" TextMode="Date" AutoPostBack="true"
						class="form-control" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="box-body">
					<div class="dataTables_wrapper form-inline dt-bootstrap">
						

						<asp:GridView ID="GridView1"
							class="table table-bordered table-hover dataTable"
							runat="server"
							AutoGenerateColumns="false"
							AllowPaging="true"
							PageSize="10"
							OnRowCommand="GridView1_RowCommand"
							OnPageIndexChanging="GridView1_PageIndexChanging"
							OnRowCreated="GridView1_RowCreated"
							EmptyDataText="No existen Registros">
							<RowStyle HorizontalAlign="Center" />

							<Columns>
								<asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="id" runat="server" Text='<%# Eval("Empresa") %>' />
										<asp:Label ID="id_his_cli_ocu" Visible="false" runat="server" Text='<%# Eval("id_his_cli_ocu") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Trabajador" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="trabajador" runat="server" Text='<%# Eval("trabajador") %>' /></ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Tipo de Examen" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="descripcion" runat="server" Text='<%# Eval("tipo_exa") %>' /></ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Fecha de Examen" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Eval("fecha_exa") %>' /></ItemTemplate>
								</asp:TemplateField>

								<asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>
							</Columns>
						</asp:GridView>
					</div>
				</div>
			</div>
			<br />

			<div class="row text-center">
				<div class="col-md-3 col-md-offset-3">
					<asp:PlaceHolder runat="server" ID="phAgregar">
						<asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalAgregar" />
						<h4>Agregar</h4>
					</asp:PlaceHolder>
				</div>
				<div class="col-md-3">
					<asp:ImageButton alt="-" ID="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png"
						data-toggle="modal" data-target="#printModal" />
					<h4>Descargar Lista</h4>
				</div>
			</div>
		</ContentTemplate>
		<Triggers>
		</Triggers>
	</asp:UpdatePanel>

	<!-- Edit Modal -->
	<div id="editModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>Editar Registro</h3>
				</div>
				<asp:UpdatePanel ID="UpdatePanel2" runat="server">
					<ContentTemplate>
						<div class="modal-body form-group">

							<div class="row">
								<div>
									<asp:HiddenField ID="hdfEditID" runat="server" />
									<label class="col-md-4 control-label">Nombre: </label>
									<div class="col-md-6">
										<asp:TextBox ID="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
									</div>
								</div>
							</div>
							<br />

							<div class="row">
								<div>
									<label class="col-md-4 control-label">Descripcion: </label>
									<div class="col-md-6">
										<asp:TextBox ID="txtDescripcionEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
									</div>
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<asp:Label ID="Label4" Visible="false" runat="server"></asp:Label>
							<asp:Button ID="btnEditar" runat="server" Text="Guardar" CssClass="btn-default" />
							<button class="btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
						</div>
					</ContentTemplate>
					<Triggers>
						<asp:PostBackTrigger ControlID="btnEditar" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>

	<!-- Delete Modal -->
	<div id="deleteModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Eliminar Registro</h3>
				</div>
				<asp:UpdatePanel ID="upDel" runat="server">
					<ContentTemplate>
						<div class="modal-body form-group">
							¿Seguro desea eliminar este registro?
								<asp:HiddenField ID="hdfIDDel" runat="server" />

						</div>
						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro" /></div>
								<div class="col-md-4">
									<button data-dismiss="modal" aria-hidden="true" class="btn btn-block btn-info">Cerrar</button></div>
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

	<!-- Print Modal -->
	<div id="printModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Imprimir Lista</h3>
				</div>

				<asp:UpdatePanel ID="UpdatePanel3" runat="server">
					<ContentTemplate>
						<div class="modal-body form-group">

							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<asp:Button ID="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
								</div>
							</div>
							<br />

							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<asp:Button ID="btnPrintExcel" runat="server" Text="Imprimir en Excel" class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
								</div>
							</div>
							<br />

							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<asp:Button ID="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
								</div>
							</div>
							<br />
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
								</div>

							</div>
						</div>

					</ContentTemplate>
					<Triggers>
						<asp:PostBackTrigger ControlID="btnPrintWord" />
						<asp:PostBackTrigger ControlID="btnPrintExcel" />
						<asp:PostBackTrigger ControlID="btnPrintPdf" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>

</asp:Content>
