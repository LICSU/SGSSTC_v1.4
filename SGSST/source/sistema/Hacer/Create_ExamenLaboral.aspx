<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ExamenLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ExamenLaboral" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>
			<script>
				$(function () {
					$("#accordion").accordion({
						collapsible: true
					});
				});

				function redireccionar() {
					window.location = "index.aspx";
				}
			</script>


			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="../Hacer/index_ExamenLaboral.aspx">Examen Laboral</a></li>
				<li><a href="#">Crear Examen Laboral</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Nuevo Examen Laboral</h1>
			</div>
			
			<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
				<div id="divAlerta" runat="server">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
				</div>
			</asp:PlaceHolder>

			<!-- Empresa -->
			<div class="row">
				<asp:PlaceHolder runat="server" ID="phEmpresa">
					<div class="col-md-3">
						<asp:Label runat="server" Text="Empresa"></asp:Label>
						<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom"
							title="Seleccione una Empresa" CssClass="form-control" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" ID="phSucursal">
					<div class="col-md-3">
						<asp:Label runat="server" Text="Sucursal"></asp:Label>
						<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip"
							data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control"
							OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>

						</asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<div class="col-md-4">
					<asp:Label runat="server" Text="Ubicación"></asp:Label>
					<br />
					<asp:Label runat="server" ID="lbUbicacion" Text="----"></asp:Label>
				</div>

				<div class="col-md-2">
					<asp:Label runat="server" Text="N° de Historia"></asp:Label>
					<br />
					<asp:Label runat="server" ID="lbNumHistoria" Text="----"></asp:Label>
				</div>
			</div>

			<hr />

			<!-- Tipo Examen -->
			<div class="row">
				<div class="col-md-4">
					<asp:Label runat="server" Text="Tipo de Examen"></asp:Label>

					<asp:DropDownList runat="server" ID="ddlTipoExamen" AutoPostBack="True" CssClass="form-control">
						<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
					</asp:DropDownList>
				</div>

				<div class="col-md-4">
					<asp:Label runat="server" Text="Fecha"></asp:Label>
					<br />
					<asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date" />
				</div>

				<div class="col-md-4">
					<asp:Label runat="server" Text="Trabajador"></asp:Label>

					<asp:DropDownList runat="server" ID="ddlTrabajador" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlTrabajador_SelectedIndexChanged">
						<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>

			<hr />

			<!-- datos del trabajador  -->
			<div class="accordion" id="accordion2">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
							<h3>Datos Personales</h3>
						</a>
					</div>

					<div id="collapseOne" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center">
								<h3>Información del Trabajador</h3>
							</div>
							<br />

							<!-- 1er nombre -->
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" ID="Label28" Text="Primer Nombre" Font-Bold="True"></asp:Label>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtNombre1" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />

							<!-- 2do nombre -->
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" ID="Label15" Text="Segundo Nombre" Font-Bold="True"></asp:Label>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtNombre2" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />

							<!-- Apellidos -->
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" ID="Label1" Text="Primer Apellido" Font-Bold="True"></asp:Label>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtApellido1" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" ID="Label16" Text="Segundo Apellido" Font-Bold="True"></asp:Label>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtApellido2" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />

							<!-- Cedula y FechaNacimiento -->
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" ID="Label3" Text="Cedula" Font-Bold="True"></asp:Label>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtCedula" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label20" Text="Fecha de Nacimiento" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtFechaNac" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />

							<!-- Email -->
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label2" Text="Email" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtEmail" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />

							<!-- Sexo - Edo civil -->
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label5" Text="Sexo" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtSexo" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label17" Text="Estado Civil" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtEdoCivil" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label7" Text="Télefono de Casa" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtTelCasa" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label6" Text="Teléfono Celular" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtTelCelular" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label9" Text="EPS" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Label runat="server" ID="txtEps" Text="----"></asp:Label>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="">
									<div class="col-md-12 text-left">
										<asp:Label runat="server" ID="Label8" Text="Foto" Font-Bold="True"></asp:Label>
									</div>
								</div>
								<div class="">
									<div class="col-md-6">
										<asp:Image alt="-" runat="server" ID="fuFoto"></asp:Image>
									</div>
									<div class="col-md-6">
										<asp:Image alt="-" runat="server" ID="Image1"></asp:Image>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" ID="Label12" Text="Dirección" Font-Bold="True"></asp:Label><br />
									<asp:Label runat="server" ID="txtDireccion" Text="----"></asp:Label>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
							<h3>Información SocioDemografica del Trabajador</h3>
						</a>
					</div>
					<div id="collapseTwo" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center">
								<h3>Información SocioDemografica</h3>
							</div>
							<br />
							<hr />

							<!-- Lugar de Nacimiento/nivel escolaridad -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Lugar de Nacimiento</h4>
									<asp:Label runat="server" ID="txtLugarNac" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Nivel de Escolaridad</h4>
									<asp:Label runat="server" ID="txtNivelEsc" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Años aprobados/cabeza de familia -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Años aprobados en ese último nivel</h4>
									<asp:Label runat="server" ID="txtAñosAprob" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>¿Es usted cabeza de familia?</h4>
									<asp:Label runat="server" ID="txtCabezaFlia" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Cuantos hijos/responsabilidad económica -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>¿Cuantos hijos tiene?</h4>
									<asp:Label runat="server" ID="txtCantHijos" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>¿Con quién reparte la responsabilidad económica de su familia?</h4>
									<asp:Label runat="server" ID="txtRespEco" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- MenoresDependen/Condicion Social -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>¿Cuantos menores dependen económicamente de ud?</h4>
									<asp:Label runat="server" ID="txtDependen" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>¿Socialmente en que condición se encuentra usted?</h4>
									<asp:Label runat="server" ID="txtCondSocio" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Motivo Desplazamiento/tipo de vivienda -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>¿Cual fue el motivo del desplazamiento?</h4>
									<asp:Label runat="server" ID="txtMotivoDespl" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>La vivienda donde habita es:</h4>
									<asp:Label runat="server" ID="txtTipoVivienda" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Servicios públicos / tipo de vivienda -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Servicios públicos de su vivienda</h4>
									<asp:Label runat="server" ID="txtServicioPublico" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Tipo de Vivienda</h4>
									<asp:Label runat="server" ID="txtVivienda" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Cerca de Industrias / Hay mucho ruido -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Cerca de Industrias</h4>
									<asp:Label runat="server" ID="txtCercaIndustria" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Hay mucho ruido</h4>
									<asp:Label runat="server" ID="txtRuido" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Hay Mucha Contaminación / Hay mucho ruido -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Hay Mucha Contaminación</h4>
									<asp:Label runat="server" ID="txtContaminacion" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Descripcion el techo, paredes y piso</h4>
									<asp:Label runat="server" ID="txtDescripcion" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!--  afiliado al sistema de seguridad social / Régimen de Afiliación -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Se encuentra afiliado al sistema de seguridad social en salud</h4>
									<asp:Label runat="server" ID="txtAfiliado" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Régimen de Afiliación</h4>
									<asp:Label runat="server" ID="txtRegimenAfiliacion" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!--  ¿A qué EPS pertenece? / Nivel de SISBEN -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>¿A qué EPS pertenece?</h4>
									<asp:Label runat="server" ID="txtEPS1" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Nivel de SISBEN</h4>
									<asp:Label runat="server" ID="txtNivelSISBEN" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!--  Sistea seg pensiones / ¿A qué fondo pertenece? -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>Se encuentra afiliado al sistema de seguridad social en pensiones</h4>
									<asp:Label runat="server" ID="txtSistSocial" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>¿A qué fondo pertenece?</h4>
									<asp:Label runat="server" ID="txtFondoPensiones" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!--  afiliado a riesgos profe / ¿A qué ARP pertenece? -->
							<div class="row">
								<div class="col-md-6 text-left">
									<h4>¿A qué ARP pertenece?</h4>
									<asp:Label runat="server" ID="txtARP" Text="----"></asp:Label>
								</div>
								<div class="col-md-6">
									<h4>Se encuentra afiliado a riesgos profesionales</h4>
									<asp:Label runat="server" ID="txtRiesgosProf" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!--  Estrato / ¿A qué ARP pertenece? -->
							<div class="row">
								<div class="col-md-12 text-left">
									<h4>¿Cual es el estrato que registran sus facturas de los servicios públicos de la vivienda donde reside?</h4>
									<asp:Label runat="server" ID="txtEstrato" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!--  Empleos Anteriores -->
							<div class="col-md-12 text-center">
								<h3>Empleos Anteriores</h3>
							</div>
							<hr />

							<div class="row">
								<div class="col-md-2 text-left">
									<h4>Empresa</h4>
								</div>
								<div class="col-md-2 text-left">
									<h4>Área</h4>
								</div>
								<div class="col-md-2 text-left">
									<h4>Cargo u Oficio</h4>
								</div>
								<div class="col-md-2 text-left">
									<h4>Años</h4>
								</div>
								<div class="col-md-2 text-left">
									<h4>Meses</h4>
								</div>
								<div class="col-md-2 text-left">
									<h4>Enfermedades adquiridas en el cargo</h4>
								</div>
							</div>

							<asp:PlaceHolder runat="server" ID="phempleo1" Visible="false">
								<hr />
								<div class="row">
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtEmpresa1" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtArea1" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtCargo1" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtAños1" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtMeses1" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtEnfermedades1" Text="----"></asp:Label>
									</div>
								</div>
							</asp:PlaceHolder>

							<asp:PlaceHolder runat="server" ID="phempleo2" Visible="false">
								<hr />
								<div class="row">
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtEmpresa2" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtArea2" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtCargo2" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtAños2" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtMeses2" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtEnfermedades2" Text="----"></asp:Label>
									</div>
								</div>
							</asp:PlaceHolder>

							<asp:PlaceHolder runat="server" ID="phempleo3" Visible="false">
								<hr />
								<div class="row">
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtEmpresa3" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtArea3" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtCargo3" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtAños3" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtMeses3" Text="----"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Label runat="server" ID="txtEnfermedades3" Text="----"></asp:Label>
									</div>
								</div>
							</asp:PlaceHolder>
							<br />


						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTree">
							<h3>Información del Puesto de Trabajo del Trabajador</h3>
						</a>
					</div>
					<div id="collapseTree" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center">
								<h3>Información del Puesto de Trabajo</h3>
							</div>
							<br />

							<!-- Nombre -->
							<div class="row">
								<div class="col-md-12 text-left">
									<h4>Nombre del Puesto</h4>
									<asp:Label runat="server" ID="txtNombrePuesto" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Descripcion -->
							<div class="row">
								<div class="col-md-12 text-left">
									<h4>Descripcion del Puesto</h4>
									<asp:Label runat="server" ID="txtDescPuesto" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<!-- Area -->
							<div class="row">
								<div class="col-md-12 text-left">
									<h4>Area del Puesto</h4>
									<asp:Label runat="server" ID="txtAreaPuesto" Text="----"></asp:Label>
								</div>
							</div>
							<br />

							<div class="col-md-12 text-center">
								<h3>Información del Riesgos del Puesto de Trabajo</h3>
							</div>
							<br />
							<br />
							<br />
							<br />

							<div class="row">
								<div class="box-body">
									<div class="dataTables_wrapper form-inline dt-bootstrap">
										

										<asp:GridView ID="GridView4"
											class="table table-bordered table-hover dataTable"
											runat="server"
											AutoGenerateColumns="false"
											AllowPaging="true"
											PageSize="10"
											OnPageIndexChanging="GridView4_PageIndexChanging"
											EmptyDataText="No existen Registros">
											<RowStyle HorizontalAlign="Center" />

											<Columns>
												<asp:TemplateField HeaderText="Riesgo">
													<ItemTemplate>
														<asp:Label ID="identificacion_riesgo" runat="server" Text='<%# Eval("identificacion_riesgo") %>' />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Probabilidad">
													<ItemTemplate>
														<asp:Label ID="probabilidad" runat="server" Text='<%# Eval("probabilidad") %>' />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Severidad">
													<ItemTemplate>
														<asp:Label ID="severidad" runat="server" Text='<%# Eval("severidad") %>' />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Valor de Riesgo">
													<ItemTemplate>
														<asp:Label ID="valor_riesgo" runat="server" Text='<%# Eval("valor_riesgo") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Prioridad">
													<ItemTemplate>
														<asp:Label ID="prioridad" runat="server" Text='<%# Eval("prioridad") %>' />
													</ItemTemplate>
												</asp:TemplateField>

											</Columns>
										</asp:GridView>
									</div>
								</div>
							</div>
							<br />
							<hr />
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
							<h3>Accidentes Laborales del Trabajador</h3>
						</a>
					</div>
					<div id="collapseFour" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center">
								<h3>Accidentes Laborales del Trabajador</h3>
							</div>
							<br />
							<br />
							<br />

							<div class="row">
								<div class="box-body">
									<div class="dataTables_wrapper form-inline dt-bootstrap">
										<ucpag:pagination runat="server" ID="pagination0" />

										<asp:GridView ID="GridView1"
											class="table table-bordered table-hover dataTable"
											runat="server"
											AutoGenerateColumns="false"
											AllowPaging="true"
											PageSize="10"
											OnPageIndexChanging="GridView1_PageIndexChanging"
											OnRowCommand="GridView1_RowCommand"
											EmptyDataText="No existen Registros">
											<RowStyle HorizontalAlign="Center" />


											<Columns>
												<asp:TemplateField HeaderText="Id Accidente">
													<ItemTemplate>
														<asp:Label ID="id" runat="server" Text='<%# Eval("id_acc_lab") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Fecha del Accidente">
													<ItemTemplate>
														<asp:Label ID="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Afectado">
													<ItemTemplate>
														<asp:Label ID="afectado" runat="server" Text='<%# Eval("nombre") %>' /></ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Ver">
													<ItemTemplate>
														<asp:HyperLink ID="hlEscaneado" runat="server" Target="_blank" NavigateUrl='<%# Eval("documento_escaneado") %>'>Ver Archivo </asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateField>

												<asp:ButtonField CommandName="verDetalle" ButtonType="Image" ImageUrl="~\ico\view.png">
													<ControlStyle></ControlStyle>
												</asp:ButtonField>

											</Columns>
										</asp:GridView>
									</div>
								</div>
							</div>
							<br />
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive">
							<h3>Examenes Laborales del Trabajador</h3>
						</a>
					</div>
					<div id="collapseFive" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center">
								<h3>Examenes Laborales del Trabajador</h3>
							</div>
							<br />
							<br />
							<br />

							<div class="row">
								<div class="box-body">
									<div class="dataTables_wrapper form-inline dt-bootstrap">
										<ucpag:pagination runat="server" ID="pagination1" />

										<asp:GridView ID="GridView2"
											class="table table-bordered table-hover dataTable"
											runat="server"
											AutoGenerateColumns="false"
											AllowPaging="true"
											PageSize="10"
											OnPageIndexChanging="GridView2_PageIndexChanging"
											EmptyDataText="No existen Registros">
											<RowStyle HorizontalAlign="Center" />

											<Columns>
												<asp:TemplateField HeaderText="Id Historia">
													<ItemTemplate>
														<asp:Label ID="id_his_cli_ocu" runat="server" Text='<%# Eval("id_his_cli_ocu") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Fecha">
													<ItemTemplate>
														<asp:Label ID="fecha" runat="server" Text='<%# Eval("fecha") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Diagnostico">
													<ItemTemplate>
														<asp:Label ID="diagnostico" runat="server" Text='<%# Eval("diagnostico") %>' /></ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Recomendaciones">
													<ItemTemplate>
														<asp:Label ID="recomendaciones" runat="server" Text='<%# Eval("recomendaciones") %>' /></ItemTemplate>
												</asp:TemplateField>

											</Columns>
										</asp:GridView>
									</div>
								</div>
							</div>
							<br />

						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix">
							<h3>Equipos Laborales del Trabajador</h3>
						</a>
					</div>
					<div id="collapseSix" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center">
								<h3>Equipos Laborales del Trabajador</h3>
							</div>
							<br />
							<br />
							<br />

							<div class="row">
								<div class="box-body">
									<div class="dataTables_wrapper form-inline dt-bootstrap">
										<ucpag:pagination runat="server" ID="pagination2" />

										<asp:GridView ID="GridView3"
											class="table table-bordered table-hover dataTable"
											runat="server"
											AutoGenerateColumns="false"
											AllowPaging="true"
											PageSize="10"
											OnPageIndexChanging="GridView3_PageIndexChanging"
											EmptyDataText="No existen Registros">
											<RowStyle HorizontalAlign="Center" />


											<Columns>
												<asp:TemplateField HeaderText="Nombre">
													<ItemTemplate>
														<asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Fecha">
													<ItemTemplate>
														<asp:Label ID="Label4" runat="server" Text='<%# Eval("fecha") %>' />
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Tipo">
													<ItemTemplate>
														<asp:Label ID="tipo" runat="server" Text='<%# Eval("tipo") %>' /></ItemTemplate>
												</asp:TemplateField>

											</Columns>
										</asp:GridView>
									</div>
								</div>
							</div>
							<br />
						</div>
					</div>
				</div>

			</div>

			<br />

			<!-- tabs  -->
			<div class="row">
				<div class="col-md-12">
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_1" data-toggle="tab" aria-expanded="true">Tab 1</a>
							</li>
							<li class="">
								<a href="#tab_2" data-toggle="tab" aria-expanded="false">Tab 2</a>
							</li>
							<li>
								<a href="#tab_3" data-toggle="tab">Tab 3</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1">
								<div class="row text-center">
									<div class="col-md-10">
										<asp:Table runat="server" ID="tbl1" CssClass="table">

											<asp:TableHeaderRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" ColumnSpan="5">
		   <label>HISTORIA CLINICA</label>
												</asp:TableHeaderCell>
											</asp:TableHeaderRow>

											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Oficios desempeñados Empresa/ Area</label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Ocupacion/ Oficio</label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Tiempo Años/ Meses</label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Ha presentado una enfermedad causada por el trabajo</label>
												</asp:TableHeaderCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>1. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center">
		   <label>
	 Si____  No_____
 </label>
												</asp:TableHeaderCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
			 <label>2. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
			 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
			 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center" RowSpan="6">
			 <label></label>
												</asp:TableHeaderCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>2. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>3. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>4. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>5. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>Actual. </label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
												<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
												</asp:TableHeaderCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>
							</div>

							<div class="tab-pane" id="tab_2">
								<b>Registro de Historia Clinica Ocupacional<br />
									Para Ser llenado por el Médico</b><br />

								<!-- Tabla #1 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="3">
		   <label>EXAMEN FÍSICO</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>Peso:
														<asp:TextBox CssClass="txt-corto" runat="server" ID="txtPeso" />
														Kg.</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>Estatura:
														<asp:TextBox CssClass="txt-corto" runat="server" ID="txtEstatura" />
														Mts. IMC:<asp:TextBox CssClass="txt-corto" runat="server" ID="txtIMC" /></label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>P.A:<asp:TextBox CssClass="txt-corto" runat="server" ID="txtPA1" />/<asp:TextBox CssClass="txt-corto" runat="server" ID="txtPA2" />
														Pulso:<asp:TextBox CssClass="txt-corto" runat="server" ID="txtPulso" />
														F.R:<asp:TextBox runat="server" ID="txtFR" CssClass="txt-corto" /></label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
													<label>
														Estado General:<asp:TextBox runat="server" ID="txtEstadoGen" />.
			  Diestro:<asp:DropDownList runat="server" ID="ddlDiestro">
				  <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
				  <asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
			  </asp:DropDownList>
														. 
			  Zurdo:<asp:DropDownList runat="server" ID="ddlZurdo">
				  <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
				  <asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
			  </asp:DropDownList>. 
			  Ambidiestro:<asp:DropDownList runat="server" ID="ddlAmbidiestro">
				  <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
				  <asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
			  </asp:DropDownList>.</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>Estado Mental:<asp:TextBox CssClass="txt-corto" runat="server" ID="txtEstadoMental" /></label>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #2 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table2" runat="server" Style="margin: 0 auto;" CssClass="table">

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="7">
		 <label>CABEZA</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Parte del cuerpo</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Estado</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Descripción</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Parte del cuerpo</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Estado</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Descripción</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Craneo</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbCraneo">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescCraneo" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Mucosa Nasal</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbMucosa">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescMuco" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="5">
		 <label>Ojos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Párpados</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbParpados">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescPar" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Senos Paranasales</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbSenos">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescSenos" TextMode="MultiLine" />
												</asp:TableCell>

											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Conjuntiva</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbConjuntiva">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescConjun" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Paladar</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbPaladar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescPala" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Escleras</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbEscaleras">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescEscl" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Mucosa Oral</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbMucosaOral">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescMucoOral" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Córnea</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbCornea">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescCornea" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Dentadura</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbDentadura">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescDent" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Iris Pupila</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbIris">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescIris" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Amigdalas</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbAmigdalas">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescAmig" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label></label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Pabellones</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbPabellones">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescPabe" TextMode="MultiLine" />
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Faringe</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbFaringe">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescFarin" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
		 <label>Oidos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Conductos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbConductos">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescConduc" TextMode="MultiLine" />
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Lengua</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbLengua">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescLengua" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Timpanos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbTimpanos">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescTimpano" TextMode="MultiLine" />
												</asp:TableCell>

											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #3 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table3" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4">
		   <label>Agudeza Visual</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Carta Snellen</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>OD</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>OI</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>AO</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cercana</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>20/<asp:TextBox runat="server" ID="txtODCercana" CssClass="txt-corto" /></label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>20/<asp:TextBox runat="server" ID="txtOICercana" CssClass="txt-corto" /></label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>20/<asp:TextBox runat="server" ID="txtAOCercana" CssClass="txt-corto" /></label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Lejana</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>20/<asp:TextBox runat="server" ID="txtODLejana" CssClass="txt-corto" /></label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>20/<asp:TextBox runat="server" ID="txtOILejana" CssClass="txt-corto" /></label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>20/<asp:TextBox runat="server" ID="txtAOLejana" CssClass="txt-corto" /></label>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #4 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table4" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cuello</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Descripción</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Tórax</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Descripción</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Inspección</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInspeccion">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescInsp" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Auscultación</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbAuscultacion">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescAusc" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Palpación</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbPalpacion">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescPalp" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Murmullo Vesicular</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbrMulloVesicular">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescMurmu" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Adenopatias</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbAdenopatias">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescAdeno" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Ruidos Cardiacos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRuidosCardiacos">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescRuidos" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Glándula Tiroides</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbGlandulaTiroides">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescGalnd" TextMode="MultiLine" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Soplos</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbSoplos">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescSoplos" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #5 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table5" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" Width="400px">
		   <label>Abdomen</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Parte del Cuerpo</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Descripción</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
													<asp:TextBox runat="server" ID="txtDescAbdomen" TextMode="MultiLine" PlaceHolder="Descripcion" Rows="9" Columns="70" />
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Mamas</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbMamas">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescMamas" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Piel</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbPiel">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescPiel" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Uñas</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbUnas">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescUnas" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
													<asp:TextBox runat="server" ID="txtDescHerina" TextMode="MultiLine" PlaceHolder="Hernia.." Rows="9" Columns="70" />
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cicatrices</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbCicatrices">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescCicat" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Tatuajes</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbTatuajes">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescTatu" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Varices</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbVarices">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtDescVarices" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #6 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table6" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
	 <label>Arcos de Movimiento</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
	 <label>Miembros Superiores</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
	 <label>Arcos de Movimiento</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
	 <label>Miembros Inferiores</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Hombro</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Codo</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Muñeca</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Dedos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Cadera</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Rodilla</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Pie</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Dedos</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Flexión</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Flexión</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="f16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="e16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ab16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ad16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="ri16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="re16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="p16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="s16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow CssClass="text-center">
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm1"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm2"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm3"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm4"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm5"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm6"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm7"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm8"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm9"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm10"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm11"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm12"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm13"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm14"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm15"></asp:CheckBox>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:CheckBox runat="server" ID="fm16"></asp:CheckBox>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #7 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table7" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
		   <label>Arcos de Movimiento</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cervical</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Dorso Lumbar</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Dolor</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Flexión</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbFlexionCervical">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbFlexionDorsoLumbar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbFlexionDolor">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Extensión</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbExtensionCervical">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbExtensionDorsoLumbar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbExtensionDolor">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Rotación Derecha</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRotDerCervical">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRotDerDorsoLumbar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRotDerDolor">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Rotación Izquierda</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRotIzqCervical">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRotIzqDorsoLumbar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbRotIzqDolor">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Inclinacion Lateral Derecha</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInlLatDerCervical">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInlLatDerDorsoLumbar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInlLatDerDolor">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Inclinacion Lateral Izquierda</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInlLatIzqCervical">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInlLatIzqDorsoLumbar">
														<asp:ListItem Text="Normal" Value="Normal" />
														<asp:ListItem Text="Anormal" Value="Anormal" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbInlLatIzqDolor">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>

											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #8 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table8" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Escoliosis</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cervical</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Dorsal</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Lumbar</label>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Derecha</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbDerCervical">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbDerDorsal">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbDerLumbar">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>

											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Izquierda</label>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbIzqCervical">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbIzqDorsal">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>

												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:RadioButtonList runat="server" ID="rbIzqLumbar">
														<asp:ListItem Text="Si" Value="Si" />
														<asp:ListItem Text="No" Value="No" />
													</asp:RadioButtonList>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>
							</div>

							<div class="tab-pane" id="tab_3">
								<b>Registro de Historia Clinica Ocupacional</b><br />

								<!-- Tabla #1 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table9" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Diagnosticos</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" TextMode="MultiLine" ID="txtDiagnostico" Rows="7" Columns="110" MaxLength="1000" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #2 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table10" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
			 <label>Recomendaciones</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
													<asp:TextBox runat="server" MaxLength="1000" TextMode="MultiLine" ID="txtRecomendaciones" Rows="7" Columns="110" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #3 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table11" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3" Width="240px">
	 <label>Uso de elementos de Proteccion recomendado para la labor asignada</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Ojos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Oidos</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Cara</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Cabeza</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Respiracion</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Traje</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Otro (¿Cúal?)</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:DropDownList runat="server" ID="ddlOjos">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:DropDownList runat="server" ID="ddlOidos">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:DropDownList runat="server" ID="ddlCara">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:DropDownList runat="server" ID="ddlCabeza">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:DropDownList runat="server" ID="ddlRespiracion">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:DropDownList runat="server" ID="ddlTraje">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<asp:TextBox runat="server" ID="txtOtroElemPro" TextMode="MultiLine" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #4 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table12" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">

													<asp:RadioButtonList runat="server" ID="rbElegible">
														<asp:ListItem Text="Elegible" Value="Elegible" />
														<asp:ListItem Text="Elegible con restricciones que no interfieren con su trabajo normal" Value="Elegible con restricciones que no interfieren con su trabajo normal" />
														<asp:ListItem Text="Elegible con restricciones que difieren en su trabajo normal" Value="Elegible con restricciones que difieren en su trabajo normal" />
														<asp:ListItem Text="No Elegible" Value="No Elegible" />
													</asp:RadioButtonList>

												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>

								<!-- Tabla #5 -->
								<br />
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table13" runat="server" Style="margin: 0 auto;" CssClass="table">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
													<label>
														Requiere rebicación:
		 <asp:RadioButtonList runat="server" ID="rbReubicacion">
			 <asp:ListItem Text="Si" Value="Si" />
			 <asp:ListItem Text="No" Value="No" />
		 </asp:RadioButtonList>

														Restricciones</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
													<asp:TextBox runat="server" TextMode="MultiLine" ID="txtRestricciones" Rows="7" Columns="110" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>
								<br />

								<!-- Tabla #6 -->
								<div class="row">
									<div class="col-md-10">
										<asp:Table ID="Table14" runat="server" Style="margin: 0 auto;" CssClass="table text-center">
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <label>FECHA DEL EXAMEN</label>
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <label>FIRMA Y SELLO DEL MEDICO EXAMINADOR</label>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
													<asp:TextBox TextMode="Date" ID="txtFechaExamen" CssClass="form-control" runat="server" />
												</asp:TableCell>
												<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <label></label>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</div>
									<div class="col-md-2"></div>
								</div>
								<br />

								<div class="row text-center">
									<div class="col-md-4 col-md-offset-4">
										<asp:Button Text="GUARDAR" CssClass="btn btn-block btn-info" runat="server" ID="btnGuardar" OnClick="GuardarRegistro" />
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Impresion  -->
			<div class="container" id="zonaPrint" style="opacity: 0; width: 100%;">
				<script>
					function imprimir() {
						w = window.open();
						w.document.write($('#zonaPrint').html());
						w.print();
						w.close();
					}
				</script>

				<!-- Tab1-->
				<div class="row">
					<label>Empresa:
						<asp:Label ID="lblEmpresa" runat="server" /></label><br />
					<label>Dirección:
						<asp:Label ID="lblDireccion" runat="server"></asp:Label></label><br />
					<label>Nro de Historia:
						<asp:Label ID="lblNumero" runat="server"></asp:Label></label><br />
					<label>Tipo de Examen:
						<asp:Label ID="lblTipodeExamen" runat="server"></asp:Label></label><br />
					<label>Fecha:
						<asp:Label ID="lblFecha" runat="server"></asp:Label></label><br />

					<div class="row text-center">
						<div class="col-md-10">
							<asp:Table runat="server" ID="Table1" CssClass="table">
								<asp:TableHeaderRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" ColumnSpan="5">
								<label>HISTORIA CLINICA</label>
									</asp:TableHeaderCell>
								</asp:TableHeaderRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Oficios desempeñados Empresa/ Area</label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Ocupacion/ Oficio</label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Tiempo Años/ Meses</label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Ha presentado una enfermedad causada por el trabajo</label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>1. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center">
								<label>
									Si____  No_____
								</label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>2. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center" RowSpan="6">
								<label>
									
								</label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>2. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>3. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>4. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>5. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Actual. </label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
									<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
									</asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>

				<!-- Tab2 -->
				<div class="row">
					<div class="row text-center">
						<asp:Label ID="Label10" runat="server" Text="Registro de Historia Clinica Ocupacional"></asp:Label><br />
						<asp:Label ID="Label19" runat="server" Text="Para Ser llenado por el Médico"></asp:Label>
					</div>
					<br />

					<!-- Tabla #1 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="3">
										<label>EXAMEN FÍSICO</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Peso:
											<asp:Label CssClass="txt-corto" runat="server" ID="txtPeso1"></asp:Label>
											Kg.</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estatura:
											<asp:Label CssClass="txt-corto" runat="server" ID="txtEstatura1"></asp:Label>
											Mts. IMC:<asp:Label CssClass="txt-corto" runat="server" ID="txtIMC1"></asp:Label></label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>
											P.A:
 <asp:Label CssClass="txt-corto" runat="server" ID="txtPA11"></asp:Label>
											/
 <asp:Label CssClass="txt-corto" runat="server" ID="txtPA22"></asp:Label>
											Pulso:
 <asp:Label CssClass="txt-corto" runat="server" ID="txtPulso1"></asp:Label>
											F.R:
 <asp:Label runat="server" ID="txtFR1" CssClass="txt-corto"></asp:Label></label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>
											Estado General:<asp:Label runat="server" ID="txtEstadoGen1"></asp:Label>.
 Diestro:<asp:Label runat="server" ID="ddlDiestro1"></asp:Label>
											. 
 Zurdo:<asp:Label runat="server" ID="ddlZurdo1"></asp:Label>. 
 Ambidiestro:<asp:Label runat="server" ID="ddlAmbidiestro1"></asp:Label>.</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado Mental:<asp:Label CssClass="txt-corto" runat="server" ID="txtEstadoMental1"></asp:Label></label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #2 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table16" runat="server" Style="margin: 0 auto;" CssClass="table">

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="7">
										<label>CABEZA</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Parte del cuerpo</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Parte del cuerpo</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Craneo</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbCraneo1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescCraneo1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Mucosa Nasal</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbMucosa1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescMuco1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="5">
										<label>Ojos</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Párpados</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbParpados1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescPar1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Senos Paranasales</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbSenos1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescSenos1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Conjuntiva</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbConjuntiva1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescConjun1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Paladar</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbPaladar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescPala1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Escleras</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbEscaleras1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescEscl1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Mucosa Oral</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbMucosaOral1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescMucoOral1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Córnea</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbCornea1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescCornea1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Dentadura</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbDentadura1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescDent1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Iris Pupila</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbIris1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescIris1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Amigdalas</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbAmigdalas1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescAmig1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label></label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Pabellones</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbPabellones1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescPabe1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Faringe</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbFaringe1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescFarin1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
										<label>Oidos</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Conductos</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbConductos1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescConduc1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Lengua</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbLengua1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescLengua1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Timpanos</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbTimpanos1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescTimpano1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #3 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table17" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4">
										<label>Agudeza Visual</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Carta Snellen</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>OD</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>OI</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>AO</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cercana</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" ID="txtODCercana1" CssClass="txt-corto" /></label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" ID="txtOICercana1" CssClass="txt-corto" /></label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" ID="txtAOCercana1" CssClass="txt-corto" /></label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Lejana</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" ID="txtODLejana1" CssClass="txt-corto" /></label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" ID="txtOILejana1" CssClass="txt-corto" /></label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" ID="txtAOLejana1" CssClass="txt-corto" /></label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #4 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table18" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cuello</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Tórax</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Inspección</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInspeccion1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescInsp1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Auscultación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbAuscultacion1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescAusc1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Palpación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbPalpacion1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescPalp1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Murmullo Vesicular</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbrMulloVesicular1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescMurmu1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Adenopatias</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbAdenopatias1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescAdeno1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Ruidos Cardiacos</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRuidosCardiacos1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescRuidos1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Glándula Tiroides</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbGlandulaTiroides1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescGalnd1" TextMode="MultiLine" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Soplos</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbSoplos1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescSoplos1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #5 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table19" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" Width="400px">
										<label>Abdomen</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Parte del Cuerpo</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
										<asp:TextBox runat="server" ID="txtDescAbdomen1" TextMode="MultiLine" PlaceHolder="Descripcion" Rows="9" Columns="70" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Mamas</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbMamas1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescMamas1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Piel</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbPiel1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescPiel1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Uñas</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbUnas1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescUnas1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
										<asp:TextBox runat="server" ID="txtDescHerina1" TextMode="MultiLine" PlaceHolder="Hernia.." Rows="9" Columns="70" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cicatrices</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbCicatrices1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescCicat1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Tatuajes</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbTatuajes1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescTatu1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Varices</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbVarices1" runat="server" />
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" ID="txtDescVarices1" TextMode="MultiLine" />
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #6 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table20" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
										<label>Arcos de Movimiento</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
										<label>Miembros Superiores</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
										<label>Arcos de Movimiento</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
										<label>Miembros Inferiores</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Hombro</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Codo</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Muñeca</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Dedos</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Cadera</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Rodilla</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Pie</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Dedos</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Flexión</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Flexión</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="f161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="e161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ab161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad2111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ad161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="ri161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="re161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="p161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="s161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm1111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm21"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm31"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm41"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm51"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm61"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm71"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm81"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm91"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm101"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm111"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm121"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm131"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm141"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm151"></asp:CheckBox>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:CheckBox runat="server" ID="fm161"></asp:CheckBox>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #7 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table21" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
										 <label>Arcos de Movimiento</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Cervical</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Dorso Lumbar</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Dolor</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Estado</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Flexión</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbFlexionCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbFlexionDorsoLumbar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbFlexionDolor1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Extensión</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbExtensionCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbExtensionDorsoLumbar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbExtensionDolor1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Rotación Derecha</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRotDerCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRotDerDorsoLumbar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRotDerDolor1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Rotación Izquierda</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRotIzqCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRotIzqDorsoLumbar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbRotIzqDolor1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Inclinacion Lateral Derecha</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInlLatDerCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInlLatDerDorsoLumbar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInlLatDerDolor1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Inclinacion Lateral Izquierda</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInlLatIzqCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInlLatIzqDorsoLumbar1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbInlLatIzqDolor1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #8 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table22" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Escoliosis</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cervical</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Dorsal</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Lumbar</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Derecha</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbDerCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbDerDorsal1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbDerLumbar1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Izquierda</label>
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbIzqCervical1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbIzqDorsal1" runat="server" />
									</asp:TableCell>

									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label ID="rbIzqLumbar1" runat="server" />
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>

					<div style="height: 20px;"></div>
				</div>

				<!-- Tab3 -->
				<div class="row">
					<div class="row text-center">
						<asp:Label ID="Label23" runat="server" Text="Registro de Historia Clinica Ocupacional"></asp:Label><br />
					</div>
					<br />

					<!-- Tabla #1 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table15" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Diagnosticos</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="txtDiagnostico1"></asp:Label>
									</asp:TableCell>
								</asp:TableRow>

							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #2 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table23" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Recomendaciones</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
										<asp:Label runat="server" ID="txtRecomendaciones1"></asp:Label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #3 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table24" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3" Width="240px">
									<label>Uso de elementos de Proteccion recomendado para la labor asignada</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Ojos</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Oidos</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Cara</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Cabeza</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Respiracion</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Traje</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Otro (¿Cúal?)</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="ojos1"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="oidos1"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="cara1"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="cabeza1"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="respiracion1"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="traje1"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label runat="server" ID="otro1"></asp:Label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #4 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table25" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">

										<asp:RadioButtonList runat="server" ID="rbElegible1">
											<asp:ListItem Text="Elegible" Value="Elegible" />
											<asp:ListItem Text="Elegible con restricciones que no interfieren con su trabajo normal" Value="Elegible con restricciones que no interfieren con su trabajo normal" />
											<asp:ListItem Text="Elegible con restricciones que difieren en su trabajo normal" Value="Elegible con restricciones que difieren en su trabajo normal" />
											<asp:ListItem Text="No Elegible" Value="No Elegible" />
										</asp:RadioButtonList>

									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #5 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table26" runat="server" Style="margin: 0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>
											Requiere rebicación:
										
										<asp:RadioButtonList runat="server" ID="rbReubicacion1">
											<asp:ListItem Text="Si" Value="Si" />
											<asp:ListItem Text="No" Value="No" />
										</asp:RadioButtonList>

											Restricciones</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
										<asp:Label runat="server" ID="txtRestricciones1"></asp:Label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />

					<!-- Tabla #6 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table ID="Table27" runat="server" Style="margin: 0 auto;" CssClass="table text-center">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<label>FECHA DEL EXAMEN</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<label>FIRMA Y SELLO DEL MEDICO EXAMINADOR</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
										<asp:Label TextMode="Date" ID="txtFechaExamen1" runat="server"></asp:Label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<label></label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>

</asp:Content>
