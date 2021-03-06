﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_AccidenteLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.index_AccidenteLaboral" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35"
	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="#">Accidentes Laborales</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Accidentes Laborales</h1>
			</div>
			
			<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
				<div id="divAlerta" runat="server">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
				</div>
			</asp:PlaceHolder>

			<div class="row text-center">
				<div class="col-md-4 col-md-offset-3">
					<asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese nombre o apellido del afectado"></asp:TextBox>
				</div>

				<div class="col-md-2">
					<asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
				</div>
			</div>

			<br />

			<div class="row text-center">
				<asp:PlaceHolder runat="server" ID="phEmpresa">
					<div class="col-md-3">
						<label>Filtrar por Empresa</label>
						<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true"
							OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged">
						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
					<div class="col-md-3">
						<label>Filtrar por Sucursal</label>
						<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true"
							OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<div class="col-md-3">
					<label>Filtrar por Area</label>
					<asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" CssClass="form-control" AutoPostBack="true"
						OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
					</asp:DropDownList>
				</div>

				<div class="col-md-3">
					<label>Fecha Inicio</label>
					<asp:TextBox runat="server" ID="txtFechaInicio" CssClass="form-control" TextMode="Date"
						placeholder="yyyy-MM-dd" AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
				</div>

				<div class="col-md-3">
					<label>Fecha Fin</label>
					<asp:TextBox runat="server" ID="txtFechaFin" CssClass="form-control" TextMode="Date"
						placeholder="yyyy-MM-dd" AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
				</div>
			</div>

			<br />

			<div class="row" style="overflow: auto;">
				<div class="box-body">
					<div class="dataTables_wrapper form-inline dt-bootstrap">


						<asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
							AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
							OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
							OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
							<RowStyle HorizontalAlign="Center" />

							<Columns>
								<asp:TemplateField HeaderText="Id Accidente" Visible="false" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="id" runat="server" Text='<%# Eval("id_at_it_el_pa") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Fecha del Accidente" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc", "{0:dd/MM/yyyy}") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Afectado" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="afectado" runat="server" Text='<%# Eval("Afectado") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="lbArea" runat="server" Text='<%# Eval("area") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="N° Consultas" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="consulta" runat="server" Text='<%# Eval("consulta") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Empresa" Visible="false" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="lbreporte_accidente" runat="server" Text='<%# Eval("reporte_accidente") %>' Visible="false" />
										<asp:Label ID="lbComunicado" runat="server" Text='<%# Eval("documento_comunicado") %>' Visible="false" />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:ButtonField HeaderText="Subir Soportes" CommandName="Upload" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\upload.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Ver Soportes" CommandName="Scan" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\viewFile.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Descargar Comunicado" CommandName="Comunicado" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\comunicado.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Consultar" CommandName="Consultar" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\view.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\editar.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\delete.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Asignar Consultas" CommandName="ConsultaMedica" ButtonType="Image" HeaderStyle-CssClass="text-center"
									ImageUrl="~\ico\addConsulta.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>
							</Columns>
						</asp:GridView>
					</div>
				</div>
			</div>
			<br />

			<div class="row text-center">
				<asp:PlaceHolder runat="server" ID="phAgregar">
					<div class="col-md-3 col-md-offset-3">
						<asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="btn_Agregar" />
						<h4>Nuevo Accidente Laboral</h4>
					</div>
				</asp:PlaceHolder>

				<div class="col-md-3">
					<asp:ImageButton alt="-" ID="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" OnClick="MostrarModalImprimir" />
					<h4>Descargar Lista</h4>
				</div>
			</div>

		</ContentTemplate>
		<Triggers></Triggers>
	</asp:UpdatePanel>

	<!-- Print Modal -->
	<div id="printModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Descargar Lista</h3>
				</div>

				<asp:UpdatePanel ID="UpdatePanel3" runat="server">
					<ContentTemplate>

						<div class="modal-body form-group">

							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<asp:Button ID="btnPrintWord" runat="server" Text="Imprimir en Word"
										class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
								</div>
							</div>
							<br />

							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<asp:Button ID="btnPrintExcel" runat="server" Text="Imprimir en Excel"
										class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
								</div>
							</div>
							<br />

							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<asp:Button ID="btnPrintPdf" runat="server" Text="Imprimir en PDF"
										class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
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

	<!-- Escaneado Modal -->
	<div id="EscaneadoModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Subir Archivo Escaneado</h3>
				</div>
				<asp:UpdatePanel ID="UpdatePanel1" runat="server">
					<ContentTemplate>

						<div class="modal-body form-group">
							<asp:HiddenField ID="hdfIDEsc" runat="server" />

							<div class="row">
								<label class="col-md-4 control-label">Soporte Comunicado: </label>
								<div class="col-md-6">
									<asp:FileUpload ID="fuComunicado" runat="server" ClientIDMode="Static"
										></asp:FileUpload>
								</div>
							</div>
							<br />

							<div class="row">
								<label class="col-md-4 control-label">Soporte Reporte de Accidente: </label>
								<div class="col-md-6">
									<asp:FileUpload ID="fuReporte" runat="server" ClientIDMode="Static"
										></asp:FileUpload>
								</div>
							</div>
							<br />
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnEscaneado" runat="server" Text="Subir Archivo"
										class="btn btn-block btn-info" OnClick="btnSubirArchivo" />
								</div>

								<div class="col-md-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
								</div>
							</div>
						</div>

					</ContentTemplate>
					<Triggers>
						<asp:PostBackTrigger ControlID="btnEscaneado" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>

	<!-- VerDoc Modal -->
	<div id="VerDocModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Ver Documentos Escaneados</h3>
				</div>

				<asp:UpdatePanel ID="UpdatePanel2" runat="server">
					<ContentTemplate>

						<div class="modal-body form-group">
							<asp:HiddenField ID="hdfVerDoc" runat="server" />

							<div class="row">
								<label class="col-md-6 control-label">Ver Soporte Comunicado: </label>
								<div class="col-md-6">
									<asp:HyperLink ID="hplComunicado" runat="server" Target="_blank" ImageUrl="~\ico\viewFile.png" />
								</div>
							</div>
							<br />

							<div class="row">
								<label class="col-md-6 control-label">Ver Soporte Reporte de Accidente: </label>
								<div class="col-md-6">
									<asp:HyperLink ID="hplReporte" runat="server" Target="_blank" ImageUrl="~\ico\viewFile.png" />
								</div>
							</div>
							<br />
						</div>

						<div class="modal-footer">
							<div class="col-md-4 col-md-offset-4">
								<button class="btn btn-block btn-info" data-dismiss="modal" aria-hidden="true">Cerrar</button>

							</div>
						</div>

					</ContentTemplate>
					<Triggers></Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>

	<!-- AsginarConsultas Modal -->
	<div id="AsigConModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Asignar Consultas</h3>
				</div>

				<asp:UpdatePanel ID="UpdatePanel4" runat="server">
					<ContentTemplate>

						<div class="modal-body form-group">
							<asp:HiddenField ID="hdfAsigCon" runat="server" />

							<div class="row">
								<label class="col-md-6 control-label">Trabajador: </label>
								<div class="col-md-6">
									<asp:Label ID="lbTrabajadorEdit" runat="server"></asp:Label>
								</div>
							</div>
							<br />

							<div class="row">
								<label class="col-md-6 control-label">Fecha del Accidente: </label>

								<div class="col-md-6">
									<asp:Label ID="lbFechaAccEdit" runat="server"></asp:Label>
								</div>
							</div>
							<br />

							<div class="row">
								<label class="col-md-6 control-label">Nùmero de Consultas: </label>

								<div class="col-md-6">
									<asp:TextBox runat="server" TextMode="Number" ID="txtNumConsultas" CssClass="form-control"
										PlaceHolder="# de Consultas"></asp:TextBox>

									<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
										Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
										ControlToValidate="txtNumConsultas" runat="server" ValidationGroup="ValidationEdit" />
								</div>
							</div>
							<br />

							<div class="row">
								<label class="col-md-6 control-label">Frecuencia de Consultas: </label>

								<div class="col-md-6">
									<asp:TextBox runat="server" TextMode="Number" ID="txtFeConsultas" CssClass="form-control"
										PlaceHolder="Frecuencia"></asp:TextBox>

									<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
										Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
										ControlToValidate="txtFeConsultas" runat="server" ValidationGroup="ValidationEdit" />
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnAsigcon" runat="server" Text="Asignar" class="btn btn-block btn-info"
										OnClick="btnAsigcon_Click" ValidationGroup="ValidationEdit" />
								</div>

								<div class="col-md-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
								</div>
							</div>
						</div>

					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="btnAsigcon" EventName="Click" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>

</asp:Content>