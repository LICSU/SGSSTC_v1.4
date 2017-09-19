<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_Accidentes.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.Update_Accidentes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="../Hacer/index_AccidenteLaboral.aspx">Accidentes Laborales</a></li>
				<li><a href="#">Actualizar Accidente Laboral</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Actualizar Accidente Laboral</h1>
			</div>

			<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
				<div id="divAlerta" runat="server">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
				</div>
			</asp:PlaceHolder>

			<div class="row">

				<div class="col-md-10 col-md-offset-1">

					<div class="row">
						<asp:PlaceHolder runat="server" ID="phEmpresa">
							<div class="col-md-4">
								<h3>Empresa</h3>

								<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true"
									OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
								</asp:DropDownList>

								<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
									Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
									ControlToValidate="ddlEmpresa" runat="server" ValidationGroup="ValidationAdd" />
							</div>
						</asp:PlaceHolder>

						<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
							<h3>Sucursal</h3>
							<div class="col-md-4">
								<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true"
									OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
								</asp:DropDownList>

								<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
									Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
									ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd" />
							</div>
						</asp:PlaceHolder>
					</div>

					<br />

					<!-- Información del Accidente -->
					<div class="row">
						<h3>Información del Accidente</h3>

						<div class="col-md-4">
							<h4>Fecha del Accidente</h4>
							<asp:TextBox ID="txtFechaAcc" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="Date"></asp:TextBox>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="txtFechaAcc" runat="server" ValidationGroup="ValidationAdd" />
						</div>

						<div class="col-md-4">
							<h4>Hora del Accidente</h4>
							<asp:TextBox ID="txtHoraAcc" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="Time"></asp:TextBox>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="txtHoraAcc" runat="server" ValidationGroup="ValidationAdd" />
						</div>

					</div>
					<br />

					<!-- Información de la Persona Afectada-->
					<div class="row">
						<h3>Información de la Persona Afectada</h3>

						<div class="col-md-4">
							<h4>Trabajador</h4>
                            <asp:TextBox ID="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                            <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTrabajador" ID="AutoCompleteExtender1" runat="server"
                                FirstRowSelected="false"
                                CompletionListCssClass="completionList"
                                CompletionListItemCssClass="listItem"
                                CompletionListHighlightedItemCssClass="itemHighlighted">
                            </cc1:AutoCompleteExtender>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="txtTrabajador" runat="server" ValidationGroup="ValidationAdd" />
						</div>

						<div class="col-md-4">
							<h4>Area</h4>

							<asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" CssClass="form-control"></asp:DropDownList>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="ddlArea" runat="server" ValidationGroup="ValidationAdd" />

						</div>

						<div class="col-md-4">
							<h4>Puesto de Trabajo</h4>

							<asp:DropDownList runat="server" ID="ddlProcesoTrabajo" CssClass="form-control">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="ddlProcesoTrabajo" runat="server" ValidationGroup="ValidationAdd" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<h4>Sitio donde se presentó el caso.</h4>
							<asp:TextBox ID="txtSitioAccidente" MaxLength="5000" runat="server" TextMode="multiline" class="form-control"
								Rows="5">
							</asp:TextBox>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="txtSitioAccidente" runat="server" ValidationGroup="ValidationAdd" />
						</div>
						<div class="col-md-6">
							<h4>Breve descripción de los hechos</h4>

							<asp:TextBox ID="txtDescTarea" runat="server" MaxLength="5000" TextMode="multiline" Rows="5" class="form-control"></asp:TextBox>

							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
								ControlToValidate="txtDescTarea" runat="server" ValidationGroup="ValidationAdd" />
						</div>
					</div>
					<br />

					<!-- CondicionesInseguras-->
					<div class="row">
						<h3>CAUSAS INMEDIATAS - Condiciones Inseguras</h3>

						<div class="col-md-12">
							<asp:TextBox ID="txtCondIns" runat="server" MaxLength="1000" TextMode="multiline" Rows="3" class="form-control"
								ReadOnly="true"></asp:TextBox>
						</div>
						<br />
						<div class="col-md-3">
							<asp:Button runat="server" ID="btnReset" Text="Resetear Valores" class="btn btn-block btn-success"
								OnClick="btnReset_Click"></asp:Button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>1) Defecto de los agentes</h5>
							<asp:DropDownList ID="Dropdownlist1" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="001 Elaborado con materiales inadecuados" Value="001 Elaborado con materiales inadecuados"></asp:ListItem>
								<asp:ListItem Text="005 Romo, embotado, obtuso" Value="005 Romo, embotado, obtuso"></asp:ListItem>
								<asp:ListItem Text="010 Elaborado, construido, ensamblado ..." Value="010 Elaborado, construido, ensamblado inapropiadamente"></asp:ListItem>
								<asp:ListItem Text="015 Diseñado inapropiadamente" Value="015 Diseñado inapropiadamente"></asp:ListItem>
								<asp:ListItem Text="020 Áspero, tosco" Value="020 Áspero, tosco"></asp:ListItem>
								<asp:ListItem Text="025 Agudo, cortante" Value="025 Agudo, cortante"></asp:ListItem>
								<asp:ListItem Text="030 Resbaloso" Value="030 Resbaloso"></asp:ListItem>
								<asp:ListItem Text="035 Desgastado, cuarteado, raído,roto ..." Value="035 Desgastado, cuarteado, raído, roto, etc."></asp:ListItem>
								<asp:ListItem Text="099 Otros defectos no especificados   ..." Value="099 Otros defectos no especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>2) Riesgo de la ropa o vestuario</h5>
							<asp:DropDownList ID="Dropdownlist2" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="110 Carencia del equipo de protección  ..." Value="110 Carencia del equipo de protección personal necesario"></asp:ListItem>
								<asp:ListItem Text="113 Ropa inadecuada o inapropiada" Value="113 Ropa inadecuada o inapropiada"></asp:ListItem>
								<asp:ListItem Text="199 Riesgos de la ropa o vestuario  ..." Value="199 Riesgos de la ropa o vestuario no especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>3) Riesgos ambientales no especificados</h5>
							<asp:DropDownList ID="Dropdownlist3" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="205 Ruido excesivo" Value="205 Ruido excesivo"></asp:ListItem>
								<asp:ListItem Text="210 Espacio inadecuado de los pasillos, ..." Value="210 Espacio inadecuado de los pasillos, salidas, etc."></asp:ListItem>
								<asp:ListItem Text="220 Espacio libre inadecuado para  ..." Value="220 Espacio libre inadecuado para movimientos de personas u objetos"></asp:ListItem>
								<asp:ListItem Text="230 Control inadecuado del tráfico" Value="230 Control inadecuado del tráfico"></asp:ListItem>
								<asp:ListItem Text="240 Ventilación general inadecuada ..." Value="240 Ventilación general inadecuada, no debida a equipo defectuoso"></asp:ListItem>
								<asp:ListItem Text="250 Insuficiente espacio de trabajo" Value="250 Insuficiente espacio de trabajo"></asp:ListItem>
								<asp:ListItem Text="260 Iluminación inadecuada" Value="260 Iluminación inadecuada"></asp:ListItem>
								<asp:ListItem Text="299 Riesgos ambientales no especificados en otra parte" Value="299 Riesgos ambientales no especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>4) Métodos o procedimientos peligrosos</h5>
							<asp:DropDownList ID="Dropdownlist4" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="310 Uso de material o equipo de por  ..." Value="310 Uso de material o equipo de por sí peligroso"></asp:ListItem>
								<asp:ListItem Text="320 Uso de métodos o procedimientos  ..." Value="320 Uso de métodos o procedimientos de por sí peligrosos"></asp:ListItem>
								<asp:ListItem Text="330 Uso de herramientas o equipo  ..." Value="330 Uso de herramientas o equipo inadecuado o inapropiado"></asp:ListItem>
								<asp:ListItem Text="339 Métodos o procedimientos peligrosos, ..." Value="339 Métodos o procedimientos peligrosos, no especificados en otra parte"></asp:ListItem>
								<asp:ListItem Text="340 Ayuda inadecuada para levantar  ..." Value="340 Ayuda inadecuada para levantar cosas pesadas"></asp:ListItem>
								<asp:ListItem Text="350 Ubicación del personal inapropiada" Value="350 Ubicación del personal inapropiada"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>5) Riesgo de colocación o emplazamiento</h5>
							<asp:DropDownList ID="Dropdownlist5" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="410 Inapropiadamente apilado" Value="410 Inapropiadamente apilado"></asp:ListItem>
								<asp:ListItem Text="420 Colocados o emplazados inadecuadamente" Value="420 Colocados o emplazados inadecuadamente"></asp:ListItem>
								<asp:ListItem Text="430 Inadecuadamente asegurados contra ..." Value="430 Inadecuadamente asegurados contra movimientos inconvenientes"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>6) Inadecuadamente protegido</h5>
							<asp:DropDownList ID="Dropdownlist6" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="510 Sin protección" Value="510 Sin protección"></asp:ListItem>
								<asp:ListItem Text="520 Inadecuadamente protegido" Value="520 Inadecuadamente protegido"></asp:ListItem>
								<asp:ListItem Text="530 Carencia de o inadecuado   ..." Value="530 Carencia de o inadecuado apuntalamiento o entibación de minería, excavaciones, construcciones, etc."></asp:ListItem>
								<asp:ListItem Text="540 Sin conexión a tierra" Value="540 Sin conexión a tierra"></asp:ListItem>
								<asp:ListItem Text="550 Sin aislamiento" Value="550 Sin aislamiento"></asp:ListItem>
								<asp:ListItem Text="560 Conexiones, interruptores,  ..." Value="560 Conexiones, interruptores, etc., descubiertos "></asp:ListItem>
								<asp:ListItem Text="570 Sin protección" Value="570 Sin protección"></asp:ListItem>
								<asp:ListItem Text="580 Inadecuadamente protegido" Value="580 Inadecuadamente protegido"></asp:ListItem>
								<asp:ListItem Text="590 Materiales sin rótulo o  ..." Value="590 Materiales sin rótulo o inadecuadamente rotulados"></asp:ListItem>
								<asp:ListItem Text="599 Inadecuadamente protegido,  ..." Value="599 Inadecuadamente protegido, no especificado en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>7) Riesgos ambientales en trabajos exteriores</h5>
							<asp:DropDownList ID="Dropdownlist7" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="610 Predios o cosas defectuosas de extraños" Value="610 Predios o cosas defectuosas de extraños"></asp:ListItem>
								<asp:ListItem Text="620 Materiales o equipo defectuoso de extraños" Value="620 Materiales o equipo defectuoso de extraños"></asp:ListItem>
								<asp:ListItem Text="630 Otros riesgos asociados con la  ..." Value="630 Otros riesgos asociados con la propiedad u operaciones de extraños"></asp:ListItem>
								<asp:ListItem Text="640 Riesgos naturales" Value="640 Riesgos naturales"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>8) Riesgos públicos</h5>
							<asp:DropDownList ID="Dropdownlist8" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="710 Riesgos del transporte público" Value="710 Riesgos del transporte público"></asp:ListItem>
								<asp:ListItem Text="720 Riesgo del tráfico" Value="720 Riesgo del tráfico"></asp:ListItem>
								<asp:ListItem Text="780 Otros riesgos públicos" Value="780 Otros riesgos públicos"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>9) Condiciones ambientales peligrosas</h5>
							<asp:DropDownList ID="Dropdownlist9" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="990 Indeterminada información insuficiente" Value="990 Indeterminada información insuficiente"></asp:ListItem>
								<asp:ListItem Text="999 No hay condición ambiental peligrosa" Value="999 No hay condición ambiental peligrosa"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>10) Adicional a la NTC 3701</h5>
							<asp:DropDownList ID="Dropdownlist10" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlcond_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="Orden y limpieza deficientes" Value="Orden y limpieza deficientes"></asp:ListItem>
								<asp:ListItem Text="Vías en mal estado, angostas, peligrosas" Value="Vías en mal estado, angostas, peligrosas"></asp:ListItem>
								<asp:ListItem Text="Sistema de advertencia deficiente o inadecuado" Value="Sistema de advertencia deficiente o inadecuado"></asp:ListItem>
								<asp:ListItem Text="Terreno o superficies resbalosas  ..." Value="Terreno o superficies resbalosas- irregulares y/o inclinadas"></asp:ListItem>
								<asp:ListItem Text="Escaleras sin baranda, superficie  ..." Value="Escaleras sin baranda, superficie antideslizante"></asp:ListItem>
								<asp:ListItem Text="Almacenamiento de sustancias que  ..." Value="Almacenamiento de sustancias que pueden causar incendio o explosión"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>
					<br />

					<!-- Actos Inseguros-->
					<div class="row">
						<h3>CAUSAS INMEDIATAS - Actos Inseguros</h3>
						<div class="col-md-12">
							<asp:TextBox ID="txtActos" MaxLength="1000" runat="server" TextMode="multiline" Rows="3" class="form-control"
								ReadOnly="true"></asp:TextBox>
						</div>
						<br />
						<div class="col-md-3">
							<asp:Button runat="server" ID="btnReset2" Text="Resetear Valores" class="btn btn-block btn-success"
								OnClick="btnReset_Click"></asp:Button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>1) Bromas o juegos pesados</h5>
							<asp:DropDownList ID="Dropdownlist14" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="250-Bromas o juegos pesados" Value="250-Bromas o juegos pesados"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>2) Omitir el Uso</h5>
							<asp:DropDownList ID="Dropdownlist12" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="100 Omitir el uso de equipo de ..." Value="100 OMITIR EL USO DE EQUIPO DE PROTECCIÓN PERSONAL DISPONIBLE"></asp:ListItem>
								<asp:ListItem Text="150 Omitir el uso de atuendo  ..." Value="150 OMITIR EL USO DE ATUENDO PERSONAL SEGURO"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>3) No asegurar o advertir</h5>
							<asp:DropDownList ID="Dropdownlist13" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="201 Omitir, cerrar, bloquear o asegurar ..." Value="201 Omitir, cerrar, bloquear o asegurar los vehículos, interruptores, válvulas, prensas, etc."></asp:ListItem>
								<asp:ListItem Text="202 Omitir el cierre del equipo que no ..." Value="202 Omitir el cierre del equipo que no está en uso"></asp:ListItem>
								<asp:ListItem Text="203 Omitir la colocación de avisos,  ..." Value="203 Omitir la colocación de avisos, señales, tarjetas, etc."></asp:ListItem>
								<asp:ListItem Text="205 Soltar o mover pesos, etc., sin dar ..." Value="205 Soltar o mover pesos, etc., sin dar aviso o advertencia adecuada"></asp:ListItem>
								<asp:ListItem Text="207 Iniciar o parar vehículos o equipos ..." Value="207 Iniciar o parar vehículos o equipos sin dar el aviso adecuado"></asp:ListItem>
								<asp:ListItem Text="209 No especificados en otra parte" Value="209 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>4) Limpieza, lubricación, ajuste o reparación de equipo móvil eléctrico o de presión</h5>
							<asp:DropDownList ID="Dropdownlist11" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="051 Apretar con martillo, empacar,  ..." Value="051 Apretar con martillo, empacar, etc., equipo bajo presión"></asp:ListItem>
								<asp:ListItem Text="052 Limpiar, lubricar, ajustar,  ..." Value="052 Limpiar, lubricar, ajustar, etc., equipo en movimiento"></asp:ListItem>
								<asp:ListItem Text="056 Soldar, reparar, etc., tanques ..." Value="056 Soldar, reparar, etc., tanques, recipientes, sustancias químicas peligrosas, etc."></asp:ListItem>
								<asp:ListItem Text="057 Trabajar en equipo cargado  ..." Value="057 Trabajar en equipo cargado eléctricamente "></asp:ListItem>
								<asp:ListItem Text="059 No especificada en otra parte" Value="059 No especificada en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>5) Falta de atención a las condiciones del piso o las vecindades</h5>
							<asp:DropDownList ID="Dropdownlist17" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="400-Falta de atención a las condiciones ..." Value="400-Falta de atención a las condiciones del piso o las vecindades"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>6) Uso inapropiado de las manos o partes del cuerpo</h5>
							<asp:DropDownList ID="Dropdownlist16" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="353 Agarrar los objetos inseguramente" Value="353 Agarrar los objetos inseguramente"></asp:ListItem>
								<asp:ListItem Text="355 Agarrar los objetos en forma errada" Value="355 Agarrar los objetos en forma errada"></asp:ListItem>
								<asp:ListItem Text="356 Usar las manos en lugar de las  ...s" Value="356 Usar las manos en lugar de las herramientas manuales"></asp:ListItem>
								<asp:ListItem Text="359 No especificadas en otra parte" Value="359 No especificadas en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>7) Uso inadecuado del equipo</h5>
							<asp:DropDownList ID="Dropdownlist15" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="301 Uso del material o equipo de  ..." Value="301 Uso del material o equipo de una manera para la cual no está indicado"></asp:ListItem>
								<asp:ListItem Text="305 Recargar de pesos (vehículos, ..." Value="305 Recargar de pesos (vehículos, andamios, etc.)"></asp:ListItem>
								<asp:ListItem Text="309 No especificados en otra parte" Value="309 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>8) Adoptar una posición insegura</h5>
							<asp:DropDownList ID="Dropdownlist20" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="552 Entrar en tanques, cajones  ..." Value="552 Entrar en tanques, cajones u otros espacios encerrados sin el debido permiso del supervisor"></asp:ListItem>
								<asp:ListItem Text="555 Viajar en posición insegura" Value="555 Viajar en posición insegura"></asp:ListItem>
								<asp:ListItem Text="556 Exponerse innecesariamente bajo ..." Value="556 Exponerse innecesariamente bajo cargas suspendidas"></asp:ListItem>
								<asp:ListItem Text="557 Exponerse innecesariamente a  ..." Value="557 Exponerse innecesariamente a cargas oscilantes"></asp:ListItem>
								<asp:ListItem Text="558 Exponerse innecesariamente a  ..." Value="558 Exponerse innecesariamente a materiales o equipos que se mueven"></asp:ListItem>
								<asp:ListItem Text="559 No especificados en otra parte" Value="559 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>9) Operar o trabajar a velocidad insegura</h5>
							<asp:DropDownList ID="Dropdownlist19" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="502 Alimentar o suministrar muy  ..." Value="502 Alimentar o suministrar muy rápidamente"></asp:ListItem>
								<asp:ListItem Text="503 Saltar desde partes elevadas" Value="503 Saltar desde partes elevadas"></asp:ListItem>
								<asp:ListItem Text="505 Operar los vehículos de la planta  ..." Value="505 Operar los vehículos de la planta a velocidad insegura"></asp:ListItem>
								<asp:ListItem Text="506 Correr" Value="506 Correr"></asp:ListItem>
								<asp:ListItem Text="508 Lanzar material en lugar de  ..." Value="508 Lanzar material en lugar de cargarlo o pasarlo"></asp:ListItem>
								<asp:ListItem Text="509 No especificados en otra parte" Value="509 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>10) Hacer inoperantes los dispositivos de seguridad</h5>
							<asp:DropDownList ID="Dropdownlist18" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="452 Bloquear, tapar, atar, etc.,  ..." Value="452 Bloquear, tapar, atar, etc., los dispositivos de seguridad"></asp:ListItem>
								<asp:ListItem Text="453 Desconectar o quitar los dispositivos ..." Value="453 Desconectar o quitar los dispositivos de seguridad"></asp:ListItem>
								<asp:ListItem Text="454 Colocar mal los dispositivos de seguridad" Value="454 Colocar mal los dispositivos de seguridad"></asp:ListItem>
								<asp:ListItem Text="456 Reemplazar los dispositivos de  ..." Value="456 Reemplazar los dispositivos de seguridad por otros de capacidad inapropiada"></asp:ListItem>
								<asp:ListItem Text="459 No especificados en otra parte" Value="459 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>11) Acto subestándar no especificado en otra parte</h5>
							<asp:DropDownList ID="Dropdownlist24" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="998 Ningún acto subestándar" Value="998 Ningún acto subestándar"></asp:ListItem>
								<asp:ListItem Text="999 Sin clasificación (Datos  ..." Value="999 Sin clasificación (Datos insuficientes)"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>12) Colocar, mezclar, combinar, etc., inseguramente</h5>
							<asp:DropDownList ID="Dropdownlist22" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="653 Inyectar, mezclar o combinar una ..." Value="653 Inyectar, mezclar o combinar una sustancia con otra, de manera que se cree un riesgo de explosión, fuego u otro"></asp:ListItem>
								<asp:ListItem Text="655 Colocación insegura de vehículos  ..." Value="655 Colocación insegura de vehículos o equipo de movimiento de materiales"></asp:ListItem>
								<asp:ListItem Text="657 Colocación insegura de materiales, ..." Value="657 Colocación insegura de materiales, herramientas, desechos, etc."></asp:ListItem>
								<asp:ListItem Text="659 No especificados en otra parte" Value="659 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>13) Errores de conducción</h5>
							<asp:DropDownList ID="Dropdownlist21" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="601 Conducir demasiado rápido o  ..." Value="601 Conducir demasiado rápido o demasiado despacio"></asp:ListItem>
								<asp:ListItem Text="602 Entrar o salir del vehículo  ..." Value="602 Entrar o salir del vehículo por el lado del tráfico"></asp:ListItem>
								<asp:ListItem Text="603 No hacer la señal cuando se  ..." Value="603 No hacer la señal cuando se para, se voltea o se retrocede"></asp:ListItem>
								<asp:ListItem Text="604 Omitir el otorgamiento del  ..." Value="604 Omitir el otorgamiento del derecho de vía"></asp:ListItem>
								<asp:ListItem Text="605 No obedecer las señales o  ..." Value="605 No obedecer las señales o signos del control del tráfico"></asp:ListItem>
								<asp:ListItem Text="606 No guardar la distancia" Value="606 No guardar la distancia"></asp:ListItem>
								<asp:ListItem Text="607 Pasar inapropiadamente" Value="607 Pasar inapropiadamente"></asp:ListItem>
								<asp:ListItem Text="608 Voltear inapropiadamente" Value="608 Voltear inapropiadamente"></asp:ListItem>
								<asp:ListItem Text="609 No especificados en otra parte" Value="609 No especificados en otra parte"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>14) Usar equipo inseguro </h5>
							<asp:DropDownList ID="Dropdownlist23" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="750 usar equipo inseguro (Equipo  ..." Value="750 usar equipo inseguro (Equipo rotulado o conocido como defectuoso)"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>15) Adicional a la NTC 3701</h5>
							<asp:DropDownList ID="Dropdownlist25" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlActos_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="Mantener posturas  inadecuadas para ..." Value="Mantener posturas  inadecuadas para levantar- cargar o mover"></asp:ListItem>
								<asp:ListItem Text="No coordinar acciones (soltar- mover ..." Value="No coordinar acciones (soltar- mover- iniciar o parar sin avisar)"></asp:ListItem>
								<asp:ListItem Text="No seguir el procedimiento" Value="No seguir el procedimiento"></asp:ListItem>
								<asp:ListItem Text="Trabajar bajo la influencia del  ..." Value="Trabajar bajo la influencia del alcohol o drogas"></asp:ListItem>
								<asp:ListItem Text="Uso de herramienta o equipo  ..." Value="Uso de herramienta o equipo inadecuados o defectuosos o sin autorización"></asp:ListItem>
								<asp:ListItem Text="Falta de atención u olvido" Value="Falta de atención u olvido"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>


					<!-- Factores del Trabajo -->
					<div class="row">
						<h3>CAUSAS BÁSICAS - Factores del Trabajo</h3>

						<div class="col-md-12">
							<asp:TextBox ID="txtFacTrab" MaxLength="1000" runat="server" TextMode="multiline" Rows="3" class="form-control"
								ReadOnly="true"></asp:TextBox>
						</div>
						<br />
						<div class="col-md-3">
							<asp:Button runat="server" ID="btnReset3" Text="Resetear Valores" class="btn btn-block btn-success"
								OnClick="btnReset_Click"></asp:Button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>1) Supervisión y liderazgo deficientes</h5>
							<asp:DropDownList ID="Dropdownlist26" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="001 Relaciones jerárquicas poco claras ..." Value="001 Relaciones jerárquicas poco claras o conflictivas"></asp:ListItem>
								<asp:ListItem Text="002 Asignación de responsabilidades  ..." Value="002 Asignación de responsabilidades poco claras o conflictivas"></asp:ListItem>
								<asp:ListItem Text="003 Delegación insuficiente o inadecuada" Value="003 Delegación insuficiente o inadecuada"></asp:ListItem>
								<asp:ListItem Text="004 Definir políticas, procedimientos, ..." Value="004 Definir políticas, procedimientos, prácticas o líneas de acción inadecuadas"></asp:ListItem>
								<asp:ListItem Text="005 Formulación de objetivos, metas o ..." Value="005 Formulación de objetivos, metas o estándares que ocasionan conflictos"></asp:ListItem>
								<asp:ListItem Text="006 Programación o planificación insuf ..." Value="006 Programación o planificación insuficiente del trabajo"></asp:ListItem>
								<asp:ListItem Text="007 Instrucción, orientación y/o entren ..." Value="007 Instrucción, orientación y/o entrenamiento insuficientes"></asp:ListItem>
								<asp:ListItem Text="008 Entrega insuficiente de documentos  ..." Value="008 Entrega insuficiente de documentos de consulta, de instrucciones y de publicaciones guías"></asp:ListItem>
								<asp:ListItem Text="009 Identificación y evaluación deficien ..." Value="009 Identificación y evaluación deficiente de las exposiciones a pérdida"></asp:ListItem>
								<asp:ListItem Text="010 Falta de conocimiento en el trabajo  ..." Value="010 Falta de conocimiento en el trabajo de supervisión/ administración"></asp:ListItem>
								<asp:ListItem Text="011 Ubicación inadecuada del trabajador, ..." Value="011 Ubicación inadecuada del trabajador, de acuerdo con sus cualidades y con las exigencias que demanda la tarea"></asp:ListItem>
								<asp:ListItem Text="012 Medición y evaluación deficientes del ..." Value="012 Medición y evaluación deficientes del desempeño"></asp:ListItem>
								<asp:ListItem Text="013 Retroalimentación deficiente o incorr ..." Value="013 Retroalimentación deficiente o incorrecta en relación con el desempeño"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>2) Ingeniería inadecuada</h5>
							<asp:DropDownList ID="Dropdownlist27" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="101 Evaluación insuficiente de las  ..." Value="101 Evaluación insuficiente de las exposiciones a pérdidas"></asp:ListItem>
								<asp:ListItem Text="102 Preocupación deficiente en cuanto ..." Value="102 Preocupación deficiente en cuanto a los factores humanos/ergonómicos"></asp:ListItem>
								<asp:ListItem Text="103 Estándares, especificaciones y/o  ..." Value="103 Estándares, especificaciones y/o criterios de diseño inadecuados"></asp:ListItem>
								<asp:ListItem Text="104 Control e inspecciones inadecuados ..." Value="104 Control e inspecciones inadecuados de las construcciones"></asp:ListItem>
								<asp:ListItem Text="105 Evaluación deficiente de la condición ..." Value="105 Evaluación deficiente de la condición conveniente para operar"></asp:ListItem>
								<asp:ListItem Text="106 Evaluación deficiente para el comienzo ..." Value="106 Evaluación deficiente para el comienzo de una operación"></asp:ListItem>
								<asp:ListItem Text="107 Evaluación insuficiente respecto a los ..." Value="107 Evaluación insuficiente respecto a los cambios que se produzcan"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>3) Deficiencia en las adquisiciones / compras</h5>
							<asp:DropDownList ID="Dropdownlist28" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="201 Especificaciones deficientes en ..." Value="201 Especificaciones deficientes en cuanto a los requerimientos"></asp:ListItem>
								<asp:ListItem Text="202 Investigación insuficiente respecto ..." Value="202 Investigación insuficiente respecto a las materias y a los equipos"></asp:ListItem>
								<asp:ListItem Text="203 Especificaciones deficientes para ..." Value="203 Especificaciones deficientes para los vendedores"></asp:ListItem>
								<asp:ListItem Text="204 Modalidad o ruta de embarque inadecuada" Value="204 Modalidad o ruta de embarque inadecuada"></asp:ListItem>
								<asp:ListItem Text="205 Inspecciones de recepción y aceptación ..." Value="205 Inspecciones de recepción y aceptación deficientes"></asp:ListItem>
								<asp:ListItem Text="206 Comunicación inadecuada de las informa ..." Value="206 Comunicación inadecuada de las informaciones sobre aspectos de seguridad y salud"></asp:ListItem>
								<asp:ListItem Text="207 Manejo inadecuado de los materiales" Value="207 Manejo inadecuado de los materiales"></asp:ListItem>
								<asp:ListItem Text="208 Almacenamiento inadecuado de los materiales" Value="208 Almacenamiento inadecuado de los materiales"></asp:ListItem>
								<asp:ListItem Text="209 Transporte inadecuado de los materiales" Value="209 Transporte inadecuado de los materiales"></asp:ListItem>
								<asp:ListItem Text="210 Identificación deficiente de los ítems ..." Value="210 Identificación deficiente de los ítems que implican riesgos"></asp:ListItem>
								<asp:ListItem Text="211 Sistemas deficientes de recuperación ..." Value="211 Sistemas deficientes de recuperación o de eliminación de desechos"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>4) Mantención /mantenimiento deficiente</h5>
							<asp:DropDownList ID="Dropdownlist29" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="301 Aspectos preventivos inadecuados ..." Value="301 Aspectos preventivos inadecuados para evaluación de necesidades"></asp:ListItem>
								<asp:ListItem Text="302 Aspectos preventivos inadecuados ..." Value="302 Aspectos preventivos inadecuados para lubricación y servicio"></asp:ListItem>
								<asp:ListItem Text="303 Aspectos preventivos inadecuados ..." Value="303 Aspectos preventivos inadecuados para ajuste/ ensamble"></asp:ListItem>
								<asp:ListItem Text="304 Aspectos preventivos inadecuados ..." Value="304 Aspectos preventivos inadecuados para limpieza o pulimento"></asp:ListItem>
								<asp:ListItem Text="305 Aspectos correctivos inapropiado ... " Value="305 Aspectos correctivos inapropiados para comunicación de necesidades"></asp:ListItem>
								<asp:ListItem Text="306 Aspectos correctivos inapropiado ..." Value="306 Aspectos correctivos inapropiados para programación del trabajo"></asp:ListItem>
								<asp:ListItem Text="307 Aspectos correctivos inapropiado ... " Value="307 Aspectos correctivos inapropiados para revisión de las piezas"></asp:ListItem>
								<asp:ListItem Text="308 Aspectos correctivos inapropiado ..." Value="308 Aspectos correctivos inapropiados para reemplazo de partes defectuosas"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>5) Herramientas y equipos inadecuados</h5>
							<asp:DropDownList ID="Dropdownlist30" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="401 Evaluación deficiente de las nec ..." Value="401 Evaluación deficiente de las necesidades y los riesgos"></asp:ListItem>
								<asp:ListItem Text="402 Preocupación deficiente en cuanto ..." Value="402 Preocupación deficiente en cuanto a los factores humanos/ergonómicos"></asp:ListItem>
								<asp:ListItem Text="403 Estándares o especificaciones  ..." Value="403 Estándares o especificaciones inadecuadas"></asp:ListItem>
								<asp:ListItem Text="404 Disponibilidad inadecuada" Value="404 Disponibilidad inadecuada"></asp:ListItem>
								<asp:ListItem Text="405 Ajustes/reparación/mantención  ..." Value="405 Ajustes/reparación/mantención deficiente"></asp:ListItem>
								<asp:ListItem Text="406 Sistema deficiente de reparación ..." Value="406 Sistema deficiente de reparación y recuperación de materiales"></asp:ListItem>
								<asp:ListItem Text="407 Eliminación y reemplazo inapropi ..." Value="407 Eliminación y reemplazo inapropiados de piezas defectuosas"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>6) Estándares deficientes de trabajo</h5>
							<asp:DropDownList ID="Dropdownlist31" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="501 Desarrollo inadecuado de normas  ..." Value="501 Desarrollo inadecuado de normas para inventario y evaluación de las exposiciones y necesidades"></asp:ListItem>
								<asp:ListItem Text="502 Desarrollo inadecuado de normas  ..." Value="502 Desarrollo inadecuado de normas para coordinación con quienes diseñan el proceso"></asp:ListItem>
								<asp:ListItem Text="503 Desarrollo inadecuado de normas  ..." Value="503 Desarrollo inadecuado de normas para compromiso con el trabajador"></asp:ListItem>
								<asp:ListItem Text="504 Desarrollo inadecuado de normas  ..." Value="504 Desarrollo inadecuado de normas para estándares/ procedimientos/ reglas inconsistentes"></asp:ListItem>
								<asp:ListItem Text="505 Comunicación inadecuada de las n ..." Value="505 Comunicación inadecuada de las normas de publicación"></asp:ListItem>
								<asp:ListItem Text="506 Comunicación inadecuada de las n ..." Value="506 Comunicación inadecuada de las normas de distribución"></asp:ListItem>
								<asp:ListItem Text="507 Comunicación inadecuada de las n ..." Value="507 Comunicación inadecuada de las normas de adaptación a las lenguas respectivas"></asp:ListItem>
								<asp:ListItem Text="508 Comunicación inadecuada de las n ..." Value="508 Comunicación inadecuada de las normas de entrenamiento"></asp:ListItem>
								<asp:ListItem Text="509 Comunicación inadecuada de las n ..." Value="509 Comunicación inadecuada de las normas de reforzamiento mediante afiche, código de colores y ayudas para el trabajo"></asp:ListItem>
								<asp:ListItem Text="510 Manutención inadecuada de las no ..." Value="510 Manutención inadecuada de las normas de seguimiento del flujo de trabajo"></asp:ListItem>
								<asp:ListItem Text="511 Manutención inadecuada de las no ..." Value="511 Manutención inadecuada de las normas de actualización"></asp:ListItem>
								<asp:ListItem Text="512 Manutención inadecuada de las no ..." Value="512 Manutención inadecuada de las normas de control de uso de normas,procedimientos o reglamentos"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>7) uso y desgaste</h5>
							<asp:DropDownList ID="Dropdownlist32" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="601 Planificación inadecuada del uso" Value="601 Planificación inadecuada del uso"></asp:ListItem>
								<asp:ListItem Text="602 Prolongación excesiva de la vida ..." Value="602 Prolongación excesiva de la vida útil del elemento"></asp:ListItem>
								<asp:ListItem Text="603 Inspección o control deficientes" Value="603 Inspección o control deficientes"></asp:ListItem>
								<asp:ListItem Text="604 Sobrecarga o proporción de uso ..." Value="604 Sobrecarga o proporción de uso excesivo"></asp:ListItem>
								<asp:ListItem Text="605 Manutención deficiente" Value="605 Manutención deficiente"></asp:ListItem>
								<asp:ListItem Text="606 Empleo del elemento por personas ..." Value="606 Empleo del elemento por personas no calificadas o sin preparación"></asp:ListItem>
								<asp:ListItem Text="607 Empleo inadecuado para otros propósitos" Value="607 Empleo inadecuado para otros propósitos"></asp:ListItem>
							</asp:DropDownList>
						</div>
						<div class="col-md-4">
							<h5>8) Abuso o maltrato</h5>
							<asp:DropDownList ID="Dropdownlist33" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacTrab_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="701 Permitidos por la supervisión ..." Value="701 Permitidos por la supervisión intencionalmente"></asp:ListItem>
								<asp:ListItem Text="702 Permitidos por la supervisión ..." Value="702 Permitidos por la supervisión no intencionalmente"></asp:ListItem>
								<asp:ListItem Text="703 No permitidos por la supervis ..." Value="703 No permitidos por la supervisión intencionalmente"></asp:ListItem>
								<asp:ListItem Text="704 No permitidos por la supervis ..." Value="704 No permitidos por la supervisión no intencionalmente"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>


					<!-- Factores Personales -->
					<div class="row">
						<h3>CAUSAS BÁSICAS - Factores Personales</h3>

						<div class="col-md-12">
							<asp:TextBox ID="txtFactPersonales" MaxLength="1000" runat="server" TextMode="multiline" Rows="3"
								class="form-control" ReadOnly="true"></asp:TextBox>
						</div>
						<br />
						<div class="col-md-3">
							<asp:Button runat="server" ID="btnReset4" Text="Resetear Valores" class="btn btn-block btn-success"
								OnClick="btnReset_Click"></asp:Button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>1) Capacidad física/fisiológica inadecuada</h5>
							<asp:DropDownList ID="Dropdownlist34" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="001 Altura, peso, talla, fuerza, alca ..." Value="001 Altura, peso, talla, fuerza, alcance, etc. inadecuados"></asp:ListItem>
								<asp:ListItem Text="002 Capacidad de movimiento corporal  ..." Value="002 Capacidad de movimiento corporal limitada"></asp:ListItem>
								<asp:ListItem Text="003 Capacidad limitada para mantener  ..." Value="003 Capacidad limitada para mantenerse en determinadas posiciones corporales"></asp:ListItem>
								<asp:ListItem Text="004 Sensibilidad a ciertas sustancias ..." Value="004 Sensibilidad a ciertas sustancias o alergias"></asp:ListItem>
								<asp:ListItem Text="005 Sensibilidad a determinados extre ..." Value="005 Sensibilidad a determinados extremos sensoriales (temperatura, sonido, etc.)"></asp:ListItem>
								<asp:ListItem Text="006 Visión defectuosa" Value="006 Visión defectuosa"></asp:ListItem>
								<asp:ListItem Text="007 Audición defectuosa" Value="007 Audición defectuosa"></asp:ListItem>
								<asp:ListItem Text="008 Otras deficiencias sensoriales ..." Value="008 Otras deficiencias sensoriales (tacto, gusto, olfato, equilibrio)"></asp:ListItem>
								<asp:ListItem Text="009 Incapacidad respiratoria" Value="009 Incapacidad respiratoria"></asp:ListItem>
								<asp:ListItem Text="010 Otras incapacidades físicas permanentes" Value="010 Otras incapacidades físicas permanentes"></asp:ListItem>
								<asp:ListItem Text="011 Incapacidades temporales" Value="011 Incapacidades temporales"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>2) Capacidad mental/psicológica inadecuada</h5>
							<asp:DropDownList ID="Dropdownlist35" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="101 Temores y fobias" Value="101 Temores y fobias"></asp:ListItem>
								<asp:ListItem Text="102 Problemas emocionales" Value="102 Problemas emocionales"></asp:ListItem>
								<asp:ListItem Text="103 Enfermedad mental" Value="103 Enfermedad mental"></asp:ListItem>
								<asp:ListItem Text="104 Nivel de inteligencia" Value="104 Nivel de inteligencia"></asp:ListItem>
								<asp:ListItem Text="105 Incapacidad de comprensión" Value="105 Incapacidad de comprensión"></asp:ListItem>
								<asp:ListItem Text="106 Falta de juicio" Value="106 Falta de juicio"></asp:ListItem>
								<asp:ListItem Text="107 Escasa coordinación" Value="107 Escasa coordinación"></asp:ListItem>
								<asp:ListItem Text="108 Bajo tiempo de reacción" Value="108 Bajo tiempo de reacción"></asp:ListItem>
								<asp:ListItem Text="109 Aptitud mecánica deficiente" Value="109 Aptitud mecánica deficiente"></asp:ListItem>
								<asp:ListItem Text="110 Baja aptitud de aprendizaje" Value="110 Baja aptitud de aprendizaje"></asp:ListItem>
								<asp:ListItem Text="111 Problemas de memoria" Value="111 Problemas de memoria"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>3) Tensión física o fisiológica</h5>
							<asp:DropDownList ID="Dropdownlist36" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="201 Lesión o enfermedad" Value="201 Lesión o enfermedad"></asp:ListItem>
								<asp:ListItem Text="202 Fatiga debido a la carga o dura ..." Value="202 Fatiga debido a la carga o duración de las tareas"></asp:ListItem>
								<asp:ListItem Text="203 Fatiga debido a la falta de des ..." Value="203 Fatiga debido a la falta de descanso"></asp:ListItem>
								<asp:ListItem Text="204 Fatiga debido a la sobrecarga s ..." Value="204 Fatiga debido a la sobrecarga sensorial"></asp:ListItem>
								<asp:ListItem Text="205 Exposición a riesgos contra la salud" Value="205 Exposición a riesgos contra la salud"></asp:ListItem>
								<asp:ListItem Text="206 Exposición a temperaturas extremas" Value="206 Exposición a temperaturas extremas"></asp:ListItem>
								<asp:ListItem Text="207 Insuficiencia de oxígeno" Value="207 Insuficiencia de oxígeno"></asp:ListItem>
								<asp:ListItem Text="208 Variaciones en la presión atmosf ..." Value="208 Variaciones en la presión atmosférica"></asp:ListItem>
								<asp:ListItem Text="209 Restricción de movimiento" Value="209 Restricción de movimiento"></asp:ListItem>
								<asp:ListItem Text="210 Insuficiencia de azúcar en la sangre" Value="210 Insuficiencia de azúcar en la sangre"></asp:ListItem>
								<asp:ListItem Text="211 Ingestión de drogas" Value="211 Ingestión de drogas"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>4) Tensión mental o psicológica</h5>
							<asp:DropDownList ID="Dropdownlist37" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="301 Sobrecarga emocional" Value="301 Sobrecarga emocional"></asp:ListItem>
								<asp:ListItem Text="302 Fatiga debida a la carga o las ..." Value="302 Fatiga debida a la carga o las limitaciones de tiempo de la tarea mental"></asp:ListItem>
								<asp:ListItem Text="303 Obligaciones que exigen un juicio ..." Value="303 Obligaciones que exigen un juicio o toma de decisiones extremas"></asp:ListItem>
								<asp:ListItem Text="304 Rutina, monotonía, exigencias par ..." Value="304 Rutina, monotonía, exigencias para un cargo sin trascendencia"></asp:ListItem>
								<asp:ListItem Text="305 Exigencia de una concentración/pe ..." Value="305 Exigencia de una concentración/percepción profunda"></asp:ListItem>
								<asp:ListItem Text="306 Actividades 'insignificantes' o  ..." Value="306 Actividades 'insignificantes' o 'degradantes'"></asp:ListItem>
								<asp:ListItem Text="307 Órdenes confusas" Value="307 Órdenes confusas"></asp:ListItem>
								<asp:ListItem Text="308 Solicitudes conflictivas" Value="308 Solicitudes conflictivas"></asp:ListItem>
								<asp:ListItem Text="309 Preocupación debido a problemas" Value="309 Preocupación debido a problemas"></asp:ListItem>
								<asp:ListItem Text="310 Frustraciones" Value="310 Frustraciones"></asp:ListItem>
								<asp:ListItem Text="311 Enfermedad mental" Value="311 Enfermedad mental"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>5) Falta de conocimiento</h5>
							<asp:DropDownList ID="Dropdownlist38" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="401 Falta de experiencia" Value="401 Falta de experiencia"></asp:ListItem>
								<asp:ListItem Text="402 Orientación deficiente" Value="402 Orientación deficiente"></asp:ListItem>
								<asp:ListItem Text="403 Entrenamiento inicial inadecuado" Value="403 Entrenamiento inicial inadecuado"></asp:ListItem>
								<asp:ListItem Text="404 Reentrenamiento insuficiente" Value="404 Reentrenamiento insuficiente"></asp:ListItem>
								<asp:ListItem Text="405 Ordenes mal interpretadas" Value="405 Ordenes mal interpretadas"></asp:ListItem>
							</asp:DropDownList>
						</div>

						<div class="col-md-4">
							<h5>6) Falta de habilidad</h5>
							<asp:DropDownList ID="Dropdownlist39" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="501 Instrucción inicial insuficiente" Value="501 Instrucción inicial insuficiente"></asp:ListItem>
								<asp:ListItem Text="502 Práctica insuficiente" Value="502 Práctica insuficiente"></asp:ListItem>
								<asp:ListItem Text="503 Operación esporádica" Value="503 Operación esporádica"></asp:ListItem>
								<asp:ListItem Text="504 Falta de preparación" Value="504 Falta de preparación"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<h5>7) Motivación deficiente</h5>
							<asp:DropDownList ID="Dropdownlist40" CssClass="form-control" runat="server"
								AutoPostBack="true" OnSelectedIndexChanged="ddlFacPers_SelectedIndexChanged">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="601 El desempeño subestándar es más ..." Value="601 El desempeño subestándar es más gratificante"></asp:ListItem>
								<asp:ListItem Text="602 El desempeño estándar causa des ..." Value="602 El desempeño estándar causa desagrado"></asp:ListItem>
								<asp:ListItem Text="603 Falta de incentivos" Value="603 Falta de incentivos"></asp:ListItem>
								<asp:ListItem Text="604 Demasiadas frustraciones" Value="604 Demasiadas frustraciones"></asp:ListItem>
								<asp:ListItem Text="605 Falta de desafíos" Value="605 Falta de desafíos"></asp:ListItem>
								<asp:ListItem Text="606 Intención de ahorro de tiempo y ..." Value="606 Intención de ahorro de tiempo y esfuerzo"></asp:ListItem>
								<asp:ListItem Text="607 Interés para evitar la incomodidad" Value="607 Interés para evitar la incomodidad"></asp:ListItem>
								<asp:ListItem Text="608 Sin interés por sobresalir" Value="608 Sin interés por sobresalir"></asp:ListItem>
								<asp:ListItem Text="609 Presión indebida de los compañeros" Value="609 Presión indebida de los compañeros"></asp:ListItem>
								<asp:ListItem Text="610 Ejemplo deficiente por parte de ..." Value="610 Ejemplo deficiente por parte de la supervisión"></asp:ListItem>
								<asp:ListItem Text="611 Retroalimentación deficiente en ..." Value="611 Retroalimentación deficiente en relación con el desempeño"></asp:ListItem>
								<asp:ListItem Text="612 Falta de refuerzo positivo para ..." Value="612 Falta de refuerzo positivo para el comportamiento correcto"></asp:ListItem>
								<asp:ListItem Text="613 Falta de incentivos de producción" Value="613 Falta de incentivos de producción"></asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<br />


					<!-- Magnitud del evento -->
					<div class="row">
						<h3>Magnitud del Evento</h3>

						<div class="col-md-3">
							<h5>Fecha de Muerte (Si la Hubiere)</h5>
							<asp:TextBox ID="txtFechaMuerte" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="Date"></asp:TextBox>
						</div>

						<div class="col-md-3">
							<h5>Días de incapacidad.</h5>
							<asp:TextBox ID="txtDiasIncapacidad" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="number" min="0"></asp:TextBox>
						</div>

						<div class="col-md-3">
							<h5>Días cargados.</h5>
							<asp:TextBox ID="txtDiasCargados" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="number" min="0"></asp:TextBox>
						</div>
					</div>
					<br />

					<div class="row">
						<div class="col-md-3">
							<h5>Días perdidos por ausencia del trabajo.</h5>
							<asp:TextBox ID="txtDiasPerdidosAusTrab" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="number" min="0"></asp:TextBox>
						</div>

						<div class="col-md-3">
							<h5>Días perdidos por actividad restringida.</h5>
							<asp:TextBox ID="txtDiasPerdidosctRest" runat="server" ClientIDMode="Static" CssClass="form-control"
								TextMode="number" min="0"></asp:TextBox>
						</div>

						<div class="col-md-3">
							<h5>Sin Tiempo Perdido.</h5>

							<asp:CheckBox ID="chkSinDias" runat="server"></asp:CheckBox>
						</div>

						<div class="col-md-3">
							<h5>Tipo de enfermedad </h5>
							<asp:DropDownList ID="ddlTipoEnfermedad" CssClass="form-control" runat="server">
								<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
								<asp:ListItem Text="Enfermedades en la piel" Value="A"></asp:ListItem>
								<asp:ListItem Text="Enfermedades respiratorias" Value="B"></asp:ListItem>
								<asp:ListItem Text="Envenenamiento" Value="C"></asp:ListItem>
								<asp:ListItem Text="Enfermedades debidas a agentes físicos" Value="D"></asp:ListItem>
								<asp:ListItem Text="Enfermedades producidas por traumas repetitivos" Value="E"></asp:ListItem>
								<asp:ListItem Text="Otras enfermedades osteomusculares" Value="F"></asp:ListItem>
								<asp:ListItem Text="Demás enfermedades profesionales" Value="G"></asp:ListItem>
							</asp:DropDownList>
						</div>

					</div>
					<br />

					<!-- Boton-->
					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<asp:Button runat="server" ID="btPrintSave" Text="Editar" class="btn btn-block btn-info"
								OnClick="btPrintSave_Click" ValidationGroup="ValidationAdd"></asp:Button>
						</div>

					</div>
				</div>
			</div>

		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger ControlID="btPrintSave" />
		</Triggers>
	</asp:UpdatePanel>

	<div class="modal fade" id="Msjmodal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h4 class="modal-title">
						<label id="lblMsjTitle1"></label>
					</h4>
				</div>

				<div class="modal-body form-group">
					<div class="row">
						<div class="col-md-1">
							<span id="icoModal1" class="fa fa-times fa-2x text-danger"></span>
						</div>
						<div class="col-md-11">
							<label id="lblMsjModal1"></label>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
