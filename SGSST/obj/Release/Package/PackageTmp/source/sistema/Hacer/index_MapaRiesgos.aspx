<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_MapaRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_MapaRiesgos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="#">Mapas de Riesgo</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Mapas de Riesgo</h1>
			</div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

			<div class="row">
				<div class="col-md-6 col-md-offset-2">
					<asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el Mapa a buscar"></asp:TextBox>
				</div>

				<div class="col-md-2">
					<asp:Button ID="btnSearchPlan" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
				</div>
			</div>
			<br />

			<div class="row">
				<asp:PlaceHolder runat="server" ID="phEmpresa">
					<div class="col-md-3">
						<h4 class="text-center">Empresa</h4>
						<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" ID="phSucursal">
					<div class="col-md-3 col-md-offset-3">
						<h4 class="text-center">Sucursal</h4>
						<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
					</div>
				</asp:PlaceHolder>
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
								<asp:TemplateField HeaderText="Id Plan" Visible="false" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="id_plan_mapa" runat="server" Text='<%# Eval("id_documento") %>' /></ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Nombre del Plan" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' /></ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="id_sucursal" Visible="false" runat="server" Text='<%# Eval("id_sucursal") %>' />
										<asp:Label ID="sucursal" runat="server" Text='<%# Eval("Sucursal") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:Label ID="id_empresa" Visible="false" runat="server" Text='<%# Eval("id_empresa") %>' />
										<asp:Label ID="empresa" runat="server" Text='<%# Eval("Empresa") %>' />
									</ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Acciones" HeaderStyle-CssClass="text-center">
									<ItemTemplate>
										<asp:HyperLink runat="server" ImageUrl="~\ico\descargar.png" NavigateUrl='<%# Eval("ruta") %>' Target="_blank">Descargar</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateField>

								<asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>
							</Columns>

						</asp:GridView>
					</div>
				</div>
			</div>
			<br />

			<asp:PlaceHolder runat="server" ID="phAgregar">
				<div class="row text-center">
					<div class="col-md-3 col-md-offset-3">
						<asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
							data-toggle="modal" data-target="#addModal" />
						<h4>Nuevo Mapa</h4>
					</div>
					<div class="col-md-3">
						<asp:ImageButton alt="-" ID="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png"
							data-toggle="modal" data-target="#printModal" />
						<h4>Descargar Lista</h4>
					</div>
				</div>
			</asp:PlaceHolder>

		</ContentTemplate>
		<Triggers>
		</Triggers>
	</asp:UpdatePanel>

	<!-- Add Modal -->
	<div id="addModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h3>Agregar Mapa</h3>
				</div>

				<asp:UpdatePanel ID="UpdatePanel1" runat="server">
					<ContentTemplate>

						<div class="modal-body form-group">
							<div class="row">
								<div>
									<label class="col-md-4 control-label">Nombre: </label>
									<div class="col-md-6">
										<asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control" MaxLength="100"></asp:TextBox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
											SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtNombre" runat="server"
											ValidationGroup="ValidationAdd" />
									</div>
								</div>
							</div>
							<br />

							<div class="row">
								<div>
									<label class="col-md-4 control-label">Descripcion: </label>
									<div class="col-md-6">
										<asp:TextBox ID="txtDesripcionAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
											SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtDesripcionAdd" runat="server"
											ValidationGroup="ValidationAdd" />
									</div>
								</div>
							</div>
							<br />

							<asp:PlaceHolder runat="server" ID="phEmpresaAdd">
								<div class="row form-group">
									<div>
										<label class="col-md-4 control-label">Empresa: </label>
										<div class="col-md-6">
											<asp:DropDownList ID="ddlEmpresaAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
											<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
												SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
												Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server"
												ValidationGroup="ValidationAdd" />
										</div>
									</div>
								</div>
							</asp:PlaceHolder>

							<asp:PlaceHolder runat="server" ID="phSucursalAdd">
								<div class="row form-group">
									<div>
										<label class="col-md-4 control-label">Sucursal: </label>
										<div class="col-md-6">
											<asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
											<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
												SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
												Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
												ValidationGroup="ValidationAdd" />
										</div>
									</div>
								</div>
							</asp:PlaceHolder>

							<div class="row">
								<div>
									<label class="col-md-4 control-label">Archivo: </label>
									<div class="col-md-6">
										<asp:FileUpload ID="flpArchivo" runat="server" ClientIDMode="Static" ></asp:FileUpload>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
											SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="flpArchivo" runat="server"
											ValidationGroup="ValidationAdd" />
									</div>
								</div>
							</div>
							<br />

						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd" /></div>
								<div class="col-md-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
							</div>
						</div>

					</ContentTemplate>
					<Triggers>
						<asp:PostBackTrigger ControlID="btnAdd" />
					</Triggers>
				</asp:UpdatePanel>

			</div>
		</div>
	</div>

	<!-- Edit Modal -->
	<div id="editModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>Editar Mapa</h3>
				</div>
				<asp:UpdatePanel ID="UpdatePanel2" runat="server">
					<ContentTemplate>
						<div class="modal-body form-group">

							<div class="row">
								<div>
									<asp:HiddenField ID="hdfPlanID" runat="server" />
									<label class="col-md-4 control-label">Nombre: </label>
									<div class="col-md-6">
										<asp:TextBox ID="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control" MaxLength="100"></asp:TextBox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
											SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtNombreEdit" runat="server"
											ValidationGroup="ValidationEdit" />
									</div>
								</div>
							</div>
							<br />

							<div class="row">
								<div>
									<label class="col-md-4 control-label">Descripcion: </label>
									<div class="col-md-6">
										<asp:TextBox ID="txtDescripcionEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
											SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtDescripcionEdit" runat="server"
											ValidationGroup="ValidationEdit" />
									</div>
								</div>
							</div>
							<br />

							<asp:PlaceHolder runat="server" ID="phEmpresaEdit">
								<div class="row form-group">
									<div>
										<label class="col-md-4 control-label">Empresa: </label>
										<div class="col-md-6">
											<asp:DropDownList ID="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged"></asp:DropDownList>
											<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
												SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
												Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server"
												ValidationGroup="ValidationEdit" />
										</div>
									</div>
								</div>
							</asp:PlaceHolder>

							<asp:PlaceHolder runat="server" ID="phSucursalEdit">
								<div class="row form-group">
									<div>
										<label class="col-md-4 control-label">Sucursal: </label>
										<div class="col-md-6">
											<asp:DropDownList ID="ddlSucursalEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
											<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
												SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
												Font-Bold="true" ControlToValidate="ddlSucursalEdit" runat="server"
												ValidationGroup="ValidationEdit" />
										</div>
									</div>
								</div>
							</asp:PlaceHolder>

							<div class="row">
								<div>
									<label class="col-md-4 control-label">Archivo: </label>
									<div class="col-md-6">
										<asp:FileUpload ID="flpArchivoEdit" runat="server" ClientIDMode="Static" ></asp:FileUpload>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
											SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="flpArchivoEdit" runat="server"
											ValidationGroup="ValidationEdit" />
									</div>
								</div>
							</div>
							<br />

						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationEdit" /></div>
								<div class="col-md-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
							</div>
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
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>Eliminar Registro</h3>
				</div>
				<asp:UpdatePanel ID="upDel" runat="server">
					<ContentTemplate>
						<div class="modal-body form-group">
							<asp:HiddenField ID="hdfPlanIDDel" runat="server" />
							<div class="row">
								<h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
							</div>

						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro" /></div>
								<div class="col-md-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
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
