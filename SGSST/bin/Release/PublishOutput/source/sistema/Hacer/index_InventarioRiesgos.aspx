<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_InventarioRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_InventarioRiesgos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:Panel runat="server" ID="panel1">

		<div class="container" style="width: 100%;">

			<ol class="breadcrumb">
				<li><a href="#">Fase: Hacer</a></li>
				<li><a href="#">Inventario De Riesgos</a></li>
			</ol>


			<div class="page-header">
				<h1 class="text-center">Inventario De Riesgos</h1>
			</div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

			<div class="row form-group">
				<asp:PlaceHolder runat="server" ID="phEmpresa">
					<div class="col-md-4">
						<h4 class="text-center">Empresa</h4>
						<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
					</div>
				</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" ID="phSucursal">
					<div class="col-md-4">
						<h4 class="text-center">Sucursal</h4>
						<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
							runat="server" ValidationGroup="ValidationAdd" />
					</div>
				</asp:PlaceHolder>
			</div>



			<div class="panel panel-default">
				<!-- Panel INCENDIOS -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">INCENDIOS</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila 1 -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">INCENDIOS</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Incendios de Solidos Combustibles, implican madera, tejidos, goma, papel y algunos tipos de plástico o sintéticos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist1" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio1" type="radio" name="rbf1" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio2" type="radio" name="rbf1" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio3" type="radio" name="rbf1" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Incendio de Liquidos Inflamables o Combustibles, que implican gasolina, aceites, pintura, gases y líquidos inflamables y lubricantes.
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist2" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio4" type="radio" name="rbf2" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio5" type="radio" name="rbf2" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio6" type="radio" name="rbf2" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Incendios en los vehículos o medios de transporte
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist3" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio7" type="radio" name="rbf3" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio8" type="radio" name="rbf3" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio9" type="radio" name="rbf3" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Por fallas Eléctricas, cortocircuitos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist4" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio10" type="radio" name="rbf4" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio11" type="radio" name="rbf4" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio12" type="radio" name="rbf4" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Generados por metales alcalinos o por polvos metálicos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist5" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio13" type="radio" name="rbf5" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio14" type="radio" name="rbf5" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio15" type="radio" name="rbf5" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Incendios forestales en zonas exteriores al Galpón, oficina o Edificio
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist6" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio16" type="radio" name="rbf6" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio17" type="radio" name="rbf6" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio18" type="radio" name="rbf6" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Incendios en las zonas aledañas 
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist7" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio19" type="radio" name="rbf7" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio20" type="radio" name="rbf7" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio21" type="radio" name="rbf7" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel EXPLOSIONES -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">EXPLOSIONES</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila  -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">EXPLOSIONES</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Explosión por polvos orgánicos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist8" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio22" type="radio" name="rbf8" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio23" type="radio" name="rbf8" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio24" type="radio" name="rbf8" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Amenaza de Bomba
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist9" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio25" type="radio" name="rbf9" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio26" type="radio" name="rbf9" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio27" type="radio" name="rbf9" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Explosión por fugas gases y vapores inflamables
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist10" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio28" type="radio" name="rbf10" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio29" type="radio" name="rbf10" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio30" type="radio" name="rbf10" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Explosión por Derrames
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist11" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio31" type="radio" name="rbf11" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio32" type="radio" name="rbf11" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio33" type="radio" name="rbf11" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Explosión por recipientes sometidos a presión.
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist12" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio34" type="radio" name="rbf12" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio35" type="radio" name="rbf12" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio36" type="radio" name="rbf12" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Substancias detonantes 
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist13" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio37" type="radio" name="rbf13" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio38" type="radio" name="rbf13" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio39" type="radio" name="rbf13" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel DERRAMES -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">DERRAMES</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila 1 -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">DERRAMES</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Desechos tóxicos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist14" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio40" type="radio" name="rbf14" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio41" type="radio" name="rbf14" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio42" type="radio" name="rbf14" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Productos Químicos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist15" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio43" type="radio" name="rbf15" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio44" type="radio" name="rbf15" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio45" type="radio" name="rbf15" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Hidrocarburos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist16" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio46" type="radio" name="rbf16" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio47" type="radio" name="rbf16" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio48" type="radio" name="rbf16" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Materiales espontáneamente combustibles
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist17" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio49" type="radio" name="rbf17" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio50" type="radio" name="rbf17" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio51" type="radio" name="rbf17" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Materiales Tóxicos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist18" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio52" type="radio" name="rbf18" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio53" type="radio" name="rbf18" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio54" type="radio" name="rbf18" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Sustancias oxidantes
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist19" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio55" type="radio" name="rbf19" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio56" type="radio" name="rbf19" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio57" type="radio" name="rbf19" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Sustancias Corrosivas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist20" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio58" type="radio" name="rbf20" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio59" type="radio" name="rbf20" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio60" type="radio" name="rbf20" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel FUGAS -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">FUGAS</a>
					</h4>
				</div>
				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila  -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">FUGAS</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Líquidos Inflamables
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist21" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio61" type="radio" name="rbf21" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio62" type="radio" name="rbf21" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio63" type="radio" name="rbf21" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Gases Inflamables
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist22" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio64" type="radio" name="rbf22" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio65" type="radio" name="rbf22" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio66" type="radio" name="rbf22" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Gases Licuados
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist23" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio67" type="radio" name="rbf23" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio68" type="radio" name="rbf23" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio69" type="radio" name="rbf23" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Gases tóxicos por inhalación
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist24" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio70" type="radio" name="rbf24" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio71" type="radio" name="rbf24" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio72" type="radio" name="rbf24" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Gases corrosivos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist25" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio73" type="radio" name="rbf25" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio74" type="radio" name="rbf25" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio75" type="radio" name="rbf25" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Sólidos que emiten gases inflamables al contacto con el agua
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist26" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio76" type="radio" name="rbf26" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio77" type="radio" name="rbf26" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio78" type="radio" name="rbf26" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel EXPOSICIONES -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse5">EXPOSICIONES</a>
					</h4>
				</div>
				<div id="collapse5" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila 1 -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">EXPOSICIONES</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Contacto con Materiales Peligrosos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist27" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio79" type="radio" name="rbf27" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio80" type="radio" name="rbf27" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio81" type="radio" name="rbf27" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Sustancias Infecciosas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist28" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio82" type="radio" name="rbf28" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio83" type="radio" name="rbf28" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio84" type="radio" name="rbf28" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Sustancias Corrosivas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist29" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio85" type="radio" name="rbf29" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio86" type="radio" name="rbf29" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio87" type="radio" name="rbf29" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Bacterias
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist30" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio88" type="radio" name="rbf30" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio89" type="radio" name="rbf30" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio90" type="radio" name="rbf30" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Virus
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist31" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio91" type="radio" name="rbf31" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio92" type="radio" name="rbf31" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio93" type="radio" name="rbf31" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Insectos y otros agentes biológicos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist32" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio94" type="radio" name="rbf32" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio95" type="radio" name="rbf32" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio96" type="radio" name="rbf32" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Materiales Radioactivos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist33" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio97" type="radio" name="rbf33" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio98" type="radio" name="rbf33" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio99" type="radio" name="rbf33" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel FALLAS GEOLÓGICAS -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse6">FALLAS GEOLÓGICAS</a>
					</h4>
				</div>
				<div id="collapse6" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila  -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">FALLAS GEOLÓGICAS</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Terremotos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist34" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio100" type="radio" name="rbf34" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio101" type="radio" name="rbf34" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio102" type="radio" name="rbf34" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Maremotos
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist35" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio103" type="radio" name="rbf35" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio104" type="radio" name="rbf35" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio105" type="radio" name="rbf35" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Erupciones volcánicas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist36" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio106" type="radio" name="rbf36" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio107" type="radio" name="rbf36" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio108" type="radio" name="rbf36" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Deslizamientos de Tierra
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist37" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio109" type="radio" name="rbf37" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio110" type="radio" name="rbf37" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio111" type="radio" name="rbf37" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Deslizamientos de lodo
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist38" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio112" type="radio" name="rbf38" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio113" type="radio" name="rbf38" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio114" type="radio" name="rbf38" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Derrumbes o Desplome de Estructuras
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist39" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio115" type="radio" name="rbf39" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio116" type="radio" name="rbf39" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio117" type="radio" name="rbf39" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel FALLAS METEOROLÓGICAS O CLIMÁTICAS -->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse7">FALLAS METEOROLÓGICAS O CLIMÁTICAS</a>
					</h4>
				</div>
				<div id="collapse7" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila  -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">FALLAS METEOROLÓGICAS O CLIMÁTICAS</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Huracanes
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist40" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio118" type="radio" name="rbf40" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio119" type="radio" name="rbf40" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio120" type="radio" name="rbf40" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Tormentas 
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist41" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio121" type="radio" name="rbf41" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio122" type="radio" name="rbf41" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio123" type="radio" name="rbf41" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Granizadas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist42" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio124" type="radio" name="rbf42" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio125" type="radio" name="rbf42" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio126" type="radio" name="rbf42" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Ciclones
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist43" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio127" type="radio" name="rbf43" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio128" type="radio" name="rbf43" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio129" type="radio" name="rbf43" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Inundaciones
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist44" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio130" type="radio" name="rbf44" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio131" type="radio" name="rbf44" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio132" type="radio" name="rbf44" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Sequías
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist45" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio133" type="radio" name="rbf45" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio134" type="radio" name="rbf45" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio135" type="radio" name="rbf45" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Olas de calor
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist46" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio136" type="radio" name="rbf46" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio137" type="radio" name="rbf46" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio138" type="radio" name="rbf46" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Olas de frío
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist47" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio139" type="radio" name="rbf47" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio140" type="radio" name="rbf47" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio141" type="radio" name="rbf47" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel  SOCIALES-->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse8">SOCIALES</a>
					</h4>
				</div>
				<div id="collapse8" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila  -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">SOCIALES</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Conflictos sociales
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist48" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio142" type="radio" name="rbf48" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio143" type="radio" name="rbf48" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio144" type="radio" name="rbf48" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Acciones vandálicas 
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist49" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio145" type="radio" name="rbf49" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio146" type="radio" name="rbf49" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio147" type="radio" name="rbf49" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Desastres civiles
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist50" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio148" type="radio" name="rbf50" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio149" type="radio" name="rbf50" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio150" type="radio" name="rbf50" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Protesta urbana
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist51" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio151" type="radio" name="rbf51" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio152" type="radio" name="rbf51" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio153" type="radio" name="rbf51" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Accidentes en transporte
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist52" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio154" type="radio" name="rbf52" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio155" type="radio" name="rbf52" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio156" type="radio" name="rbf52" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Atentados terroristas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist53" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio157" type="radio" name="rbf53" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio158" type="radio" name="rbf53" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio159" type="radio" name="rbf53" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

				<!-- Panel  OTROS RIESGOS PROPIOS DE LA ACTIVIDAD ECONÓMICA DE LA EMPRESA-->
				<div class="panel-heading bg-aqua color-palette">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse9">OTROS RIESGOS PROPIOS DE LA ACTIVIDAD ECONÓMICA DE LA EMPRESA</a>
					</h4>
				</div>
				<div id="collapse9" class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>

								<!-- fila  -->
								<tr class="bg-aqua color-palette">
									<th class="col-md-5 text-center">OTROS RIESGOS PROPIOS DE LA ACTIVIDAD ECONÓMICA DE LA EMPRESA</th>
									<th class="col-md-4 text-center">FACTOR DE IMPACTO</th>
									<th class="col-md-3 text-center">SENSIBILIDAD<br />
										<div class="col-md-4  bg-red color-palette">ALTA</div>
										<div class="col-md-4  bg-yellow color-palette">MEDIA</div>
										<div class="col-md-4  bg-green color-palette">BAJA</div>
									</th>
								</tr>

								<tr>
									<td class="text-left">Caída de Objetos apilados o almacenados
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist54" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio160" type="radio" name="rbf54" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio161" type="radio" name="rbf54" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio162" type="radio" name="rbf54" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Obstrucción de las vías de Escape
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist55" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio163" type="radio" name="rbf55" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio164" type="radio" name="rbf55" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio165" type="radio" name="rbf55" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Atrapamiento de Personas
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist56" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio166" type="radio" name="rbf56" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio167" type="radio" name="rbf56" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio168" type="radio" name="rbf56" value="3" runat="server">
										</div>
									</td>

								</tr>
								<tr>
									<td class="text-left">Rotura de instalaciones
									</td>

									<td>
										<asp:DropDownList ID="Dropdownlist57" runat="server" class="form-control">
											<asp:ListItem Text="Factores Humanos" Value="Factores Humanos"></asp:ListItem>
											<asp:ListItem Text="Factores Ambientales" Value="Factores Ambientales"></asp:ListItem>
											<asp:ListItem Text="Factores Operacionales" Value="Factores Operacionales"></asp:ListItem>
											<asp:ListItem Text="Factores Económicos" Value="Factores Económicos"></asp:ListItem>
										</asp:DropDownList>
									</td>

									<td class="text-center">
										<div class="col-md-4">
											<input id="radio169" type="radio" name="rbf57" value="1" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio170" type="radio" name="rbf57" value="2" runat="server">
										</div>
										<div class="col-md-4">
											<input id="radio171" type="radio" name="rbf57" value="3" runat="server">
										</div>
									</td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

			</div>


			<div class="box-body no-padding">
				<table class="table table-condensed">
					<tbody>
						<!-- fila 18 -->
						<tr class="bg-aqua color-palette">
							<th class="col-md-6 text-center">TOTAL DE CONDICIONES</th>
							<th class="col-md-2 text-center">ALTA</th>
							<th class="col-md-2 text-center">MEDIA</th>
							<th class="col-md-2 text-center">BAJA</th>
						</tr>

						<tr class="text-center">
							<td class="text-left">Sumatoria del total de respuestas
							</td>

							<td>
								<asp:Label ID="lbTotalAlta" runat="server" Text="---"></asp:Label>
							</td>

							<td>
								<asp:Label ID="lbTotalMedia" runat="server" Text="---"></asp:Label>
							</td>

							<td>
								<asp:Label ID="lbTotalBaja" runat="server" Text="---"></asp:Label>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<hr />
			<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
			<script type="text/javascript" src="//www.google.com/jsapi"></script>

			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<asp:Literal ID="ltReporte" runat="server"></asp:Literal>
					<div id="piechart"></div>
				</div>

				<asp:PlaceHolder runat="server" Visible="false">
					<asp:Image AlternateText="-" ID="ImgChart" runat="server" />
				</asp:PlaceHolder>

				<asp:HiddenField ID="rutaImg" runat="server"></asp:HiddenField>
			</div>

			<div class="row text-center">
				<div class="col-md-4 col-md-offset-2">
					<asp:ImageButton alt="-" ID="btnCalculate" runat="server" ImageUrl="~\ico\calculator.png"
						OnClick="btnCalculate_Onclick" />
					<h4>Calcular Resultados</h4>
				</div>

				<asp:PlaceHolder ID="phBtnPrint" runat="server" Visible="false">
					<div class="col-md-4">
						<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento"
							ValidationGroup="ValidationAdd" />
						<h4>Generar Documento</h4>
					</div>
				</asp:PlaceHolder>

			</div>
	</asp:Panel>

</asp:Content>
